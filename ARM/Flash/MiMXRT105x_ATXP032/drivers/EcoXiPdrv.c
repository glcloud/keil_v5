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

#include "EcoXiPdefs.h"
#include "clock_config.h"
#include "fsl_iomuxc.h"
#include "fsl_gpio.h"

#define LUT_SEQ_INDEX_READ_ARRAY 0
#define LUT_SEQ_INDEX_BLOCK_ERASE_4K 11
#define LUT_SEQ_INDEX_WRITE_ENABLE 7
#define LUT_SEQ_INDEX_PROGRAM_PAGE 12
#define LUT_SEQ_INDEX_READ_STATUS_REG_BYTE1 1
#define LUT_SEQ_INDEX_WRITE_STAT_CTRL_REG 5
#define LUT_SEQ_INDEX_UNPROTECT_SECTOR 8
#define LUT_SEQ_INDEX_CMD_ENTER_QPI 9
#define LUT_SEQ_INDEX_RETURN_SPI 14
#define LUT_SEQ_INDEX_CHIP_ERASE 13
#define LUT_SEQ_INDEX_BLOCK_ERASE_4K 11
#define LUT_SEQ_INDEX_PAGE_PROG 12


// SCLK source clock frequencies - various options

//#define FLEXSPI_SOURCE_CLOCK 480000000
//#define FLEXSPI_SOURCE_CLOCK 411000000
//#define FLEXSPI_SOURCE_CLOCK 332000000
#define FLEXSPI_SOURCE_CLOCK 261000000

// SCLK frequency used by this driver
#define SCLK_FREQ 65250000

// EcoXiP reset methods
#define METHOD_PIN_RESET 1
#define METHOD_JEDEC_RESET 2
#define FLASH_RESET_METHOD METHOD_JEDEC_RESET

#define ECOXIP_RESET_RECOVEY_US 400


FLEXSPI_Type *exip_flexspi; //Pointer to the base of the FlexSPI instance used here
flexspi_config_t flexspi_config;
uint32_t * cur_aux_lut;
uint8_t op_mode;
flexspi_transfer_t flashxfer;
uint32_t flexspi_root_clock;

flexspi_device_config_t deviceconfig = {
    .flexspiRootClk = 0, /* SPI root clock (will be set up later)*/
    .flashSize = FLASH_SIZE/1024, // expressed in KByte
    .CSIntervalUnit = kFLEXSPI_CsIntervalUnit1SckCycle,
    .CSInterval = 5,
    .CSHoldTime = 2,
    .CSSetupTime = 4,
    .dataValidTime = 1,
    .columnspace = 0, // we don't use colums
    .enableWordAddress = 0,
    .ARDSeqIndex = 0,
    .AHBWriteWaitUnit = kFLEXSPI_AhbWriteWaitUnit2AhbCycle,
};

// Assign pins to FlexSPI and configure them
void EcoXiP_config_flexspi_pins(void)
{
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_06_FLEXSPIA_SS0_B, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_07_FLEXSPIA_SCLK, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_04_FLEXSPIB_SCLK, 1U);       
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_05_FLEXSPIA_DQS, 1U);             
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_08_FLEXSPIA_DATA00, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_09_FLEXSPIA_DATA01, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_10_FLEXSPIA_DATA02, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_11_FLEXSPIA_DATA03, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_03_FLEXSPIB_DATA00, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_02_FLEXSPIB_DATA01, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_01_FLEXSPIB_DATA02, 1U); 
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_00_FLEXSPIB_DATA03, 1U);       
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_06_FLEXSPIA_SS0_B, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_07_FLEXSPIA_SCLK, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_04_FLEXSPIB_SCLK, 0x10F1u);       
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_05_FLEXSPIA_DQS, 0x0130F1u);             
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_08_FLEXSPIA_DATA00, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_09_FLEXSPIA_DATA01, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_10_FLEXSPIA_DATA02, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_11_FLEXSPIA_DATA03, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_03_FLEXSPIB_DATA00, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_02_FLEXSPIB_DATA01, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_01_FLEXSPIB_DATA02, 0x10F1u); 
	IOMUXC_SetPinConfig(IOMUXC_GPIO_SD_B1_00_FLEXSPIB_DATA03, 0x10F1u);  
}

