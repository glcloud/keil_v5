/***********************************************************************/
/*  FlashPrg.c:  Flash Programming Functions adapted for SPIFI Flash   */
/*  Copyright (c) 2011 NXP Semiconductors. All rights reserved.        */
/*                                                                     */
/*                                                    modified by KEIL */
/***********************************************************************/

#include "../FlashOS.H"        // FlashOS Structures
#include "spifi_rom_api.h"


#define LPC_SC_PCONP                (*(volatile unsigned long *)0x400FC0C4)
#define LPC_SC_SPIFICLKSEL          (*(volatile unsigned long *)0x400FC1B4)

#define LPC_IOCON_P2_7              (*(volatile unsigned long *)0x4002C11C)
#define LPC_IOCON_P0_15             (*(volatile unsigned long *)0x4002C03C)
#define LPC_IOCON_P0_16             (*(volatile unsigned long *)0x4002C040)
#define LPC_IOCON_P0_17             (*(volatile unsigned long *)0x4002C044)
#define LPC_IOCON_P0_18             (*(volatile unsigned long *)0x4002C048)
#define LPC_IOCON_P0_22             (*(volatile unsigned long *)0x4002C058)


SPIFIobj   obj;
SPIFIopers opers;

unsigned long base_adr;


/*  Initialize Flash Programming Functions
 *    Parameter:      adr:  Device Base Address
 *                    clk:  Clock Frequency (Hz)
 *                    fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int Init (unsigned long adr, unsigned long clk, unsigned long fnc) {

#ifdef USE_SPIFI_LIB
  /* Use spifi function names directly */
#else
  SPIFI_RTNS * pSpifi;
  pSpifi = (SPIFI_RTNS *)(SPIFI_ROM_PTR);
  /* Call functions via spifi rom table */
  #define spifi_init pSpifi->spifi_init
#endif

  opers.dest    = NULL;
  opers.length  = 0;
  opers.scratch = NULL;
  opers.protect = -1;                     // save and restore protection
  opers.options = S_CALLER_ERASE;         // Keil code handles erasing

  base_adr = adr;

  /* init SPIFI clock and pins */
  LPC_SC_PCONP      |=  (1UL << 16);        /* enable SPIFI power/clock   */
  LPC_SC_SPIFICLKSEL =  (1UL <<  0);        /* SPIFI clk = Sysclk / 1     */

  LPC_IOCON_P2_7    &= ~(7UL <<  0);
  LPC_IOCON_P2_7    |=  (5UL <<  0);        /* SPIFI_CSN = P2.7  (FUNC 5) */
  LPC_IOCON_P0_22   &= ~(7UL <<  0);
  LPC_IOCON_P0_22   |=  (5UL <<  0);        /* SPIFI_CLK = P0.22 (FUNC 5) */
  LPC_IOCON_P0_15   &= ~(7UL <<  0);
  LPC_IOCON_P0_15   |=  (5UL <<  0);        /* SPIFI_IO2 = P0.15 (FUNC 5) */
  LPC_IOCON_P0_16   &= ~(7UL <<  0);
  LPC_IOCON_P0_16   |=  (5UL <<  0);        /* SPIFI_IO3 = P0.16 (FUNC 5) */
  LPC_IOCON_P0_17   &= ~(7UL <<  0);
  LPC_IOCON_P0_17   |=  (5UL <<  0);        /* SPIFI_IO1 = P0.17 (FUNC 5) */
  LPC_IOCON_P0_18   &= ~(7UL <<  0);
  LPC_IOCON_P0_18   |=  (5UL <<  0);        /* SPIFI_IO0 = P0.18 (FUNC 5) */

  if (spifi_init(&obj, 3, S_RCVCLK | S_FULLCLK, 12)) {
    return 1;
  }

  return 0;                                 /* Finished without Errors    */
}


/*  De-Initialize Flash Programming Functions
 *    Parameter:      fnc:  Function Code (1 - Erase, 2 - Program, 3 - Verify)
 *    Return Value:   0 - OK,  1 - Failed
 */

int UnInit (unsigned long fnc) {

  return 0;                                 /* Finished without Errors    */
}


/*  Erase complete Flash Memory
 *    Return Value:   0 - OK,  1 - Failed */

int EraseChip (void) {
  int32_t rc;

#ifdef USE_SPIFI_LIB
  /* Use spifi function names directly */
#else
  SPIFI_RTNS * pSpifi;
  pSpifi = (SPIFI_RTNS *)(SPIFI_ROM_PTR);
  /* Call functions via spifi rom table */
  #define spifi_erase pSpifi->spifi_erase
#endif

  opers.dest    = 0;
  opers.length  = obj.devSize;
  opers.scratch = NULL;
  opers.options = S_VERIFY_ERASE;

  rc = spifi_erase(&obj, &opers);
  if (rc != 0)
    return (1);

  return (0);
}


/*  Erase Sector in Flash Memory
 *    Parameter:      adr:  Sector Address
 *    Return Value:   0 - OK,  1 - Failed
 */

int EraseSector (unsigned long adr) {
  int32_t rc;
#ifdef USE_SPIFI_LIB
  /* Use spifi function names directly */
#else
  SPIFI_RTNS * pSpifi;
  pSpifi = (SPIFI_RTNS *)(SPIFI_ROM_PTR);
  /* Call functions via spifi rom table */
  #define spifi_erase pSpifi->spifi_erase
#endif

  opers.dest    = (char *)(adr - base_adr);
  opers.length  = 0x010000UL;
  opers.scratch = NULL;
  opers.options = S_VERIFY_ERASE;

  rc = spifi_erase(&obj, &opers);
  if (rc != 0)
    return (1);

  return (0);
}


/*  Program Page in Flash Memory
 *    Parameter:      adr:  Page Start Address
 *                    sz:   Page Size
 *                    buf:  Page Data
 *    Return Value:   0 - OK,  1 - Failed
 */

int ProgramPage (unsigned long adr, unsigned long sz, unsigned char *buf) {
  int32_t rc;
#ifdef USE_SPIFI_LIB
  /* Use spifi function names directly */
#else
  SPIFI_RTNS * pSpifi;
  pSpifi = (SPIFI_RTNS *)(SPIFI_ROM_PTR);
  /* Call functions via spifi rom table */
   #define spifi_program pSpifi->spifi_program
#endif

  opers.dest    = (char *)(adr - base_adr);
  opers.length  = sz;
  opers.scratch = NULL;
  opers.protect = 0;
  opers.options = S_CALLER_ERASE;

  rc = spifi_program(&obj, (char *)buf, &opers);
  if (rc != 0)
    return (1);

  return (0);
}
