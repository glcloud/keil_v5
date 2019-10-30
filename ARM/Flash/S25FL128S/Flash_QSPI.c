/* mbed Microcontroller Library
 * Copyright (c) 2018 ARM Limited
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
  
#include "Flash_QSPI.h"

unsigned char buffo[300];
unsigned char buffi[300];

// QSPI data read/write (FIFO is 256 data bytes)
int apQSPI_RDWR(unsigned int bytes)
{
    unsigned int loop, timeout;
    
    timeout = 10000;
    
    // Max 256 bytes
    if ((bytes == 0) || (bytes > 256))
        return TRUE;
    
    // Reset FIFOs set to master
    *QSPI_SPICR = 0x000001E6;
    *QSPI_SPICR = 0x00000186;

    // Reset and enable INTs
    *QSPI_IPISR = 0x00000004;
    *QSPI_DGIER = 0x80000000;
    *QSPI_IPIER = 0x00000004;

    // Write the bytes to the FIFO
    for (loop = 0; loop < bytes; loop++)
        *QSPI_SPIDTR = buffo[loop];
    
    // Slave selected
    *QSPI_SPISSR = 0x00000000;
    
    // Enable master transaction
    *QSPI_SPICR = 0x00000086;

    // Wait until for DTR empty
    while (!(*QSPI_IPISR & 0x0004) && timeout)
       timeout--;
   
    // Slave de-select
    *QSPI_SPISSR = 0xFFFFFFFF;
    
    if (timeout)
        return FALSE;
    else
        return TRUE;
}

// QSPI read word (4 bytes)
unsigned int apQSPI_READ(unsigned int addr, unsigned int *data)
{
    unsigned int din, qspierr;
    
    // Read memory
    buffo[0] = 0x06;
    apQSPI_RDWR(1);
    buffo[0] = 0x03;
    buffo[1] = ((addr >> 16) & 0xFF);
    buffo[2] = ((addr >>  8) & 0xFF);
    buffo[3] = ((addr >>  0) & 0xFF);
    buffo[4] = 0xFF;
    buffo[5] = 0xFF;
    buffo[6] = 0xFF;
    buffo[7] = 0xFF;

    qspierr = apQSPI_RDWR(8);

    // Read FIFO control
    din  = *QSPI_SPIDRR;
    din  = *QSPI_SPIDRR;
    din  = *QSPI_SPIDRR;
    din  = *QSPI_SPIDRR;
    // Read FIFO data
    din  = (*QSPI_SPIDRR & 0xFF) << 0;
    din |= (*QSPI_SPIDRR & 0xFF) << 8;
    din |= (*QSPI_SPIDRR & 0xFF) << 16;
    din |= (*QSPI_SPIDRR & 0xFF) << 24;

    // Return data
    *data = din;
    
    return qspierr;
}

// QSPI write word (4 bytes) in SPI mode
int apQSPI_WRITEW(unsigned int addr, unsigned int data)
{
    unsigned int din, qspierr, timeout;
    
    timeout = 10000;

    // Page program
    buffo[0] = 0x06;
    apQSPI_RDWR(1);
    buffo[0] = 0x02;
    buffo[1] = ((addr >> 16) & 0xFF);
    buffo[2] = ((addr >>  8) & 0xFF);
    buffo[3] = ((addr >>  0) & 0xFF);
    buffo[4] = ((data >>  0) & 0xFF);
    buffo[5] = ((data >>  8) & 0xFF);
    buffo[6] = ((data >> 16) & 0xFF);
    buffo[7] = ((data >> 24) & 0xFF);
    qspierr = apQSPI_RDWR(8);

    // Check busy
    do
    {
        // Read status
        buffo[0] = 0x05;
        buffo[1] = 0xFF;
        apQSPI_RDWR(2);
        // Read FIFO
        din = *QSPI_SPIDRR;
        din = *QSPI_SPIDRR;
        timeout--;
    } while ((din & 0x01) && timeout);

    if (timeout)
         qspierr = FALSE;
    
    return qspierr;
}

// QSPI write block (upto 128 bytes) in SPI mode
// FIFO is 256 bytes but this includes the three address bytes
// buff fill=150uS,  FIFO fill=150uS, SPI write=100uS, Page program=600uS
unsigned int apQSPI_WRITEB(unsigned int addr, unsigned int bytes, unsigned char *datab)
{
    unsigned int din, loop, qspierr, timeout;

    timeout = 10000;

    // Max 128 bytes
    if ((bytes == 0) || (bytes > 128))
        return TRUE;
    
    // Page program
    buffo[0] = 0x06;
    apQSPI_RDWR(1);
    buffo[0] = 0x02;
    buffo[1] = ((addr >> 16) & 0xFF);
    buffo[2] = ((addr >>  8) & 0xFF);
    buffo[3] = ((addr >>  0) & 0xFF);
    for (loop = 0; loop < bytes; loop++)
        buffo[4 + loop] = datab[loop];
    qspierr = apQSPI_RDWR(4 + bytes);

    // Check busy
    do
    {
        // Read status
        buffo[0] = 0x05;
        buffo[1] = 0xFF;
        apQSPI_RDWR(2);
        // Read FIFO
        din = *QSPI_SPIDRR;
        din = *QSPI_SPIDRR;
        timeout--;
    } while ((din & 0x01) && timeout);

    if (timeout)
         qspierr = FALSE;
    
    return qspierr;
}

// QSPI erase 64KB
void erase_page(unsigned int addr)
{
    unsigned int din, timeout;
    
    timeout = 10000;

    // Erase block
    buffo[0] = 0x06;
    apQSPI_RDWR(1);
    buffo[0] = 0xD8;
    buffo[1] = ((addr >> 16) & 0xFF);
    buffo[2] = ((addr >>  8) & 0xFF);
    buffo[3] = ((addr >>  0) & 0xFF);
    apQSPI_RDWR(4);

    // Check busy
    do
    {
        // Read status
        buffo[0] = 0x05;
        buffo[1] = 0xFF;
        apQSPI_RDWR(2);
        // Read FIFO
        din = *QSPI_SPIDRR;
        din = *QSPI_SPIDRR;
    } while ((din & 0x01) && timeout);
}

void erase_chip(void)
{
    unsigned int din, timeout;
    
    timeout = 10000;

    // Erase block
    buffo[0] = 0x06;
    apQSPI_RDWR(1);
    buffo[0] = 0xC7;
    apQSPI_RDWR(1);

    // Check busy
    do
    {
        // Read status
        buffo[0] = 0x05;
        buffo[1] = 0xFF;
        apQSPI_RDWR(2);
        // Read FIFO
        din = *QSPI_SPIDRR;
        din = *QSPI_SPIDRR;
    } while ((din & 0x01) && timeout);
}

// QSPI set to XIP mode
void apQSPI_XIP(void)
{
    unsigned int data;

    // Switch to XIP controller (SCC reg 0x08)
    *((volatile unsigned int *)(0x40010000 + 0x00)) = QSPI_XIPMODE;
//    Sleepms(1);

    // Dummy read to clear controller
    data = *((volatile unsigned int *)(QSPI_DATA));
    data++;
}    

/*----------------------------------------------------------------------------
  QSPI controller init
 *----------------------------------------------------------------------------*/
