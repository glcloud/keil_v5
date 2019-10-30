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


#include "..\FlashOS.h"        // FlashOS Structures
#include "FlashParams.h"    // General flash parameters

struct FlashDevice const FlashDevice  =  {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
   "MIMXRT105x EcoXiP Flash",  // Device Name 
   EXTSPI,		               // Device Type
   FLASH_BASE_ADDR,            // Device Start Address
   FLASH_SIZE,                 // Device Size in Bytes
   FLASH_PAGE_SIZE,            // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   100,                        // Program Page Timeout 100 mSec
   3000,                       // Erase Sector Timeout 3000 mSec

// Specify Size and Address of Sectors
   FLASH_SECTORE_SIZE, 0x00000000, // Sector size and start offset of this sector group
   SECTOR_END
};

