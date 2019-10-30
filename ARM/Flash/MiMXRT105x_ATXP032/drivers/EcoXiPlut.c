/* -----------------------------------------------------------------------------
 * Copyright (c) 2018 Adesto Technologies
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
 * --------------------------------------------------------------------------- */

#include "EcoXiPdefs.h"

//FlexSPI Programmable Sequence Engine instruction set

#define QINST_STOP				0x00
#define QINST_CMD				0x01
#define QINST_ADDR				0x02
#define QINST_CADDR				0x03
#define QINST_MODE1				0x04
#define QINST_MODE2				0x05
#define QINST_MODE4				0x06
#define QINST_MODE8				0x07
#define QINST_WRITE				0x08
#define QINST_READ				0x09
#define QINST_LEARN				0x0a
#define QINST_DATASZ			0x0b
#define QINST_DUMMY				0x0c
#define QINST_DUMMY_RWDS		0x0d
#define QINST_JMP_ON_CS			0x1f
#define QINST_CMD_DDR			0x21
#define QINST_ADDR_DDR			0x22
#define QINST_CADDR_DDR			0x23
#define QINST_MODE1_DDR			0x24
#define QINST_MODE2_DDR			0x25
#define QINST_MODE4_DDR			0x26
#define QINST_MODE8_DDR			0x27
#define QINST_WRITE_DDR			0x28
#define QINST_READ_DDR			0x29
#define QINST_LEARN_DDR			0x2a
#define QINST_DATASZ_DDR		0x2b
#define QINST_DUMMY_DDR			0x2c
#define QINST_DUMMY_RWDS_DDR	0x2d


//FlexSPI Programmable Sequence Engine PAD field values

#define PAD_1 0
#define PAD_2 1
#define PAD_4 2
#define PAD_8 3


///////////////////////////////////////////////////////////////////////////////
// Lookup tables
///////////////////////////////////////////////////////////////////////////////

//SPI mode LUT
uint32_t spi_lut[LUT_SIZE] = 
{
         //Read Array
         [0] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_READARRAY) |
			   (QINST_ADDR << 26) | (PAD_1 << 24) | (32 << 16),
         [1] = (QINST_DUMMY << 10) | (PAD_1 << 8) | (8) |
			   (QINST_READ << 26) | (PAD_1 << 24) | (128 << 16),
         //[2] = (QINST_JMP_ON_CS << 10) | (PAD_1 << 8) | 0,

	     // Read Status (byte 1)
		 [4] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_READ_STATUS_REG_BYTE1) |
				(QINST_READ << 26) | (PAD_1 << 24) | (1 << 16),

         // Read Status/Control Registers
		 [8] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_READ_STAT_CTRL_REGS) |
		        (QINST_ADDR << 26) | (PAD_1 << 24) | (8 << 16),
         [9] = (QINST_DUMMY << 10) | (PAD_1 << 8) | (8) |
			    (QINST_READ << 26) | (PAD_1 << 24) | (1 << 16),


		// Write Status Register Byte 1
         [12] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE1) |
                (QINST_WRITE << 26) | (PAD_1 << 24) | (1 << 16),

         // Write Status Register Byte 2
         [16] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE2) |
                (QINST_WRITE << 26) | (PAD_1 << 24) | (1 << 16),

         // Write Status/Control Registers
         [20] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_WRITE_STAT_CTRL_REGS) |
				(QINST_ADDR << 26) | (PAD_1 << 24) | (8 << 16),
		 [21] = (QINST_WRITE << 10) | (PAD_1 << 8) | (1),

         //Read Array (SPI only)
         [24] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_READARRAY_SPI) |
			    (QINST_ADDR << 26) | (PAD_1 << 24) | (32 << 16),
         [25] = (QINST_READ << 10) | (PAD_1 << 8) | (128) /* |
                (QINST_JMP_ON_CS << 26) | (PAD_1 << 24) | 0 << 16 */,

         // Write Enable     
         [28] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_WRITE_ENABLE),


         // Unprotect Sector
         [32] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_UNPROTECT_SECTOR) |
                (QINST_ADDR << 26) | (PAD_1 << 24) | (32 << 16),

         // Enter QPI mode
         [36] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_ENTER_QPI),
	 
         // Read Sector Protection Registers
		 [40] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_READ_SECT_PROT_REG) |
				(QINST_ADDR << 26) | (PAD_1 << 24) | (32 << 16),
		 [41] = (QINST_READ << 10) | (PAD_1 << 8) | (1),

         // Block Erase 4K
		 [44] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_BLOCK_ERASE_4K) |
				(QINST_ADDR << 26) | (PAD_1 << 24) | (32 << 16),

         // Page Program
         [48] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_PAGE_PROG) |
				(QINST_ADDR << 26) | (PAD_1 << 24) | (32 << 16),
         [49] = (QINST_WRITE << 10) | (PAD_1 << 8) | (128), 

         // Chip Erase 
		 [52] = (QINST_CMD << 10) | (PAD_1 << 8) | (EXIP_CMD_CHIP_ERASE),

		 // Extend the array to a 4 double-word boundary (important!!!)
		 [55] = 0,
};