unsigned int apQSPI_INIT(void)
{
    unsigned int loop, din, qspierr;

    qspierr = FALSE;

    // Switch to QSPI controller
    *((volatile unsigned int *)(0x40010000 + 0x00)) = QSPI_QSPIMODE;      // TO DO!
    for (loop = 0; loop < 1000; loop++)
    {}

    // Reset controller
    *QSPI_SRR = 0x0000000A;
    for (loop = 0; loop < 1000; loop++)
    {}          //    Sleepms(1);

    // Dummy write enable
    buffo[0] = 0x06;
    apQSPI_RDWR(1);

    // Write Config register - Enable Quad mode
    buffo[0] = 0x06;
    apQSPI_RDWR(1);
    buffo[0] = 0x01;
    buffo[1] = 0x00;
    buffo[2] = 0x42;
    apQSPI_RDWR(3);

    // Delay
    for (loop = 0; loop < 1000; loop++)
    {}
        
    // Set WREN in the status register
    buffo[0] = 0x06;
    apQSPI_RDWR(1);
    
    // Check the status register
    buffo[0] = 0x05;
    buffo[1] = 0xFF;
    apQSPI_RDWR(2);
    din = *QSPI_SPIDRR & 0xFF;
    din = *QSPI_SPIDRR & 0xFF;
    if (din != 0x02)
    {
        qspierr = TRUE;
    }

    // Check the config register
    buffo[0] = 0x35;
    buffo[1] = 0xFF;
    apQSPI_RDWR(2);
    din = *QSPI_SPIDRR & 0xFF;
    din = *QSPI_SPIDRR & 0xFF;
    if (din != 0x42)
    {
        qspierr = TRUE;
    }

    return qspierr;
}

/*----------------------------------------------------------------------------
  QSPI controller init
 *----------------------------------------------------------------------------*/
void apQSPI_UNINIT(void)
{
    apQSPI_XIP();
}

#if 0
/*----------------------------------------------------------------------------
  QSPI controller test
 *----------------------------------------------------------------------------*/
void apQSPI_TEST()
{
    unsigned int  data, loop, buflp, error;
    unsigned char datab[256];

    // Setup SPI interface
    error = apQSPI_INIT();
    
    if(error)
        print("Init error\r\n");

    // Program the memory using SPI controller
    for (loop = 0; loop < 0x40000; loop += 256)
    {
        // Erase 64KB blocks
        if((loop & 0xFFFF) == 0)
        {
            //printf("Addr: 0x%08X\n", loop);
            erase_page(loop);
        }
        
        // Fill buff
        for (buflp = 0; buflp < 256; buflp += 4)
        {
            datab[buflp + 0] = buflp;
            datab[buflp + 1] = (loop >>  8) & 0xFF;
            datab[buflp + 2] = (loop >> 16) & 0xFF;
            datab[buflp + 3] = 0xAA;
        }

        // Write 128 bytes
        apQSPI_WRITEB(loop      , 128, datab);
        apQSPI_WRITEB(loop + 128, 128, datab + 128);
    }

    // Set to XIP mode
    apQSPI_XIP();
    
    // Verify the memory using XIP controller
    for (loop = 0; loop < 0x40000; loop += 4)
    {
        // Read word
        data = *((volatile unsigned int *)(0x00000000 + loop));
        
        // Verify
        if (data != (0xAA000000 | loop))
        {
            break;
        }
    }
}
#endif
