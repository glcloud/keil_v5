local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M2351.lua")
function get_chip_status_M262_AE_LQFP64(i,e,t,o)
local a={}
local t=read_M2351_Registers(i,e,t,o)
local e
e={}
e["pin_no"]="1"
e["texts"]={"PB.6","EADC0_CH6","EBI_nWRH","USCI1_DAT1","UART1_RXD","EBI_nCS1","BPWM1_CH5","EPWM1_BRAKE1","EPWM1_CH5","INT4","USB_VBUS_EN","ACMP1_O"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],24),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",6)
elseif o==1 then
fill_M2351_Analog(e,t,"B",6,"EADC0_CH6",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",6,"EBI_nWRH")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_USCI(e,t,"B",6,"USCI1_DAT1",1)
fill_M2351_USCI_IO(e,t,1,1)
elseif o==6 then
fill_M2351_UART(e,t,"B",6,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M2351_EBI(e,t,"B",6,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M2351_BPWM(e,t,"B",6,"BPWM1_CH5",1,5)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",6,"EPWM1_BRAKE1",1)
elseif o==12 then
fill_M2351_EPWM(e,t,"B",6,"EPWM1_CH5",1,5)
elseif o==13 then
fill_M2351_Normal(e,t,"B",6,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M2351_Normal(e,t,"B",6,"USB_VBUS_EN")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
elseif o==15 then
fill_M2351_ACMP(e,t,"B",6,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",6)
end
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"PB.5","EADC0_CH5","ACMP1_N","EBI_ADR0","SD0_DAT3","SPI1_MISO","I2C0_SCL","UART5_TXD","USCI1_CTL0","SC0_CLK","I2S0_BCLK","EPWM0_CH0","TM0","INT0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],20),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",5)
elseif o==1 then
fill_M2351_Analog(e,t,"B",5,"EADC0_CH5,ACMP1_N",{0},nil,{1})
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH5,ACMP1_N"
e["texts"]={"PB.5","EADC0_CH5,ACMP1_N","EBI_ADR0","SD0_DAT3","SPI1_MISO","I2C0_SCL","UART5_TXD","USCI1_CTL0","SC0_CLK","I2S0_BCLK","EPWM0_CH0","TM0","INT0"}
elseif o==2 then
fill_M2351_EBI(e,t,"B",5,"EBI_ADR0")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SD(e,t,"B",5,"SD0_DAT3",0)
elseif o==5 then
fill_M2351_SPI(e,t,"B",5,"SPI1_MISO",2)
fill_M2351_SPI_IO(e,t,2,true)
elseif o==6 then
fill_M2351_I2C(e,t,"B",5,"I2C0_SCL",0)
elseif o==7 then
fill_M2351_UART(e,t,"B",5,"UART5_TXD",5)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_USCI(e,t,"B",5,"USCI1_CTL0",1)
elseif o==9 then
fill_M2351_SC(e,t,"B",5,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M2351_I2S(e,t,"B",5,"I2S0_BCLK",0)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",5,"EPWM0_CH0",0,0)
elseif o==14 then
fill_M2351_TM(e,t,"B",5,"TM0",0)
elseif o==15 then
fill_M2351_Normal(e,t,"B",5,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",5)
end
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"PB.4","EADC0_CH4","ACMP1_P1","EBI_ADR1","SD0_DAT2","SPI1_MOSI","I2C0_SDA","UART5_RXD","USCI1_CTL1","SC0_DAT","I2S0_MCLK","EPWM0_CH1","TM1","INT1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],16),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",4)
elseif o==1 then
fill_M2351_Analog(e,t,"B",4,"EADC0_CH4,ACMP1_P1",{0},nil,{1})
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH4,ACMP1_P1"
e["texts"]={"PB.4","EADC0_CH4,ACMP1_P1","EBI_ADR1","SD0_DAT2","SPI1_MOSI","I2C0_SDA","UART5_RXD","USCI1_CTL1","SC0_DAT","I2S0_MCLK","EPWM0_CH1","TM1","INT1"}
elseif o==2 then
fill_M2351_EBI(e,t,"B",4,"EBI_ADR1")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SD(e,t,"B",4,"SD0_DAT2",0)
elseif o==5 then
fill_M2351_SPI(e,t,"B",4,"SPI1_MOSI",2)
fill_M2351_SPI_IO(e,t,2,false)
elseif o==6 then
fill_M2351_I2C(e,t,"B",4,"I2C0_SDA",0)
elseif o==7 then
fill_M2351_UART(e,t,"B",4,"UART5_RXD",5)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M2351_USCI(e,t,"B",4,"USCI1_CTL1",1)
elseif o==9 then
fill_M2351_SC(e,t,"B",4,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==10 then
fill_M2351_I2S(e,t,"B",4,"I2S0_MCLK",0)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",4,"EPWM0_CH1",0,1)
elseif o==14 then
fill_M2351_TM(e,t,"B",4,"TM1",1)
elseif o==15 then
fill_M2351_Normal(e,t,"B",4,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",4)
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"PB.3","EADC0_CH3","ACMP0_N","EBI_ADR2","SD0_DAT1","SPI1_CLK","UART1_TXD","UART5_nRTS","USCI1_DAT1","SC0_RST","I2S0_DI","EPWM0_CH2","TM2","INT2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],12),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",3)
elseif o==1 then
fill_M2351_Analog(e,t,"B",3,"EADC0_CH3,ACMP0_N",{0},nil,{0})
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH3,ACMP0_N"
e["texts"]={"PB.3","EADC0_CH3,ACMP0_N","EBI_ADR2","SD0_DAT1","SPI1_CLK","UART1_TXD","UART5_nRTS","USCI1_DAT1","SC0_RST","I2S0_DI","EPWM0_CH2","TM2","INT2"}
elseif o==2 then
fill_M2351_EBI(e,t,"B",3,"EBI_ADR2")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SD(e,t,"B",3,"SD0_DAT1",0)
elseif o==5 then
fill_M2351_SPI(e,t,"B",3,"SPI1_CLK",2)
elseif o==6 then
fill_M2351_UART(e,t,"B",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"B",3,"UART5_nRTS",5)
elseif o==8 then
fill_M2351_USCI(e,t,"B",3,"USCI1_DAT1",1)
fill_M2351_USCI_IO(e,t,1,1)
elseif o==9 then
fill_M2351_SC(e,t,"B",3,"SC0_RST",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M2351_I2S(e,t,"B",3,"I2S0_DI",0)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",3,"EPWM0_CH2",0,2)
elseif o==14 then
fill_M2351_TM(e,t,"B",3,"TM2",2)
elseif o==15 then
fill_M2351_Normal(e,t,"B",3,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",3)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"PB.2","EADC0_CH2","ACMP0_P1","EBI_ADR3","SD0_DAT0","SPI1_SS","UART1_RXD","UART5_nCTS","USCI1_DAT0","SC0_PWR","I2S0_DO","EPWM0_CH3","TM3","INT3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],8),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",2)
elseif o==1 then
fill_M2351_Analog(e,t,"B",2,"EADC0_CH2,ACMP0_P1",{0},nil,{0})
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH2,ACMP0_P1"
e["texts"]={"PB.2","EADC0_CH2,ACMP0_P1","EBI_ADR3","SD0_DAT0","SPI1_SS","UART1_RXD","UART5_nCTS","USCI1_DAT0","SC0_PWR","I2S0_DO","EPWM0_CH3","TM3","INT3"}
elseif o==2 then
fill_M2351_EBI(e,t,"B",2,"EBI_ADR3")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SD(e,t,"B",2,"SD0_DAT0",0)
elseif o==5 then
fill_M2351_SPI(e,t,"B",2,"SPI1_SS",2)
elseif o==6 then
fill_M2351_UART(e,t,"B",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M2351_UART(e,t,"B",2,"UART5_nCTS",5)
elseif o==8 then
fill_M2351_USCI(e,t,"B",2,"USCI1_DAT0",1)
fill_M2351_USCI_IO(e,t,1,0)
elseif o==9 then
fill_M2351_SC(e,t,"B",2,"SC0_PWR",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M2351_I2S(e,t,"B",2,"I2S0_DO",0)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",2,"EPWM0_CH3",0,3)
elseif o==14 then
fill_M2351_TM(e,t,"B",2,"TM3",3)
elseif o==15 then
fill_M2351_Normal(e,t,"B",2,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",2)
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"PB.1","EADC0_CH1","EBI_ADR8","SD0_CLK","SPI1_I2SMCLK","SPI3_I2SMCLK","UART2_TXD","USCI1_CLK","I2C1_SCL","I2S0_LRCK","EPWM0_CH4","EPWM1_CH4","EPWM0_BRAKE0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],4),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",1)
elseif o==1 then
fill_M2351_Analog(e,t,"B",1,"EADC0_CH1",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",1,"EBI_ADR8")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SD(e,t,"B",1,"SD0_CLK",0)
elseif o==5 then
fill_M2351_SPI(e,t,"B",1,"SPI1_I2SMCLK",2)
elseif o==6 then
fill_M2351_SPI(e,t,"B",1,"SPI3_I2SMCLK",4)
elseif o==7 then
fill_M2351_UART(e,t,"B",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_USCI(e,t,"B",1,"USCI1_CLK",1)
elseif o==9 then
fill_M2351_I2C(e,t,"B",1,"I2C1_SCL",1)
elseif o==10 then
fill_M2351_I2S(e,t,"B",1,"I2S0_LRCK",0)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",1,"EPWM0_CH4",0,4)
elseif o==12 then
fill_M2351_EPWM(e,t,"B",1,"EPWM1_CH4",1,4)
elseif o==13 then
fill_M2351_EPWM(e,t,"B",1,"EPWM0_BRAKE0",0)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"PB.0","EADC0_CH0","EBI_ADR9","SD0_CMD","UART2_RXD","SPI0_I2SMCLK","I2C1_SDA","EPWM0_CH5","EPWM1_CH5","EPWM0_BRAKE1"}
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
if o==0 then
fill_M2351_GPIO(e,t,"B",0)
elseif o==1 then
fill_M2351_Analog(e,t,"B",0,"EADC0_CH0",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",0,"EBI_ADR9")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SD(e,t,"B",0,"SD0_CMD",0)
elseif o==7 then
fill_M2351_UART(e,t,"B",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M2351_SPI(e,t,"B",0,"SPI0_I2SMCLK",1)
elseif o==9 then
fill_M2351_I2C(e,t,"B",0,"I2C1_SDA",1)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",0,"EPWM0_CH5",0,5)
elseif o==12 then
fill_M2351_EPWM(e,t,"B",0,"EPWM1_CH5",1,5)
elseif o==13 then
fill_M2351_EPWM(e,t,"B",0,"EPWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"PA.11","ACMP0_P0","EBI_nRD","SC2_PWR","SPI2_SS","USCI0_CLK","I2C2_SCL","BPWM0_CH0","EPWM0_SYNC_OUT","TM0_EXT","DAC1_ST"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],12),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",11)
elseif o==1 then
fill_M2351_Analog(e,t,"A",11,"ACMP0_P0",nil,nil,{0})
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"A",11,"EBI_nRD")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SC(e,t,"A",11,"SC2_PWR",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_SPI(e,t,"A",11,"SPI2_SS",3)
elseif o==6 then
fill_M2351_USCI(e,t,"A",11,"USCI0_CLK",0)
elseif o==7 then
fill_M2351_I2C(e,t,"A",11,"I2C2_SCL",2)
elseif o==9 then
fill_M2351_BPWM(e,t,"A",11,"BPWM0_CH0",0,0)
elseif o==10 then
fill_M2351_EPWM(e,t,"A",11,"EPWM0_SYNC_OUT",0)
elseif o==13 then
fill_M2351_TM(e,t,"A",11,"TM0_EXT",0)
elseif o==14 then
fill_M2351_DAC(e,t,"A",11,"DAC1_ST",1)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",11)
end
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"PA.10","ACMP1_P0","EBI_nWR","SC2_RST","SPI2_CLK","USCI0_DAT0","I2C2_SDA","BPWM0_CH1","QEI1_INDEX","ECAP0_IC0","TM1_EXT","DAC0_ST"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],8),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",10)
elseif o==1 then
fill_M2351_Analog(e,t,"A",10,"ACMP1_P0",nil,nil,{1})
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"A",10,"EBI_nWR")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SC(e,t,"A",10,"SC2_RST",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_SPI(e,t,"A",10,"SPI2_CLK",3)
elseif o==6 then
fill_M2351_USCI(e,t,"A",10,"USCI0_DAT0",0)
fill_M2351_USCI_IO(e,t,0,0)
elseif o==7 then
fill_M2351_I2C(e,t,"A",10,"I2C2_SDA",2)
elseif o==9 then
fill_M2351_BPWM(e,t,"A",10,"BPWM0_CH1",0,1)
elseif o==10 then
fill_M2351_QEI(e,t,"A",10,"QEI1_INDEX",1)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M2351_ECAP(e,t,"A",10,"ECAP0_IC0",0)
elseif o==13 then
fill_M2351_TM(e,t,"A",10,"TM1_EXT",1)
elseif o==14 then
fill_M2351_DAC(e,t,"A",10,"DAC0_ST",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",10)
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"PA.9","EBI_MCLK","SC2_DAT","SPI2_MISO","USCI0_DAT1","UART1_TXD","BPWM0_CH2","QEI1_A","ECAP0_IC1","TM2_EXT"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],4),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",9)
elseif o==1 then
fill_invalid_GPIO(e,t,"A",9)
elseif o==2 then
fill_M2351_EBI(e,t,"A",9,"EBI_MCLK")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SC(e,t,"A",9,"SC2_DAT",2)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC2_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==4 then
fill_M2351_SPI(e,t,"A",9,"SPI2_MISO",3)
fill_M2351_SPI_IO(e,t,3,true)
elseif o==6 then
fill_M2351_USCI(e,t,"A",9,"USCI0_DAT1",0)
fill_M2351_USCI_IO(e,t,0,1)
elseif o==7 then
fill_M2351_UART(e,t,"A",9,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M2351_BPWM(e,t,"A",9,"BPWM0_CH2",0,2)
elseif o==10 then
fill_M2351_QEI(e,t,"A",9,"QEI1_A",1)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M2351_ECAP(e,t,"A",9,"ECAP0_IC1",0)
elseif o==13 then
fill_M2351_TM(e,t,"A",9,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"A",9)
end
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"PA.8","EBI_ALE","SC2_CLK","SPI2_MOSI","USCI0_CTL1","UART1_RXD","BPWM0_CH3","QEI1_B","ECAP0_IC2","TM3_EXT","INT4"}
local o=ext.band(t["SYS_SYS_GPA_MFPH"],15)
if o==0 then
fill_M2351_GPIO(e,t,"A",8)
elseif o==1 then
fill_invalid_GPIO(e,t,"A",8)
elseif o==2 then
fill_M2351_EBI(e,t,"A",8,"EBI_ALE")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SC(e,t,"A",8,"SC2_CLK",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_SPI(e,t,"A",8,"SPI2_MOSI",3)
fill_M2351_SPI_IO(e,t,3,false)
elseif o==6 then
fill_M2351_USCI(e,t,"A",8,"USCI0_CTL1",0)
elseif o==7 then
fill_M2351_UART(e,t,"A",8,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M2351_BPWM(e,t,"A",8,"BPWM0_CH3",0,3)
elseif o==10 then
fill_M2351_QEI(e,t,"A",8,"QEI1_B",1)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M2351_ECAP(e,t,"A",8,"ECAP0_IC2",0)
elseif o==13 then
fill_M2351_TM(e,t,"A",8,"TM3_EXT",3)
elseif o==15 then
fill_M2351_Normal(e,t,"A",8,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",8)
end
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"PF.6","EBI_ADR19","SC0_CLK","I2S0_LRCK","SPI0_MOSI","UART4_RXD","EBI_nCS0","TAMPER0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],24),15)
if o==0 then
fill_M2351_GPIO(e,t,"F",6)
elseif o==2 then
fill_M2351_EBI(e,t,"F",6,"EBI_ADR19")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_SC(e,t,"F",6,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_I2S(e,t,"F",6,"I2S0_LRCK",0)
elseif o==5 then
fill_M2351_SPI(e,t,"F",6,"SPI0_MOSI",1)
fill_M2351_SPI_IO(e,t,1,false)
elseif o==6 then
fill_M2351_UART(e,t,"F",6,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M2351_EBI(e,t,"F",6,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M2351_Normal(e,t,"F",6,"TAMPER0")
else
fill_invalid_GPIO(e,t,"F",6)
end
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"VBAT"}
fill_M2351_Normal(e,t,nil,nil,"VBAT")
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"PF.5","UART2_RXD","UART2_nCTS","BPWM0_CH4","EPWM0_SYNC_OUT","X32_IN","EADC0_ST"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],20),15)
if o==0 then
fill_M2351_GPIO(e,t,"F",5)
elseif o==2 then
fill_M2351_UART(e,t,"F",5,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M2351_UART(e,t,"F",5,"UART2_nCTS",2)
elseif o==8 then
fill_M2351_BPWM(e,t,"F",5,"BPWM0_CH4",0,4)
elseif o==9 then
fill_M2351_EPWM(e,t,"F",5,"EPWM0_SYNC_OUT",0)
elseif o==10 then
fill_M2351_Normal(e,t,"F",5,"X32_IN")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M2351_EADC(e,t,"F",5,"EADC0_ST",0)
else
fill_invalid_GPIO(e,t,"F",5)
end
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"PF.4","UART2_TXD","UART2_nRTS","BPWM0_CH5","X32_OUT"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],16),15)
if o==0 then
fill_M2351_GPIO(e,t,"F",4)
elseif o==2 then
fill_M2351_UART(e,t,"F",4,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_UART(e,t,"F",4,"UART2_nRTS",2)
elseif o==8 then
fill_M2351_BPWM(e,t,"F",4,"BPWM0_CH5",0,5)
elseif o==10 then
fill_M2351_Normal(e,t,"F",4,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"F",4)
end
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"PF.3","EBI_nCS0","UART0_TXD","I2C0_SCL","XT1_IN","BPWM1_CH0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],12),15)
if o==0 then
fill_M2351_GPIO(e,t,"F",3)
elseif o==2 then
fill_M2351_EBI(e,t,"F",3,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_UART(e,t,"F",3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_I2C(e,t,"F",3,"I2C0_SCL",0)
elseif o==10 then
fill_M2351_Normal(e,t,"F",3,"XT1_IN")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M2351_BPWM(e,t,"F",3,"BPWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"PF.2","EBI_nCS1","UART0_RXD","I2C0_SDA","QSPI0_CLK","XT1_OUT","BPWM1_CH1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],8),15)
if o==0 then
fill_M2351_GPIO(e,t,"F",2)
elseif o==2 then
fill_M2351_EBI(e,t,"F",2,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_UART(e,t,"F",2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M2351_I2C(e,t,"F",2,"I2C0_SDA",0)
elseif o==5 then
fill_M2351_SPI(e,t,"F",2,"QSPI0_CLK",0)
elseif o==10 then
fill_M2351_Normal(e,t,"F",2,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M2351_BPWM(e,t,"F",2,"BPWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"F",2)
end
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"PC.7","EBI_AD9","SPI1_MISO","UART4_TXD","SC2_PWR","UART0_nCTS","I2C1_SMBAL","EPWM1_CH2","BPWM1_CH0","TM0","INT3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],28),15)
if o==0 then
fill_M2351_GPIO(e,t,"C",7)
elseif o==2 then
fill_M2351_EBI(e,t,"C",7,"EBI_AD9")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",7,"SPI1_MISO",2)
fill_M2351_SPI_IO(e,t,2,true)
elseif o==5 then
fill_M2351_UART(e,t,"C",7,"UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M2351_SC(e,t,"C",7,"SC2_PWR",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"C",7,"UART0_nCTS",0)
elseif o==8 then
fill_M2351_I2C(e,t,"C",7,"I2C1_SMBAL",1)
elseif o==11 then
fill_M2351_EPWM(e,t,"C",7,"EPWM1_CH2",1,2)
elseif o==12 then
fill_M2351_BPWM(e,t,"C",7,"BPWM1_CH0",1,0)
elseif o==14 then
fill_M2351_TM(e,t,"C",7,"TM0",0)
elseif o==15 then
fill_M2351_Normal(e,t,"C",7,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",7)
end
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"PC.6","EBI_AD8","SPI1_MOSI","UART4_RXD","SC2_RST","UART0_nRTS","I2C1_SMBSUS","EPWM1_CH3","BPWM1_CH1","TM1","INT2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],24),15)
if o==0 then
fill_M2351_GPIO(e,t,"C",6)
elseif o==2 then
fill_M2351_EBI(e,t,"C",6,"EBI_AD8")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",6,"SPI1_MOSI",2)
fill_M2351_SPI_IO(e,t,2,false)
elseif o==5 then
fill_M2351_UART(e,t,"C",6,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M2351_SC(e,t,"C",6,"SC2_RST",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"C",6,"UART0_nRTS",0)
elseif o==8 then
fill_M2351_I2C(e,t,"C",6,"I2C1_SMBSUS",1)
elseif o==11 then
fill_M2351_EPWM(e,t,"C",6,"EPWM1_CH3",1,3)
elseif o==12 then
fill_M2351_BPWM(e,t,"C",6,"BPWM1_CH1",1,1)
elseif o==14 then
fill_M2351_TM(e,t,"C",6,"TM1",1)
elseif o==15 then
fill_M2351_Normal(e,t,"C",6,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",6)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"PA.7","EBI_AD7","SPI1_CLK","SC2_DAT","UART0_TXD","I2C1_SCL","EPWM1_CH4","BPWM1_CH2","ACMP0_WLAT","TM2","INT1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],28),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",7)
elseif o==2 then
fill_M2351_EBI(e,t,"A",7,"EBI_AD7")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"A",7,"SPI1_CLK",2)
elseif o==6 then
fill_M2351_SC(e,t,"A",7,"SC2_DAT",2)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC2_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==7 then
fill_M2351_UART(e,t,"A",7,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_I2C(e,t,"A",7,"I2C1_SCL",1)
elseif o==11 then
fill_M2351_EPWM(e,t,"A",7,"EPWM1_CH4",1,4)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",7,"BPWM1_CH2",1,2)
elseif o==13 then
fill_M2351_ACMP(e,t,"A",7,"ACMP0_WLAT",0)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M2351_TM(e,t,"A",7,"TM2",2)
elseif o==15 then
fill_M2351_Normal(e,t,"A",7,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",7)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"PA.6","EBI_AD6","SPI1_SS","SC2_CLK","UART0_RXD","I2C1_SDA","EPWM1_CH5","BPWM1_CH3","ACMP1_WLAT","TM3","INT0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],24),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",6)
elseif o==2 then
fill_M2351_EBI(e,t,"A",6,"EBI_AD6")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"A",6,"SPI1_SS",2)
elseif o==6 then
fill_M2351_SC(e,t,"A",6,"SC2_CLK",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"A",6,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M2351_I2C(e,t,"A",6,"I2C1_SDA",1)
elseif o==11 then
fill_M2351_EPWM(e,t,"A",6,"EPWM1_CH5",1,5)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",6,"BPWM1_CH3",1,3)
elseif o==13 then
fill_M2351_ACMP(e,t,"A",6,"ACMP1_WLAT",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M2351_TM(e,t,"A",6,"TM3",3)
elseif o==15 then
fill_M2351_Normal(e,t,"A",6,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",6)
end
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"VSS"}
fill_M2351_Normal(e,t,nil,nil,"VSS")
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"VDD"}
fill_M2351_Normal(e,t,nil,nil,"VDD")
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"LDO_CAP"}
fill_M2351_Normal(e,t,nil,nil,"LDO_CAP")
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"PA.5","QSPI0_MISO1","SPI1_I2SMCLK","SC2_nCD","UART0_nCTS","UART5_TXD","I2C0_SCL","BPWM0_CH5","EPWM0_CH0","QEI0_INDEX"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],20),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",5)
elseif o==3 then
fill_M2351_SPI(e,t,"A",5,"QSPI0_MISO1",0)
fill_M2351_SPI_IO(e,t,0,true)
elseif o==4 then
fill_M2351_SPI(e,t,"A",5,"SPI1_I2SMCLK",2)
elseif o==6 then
fill_M2351_SC(e,t,"A",5,"SC2_nCD",2)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M2351_UART(e,t,"A",5,"UART0_nCTS",0)
elseif o==8 then
fill_M2351_UART(e,t,"A",5,"UART5_TXD",5)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M2351_I2C(e,t,"A",5,"I2C0_SCL",0)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",5,"BPWM0_CH5",0,5)
elseif o==13 then
fill_M2351_EPWM(e,t,"A",5,"EPWM0_CH0",0,0)
elseif o==14 then
fill_M2351_QEI(e,t,"A",5,"QEI0_INDEX",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",5)
end
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"PA.4","QSPI0_MOSI1","SPI0_I2SMCLK","SC0_nCD","UART0_nRTS","UART5_RXD","I2C0_SDA","BPWM0_CH4","EPWM0_CH1","QEI0_A"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],16),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",4)
elseif o==3 then
fill_M2351_SPI(e,t,"A",4,"QSPI0_MOSI1",0)
fill_M2351_SPI_IO(e,t,0,false)
elseif o==4 then
fill_M2351_SPI(e,t,"A",4,"SPI0_I2SMCLK",1)
elseif o==6 then
fill_M2351_SC(e,t,"A",4,"SC0_nCD",0)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M2351_UART(e,t,"A",4,"UART0_nRTS",0)
elseif o==8 then
fill_M2351_UART(e,t,"A",4,"UART5_RXD",5)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M2351_I2C(e,t,"A",4,"I2C0_SDA",0)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",4,"BPWM0_CH4",0,4)
elseif o==13 then
fill_M2351_EPWM(e,t,"A",4,"EPWM0_CH1",0,1)
elseif o==14 then
fill_M2351_QEI(e,t,"A",4,"QEI0_A",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",4)
end
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"PA.3","QSPI0_SS","SPI0_SS","SC0_PWR","UART4_TXD","UART1_TXD","I2C1_SCL","BPWM0_CH3","EPWM0_CH2","QEI0_B"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],12),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",3)
elseif o==3 then
fill_M2351_SPI(e,t,"A",3,"QSPI0_SS",0)
elseif o==4 then
fill_M2351_SPI(e,t,"A",3,"SPI0_SS",1)
elseif o==6 then
fill_M2351_SC(e,t,"A",3,"SC0_PWR",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"A",3,"UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_UART(e,t,"A",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M2351_I2C(e,t,"A",3,"I2C1_SCL",1)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",3,"BPWM0_CH3",0,3)
elseif o==13 then
fill_M2351_EPWM(e,t,"A",3,"EPWM0_CH2",0,2)
elseif o==14 then
fill_M2351_QEI(e,t,"A",3,"QEI0_B",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",3)
end
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"PA.2","QSPI0_CLK","SPI0_CLK","SC0_RST","UART4_RXD","UART1_RXD","I2C1_SDA","BPWM0_CH2","EPWM0_CH3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],8),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",2)
elseif o==3 then
fill_M2351_SPI(e,t,"A",2,"QSPI0_CLK",0)
elseif o==4 then
fill_M2351_SPI(e,t,"A",2,"SPI0_CLK",1)
elseif o==6 then
fill_M2351_SC(e,t,"A",2,"SC0_RST",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"A",2,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M2351_UART(e,t,"A",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M2351_I2C(e,t,"A",2,"I2C1_SDA",1)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",2,"BPWM0_CH2",0,2)
elseif o==13 then
fill_M2351_EPWM(e,t,"A",2,"EPWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"PA.1","QSPI0_MISO0","SPI0_MISO","SC0_DAT","UART0_TXD","UART1_nCTS","I2C2_SCL","BPWM0_CH1","EPWM0_CH4","DAC1_ST"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],4),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",1)
elseif o==3 then
fill_M2351_SPI(e,t,"A",1,"QSPI0_MISO0",0)
fill_M2351_SPI_IO(e,t,0,true)
elseif o==4 then
fill_M2351_SPI(e,t,"A",1,"SPI0_MISO",1)
fill_M2351_SPI_IO(e,t,1,true)
elseif o==6 then
fill_M2351_SC(e,t,"A",1,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==7 then
fill_M2351_UART(e,t,"A",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_UART(e,t,"A",1,"UART1_nCTS",1)
elseif o==9 then
fill_M2351_I2C(e,t,"A",1,"I2C2_SCL",2)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",1,"BPWM0_CH1",0,1)
elseif o==13 then
fill_M2351_EPWM(e,t,"A",1,"EPWM0_CH4",0,4)
elseif o==15 then
fill_M2351_DAC(e,t,"A",1,"DAC1_ST",1)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",1)
end
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"PA.0","QSPI0_MOSI0","SPI0_MOSI","SC0_CLK","UART0_RXD","UART1_nRTS","I2C2_SDA","BPWM0_CH0","EPWM0_CH5","DAC0_ST"}
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
if o==0 then
fill_M2351_GPIO(e,t,"A",0)
elseif o==3 then
fill_M2351_SPI(e,t,"A",0,"QSPI0_MOSI0",0)
fill_M2351_SPI_IO(e,t,0,false)
elseif o==4 then
fill_M2351_SPI(e,t,"A",0,"SPI0_MOSI",1)
fill_M2351_SPI_IO(e,t,1,false)
elseif o==6 then
fill_M2351_SC(e,t,"A",0,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"A",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M2351_UART(e,t,"A",0,"UART1_nRTS",1)
elseif o==9 then
fill_M2351_I2C(e,t,"A",0,"I2C2_SDA",2)
elseif o==12 then
fill_M2351_BPWM(e,t,"A",0,"BPWM0_CH0",0,0)
elseif o==13 then
fill_M2351_EPWM(e,t,"A",0,"EPWM0_CH5",0,5)
elseif o==15 then
fill_M2351_DAC(e,t,"A",0,"DAC0_ST",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",0)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"VDDIO"}
fill_M2351_Normal(e,t,nil,nil,"VDDIO")
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"nRESET"}
fill_M2351_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"PF.0","UART1_TXD","I2C1_SCL","BPWM1_CH0","ICE_DAT"}
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
if o==0 then
fill_M2351_GPIO(e,t,"F",0)
elseif o==2 then
fill_M2351_UART(e,t,"F",0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M2351_I2C(e,t,"F",0,"I2C1_SCL",1)
elseif o==12 then
fill_M2351_BPWM(e,t,"F",0,"BPWM1_CH0",1,0)
elseif o==14 then
fill_M2351_Normal(e,t,"F",0,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"F",0)
end
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"PF.1","UART1_RXD","I2C1_SDA","BPWM1_CH1","ICE_CLK"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],4),15)
if o==0 then
fill_M2351_GPIO(e,t,"F",1)
elseif o==2 then
fill_M2351_UART(e,t,"F",1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M2351_I2C(e,t,"F",1,"I2C1_SDA",1)
elseif o==12 then
fill_M2351_BPWM(e,t,"F",1,"BPWM1_CH1",1,1)
elseif o==14 then
fill_M2351_Normal(e,t,"F",1,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"PC.5","EBI_AD5","QSPI0_MISO1","UART2_TXD","I2C1_SCL","UART4_TXD","EPWM1_CH0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],20),15)
if o==0 then
fill_M2351_GPIO(e,t,"C",5)
elseif o==2 then
fill_M2351_EBI(e,t,"C",5,"EBI_AD5")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",5,"QSPI0_MISO1",0)
fill_M2351_SPI_IO(e,t,0,true)
elseif o==8 then
fill_M2351_UART(e,t,"C",5,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M2351_I2C(e,t,"C",5,"I2C1_SCL",1)
elseif o==11 then
fill_M2351_UART(e,t,"C",5,"UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==12 then
fill_M2351_EPWM(e,t,"C",5,"EPWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"C",5)
end
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"PC.4","EBI_AD4","QSPI0_MOSI1","SC1_nCD","I2S0_BCLK","SPI1_I2SMCLK","UART2_RXD","I2C1_SDA","UART4_RXD","EPWM1_CH1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],16),15)
if o==0 then
fill_M2351_GPIO(e,t,"C",4)
elseif o==2 then
fill_M2351_EBI(e,t,"C",4,"EBI_AD4")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",4,"QSPI0_MOSI1",0)
fill_M2351_SPI_IO(e,t,0,false)
elseif o==5 then
fill_M2351_SC(e,t,"C",4,"SC1_nCD",1)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M2351_I2S(e,t,"C",4,"I2S0_BCLK",0)
elseif o==7 then
fill_M2351_SPI(e,t,"C",4,"SPI1_I2SMCLK",2)
elseif o==8 then
fill_M2351_UART(e,t,"C",4,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M2351_I2C(e,t,"C",4,"I2C1_SDA",1)
elseif o==11 then
fill_M2351_UART(e,t,"C",4,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M2351_EPWM(e,t,"C",4,"EPWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"C",4)
end
a[36]=e
e={}
e["pin_no"]="37"
e["texts"]={"PC.3","EBI_AD3","QSPI0_SS","SC1_PWR","I2S0_MCLK","SPI1_MISO","UART2_nRTS","I2C0_SMBAL","UART3_TXD","EPWM1_CH2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],12),15)
if o==0 then
fill_M2351_GPIO(e,t,"C",3)
elseif o==2 then
fill_M2351_EBI(e,t,"C",3,"EBI_AD3")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",3,"QSPI0_SS",0)
elseif o==5 then
fill_M2351_SC(e,t,"C",3,"SC1_PWR",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M2351_I2S(e,t,"C",3,"I2S0_MCLK",0)
elseif o==7 then
fill_M2351_SPI(e,t,"C",3,"SPI1_MISO",2)
fill_M2351_SPI_IO(e,t,2,true)
elseif o==8 then
fill_M2351_UART(e,t,"C",3,"UART2_nRTS",2)
elseif o==9 then
fill_M2351_I2C(e,t,"C",3,"I2C0_SMBAL",0)
elseif o==11 then
fill_M2351_UART(e,t,"C",3,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==12 then
fill_M2351_EPWM(e,t,"C",3,"EPWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[37]=e
e={}
e["pin_no"]="38"
e["texts"]={"PC.2","EBI_AD2","QSPI0_CLK","SC1_RST","I2S0_DI","SPI1_MOSI","UART2_nCTS","I2C0_SMBSUS","UART3_RXD","EPWM1_CH3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],8),15)
if o==0 then
fill_M2351_GPIO(e,t,"C",2)
elseif o==2 then
fill_M2351_EBI(e,t,"C",2,"EBI_AD2")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",2,"QSPI0_CLK",0)
elseif o==5 then
fill_M2351_SC(e,t,"C",2,"SC1_RST",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M2351_I2S(e,t,"C",2,"I2S0_DI",0)
elseif o==7 then
fill_M2351_SPI(e,t,"C",2,"SPI1_MOSI",2)
fill_M2351_SPI_IO(e,t,2,false)
elseif o==8 then
fill_M2351_UART(e,t,"C",2,"UART2_nCTS",2)
elseif o==9 then
fill_M2351_I2C(e,t,"C",2,"I2C0_SMBSUS",0)
elseif o==11 then
fill_M2351_UART(e,t,"C",2,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M2351_EPWM(e,t,"C",2,"EPWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"C",2)
end
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"PC.1","EBI_AD1","QSPI0_MISO0","SC1_DAT","I2S0_DO","SPI1_CLK","UART2_TXD","I2C0_SCL","EPWM1_CH4","ACMP0_O"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],4),15)
if o==0 then
fill_M2351_GPIO(e,t,"C",1)
elseif o==2 then
fill_M2351_EBI(e,t,"C",1,"EBI_AD1")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",1,"QSPI0_MISO0",0)
fill_M2351_SPI_IO(e,t,0,true)
elseif o==5 then
fill_M2351_SC(e,t,"C",1,"SC1_DAT",1)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC1_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==6 then
fill_M2351_I2S(e,t,"C",1,"I2S0_DO",0)
elseif o==7 then
fill_M2351_SPI(e,t,"C",1,"SPI1_CLK",2)
elseif o==8 then
fill_M2351_UART(e,t,"C",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M2351_I2C(e,t,"C",1,"I2C0_SCL",0)
elseif o==12 then
fill_M2351_EPWM(e,t,"C",1,"EPWM1_CH4",1,4)
elseif o==14 then
fill_M2351_ACMP(e,t,"C",1,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",1)
end
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"PC.0","EBI_AD0","QSPI0_MOSI0","SC1_CLK","I2S0_LRCK","SPI1_SS","UART2_RXD","I2C0_SDA","EPWM1_CH5","ACMP1_O"}
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
if o==0 then
fill_M2351_GPIO(e,t,"C",0)
elseif o==2 then
fill_M2351_EBI(e,t,"C",0,"EBI_AD0")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M2351_SPI(e,t,"C",0,"QSPI0_MOSI0",0)
fill_M2351_SPI_IO(e,t,0,false)
elseif o==5 then
fill_M2351_SC(e,t,"C",0,"SC1_CLK",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M2351_I2S(e,t,"C",0,"I2S0_LRCK",0)
elseif o==7 then
fill_M2351_SPI(e,t,"C",0,"SPI1_SS",2)
elseif o==8 then
fill_M2351_UART(e,t,"C",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M2351_I2C(e,t,"C",0,"I2C0_SDA",0)
elseif o==12 then
fill_M2351_EPWM(e,t,"C",0,"EPWM1_CH5",1,5)
elseif o==14 then
fill_M2351_ACMP(e,t,"C",0,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",0)
end
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"UART0_TXD","SC1_nCD","SC2_PWR","USCI1_CTL0","UART3_nRTS","SPI0_SS","USCI0_CTL1","EBI_AD10","PD.3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],12),15)
if o==0 then
fill_M2351_GPIO(e,t,"D",3)
elseif o==2 then
fill_M2351_EBI(e,t,"D",3,"EBI_AD10")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_USCI(e,t,"D",3,"USCI0_CTL1",0)
elseif o==4 then
fill_M2351_SPI(e,t,"D",3,"SPI0_SS",1)
elseif o==5 then
fill_M2351_UART(e,t,"D",3,"UART3_nRTS",3)
elseif o==6 then
fill_M2351_USCI(e,t,"D",3,"USCI1_CTL0",1)
elseif o==7 then
fill_M2351_SC(e,t,"D",3,"SC2_PWR",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_SC(e,t,"D",3,"SC1_nCD",1)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M2351_UART(e,t,"D",3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",3)
end
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"UART0_RXD","SC2_RST","UART3_nCTS","SPI0_CLK","USCI0_DAT1","EBI_AD11","PD.2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],8),15)
if o==0 then
fill_M2351_GPIO(e,t,"D",2)
elseif o==2 then
fill_M2351_EBI(e,t,"D",2,"EBI_AD11")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_USCI(e,t,"D",2,"USCI0_DAT1",0)
fill_M2351_USCI_IO(e,t,0,1)
elseif o==4 then
fill_M2351_SPI(e,t,"D",2,"SPI0_CLK",1)
elseif o==5 then
fill_M2351_UART(e,t,"D",2,"UART3_nCTS",3)
elseif o==7 then
fill_M2351_SC(e,t,"D",2,"SC2_RST",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M2351_UART(e,t,"D",2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",2)
end
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"SC2_DAT","I2C2_SCL","UART3_TXD","SPI0_MISO","USCI0_DAT0","EBI_AD12","PD.1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],4),15)
if o==0 then
fill_M2351_GPIO(e,t,"D",1)
elseif o==2 then
fill_M2351_EBI(e,t,"D",1,"EBI_AD12")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_USCI(e,t,"D",1,"USCI0_DAT0",0)
fill_M2351_USCI_IO(e,t,0,0)
elseif o==4 then
fill_M2351_SPI(e,t,"D",1,"SPI0_MISO",1)
fill_M2351_SPI_IO(e,t,1,true)
elseif o==5 then
fill_M2351_UART(e,t,"D",1,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M2351_I2C(e,t,"D",1,"I2C2_SCL",2)
elseif o==7 then
fill_M2351_SC(e,t,"D",1,"SC2_DAT",2)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC2_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
else
fill_invalid_GPIO(e,t,"D",1)
end
a[43]=e
e={}
e["pin_no"]="44"
e["texts"]={"TM2","SC2_CLK","I2C2_SDA","UART3_RXD","SPI0_MOSI","USCI0_CLK","EBI_AD13","PD.0"}
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
if o==0 then
fill_M2351_GPIO(e,t,"D",0)
elseif o==2 then
fill_M2351_EBI(e,t,"D",0,"EBI_AD13")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_USCI(e,t,"D",0,"USCI0_CLK",0)
elseif o==4 then
fill_M2351_SPI(e,t,"D",0,"SPI0_MOSI",1)
fill_M2351_SPI_IO(e,t,1,false)
elseif o==5 then
fill_M2351_UART(e,t,"D",0,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M2351_I2C(e,t,"D",0,"I2C2_SDA",2)
elseif o==7 then
fill_M2351_SC(e,t,"D",0,"SC2_CLK",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==14 then
fill_M2351_TM(e,t,"D",0,"TM2",2)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"USB_VBUS","QEI1_INDEX","BPWM1_CH2","SC2_PWR","SPI2_SS","I2C1_SCL","UART4_TXD","I2S0_BCLK","PA.12"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],16),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",12)
elseif o==2 then
fill_M2351_I2S(e,t,"A",12,"I2S0_BCLK",0)
elseif o==3 then
fill_M2351_UART(e,t,"A",12,"UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_I2C(e,t,"A",12,"I2C1_SCL",1)
elseif o==5 then
fill_M2351_SPI(e,t,"A",12,"SPI2_SS",3)
elseif o==7 then
fill_M2351_SC(e,t,"A",12,"SC2_PWR",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M2351_BPWM(e,t,"A",12,"BPWM1_CH2",1,2)
elseif o==12 then
fill_M2351_QEI(e,t,"A",12,"QEI1_INDEX",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M2351_Normal(e,t,"A",12,"USB_VBUS")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"A",12)
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"USB_D-","QEI1_A","BPWM1_CH3","SC2_RST","SPI2_CLK","I2C1_SDA","UART4_RXD","I2S0_MCLK","PA.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],20),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",13)
elseif o==2 then
fill_M2351_I2S(e,t,"A",13,"I2S0_MCLK",0)
elseif o==3 then
fill_M2351_UART(e,t,"A",13,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M2351_I2C(e,t,"A",13,"I2C1_SDA",1)
elseif o==5 then
fill_M2351_SPI(e,t,"A",13,"SPI2_CLK",3)
elseif o==7 then
fill_M2351_SC(e,t,"A",13,"SC2_RST",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M2351_BPWM(e,t,"A",13,"BPWM1_CH3",1,3)
elseif o==12 then
fill_M2351_QEI(e,t,"A",13,"QEI1_A",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M2351_USB(e,t,"A",13,"USB_D-")
else
fill_invalid_GPIO(e,t,"A",13)
end
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"USB_D+","QEI1_B","BPWM1_CH4","SC2_DAT","I2C2_SCL","SPI2_MISO","UART0_TXD","I2S0_DI","PA.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],24),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",14)
elseif o==2 then
fill_M2351_I2S(e,t,"A",14,"I2S0_DI",0)
elseif o==3 then
fill_M2351_UART(e,t,"A",14,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M2351_SPI(e,t,"A",14,"SPI2_MISO",3)
fill_M2351_SPI_IO(e,t,3,true)
elseif o==6 then
fill_M2351_I2C(e,t,"A",14,"I2C2_SCL",2)
elseif o==7 then
fill_M2351_SC(e,t,"A",14,"SC2_DAT",2)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC2_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==11 then
fill_M2351_BPWM(e,t,"A",14,"BPWM1_CH4",1,4)
elseif o==12 then
fill_M2351_QEI(e,t,"A",14,"QEI1_B",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M2351_USB(e,t,"A",14,"USB_D+")
else
fill_invalid_GPIO(e,t,"A",14)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"USB_OTG_ID","EPWM0_SYNC_IN","BPWM1_CH5","SC2_CLK","I2C2_SDA","SPI2_MOSI","UART0_RXD","I2S0_DO","PA.15"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],28),15)
if o==0 then
fill_M2351_GPIO(e,t,"A",15)
elseif o==2 then
fill_M2351_I2S(e,t,"A",15,"I2S0_DO",0)
elseif o==3 then
fill_M2351_UART(e,t,"A",15,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_M2351_SPI(e,t,"A",15,"SPI2_MOSI",3)
fill_M2351_SPI_IO(e,t,3,false)
elseif o==6 then
fill_M2351_I2C(e,t,"A",15,"I2C2_SDA",2)
elseif o==7 then
fill_M2351_SC(e,t,"A",15,"SC2_CLK",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M2351_BPWM(e,t,"A",15,"BPWM1_CH5",1,5)
elseif o==12 then
fill_M2351_EPWM(e,t,"A",15,"EPWM0_SYNC_IN",0)
elseif o==14 then
fill_M2351_Normal(e,t,"A",15,"USB_OTG_ID")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"A",15)
end
a[48]=e
e={}
e["pin_no"]="49"
e["texts"]={"VSS"}
fill_M2351_Normal(e,t,nil,nil,"VSS")
a[49]=e
e={}
e["pin_no"]="50"
e["texts"]={"Vsw"}
fill_M2351_Normal(e,t,nil,nil,"Vsw")
a[50]=e
e={}
e["pin_no"]="51"
e["texts"]={"VDD"}
fill_M2351_Normal(e,t,nil,nil,"VDD")
a[51]=e
e={}
e["pin_no"]="52"
e["texts"]={"LDO_CAP"}
fill_M2351_Normal(e,t,nil,nil,"LDO_CAP")
a[52]=e
e={}
e["pin_no"]="53"
e["texts"]={"USB_VBUS_EN","TM0_EXT","EPWM1_CH0","I2C2_SMBAL","UART3_TXD","UART0_nCTS","USCI0_CTL1","SPI0_SS","SC1_PWR","EBI_AD12","EADC0_CH15","PB.15"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],28),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",15)
elseif o==1 then
fill_M2351_Analog(e,t,"B",15,"EADC0_CH15",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",15,"EBI_AD12")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_SC(e,t,"B",15,"SC1_PWR",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_SPI(e,t,"B",15,"SPI0_SS",1)
elseif o==5 then
fill_M2351_USCI(e,t,"B",15,"USCI0_CTL1",0)
elseif o==6 then
fill_M2351_UART(e,t,"B",15,"UART0_nCTS",0)
elseif o==7 then
fill_M2351_UART(e,t,"B",15,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_I2C(e,t,"B",15,"I2C2_SMBAL",2)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",15,"EPWM1_CH0",1,0)
elseif o==13 then
fill_M2351_TM(e,t,"B",15,"TM0_EXT",0)
elseif o==14 then
fill_M2351_Normal(e,t,"B",15,"USB_VBUS_EN")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"B",15)
end
a[53]=e
e={}
e["pin_no"]="54"
e["texts"]={"USB_VBUS_ST","CLKO","TM1_EXT","EPWM1_CH1","I2C2_SMBSUS","UART3_RXD","UART0_nRTS","USCI0_DAT1","SPI0_CLK","SC1_RST","EBI_AD13","EADC0_CH14","PB.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],24),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",14)
elseif o==1 then
fill_M2351_Analog(e,t,"B",14,"EADC0_CH14",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",14,"EBI_AD13")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_SC(e,t,"B",14,"SC1_RST",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_SPI(e,t,"B",14,"SPI0_CLK",1)
elseif o==5 then
fill_M2351_USCI(e,t,"B",14,"USCI0_DAT1",0)
fill_M2351_USCI_IO(e,t,0,1)
elseif o==6 then
fill_M2351_UART(e,t,"B",14,"UART0_nRTS",0)
elseif o==7 then
fill_M2351_UART(e,t,"B",14,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M2351_I2C(e,t,"B",14,"I2C2_SMBSUS",2)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",14,"EPWM1_CH1",1,1)
elseif o==13 then
fill_M2351_TM(e,t,"B",14,"TM1_EXT",1)
elseif o==14 then
fill_M2351_CLKO(e,t,"B",14,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==15 then
fill_M2351_Normal(e,t,"B",14,"USB_VBUS_ST")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"B",14)
end
a[54]=e
e={}
e["pin_no"]="55"
e["texts"]={"TM2_EXT","EPWM1_CH2","I2C2_SCL","UART3_nRTS","UART0_TXD","USCI0_DAT0","SPI0_MISO","SC1_DAT","EBI_AD14","ACMP1_P3","ACMP0_P3","DAC1_OUT","EADC0_CH13","PB.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],20),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",13)
elseif o==1 then
fill_M2351_Analog(e,t,"B",13,"ACMP1_P3,ACMP0_P3,DAC1_OUT,EADC0_CH13",{0},{1},{0,1})
e["highlight_text"]="ACMP1_P3,ACMP0_P3,DAC1_OUT,EADC0_CH13"
e["texts"]={"TM2_EXT","EPWM1_CH2","I2C2_SCL","UART3_nRTS","UART0_TXD","USCI0_DAT0","SPI0_MISO","SC1_DAT","EBI_AD14","ACMP1_P3,ACMP0_P3,DAC1_OUT,EADC0_CH13","PB.13"}
elseif o==2 then
fill_M2351_EBI(e,t,"B",13,"EBI_AD14")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_SC(e,t,"B",13,"SC1_DAT",1)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC1_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==4 then
fill_M2351_SPI(e,t,"B",13,"SPI0_MISO",1)
fill_M2351_SPI_IO(e,t,1,true)
elseif o==5 then
fill_M2351_USCI(e,t,"B",13,"USCI0_DAT0",0)
fill_M2351_USCI_IO(e,t,0,0)
elseif o==6 then
fill_M2351_UART(e,t,"B",13,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_UART(e,t,"B",13,"UART3_nRTS",3)
elseif o==8 then
fill_M2351_I2C(e,t,"B",13,"I2C2_SCL",2)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",13,"EPWM1_CH2",1,2)
elseif o==13 then
fill_M2351_TM(e,t,"B",13,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[55]=e
e={}
e["pin_no"]="56"
e["texts"]={"TM3_EXT","EPWM1_CH3","SD0_nCD","I2C2_SDA","UART3_nCTS","UART0_RXD","USCI0_CLK","SPI0_MOSI","SC1_CLK","EBI_AD15","ACMP1_P2","ACMP0_P2","DAC0_OUT","EADC0_CH12","PB.12"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],16),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",12)
elseif o==1 then
fill_M2351_Analog(e,t,"B",12,"ACMP1_P2,ACMP0_P2,DAC0_OUT,EADC0_CH12",{0},{0},{0,1})
e["highlight_text"]="ACMP1_P2,ACMP0_P2,DAC0_OUT,EADC0_CH12"
e["texts"]={"TM3_EXT","EPWM1_CH3","SD0_nCD","I2C2_SDA","UART3_nCTS","UART0_RXD","USCI0_CLK","SPI0_MOSI","SC1_CLK","EBI_AD15","ACMP1_P2,ACMP0_P2,DAC0_OUT,EADC0_CH12","PB.12"}
elseif o==2 then
fill_M2351_EBI(e,t,"B",12,"EBI_AD15")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M2351_SC(e,t,"B",12,"SC1_CLK",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_SPI(e,t,"B",12,"SPI0_MOSI",1)
fill_M2351_SPI_IO(e,t,1,false)
elseif o==5 then
fill_M2351_USCI(e,t,"B",12,"USCI0_CLK",0)
elseif o==6 then
fill_M2351_UART(e,t,"B",12,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M2351_UART(e,t,"B",12,"UART3_nCTS",3)
elseif o==8 then
fill_M2351_I2C(e,t,"B",12,"I2C2_SDA",2)
elseif o==9 then
fill_M2351_SD(e,t,"B",12,"SD0_nCD",0)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",12,"EPWM1_CH3",1,3)
elseif o==13 then
fill_M2351_TM(e,t,"B",12,"TM3_EXT",3)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[56]=e
e={}
e["pin_no"]="57"
e["texts"]={"AVDD"}
fill_M2351_Normal(e,t,nil,nil,"AVDD")
a[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"VREF"}
fill_M2351_Normal(e,t,nil,nil,"VREF")
a[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"AVSS"}
fill_M2351_Normal(e,t,nil,nil,"AVSS")
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"SPI3_CLK","BPWM1_CH0","SPI0_I2SMCLK","I2C1_SCL","UART4_TXD","UART0_nCTS","EBI_ADR16","EADC0_CH11","PB.11"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],12),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",11)
elseif o==1 then
fill_M2351_Analog(e,t,"B",11,"EADC0_CH11",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",11,"EBI_ADR16")
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M2351_UART(e,t,"B",11,"UART0_nCTS",0)
elseif o==6 then
fill_M2351_UART(e,t,"B",11,"UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M2351_I2C(e,t,"B",11,"I2C1_SCL",1)
elseif o==9 then
fill_M2351_SPI(e,t,"B",11,"SPI0_I2SMCLK",1)
elseif o==10 then
fill_M2351_BPWM(e,t,"B",11,"BPWM1_CH0",1,0)
elseif o==11 then
fill_M2351_SPI(e,t,"B",11,"SPI3_CLK",4)
else
fill_invalid_GPIO(e,t,"B",11)
end
a[60]=e
e={}
e["pin_no"]="61"
e["texts"]={"SPI3_SS","BPWM1_CH1","I2C1_SDA","UART4_RXD","UART0_nRTS","USCI1_CTL0","EBI_ADR17","EADC0_CH10","PB.10"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],8),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",10)
elseif o==1 then
fill_M2351_Analog(e,t,"B",10,"EADC0_CH10",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",10,"EBI_ADR17")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_USCI(e,t,"B",10,"USCI1_CTL0",1)
elseif o==5 then
fill_M2351_UART(e,t,"B",10,"UART0_nRTS",0)
elseif o==6 then
fill_M2351_UART(e,t,"B",10,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M2351_I2C(e,t,"B",10,"I2C1_SDA",1)
elseif o==10 then
fill_M2351_BPWM(e,t,"B",10,"BPWM1_CH1",1,1)
elseif o==11 then
fill_M2351_SPI(e,t,"B",10,"SPI3_SS",4)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[61]=e
e={}
e["pin_no"]="62"
e["texts"]={"INT7","SPI3_MISO","BPWM1_CH2","I2C1_SMBAL","UART1_nCTS","UART0_TXD","USCI1_CTL1","EBI_ADR18","EADC0_CH9","PB.9"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],4),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",9)
elseif o==1 then
fill_M2351_Analog(e,t,"B",9,"EADC0_CH9",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",9,"EBI_ADR18")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_USCI(e,t,"B",9,"USCI1_CTL1",1)
elseif o==5 then
fill_M2351_UART(e,t,"B",9,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M2351_UART(e,t,"B",9,"UART1_nCTS",1)
elseif o==7 then
fill_M2351_I2C(e,t,"B",9,"I2C1_SMBAL",1)
elseif o==10 then
fill_M2351_BPWM(e,t,"B",9,"BPWM1_CH2",1,2)
elseif o==11 then
fill_M2351_SPI(e,t,"B",9,"SPI3_MISO",4)
fill_M2351_SPI_IO(e,t,4,true)
elseif o==13 then
fill_M2351_Normal(e,t,"B",9,"INT7")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",9)
end
a[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"INT6","SPI3_MOSI","BPWM1_CH3","I2C1_SMBSUS","UART1_nRTS","UART0_RXD","USCI1_CLK","EBI_ADR19","EADC0_CH8","PB.8"}
local o=ext.band(t["SYS_SYS_GPB_MFPH"],15)
if o==0 then
fill_M2351_GPIO(e,t,"B",8)
elseif o==1 then
fill_M2351_Analog(e,t,"B",8,"EADC0_CH8",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",8,"EBI_ADR19")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_USCI(e,t,"B",8,"USCI1_CLK",1)
elseif o==5 then
fill_M2351_UART(e,t,"B",8,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M2351_UART(e,t,"B",8,"UART1_nRTS",1)
elseif o==7 then
fill_M2351_I2C(e,t,"B",8,"I2C1_SMBSUS",1)
elseif o==10 then
fill_M2351_BPWM(e,t,"B",8,"BPWM1_CH3",1,3)
elseif o==11 then
fill_M2351_SPI(e,t,"B",8,"SPI3_MOSI",4)
fill_M2351_SPI_IO(e,t,4,false)
elseif o==13 then
fill_M2351_Normal(e,t,"B",8,"INT6")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",8)
end
a[63]=e
e={}
e["pin_no"]="64"
e["texts"]={"ACMP0_O","USB_VBUS_ST","INT5","EPWM1_CH4","EPWM1_BRAKE0","BPWM1_CH4","EBI_nCS0","UART1_TXD","USCI1_DAT0","EBI_nWRL","EADC0_CH7","PB.7"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],28),15)
if o==0 then
fill_M2351_GPIO(e,t,"B",7)
elseif o==1 then
fill_M2351_Analog(e,t,"B",7,"EADC0_CH7",{0},nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M2351_EBI(e,t,"B",7,"EBI_nWRL")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M2351_USCI(e,t,"B",7,"USCI1_DAT0",1)
fill_M2351_USCI_IO(e,t,1,0)
elseif o==6 then
fill_M2351_UART(e,t,"B",7,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M2351_EBI(e,t,"B",7,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M2351_BPWM(e,t,"B",7,"BPWM1_CH4",1,4)
elseif o==11 then
fill_M2351_EPWM(e,t,"B",7,"EPWM1_BRAKE0",1)
elseif o==12 then
fill_M2351_EPWM(e,t,"B",7,"EPWM1_CH4",1,4)
elseif o==13 then
fill_M2351_Normal(e,t,"B",7,"INT5")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M2351_Normal(e,t,"B",7,"USB_VBUS_ST")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
elseif o==15 then
fill_M2351_ACMP(e,t,"B",7,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",7)
end
a[64]=e
return{name=i,information="",pins=a}
end
