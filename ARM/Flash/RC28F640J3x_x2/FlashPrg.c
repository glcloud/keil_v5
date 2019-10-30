/***********************************************************************/
/*  This file is part of the ARM Toolchain package                     */
/*  Copyright KEIL ELEKTRONIK GmbH 2003 - 2007                         */
/***********************************************************************/
/*                                                                     */
/*  FlashDev.C:  Flash Programming Functions adapted for Dual          */
/*               Intel TE/JS/PC/RC28F640J3A and TE/JS/PC/RC28F640J3D   */
/*               (32-bit Bus)                                          */
/*                                                                     */
/***********************************************************************/

#include "..\FlashOS.H"         // FlashOS Structures

#define M8(adr)  (*((volatile unsigned char  *) (adr)))
#define M16(adr) (*((volatile unsigned short *) (adr)))
#define M32(adr) (*((volatile unsigned long  *) (adr)))

#define STACK_SIZE   64         // Stack Size


/*
 *  Initialize Flash Programming Functions
 *    Parameter:      adr:  Device Base Address
 *                    clk:  Clock Frequency (Hz)
 *                    fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int Init (unsigned long adr, unsigned long clk, unsigned long fnc) {
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
 *  Erase Sector in Flash Memory
 *    Parameter:      adr:  Sector Address
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseSector (unsigned long adr) {
  unsigned long sr;

  M32(adr) = 0x00500050;                        // Clear Status Register
  M32(adr) = 0x00600060;                        // Start Unlock Block Command
  M32(adr) = 0x00D000D0;                        // Confirm Command
  do {
    M32(adr) = 0x00700070;                      // Read Flashes Status Command
    sr = M32(adr);                              // Read Status Register
  } while ((sr & 0x00800080) != 0x00800080);    // until Flashes are Ready
  M32(adr) = 0x00FF00FF;                        // Revert to Read Mode

  M32(adr) = 0x00200020;                        // Start Erase Block Command
  M32(adr) = 0x00D000D0;                        // Confirm Command
  do {
    M32(adr) = 0x00700070;                      // Read Flashes Status Command
    sr = M32(adr);                              // Read Status Register
  } while ((sr & 0x00800080) != 0x00800080);    // until Flashes are Ready
  M32(adr) = 0x00500050;                        // Clear Status Register
  M32(adr) = 0x00FF00FF;                        // Revert to Read Mode
  if (sr & 0x003A003A) {                        // Check for Errors
    return (1);                                 // Failed
  } else {
    return (0);                                 // OK
  }
}


/*
 *  Program Page in Flash Memory
 *    Parameter:      adr:  Page Start Address
 *                    sz:   Page Size
 *                    buf:  Page Data
 *    Return Value:   0 - OK,  1 - Failed
 */

int ProgramPage (unsigned long adr, unsigned long sz, unsigned char *buf) {
  unsigned long ba=0;
  unsigned long sr=0;
           int  i, j, n;

  n = (sz + 63) / 64;                           // Number of 2*32-byte Buffers
  for (i = 0; i < n; i++)  {
    ba = adr;                                   // Block Address
    do {
      M32(adr) = 0x00E800E8;                    // Start Write to Buffer Command
      M32(adr) = 0x00700070;                    // Read Flashes Status Command
      sr = M32(adr);                            // Read Status Register
    } while ((sr & 0x00800080) != 0x00800080);  // until Buffers available
    M32(adr) = 0x000F000F;                      // Word Count - 1
    for (j = 0; j < 16; j++) {
      M32(adr) = *((unsigned long *) buf);      // Write Data to Buffers
      adr += 4;                                 // Next Address
      buf += 4;                                 // Next Data
    }
    M32(ba) = 0x00D000D0;                       // Confirm Command
    do {
      M32(ba) = 0x00700070;                     // Read Flashes Status Command
      sr = M32(ba);                             // Read Status Register
    } while ((sr & 0x00800080) != 0x00800080);  // until Flashes are Ready
    if (sr & 0x001A001A) break;                 // Check for Errors
  }
  M32(ba) = 0x00500050;                         // Clear Status Register
  M32(ba) = 0x00FF00FF;                         // Revert to Read Mode
  if (sr & 0x001A001A) {                        // Check for Errors
    return (1);                                 // Failed
  } else {
    return (0);                                 // OK
  }
}
