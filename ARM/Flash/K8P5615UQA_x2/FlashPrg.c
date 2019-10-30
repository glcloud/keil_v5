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
 * Project:      Flash Programming Functions for Dual Samsung K8P5615UQA
 *               NOR Flash Memory (32-bit Bus)
 * --------------------------------------------------------------------------- */

/* History:
 *  Version 1.00
 *    Initial release
 */ 

#include "..\FlashOS.H"                 /* FlashOS Structures                 */

#define M8(adr)  (*((volatile unsigned char  *) (adr)))
#define M16(adr) (*((volatile unsigned short *) (adr)))
#define M32(adr) (*((volatile unsigned long  *) (adr)))

#define STACK_SIZE   64                 /* Stack Size                         */

#define ADR_SHIFT    2                  /* Number of bit shift for address    */
#define DUAL_DQ7     (0x00800080)       /* Dual DQ7 bit mask                  */
#define DUAL_DQ6     (0x00400040)       /* Dual DQ6 bit mask                  */
#define DUAL_DQ5     (0x00200020)       /* Dual DQ5 bit mask                  */
#define DUAL_DQ3     (0x00080008)       /* Dual DQ3 bit mask                  */
#define DUAL_DQ2     (0x00040004)       /* Dual DQ2 bit mask                  */
#define DUAL_DQ1     (0x00020002)       /* Dual DQ1 bit mask                  */

unsigned long base_adr;


/*
 * Check if Program/Erase completed
 *    Parameter:      adr:  Block Start Address
 *    Return Value:   0 - OK,  1 - Failed
 */

int ToggleAlgo (unsigned long adr) {
  unsigned int status, status_ex;

  status_ex = M32(adr);
  do {
    status  = M32(adr);
    if (!((status ^ status_ex) & DUAL_DQ6)) {
      return (0);                       /* Done                               */
    }
    status_ex = status;
  } while (status ^ DUAL_DQ5);          /* Check for Timeout                  */
  status_ex = M32(adr);
  status    = M32(adr);
  if (!((status ^ status_ex) & DUAL_DQ6)) {
    return (0);                         /* Done                               */
  }
  M32(adr) = 0x00F000F0;                /* Reset Devices                      */
  return (1);                           /* Failed                             */
}


/*
 *  Initialize Flash Programming Functions
 *    Parameter:      adr:  Device Base Address
 *                    clk:  Clock Frequency (Hz)
 *                    fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int Init (unsigned long adr, unsigned long clk, unsigned long fnc) {
  base_adr = adr;
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
 *  Erase complete Flash Memory
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseChip (void) {

  /* Start Chip Erase Command */
  M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00AA00AA;
  M32(base_adr + (0x2AA << ADR_SHIFT)) = 0x00550055;
  M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00800080;
  M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00AA00AA;
  M32(base_adr + (0x2AA << ADR_SHIFT)) = 0x00550055;
  M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00100010;

  return (ToggleAlgo(base_adr));        /* Wait until Erase completed         */
}


/*
 *  Erase Sector in Flash Memory
 *    Parameter:      adr:  Sector Address
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseSector (unsigned long adr) {

  /* Start Erase Sector Command */
  M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00AA00AA;
  M32(base_adr + (0x2AA << ADR_SHIFT)) = 0x00550055;
  M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00800080;
  M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00AA00AA;
  M32(base_adr + (0x2AA << ADR_SHIFT)) = 0x00550055;
  M32(adr) = 0x00300030;

  while (M32(adr) ^ DUAL_DQ3);          /* Wait Erase time Window to expire   */

  return (ToggleAlgo(adr));             /* Wait until Erase completed         */
}


/*
 *  Program Page in Flash Memory
 *    Parameter:      adr:  Page Start Address
 *                    sz:   Page Size
 *                    buf:  Page Data
 *    Return Value:   0 - OK,  1 - Failed
 */

int ProgramPage (unsigned long adr, unsigned long sz, unsigned char *buf) {
  int  i;

  for (i = 0; i < ((sz+3)/4); i++)  {
    /* Start Program Command */
    M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00AA00AA;
    M32(base_adr + (0x2AA << ADR_SHIFT)) = 0x00550055;
    M32(base_adr + (0x555 << ADR_SHIFT)) = 0x00A000A0;
    M32(adr) = *((unsigned long *) buf);
    if (ToggleAlgo(adr)) return (1);    /* Wait until Programming completed   */
    buf += 4;
    adr += 4;
  }
  return (0);                           /* Done                               */
}