//QPI mode LUT
uint32_t qpi_lut[LUT_SIZE] =
{
         //Read Array
         [0] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READARRAY) |
			   (QINST_ADDR << 26) | (PAD_4 << 24) | (32 << 16),
         [1] = (QINST_DUMMY << 10) | (PAD_4 << 8) | (NON_SPI_DUMMY_CYCLES) |
			   (QINST_READ << 26) | (PAD_4 << 24) | (128 << 16),
         //[2] = (QINST_JMP_ON_CS << 10) | (PAD_4 << 8) | 0,

	     // Read Status (byte 1)
		 [4] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READ_STATUS_REG_BYTE1) |
			 (QINST_DUMMY << 26) | (PAD_4 << 24) | (4 << 16),
		 [5] = (QINST_READ << 10) | (PAD_4 << 8) | (1),

         // Read Status/Control Registers
		 [8] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READ_STAT_CTRL_REGS) |
		        (QINST_ADDR << 26) | (PAD_4 << 24) | (8 << 16),
         [9] = (QINST_DUMMY << 10) | (PAD_4 << 8) | (4) |
			    (QINST_READ << 26) | (PAD_4 << 24) | (1 << 16),

		// Write Status Register Byte 1
         [12] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE1) |
                (QINST_WRITE << 26) | (PAD_4 << 24) | (1 << 16),

         // Write Status Register Byte 2
         [16] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE2) |
                (QINST_WRITE << 26) | (PAD_4 << 24) | (1 << 16),

         // Write Status/Control Registers
         [20] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_STAT_CTRL_REGS) |
				(QINST_ADDR << 26) | (PAD_4 << 24) | (8 << 16),
		 [21] = (QINST_WRITE << 10) | (PAD_4 << 8) | (1),

         // Burst Read with Wrap
         [24] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_BURST_READ_WRAP) |
			   (QINST_ADDR << 26) | (PAD_4 << 24) | (32 << 16),
         [25] = (QINST_DUMMY << 10) | (PAD_4 << 8) | (22) |
			   (QINST_READ << 26) | (PAD_4 << 24) | (128 << 16),
         //[26] = (QINST_JMP_ON_CS << 10) | (PAD_4 << 8) | 0,

         // Write Enable     
         [28] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_ENABLE),

         // Unprotect Sector
         [32] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_UNPROTECT_SECTOR) |
                (QINST_ADDR << 26) | (PAD_4 << 24) | (32 << 16),

         // Protect Sector
         [36] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_PROTECT_SECTOR) |
                (QINST_ADDR << 26) | (PAD_4 << 24) | (32 << 16),

	 
         // Read Sector Protection Registers
		 [40] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READ_SECT_PROT_REG) |
				(QINST_ADDR << 26) | (PAD_4 << 24) | (32 << 16),
		 [41] = (QINST_DUMMY << 10) | (PAD_4 << 8) | (4) |
				(QINST_READ << 26) | (PAD_4 << 24) | (1 << 16),

         // Block Erase 4K
		 [44] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_BLOCK_ERASE_4K) |
				(QINST_ADDR << 26) | (PAD_4 << 24) | (32 << 16),

         // Page Program
         [48] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_PAGE_PROG) |
				(QINST_ADDR << 26) | (PAD_4 << 24) | (32 << 16),
         [49] = (QINST_WRITE << 10) | (PAD_4 << 8) | (128), 

         // Chip Erase 
		 [52] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_CHIP_ERASE),

         // Return to Standard SPI Mode
         [56] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_RETURN_SPI),

		 // Extend the array to a 4 double-word boundary (important!!!)
		 [59] = 0,
};

