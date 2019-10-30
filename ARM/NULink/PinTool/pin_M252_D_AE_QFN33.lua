local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M251.lua")
function get_chip_status_M252_D_AE_QFN33(i,e,t,o)
local a={}
local t=read_M251_Registers(i,e,t,o)
local e
e={}
e["pin_no"]="1"
e["texts"]={"PB.5","EADC0_CH5","ACMP1_N","I2C0_SCL","USCI1_CTL0","SC0_CLK","PWM0_CH0","UART2_TXD","TM0","INT0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"B",5)
elseif o==1 then
fill_M251_Analog(e,t,"B",5,"EADC0_CH5,ACMP1_N",{0},nil,{1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH5,ACMP1_N"
e["texts"]={"PB.5","EADC0_CH5,ACMP1_N","I2C0_SCL","USCI1_CTL0","SC0_CLK","PWM0_CH0","UART2_TXD","TM0","INT0"}
elseif o==6 then
fill_M251_I2C(e,t,"B",5,"I2C0_SCL",0)
elseif o==8 then
fill_M251_USCI(e,t,"B",5,"USCI1_CTL0",1)
elseif o==9 then
fill_M251_SC(e,t,"B",5,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M251_PWM(e,t,"B",5,"PWM0_CH0",0,0)
elseif o==13 then
fill_M251_UART(e,t,"B",5,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==14 then
fill_M251_TM(e,t,"B",5,"TM0",0)
elseif o==15 then
fill_M251_Normal(e,t,"B",5,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",5)
end
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"PB.4","EADC0_CH4","ACMP1_P1","I2C0_SDA","USCI1_CTL1","SC0_DAT","PWM0_CH1","UART2_RXD","TM1","INT1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"B",4)
elseif o==1 then
fill_M251_Analog(e,t,"B",4,"EADC0_CH4,ACMP1_P1",{0},nil,{1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH4,ACMP1_P1"
e["texts"]={"PB.4","EADC0_CH4,ACMP1_P1","I2C0_SDA","USCI1_CTL1","SC0_DAT","PWM0_CH1","UART2_RXD","TM1","INT1"}
elseif o==6 then
fill_M251_I2C(e,t,"B",4,"I2C0_SDA",0)
elseif o==8 then
fill_M251_USCI(e,t,"B",4,"USCI1_CTL1",1)
elseif o==9 then
fill_M251_SC(e,t,"B",4,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==11 then
fill_M251_PWM(e,t,"B",4,"PWM0_CH1",0,1)
elseif o==13 then
fill_M251_UART(e,t,"B",4,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M251_TM(e,t,"B",4,"TM1",1)
elseif o==15 then
fill_M251_Normal(e,t,"B",4,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",4)
end
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"PB.3","EADC0_CH3","ACMP0_N","I2C1_SCL","UART1_TXD","USCI1_DAT1","SC0_RST","PWM0_CH2","PWM0_BRAKE0","TM2","INT2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"B",3)
elseif o==1 then
fill_M251_Analog(e,t,"B",3,"EADC0_CH3,ACMP0_N",{0},nil,{0},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH3,ACMP0_N"
e["texts"]={"PB.3","EADC0_CH3,ACMP0_N","I2C1_SCL","UART1_TXD","USCI1_DAT1","SC0_RST","PWM0_CH2","PWM0_BRAKE0","TM2","INT2"}
elseif o==4 then
fill_M251_I2C(e,t,"B",3,"I2C1_SCL",1)
elseif o==6 then
fill_M251_UART(e,t,"B",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M251_USCI(e,t,"B",3,"USCI1_DAT1",1)
fill_M251_USCI_IO(e,t,1,1)
elseif o==9 then
fill_M251_SC(e,t,"B",3,"SC0_RST",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M251_PWM(e,t,"B",3,"PWM0_CH2",0,2)
elseif o==13 then
fill_M251_PWM(e,t,"B",3,"PWM0_BRAKE0",0)
elseif o==14 then
fill_M251_TM(e,t,"B",3,"TM2",2)
elseif o==15 then
fill_M251_Normal(e,t,"B",3,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",3)
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"PB.2","EADC0_CH2","ACMP0_P1","I2C1_SDA","UART1_RXD","USCI1_DAT0","SC0_PWR","PWM0_CH3","TM3","INT3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"B",2)
elseif o==1 then
fill_M251_Analog(e,t,"B",2,"EADC0_CH2,ACMP0_P1",{0},nil,{0},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH2,ACMP0_P1"
e["texts"]={"PB.2","EADC0_CH2,ACMP0_P1","I2C1_SDA","UART1_RXD","USCI1_DAT0","SC0_PWR","PWM0_CH3","TM3","INT3"}
elseif o==4 then
fill_M251_I2C(e,t,"B",2,"I2C1_SDA",1)
elseif o==6 then
fill_M251_UART(e,t,"B",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M251_USCI(e,t,"B",2,"USCI1_DAT0",1)
fill_M251_USCI_IO(e,t,1,0)
elseif o==9 then
fill_M251_SC(e,t,"B",2,"SC0_PWR",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M251_PWM(e,t,"B",2,"PWM0_CH3",0,3)
elseif o==14 then
fill_M251_TM(e,t,"B",2,"TM3",3)
elseif o==15 then
fill_M251_Normal(e,t,"B",2,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",2)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"PB.1","EADC0_CH1","UART2_TXD","USCI1_CLK","I2C1_SCL","QSPI0_MISO1","PWM0_CH4","PWM1_CH4","PWM0_BRAKE0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"B",1)
elseif o==1 then
fill_M251_Analog(e,t,"B",1,"EADC0_CH1",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M251_UART(e,t,"B",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M251_USCI(e,t,"B",1,"USCI1_CLK",1)
elseif o==9 then
fill_M251_I2C(e,t,"B",1,"I2C1_SCL",1)
elseif o==10 then
fill_M251_SPI(e,t,"B",1,"QSPI0_MISO1",0)
fill_M251_SPI_IO(e,t,0,true)
elseif o==11 then
fill_M251_PWM(e,t,"B",1,"PWM0_CH4",0,4)
elseif o==12 then
fill_M251_PWM(e,t,"B",1,"PWM1_CH4",1,4)
elseif o==13 then
fill_M251_PWM(e,t,"B",1,"PWM0_BRAKE0",0)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"PB.0","EADC0_CH0","UART2_RXD","SPI0_I2SMCLK","I2C1_SDA","QSPI0_MOSI1","PWM0_CH5","PWM1_CH5","PWM0_BRAKE1"}
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"B",0)
elseif o==1 then
fill_M251_Analog(e,t,"B",0,"EADC0_CH0",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M251_UART(e,t,"B",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M251_SPI(e,t,"B",0,"SPI0_I2SMCLK",1)
elseif o==9 then
fill_M251_I2C(e,t,"B",0,"I2C1_SDA",1)
elseif o==10 then
fill_M251_SPI(e,t,"B",0,"QSPI0_MOSI1",0)
fill_M251_SPI_IO(e,t,0,false)
elseif o==11 then
fill_M251_PWM(e,t,"B",0,"PWM0_CH5",0,5)
elseif o==12 then
fill_M251_PWM(e,t,"B",0,"PWM1_CH5",1,5)
elseif o==13 then
fill_M251_PWM(e,t,"B",0,"PWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"PF.5","UART2_RXD","UART2_nCTS","PWM0_CH0","BPWM0_CH4","X32_IN","EADC0_ST"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"F",5)
elseif o==2 then
fill_M251_UART(e,t,"F",5,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M251_UART(e,t,"F",5,"UART2_nCTS",2)
elseif o==7 then
fill_M251_PWM(e,t,"F",5,"PWM0_CH0",0,0)
elseif o==8 then
fill_M251_BPWM(e,t,"F",5,"BPWM0_CH4",0,4)
elseif o==10 then
fill_M251_Normal(e,t,"F",5,"X32_IN")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M251_EADC(e,t,"F",5,"EADC0_ST",0)
else
fill_invalid_GPIO(e,t,"F",5)
end
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"PF.4","UART2_TXD","UART2_nRTS","PWM0_CH1","BPWM0_CH5","X32_OUT"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"F",4)
elseif o==2 then
fill_M251_UART(e,t,"F",4,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_UART(e,t,"F",4,"UART2_nRTS",2)
elseif o==7 then
fill_M251_PWM(e,t,"F",4,"PWM0_CH1",0,1)
elseif o==8 then
fill_M251_BPWM(e,t,"F",4,"BPWM0_CH5",0,5)
elseif o==10 then
fill_M251_Normal(e,t,"F",4,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"F",4)
end
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"PF.3","UART0_TXD","I2C0_SCL","XT1_IN","BPWM1_CH0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"F",3)
elseif o==3 then
fill_M251_UART(e,t,"F",3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_I2C(e,t,"F",3,"I2C0_SCL",0)
elseif o==10 then
fill_M251_Normal(e,t,"F",3,"XT1_IN")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M251_BPWM(e,t,"F",3,"BPWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"PF.2","UART0_RXD","I2C0_SDA","QSPI0_CLK","XT1_OUT","BPWM1_CH1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"F",2)
elseif o==3 then
fill_M251_UART(e,t,"F",2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M251_I2C(e,t,"F",2,"I2C0_SDA",0)
elseif o==5 then
fill_M251_SPI(e,t,"F",2,"QSPI0_CLK",0)
elseif o==10 then
fill_M251_Normal(e,t,"F",2,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M251_BPWM(e,t,"F",2,"BPWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"F",2)
end
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"PA.3","QSPI0_SS","SPI0_SS","SC0_PWR","I2C0_SMBAL","UART1_TXD","I2C1_SCL","BPWM0_CH3","PWM0_CH2","CLKO","PWM1_BRAKE1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"A",3)
elseif o==3 then
fill_M251_SPI(e,t,"A",3,"QSPI0_SS",0)
elseif o==4 then
fill_M251_SPI(e,t,"A",3,"SPI0_SS",1)
elseif o==6 then
fill_M251_SC(e,t,"A",3,"SC0_PWR",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M251_I2C(e,t,"A",3,"I2C0_SMBAL",0)
elseif o==8 then
fill_M251_UART(e,t,"A",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M251_I2C(e,t,"A",3,"I2C1_SCL",1)
elseif o==12 then
fill_M251_BPWM(e,t,"A",3,"BPWM0_CH3",0,3)
elseif o==13 then
fill_M251_PWM(e,t,"A",3,"PWM0_CH2",0,2)
elseif o==14 then
fill_M251_CLKO(e,t,"A",3,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==15 then
fill_M251_PWM(e,t,"A",3,"PWM1_BRAKE1",1)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"PA.2","QSPI0_CLK","SPI0_CLK","SC0_RST","I2C0_SMBSUS","UART1_RXD","I2C1_SDA","BPWM0_CH2","PWM0_CH3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"A",2)
elseif o==3 then
fill_M251_SPI(e,t,"A",2,"QSPI0_CLK",0)
elseif o==4 then
fill_M251_SPI(e,t,"A",2,"SPI0_CLK",1)
elseif o==6 then
fill_M251_SC(e,t,"A",2,"SC0_RST",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M251_I2C(e,t,"A",2,"I2C0_SMBSUS",0)
elseif o==8 then
fill_M251_UART(e,t,"A",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M251_I2C(e,t,"A",2,"I2C1_SDA",1)
elseif o==12 then
fill_M251_BPWM(e,t,"A",2,"BPWM0_CH2",0,2)
elseif o==13 then
fill_M251_PWM(e,t,"A",2,"PWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"PA.1","QSPI0_MISO0","SPI0_MISO","SC0_DAT","UART0_TXD","UART1_nCTS","BPWM0_CH1","PWM0_CH4"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"A",1)
elseif o==3 then
fill_M251_SPI(e,t,"A",1,"QSPI0_MISO0",0)
fill_M251_SPI_IO(e,t,0,true)
elseif o==4 then
fill_M251_SPI(e,t,"A",1,"SPI0_MISO",1)
fill_M251_SPI_IO(e,t,1,true)
elseif o==6 then
fill_M251_SC(e,t,"A",1,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==7 then
fill_M251_UART(e,t,"A",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M251_UART(e,t,"A",1,"UART1_nCTS",1)
elseif o==12 then
fill_M251_BPWM(e,t,"A",1,"BPWM0_CH1",0,1)
elseif o==13 then
fill_M251_PWM(e,t,"A",1,"PWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"PA.0","QSPI0_MOSI0","SPI0_MOSI","SC0_CLK","UART0_RXD","UART1_nRTS","BPWM0_CH0","PWM0_CH5"}
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"A",0)
elseif o==3 then
fill_M251_SPI(e,t,"A",0,"QSPI0_MOSI0",0)
fill_M251_SPI_IO(e,t,0,false)
elseif o==4 then
fill_M251_SPI(e,t,"A",0,"SPI0_MOSI",1)
fill_M251_SPI_IO(e,t,1,false)
elseif o==6 then
fill_M251_SC(e,t,"A",0,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M251_UART(e,t,"A",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M251_UART(e,t,"A",0,"UART1_nRTS",1)
elseif o==12 then
fill_M251_BPWM(e,t,"A",0,"BPWM0_CH0",0,0)
elseif o==13 then
fill_M251_PWM(e,t,"A",0,"PWM0_CH5",0,5)
else
fill_invalid_GPIO(e,t,"A",0)
end
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"VDDIO"}
fill_M251_Normal(e,t,nil,nil,"VDDIO")
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"nRESET"}
fill_M251_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"ICE_DAT","BPWM1_CH0","UART0_TXD","I2C1_SCL","UART1_TXD","PF.0"}
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"F",0)
elseif o==2 then
fill_M251_UART(e,t,"F",0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M251_I2C(e,t,"F",0,"I2C1_SCL",1)
elseif o==4 then
fill_M251_UART(e,t,"F",0,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==12 then
fill_M251_BPWM(e,t,"F",0,"BPWM1_CH0",1,0)
elseif o==14 then
fill_M251_Normal(e,t,"F",0,"ICE_DAT")
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
fill_M251_GPIO(e,t,"F",1)
elseif o==2 then
fill_M251_UART(e,t,"F",1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M251_I2C(e,t,"F",1,"I2C1_SDA",1)
elseif o==4 then
fill_M251_UART(e,t,"F",1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M251_BPWM(e,t,"F",1,"BPWM1_CH1",1,1)
elseif o==14 then
fill_M251_Normal(e,t,"F",1,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"ACMP0_O","PWM1_CH4","I2C0_SCL","UART2_TXD","QSPI0_MISO0","PC.1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"C",1)
elseif o==4 then
fill_M251_SPI(e,t,"C",1,"QSPI0_MISO0",0)
fill_M251_SPI_IO(e,t,0,true)
elseif o==8 then
fill_M251_UART(e,t,"C",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M251_I2C(e,t,"C",1,"I2C0_SCL",0)
elseif o==12 then
fill_M251_PWM(e,t,"C",1,"PWM1_CH4",1,4)
elseif o==14 then
fill_M251_ACMP(e,t,"C",1,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",1)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"ACMP1_O","PWM1_CH5","I2C0_SDA","UART2_RXD","QSPI0_MOSI0","PC.0"}
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"C",0)
elseif o==4 then
fill_M251_SPI(e,t,"C",0,"QSPI0_MOSI0",0)
fill_M251_SPI_IO(e,t,0,false)
elseif o==8 then
fill_M251_UART(e,t,"C",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M251_I2C(e,t,"C",0,"I2C0_SDA",0)
elseif o==12 then
fill_M251_PWM(e,t,"C",0,"PWM1_CH5",1,5)
elseif o==14 then
fill_M251_ACMP(e,t,"C",0,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",0)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"BPWM1_CH2","I2C1_SCL","PA.12"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"A",12)
elseif o==4 then
fill_M251_I2C(e,t,"A",12,"I2C1_SCL",1)
elseif o==11 then
fill_M251_BPWM(e,t,"A",12,"BPWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"A",12)
end
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"BPWM1_CH3","I2C1_SDA","PA.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"A",13)
elseif o==4 then
fill_M251_I2C(e,t,"A",13,"I2C1_SDA",1)
elseif o==11 then
fill_M251_BPWM(e,t,"A",13,"BPWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"A",13)
end
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"BPWM1_CH4","UART0_TXD","PA.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"A",14)
elseif o==3 then
fill_M251_UART(e,t,"A",14,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M251_BPWM(e,t,"A",14,"BPWM1_CH4",1,4)
else
fill_invalid_GPIO(e,t,"A",14)
end
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"BPWM1_CH5","UART0_RXD","PA.15"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"A",15)
elseif o==3 then
fill_M251_UART(e,t,"A",15,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M251_BPWM(e,t,"A",15,"BPWM1_CH5",1,5)
else
fill_invalid_GPIO(e,t,"A",15)
end
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"VSS"}
fill_M251_Normal(e,t,nil,nil,"VSS")
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"LDO_CAP"}
fill_M251_Normal(e,t,nil,nil,"LDO_CAP")
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"VDD"}
fill_M251_Normal(e,t,nil,nil,"VDD")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"PWM0_BRAKE1","TM0_EXT","PWM1_CH0","PSIO0_CH0","UART0_nCTS","USCI0_CTL1","SPI0_SS","EADC0_CH15","PB.15"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"B",15)
elseif o==1 then
fill_M251_Analog(e,t,"B",15,"EADC0_CH15",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M251_SPI(e,t,"B",15,"SPI0_SS",1)
elseif o==5 then
fill_M251_USCI(e,t,"B",15,"USCI0_CTL1",0)
elseif o==6 then
fill_M251_UART(e,t,"B",15,"UART0_nCTS",0)
elseif o==10 then
fill_M251_PSIO(e,t,"B",15,"PSIO0_CH0",0)
elseif o==11 then
fill_M251_PWM(e,t,"B",15,"PWM1_CH0",1,0)
elseif o==13 then
fill_M251_TM(e,t,"B",15,"TM0_EXT",0)
elseif o==15 then
fill_M251_PWM(e,t,"B",15,"PWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"B",15)
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"CLKO","TM1_EXT","PWM1_CH1","PSIO0_CH1","UART0_nRTS","USCI0_DAT1","SPI0_CLK","EADC0_CH14","PB.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"B",14)
elseif o==1 then
fill_M251_Analog(e,t,"B",14,"EADC0_CH14",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M251_SPI(e,t,"B",14,"SPI0_CLK",1)
elseif o==5 then
fill_M251_USCI(e,t,"B",14,"USCI0_DAT1",0)
fill_M251_USCI_IO(e,t,0,1)
elseif o==6 then
fill_M251_UART(e,t,"B",14,"UART0_nRTS",0)
elseif o==10 then
fill_M251_PSIO(e,t,"B",14,"PSIO0_CH1",0)
elseif o==11 then
fill_M251_PWM(e,t,"B",14,"PWM1_CH1",1,1)
elseif o==13 then
fill_M251_TM(e,t,"B",14,"TM1_EXT",1)
elseif o==14 then
fill_M251_CLKO(e,t,"B",14,"CLKO")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",14)
end
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"TM2_EXT","PWM1_CH2","PSIO0_CH2","UART0_TXD","USCI0_DAT0","SPI0_MISO","ACMP1_P3","ACMP0_P3","EADC0_CH13","PB.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"B",13)
elseif o==1 then
fill_M251_Analog(e,t,"B",13,"ACMP1_P3,ACMP0_P3,EADC0_CH13",{0},nil,{0,1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="ACMP1_P3,ACMP0_P3,EADC0_CH13"
e["texts"]={"TM2_EXT","PWM1_CH2","PSIO0_CH2","UART0_TXD","USCI0_DAT0","SPI0_MISO","ACMP1_P3,ACMP0_P3,EADC0_CH13","PB.13"}
elseif o==4 then
fill_M251_SPI(e,t,"B",13,"SPI0_MISO",1)
fill_M251_SPI_IO(e,t,1,true)
elseif o==5 then
fill_M251_USCI(e,t,"B",13,"USCI0_DAT0",0)
fill_M251_USCI_IO(e,t,0,0)
elseif o==6 then
fill_M251_UART(e,t,"B",13,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M251_PSIO(e,t,"B",13,"PSIO0_CH2",0)
elseif o==11 then
fill_M251_PWM(e,t,"B",13,"PWM1_CH2",1,2)
elseif o==13 then
fill_M251_TM(e,t,"B",13,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"TM3_EXT","PWM1_CH3","PSIO0_CH3","UART0_RXD","USCI0_CLK","SPI0_MOSI","ACMP1_P2","ACMP0_P2","EADC0_CH12","PB.12"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"B",12)
elseif o==1 then
fill_M251_Analog(e,t,"B",12,"ACMP1_P2,ACMP0_P2,EADC0_CH12",{0},nil,{0,1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="ACMP1_P2,ACMP0_P2,EADC0_CH12"
e["texts"]={"TM3_EXT","PWM1_CH3","PSIO0_CH3","UART0_RXD","USCI0_CLK","SPI0_MOSI","ACMP1_P2,ACMP0_P2,EADC0_CH12","PB.12"}
elseif o==4 then
fill_M251_SPI(e,t,"B",12,"SPI0_MOSI",1)
fill_M251_SPI_IO(e,t,1,false)
elseif o==5 then
fill_M251_USCI(e,t,"B",12,"USCI0_CLK",0)
elseif o==6 then
fill_M251_UART(e,t,"B",12,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==10 then
fill_M251_PSIO(e,t,"B",12,"PSIO0_CH3",0)
elseif o==11 then
fill_M251_PWM(e,t,"B",12,"PWM1_CH3",1,3)
elseif o==13 then
fill_M251_TM(e,t,"B",12,"TM3_EXT",3)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"AVDD"}
fill_M251_Normal(e,t,nil,nil,"AVDD")
a[32]=e
return{name=i,information="",pins=a}
end
