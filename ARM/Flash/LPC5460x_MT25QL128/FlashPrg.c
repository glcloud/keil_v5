/* -----------------------------------------------------------------------------
 * Copyright (c) 2016 ARM Ltd.
 *
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from
 * the use of this software. Permission is granted to anyone to use this
 * software for any purpose, including commercial applications, and to alter
 * it and redistribute it freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software in
 *    a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 *
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 *
 * 3. This notice may not be removed or altered from any source distribution.
 *
 *
 * $Date:        08. August 2017
 * $Revision:    V1.1.0
 *
 * Project:      Flash Device Algorithm for
 *               NXP LPC5460x MT25QL128 SPIFI Flash
 * --------------------------------------------------------------------------- */

#include "..\FlashOS.H"        // FlashOS Structures
#include "fsl_iocon.h"
#include "fsl_spifi.h"


#define PAGE_SIZE            (256)

#define READ                 (0)
#define WRITE_ENABLE         (1)
#define WRITE_REGISTER       (2)
#define GET_STATUS           (3)
#define PROGRAM_PAGE         (4)
#define ERASE_SECTOR         (5)
#define BULK_ERASE           (6)
#define COMMAND_NUM          (7)


spifi_command_t command[COMMAND_NUM];
spifi_config_t  config;

uint32_t base_adr;        // Base Address


void SPIFI_CheckIfFinished() {
  uint32_t val = 0;

  /* Check WIP bit */
  do
  {
    SPIFI_SetCommand(SPIFI0, &command[GET_STATUS]);
    while ((SPIFI0->STAT & SPIFI_STAT_INTRQ_MASK) == 0U)
    {
    }
    val = SPIFI_ReadData(SPIFI0);
  } while (val & 0x1);
}


void SPIFI_EnableQuadMode() {

  SPIFI_SetCommand(SPIFI0, &command[WRITE_ENABLE]);       /* Write enable */
  SPIFI_SetCommand(SPIFI0, &command[WRITE_REGISTER]);     /* Set write register command */
  SPIFI_WriteData(SPIFI0, 0x40);

  SPIFI_CheckIfFinished();
}


void SPIFI_InitPins(void) {

  CLOCK_EnableClock(kCLOCK_Iocon);   /* enable clock for IOCON */
  
  /* SPIFI pins */
  IOCON_PinMuxSet(IOCON, 0, 23, (IOCON_FUNC6 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN));  /* SPIFI_CSN */
  IOCON_PinMuxSet(IOCON, 0, 24, (IOCON_FUNC6 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN));  /* SPIFI_IO0 */
  IOCON_PinMuxSet(IOCON, 0, 25, (IOCON_FUNC6 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN));  /* SPIFI_IO1 */
  IOCON_PinMuxSet(IOCON, 0, 26, (IOCON_FUNC6 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN));  /* SPIFI_CLK */
  IOCON_PinMuxSet(IOCON, 0, 27, (IOCON_FUNC6 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN));  /* SPIFI_IO3 */
  IOCON_PinMuxSet(IOCON, 0, 28, (IOCON_FUNC6 | IOCON_MODE_PULLUP | IOCON_DIGITAL_EN));  /* SPIFI_IO2 */
}


