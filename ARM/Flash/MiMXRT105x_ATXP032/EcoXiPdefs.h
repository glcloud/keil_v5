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

// Includes
#include "fsl_flexspi.h"
#include "FlashParams.h"

// xSPI modes
#define SPI_MODE 1
#define QPI_MODE 2
#define OPI_MODE 3
#define QPI_DDR_MODE 4
#define OPI_DDR_MODE 5

// Number of dummy cycles for non-SPI modes
#define NON_SPI_DUMMY_CYCLES 18

// Status Register busy bit
#define BUSY_BIT 0x1

// LUT defs
#define LUT_SIZE 64

// EcoXiP commands

#define	EXIP_CMD_WRITE_STATUS_REG_BYTE1	0x01	// Write Status Register Byte 1 	
#define	EXIP_CMD_PAGE_PROG				0x02	// Byte/Page Program (1 - 256 Bytes) 	
#define	EXIP_CMD_READARRAY_SPI			0x03	// Read Array (1-1-1) 	
#define	EXIP_CMD_WRITE_DISABLE			0x04	// Write Disable 	
#define	EXIP_CMD_READ_STATUS_REG_BYTE1	0x05	// Read Status Register Byte 1 	
#define	EXIP_CMD_WRITE_ENABLE			0x06	// Write Enable 	
#define	EXIP_CMD_READARRAY				0x0B	// Read Array 	
#define	EXIP_CMD_BURST_READ_WRAP		0x0C	// Burst Read with Wrap 	
#define	EXIP_CMD_BLOCK_ERASE_4K			0x20	// Block Erase (4 Kbytes) 	
#define	EXIP_CMD_ACTVE_STATUS_INT		0x25	// Active Status Interrupt 	
#define	EXIP_CMD_WRITE_STATUS_REG_BYTE2	0x31	// Write Status Register Byte 2 	
#define	EXIP_CMD_PROTECT_SECTOR			0x36	// Protect Sector 	
#define	EXIP_CMD_ENTER_QPI				0x38	// Enter QPI Mode (1-1-1 to 4-4-4) (1) 	
#define	EXIP_CMD_UNPROTECT_SECTOR		0x39	// Unprotect Sector 	
#define	EXIP_CMD_READ_SECT_PROT_REG		0x3C	// Read Sector Protection Registers 	
#define	EXIP_CMD_BLOCK_ERASE_32K		0x52	// Block Erase (32 Kbytes) 	
#define	EXIP_CMD_READ_SFDP				0x5A	// Read SFDP 	
#define	EXIP_CMD_CHIP_ERASE				0x60	// Chip Erase	
#define	EXIP_CMD_READ_STAT_CTRL_REGS	0x65	// Read Status/Control Registers 	
#define	EXIP_CMD_WRITE_STAT_CTRL_REGS	0x71	// Write Status/Control Registers 	
#define	EXIP_CMD_READ_OTP				0x77	// Read OTP Security Register 	
#define	EXIP_CMD_ULTRA_DEEP_POWERDOWN	0x79	// Ultra-Deep Power-Down 	
#define	EXIP_CMD_BUFFER_WRITE			0x84	// Buffer Write 	
#define	EXIP_CMD_BUFFER_MM_PROGRAM		0x88	// Buffer to Main Memory Page Program without Built-In Erase 	
#define	EXIP_CMD_PROGRAM_OTP			0x9B	// Program OTP Security Register 	
#define	EXIP_CMD_READ_MANUF_DEV_ID		0x9F	// Read Manufacturer and Device ID 	
#define	EXIP_CMD_ECHO_INVERSION			0xA5	// Echo with inversion 	
#define	EXIP_CMD_ECHO					0xAA	// Echo 	
#define	EXIP_CMD_RESUME_DEEP_POWERDOWN	0xAB	// Resume from Deep Power-Down 	
#define	EXIP_CMD_PROG_ERASE_SUSPEND		0xB0	// Program/Erase Suspend 	
#define	EXIP_CMD_DEEP_POWERDOWN			0xB9	// Deep Power-Down 	
#define	EXIP_CMD_CHIP_ERASE_ALT_OPCODE	0xC7	// Chip Erase 	
#define	EXIP_CMD_PROG_ERASE_RESUME		0xD0	// Program/Erase Resume 	
#define	EXIP_CMD_BUFFER_READ			0xD4	// Buffer Read 	
#define	EXIP_CMD_BLOCK_ERASE_64K		0xD8	// Block Erase (64 Kbytes) 	
#define	EXIP_CMD_ENTER_OPI				0xE8	// Enter Octal Mode (1-1-1 to 8-8-8) (2) 	
#define	EXIP_CMD_RESET					0xF0	// Reset (Terminate Operation)	
#define	EXIP_CMD_RETURN_SPI				0xFF	// Return to Standard SPI Mode


extern uint32_t spi_lut[], qpi_lut[], opi_lut[], qpi_ddr_lut[], opi_ddr_lut[];

extern uint8_t op_mode;
extern flexspi_config_t flexspi_config;
extern flexspi_device_config_t deviceconfig;
extern 	FLEXSPI_Type *exip_flexspi; //Pointer to the base of the FlexSPI in use for EcoXiP

extern void FLEXSPI_UpdateLUT_Adesto(FLEXSPI_Type *base, uint32_t index, const uint32_t *cmd, uint32_t count);
extern void FLEXSPI_SetFlashConfig_Adesto(FLEXSPI_Type *base, flexspi_device_config_t *config, flexspi_port_t port);
extern void EcoXiP_init(void);
extern int32_t EcoXiP_write_enable(void);
extern uint32_t EcoXiP_read_busy_status(uint8_t *busy_status);
extern int32_t EcoXiP_write_status_control_register(uint8_t reg_addr, uint8_t val);
extern int32_t EcoXiP_enter_quad_mode(bool ddr);
extern int32_t EcoXiP_enter_octal_mode(bool ddr);
extern int32_t EcoXiP_set_dummy_cycles(uint32_t cycles);
extern int32_t EcoXiP_set_drive_strength(uint32_t impedance);
extern int32_t EcoXiP_read_array(uint32_t addr, uint32_t nbytes, uint32_t * read_buf);
extern int32_t EcoXiP_erase_chip(void);
extern int32_t EcoXiP_block_erase_4K(uint32_t address);
extern int32_t EcoXiP_page_program(uint32_t address, uint32_t size, uint8_t * data);
extern int32_t EcoXiP_unprotect_all(void);