//OPI mode LUT
uint32_t opi_lut[LUT_SIZE] =
{
         //Read Array
         [0] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READARRAY) |
			   (QINST_ADDR << 26) | (PAD_8 << 24) | (32 << 16),
         [1] = (QINST_DUMMY << 10) | (PAD_8 << 8) | (NON_SPI_DUMMY_CYCLES) |
			   (QINST_READ << 26) | (PAD_8 << 24) | (128 << 16),
         //[2] = (QINST_JMP_ON_CS << 10) | (PAD_8 << 8) | 0,

	     // Read Status (byte 1)
		 [4] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READ_STATUS_REG_BYTE1) |
			 (QINST_DUMMY << 26) | (PAD_8 << 24) | (4 << 16),
		 [5] = (QINST_READ << 10) | (PAD_8 << 8) | (1),

         // Read Status/Control Registers
		 [8] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READ_STAT_CTRL_REGS) |
		        (QINST_ADDR << 26) | (PAD_8 << 24) | (8 << 16),
         [9] = (QINST_DUMMY << 10) | (PAD_8 << 8) | (4) |
			    (QINST_READ << 26) | (PAD_8 << 24) | (1 << 16),


		// Write Status Register Byte 1
         [12] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE1) |
                (QINST_WRITE << 26) | (PAD_8 << 24) | (1 << 16),

         // Write Status Register Byte 2
         [16] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE2) |
                (QINST_WRITE << 26) | (PAD_8 << 24) | (1 << 16),

         // Write Status/Control Registers
         [20] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_STAT_CTRL_REGS) |
				(QINST_ADDR << 26) | (PAD_8 << 24) | (8 << 16),
		 [21] = (QINST_WRITE << 10) | (PAD_8 << 8) | (1),

         // Burst Read with Wrap
         [24] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_BURST_READ_WRAP) |
			   (QINST_ADDR << 26) | (PAD_8 << 24) | (32 << 16),
         [25] = (QINST_DUMMY << 10) | (PAD_8 << 8) | (22) |
			   (QINST_READ << 26) | (PAD_8 << 24) | (128 << 16),
         //[26] = (QINST_JMP_ON_CS << 10) | (PAD_8 << 8) | 0,

         // Write Enable     
         [28] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_ENABLE),


         // Unprotect Sector
         [32] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_UNPROTECT_SECTOR) |
                (QINST_ADDR << 26) | (PAD_8 << 24) | (32 << 16),


         // Protect Sector
         [36] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_PROTECT_SECTOR) |
                (QINST_ADDR << 26) | (PAD_8 << 24) | (32 << 16),

	 
         // Read Sector Protection Registers
		 [40] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READ_SECT_PROT_REG) |
				(QINST_ADDR << 26) | (PAD_8 << 24) | (32 << 16),
		 [41] = (QINST_DUMMY << 10) | (PAD_8 << 8) | (4) |
				(QINST_READ << 26) | (PAD_8 << 24) | (1 << 16),

         // Block Erase 4K
		 [44] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_BLOCK_ERASE_4K) |
				(QINST_ADDR << 26) | (PAD_8 << 24) | (32 << 16),

         // Page Program
         [48] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_PAGE_PROG) |
				(QINST_ADDR << 26) | (PAD_8 << 24) | (32 << 16),
         [49] = (QINST_WRITE << 10) | (PAD_8 << 8) | (128), 

         // Chip Erase 
		 [52] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_CHIP_ERASE),

         // Return to Standard SPI Mode
         [56] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_RETURN_SPI),

		 // Extend the array to a 4 double-word boundary (important!!!)
		 [59] = 0,
};

