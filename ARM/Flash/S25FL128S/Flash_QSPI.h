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
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#ifndef MBED_FLASH_QSPI_H
#define MBED_FLASH_QSPI_H

// CFI Flash command codes

#define RBPR         0xE2        /* Read Block-Protection Register opcode */
#define WBPR         0xE3        /* Write Block-Protection Register opcde */
#define ULBPR        0xE4        /* Unlock Block Protection opcode */
#define SE           0x20        /* Sector Erase (4K) opcode */
#define BE           0xD8        /* Block Erase (8K, 32K, 64K) opcode */
#define CE           0xC7        /* Chip Erase opcode */
#define QUAD_OP      0x38        /* Enable 4-4-4 operation opcode */
#define RSTQIO       0xFF        /* Reset 4-4-4 operation opcode */
#define WREN         0x06        /* Write Enable opcode */
#define WRSR         0x01        /* Write Status register opcode */
#define PP           0x02        /* Program page opcode */
#define RD           0x03        /* Read data opcode */
#define WRCR         0x81        /* Write Volatile Configuration Register opcode */
#define WRNVCR       0xB1        /* Write Non Volatile Configuration Register opcode */
#define RDSR         0x05        /* Read Status Register opcode */
#define RDCR         0x85        /* Read Volatile Configuration Register opcode */
#define RDNVCR       0xB5        /* Read Non Volatile Configuration Register opcode */
#define RDID         0x9F        /* Read ID register */


// QSPI Controller defines
#ifdef V2C_DAPLink
#define QSPI_BASE     0x40020000                                        // QSPI controller mode
#define QSPI_DATA     0x00000000                                        // QSPI XIP data
#else
#define QSPI_BASE     0x40601000                                        // QSPI controller mode
#define QSPI_DATA     0x28000000                                        // QSPI XIP data
#endif

// XILINX QSPI controller registers
#define QSPI_DGIER    ((volatile unsigned int *)(QSPI_BASE + 0x1C))     // Global interrupt enable
#define QSPI_IPISR    ((volatile unsigned int *)(QSPI_BASE + 0x20))     // Interrupt status
#define QSPI_IPIER    ((volatile unsigned int *)(QSPI_BASE + 0x28))     // Interrupt enable
#define QSPI_SRR      ((volatile unsigned int *)(QSPI_BASE + 0x40))     // Software reset register
#define QSPI_SPICR    ((volatile unsigned int *)(QSPI_BASE + 0x60))     // SPI control
#define QSPI_SPISR    ((volatile unsigned int *)(QSPI_BASE + 0x64))     // SPI status
#define QSPI_SPIDTR   ((volatile unsigned int *)(QSPI_BASE + 0x68))     // SPI TX FIFO data
#define QSPI_SPIDRR   ((volatile unsigned int *)(QSPI_BASE + 0x6C))     // SPI RX FIFO data
#define QSPI_SPISSR   ((volatile unsigned int *)(QSPI_BASE + 0x70))     // SPI slave select
#define QSPI_SPITXF   ((volatile unsigned int *)(QSPI_BASE + 0x74))     // SPI TX FIFO occupancy
#define QSPI_SPIRXF   ((volatile unsigned int *)(QSPI_BASE + 0x78))     // SPI RX FIFO occupancy

// GPIO register control
#define QSPI_XIPMODE  0x00                                              // XIP controller mode
#define QSPI_QSPIMODE 0x01                                              // QSPI controller mode

// Types
#undef FALSE
#undef TRUE
#define FALSE   0
#define TRUE    1

unsigned int apQSPI_INIT(void);
void apQSPI_UNINIT(void);

void erase_chip(void);
void erase_page(unsigned int address);

unsigned int apQSPI_WRITEB(unsigned int addr, unsigned int bytes, unsigned char *datab);
unsigned int apQSPI_READ(unsigned int addr, unsigned int *data);

#endif /* FLASH_QSPI_H */
