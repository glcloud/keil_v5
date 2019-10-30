/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "fsl_common.h"
#include "fsl_iomuxc.h"
#include "pin_mux.h"

/*
 * TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
BOARD_InitPins:
- options: {callFromInitBoot: 'true', coreID: core0, enableClock: 'true'}
- pin_list:
  - {pin_num: L14, peripheral: LPUART1, signal: RX, pin_signal: GPIO_AD_B0_13, hysteresis_enable: Disable}
  - {pin_num: K14, peripheral: LPUART1, signal: TX, pin_signal: GPIO_AD_B0_12, hysteresis_enable: Disable}
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS ***********
 */

/*FUNCTION**********************************************************************
 *
 * Function Name : BOARD_InitPins
 * Description   : Configures pin routing and optionally pin electrical features.
 *
 *END**************************************************************************/
void BOARD_InitPins(void) {
  CLOCK_EnableClock(kCLOCK_Iomuxc);          /* iomuxc clock (iomuxc_clk_enable): 0x03u */

#if 0 // we'll initilaize these pins in the flash module                                            
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_06_FLEXSPI_SS0_B, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_07_FLEXSPI_SCLK, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_04_FLEXSPI_SCLK, 1U);       
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_05_FLEXSPI_DQS, 1U);             
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_08_FLEXSPI_DATA00, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_09_FLEXSPI_DATA01, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_10_FLEXSPI_DATA02, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_11_FLEXSPI_DATA03, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_03_FLEXSPI_DATA00, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_02_FLEXSPI_DATA01, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_01_FLEXSPI_DATA02, 1U); 
  IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_00_FLEXSPI_DATA03, 1U);       
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_06_FLEXSPI_SS0_B, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_07_FLEXSPI_SCLK, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_04_FLEXSPI_SCLK, 0x10F1u);       
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_05_FLEXSPI_DQS, 0x0130F1u);             
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_08_FLEXSPI_DATA00, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_09_FLEXSPI_DATA01, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_10_FLEXSPI_DATA02, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_11_FLEXSPI_DATA03, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_03_FLEXSPI_DATA00, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_02_FLEXSPI_DATA01, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_01_FLEXSPI_DATA02, 0x10F1u); 
  IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_00_FLEXSPI_DATA03, 0x10F1u);     
#endif
}

/*******************************************************************************
 * EOF
 ******************************************************************************/
