local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M251.lua")
function get_chip_status_M252_E_AE_ULQFP128(i,o,t,e)
local a={}
local t=read_M251_Registers(i,o,t,e)
local e
e={}
e["pin_no"]="1"
e["texts"]={"PB.5","EADC0_CH5","ACMP1_N","EBI_ADR0","I2C0_SCL","USCI1_CTL0","SC0_CLK","PWM0_CH0","PSIO0_CH4","UART2_TXD","TM0","INT0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"B",5)
elseif o==1 then
fill_M251_Analog(e,t,"B",5,"EADC0_CH5,ACMP1_N",{0},nil,{1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH5,ACMP1_N"
e["texts"]={"PB.5","EADC0_CH5,ACMP1_N","EBI_ADR0","I2C0_SCL","USCI1_CTL0","SC0_CLK","PWM0_CH0","PSIO0_CH4","UART2_TXD","TM0","INT0"}
elseif o==2 then
fill_M251_EBI(e,t,"B",5,"EBI_ADR0")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_I2C(e,t,"B",5,"I2C0_SCL",0)
elseif o==8 then
fill_M251_USCI(e,t,"B",5,"USCI1_CTL0",1)
elseif o==9 then
fill_M251_SC(e,t,"B",5,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M251_PWM(e,t,"B",5,"PWM0_CH0",0,0)
elseif o==12 then
fill_M251_PSIO(e,t,"B",5,"PSIO0_CH4",0)
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
e["texts"]={"PB.4","EADC0_CH4","ACMP1_P1","EBI_ADR1","I2C0_SDA","USCI1_CTL1","SC0_DAT","PWM0_CH1","PSIO0_CH5","UART2_RXD","TM1","INT1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"B",4)
elseif o==1 then
fill_M251_Analog(e,t,"B",4,"EADC0_CH4,ACMP1_P1",{0},nil,{1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH4,ACMP1_P1"
e["texts"]={"PB.4","EADC0_CH4,ACMP1_P1","EBI_ADR1","I2C0_SDA","USCI1_CTL1","SC0_DAT","PWM0_CH1","PSIO0_CH5","UART2_RXD","TM1","INT1"}
elseif o==2 then
fill_M251_EBI(e,t,"B",4,"EBI_ADR1")
e["direction"]=kPinDirection_PushPullOut
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
elseif o==12 then
fill_M251_PSIO(e,t,"B",4,"PSIO0_CH5",0)
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
e["texts"]={"PB.3","EADC0_CH3","ACMP0_N","EBI_ADR2","I2C1_SCL","UART1_TXD","USCI1_DAT1","SC0_RST","PWM0_CH2","PSIO0_CH6","PWM0_BRAKE0","TM2","INT2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"B",3)
elseif o==1 then
fill_M251_Analog(e,t,"B",3,"EADC0_CH3,ACMP0_N",{0},nil,{0},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH3,ACMP0_N"
e["texts"]={"PB.3","EADC0_CH3,ACMP0_N","EBI_ADR2","I2C1_SCL","UART1_TXD","USCI1_DAT1","SC0_RST","PWM0_CH2","PSIO0_CH6","PWM0_BRAKE0","TM2","INT2"}
elseif o==2 then
fill_M251_EBI(e,t,"B",3,"EBI_ADR2")
e["direction"]=kPinDirection_PushPullOut
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
elseif o==12 then
fill_M251_PSIO(e,t,"B",3,"PSIO0_CH6",0)
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
e["texts"]={"PB.2","EADC0_CH2","ACMP0_P1","EBI_ADR3","I2C1_SDA","UART1_RXD","USCI1_DAT0","SC0_PWR","PWM0_CH3","PSIO0_CH7","TM3","INT3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"B",2)
elseif o==1 then
fill_M251_Analog(e,t,"B",2,"EADC0_CH2,ACMP0_P1",{0},nil,{0},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="EADC0_CH2,ACMP0_P1"
e["texts"]={"PB.2","EADC0_CH2,ACMP0_P1","EBI_ADR3","I2C1_SDA","UART1_RXD","USCI1_DAT0","SC0_PWR","PWM0_CH3","PSIO0_CH7","TM3","INT3"}
elseif o==2 then
fill_M251_EBI(e,t,"B",2,"EBI_ADR3")
e["direction"]=kPinDirection_PushPullOut
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
elseif o==12 then
fill_M251_PSIO(e,t,"B",2,"PSIO0_CH7",0)
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
e["texts"]={"PC.12","EBI_ADR4","UART0_TXD","I2C0_SCL","SC0_nCD","PWM1_CH0","ACMP0_O"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPH"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"C",12)
elseif o==2 then
fill_M251_EBI(e,t,"C",12,"EBI_ADR4")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M251_UART(e,t,"C",12,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_I2C(e,t,"C",12,"I2C0_SCL",0)
elseif o==9 then
fill_M251_SC(e,t,"C",12,"SC0_nCD",0)
e["direction"]=kPinDirection_In
elseif o==12 then
fill_M251_PWM(e,t,"C",12,"PWM1_CH0",1,0)
elseif o==14 then
fill_M251_ACMP(e,t,"C",12,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",12)
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"PC.11","EBI_ADR5","UART0_RXD","I2C0_SDA","PWM1_CH1","ACMP1_O"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPH"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"C",11)
elseif o==2 then
fill_M251_EBI(e,t,"C",11,"EBI_ADR5")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M251_UART(e,t,"C",11,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M251_I2C(e,t,"C",11,"I2C0_SDA",0)
elseif o==12 then
fill_M251_PWM(e,t,"C",11,"PWM1_CH1",1,1)
elseif o==14 then
fill_M251_ACMP(e,t,"C",11,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",11)
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"PC.10","EBI_ADR6","PWM1_CH2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPH"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"C",10)
elseif o==2 then
fill_M251_EBI(e,t,"C",10,"EBI_ADR6")
e["direction"]=kPinDirection_PushPullOut
elseif o==12 then
fill_M251_PWM(e,t,"C",10,"PWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"C",10)
end
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"PC.9","EBI_ADR7","PWM1_CH3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPH"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"C",9)
elseif o==2 then
fill_M251_EBI(e,t,"C",9,"EBI_ADR7")
e["direction"]=kPinDirection_PushPullOut
elseif o==12 then
fill_M251_PWM(e,t,"C",9,"PWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"C",9)
end
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"PB.1","EADC0_CH1","EBI_ADR8","UART2_TXD","USCI1_CLK","I2C1_SCL","QSPI0_MISO1","PWM0_CH4","PWM1_CH4","PWM0_BRAKE0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"B",1)
elseif o==1 then
fill_M251_Analog(e,t,"B",1,"EADC0_CH1",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",1,"EBI_ADR8")
e["direction"]=kPinDirection_PushPullOut
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
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"PB.0","EADC0_CH0","EBI_ADR9","UART2_RXD","SPI0_I2SMCLK","I2C1_SDA","QSPI0_MOSI1","PWM0_CH5","PWM1_CH5","PWM0_BRAKE1"}
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"B",0)
elseif o==1 then
fill_M251_Analog(e,t,"B",0,"EADC0_CH0",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",0,"EBI_ADR9")
e["direction"]=kPinDirection_PushPullOut
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
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VSS"}
fill_M251_Normal(e,t,nil,nil,"VSS")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"VDD"}
fill_M251_Normal(e,t,nil,nil,"VDD")
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"PA.11","ACMP0_P0","EBI_nRD","USCI0_CLK","BPWM0_CH0","TM0_EXT"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"A",11)
elseif o==1 then
fill_M251_Analog(e,t,"A",11,"ACMP0_P0",nil,nil,{0},nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"A",11,"EBI_nRD")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"A",11,"USCI0_CLK",0)
elseif o==9 then
fill_M251_BPWM(e,t,"A",11,"BPWM0_CH0",0,0)
elseif o==13 then
fill_M251_TM(e,t,"A",11,"TM0_EXT",0)
else
fill_invalid_GPIO(e,t,"A",11)
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"PA.10","ACMP1_P0","EBI_nWR","USCI0_DAT0","BPWM0_CH1","TM1_EXT"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"A",10)
elseif o==1 then
fill_M251_Analog(e,t,"A",10,"ACMP1_P0",nil,nil,{1},nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"A",10,"EBI_nWR")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"A",10,"USCI0_DAT0",0)
fill_M251_USCI_IO(e,t,0,0)
elseif o==9 then
fill_M251_BPWM(e,t,"A",10,"BPWM0_CH1",0,1)
elseif o==13 then
fill_M251_TM(e,t,"A",10,"TM1_EXT",1)
else
fill_invalid_GPIO(e,t,"A",10)
end
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"PA.9","EBI_MCLK","USCI0_DAT1","UART1_TXD","BPWM0_CH2","TM2_EXT"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPH"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"A",9)
elseif o==2 then
fill_M251_EBI(e,t,"A",9,"EBI_MCLK")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"A",9,"USCI0_DAT1",0)
fill_M251_USCI_IO(e,t,0,1)
elseif o==7 then
fill_M251_UART(e,t,"A",9,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M251_BPWM(e,t,"A",9,"BPWM0_CH2",0,2)
elseif o==13 then
fill_M251_TM(e,t,"A",9,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"A",9)
end
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"PA.8","EBI_ALE","USCI0_CTL1","UART1_RXD","BPWM0_CH3","TM3_EXT","INT4"}
local o=ext.band(t["SYS_SYS_GPA_MFPH"],15)
if o==0 then
fill_M251_GPIO(e,t,"A",8)
elseif o==2 then
fill_M251_EBI(e,t,"A",8,"EBI_ALE")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"A",8,"USCI0_CTL1",0)
elseif o==7 then
fill_M251_UART(e,t,"A",8,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M251_BPWM(e,t,"A",8,"BPWM0_CH3",0,3)
elseif o==13 then
fill_M251_TM(e,t,"A",8,"TM3_EXT",3)
elseif o==15 then
fill_M251_Normal(e,t,"A",8,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",8)
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"PD.12","EBI_nCS0","UART2_RXD","BPWM0_CH5","CLKO","EADC0_ST","INT5"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPH"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"D",12)
elseif o==2 then
fill_M251_EBI(e,t,"D",12,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M251_UART(e,t,"D",12,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M251_BPWM(e,t,"D",12,"BPWM0_CH5",0,5)
elseif o==13 then
fill_M251_CLKO(e,t,"D",12,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==14 then
fill_M251_EADC(e,t,"D",12,"EADC0_ST",0)
elseif o==15 then
fill_M251_Normal(e,t,"D",12,"INT5")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",12)
end
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"PD.11","EBI_nCS1","UART1_TXD"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPH"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"D",11)
elseif o==2 then
fill_M251_EBI(e,t,"D",11,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M251_UART(e,t,"D",11,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",11)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"PD.10","EBI_nCS2","UART1_RXD"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPH"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"D",10)
elseif o==2 then
fill_M251_EBI(e,t,"D",10,"EBI_nCS2")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M251_UART(e,t,"D",10,"UART1_RXD",1)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",10)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"PF.7","EBI_ADR18","SC0_DAT","SPI0_MISO"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"F",7)
elseif o==2 then
fill_M251_EBI(e,t,"F",7,"EBI_ADR18")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M251_SC(e,t,"F",7,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==5 then
fill_M251_SPI(e,t,"F",7,"SPI0_MISO",1)
fill_M251_SPI_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"F",7)
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"PF.6","EBI_ADR19","SC0_CLK","SPI0_MOSI","EBI_nCS0","TAMPER0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"F",6)
elseif o==2 then
fill_M251_EBI(e,t,"F",6,"EBI_ADR19")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M251_SC(e,t,"F",6,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M251_SPI(e,t,"F",6,"SPI0_MOSI",1)
fill_M251_SPI_IO(e,t,1,false)
elseif o==7 then
fill_M251_EBI(e,t,"F",6,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M251_Normal(e,t,"F",6,"TAMPER0")
else
fill_invalid_GPIO(e,t,"F",6)
end
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"VBAT"}
fill_M251_Normal(e,t,nil,nil,"VBAT")
a[30]=e
e={}
e["pin_no"]="31"
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
a[31]=e
e={}
e["pin_no"]="32"
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
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[36]=e
e={}
e["pin_no"]="37"
e["texts"]={"PF.3","EBI_nCS0","UART0_TXD","I2C0_SCL","XT1_IN","BPWM1_CH0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"F",3)
elseif o==2 then
fill_M251_EBI(e,t,"F",3,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
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
a[37]=e
e={}
e["pin_no"]="38"
e["texts"]={"PF.2","EBI_nCS1","UART0_RXD","I2C0_SDA","QSPI0_CLK","XT1_OUT","BPWM1_CH1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPF_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"F",2)
elseif o==2 then
fill_M251_EBI(e,t,"F",2,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
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
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"PE.8","EBI_ADR10","USCI1_CTL1","UART2_TXD","PWM0_CH0","PWM0_BRAKE0"}
local o=ext.band(t["SYS_SYS_GPE_MFPH"],15)
if o==0 then
fill_M251_GPIO(e,t,"E",8)
elseif o==2 then
fill_M251_EBI(e,t,"E",8,"EBI_ADR10")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"E",8,"USCI1_CTL1",1)
elseif o==7 then
fill_M251_UART(e,t,"E",8,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M251_PWM(e,t,"E",8,"PWM0_CH0",0,0)
elseif o==11 then
fill_M251_PWM(e,t,"E",8,"PWM0_BRAKE0",0)
else
fill_invalid_GPIO(e,t,"E",8)
end
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"PE.9","EBI_ADR11","USCI1_CTL0","UART2_RXD","PWM0_CH1","PWM0_BRAKE1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPH"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"E",9)
elseif o==2 then
fill_M251_EBI(e,t,"E",9,"EBI_ADR11")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"E",9,"USCI1_CTL0",1)
elseif o==7 then
fill_M251_UART(e,t,"E",9,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==10 then
fill_M251_PWM(e,t,"E",9,"PWM0_CH1",0,1)
elseif o==11 then
fill_M251_PWM(e,t,"E",9,"PWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"E",9)
end
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"PE.10","EBI_ADR12","USCI1_DAT0","PWM0_CH2","PWM1_BRAKE0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPH"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"E",10)
elseif o==2 then
fill_M251_EBI(e,t,"E",10,"EBI_ADR12")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"E",10,"USCI1_DAT0",1)
fill_M251_USCI_IO(e,t,1,0)
elseif o==10 then
fill_M251_PWM(e,t,"E",10,"PWM0_CH2",0,2)
elseif o==11 then
fill_M251_PWM(e,t,"E",10,"PWM1_BRAKE0",1)
else
fill_invalid_GPIO(e,t,"E",10)
end
a[43]=e
e={}
e["pin_no"]="44"
e["texts"]={"PE.11","EBI_ADR13","USCI1_DAT1","UART1_nCTS","PWM0_CH3","PWM1_BRAKE1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPH"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"E",11)
elseif o==2 then
fill_M251_EBI(e,t,"E",11,"EBI_ADR13")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"E",11,"USCI1_DAT1",1)
fill_M251_USCI_IO(e,t,1,1)
elseif o==8 then
fill_M251_UART(e,t,"E",11,"UART1_nCTS",1)
elseif o==10 then
fill_M251_PWM(e,t,"E",11,"PWM0_CH3",0,3)
elseif o==11 then
fill_M251_PWM(e,t,"E",11,"PWM1_BRAKE1",1)
else
fill_invalid_GPIO(e,t,"E",11)
end
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"PE.12","EBI_ADR14","USCI1_CLK","UART1_nRTS","PWM0_CH4"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPH"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"E",12)
elseif o==2 then
fill_M251_EBI(e,t,"E",12,"EBI_ADR14")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_USCI(e,t,"E",12,"USCI1_CLK",1)
elseif o==8 then
fill_M251_UART(e,t,"E",12,"UART1_nRTS",1)
elseif o==10 then
fill_M251_PWM(e,t,"E",12,"PWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"E",12)
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"PE.13","EBI_ADR15","I2C0_SCL","UART1_TXD","PWM0_CH5","PWM1_CH0","BPWM1_CH5"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPH"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"E",13)
elseif o==2 then
fill_M251_EBI(e,t,"E",13,"EBI_ADR15")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_I2C(e,t,"E",13,"I2C0_SCL",0)
elseif o==8 then
fill_M251_UART(e,t,"E",13,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M251_PWM(e,t,"E",13,"PWM0_CH5",0,5)
elseif o==11 then
fill_M251_PWM(e,t,"E",13,"PWM1_CH0",1,0)
elseif o==12 then
fill_M251_BPWM(e,t,"E",13,"BPWM1_CH5",1,5)
else
fill_invalid_GPIO(e,t,"E",13)
end
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"PC.8","EBI_ADR16","I2C0_SDA","UART1_RXD","PWM1_CH1","BPWM1_CH4"}
local o=ext.band(t["SYS_SYS_GPC_MFPH"],15)
if o==0 then
fill_M251_GPIO(e,t,"C",8)
elseif o==2 then
fill_M251_EBI(e,t,"C",8,"EBI_ADR16")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_I2C(e,t,"C",8,"I2C0_SDA",0)
elseif o==8 then
fill_M251_UART(e,t,"C",8,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M251_PWM(e,t,"C",8,"PWM1_CH1",1,1)
elseif o==12 then
fill_M251_BPWM(e,t,"C",8,"BPWM1_CH4",1,4)
else
fill_invalid_GPIO(e,t,"C",8)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"PC.7","EBI_AD9","UART0_nCTS","I2C1_SMBAL","PWM1_CH2","BPWM1_CH0","TM0","INT3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"C",7)
elseif o==2 then
fill_M251_EBI(e,t,"C",7,"EBI_AD9")
e["direction"]=kPinDirection_Bi
elseif o==7 then
fill_M251_UART(e,t,"C",7,"UART0_nCTS",0)
elseif o==8 then
fill_M251_I2C(e,t,"C",7,"I2C1_SMBAL",1)
elseif o==11 then
fill_M251_PWM(e,t,"C",7,"PWM1_CH2",1,2)
elseif o==12 then
fill_M251_BPWM(e,t,"C",7,"BPWM1_CH0",1,0)
elseif o==14 then
fill_M251_TM(e,t,"C",7,"TM0",0)
elseif o==15 then
fill_M251_Normal(e,t,"C",7,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",7)
end
a[48]=e
e={}
e["pin_no"]="49"
e["texts"]={"PC.6","EBI_AD8","UART0_nRTS","I2C1_SMBSUS","PWM1_CH3","BPWM1_CH1","TM1","INT2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"C",6)
elseif o==2 then
fill_M251_EBI(e,t,"C",6,"EBI_AD8")
e["direction"]=kPinDirection_Bi
elseif o==7 then
fill_M251_UART(e,t,"C",6,"UART0_nRTS",0)
elseif o==8 then
fill_M251_I2C(e,t,"C",6,"I2C1_SMBSUS",1)
elseif o==11 then
fill_M251_PWM(e,t,"C",6,"PWM1_CH3",1,3)
elseif o==12 then
fill_M251_BPWM(e,t,"C",6,"BPWM1_CH1",1,1)
elseif o==14 then
fill_M251_TM(e,t,"C",6,"TM1",1)
elseif o==15 then
fill_M251_Normal(e,t,"C",6,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",6)
end
a[49]=e
e={}
e["pin_no"]="50"
e["texts"]={"PA.7","EBI_AD7","UART0_TXD","I2C1_SCL","PWM1_CH4","BPWM1_CH2","ACMP0_WLAT","TM2","INT1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"A",7)
elseif o==2 then
fill_M251_EBI(e,t,"A",7,"EBI_AD7")
e["direction"]=kPinDirection_Bi
elseif o==7 then
fill_M251_UART(e,t,"A",7,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M251_I2C(e,t,"A",7,"I2C1_SCL",1)
elseif o==11 then
fill_M251_PWM(e,t,"A",7,"PWM1_CH4",1,4)
elseif o==12 then
fill_M251_BPWM(e,t,"A",7,"BPWM1_CH2",1,2)
elseif o==13 then
fill_M251_ACMP(e,t,"A",7,"ACMP0_WLAT",0)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M251_TM(e,t,"A",7,"TM2",2)
elseif o==15 then
fill_M251_Normal(e,t,"A",7,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",7)
end
a[50]=e
e={}
e["pin_no"]="51"
e["texts"]={"PA.6","EBI_AD6","UART0_RXD","I2C1_SDA","PWM1_CH5","BPWM1_CH3","ACMP1_WLAT","TM3","INT0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"A",6)
elseif o==2 then
fill_M251_EBI(e,t,"A",6,"EBI_AD6")
e["direction"]=kPinDirection_Bi
elseif o==7 then
fill_M251_UART(e,t,"A",6,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M251_I2C(e,t,"A",6,"I2C1_SDA",1)
elseif o==11 then
fill_M251_PWM(e,t,"A",6,"PWM1_CH5",1,5)
elseif o==12 then
fill_M251_BPWM(e,t,"A",6,"BPWM1_CH3",1,3)
elseif o==13 then
fill_M251_ACMP(e,t,"A",6,"ACMP1_WLAT",1)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M251_TM(e,t,"A",6,"TM3",3)
elseif o==15 then
fill_M251_Normal(e,t,"A",6,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",6)
end
a[51]=e
e={}
e["pin_no"]="52"
e["texts"]={"VSS"}
fill_M251_Normal(e,t,nil,nil,"VSS")
a[52]=e
e={}
e["pin_no"]="53"
e["texts"]={"VDD"}
fill_M251_Normal(e,t,nil,nil,"VDD")
a[53]=e
e={}
e["pin_no"]="54"
e["texts"]={"PD.15","PSIO0_CH7","PWM0_CH5","TM3","INT1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPH"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"D",15)
elseif o==11 then
fill_M251_PSIO(e,t,"D",15,"PSIO0_CH7",0)
elseif o==12 then
fill_M251_PWM(e,t,"D",15,"PWM0_CH5",0,5)
elseif o==14 then
fill_M251_TM(e,t,"D",15,"TM3",3)
elseif o==15 then
fill_M251_Normal(e,t,"D",15,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",15)
end
a[54]=e
e={}
e["pin_no"]="55"
e["texts"]={"PA.5","QSPI0_MISO1","UART0_nCTS","UART0_TXD","I2C0_SCL","BPWM0_CH5","PWM0_CH0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"A",5)
elseif o==3 then
fill_M251_SPI(e,t,"A",5,"QSPI0_MISO1",0)
fill_M251_SPI_IO(e,t,0,true)
elseif o==7 then
fill_M251_UART(e,t,"A",5,"UART0_nCTS",0)
elseif o==8 then
fill_M251_UART(e,t,"A",5,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M251_I2C(e,t,"A",5,"I2C0_SCL",0)
elseif o==12 then
fill_M251_BPWM(e,t,"A",5,"BPWM0_CH5",0,5)
elseif o==13 then
fill_M251_PWM(e,t,"A",5,"PWM0_CH0",0,0)
else
fill_invalid_GPIO(e,t,"A",5)
end
a[55]=e
e={}
e["pin_no"]="56"
e["texts"]={"PA.4","QSPI0_MOSI1","SPI0_I2SMCLK","SC0_nCD","UART0_nRTS","UART0_RXD","I2C0_SDA","USCI2_CTL1","BPWM0_CH4","PWM0_CH1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPA_MFPL"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"A",4)
elseif o==3 then
fill_M251_SPI(e,t,"A",4,"QSPI0_MOSI1",0)
fill_M251_SPI_IO(e,t,0,false)
elseif o==4 then
fill_M251_SPI(e,t,"A",4,"SPI0_I2SMCLK",1)
elseif o==6 then
fill_M251_SC(e,t,"A",4,"SC0_nCD",0)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M251_UART(e,t,"A",4,"UART0_nRTS",0)
elseif o==8 then
fill_M251_UART(e,t,"A",4,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M251_I2C(e,t,"A",4,"I2C0_SDA",0)
elseif o==11 then
fill_M251_USCI(e,t,"A",4,"USCI2_CTL1",2)
elseif o==12 then
fill_M251_BPWM(e,t,"A",4,"BPWM0_CH4",0,4)
elseif o==13 then
fill_M251_PWM(e,t,"A",4,"PWM0_CH1",0,1)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[56]=e
e={}
e["pin_no"]="57"
e["texts"]={"PA.3","QSPI0_SS","SPI0_SS","SC0_PWR","I2C0_SMBAL","UART1_TXD","I2C1_SCL","PSIO0_CH4","USCI2_CTL0","BPWM0_CH3","PWM0_CH2","CLKO","PWM1_BRAKE1"}
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
elseif o==10 then
fill_M251_PSIO(e,t,"A",3,"PSIO0_CH4",0)
elseif o==11 then
fill_M251_USCI(e,t,"A",3,"USCI2_CTL0",2)
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
a[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"PA.2","QSPI0_CLK","SPI0_CLK","SC0_RST","I2C0_SMBSUS","UART1_RXD","I2C1_SDA","PSIO0_CH5","USCI2_CLK","BPWM0_CH2","PWM0_CH3"}
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
elseif o==10 then
fill_M251_PSIO(e,t,"A",2,"PSIO0_CH5",0)
elseif o==11 then
fill_M251_USCI(e,t,"A",2,"USCI2_CLK",2)
elseif o==12 then
fill_M251_BPWM(e,t,"A",2,"BPWM0_CH2",0,2)
elseif o==13 then
fill_M251_PWM(e,t,"A",2,"PWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"PA.1","QSPI0_MISO0","SPI0_MISO","SC0_DAT","UART0_TXD","UART1_nCTS","PSIO0_CH6","USCI2_DAT0","BPWM0_CH1","PWM0_CH4"}
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
elseif o==10 then
fill_M251_PSIO(e,t,"A",1,"PSIO0_CH6",0)
elseif o==11 then
fill_M251_USCI(e,t,"A",1,"USCI2_DAT0",2)
fill_M251_USCI_IO(e,t,2,0)
elseif o==12 then
fill_M251_BPWM(e,t,"A",1,"BPWM0_CH1",0,1)
elseif o==13 then
fill_M251_PWM(e,t,"A",1,"PWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"PA.0","QSPI0_MOSI0","SPI0_MOSI","SC0_CLK","UART0_RXD","UART1_nRTS","PSIO0_CH7","USCI2_DAT1","BPWM0_CH0","PWM0_CH5"}
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
elseif o==10 then
fill_M251_PSIO(e,t,"A",0,"PSIO0_CH7",0)
elseif o==11 then
fill_M251_USCI(e,t,"A",0,"USCI2_DAT1",2)
fill_M251_USCI_IO(e,t,2,1)
elseif o==12 then
fill_M251_BPWM(e,t,"A",0,"BPWM0_CH0",0,0)
elseif o==13 then
fill_M251_PWM(e,t,"A",0,"PWM0_CH5",0,5)
else
fill_invalid_GPIO(e,t,"A",0)
end
a[60]=e
e={}
e["pin_no"]="61"
e["texts"]={"VDDIO"}
fill_M251_Normal(e,t,nil,nil,"VDDIO")
a[61]=e
e={}
e["pin_no"]="62"
e["texts"]={"PE.14","EBI_AD8","UART2_TXD","PSIO0_CH0"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPH"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"E",14)
elseif o==2 then
fill_M251_EBI(e,t,"E",14,"EBI_AD8")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_UART(e,t,"E",14,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M251_PSIO(e,t,"E",14,"PSIO0_CH0",0)
else
fill_invalid_GPIO(e,t,"E",14)
end
a[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"PE.15","EBI_AD9","UART2_RXD","PSIO0_CH1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPH"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"E",15)
elseif o==2 then
fill_M251_EBI(e,t,"E",15,"EBI_AD9")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_UART(e,t,"E",15,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==10 then
fill_M251_PSIO(e,t,"E",15,"PSIO0_CH1",0)
else
fill_invalid_GPIO(e,t,"E",15)
end
a[63]=e
e={}
e["pin_no"]="64"
e["texts"]={"nRESET"}
fill_M251_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[64]=e
e={}
e["pin_no"]="65"
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
a[65]=e
e={}
e["pin_no"]="66"
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
a[66]=e
e={}
e["pin_no"]="67"
e["texts"]={"PSIO0_CH2","UART2_nCTS","EBI_AD7","PD.9"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPH"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"D",9)
elseif o==2 then
fill_M251_EBI(e,t,"D",9,"EBI_AD7")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_UART(e,t,"D",9,"UART2_nCTS",2)
elseif o==10 then
fill_M251_PSIO(e,t,"D",9,"PSIO0_CH2",0)
else
fill_invalid_GPIO(e,t,"D",9)
end
a[67]=e
e={}
e["pin_no"]="68"
e["texts"]={"PSIO0_CH3","UART2_nRTS","EBI_AD6","PD.8"}
local o=ext.band(t["SYS_SYS_GPD_MFPH"],15)
if o==0 then
fill_M251_GPIO(e,t,"D",8)
elseif o==2 then
fill_M251_EBI(e,t,"D",8,"EBI_AD6")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_UART(e,t,"D",8,"UART2_nRTS",2)
elseif o==10 then
fill_M251_PSIO(e,t,"D",8,"PSIO0_CH3",0)
else
fill_invalid_GPIO(e,t,"D",8)
end
a[68]=e
e={}
e["pin_no"]="69"
e["texts"]={"PSIO0_CH0","PWM1_CH0","I2C1_SCL","UART2_TXD","QSPI0_MISO1","EBI_AD5","PC.5"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"C",5)
elseif o==2 then
fill_M251_EBI(e,t,"C",5,"EBI_AD5")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_SPI(e,t,"C",5,"QSPI0_MISO1",0)
fill_M251_SPI_IO(e,t,0,true)
elseif o==8 then
fill_M251_UART(e,t,"C",5,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M251_I2C(e,t,"C",5,"I2C1_SCL",1)
elseif o==12 then
fill_M251_PWM(e,t,"C",5,"PWM1_CH0",1,0)
elseif o==15 then
fill_M251_PSIO(e,t,"C",5,"PSIO0_CH0",0)
else
fill_invalid_GPIO(e,t,"C",5)
end
a[69]=e
e={}
e["pin_no"]="70"
e["texts"]={"PSIO0_CH1","USCI2_CTL1","PWM1_CH1","I2C1_SDA","UART2_RXD","QSPI0_MOSI1","EBI_AD4","PC.4"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"C",4)
elseif o==2 then
fill_M251_EBI(e,t,"C",4,"EBI_AD4")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_SPI(e,t,"C",4,"QSPI0_MOSI1",0)
fill_M251_SPI_IO(e,t,0,false)
elseif o==8 then
fill_M251_UART(e,t,"C",4,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M251_I2C(e,t,"C",4,"I2C1_SDA",1)
elseif o==12 then
fill_M251_PWM(e,t,"C",4,"PWM1_CH1",1,1)
elseif o==13 then
fill_M251_USCI(e,t,"C",4,"USCI2_CTL1",2)
elseif o==15 then
fill_M251_PSIO(e,t,"C",4,"PSIO0_CH1",0)
else
fill_invalid_GPIO(e,t,"C",4)
end
a[70]=e
e={}
e["pin_no"]="71"
e["texts"]={"PSIO0_CH2","USCI2_CTL0","PWM1_CH2","I2C0_SMBAL","UART2_nRTS","QSPI0_SS","EBI_AD3","PC.3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"C",3)
elseif o==2 then
fill_M251_EBI(e,t,"C",3,"EBI_AD3")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_SPI(e,t,"C",3,"QSPI0_SS",0)
elseif o==8 then
fill_M251_UART(e,t,"C",3,"UART2_nRTS",2)
elseif o==9 then
fill_M251_I2C(e,t,"C",3,"I2C0_SMBAL",0)
elseif o==12 then
fill_M251_PWM(e,t,"C",3,"PWM1_CH2",1,2)
elseif o==13 then
fill_M251_USCI(e,t,"C",3,"USCI2_CTL0",2)
elseif o==15 then
fill_M251_PSIO(e,t,"C",3,"PSIO0_CH2",0)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[71]=e
e={}
e["pin_no"]="72"
e["texts"]={"PSIO0_CH3","USCI2_CLK","PWM1_CH3","I2C0_SMBSUS","UART2_nCTS","QSPI0_CLK","EBI_AD2","PC.2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"C",2)
elseif o==2 then
fill_M251_EBI(e,t,"C",2,"EBI_AD2")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_SPI(e,t,"C",2,"QSPI0_CLK",0)
elseif o==8 then
fill_M251_UART(e,t,"C",2,"UART2_nCTS",2)
elseif o==9 then
fill_M251_I2C(e,t,"C",2,"I2C0_SMBSUS",0)
elseif o==12 then
fill_M251_PWM(e,t,"C",2,"PWM1_CH3",1,3)
elseif o==13 then
fill_M251_USCI(e,t,"C",2,"USCI2_CLK",2)
elseif o==15 then
fill_M251_PSIO(e,t,"C",2,"PSIO0_CH3",0)
else
fill_invalid_GPIO(e,t,"C",2)
end
a[72]=e
e={}
e["pin_no"]="73"
e["texts"]={"ACMP0_O","USCI2_DAT0","PWM1_CH4","I2C0_SCL","UART2_TXD","QSPI0_MISO0","EBI_AD1","PC.1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPL"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"C",1)
elseif o==2 then
fill_M251_EBI(e,t,"C",1,"EBI_AD1")
e["direction"]=kPinDirection_Bi
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
elseif o==13 then
fill_M251_USCI(e,t,"C",1,"USCI2_DAT0",2)
fill_M251_USCI_IO(e,t,2,0)
elseif o==14 then
fill_M251_ACMP(e,t,"C",1,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",1)
end
a[73]=e
e={}
e["pin_no"]="74"
e["texts"]={"ACMP1_O","USCI2_DAT1","PWM1_CH5","I2C0_SDA","UART2_RXD","QSPI0_MOSI0","EBI_AD0","PC.0"}
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"C",0)
elseif o==2 then
fill_M251_EBI(e,t,"C",0,"EBI_AD0")
e["direction"]=kPinDirection_Bi
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
elseif o==13 then
fill_M251_USCI(e,t,"C",0,"USCI2_DAT1",2)
fill_M251_USCI_IO(e,t,2,1)
elseif o==14 then
fill_M251_ACMP(e,t,"C",0,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",0)
end
a[74]=e
e={}
e["pin_no"]="75"
e["texts"]={"VSS"}
fill_M251_Normal(e,t,nil,nil,"VSS")
a[75]=e
e={}
e["pin_no"]="76"
e["texts"]={"VDD"}
fill_M251_Normal(e,t,nil,nil,"VDD")
a[76]=e
e={}
e["pin_no"]="77"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[77]=e
e={}
e["pin_no"]="78"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[78]=e
e={}
e["pin_no"]="79"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[79]=e
e={}
e["pin_no"]="80"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[80]=e
e={}
e["pin_no"]="81"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[81]=e
e={}
e["pin_no"]="82"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[82]=e
e={}
e["pin_no"]="83"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[83]=e
e={}
e["pin_no"]="84"
e["texts"]={"PSIO0_CH4","USCI1_CLK","I2C0_SCL","UART1_TXD","PD.7"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"D",7)
elseif o==3 then
fill_M251_UART(e,t,"D",7,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_I2C(e,t,"D",7,"I2C0_SCL",0)
elseif o==6 then
fill_M251_USCI(e,t,"D",7,"USCI1_CLK",1)
elseif o==10 then
fill_M251_PSIO(e,t,"D",7,"PSIO0_CH4",0)
else
fill_invalid_GPIO(e,t,"D",7)
end
a[84]=e
e={}
e["pin_no"]="85"
e["texts"]={"PSIO0_CH5","USCI1_DAT1","I2C0_SDA","UART1_RXD","PD.6"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"D",6)
elseif o==3 then
fill_M251_UART(e,t,"D",6,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M251_I2C(e,t,"D",6,"I2C0_SDA",0)
elseif o==6 then
fill_M251_USCI(e,t,"D",6,"USCI1_DAT1",1)
fill_M251_USCI_IO(e,t,1,1)
elseif o==10 then
fill_M251_PSIO(e,t,"D",6,"PSIO0_CH5",0)
else
fill_invalid_GPIO(e,t,"D",6)
end
a[85]=e
e={}
e["pin_no"]="86"
e["texts"]={"PSIO0_CH6","USCI1_DAT0","I2C1_SCL","PD.5"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"D",5)
elseif o==4 then
fill_M251_I2C(e,t,"D",5,"I2C1_SCL",1)
elseif o==6 then
fill_M251_USCI(e,t,"D",5,"USCI1_DAT0",1)
fill_M251_USCI_IO(e,t,1,0)
elseif o==10 then
fill_M251_PSIO(e,t,"D",5,"PSIO0_CH6",0)
else
fill_invalid_GPIO(e,t,"D",5)
end
a[86]=e
e={}
e["pin_no"]="87"
e["texts"]={"PSIO0_CH7","USCI1_CTL1","I2C1_SDA","USCI0_CTL0","PD.4"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"D",4)
elseif o==3 then
fill_M251_USCI(e,t,"D",4,"USCI0_CTL0",0)
elseif o==4 then
fill_M251_I2C(e,t,"D",4,"I2C1_SDA",1)
elseif o==6 then
fill_M251_USCI(e,t,"D",4,"USCI1_CTL1",1)
elseif o==10 then
fill_M251_PSIO(e,t,"D",4,"PSIO0_CH7",0)
else
fill_invalid_GPIO(e,t,"D",4)
end
a[87]=e
e={}
e["pin_no"]="88"
e["texts"]={"UART0_TXD","USCI1_CTL0","SPI0_SS","USCI0_CTL1","EBI_AD10","PD.3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"D",3)
elseif o==2 then
fill_M251_EBI(e,t,"D",3,"EBI_AD10")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_USCI(e,t,"D",3,"USCI0_CTL1",0)
elseif o==4 then
fill_M251_SPI(e,t,"D",3,"SPI0_SS",1)
elseif o==6 then
fill_M251_USCI(e,t,"D",3,"USCI1_CTL0",1)
elseif o==9 then
fill_M251_UART(e,t,"D",3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",3)
end
a[88]=e
e={}
e["pin_no"]="89"
e["texts"]={"UART0_RXD","SPI0_CLK","USCI0_DAT1","EBI_AD11","PD.2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"D",2)
elseif o==2 then
fill_M251_EBI(e,t,"D",2,"EBI_AD11")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_USCI(e,t,"D",2,"USCI0_DAT1",0)
fill_M251_USCI_IO(e,t,0,1)
elseif o==4 then
fill_M251_SPI(e,t,"D",2,"SPI0_CLK",1)
elseif o==9 then
fill_M251_UART(e,t,"D",2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",2)
end
a[89]=e
e={}
e["pin_no"]="90"
e["texts"]={"SPI0_MISO","USCI0_DAT0","EBI_AD12","PD.1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPL"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"D",1)
elseif o==2 then
fill_M251_EBI(e,t,"D",1,"EBI_AD12")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_USCI(e,t,"D",1,"USCI0_DAT0",0)
fill_M251_USCI_IO(e,t,0,0)
elseif o==4 then
fill_M251_SPI(e,t,"D",1,"SPI0_MISO",1)
fill_M251_SPI_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"D",1)
end
a[90]=e
e={}
e["pin_no"]="91"
e["texts"]={"TM2","SPI0_MOSI","USCI0_CLK","EBI_AD13","PD.0"}
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"D",0)
elseif o==2 then
fill_M251_EBI(e,t,"D",0,"EBI_AD13")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_USCI(e,t,"D",0,"USCI0_CLK",0)
elseif o==4 then
fill_M251_SPI(e,t,"D",0,"SPI0_MOSI",1)
fill_M251_SPI_IO(e,t,1,false)
elseif o==14 then
fill_M251_TM(e,t,"D",0,"TM2",2)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[91]=e
e={}
e["pin_no"]="92"
e["texts"]={"USCI2_CTL0","SPI0_I2SMCLK","EBI_AD10","PD.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPD_MFPH"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"D",13)
elseif o==2 then
fill_M251_EBI(e,t,"D",13,"EBI_AD10")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_SPI(e,t,"D",13,"SPI0_I2SMCLK",1)
elseif o==8 then
fill_M251_USCI(e,t,"D",13,"USCI2_CTL0",2)
else
fill_invalid_GPIO(e,t,"D",13)
end
a[92]=e
e={}
e["pin_no"]="93"
e["texts"]={"USB_VBUS"}
fill_M251_Normal(e,t,nil,nil,"USB_VBUS")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[93]=e
e={}
e["pin_no"]="94"
e["texts"]={"USB_D-"}
fill_M251_USB(e,t,nil,nil,"USB_D-")
a[94]=e
e={}
e["pin_no"]="95"
e["texts"]={"USB_D+"}
fill_M251_USB(e,t,nil,nil,"USB_D+")
a[95]=e
e={}
e["pin_no"]="96"
e["texts"]={"USB_VDD33_CAP"}
fill_M251_Normal(e,t,nil,nil,"USB_VDD33_CAP")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[96]=e
e={}
e["pin_no"]="97"
e["texts"]={"BPWM0_CH5","PWM0_CH0","PSIO0_CH0","PE.7"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPL"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"E",7)
elseif o==10 then
fill_M251_PSIO(e,t,"E",7,"PSIO0_CH0",0)
elseif o==12 then
fill_M251_PWM(e,t,"E",7,"PWM0_CH0",0,0)
elseif o==13 then
fill_M251_BPWM(e,t,"E",7,"BPWM0_CH5",0,5)
else
fill_invalid_GPIO(e,t,"E",7)
end
a[97]=e
e={}
e["pin_no"]="98"
e["texts"]={"BPWM0_CH4","PWM0_CH1","PSIO0_CH1","USCI0_CTL0","SC0_nCD","PE.6"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPL"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"E",6)
elseif o==6 then
fill_M251_SC(e,t,"E",6,"SC0_nCD",0)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_M251_USCI(e,t,"E",6,"USCI0_CTL0",0)
elseif o==10 then
fill_M251_PSIO(e,t,"E",6,"PSIO0_CH1",0)
elseif o==12 then
fill_M251_PWM(e,t,"E",6,"PWM0_CH1",0,1)
elseif o==13 then
fill_M251_BPWM(e,t,"E",6,"BPWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"E",6)
end
a[98]=e
e={}
e["pin_no"]="99"
e["texts"]={"BPWM0_CH3","PWM0_CH2","PSIO0_CH2","USCI0_CTL1","SC0_PWR","EBI_nRD","PE.5"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPL"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"E",5)
elseif o==2 then
fill_M251_EBI(e,t,"E",5,"EBI_nRD")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_SC(e,t,"E",5,"SC0_PWR",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M251_USCI(e,t,"E",5,"USCI0_CTL1",0)
elseif o==10 then
fill_M251_PSIO(e,t,"E",5,"PSIO0_CH2",0)
elseif o==12 then
fill_M251_PWM(e,t,"E",5,"PWM0_CH2",0,2)
elseif o==13 then
fill_M251_BPWM(e,t,"E",5,"BPWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"E",5)
end
a[99]=e
e={}
e["pin_no"]="100"
e["texts"]={"BPWM0_CH2","PWM0_CH3","PSIO0_CH3","USCI0_DAT1","SC0_RST","EBI_nWR","PE.4"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPL"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"E",4)
elseif o==2 then
fill_M251_EBI(e,t,"E",4,"EBI_nWR")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_SC(e,t,"E",4,"SC0_RST",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M251_USCI(e,t,"E",4,"USCI0_DAT1",0)
fill_M251_USCI_IO(e,t,0,1)
elseif o==10 then
fill_M251_PSIO(e,t,"E",4,"PSIO0_CH3",0)
elseif o==12 then
fill_M251_PWM(e,t,"E",4,"PWM0_CH3",0,3)
elseif o==13 then
fill_M251_BPWM(e,t,"E",4,"BPWM0_CH2",0,2)
else
fill_invalid_GPIO(e,t,"E",4)
end
a[100]=e
e={}
e["pin_no"]="101"
e["texts"]={"BPWM0_CH1","PWM0_CH4","USCI0_DAT0","SC0_DAT","EBI_MCLK","PE.3"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPL"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"E",3)
elseif o==2 then
fill_M251_EBI(e,t,"E",3,"EBI_MCLK")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_SC(e,t,"E",3,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==7 then
fill_M251_USCI(e,t,"E",3,"USCI0_DAT0",0)
fill_M251_USCI_IO(e,t,0,0)
elseif o==12 then
fill_M251_PWM(e,t,"E",3,"PWM0_CH4",0,4)
elseif o==13 then
fill_M251_BPWM(e,t,"E",3,"BPWM0_CH1",0,1)
else
fill_invalid_GPIO(e,t,"E",3)
end
a[101]=e
e={}
e["pin_no"]="102"
e["texts"]={"BPWM0_CH0","PWM0_CH5","USCI2_CTL0","USCI0_CLK","SC0_CLK","EBI_ALE","PE.2"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPL"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"E",2)
elseif o==2 then
fill_M251_EBI(e,t,"E",2,"EBI_ALE")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_SC(e,t,"E",2,"SC0_CLK",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M251_USCI(e,t,"E",2,"USCI0_CLK",0)
elseif o==10 then
fill_M251_USCI(e,t,"E",2,"USCI2_CTL0",2)
elseif o==12 then
fill_M251_PWM(e,t,"E",2,"PWM0_CH5",0,5)
elseif o==13 then
fill_M251_BPWM(e,t,"E",2,"BPWM0_CH0",0,0)
else
fill_invalid_GPIO(e,t,"E",2)
end
a[102]=e
e={}
e["pin_no"]="103"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[103]=e
e={}
e["pin_no"]="104"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[104]=e
e={}
e["pin_no"]="105"
e["texts"]={"USCI2_DAT1","I2C1_SCL","QSPI0_MISO0","EBI_AD10","PE.1"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPE_MFPL"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"E",1)
elseif o==2 then
fill_M251_EBI(e,t,"E",1,"EBI_AD10")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_SPI(e,t,"E",1,"QSPI0_MISO0",0)
fill_M251_SPI_IO(e,t,0,true)
elseif o==8 then
fill_M251_I2C(e,t,"E",1,"I2C1_SCL",1)
elseif o==10 then
fill_M251_USCI(e,t,"E",1,"USCI2_DAT1",2)
fill_M251_USCI_IO(e,t,2,1)
else
fill_invalid_GPIO(e,t,"E",1)
end
a[105]=e
e={}
e["pin_no"]="106"
e["texts"]={"USCI2_DAT0","I2C1_SDA","QSPI0_MOSI0","EBI_AD11","PE.0"}
local o=ext.band(t["SYS_SYS_GPE_MFPL"],15)
if o==0 then
fill_M251_GPIO(e,t,"E",0)
elseif o==2 then
fill_M251_EBI(e,t,"E",0,"EBI_AD11")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_M251_SPI(e,t,"E",0,"QSPI0_MOSI0",0)
fill_M251_SPI_IO(e,t,0,false)
elseif o==8 then
fill_M251_I2C(e,t,"E",0,"I2C1_SDA",1)
elseif o==10 then
fill_M251_USCI(e,t,"E",0,"USCI2_DAT0",2)
fill_M251_USCI_IO(e,t,2,0)
else
fill_invalid_GPIO(e,t,"E",0)
end
a[106]=e
e={}
e["pin_no"]="107"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[107]=e
e={}
e["pin_no"]="107"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[107]=e
e={}
e["pin_no"]="108"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[108]=e
e={}
e["pin_no"]="109"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[109]=e
e={}
e["pin_no"]="110"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[110]=e
e={}
e["pin_no"]="111"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[111]=e
e={}
e["pin_no"]="112"
e["texts"]={"VSS"}
fill_M251_Normal(e,t,nil,nil,"VSS")
a[112]=e
e={}
e["pin_no"]="113"
e["texts"]={"LDO_CAP"}
fill_M251_Normal(e,t,nil,nil,"LDO_CAP")
a[113]=e
e={}
e["pin_no"]="114"
e["texts"]={"VDD"}
fill_M251_Normal(e,t,nil,nil,"VDD")
a[114]=e
e={}
e["pin_no"]="115"
e["texts"]={"TM1","USCI2_CLK","QSPI0_CLK","USCI0_CTL0","SPI0_I2SMCLK","EBI_AD11","PC.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPC_MFPH"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"C",14)
elseif o==2 then
fill_M251_EBI(e,t,"C",14,"EBI_AD11")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_M251_SPI(e,t,"C",14,"SPI0_I2SMCLK",1)
elseif o==5 then
fill_M251_USCI(e,t,"C",14,"USCI0_CTL0",0)
elseif o==6 then
fill_M251_SPI(e,t,"C",14,"QSPI0_CLK",0)
elseif o==7 then
fill_M251_USCI(e,t,"C",14,"USCI2_CLK",2)
elseif o==13 then
fill_M251_TM(e,t,"C",14,"TM1",1)
else
fill_invalid_GPIO(e,t,"C",14)
end
a[115]=e
e={}
e["pin_no"]="116"
e["texts"]={"PWM0_BRAKE1","TM0_EXT","PWM1_CH0","PSIO0_CH0","UART0_nCTS","USCI0_CTL1","SPI0_SS","EBI_AD12","EADC0_CH15","PB.15"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"B",15)
elseif o==1 then
fill_M251_Analog(e,t,"B",15,"EADC0_CH15",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",15,"EBI_AD12")
e["direction"]=kPinDirection_Bi
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
a[116]=e
e={}
e["pin_no"]="117"
e["texts"]={"CLKO","TM1_EXT","PWM1_CH1","PSIO0_CH1","UART0_nRTS","USCI0_DAT1","SPI0_CLK","EBI_AD13","EADC0_CH14","PB.14"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"B",14)
elseif o==1 then
fill_M251_Analog(e,t,"B",14,"EADC0_CH14",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",14,"EBI_AD13")
e["direction"]=kPinDirection_Bi
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
a[117]=e
e={}
e["pin_no"]="118"
e["texts"]={"TM2_EXT","PWM1_CH2","PSIO0_CH2","UART0_TXD","USCI0_DAT0","SPI0_MISO","EBI_AD14","ACMP1_P3","ACMP0_P3","EADC0_CH13","PB.13"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],20),15)
if o==0 then
fill_M251_GPIO(e,t,"B",13)
elseif o==1 then
fill_M251_Analog(e,t,"B",13,"ACMP1_P3,ACMP0_P3,EADC0_CH13",{0},nil,{0,1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="ACMP1_P3,ACMP0_P3,EADC0_CH13"
e["texts"]={"TM2_EXT","PWM1_CH2","PSIO0_CH2","UART0_TXD","USCI0_DAT0","SPI0_MISO","EBI_AD14","ACMP1_P3,ACMP0_P3,EADC0_CH13","PB.13"}
elseif o==2 then
fill_M251_EBI(e,t,"B",13,"EBI_AD14")
e["direction"]=kPinDirection_Bi
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
a[118]=e
e={}
e["pin_no"]="119"
e["texts"]={"TM3_EXT","PWM1_CH3","PSIO0_CH3","UART0_RXD","USCI0_CLK","SPI0_MOSI","EBI_AD15","ACMP1_P2","ACMP0_P2","EADC0_CH12","PB.12"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],16),15)
if o==0 then
fill_M251_GPIO(e,t,"B",12)
elseif o==1 then
fill_M251_Analog(e,t,"B",12,"ACMP1_P2,ACMP0_P2,EADC0_CH12",{0},nil,{0,1},nil)
e["direction"]=kPinDirection_In
e["highlight_text"]="ACMP1_P2,ACMP0_P2,EADC0_CH12"
e["texts"]={"TM3_EXT","PWM1_CH3","PSIO0_CH3","UART0_RXD","USCI0_CLK","SPI0_MOSI","EBI_AD15","ACMP1_P2,ACMP0_P2,EADC0_CH12","PB.12"}
elseif o==2 then
fill_M251_EBI(e,t,"B",12,"EBI_AD15")
e["direction"]=kPinDirection_Bi
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
a[119]=e
e={}
e["pin_no"]="120"
e["texts"]={"AVDD"}
fill_M251_Normal(e,t,nil,nil,"AVDD")
a[120]=e
e={}
e["pin_no"]="121"
e["texts"]={"VREF"}
fill_M251_Normal(e,t,nil,nil,"VREF")
a[121]=e
e={}
e["pin_no"]="122"
e["texts"]={"AVSS"}
fill_M251_Normal(e,t,nil,nil,"AVSS")
a[122]=e
e={}
e["pin_no"]="123"
e["texts"]={"BPWM1_CH0","SPI0_I2SMCLK","I2C1_SCL","UART0_nCTS","EBI_ADR16","EADC0_CH11","PB.11"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],12),15)
if o==0 then
fill_M251_GPIO(e,t,"B",11)
elseif o==1 then
fill_M251_Analog(e,t,"B",11,"EADC0_CH11",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",11,"EBI_ADR16")
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M251_UART(e,t,"B",11,"UART0_nCTS",0)
elseif o==7 then
fill_M251_I2C(e,t,"B",11,"I2C1_SCL",1)
elseif o==9 then
fill_M251_SPI(e,t,"B",11,"SPI0_I2SMCLK",1)
elseif o==10 then
fill_M251_BPWM(e,t,"B",11,"BPWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"B",11)
end
a[123]=e
e={}
e["pin_no"]="124"
e["texts"]={"BPWM1_CH1","I2C1_SDA","UART0_nRTS","USCI1_CTL0","EBI_ADR17","EADC0_CH10","PB.10"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],8),15)
if o==0 then
fill_M251_GPIO(e,t,"B",10)
elseif o==1 then
fill_M251_Analog(e,t,"B",10,"EADC0_CH10",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",10,"EBI_ADR17")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_USCI(e,t,"B",10,"USCI1_CTL0",1)
elseif o==5 then
fill_M251_UART(e,t,"B",10,"UART0_nRTS",0)
elseif o==7 then
fill_M251_I2C(e,t,"B",10,"I2C1_SDA",1)
elseif o==10 then
fill_M251_BPWM(e,t,"B",10,"BPWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[124]=e
e={}
e["pin_no"]="125"
e["texts"]={"BPWM1_CH2","I2C1_SMBAL","UART1_nCTS","UART0_TXD","USCI1_CTL1","EBI_ADR18","EADC0_CH9","PB.9"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPH"],4),15)
if o==0 then
fill_M251_GPIO(e,t,"B",9)
elseif o==1 then
fill_M251_Analog(e,t,"B",9,"EADC0_CH9",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",9,"EBI_ADR18")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_USCI(e,t,"B",9,"USCI1_CTL1",1)
elseif o==5 then
fill_M251_UART(e,t,"B",9,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M251_UART(e,t,"B",9,"UART1_nCTS",1)
elseif o==7 then
fill_M251_I2C(e,t,"B",9,"I2C1_SMBAL",1)
elseif o==10 then
fill_M251_BPWM(e,t,"B",9,"BPWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"B",9)
end
a[125]=e
e={}
e["pin_no"]="126"
e["texts"]={"BPWM1_CH3","I2C1_SMBSUS","UART1_nRTS","UART0_RXD","USCI1_CLK","EBI_ADR19","EADC0_CH8","PB.8"}
local o=ext.band(t["SYS_SYS_GPB_MFPH"],15)
if o==0 then
fill_M251_GPIO(e,t,"B",8)
elseif o==1 then
fill_M251_Analog(e,t,"B",8,"EADC0_CH8",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",8,"EBI_ADR19")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_USCI(e,t,"B",8,"USCI1_CLK",1)
elseif o==5 then
fill_M251_UART(e,t,"B",8,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M251_UART(e,t,"B",8,"UART1_nRTS",1)
elseif o==7 then
fill_M251_I2C(e,t,"B",8,"I2C1_SMBSUS",1)
elseif o==10 then
fill_M251_BPWM(e,t,"B",8,"BPWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"B",8)
end
a[126]=e
e={}
e["pin_no"]="127"
e["texts"]={"ACMP0_O","INT5","PWM1_CH4","PWM1_BRAKE0","BPWM1_CH4","EBI_nCS0","UART1_TXD","USCI1_DAT0","EBI_nWRL","EADC0_CH7","PB.7"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],28),15)
if o==0 then
fill_M251_GPIO(e,t,"B",7)
elseif o==1 then
fill_M251_Analog(e,t,"B",7,"EADC0_CH7",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",7,"EBI_nWRL")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_USCI(e,t,"B",7,"USCI1_DAT0",1)
fill_M251_USCI_IO(e,t,1,0)
elseif o==6 then
fill_M251_UART(e,t,"B",7,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M251_EBI(e,t,"B",7,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M251_BPWM(e,t,"B",7,"BPWM1_CH4",1,4)
elseif o==11 then
fill_M251_PWM(e,t,"B",7,"PWM1_BRAKE0",1)
elseif o==12 then
fill_M251_PWM(e,t,"B",7,"PWM1_CH4",1,4)
elseif o==13 then
fill_M251_Normal(e,t,"B",7,"INT5")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==15 then
fill_M251_ACMP(e,t,"B",7,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",7)
end
a[127]=e
e={}
e["pin_no"]="128"
e["texts"]={"ACMP1_O","INT4","PWM1_CH5","PWM1_BRAKE1","BPWM1_CH5","EBI_nCS1","UART1_RXD","USCI1_DAT1","EBI_nWRH","EADC0_CH6","PB.6"}
local o=ext.band(ext.rshift(t["SYS_SYS_GPB_MFPL"],24),15)
if o==0 then
fill_M251_GPIO(e,t,"B",6)
elseif o==1 then
fill_M251_Analog(e,t,"B",6,"EADC0_CH6",{0},nil,nil,nil)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M251_EBI(e,t,"B",6,"EBI_nWRH")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M251_USCI(e,t,"B",6,"USCI1_DAT1",1)
fill_M251_USCI_IO(e,t,1,1)
elseif o==6 then
fill_M251_UART(e,t,"B",6,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M251_EBI(e,t,"B",6,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M251_BPWM(e,t,"B",6,"BPWM1_CH5",1,5)
elseif o==11 then
fill_M251_PWM(e,t,"B",6,"PWM1_BRAKE1",1)
elseif o==12 then
fill_M251_PWM(e,t,"B",6,"PWM1_CH5",1,5)
elseif o==13 then
fill_M251_Normal(e,t,"B",6,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==15 then
fill_M251_ACMP(e,t,"B",6,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",6)
end
a[128]=e
return{name=i,information="",pins=a}
end