// Perform reset using RESET pin
void EcoXiP_reset(void)
{
	gpio_pin_config_t flash_reset_pin_config = 
	{
		kGPIO_DigitalOutput, 1, kGPIO_NoIntmode
	};

	uint32_t i; 

	// Set pin as GPIO
	IOMUXC_SetPinMux(IOMUXC_GPIO_AD_B0_05_GPIO1_IO05, 1);
	// Initialize pin as output with default output of 1
	GPIO_PinInit(GPIO1, 5, &flash_reset_pin_config);
	// Output high (1) - may be redundant, as this is the default state
	GPIO_WritePinOutput(GPIO1, 5, 1);
	// Output low (0) - need to keep it low for 300us, so loop for a while
	for(i = 0; i < 50; i++)
		GPIO_WritePinOutput(GPIO1, 5, 0);
	// Output high (1)
	GPIO_WritePinOutput(GPIO1, 5, 1);
}

// Perform JEDEC reset
void EcoXiP_jreset(void)
{
	uint32_t i;
	gpio_pin_config_t jreset_pin_config = 
	{
		kGPIO_DigitalOutput, 1, kGPIO_NoIntmode
	};

	// Configure the 3 pins used in JEDEC reset as GPIOs
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_06_GPIO3_IO06, 1);
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_08_GPIO3_IO08, 1);
	IOMUXC_SetPinMux(IOMUXC_GPIO_SD_B1_07_GPIO3_IO07, 1);

	// Set the direction of 3 pins used in JEDEC reset to output
	GPIO_PinInit(GPIO3, 6, &jreset_pin_config); // CS
	GPIO_PinInit(GPIO3, 8, &jreset_pin_config); // SI/IO0
	GPIO_PinInit(GPIO3, 7, &jreset_pin_config); // SCK


	// Perform a reset sequence:
	// CS goes low 4 times with alternating values of SOUT
	// SCK is drive low or high and must stay in one state
	GPIO_WritePinOutput(GPIO3, 7, 0); // set SCK low
	for(i = 0; i < 4; i++)
	{
		// drive CS low
		GPIO_WritePinOutput(GPIO3, 6, 0);
		//for(j=0; j<100; j++);
		// drive SI low or high: alternate its state every iteration
		GPIO_WritePinOutput(GPIO3, 8, (i&1));
		// drive CS high; SI state will be captured on the CS rising edge
		GPIO_WritePinOutput(GPIO3, 6, 1);
		//for(j=0; j<100; j++);
	}
}

// non-timer delay implementation - should delay by at least of 1us - could be much more
// assuming min 1 cycles per iteration and max clock 600MHz).
static void delay(void)
{
	#define DELAY_COUNT 600
    uint32_t i;
    for (i = 0; i < DELAY_COUNT; ++i)
    {
        __asm("NOP"); /* delay */
    }
}



// Initialize FlexSPI controller for EcoXiP
void EcoXiP_init(void)
{
	uint32_t i;

   // Set flexspi source clock
    const clock_usb_pll_config_t g_ccmConfigUsbPll = {.loopDivider = 0U};

	// Reset flash
#if(FLASH_RESET_METHOD == METHOD_PIN_RESET)
	EcoXiP_reset();
#endif
#if(FLASH_RESET_METHOD == METHOD_JEDEC_RESET)
	EcoXiP_jreset();
#endif

	// Give it some time to settle down (using EcoXiP reset recovery time)
	for(i = 0; i < ECOXIP_RESET_RECOVEY_US; i++)
		delay();

	// Assign pins to FlexSPI and configure them 
	EcoXiP_config_flexspi_pins();

	// Point to FlexSPI base
	exip_flexspi = FLEXSPI;

	// Set up source clock
    CLOCK_InitUsb1Pll(&g_ccmConfigUsbPll);
	CLOCK_InitUsb1Pfd(kCLOCK_Pfd0, 480000*18/(FLEXSPI_SOURCE_CLOCK/1000)); /* Set PLL3 PFD0 clock */
    CLOCK_SetMux(kCLOCK_FlexspiMux, 0x3); /* Choose PLL3 PFD0 clock as FlexSPI source clock. */

	// Set up SCLK
	flexspi_root_clock = SCLK_FREQ;
	deviceconfig.flexspiRootClk = flexspi_root_clock;
    CLOCK_SetDiv(kCLOCK_FlexspiDiv, (FLEXSPI_SOURCE_CLOCK/flexspi_root_clock) - 1); /* Divide source clock the source/root ratio. */

    /* Get FLEXSPI default settings and configure the FlexSPI. */
    FLEXSPI_GetDefaultConfig(&flexspi_config);

	// Enable AHB prefetching
	flexspi_config.ahbConfig.enableAHBPrefetch = true;

	// To achieve high speeds - always use DQS
	flexspi_config.rxSampleClock = kFLEXSPI_ReadSampleClkExternalInputFromDqsPad;

	// Need to set the combination-enable option. This options combines 8 data lines
	// from FlexSPI channel A with 4 data lines from FlexSPI channel B to form an
	// 8-line bus for octal. On this SoC this is th eonly way to enable octal.
	flexspi_config.enableCombination = true;

    /* Init FlexSPI. */
    FLEXSPI_Init(exip_flexspi, &flexspi_config);

    /* Configure flash settings according to serial flash feature. */
    FLEXSPI_SetFlashConfig_Adesto(exip_flexspi, &deviceconfig, kFLEXSPI_PortA1);

    /* Update LUT table. */
    FLEXSPI_UpdateLUT_Adesto(exip_flexspi, 0, spi_lut, LUT_SIZE);

    /* Do software reset. */
    FLEXSPI_SoftwareReset(exip_flexspi);

	// Set current operation mode to SPI
	op_mode = SPI_MODE;

	// Initialize fields in the structure we will send to the FlexSPI driver.
	// These fields will always have the same values in our case.
	flashxfer.port = kFLEXSPI_PortA1;
	flashxfer.SeqNumber = 1;
}