// QPI DDR mode LUT
uint32_t qpi_ddr_lut[LUT_SIZE] =
{
         //Read Array
         [0] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READARRAY) |
			   (QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (32 << 16),
         [1] = (QINST_DUMMY_DDR << 10) | (PAD_4 << 8) | (NON_SPI_DUMMY_CYCLES*2+1) |
			   (QINST_READ_DDR << 26) | (PAD_4 << 24) | (128 << 16),
         //[2] = (QINST_JMP_ON_CS << 10) | (PAD_4 << 8) | 0,

	     // Read Status (byte 1)
		 [4] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READ_STATUS_REG_BYTE1) |
			 (QINST_DUMMY_DDR << 26) | (PAD_4 << 24) | (9 << 16),
		 [5] = (QINST_READ_DDR << 10) | (PAD_4 << 8) | (1),

         // Read Status/Control Registers
		 [8] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READ_STAT_CTRL_REGS) |
		        (QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (8 << 16),
         [9] = (QINST_DUMMY_DDR << 10) | (PAD_4 << 8) | (9) |
			    (QINST_READ_DDR << 26) | (PAD_4 << 24) | (1 << 16),

		// Write Status Register Byte 1
         [12] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE1) |
                (QINST_WRITE_DDR << 26) | (PAD_4 << 24) | (1 << 16),

         // Write Status Register Byte 2
         [16] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE2) |
                (QINST_WRITE_DDR << 26) | (PAD_4 << 24) | (1 << 16),

         // Write Status/Control Registers
         [20] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_STAT_CTRL_REGS) |
				(QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (8 << 16),
		 [21] = (QINST_WRITE_DDR << 10) | (PAD_4 << 8) | (1),

         // Burst Read with Wrap
         [24] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_BURST_READ_WRAP) |
			   (QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (32 << 16),
         [25] = (QINST_DUMMY_DDR << 10) | (PAD_4 << 8) | (45) |
			   (QINST_READ_DDR << 26) | (PAD_4 << 24) | (128 << 16),
         //[26] = (QINST_JMP_ON_CS << 10) | (PAD_4 << 8) | 0,

         // Write Enable     
         [28] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_WRITE_ENABLE),


         // Unprotect Sector
         [32] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_UNPROTECT_SECTOR) |
                (QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (32 << 16),


         // Protect Sector
         [36] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_PROTECT_SECTOR) |
                (QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (32 << 16),

	 
         // Read Sector Protection Registers
		 [40] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_READ_SECT_PROT_REG) |
				(QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (32 << 16),
		 [41] = (QINST_DUMMY_DDR << 10) | (PAD_4 << 8) | (9) |
				(QINST_READ_DDR << 26) | (PAD_4 << 24) | (1 << 16),

         // Block Erase 4K
		 [44] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_BLOCK_ERASE_4K) |
				(QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (32 << 16),

         // Page Program
         [48] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_PAGE_PROG) |
				(QINST_ADDR_DDR << 26) | (PAD_4 << 24) | (32 << 16),
         [49] = (QINST_WRITE_DDR << 10) | (PAD_4 << 8) | (128), 

         // Chip Erase 
		 [52] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_CHIP_ERASE),

         // Return to Standard SPI Mode
         [56] = (QINST_CMD << 10) | (PAD_4 << 8) | (EXIP_CMD_RETURN_SPI),

		 // Extend the array to a 4 double-word boundary (important!!!)
		 [59] = 0,
};

