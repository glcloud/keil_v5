/***********************************************************************/
/*  This file is part of the ARM Toolchain package                     */
/*  Copyright (c) 2012 Keil - An ARM Company. All rights reserved.     */
/***********************************************************************/
/*                                                                     */
/*  FlashDev.C:  Device Description for                                */
/*               S25FL032P0XMFI010 populated on LPC4088-32 Dev. Kit    */
/*                                                                     */
/***********************************************************************/

#include "../FlashOS.H"        // FlashOS Structures

struct FlashDevice const FlashDevice = {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
   "LPC407x/8x S25FL032 SPIFI", // Device Name
   EXTSPI,                     // Device Type
   0x28000000,                 // Device Start Address
   0x00400000,                 // Device Size is 4MB
   256,                        // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   500,                        // Program Page Timeout 100 mSec
   5000,                       // Erase Sector Timeout 3000 mSec

// Specify Size and Address of Sectors
   0x010000, 0,                // sectors are 64 KB
   SECTOR_END
};