// Send write-enable command
int32_t EcoXiP_write_enable(void)
{
	status_t flexspi_status;

	flashxfer.cmdType = kFLEXSPI_Command;
	flashxfer.seqIndex = LUT_SEQ_INDEX_WRITE_ENABLE;
    flashxfer.deviceAddress = 0;
	flexspi_status = FLEXSPI_TransferBlocking(exip_flexspi, &flashxfer);

    if (flexspi_status != kStatus_Success)
		return 1;

	return 0;
}

// Read EcoXiP status register 1
uint32_t EcoXiP_read_busy_status(uint8_t *busy_status)
{
	uint32_t status_reg_1;
	status_t flexspi_status;

	flashxfer.cmdType = kFLEXSPI_Read;
	flashxfer.seqIndex = LUT_SEQ_INDEX_READ_STATUS_REG_BYTE1;
    flashxfer.deviceAddress = 0;
	flashxfer.data = &status_reg_1;
	flashxfer.dataSize = 1;
	flexspi_status = FLEXSPI_TransferBlocking(exip_flexspi, &flashxfer);
    if (flexspi_status != kStatus_Success)
		return 1;

	*busy_status = (status_reg_1 & BUSY_BIT);

	return 0; 
}

// Write to an EcoXiP status/control register
int32_t EcoXiP_write_status_control_register(uint8_t reg_addr, uint8_t val)
{
	uint32_t tx_buf = val;
	status_t flexspi_status;

	flashxfer.cmdType = kFLEXSPI_Write;
	flashxfer.seqIndex = LUT_SEQ_INDEX_WRITE_STAT_CTRL_REG;
    flashxfer.deviceAddress = reg_addr;
	flashxfer.data = &tx_buf;
	flashxfer.dataSize = 1;
	flexspi_status = FLEXSPI_TransferBlocking(exip_flexspi, &flashxfer);
    if (flexspi_status != kStatus_Success)
		return 1;

	return 0;
}


