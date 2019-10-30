/***********************************************************************/
/*  This file is part of the ARM Toolchain package                     */
/*  Copyright KEIL ELEKTRONIK GmbH 2003 - 2011                         */
/***********************************************************************/
/*                                                                     */
/*  FlashDev.C:  Device Description for Dual S29GL064N (32-bit Bus)    */
/*                                                                     */
/***********************************************************************/

#include "..\FlashOS.H"        // FlashOS Structures


struct FlashDevice const FlashDevice  =  {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
   "S29GL064N Dual Flash",     // Device Name
   EXT32BIT,                   // Device Type
   0x1C000000,                 // Device Start Address
   0x1000000,                  // Device Size in Bytes (16MB)
   1024,                       // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   100,                        // Program Page Timeout 100 mSec
   3000,                       // Erase Sector Timeout 3000 mSec

// Specify Size and Address of Sectors
   0x20000, 0x000000,          // Sector Size Dual 64kB (128 Sectors)
   SECTOR_END
};
