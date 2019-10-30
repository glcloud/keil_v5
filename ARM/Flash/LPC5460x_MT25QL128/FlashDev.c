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
 * Project:      Flash Device Description for
 *               NXP LPC5460x MT25QL128 SPIFI Flash
 * --------------------------------------------------------------------------- */

#include "..\FlashOS.H"        // FlashOS Structures


#ifdef MT25QL128
struct FlashDevice const FlashDevice  =  {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
   "LPC5460x MT25QL128 SPIFI", // Device Name
   EXTSPI,                     // Device Type
   0x10000000,                 // Device Start Address
   0x01000000,                 // Device Size (16MB)
   4096,                       // Programming Page Size (16 pages a 256)
//   256,                        // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   300,                        // Program Page Timeout 300 mSec
   3000,                       // Erase Sector Timeout 3000 mSec

// Specify Size and Address of Sectors
   0x001000, 0x000000,         // Sector Size 4kB (4096 Sectors)
   SECTOR_END
};
#endif