void SPIFI_InitCommands(void) {

  /* READ */
  command[READ          ].dataLen           = PAGE_SIZE;
  command[READ          ].isPollMode        = false;
  command[READ          ].direction         = kSPIFI_DataInput;
  command[READ          ].intermediateBytes = 1;
  command[READ          ].format            = kSPIFI_CommandDataQuad;
  command[READ          ].type              = kSPIFI_CommandOpcodeAddrThreeBytes;
  command[READ          ].opcode            = 0x6B; 

  /* WRITE_ENABLE */
  command[WRITE_ENABLE  ].dataLen           = 0;
  command[WRITE_ENABLE  ].isPollMode        = false;
  command[WRITE_ENABLE  ].direction         = kSPIFI_DataOutput;
  command[WRITE_ENABLE  ].intermediateBytes = 0;
  command[WRITE_ENABLE  ].format            = kSPIFI_CommandAllSerial;
  command[WRITE_ENABLE  ].type              = kSPIFI_CommandOpcodeOnly;
  command[WRITE_ENABLE  ].opcode            = 0x06;

  /* WRITE_REGISTER */
  command[WRITE_REGISTER].dataLen           = 4;
  command[WRITE_REGISTER].isPollMode        = false;
  command[WRITE_REGISTER].direction         = kSPIFI_DataOutput;
  command[WRITE_REGISTER].intermediateBytes = 0;
  command[WRITE_REGISTER].format            = kSPIFI_CommandAllSerial;
  command[WRITE_REGISTER].type              = kSPIFI_CommandOpcodeOnly;
  command[WRITE_REGISTER].opcode            = 0x01;

  /* GET_STATUS */
  command[GET_STATUS    ].dataLen           = 4;
  command[GET_STATUS    ].isPollMode        = false;
  command[GET_STATUS    ].direction         = kSPIFI_DataInput;
  command[GET_STATUS    ].intermediateBytes = 0;
  command[GET_STATUS    ].format            = kSPIFI_CommandAllSerial;
  command[GET_STATUS    ].type              = kSPIFI_CommandOpcodeOnly;
  command[GET_STATUS    ].opcode            = 0x05;

  /* PROGRAM_PAGE */
  command[PROGRAM_PAGE  ].dataLen           = PAGE_SIZE;
  command[PROGRAM_PAGE  ].isPollMode        = false;
  command[PROGRAM_PAGE  ].direction         = kSPIFI_DataOutput;
  command[PROGRAM_PAGE  ].intermediateBytes = 0;
  command[PROGRAM_PAGE  ].format            = kSPIFI_CommandOpcodeSerial;
  command[PROGRAM_PAGE  ].type              = kSPIFI_CommandOpcodeAddrThreeBytes;
  command[PROGRAM_PAGE  ].opcode            = 0x38;

  /* ERASE_SECTOR */
  command[ERASE_SECTOR  ].dataLen           = 0;
  command[ERASE_SECTOR  ].isPollMode        = false;
  command[ERASE_SECTOR  ].direction         = kSPIFI_DataOutput;
  command[ERASE_SECTOR  ].intermediateBytes = 0;
  command[ERASE_SECTOR  ].format            = kSPIFI_CommandAllSerial;
  command[ERASE_SECTOR  ].type              = kSPIFI_CommandOpcodeAddrThreeBytes;
  command[ERASE_SECTOR  ].opcode            = 0x20;

  /* BULK_ERASE */
  command[BULK_ERASE    ].dataLen           = 0;
  command[BULK_ERASE    ].isPollMode        = false;
  command[BULK_ERASE    ].direction         = kSPIFI_DataOutput;
  command[BULK_ERASE    ].intermediateBytes = 0;
  command[BULK_ERASE    ].format            = kSPIFI_CommandAllSerial;
  command[BULK_ERASE    ].type              = kSPIFI_CommandOpcodeOnly;
  command[BULK_ERASE    ].opcode            = 0x60;

}



/*
 *  Initialize Flash Programming Functions
 *    Parameter:      adr:  Device Base Address
 *                    clk:  Clock Frequency (Hz)
 *                    fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int Init (unsigned long adr, unsigned long clk, unsigned long fnc) {

  base_adr = adr;

  CLOCK_EnableClock(kCLOCK_Sram1);   /* enable clock for SRAM1 */
  CLOCK_EnableClock(kCLOCK_Sram2);   /* enable clock for SRAM2 */
  CLOCK_EnableClock(kCLOCK_Sram3);   /* enable clock for SRAM3 */
  
  CLOCK_SetupFROClocking(CLK_FRO_96MHZ);             /* Set FRO hf to 96MHz */
  SYSCON->MAINCLKSELA = 3U;                          /* Set main clock to fro_hf */
  SYSCON->SPIFICLKSEL = 0U;                          /* Set SPIFI clock source to main clock */
  SYSCON->SPIFICLKDIV = 3U;                          /* Set SPIFI clock divider to 0 (main clock = 96MHz / 4) */
  
  SPIFI_InitPins();
  SPIFI_InitCommands();
  SPIFI_GetDefaultConfig(&config);                   /* set SPIFI default values */
  SPIFI_Init(SPIFI0, &config);                       /* Initialize SPIFI */
