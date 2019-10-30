/* -----------------------------------------------------------------------------
 * Copyright (c) 2014 ARM Ltd.
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

/* -----------------------------------------------------------------------------
 * This source file has been modified by Adesto Technologies for supporting
 * the EcoXiP flash algorithm.
 * --------------------------------------------------------------------------- */


#include "..\FlashOS.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "EcoXiPdefs.h"

/*
 * Check if Program/Erase completed using the toggle bit
 *    Parameter:      adr:  Block Start Address
 *    Return Value:   0 - OK,  1 - Failed


int Polling (unsigned long adr) {
	return 0;
}
 */ 

/*
 *  Initialize Flash Programming Functions
 *    Parameter:      adr:  Device Base Address
 *                    clk:  Clock Frequency (Hz)
 *                    fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int Init (unsigned long adr, unsigned long clk, unsigned long fnc) {
	// Initialize pins
	BOARD_InitPins();
	// Initialize clock
	BOARD_BootClockRUN();
	// Initialize FlexSPI controller for EcoXiP
	EcoXiP_init();
	//Unprotect all sectors in anticipation of erase/program operations
	EcoXiP_unprotect_all();
	//Switch to Octal-DDR mode
	EcoXiP_enter_octal_mode(true);
	return 0;
}


/*
 *  De-Initialize Flash Programming Functions
 *    Parameter:      fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int UnInit (unsigned long fnc) {
	return 0;
}


/*
 *  Erase complete Flash Memory
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseChip (void) {
	int stat;

	stat = EcoXiP_erase_chip();
	return stat;
}


/*
 *  Erase Sector in Flash Memory
 *    Parameter:      adr:  Sector Address
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseSector (unsigned long adr) {
	int stat;

	stat = EcoXiP_block_erase_4K(adr - FLASH_BASE_ADDR);
	return stat;   
}


/*
 *  Program Page in Flash Memory
 *    Parameter:      adr:  Page Start Address
 *                    sz:   Page Size
 *                    buf:  Page Data
 *    Return Value:   0 - OK,  1 - Failed
 */

int ProgramPage (unsigned long adr, unsigned long sz, unsigned char *buf) {
	int stat;

	stat = EcoXiP_page_program(adr - FLASH_BASE_ADDR, sz, buf);
	return stat;;
}