//Switch to Quad-SPI mode using either single or double data rate
int32_t EcoXiP_enter_quad_mode(bool ddr)
{
	uint8_t reg_val, is_busy;
	int32_t stat;

	if((ddr && op_mode == QPI_DDR_MODE) || ((!ddr) && op_mode == QPI_MODE))
		// already there
		return 0;

	// send write-enable 
	stat = EcoXiP_write_enable();
	if(stat != 0) return 1;

	// Write to status/control register 2 to switch to Quad-SDR or Quad-DDR
	reg_val = ddr ? 0x84 : 0x04;
	stat = EcoXiP_write_status_control_register(2, reg_val);
	if(stat != 0) return 1;

	if(ddr)
	{
		// To achieve high speeds - we always use DQS. This setting is done once in EcoXiP_init().
		//flexspi_config.rxSampleClock = kFLEXSPI_ReadSampleClkExternalInputFromDqsPad;
		FLEXSPI_Init(exip_flexspi, &flexspi_config);
		flexspi_root_clock = 2 * SCLK_FREQ; // need to double root clock in DDR
		deviceconfig.flexspiRootClk = flexspi_root_clock;
		CLOCK_SetDiv(kCLOCK_FlexspiDiv, (FLEXSPI_SOURCE_CLOCK/flexspi_root_clock) - 1); /* Divide source clock the source/root ratio. */
		FLEXSPI_SetFlashConfig_Adesto(exip_flexspi, &deviceconfig, kFLEXSPI_PortA1);
		// Update LUT
		FLEXSPI_UpdateLUT_Adesto(exip_flexspi, 0, qpi_ddr_lut, LUT_SIZE);
		// Update op mode
		op_mode = QPI_DDR_MODE;
	}
	else
	{
		// To achieve high speeds - we always use DQS. This setting is done once in EcoXiP_init().
		//flexspi_config.rxSampleClock = kFLEXSPI_ReadSampleClkLoopbackInternally;
		FLEXSPI_Init(exip_flexspi, &flexspi_config);
		flexspi_root_clock = SCLK_FREQ;
		deviceconfig.flexspiRootClk = flexspi_root_clock;
		CLOCK_SetDiv(kCLOCK_FlexspiDiv, (FLEXSPI_SOURCE_CLOCK/flexspi_root_clock) - 1); /* Divide source clock the source/root ratio. */
		FLEXSPI_SetFlashConfig_Adesto(exip_flexspi, &deviceconfig, kFLEXSPI_PortA1);
		// Update LUT
		FLEXSPI_UpdateLUT_Adesto(exip_flexspi, 0, qpi_lut, LUT_SIZE);
		// Update op mode
		op_mode = QPI_MODE;
	}

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0;
}

//Switch to Octal-SPI mode using either single or double data rate
int32_t EcoXiP_enter_octal_mode(bool ddr)
{
	uint8_t reg_val, is_busy;
	int32_t stat;

	if((ddr && op_mode == OPI_DDR_MODE) || ((!ddr) && op_mode == OPI_MODE))
		// already there
		return 0;

	// send write-enable 
	stat = EcoXiP_write_enable();
	if(stat != 0) return 1;

	// Write to status/control register 2 to switch to Octal-SDR or Octal-DDR
	reg_val = ddr ? 0x88 : 0x08;
	stat = EcoXiP_write_status_control_register(2, reg_val);
	if(stat != 0) return 1;


	if(ddr)
	{
		// To achieve high speeds - we always use DQS. This setting is done once in EcoXiP_init().
		//flexspi_config.rxSampleClock = kFLEXSPI_ReadSampleClkExternalInputFromDqsPad;
		//flexspi_config.rxSampleClock = kFLEXSPI_ReadSampleClkLoopbackInternally;
		FLEXSPI_Init(exip_flexspi, &flexspi_config);
		flexspi_root_clock = 2 * SCLK_FREQ; // need to double root clock in DDR
		deviceconfig.flexspiRootClk = flexspi_root_clock;
		CLOCK_SetDiv(kCLOCK_FlexspiDiv, (FLEXSPI_SOURCE_CLOCK/flexspi_root_clock) - 1); /* Divide source clock the source/root ratio. */
		FLEXSPI_SetFlashConfig_Adesto(exip_flexspi, &deviceconfig, kFLEXSPI_PortA1);
		// Update LUT
		FLEXSPI_UpdateLUT_Adesto(exip_flexspi, 0, opi_ddr_lut, LUT_SIZE);
		// Update op mode
		op_mode = OPI_DDR_MODE;
	}
	else
	{
		// To achieve high speeds - we always use DQS. This setting is done once in EcoXiP_init().
		//flexspi_config.rxSampleClock = kFLEXSPI_ReadSampleClkLoopbackInternally;
		FLEXSPI_Init(exip_flexspi, &flexspi_config);
		flexspi_root_clock = SCLK_FREQ;
		deviceconfig.flexspiRootClk = flexspi_root_clock;
		CLOCK_SetDiv(kCLOCK_FlexspiDiv, (FLEXSPI_SOURCE_CLOCK/flexspi_root_clock) - 1); /* Divide source clock the source/root ratio. */
		FLEXSPI_SetFlashConfig_Adesto(exip_flexspi, &deviceconfig, kFLEXSPI_PortA1);
		// Update LUT
		FLEXSPI_UpdateLUT_Adesto(exip_flexspi, 0, opi_lut, LUT_SIZE);
		// Update op mode
		op_mode = OPI_MODE;
	}

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0;
}