//  SPIFI_EnableQuadMode();                            /* Enable Quad mode */

  SPIFI_SetMemoryCommand(SPIFI0, &command[READ]);    /* Setup memory command */

  return (0);
}


/*
 *  De-Initialize Flash Programming Functions
 *    Parameter:      fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int UnInit (unsigned long fnc) {

  return (0);
}


/*
 *  Erase complete Flash Memory
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseChip (void) {

  SPIFI_ResetCommand(SPIFI0);                        /* Reset the SPIFI to switch to command mode */
  SPIFI_SetCommand(SPIFI0, &command[WRITE_ENABLE]);  /* Write enable */
  SPIFI_SetCommand(SPIFI0, &command[BULK_ERASE]);    /* Bulk erase */
  SPIFI_CheckIfFinished();                           /* Check if finished */

//  SPIFI_ResetCommand(SPIFI0);                        /* Reset the SPIFI to switch to command mode */
  SPIFI_SetMemoryCommand(SPIFI0, &command[READ]);    /* Switch to memory mode */

  return (0);                                        /* Finished without Errors */
}


/*
 *  Erase Sector in Flash Memory
 *    Parameter:      adr:  Sector Address
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseSector (unsigned long adr) {

  SPIFI_ResetCommand(SPIFI0);                        /* Reset the SPIFI to switch to command mode */
  SPIFI_SetCommand(SPIFI0, &command[WRITE_ENABLE]);  /* Write enable */
  SPIFI_SetCommandAddress(SPIFI0, adr);              /* Set address */
  SPIFI_SetCommand(SPIFI0, &command[ERASE_SECTOR]);  /* Erase sector */
  SPIFI_CheckIfFinished();                           /* Check if finished */

//  SPIFI_ResetCommand(SPIFI0);                        /* Reset the SPIFI to switch to command mode */
  SPIFI_SetMemoryCommand(SPIFI0, &command[READ]);    /* Switch to memory mode */

  return (0);                                        /* Finished without Errors */
}


/*
 *  Blank Check Checks if Memory is Blank
 *    Parameter:      adr:  Block Start Address
 *                    sz:   Block Size (in bytes)
 *                    pat:  Block Pattern
 *    Return Value:   0 - OK,  1 - Failed
 */

int BlankCheck (unsigned long adr, unsigned long sz, unsigned char pat) {

  return (1);                                        /* Always Force Erase */
}


/*
 *  Program Page in Flash Memory
 *    Parameter:      adr:  Page Start Address
 *                    sz:   Page Size
 *                    buf:  Page Data
 *    Return Value:   0 - OK,  1 - Failed
 */

int ProgramPage (unsigned long adr, unsigned long sz, unsigned char *buf) {
  int i,j = 0;

  SPIFI_ResetCommand(SPIFI0);                          /* Reset the SPIFI to switch to command mode */

  while (j < sz) {
    SPIFI_SetCommand(SPIFI0, &command[WRITE_ENABLE]);  /* Write enable */
    SPIFI_SetCommandAddress(SPIFI0, adr);              /* Set address */
    SPIFI_SetCommand(SPIFI0, &command[PROGRAM_PAGE]);
    for (i = 0; i < (PAGE_SIZE/4); i++) {
      SPIFI_WriteData(SPIFI0, *((unsigned long *)buf));
      buf += 4;
    }
    SPIFI_CheckIfFinished();                           /* Check if finished */

    adr += PAGE_SIZE;
    j   += PAGE_SIZE;
  }
   
  //  SPIFI_ResetCommand(SPIFI0);                        /* Reset the SPIFI to switch to command mode */
    SPIFI_SetMemoryCommand(SPIFI0, &command[READ]);    /* Switch to memory mode */
  
  return (0);                                        /* Finished without Errors */
}


/*  
 *  Verify Flash Contents
 *    Parameter:      adr:  Start Address
 *                    sz:   Size (in bytes)
 *                    buf:  Data
 *    Return Value:   (adr+sz) - OK, Failed Address
 */

/*
   Verify function is obsolete because all other function leave 
    the SPIFI in memory mode so a memory compare could be used.
 */
