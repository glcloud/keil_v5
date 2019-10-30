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

 // This file is a FlexSPI driver extension which in fact overrides some of
 // the original implementations of the NXP SDK FlexSPI driver.

#include "EcoXiPdefs.h"

#define FLEXSPI_LUT_KEY_VAL (0x5AF05AF0ul)

// Overriding the original function from KSDK FlexSPI driver since it doesn't work
// for a partial update of the LUT starting from any index.
void FLEXSPI_UpdateLUT_Adesto(FLEXSPI_Type *base, uint32_t index, const uint32_t *cmd, uint32_t count)
{
    uint8_t i = 0;
    volatile uint32_t *lutBase;

    /* Unlock LUT for update. */
    base->LUTKEY = FLEXSPI_LUT_KEY_VAL;
    base->LUTCR = 0x02;

    lutBase = &base->LUT[4 * index];
    for (i = 0; i < count; i++)
    {
        *lutBase++ = *cmd++;
    }

    /* Lock LUT. */
    base->LUTKEY = FLEXSPI_LUT_KEY_VAL;
    base->LUTCR = 0x01;
}


// Overriding the original function from KSDK FlexSPI driver due to the way it sets
// the DLL control register which doesn't work for us.
void FLEXSPI_SetFlashConfig_Adesto(FLEXSPI_Type *base, flexspi_device_config_t *config, flexspi_port_t port)
{
    uint32_t configValue = 0;
    uint8_t index = port >> 1; /* PortA with index 0, PortB with index 1. */

    /* Wait for bus idle before change flash configuration. */
    while (!FLEXSPI_GetBusIdleStatus(base))
    {
    }

    /* Configure flash size. */
    base->FLSHCR0[index] = 0;
    base->FLSHCR0[port] = config->flashSize;

    /* Configure flash parameters. */
    base->FLSHCR1[port] = FLEXSPI_FLSHCR1_CSINTERVAL(config->CSInterval) |
                          FLEXSPI_FLSHCR1_CSINTERVALUNIT(config->CSIntervalUnit) |
                          FLEXSPI_FLSHCR1_TCSH(config->CSHoldTime) | FLEXSPI_FLSHCR1_TCSS(config->CSSetupTime) |
                          FLEXSPI_FLSHCR1_CAS(config->columnspace) | FLEXSPI_FLSHCR1_WA(config->enableWordAddress);

    /* Configure AHB operation items. */
    configValue = base->FLSHCR2[port];

    configValue &= (FLEXSPI_FLSHCR2_AWRWAITUNIT_MASK | FLEXSPI_FLSHCR2_AWRWAIT_MASK | FLEXSPI_FLSHCR2_AWRSEQNUM_MASK |
                    FLEXSPI_FLSHCR2_AWRSEQID_MASK | FLEXSPI_FLSHCR2_ARDSEQNUM_MASK | FLEXSPI_FLSHCR2_AWRSEQID_MASK);

    configValue |=
        FLEXSPI_FLSHCR2_AWRWAITUNIT(config->AHBWriteWaitUnit) | FLEXSPI_FLSHCR2_AWRWAIT(config->AHBWriteWaitInterval);

    if (config->AWRSeqNumber > 0U)
    {
        configValue |=
            FLEXSPI_FLSHCR2_AWRSEQID(config->AWRSeqIndex) | FLEXSPI_FLSHCR2_AWRSEQNUM(config->AWRSeqNumber - 1U);
    }

    if (config->ARDSeqNumber > 0U)
    {
        configValue |=
            FLEXSPI_FLSHCR2_AWRSEQID(config->ARDSeqIndex) | FLEXSPI_FLSHCR2_ARDSEQNUM(config->ARDSeqNumber - 1U);
    }

    base->FLSHCR2[port] = configValue;

    /* Configure DLL. */
	// Override the original settings of the KSDK (based on some calculations which 
	// do not work for us. For now we go with a sweet spot setting for the DQS delay
	// which is 6/32 of a clock.
    base->DLLCR[index] = FLEXSPI_DLLCR_DLLEN(1) | FLEXSPI_DLLCR_SLVDLYTARGET(0x8);

    /* Configure write mask. */
    if (index == 0) /*PortA*/
    {
        base->FLSHCR4 &= ~FLEXSPI_FLSHCR4_WMENA_MASK;
        base->FLSHCR4 |= FLEXSPI_FLSHCR4_WMENA(config->enableWriteMask);
    }
    else
    {
        base->FLSHCR4 &= ~FLEXSPI_FLSHCR4_WMENB_MASK;
        base->FLSHCR4 |= FLEXSPI_FLSHCR4_WMENB(config->enableWriteMask);
    }

    /* Exit stop mode. */
    base->MCR0 &= ~FLEXSPI_MCR0_MDIS_MASK;
}