// Set number of dummy cycles used bu EcoXiP in Quad and Octal SPI modes
int32_t  EcoXiP_set_dummy_cycles(uint32_t cycles)
{
	uint8_t bit_val, is_busy;
	int32_t stat;

	if(cycles < 8 || cycles > 22 || (cycles & 0x1))
		return 1;

	bit_val = (cycles - 8) >> 1;

	stat = EcoXiP_write_enable();
	if(stat != 0) return 1;

	stat = EcoXiP_write_status_control_register(3, (0x10 | bit_val));
	if(stat != 0) return 1;

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0;
}

// Set EcoXiP I/O pin drive strength
int32_t EcoXiP_set_drive_strength(uint32_t impedance)
{
	uint8_t bit_val, is_busy;
	int32_t stat;

	switch(impedance)
	{
		case 50:
			bit_val = 0;
			break;
		case 33:
			bit_val = 1;
			break;
		case 66:
			bit_val = 2;
			break;
		case 100:
			bit_val = 3;
			break;
		case 40:
			bit_val = 4;
			break;
		default:
			bit_val = 0;
			break;
	}

	stat = EcoXiP_write_enable();
	if(stat != 0) return 1;

	stat = EcoXiP_write_status_control_register(0x81, (bit_val));
	if(stat != 0) return 1;

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0; 
}

// Read from EcoXiP memory
int32_t EcoXiP_read_array(uint32_t addr, uint32_t nbytes, uint32_t * read_buf)
{
	status_t flexspi_status;

	flashxfer.cmdType = kFLEXSPI_Read;
	flashxfer.seqIndex = LUT_SEQ_INDEX_READ_ARRAY;
    flashxfer.deviceAddress = addr;
	flashxfer.data = read_buf;
	flashxfer.dataSize = nbytes;
	flexspi_status = FLEXSPI_TransferBlocking(exip_flexspi, &flashxfer);

    if (flexspi_status != kStatus_Success)
		return 1;

	return 0;
}

// Erase EcoXiP's entire memory
int32_t EcoXiP_erase_chip(void)
{
	uint8_t is_busy;
	int32_t stat;
	status_t flexspi_status;

	EcoXiP_write_enable();

	flashxfer.cmdType = kFLEXSPI_Command;
	flashxfer.seqIndex = LUT_SEQ_INDEX_CHIP_ERASE;
    flashxfer.deviceAddress = 0;
	//flashxfer.data = &flash_status;
	//flashxfer.dataSize = 1;
	flexspi_status = FLEXSPI_TransferBlocking(exip_flexspi, &flashxfer);
    if (flexspi_status != kStatus_Success)
		return 1;

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0; 
}

// Erase a specified 4K sector in EcoXiP memory
int32_t EcoXiP_block_erase_4K(uint32_t address)
{
	uint8_t is_busy;
	int32_t stat;
	status_t flexspi_status;

	stat = EcoXiP_write_enable();
	if(stat != 0)
		return 1;

	flashxfer.cmdType = kFLEXSPI_Command;
	flashxfer.seqIndex = LUT_SEQ_INDEX_BLOCK_ERASE_4K;
    flashxfer.deviceAddress = address;
	//flashxfer.data = &flash_status;
	//flashxfer.dataSize = 1;
	flexspi_status = FLEXSPI_TransferBlocking(exip_flexspi, &flashxfer);
    if (flexspi_status != kStatus_Success)
		return 1;

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0;
}

// Program one page in EcoXiP memory
int32_t EcoXiP_page_program(uint32_t address, uint32_t size, uint8_t * data)
{
	uint8_t is_busy;
	int32_t stat;
	status_t flexspi_status;

	stat = EcoXiP_write_enable();
	if(stat != 0)
		return 1;

	flashxfer.cmdType = kFLEXSPI_Write;
	flashxfer.seqIndex = LUT_SEQ_INDEX_PAGE_PROG;
    flashxfer.deviceAddress = address;
	flashxfer.data = (uint32_t *) data;
	flashxfer.dataSize = size;
	flexspi_status = FLEXSPI_TransferBlocking(exip_flexspi, &flashxfer);
    if (flexspi_status != kStatus_Success)
		return 1;

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0;
}

//Unprotect all sectors
int32_t EcoXiP_unprotect_all(void)
{
	int32_t stat;
	uint8_t is_busy;

	stat = EcoXiP_write_enable();
	if(stat != 0)
		return 1;

	// write 0 to status/control register 1 - this will unprotect all sectors
	stat = EcoXiP_write_status_control_register(1, 0);
	if(stat != 0)
		return 1;

	do
	{
		stat = EcoXiP_read_busy_status(&is_busy);
		if(stat != 0)
			return 1;
	}
	while(is_busy);

	return 0;
}
