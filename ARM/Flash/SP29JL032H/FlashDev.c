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
 *   
 *
 * $Date:        15. April 2014
 * $Revision:    V1.00
 *  
 * Project:      Flash Device Description for AM29x128 (16-bit Bus)
 * --------------------------------------------------------------------------- */

/* History:
 *  Version 1.00
 *    Initial release
 */ 

#include "..\FlashOS.H"        // FlashOS Structures

#ifdef S29JL032H_TOP	 // S29JL032H Top Boot Device      Model x1(01/21/31/41)
struct FlashDevice const FlashDevice  =  {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
   "S29JL032H_TOP Flash",      // Device Name 
   EXT16BIT,                   // Device Type
   0x0000000,                  // Device Start Address
   0x400000,                  // Device Size in Bytes (4MB)
   1024,                       // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   100,                        // Program Page Timeout 100 mSec
   900,                        // Erase Sector Timeout 900 mSec
// Specify Size and Address of Sectors
   0x10000,     0x00000,       // Sector Size 64kB (63 Sectors)
   0x02000,     0x3F0000,      // Sector Size  8kB (8 Sectors)
   SECTOR_END
};
#endif

#ifdef S29JL032H_BOTTOM	 // S29JL032H Bottom Boot Device		Model x2(02/22/32/42)
struct FlashDevice const FlashDevice  =  {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
   "S29JL032H_BOT Flash",       // Device Name 
   EXT16BIT,                   // Device Type
   0x0000000,                  // Device Start Address
   0x400000,                  // Device Size in Bytes (4MB)
   1024,                       // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   100,                        // Program Page Timeout 100 mSec
   900,                        // Erase Sector Timeout 900 mSec
// Specify Size and Address of Sectors
   0x02000,     0x00000,       // Sector Size  8kB (8 Sectors)
   0x10000,     0x10000,       // Sector Size 64kB (63 Sectors)
   SECTOR_END
};
#endif

