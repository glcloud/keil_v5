local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M480.lua")
function get_chip_status_M480LD_AE_QFN33(i,e,t,o)
local a={}
local t=read_M480_Registers(i,e,t,o)
local e
e={}
e["pin_no"]="1"
e["texts"]={"PB.5","EADC0_CH5","ACMP1_N","EBI_ADR0","SD0_DAT3","SPI1_MISO","I2C0_SCL","UART5_TXD","SC0_CLK","I2S0_BCLK","EPWM0_CH0","UART2_TXD","TM0","INT0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],20),15)
if o==0 then
fill_M480_GPIO(e,t,"B",5)
elseif o==1 then
fill_M480_Analog(e,t,"B",5,"EADC0_CH5,ACMP1_N",{0},nil,{1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH5,ACMP1_N"
e["texts"]={"PB.5","EADC0_CH5,ACMP1_N","EBI_ADR0","SD0_DAT3","SPI1_MISO","I2C0_SCL","UART5_TXD","SC0_CLK","I2S0_BCLK","EPWM0_CH0","UART2_TXD","TM0","INT0"}
elseif o==2 then
fill_M480_EBI(e,t,"B",5,"EBI_ADR0")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_SD(e,t,"B",5,"SD0_DAT3",0)
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_M480_SPI(e,t,"B",5,"SPI1_MISO",2)
fill_M480_SPI_IO(e,t,2,true)
elseif o==6 then
fill_M480_I2C(e,t,"B",5,"I2C0_SCL",0)
elseif o==7 then
fill_M480_UART(e,t,"B",5,"UART5_TXD",5)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M480_SC(e,t,"B",5,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M480_I2S(e,t,"B",5,"I2S0_BCLK",0)
elseif o==11 then
fill_M480_EPWM(e,t,"B",5,"EPWM0_CH0",0,0)
elseif o==12 then
fill_M480_UART(e,t,"B",5,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==14 then
fill_M480_TM(e,t,"B",5,"TM0",0)
elseif o==15 then
fill_M480_Normal(e,t,"B",5,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",5)
end
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"PB.4","EADC0_CH4","ACMP1_P1","EBI_ADR1","SD0_DAT2","SPI1_MOSI","I2C0_SDA","UART5_RXD","SC0_DAT","I2S0_MCLK","EPWM0_CH1","UART2_RXD","TM1","INT1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],16),15)
if o==0 then
fill_M480_GPIO(e,t,"B",4)
elseif o==1 then
fill_M480_Analog(e,t,"B",4,"EADC0_CH4,ACMP1_P1",{0},nil,{1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH4,ACMP1_P1"
e["texts"]={"PB.4","EADC0_CH4,ACMP1_P1","EBI_ADR1","SD0_DAT2","SPI1_MOSI","I2C0_SDA","UART5_RXD","SC0_DAT","I2S0_MCLK","EPWM0_CH1","UART2_RXD","TM1","INT1"}
elseif o==2 then
fill_M480_EBI(e,t,"B",4,"EBI_ADR1")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_SD(e,t,"B",4,"SD0_DAT2",0)
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_M480_SPI(e,t,"B",4,"SPI1_MOSI",2)
fill_M480_SPI_IO(e,t,2,false)
elseif o==6 then
fill_M480_I2C(e,t,"B",4,"I2C0_SDA",0)
elseif o==7 then
fill_M480_UART(e,t,"B",4,"UART5_RXD",5)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M480_SC(e,t,"B",4,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==10 then
fill_M480_I2S(e,t,"B",4,"I2S0_MCLK",0)
elseif o==11 then
fill_M480_EPWM(e,t,"B",4,"EPWM0_CH1",0,1)
elseif o==12 then
fill_M480_UART(e,t,"B",4,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M480_TM(e,t,"B",4,"TM1",1)
elseif o==15 then
fill_M480_Normal(e,t,"B",4,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",4)
end
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"PB.3","EADC0_CH3","EADC1_CH11","ACMP0_N","EBI_ADR2","SD0_DAT1","SPI1_CLK","UART1_TXD","UART5_nRTS","SC0_RST","I2S0_DI","EPWM0_CH2","I2C1_SCL","TM2","INT2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],12),15)
if o==0 then
fill_M480_GPIO(e,t,"B",3)
elseif o==1 then
fill_M480_Analog(e,t,"B",3,"EADC0_CH3,EADC1_CH11,ACMP0_N",{0,1},nil,{0},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH3,EADC1_CH11,ACMP0_N"
e["texts"]={"PB.3","EADC0_CH3,EADC1_CH11,ACMP0_N","EBI_ADR2","SD0_DAT1","SPI1_CLK","UART1_TXD","UART5_nRTS","SC0_RST","I2S0_DI","EPWM0_CH2","I2C1_SCL","TM2","INT2"}
elseif o==2 then
fill_M480_EBI(e,t,"B",3,"EBI_ADR2")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_SD(e,t,"B",3,"SD0_DAT1",0)
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_M480_SPI(e,t,"B",3,"SPI1_CLK",2)
elseif o==6 then
fill_M480_UART(e,t,"B",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M480_UART(e,t,"B",3,"UART5_nRTS",5)
elseif o==9 then
fill_M480_SC(e,t,"B",3,"SC0_RST",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M480_I2S(e,t,"B",3,"I2S0_DI",0)
elseif o==11 then
fill_M480_EPWM(e,t,"B",3,"EPWM0_CH2",0,2)
elseif o==12 then
fill_M480_I2C(e,t,"B",3,"I2C1_SCL",1)
elseif o==14 then
fill_M480_TM(e,t,"B",3,"TM2",2)
elseif o==15 then
fill_M480_Normal(e,t,"B",3,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",3)
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"PB.2","EADC0_CH2","EADC1_CH10","ACMP0_P1","EBI_ADR3","SD0_DAT0","SPI1_SS","UART1_RXD","UART5_nCTS","SC0_PWR","I2S0_DO","EPWM0_CH3","I2C1_SDA","TM3","INT3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],8),15)
if o==0 then
fill_M480_GPIO(e,t,"B",2)
elseif o==1 then
fill_M480_Analog(e,t,"B",2,"EADC0_CH2,EADC1_CH10,ACMP0_P1",{0,1},nil,{0},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH2,EADC1_CH10,ACMP0_P1"
e["texts"]={"PB.2","EADC0_CH2,EADC1_CH10,ACMP0_P1","EBI_ADR3","SD0_DAT0","SPI1_SS","UART1_RXD","UART5_nCTS","SC0_PWR","I2S0_DO","EPWM0_CH3","I2C1_SDA","TM3","INT3"}
elseif o==2 then
fill_M480_EBI(e,t,"B",2,"EBI_ADR3")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_SD(e,t,"B",2,"SD0_DAT0",0)
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_M480_SPI(e,t,"B",2,"SPI1_SS",2)
elseif o==6 then
fill_M480_UART(e,t,"B",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M480_UART(e,t,"B",2,"UART5_nCTS",5)
elseif o==9 then
fill_M480_SC(e,t,"B",2,"SC0_PWR",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M480_I2S(e,t,"B",2,"I2S0_DO",0)
elseif o==11 then
fill_M480_EPWM(e,t,"B",2,"EPWM0_CH3",0,3)
elseif o==12 then
fill_M480_I2C(e,t,"B",2,"I2C1_SDA",1)
elseif o==14 then
fill_M480_TM(e,t,"B",2,"TM3",3)
elseif o==15 then
fill_M480_Normal(e,t,"B",2,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",2)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"PB.1","EADC0_CH1","EADC1_CH9","EBI_ADR8","SD0_CLK","SPI1_I2SMCLK","UART2_TXD","I2C1_SCL","I2S0_LRCK","EPWM0_CH4","EPWM1_CH4","EPWM0_BRAKE0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],4),15)
if o==0 then
fill_M480_GPIO(e,t,"B",1)
elseif o==1 then
fill_M480_Analog(e,t,"B",1,"EADC0_CH1,EADC1_CH9",{0,1},nil,nil,nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH1,EADC1_CH9"
e["texts"]={"PB.1","EADC0_CH1,EADC1_CH9","EBI_ADR8","SD0_CLK","SPI1_I2SMCLK","UART2_TXD","I2C1_SCL","I2S0_LRCK","EPWM0_CH4","EPWM1_CH4","EPWM0_BRAKE0"}
elseif o==2 then
fill_M480_EBI(e,t,"B",1,"EBI_ADR8")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_SD(e,t,"B",1,"SD0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M480_SPI(e,t,"B",1,"SPI1_I2SMCLK",2)
elseif o==7 then
fill_M480_UART(e,t,"B",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M480_I2C(e,t,"B",1,"I2C1_SCL",1)
elseif o==10 then
fill_M480_I2S(e,t,"B",1,"I2S0_LRCK",0)
elseif o==11 then
fill_M480_EPWM(e,t,"B",1,"EPWM0_CH4",0,4)
elseif o==12 then
fill_M480_EPWM(e,t,"B",1,"EPWM1_CH4",1,4)
elseif o==13 then
fill_M480_EPWM(e,t,"B",1,"EPWM0_BRAKE0",0)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"PB.0","EADC0_CH0","EADC1_CH8","EBI_ADR9","SD0_CMD","SPI2_I2SMCLK","UART2_RXD","SPI0_I2SMCLK","I2C1_SDA","EPWM0_CH5","EPWM1_CH5","EPWM0_BRAKE1"}
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
if o==0 then
fill_M480_GPIO(e,t,"B",0)
elseif o==1 then
fill_M480_Analog(e,t,"B",0,"EADC0_CH0,EADC1_CH8",{0,1},nil,nil,nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH0,EADC1_CH8"
e["texts"]={"PB.0","EADC0_CH0,EADC1_CH8","EBI_ADR9","SD0_CMD","SPI2_I2SMCLK","UART2_RXD","SPI0_I2SMCLK","I2C1_SDA","EPWM0_CH5","EPWM1_CH5","EPWM0_BRAKE1"}
elseif o==2 then
fill_M480_EBI(e,t,"B",0,"EBI_ADR9")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_SD(e,t,"B",0,"SD0_CMD",0)
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M480_SPI(e,t,"B",0,"SPI2_I2SMCLK",3)
elseif o==7 then
fill_M480_UART(e,t,"B",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M480_SPI(e,t,"B",0,"SPI0_I2SMCLK",1)
elseif o==9 then
fill_M480_I2C(e,t,"B",0,"I2C1_SDA",1)
elseif o==11 then
fill_M480_EPWM(e,t,"B",0,"EPWM0_CH5",0,5)
elseif o==12 then
fill_M480_EPWM(e,t,"B",0,"EPWM1_CH5",1,5)
elseif o==13 then
fill_M480_EPWM(e,t,"B",0,"EPWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"PF.5","UART2_RXD","UART2_nCTS","EPWM0_CH0","BPWM0_CH4","EPWM0_SYNC_OUT","X32_IN","EADC0_ST"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],20),15)
if o==0 then
fill_M480_GPIO(e,t,"F",5)
elseif o==2 then
fill_M480_UART(e,t,"F",5,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M480_UART(e,t,"F",5,"UART2_nCTS",2)
elseif o==7 then
fill_M480_EPWM(e,t,"F",5,"EPWM0_CH0",0,0)
elseif o==8 then
fill_M480_BPWM(e,t,"F",5,"BPWM0_CH4",0,4)
elseif o==9 then
fill_M480_EPWM(e,t,"F",5,"EPWM0_SYNC_OUT",0)
elseif o==10 then
fill_M480_Normal(e,t,"F",5,"X32_IN")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M480_EADC(e,t,"F",5,"EADC0_ST",0)
else
fill_invalid_GPIO(e,t,"F",5)
end
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"PF.4","UART2_TXD","UART2_nRTS","EPWM0_CH1","BPWM0_CH5","X32_OUT","EADC1_ST"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],16),15)
if o==0 then
fill_M480_GPIO(e,t,"F",4)
elseif o==2 then
fill_M480_UART(e,t,"F",4,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M480_UART(e,t,"F",4,"UART2_nRTS",2)
elseif o==7 then
fill_M480_EPWM(e,t,"F",4,"EPWM0_CH1",0,1)
elseif o==8 then
fill_M480_BPWM(e,t,"F",4,"BPWM0_CH5",0,5)
elseif o==10 then
fill_M480_Normal(e,t,"F",4,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M480_EADC(e,t,"F",4,"EADC1_ST",1)
else
fill_invalid_GPIO(e,t,"F",4)
end
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"PF.3","EBI_nCS0","UART0_TXD","I2C0_SCL","XT1_IN","BPWM1_CH0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],12),15)
if o==0 then
fill_M480_GPIO(e,t,"F",3)
elseif o==2 then
fill_M480_EBI(e,t,"F",3,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_UART(e,t,"F",3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M480_I2C(e,t,"F",3,"I2C0_SCL",0)
elseif o==10 then
fill_M480_Normal(e,t,"F",3,"XT1_IN")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M480_BPWM(e,t,"F",3,"BPWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"PF.2","EBI_nCS1","UART0_RXD","I2C0_SDA","QSPI0_CLK","XT1_OUT","BPWM1_CH1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],8),15)
if o==0 then
fill_M480_GPIO(e,t,"F",2)
elseif o==2 then
fill_M480_EBI(e,t,"F",2,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_UART(e,t,"F",2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M480_I2C(e,t,"F",2,"I2C0_SDA",0)
elseif o==5 then
fill_M480_SPI(e,t,"F",2,"QSPI0_CLK",0)
elseif o==10 then
fill_M480_Normal(e,t,"F",2,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M480_BPWM(e,t,"F",2,"BPWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"F",2)
end
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"PA.3","QSPI0_SS","SPI0_SS","SC0_PWR","UART4_TXD","UART1_TXD","I2C1_SCL","I2C0_SMBAL","BPWM0_CH3","EPWM0_CH2","QEI0_B","EPWM1_BRAKE1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],12),15)
if o==0 then
fill_M480_GPIO(e,t,"A",3)
elseif o==3 then
fill_M480_SPI(e,t,"A",3,"QSPI0_SS",0)
elseif o==4 then
fill_M480_SPI(e,t,"A",3,"SPI0_SS",1)
elseif o==6 then
fill_M480_SC(e,t,"A",3,"SC0_PWR",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M480_UART(e,t,"A",3,"UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M480_UART(e,t,"A",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M480_I2C(e,t,"A",3,"I2C1_SCL",1)
elseif o==10 then
fill_M480_I2C(e,t,"A",3,"I2C0_SMBAL",0)
elseif o==12 then
fill_M480_BPWM(e,t,"A",3,"BPWM0_CH3",0,3)
elseif o==13 then
fill_M480_EPWM(e,t,"A",3,"EPWM0_CH2",0,2)
elseif o==14 then
fill_M480_QEI(e,t,"A",3,"QEI0_B",0)
e["direction"]=kPinDirection_In
elseif o==15 then
fill_M480_EPWM(e,t,"A",3,"EPWM1_BRAKE1",1)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"PA.2","QSPI0_CLK","SPI0_CLK","SC0_RST","UART4_RXD","UART1_RXD","I2C1_SDA","I2C0_SMBSUS","BPWM0_CH2","EPWM0_CH3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],8),15)
if o==0 then
fill_M480_GPIO(e,t,"A",2)
elseif o==3 then
fill_M480_SPI(e,t,"A",2,"QSPI0_CLK",0)
elseif o==4 then
fill_M480_SPI(e,t,"A",2,"SPI0_CLK",1)
elseif o==6 then
fill_M480_SC(e,t,"A",2,"SC0_RST",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M480_UART(e,t,"A",2,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M480_UART(e,t,"A",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M480_I2C(e,t,"A",2,"I2C1_SDA",1)
elseif o==10 then
fill_M480_I2C(e,t,"A",2,"I2C0_SMBSUS",0)
elseif o==12 then
fill_M480_BPWM(e,t,"A",2,"BPWM0_CH2",0,2)
elseif o==13 then
fill_M480_EPWM(e,t,"A",2,"EPWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"PA.1","QSPI0_MISO0","SPI0_MISO","SC0_DAT","UART0_TXD","UART1_nCTS","I2C2_SCL","CCAP_DATA7","BPWM0_CH1","EPWM0_CH4"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],4),15)
if o==0 then
fill_M480_GPIO(e,t,"A",1)
elseif o==3 then
fill_M480_SPI(e,t,"A",1,"QSPI0_MISO0",0)
fill_M480_SPI_IO(e,t,0,true)
elseif o==4 then
fill_M480_SPI(e,t,"A",1,"SPI0_MISO",1)
fill_M480_SPI_IO(e,t,1,true)
elseif o==6 then
fill_M480_SC(e,t,"A",1,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==7 then
fill_M480_UART(e,t,"A",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M480_UART(e,t,"A",1,"UART1_nCTS",1)
elseif o==9 then
fill_M480_I2C(e,t,"A",1,"I2C2_SCL",2)
elseif o==10 then
fill_M480_CCAP(e,t,"A",1,"CCAP_DATA7")
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M480_BPWM(e,t,"A",1,"BPWM0_CH1",0,1)
elseif o==13 then
fill_M480_EPWM(e,t,"A",1,"EPWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"PA.0","QSPI0_MOSI0","SPI0_MOSI","SC0_CLK","UART0_RXD","UART1_nRTS","I2C2_SDA","CCAP_DATA6","BPWM0_CH0","EPWM0_CH5","DAC0_ST"}
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
if o==0 then
fill_M480_GPIO(e,t,"A",0)
elseif o==3 then
fill_M480_SPI(e,t,"A",0,"QSPI0_MOSI0",0)
fill_M480_SPI_IO(e,t,0,false)
elseif o==4 then
fill_M480_SPI(e,t,"A",0,"SPI0_MOSI",1)
fill_M480_SPI_IO(e,t,1,false)
elseif o==6 then
fill_M480_SC(e,t,"A",0,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M480_UART(e,t,"A",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M480_UART(e,t,"A",0,"UART1_nRTS",1)
elseif o==9 then
fill_M480_I2C(e,t,"A",0,"I2C2_SDA",2)
elseif o==10 then
fill_M480_CCAP(e,t,"A",0,"CCAP_DATA6")
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M480_BPWM(e,t,"A",0,"BPWM0_CH0",0,0)
elseif o==13 then
fill_M480_EPWM(e,t,"A",0,"EPWM0_CH5",0,5)
elseif o==15 then
fill_M480_DAC(e,t,"A",0,"DAC0_ST",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",0)
end
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"VDDIO"}
fill_M480_Normal(e,t,nil,nil,"VDDIO")
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"nRESET"}
fill_M480_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"ICE_DAT","BPWM1_CH0","UART0_TXD","I2C1_SCL","UART1_TXD","PF.0"}
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
if o==0 then
fill_M480_GPIO(e,t,"F",0)
elseif o==2 then
fill_M480_UART(e,t,"F",0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M480_I2C(e,t,"F",0,"I2C1_SCL",1)
elseif o==4 then
fill_M480_UART(e,t,"F",0,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==12 then
fill_M480_BPWM(e,t,"F",0,"BPWM1_CH0",1,0)
elseif o==14 then
fill_M480_Normal(e,t,"F",0,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"F",0)
end
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"ICE_CLK","BPWM1_CH1","UART0_RXD","I2C1_SDA","UART1_RXD","PF.1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],4),15)
if o==0 then
fill_M480_GPIO(e,t,"F",1)
elseif o==2 then
fill_M480_UART(e,t,"F",1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M480_I2C(e,t,"F",1,"I2C1_SDA",1)
elseif o==4 then
fill_M480_UART(e,t,"F",1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M480_BPWM(e,t,"F",1,"BPWM1_CH1",1,1)
elseif o==14 then
fill_M480_Normal(e,t,"F",1,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"EADC0_ST","ACMP0_O","CCAP_DATA1","EPWM1_CH4","CAN2_TXD","I2C0_SCL","UART2_TXD","SPI1_CLK","I2S0_DO","QSPI0_MISO0","EBI_AD1","PC.1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],4),15)
if o==0 then
fill_M480_GPIO(e,t,"C",1)
elseif o==2 then
fill_M480_EBI(e,t,"C",1,"EBI_AD1")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M480_SPI(e,t,"C",1,"QSPI0_MISO0",0)
fill_M480_SPI_IO(e,t,0,true)
elseif o==6 then
fill_M480_I2S(e,t,"C",1,"I2S0_DO",0)
elseif o==7 then
fill_M480_SPI(e,t,"C",1,"SPI1_CLK",2)
elseif o==8 then
fill_M480_UART(e,t,"C",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M480_I2C(e,t,"C",1,"I2C0_SCL",0)
elseif o==10 then
fill_M480_CAN(e,t,"C",1,"CAN2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==12 then
fill_M480_EPWM(e,t,"C",1,"EPWM1_CH4",1,4)
elseif o==13 then
fill_M480_CCAP(e,t,"C",1,"CCAP_DATA1")
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M480_ACMP(e,t,"C",1,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==15 then
fill_M480_EADC(e,t,"C",1,"EADC0_ST",0)
else
fill_invalid_GPIO(e,t,"C",1)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"EADC1_ST","ACMP1_O","CCAP_DATA0","EPWM1_CH5","CAN2_RXD","I2C0_SDA","UART2_RXD","SPI1_SS","I2S0_LRCK","QSPI0_MOSI0","EBI_AD0","PC.0"}
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
if o==0 then
fill_M480_GPIO(e,t,"C",0)
elseif o==2 then
fill_M480_EBI(e,t,"C",0,"EBI_AD0")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M480_SPI(e,t,"C",0,"QSPI0_MOSI0",0)
fill_M480_SPI_IO(e,t,0,false)
elseif o==6 then
fill_M480_I2S(e,t,"C",0,"I2S0_LRCK",0)
elseif o==7 then
fill_M480_SPI(e,t,"C",0,"SPI1_SS",2)
elseif o==8 then
fill_M480_UART(e,t,"C",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M480_I2C(e,t,"C",0,"I2C0_SDA",0)
elseif o==10 then
fill_M480_CAN(e,t,"C",0,"CAN2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M480_EPWM(e,t,"C",0,"EPWM1_CH5",1,5)
elseif o==13 then
fill_M480_CCAP(e,t,"C",0,"CCAP_DATA0")
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M480_ACMP(e,t,"C",0,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==15 then
fill_M480_EADC(e,t,"C",0,"EADC1_ST",1)
else
fill_invalid_GPIO(e,t,"C",0)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"USB_VBUS","QEI1_INDEX","BPWM1_CH2","CAN0_TXD","SPI2_SS","I2C1_SCL","UART4_TXD","I2S0_BCLK","PA.12"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],16),15)
if o==0 then
fill_M480_GPIO(e,t,"A",12)
elseif o==2 then
fill_M480_I2S(e,t,"A",12,"I2S0_BCLK",0)
elseif o==3 then
fill_M480_UART(e,t,"A",12,"UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M480_I2C(e,t,"A",12,"I2C1_SCL",1)
elseif o==5 then
fill_M480_SPI(e,t,"A",12,"SPI2_SS",3)
elseif o==6 then
fill_M480_CAN(e,t,"A",12,"CAN0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M480_BPWM(e,t,"A",12,"BPWM1_CH2",1,2)
elseif o==12 then
fill_M480_QEI(e,t,"A",12,"QEI1_INDEX",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M480_Normal(e,t,"A",12,"USB_VBUS")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"A",12)
end
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"USB_D-","QEI1_A","BPWM1_CH3","CAN0_RXD","SPI2_CLK","I2C1_SDA","UART4_RXD","I2S0_MCLK","PA.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],20),15)
if o==0 then
fill_M480_GPIO(e,t,"A",13)
elseif o==2 then
fill_M480_I2S(e,t,"A",13,"I2S0_MCLK",0)
elseif o==3 then
fill_M480_UART(e,t,"A",13,"UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M480_I2C(e,t,"A",13,"I2C1_SDA",1)
elseif o==5 then
fill_M480_SPI(e,t,"A",13,"SPI2_CLK",3)
elseif o==6 then
fill_M480_CAN(e,t,"A",13,"CAN0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M480_BPWM(e,t,"A",13,"BPWM1_CH3",1,3)
elseif o==12 then
fill_M480_QEI(e,t,"A",13,"QEI1_A",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M480_USB(e,t,"A",13,"USB_D-")
else
fill_invalid_GPIO(e,t,"A",13)
end
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"USB_D+","QEI1_B","BPWM1_CH4","I2C2_SCL","SPI2_MISO","UART0_TXD","I2S0_DI","PA.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],24),15)
if o==0 then
fill_M480_GPIO(e,t,"A",14)
elseif o==2 then
fill_M480_I2S(e,t,"A",14,"I2S0_DI",0)
elseif o==3 then
fill_M480_UART(e,t,"A",14,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M480_SPI(e,t,"A",14,"SPI2_MISO",3)
fill_M480_SPI_IO(e,t,3,true)
elseif o==6 then
fill_M480_I2C(e,t,"A",14,"I2C2_SCL",2)
elseif o==11 then
fill_M480_BPWM(e,t,"A",14,"BPWM1_CH4",1,4)
elseif o==12 then
fill_M480_QEI(e,t,"A",14,"QEI1_B",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M480_USB(e,t,"A",14,"USB_D+")
else
fill_invalid_GPIO(e,t,"A",14)
end
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"USB_OTG_ID","EPWM0_SYNC_IN","BPWM1_CH5","I2C2_SDA","SPI2_MOSI","UART0_RXD","I2S0_DO","PA.15"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],28),15)
if o==0 then
fill_M480_GPIO(e,t,"A",15)
elseif o==2 then
fill_M480_I2S(e,t,"A",15,"I2S0_DO",0)
elseif o==3 then
fill_M480_UART(e,t,"A",15,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_M480_SPI(e,t,"A",15,"SPI2_MOSI",3)
fill_M480_SPI_IO(e,t,3,false)
elseif o==6 then
fill_M480_I2C(e,t,"A",15,"I2C2_SDA",2)
elseif o==11 then
fill_M480_BPWM(e,t,"A",15,"BPWM1_CH5",1,5)
elseif o==12 then
fill_M480_EPWM(e,t,"A",15,"EPWM0_SYNC_IN",0)
elseif o==14 then
fill_M480_Normal(e,t,"A",15,"USB_OTG_ID")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"A",15)
end
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"VSS"}
fill_M480_Normal(e,t,nil,nil,"VSS")
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"LDO_CAP"}
fill_M480_Normal(e,t,nil,nil,"LDO_CAP")
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"VDD"}
fill_M480_Normal(e,t,nil,nil,"VDD")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"USB_VBUS_EN","TM0_EXT","EPWM1_CH0","EPWM0_BRAKE1","I2C2_SMBAL","UART3_TXD","UART0_nCTS","SPI0_SS","EBI_AD12","EADC1_CH15","EADC0_CH15","PB.15"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],28),15)
if o==0 then
fill_M480_GPIO(e,t,"B",15)
elseif o==1 then
fill_M480_Analog(e,t,"B",15,"EADC1_CH15,EADC0_CH15",{0,1},nil,nil,nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC1_CH15,EADC0_CH15"
e["texts"]={"USB_VBUS_EN","TM0_EXT","EPWM1_CH0","EPWM0_BRAKE1","I2C2_SMBAL","UART3_TXD","UART0_nCTS","SPI0_SS","EBI_AD12","EADC1_CH15,EADC0_CH15","PB.15"}
elseif o==2 then
fill_M480_EBI(e,t,"B",15,"EBI_AD12")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M480_SPI(e,t,"B",15,"SPI0_SS",1)
elseif o==6 then
fill_M480_UART(e,t,"B",15,"UART0_nCTS",0)
elseif o==7 then
fill_M480_UART(e,t,"B",15,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M480_I2C(e,t,"B",15,"I2C2_SMBAL",2)
elseif o==10 then
fill_M480_EPWM(e,t,"B",15,"EPWM0_BRAKE1",0)
elseif o==11 then
fill_M480_EPWM(e,t,"B",15,"EPWM1_CH0",1,0)
elseif o==13 then
fill_M480_TM(e,t,"B",15,"TM0_EXT",0)
elseif o==14 then
fill_M480_Normal(e,t,"B",15,"USB_VBUS_EN")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"B",15)
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"USB_VBUS_ST","CLKO","TM1_EXT","EPWM1_CH1","I2C2_SMBSUS","UART3_RXD","UART0_nRTS","SPI0_CLK","EBI_AD13","EADC1_CH14","EADC0_CH14","PB.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],24),15)
if o==0 then
fill_M480_GPIO(e,t,"B",14)
elseif o==1 then
fill_M480_Analog(e,t,"B",14,"EADC1_CH14,EADC0_CH14",{0,1},nil,nil,nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC1_CH14,EADC0_CH14"
e["texts"]={"USB_VBUS_ST","CLKO","TM1_EXT","EPWM1_CH1","I2C2_SMBSUS","UART3_RXD","UART0_nRTS","SPI0_CLK","EBI_AD13","EADC1_CH14,EADC0_CH14","PB.14"}
elseif o==2 then
fill_M480_EBI(e,t,"B",14,"EBI_AD13")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M480_SPI(e,t,"B",14,"SPI0_CLK",1)
elseif o==6 then
fill_M480_UART(e,t,"B",14,"UART0_nRTS",0)
elseif o==7 then
fill_M480_UART(e,t,"B",14,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M480_I2C(e,t,"B",14,"I2C2_SMBSUS",2)
elseif o==11 then
fill_M480_EPWM(e,t,"B",14,"EPWM1_CH1",1,1)
elseif o==13 then
fill_M480_TM(e,t,"B",14,"TM1_EXT",1)
elseif o==14 then
fill_M480_CLKO(e,t,"B",14,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==15 then
fill_M480_Normal(e,t,"B",14,"USB_VBUS_ST")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
else
fill_invalid_GPIO(e,t,"B",14)
end
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"TM2_EXT","EPWM1_CH2","CCAP_PIXCLK","I2C2_SCL","UART3_nRTS","UART0_TXD","SPI0_MISO","EBI_AD14","ACMP1_P3","ACMP0_P3","EADC1_CH13","EADC0_CH13","PB.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],20),15)
if o==0 then
fill_M480_GPIO(e,t,"B",13)
elseif o==1 then
fill_M480_Analog(e,t,"B",13,"ACMP1_P3,ACMP0_P3,EADC1_CH13,EADC0_CH13",{0,1},nil,{0,1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="ACMP1_P3,ACMP0_P3,EADC1_CH13,EADC0_CH13"
e["texts"]={"TM2_EXT","EPWM1_CH2","CCAP_PIXCLK","I2C2_SCL","UART3_nRTS","UART0_TXD","SPI0_MISO","EBI_AD14","ACMP1_P3,ACMP0_P3,EADC1_CH13,EADC0_CH13","PB.13"}
elseif o==2 then
fill_M480_EBI(e,t,"B",13,"EBI_AD14")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M480_SPI(e,t,"B",13,"SPI0_MISO",1)
fill_M480_SPI_IO(e,t,1,true)
elseif o==6 then
fill_M480_UART(e,t,"B",13,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M480_UART(e,t,"B",13,"UART3_nRTS",3)
elseif o==8 then
fill_M480_I2C(e,t,"B",13,"I2C2_SCL",2)
elseif o==10 then
fill_M480_CCAP(e,t,"B",13,"CCAP_PIXCLK")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M480_EPWM(e,t,"B",13,"EPWM1_CH2",1,2)
elseif o==13 then
fill_M480_TM(e,t,"B",13,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"TM3_EXT","EPWM1_CH3","CCAP_SCLK","SD0_nCD","I2C2_SDA","UART3_nCTS","UART0_RXD","SPI0_MOSI","EBI_AD15","ACMP1_P2","ACMP0_P2","DAC0_OUT","EADC1_CH12","EADC0_CH12","PB.12"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],16),15)
if o==0 then
fill_M480_GPIO(e,t,"B",12)
elseif o==1 then
fill_M480_Analog(e,t,"B",12,"ACMP1_P2,ACMP0_P2,DAC0_OUT,EADC1_CH12,EADC0_CH12",{0,1},{0},{0,1},nil)
e["highlight_text"]="ACMP1_P2,ACMP0_P2,DAC0_OUT,EADC1_CH12,EADC0_CH12"
e["texts"]={"TM3_EXT","EPWM1_CH3","CCAP_SCLK","SD0_nCD","I2C2_SDA","UART3_nCTS","UART0_RXD","SPI0_MOSI","EBI_AD15","ACMP1_P2,ACMP0_P2,DAC0_OUT,EADC1_CH12,EADC0_CH12","PB.12"}
elseif o==2 then
fill_M480_EBI(e,t,"B",12,"EBI_AD15")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M480_SPI(e,t,"B",12,"SPI0_MOSI",1)
fill_M480_SPI_IO(e,t,1,false)
elseif o==6 then
fill_M480_UART(e,t,"B",12,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M480_UART(e,t,"B",12,"UART3_nCTS",3)
elseif o==8 then
fill_M480_I2C(e,t,"B",12,"I2C2_SDA",2)
elseif o==9 then
fill_M480_SD(e,t,"B",12,"SD0_nCD",0)
e["direction"]=kPinDirection_In
elseif o==10 then
fill_M480_CCAP(e,t,"B",12,"CCAP_SCLK")
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M480_EPWM(e,t,"B",12,"EPWM1_CH3",1,3)
elseif o==13 then
fill_M480_TM(e,t,"B",12,"TM3_EXT",3)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"AVDD"}
fill_M480_Normal(e,t,nil,nil,"AVDD")
a[32]=e
return{name=i,information="",pins=a}
end