// OPI DDR mode LUT
uint32_t opi_ddr_lut[LUT_SIZE] =
{
         //Read Array
         [0] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READARRAY) |
			   (QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (32 << 16),
         [1] = (QINST_DUMMY_DDR << 10) | (PAD_8 << 8) | (NON_SPI_DUMMY_CYCLES*2+1) |
			   (QINST_READ_DDR << 26) | (PAD_8 << 24) | (128 << 16),
         //[2] = (QINST_JMP_ON_CS << 10) | (PAD_8 << 8) | 0,

	     // Read Status (byte 1)
		 [4] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READ_STATUS_REG_BYTE1) |
			 (QINST_DUMMY_DDR << 26) | (PAD_8 << 24) | (8 << 16),
		 [5] = (QINST_READ_DDR << 10) | (PAD_8 << 8) | (1),

         // Read Status/Control Registers
		 [8] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READ_STAT_CTRL_REGS) |
		        (QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (8 << 16),
         [9] = (QINST_DUMMY_DDR << 10) | (PAD_8 << 8) | (9) |
			    (QINST_READ_DDR << 26) | (PAD_8 << 24) | (2 << 16), // 2 bytes in QPI-DDR to round up to a full clock cycle

		// Write Status Register Byte 1
         [12] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE1) |
                (QINST_WRITE_DDR << 26) | (PAD_8 << 24) | (1 << 16),

         // Write Status Register Byte 2
         [16] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_STATUS_REG_BYTE2) |
                (QINST_WRITE_DDR << 26) | (PAD_8 << 24) | (1 << 16),

         // Write Status/Control Registers
         //[20] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_STAT_CTRL_REGS) |
		//		(QINST_WRITE_DDR << 26) | (PAD_8 << 24) | (4 << 16),

         // Write Status/Control Registers
         [20] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_STAT_CTRL_REGS) |
				(QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (8 << 16),
		 [21] = (QINST_WRITE_DDR << 10) | (PAD_8 << 8) | (1),

         // Burst Read with Wrap
         [24] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_BURST_READ_WRAP) |
			   (QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (32 << 16),
         [25] = (QINST_DUMMY_DDR << 10) | (PAD_8 << 8) | (45) |
			   (QINST_READ_DDR << 26) | (PAD_8 << 24) | (128 << 16),
         //[26] = (QINST_JMP_ON_CS << 10) | (PAD_8 << 8) | 0,

         // Write Enable     
         [28] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_WRITE_ENABLE),


         // Unprotect Sector
         [32] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_UNPROTECT_SECTOR) |
                (QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (32 << 16),


         // Protect Sector
         [36] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_PROTECT_SECTOR) |
                (QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (32 << 16),
	 
         // Read Sector Protection Registers
		 [40] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_READ_SECT_PROT_REG) |
				(QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (32 << 16),
		 [41] = (QINST_DUMMY_DDR << 10) | (PAD_8 << 8) | (9) |
				(QINST_READ_DDR << 26) | (PAD_8 << 24) | (1 << 16),

         // Block Erase 4K
		 [44] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_BLOCK_ERASE_4K) |
				(QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (32 << 16),

         // Page Program
         [48] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_PAGE_PROG) |
				(QINST_ADDR_DDR << 26) | (PAD_8 << 24) | (32 << 16),
         [49] = (QINST_WRITE_DDR << 10) | (PAD_8 << 8) | (128), 

         // Chip Erase 
		 [52] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_CHIP_ERASE),

         // Return to Standard SPI Mode
         [56] = (QINST_CMD << 10) | (PAD_8 << 8) | (EXIP_CMD_RETURN_SPI),

		 // Extend the array to a 4 double-word boundary (important!!!)
		 [59] = 0,
};
