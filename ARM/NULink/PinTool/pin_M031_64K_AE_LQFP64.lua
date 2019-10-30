local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M031.lua")
function get_chip_status_M031_64K_AE_LQFP64(i,e,o,t)
local a={}
local t=read_M031_Registers(i,e,o,t)
local e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],251658240),24)
e={}
e["pin_no"]="1"
e["texts"]={"PB.6","EADC0_CH6","UART1_RXD","PWM1_BRAKE1","PWM1_CH5","INT4","ACMP1_O"}
if o==0 then
fill_M031_GPIO(e,t,"B",6)
elseif o==1 then
fill_M031_EADC(e,t,"B",6,"EADC0_CH6")
elseif o==6 then
fill_M031_UART(e,t,"B",6,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M031_EPWM(e,t,"B",6,"PWM1_BRAKE1",1)
elseif o==12 then
fill_M031_EPWM(e,t,"B",6,"PWM1_CH5",1,5)
elseif o==13 then
fill_M031_Normal(e,t,"B",6,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==15 then
fill_M031_ACMP(e,t,"B",6,"ACMP1_O",1)
else
fill_invalid_GPIO(e,t,"B",6)
end
a[1]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="2"
e["texts"]={"PB.5","EADC0_CH5","ACMP1_N","I2C0_SCL","PWM0_CH0","UART2_TXD","TM0","INT0"}
if o==0 then
fill_M031_GPIO(e,t,"B",5)
elseif o==1 then
fill_M031_Analog(e,t,"B",5,"EADC0_CH5,ACMP1_N",{0},{1})
e["highlight_text"]="EADC0_CH5,ACMP1_N"
e["texts"]={"PB.5","EADC0_CH5,ACMP1_N","I2C0_SCL","PWM0_CH0","UART2_TXD","TM0","INT0"}
elseif o==6 then
fill_M031_I2C(e,t,"B",5,"I2C0_SCL",0)
elseif o==11 then
fill_M031_EPWM(e,t,"B",5,"PWM0_CH0",0,0)
elseif o==13 then
fill_M031_UART(e,t,"B",5,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==14 then
fill_M031_TM(e,t,"B",5,"TM0",0)
elseif o==15 then
fill_M031_Normal(e,t,"B",5,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",5)
end
a[2]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="3"
e["texts"]={"PB.4","EADC0_CH4","ACMP1_P1","I2C0_SDA","PWM0_CH1","UART2_RXD","TM1","INT1"}
if o==0 then
fill_M031_GPIO(e,t,"B",4)
elseif o==1 then
fill_M031_Analog(e,t,"B",4,"EADC0_CH4,ACMP1_P1",{0},{1})
e["highlight_text"]="EADC0_CH4,ACMP1_P1"
e["texts"]={"PB.4","EADC0_CH4,ACMP1_P1","I2C0_SDA","PWM0_CH1","UART2_RXD","TM1","INT1"}
elseif o==6 then
fill_M031_I2C(e,t,"B",4,"I2C0_SDA",0)
elseif o==11 then
fill_M031_EPWM(e,t,"B",4,"PWM0_CH1",0,1)
elseif o==13 then
fill_M031_UART(e,t,"B",4,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M031_TM(e,t,"B",4,"TM1",1)
elseif o==15 then
fill_M031_Normal(e,t,"B",4,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",4)
end
a[3]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="4"
e["texts"]={"PB.3","EADC0_CH3","ACMP0_N","I2C1_SCL","UART1_TXD","PWM0_CH2","PWM0_BRAKE0","TM2","INT2"}
if o==0 then
fill_M031_GPIO(e,t,"B",3)
elseif o==1 then
fill_M031_Analog(e,t,"B",3,"EADC0_CH3,ACMP0_N",{0},{0})
e["highlight_text"]="EADC0_CH3,ACMP0_N"
e["texts"]={"PB.3","EADC0_CH3,ACMP0_N","I2C1_SCL","UART1_TXD","PWM0_CH2","PWM0_BRAKE0","TM2","INT2"}
elseif o==4 then
fill_M031_I2C(e,t,"B",3,"I2C1_SCL",1)
elseif o==6 then
fill_M031_UART(e,t,"B",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M031_EPWM(e,t,"B",3,"PWM0_CH2",0,2)
elseif o==13 then
fill_M031_EPWM(e,t,"B",3,"PWM0_BRAKE0",0)
elseif o==14 then
fill_M031_TM(e,t,"B",3,"TM2",2)
elseif o==15 then
fill_M031_Normal(e,t,"B",3,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",3)
end
a[4]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="5"
e["texts"]={"PB.2","EADC0_CH2","ACMP0_P1","I2C1_SDA","UART1_RXD","PWM0_CH3","TM3","INT3"}
if o==0 then
fill_M031_GPIO(e,t,"B",2)
elseif o==1 then
fill_M031_Analog(e,t,"B",2,"EADC0_CH2,ACMP0_P1",{0},{0})
e["highlight_text"]="EADC0_CH2,ACMP0_P1"
e["texts"]={"PB.2","EADC0_CH2,ACMP0_P1","I2C1_SDA","UART1_RXD","PWM0_CH3","TM3","INT3"}
elseif o==4 then
fill_M031_I2C(e,t,"B",2,"I2C1_SDA",1)
elseif o==6 then
fill_M031_UART(e,t,"B",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M031_EPWM(e,t,"B",2,"PWM0_CH3",0,3)
elseif o==14 then
fill_M031_TM(e,t,"B",2,"TM3",3)
elseif o==15 then
fill_M031_Normal(e,t,"B",2,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",2)
end
a[5]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],240),4)
e={}
e["pin_no"]="6"
e["texts"]={"PB.1","EADC0_CH1","UART2_TXD","I2C1_SCL","PWM0_CH4","PWM1_CH4","PWM0_BRAKE0"}
if o==0 then
fill_M031_GPIO(e,t,"B",1)
elseif o==1 then
fill_M031_EADC(e,t,"B",1,"EADC0_CH1")
elseif o==7 then
fill_M031_UART(e,t,"B",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M031_I2C(e,t,"B",1,"I2C1_SCL",1)
elseif o==11 then
fill_M031_EPWM(e,t,"B",1,"PWM0_CH4",0,4)
elseif o==12 then
fill_M031_EPWM(e,t,"B",1,"PWM1_CH4",1,4)
elseif o==13 then
fill_M031_EPWM(e,t,"B",1,"PWM0_BRAKE0",0)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[6]=e
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
e={}
e["pin_no"]="7"
e["texts"]={"PB.0","EADC0_CH0","UART2_RXD","SPI0_I2SMCLK","I2C1_SDA","PWM0_CH5","PWM1_CH5","PWM0_BRAKE1"}
if o==0 then
fill_M031_GPIO(e,t,"B",0)
elseif o==1 then
fill_M031_EADC(e,t,"B",0,"EADC0_CH0")
elseif o==7 then
fill_M031_UART(e,t,"B",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M031_SPI(e,t,"B",0,"SPI0_I2SMCLK",0)
elseif o==9 then
fill_M031_I2C(e,t,"B",0,"I2C1_SDA",1)
elseif o==11 then
fill_M031_EPWM(e,t,"B",0,"PWM0_CH5",0,5)
elseif o==12 then
fill_M031_EPWM(e,t,"B",0,"PWM1_CH5",1,5)
elseif o==13 then
fill_M031_EPWM(e,t,"B",0,"PWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[7]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],61440),12)
e={}
e["pin_no"]="8"
e["texts"]={"PA.11","ACMP0_P0","USCI0_CLK","TM0_EXT"}
if o==0 then
fill_M031_GPIO(e,t,"A",11)
elseif o==1 then
fill_M031_ACMP(e,t,"A",11,"ACMP0_P0",0)
elseif o==6 then
fill_M031_USCI(e,t,"A",11,"USCI0_CLK",0)
elseif o==13 then
fill_M031_TM(e,t,"A",11,"TM0_EXT",0)
else
fill_invalid_GPIO(e,t,"A",11)
end
a[8]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],3840),8)
e={}
e["pin_no"]="9"
e["texts"]={"PA.10","ACMP1_P0","USCI0_DAT0","TM1_EXT"}
if o==0 then
fill_M031_GPIO(e,t,"A",10)
elseif o==1 then
fill_M031_ACMP(e,t,"A",10,"ACMP1_P0",1)
elseif o==6 then
fill_M031_USCI(e,t,"A",10,"USCI0_DAT0",0)
fill_M031_USCI_IO(e,t,0,0)
elseif o==13 then
fill_M031_TM(e,t,"A",10,"TM1_EXT",1)
else
fill_invalid_GPIO(e,t,"A",10)
end
a[9]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],240),4)
e={}
e["pin_no"]="10"
e["texts"]={"PA.9","USCI0_DAT1","UART1_TXD","TM2_EXT"}
if o==0 then
fill_M031_GPIO(e,t,"A",9)
elseif o==6 then
fill_M031_USCI(e,t,"A",9,"USCI0_DAT1",0)
fill_M031_USCI_IO(e,t,0,1)
elseif o==7 then
fill_M031_UART(e,t,"A",9,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==13 then
fill_M031_TM(e,t,"A",9,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"A",9)
end
a[10]=e
local o=ext.band(t["SYS_SYS_GPA_MFPH"],15)
e={}
e["pin_no"]="11"
e["texts"]={"PA.8","USCI0_CTL1","UART1_RXD","TM3_EXT","INT4"}
if o==0 then
fill_M031_GPIO(e,t,"A",8)
elseif o==6 then
fill_M031_USCI(e,t,"A",8,"USCI0_CTL1",0)
elseif o==7 then
fill_M031_UART(e,t,"A",8,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==13 then
fill_M031_TM(e,t,"A",8,"TM3_EXT",3)
elseif o==15 then
fill_M031_Normal(e,t,"A",8,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",8)
end
a[11]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],251658240),24)
e={}
e["pin_no"]="12"
e["texts"]={"PF.6","SPI0_MOSI"}
if o==0 then
fill_M031_GPIO(e,t,"F",6)
elseif o==5 then
fill_M031_SPI(e,t,"F",6,"SPI0_MOSI",0)
fill_M031_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"F",6)
end
a[12]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPH"],251658240),24)
e={}
e["pin_no"]="13"
e["texts"]={"PF.14","PWM1_BRAKE0","PWM0_BRAKE0","PWM0_CH4","CLKO","TM3","INT5"}
if o==0 then
fill_M031_GPIO(e,t,"F",14)
elseif o==9 then
fill_M031_EPWM(e,t,"F",14,"PWM1_BRAKE0",1)
elseif o==10 then
fill_M031_EPWM(e,t,"F",14,"PWM0_BRAKE0",0)
elseif o==12 then
fill_M031_EPWM(e,t,"F",14,"PWM0_CH4",0,4)
elseif o==13 then
fill_M031_CLKO(e,t,"F",14,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==14 then
fill_M031_TM(e,t,"F",14,"TM3",3)
elseif o==15 then
fill_M031_Normal(e,t,"F",14,"INT5")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",14)
end
a[13]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],15728640),20)
e={}
e["pin_no"]="14"
e["texts"]={"PF.5","UART2_RXD","UART2_nCTS","PWM0_CH0","X32_IN","EADC0_ST"}
if o==0 then
fill_M031_GPIO(e,t,"F",5)
elseif o==2 then
fill_M031_UART(e,t,"F",5,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M031_UART(e,t,"F",5,"UART2_nCTS",2)
elseif o==7 then
fill_M031_EPWM(e,t,"F",5,"PWM0_CH0",0,0)
elseif o==10 then
fill_M031_Normal(e,t,"F",5,"X32_IN")
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M031_EADC(e,t,"F",5,"EADC0_ST")
else
fill_invalid_GPIO(e,t,"F",5)
end
a[14]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],983040),16)
e={}
e["pin_no"]="15"
e["texts"]={"PF.4","UART2_TXD","UART2_nRTS","PWM0_CH1","X32_OUT"}
if o==0 then
fill_M031_GPIO(e,t,"F",4)
elseif o==2 then
fill_M031_UART(e,t,"F",4,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M031_UART(e,t,"F",4,"UART2_nRTS",2)
elseif o==7 then
fill_M031_EPWM(e,t,"F",4,"PWM0_CH1",0,1)
elseif o==10 then
fill_M031_Normal(e,t,"F",4,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"F",4)
end
a[15]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="16"
e["texts"]={"PF.3","UART0_TXD","I2C0_SCL","XT1_IN"}
if o==0 then
fill_M031_GPIO(e,t,"F",3)
elseif o==3 then
fill_M031_UART(e,t,"F",3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M031_I2C(e,t,"F",3,"I2C0_SCL",0)
elseif o==10 then
fill_M031_Normal(e,t,"F",3,"XT1_IN")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",3)
end
a[16]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="17"
e["texts"]={"PF.2","UART0_RXD","I2C0_SDA","XT1_OUT"}
if o==0 then
fill_M031_GPIO(e,t,"F",2)
elseif o==3 then
fill_M031_UART(e,t,"F",2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M031_I2C(e,t,"F",2,"I2C0_SDA",0)
elseif o==10 then
fill_M031_Normal(e,t,"F",2,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"F",2)
end
a[17]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],4026531840),28)
e={}
e["pin_no"]="18"
e["texts"]={"PC.7","UART0_nCTS","PWM1_CH2","TM0","INT3"}
if o==0 then
fill_M031_GPIO(e,t,"C",7)
elseif o==7 then
fill_M031_UART(e,t,"C",7,"UART0_nCTS",0)
elseif o==11 then
fill_M031_EPWM(e,t,"C",7,"PWM1_CH2",1,2)
elseif o==14 then
fill_M031_TM(e,t,"C",7,"TM0",0)
elseif o==15 then
fill_M031_Normal(e,t,"C",7,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",7)
end
a[18]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],251658240),24)
e={}
e["pin_no"]="19"
e["texts"]={"PC.6","UART0_nRTS","PWM1_CH3","TM1","INT2"}
if o==0 then
fill_M031_GPIO(e,t,"C",6)
elseif o==7 then
fill_M031_UART(e,t,"C",6,"UART0_nRTS",0)
elseif o==11 then
fill_M031_EPWM(e,t,"C",6,"PWM1_CH3",1,3)
elseif o==14 then
fill_M031_TM(e,t,"C",6,"TM1",1)
elseif o==15 then
fill_M031_Normal(e,t,"C",6,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",6)
end
a[19]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],4026531840),28)
e={}
e["pin_no"]="20"
e["texts"]={"PA.7","UART0_TXD","I2C1_SCL","PWM1_CH4","ACMP0_WLAT","TM2","INT1"}
if o==0 then
fill_M031_GPIO(e,t,"A",7)
elseif o==7 then
fill_M031_UART(e,t,"A",7,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M031_I2C(e,t,"A",7,"I2C1_SCL",1)
elseif o==11 then
fill_M031_EPWM(e,t,"A",7,"PWM1_CH4",1,4)
elseif o==13 then
fill_M031_ACMP(e,t,"A",7,"ACMP0_WLAT",0)
elseif o==14 then
fill_M031_TM(e,t,"A",7,"TM2",2)
elseif o==15 then
fill_M031_Normal(e,t,"A",7,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",7)
end
a[20]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],251658240),24)
e={}
e["pin_no"]="21"
e["texts"]={"PA.6","UART0_RXD","I2C1_SDA","PWM1_CH5","ACMP1_WLAT","TM3","INT0"}
if o==0 then
fill_M031_GPIO(e,t,"A",6)
elseif o==7 then
fill_M031_UART(e,t,"A",6,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M031_I2C(e,t,"A",6,"I2C1_SDA",1)
elseif o==11 then
fill_M031_EPWM(e,t,"A",6,"PWM1_CH5",1,5)
elseif o==13 then
fill_M031_ACMP(e,t,"A",6,"ACMP1_WLAT",1)
elseif o==14 then
fill_M031_TM(e,t,"A",6,"TM3",3)
elseif o==15 then
fill_M031_Normal(e,t,"A",6,"INT0")
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
fill_M031_Normal(e,t,nil,nil,"VSS")
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"VDD"}
fill_M031_Normal(e,t,nil,nil,"VDD")
a[23]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],4026531840),28)
e={}
e["pin_no"]="24"
e["texts"]={"PD.15","PWM0_CH5","TM3","INT1"}
if o==0 then
fill_M031_GPIO(e,t,"D",15)
elseif o==12 then
fill_M031_EPWM(e,t,"D",15,"PWM0_CH5",0,5)
elseif o==14 then
fill_M031_TM(e,t,"D",15,"TM3",3)
elseif o==15 then
fill_M031_Normal(e,t,"D",15,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",15)
end
a[24]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],15728640),20)
e={}
e["pin_no"]="25"
e["texts"]={"PA.5","UART0_nCTS","UART0_TXD","I2C0_SCL","PWM0_CH0"}
if o==0 then
fill_M031_GPIO(e,t,"A",5)
elseif o==7 then
fill_M031_UART(e,t,"A",5,"UART0_nCTS",0)
elseif o==8 then
fill_M031_UART(e,t,"A",5,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M031_I2C(e,t,"A",5,"I2C0_SCL",0)
elseif o==13 then
fill_M031_EPWM(e,t,"A",5,"PWM0_CH0",0,0)
else
fill_invalid_GPIO(e,t,"A",5)
end
a[25]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],983040),16)
e={}
e["pin_no"]="26"
e["texts"]={"PA.4","SPI0_I2SMCLK","UART0_nRTS","UART0_RXD","I2C0_SDA","PWM0_CH1"}
if o==0 then
fill_M031_GPIO(e,t,"A",4)
elseif o==4 then
fill_M031_SPI(e,t,"A",4,"SPI0_I2SMCLK",0)
elseif o==7 then
fill_M031_UART(e,t,"A",4,"UART0_nRTS",0)
elseif o==8 then
fill_M031_UART(e,t,"A",4,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M031_I2C(e,t,"A",4,"I2C0_SDA",0)
elseif o==13 then
fill_M031_EPWM(e,t,"A",4,"PWM0_CH1",0,1)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[26]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="27"
e["texts"]={"PA.3","SPI0_SS","UART1_TXD","I2C1_SCL","PWM0_CH2","CLKO","PWM1_BRAKE1"}
if o==0 then
fill_M031_GPIO(e,t,"A",3)
elseif o==4 then
fill_M031_SPI(e,t,"A",3,"SPI0_SS",0)
elseif o==8 then
fill_M031_UART(e,t,"A",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M031_I2C(e,t,"A",3,"I2C1_SCL",1)
elseif o==13 then
fill_M031_EPWM(e,t,"A",3,"PWM0_CH2",0,2)
elseif o==14 then
fill_M031_CLKO(e,t,"A",3,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==15 then
fill_M031_EPWM(e,t,"A",3,"PWM1_BRAKE1",1)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[27]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="28"
e["texts"]={"PA.2","SPI0_CLK","UART1_RXD","I2C1_SDA","PWM0_CH3"}
if o==0 then
fill_M031_GPIO(e,t,"A",2)
elseif o==4 then
fill_M031_SPI(e,t,"A",2,"SPI0_CLK",0)
elseif o==8 then
fill_M031_UART(e,t,"A",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M031_I2C(e,t,"A",2,"I2C1_SDA",1)
elseif o==13 then
fill_M031_EPWM(e,t,"A",2,"PWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[28]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],240),4)
e={}
e["pin_no"]="29"
e["texts"]={"PA.1","SPI0_MISO","UART0_TXD","UART1_nCTS","PWM0_CH4"}
if o==0 then
fill_M031_GPIO(e,t,"A",1)
elseif o==4 then
fill_M031_SPI(e,t,"A",1,"SPI0_MISO",0)
fill_M031_SPI_IO(e,t,0,true)
elseif o==7 then
fill_M031_UART(e,t,"A",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M031_UART(e,t,"A",1,"UART1_nCTS",1)
elseif o==13 then
fill_M031_EPWM(e,t,"A",1,"PWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[29]=e
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
e={}
e["pin_no"]="30"
e["texts"]={"PA.0","SPI0_MOSI","UART0_RXD","UART1_nRTS","PWM0_CH5"}
if o==0 then
fill_M031_GPIO(e,t,"A",0)
elseif o==4 then
fill_M031_SPI(e,t,"A",0,"SPI0_MOSI",0)
fill_M031_SPI_IO(e,t,0,false)
elseif o==7 then
fill_M031_UART(e,t,"A",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M031_UART(e,t,"A",0,"UART1_nRTS",1)
elseif o==13 then
fill_M031_EPWM(e,t,"A",0,"PWM0_CH5",0,5)
else
fill_invalid_GPIO(e,t,"A",0)
end
a[30]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPH"],4026531840),28)
e={}
e["pin_no"]="31"
e["texts"]={"PF.15","PWM0_BRAKE0","PWM0_CH1","TM2","CLKO","INT4"}
if o==0 then
fill_M031_GPIO(e,t,"F",15)
elseif o==11 then
fill_M031_EPWM(e,t,"F",15,"PWM0_BRAKE0",0)
elseif o==12 then
fill_M031_EPWM(e,t,"F",15,"PWM0_CH1",0,1)
elseif o==13 then
fill_M031_TM(e,t,"F",15,"TM2",2)
elseif o==14 then
fill_M031_CLKO(e,t,"F",15,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==15 then
fill_M031_Normal(e,t,"F",15,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",15)
end
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"nRESET"}
fill_M031_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[32]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="33"
e["texts"]={"ICE_DAT","UART0_TXD","I2C1_SCL","UART1_TXD","PF.0"}
if o==0 then
fill_M031_GPIO(e,t,"F",0)
elseif o==2 then
fill_M031_UART(e,t,"F",0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M031_I2C(e,t,"F",0,"I2C1_SCL",1)
elseif o==4 then
fill_M031_UART(e,t,"F",0,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==14 then
fill_M031_Normal(e,t,"F",0,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"F",0)
end
a[33]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="34"
e["texts"]={"ICE_CLK","UART0_RXD","I2C1_SDA","UART1_RXD","PF.1"}
if o==0 then
fill_M031_GPIO(e,t,"F",1)
elseif o==2 then
fill_M031_UART(e,t,"F",1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M031_I2C(e,t,"F",1,"I2C1_SDA",1)
elseif o==4 then
fill_M031_UART(e,t,"F",1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==14 then
fill_M031_Normal(e,t,"F",1,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
a[34]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],15728640),20)
e={}
e["pin_no"]="35"
e["texts"]={"PWM1_CH0","I2C1_SCL","UART2_TXD","PC.5"}
if o==0 then
fill_M031_GPIO(e,t,"C",5)
elseif o==8 then
fill_M031_UART(e,t,"C",5,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M031_I2C(e,t,"C",5,"I2C1_SCL",1)
elseif o==12 then
fill_M031_EPWM(e,t,"C",5,"PWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"C",5)
end
a[35]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],983040),16)
e={}
e["pin_no"]="36"
e["texts"]={"PWM1_CH1","I2C1_SDA","UART2_RXD","PC.4"}
if o==0 then
fill_M031_GPIO(e,t,"C",4)
elseif o==8 then
fill_M031_UART(e,t,"C",4,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M031_I2C(e,t,"C",4,"I2C1_SDA",1)
elseif o==12 then
fill_M031_EPWM(e,t,"C",4,"PWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"C",4)
end
a[36]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="37"
e["texts"]={"PWM1_CH2","UART2_nRTS","PC.3"}
if o==0 then
fill_M031_GPIO(e,t,"C",3)
elseif o==8 then
fill_M031_UART(e,t,"C",3,"UART2_nRTS",2)
elseif o==12 then
fill_M031_EPWM(e,t,"C",3,"PWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[37]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="38"
e["texts"]={"PWM1_CH3","UART2_nCTS","PC.2"}
if o==0 then
fill_M031_GPIO(e,t,"C",2)
elseif o==8 then
fill_M031_UART(e,t,"C",2,"UART2_nCTS",2)
elseif o==12 then
fill_M031_EPWM(e,t,"C",2,"PWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"C",2)
end
a[38]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],240),4)
e={}
e["pin_no"]="39"
e["texts"]={"ACMP0_O","PWM1_CH4","I2C0_SCL","UART2_TXD","PC.1"}
if o==0 then
fill_M031_GPIO(e,t,"C",1)
elseif o==8 then
fill_M031_UART(e,t,"C",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M031_I2C(e,t,"C",1,"I2C0_SCL",0)
elseif o==12 then
fill_M031_EPWM(e,t,"C",1,"PWM1_CH4",1,4)
elseif o==14 then
fill_M031_ACMP(e,t,"C",1,"ACMP0_O",0)
else
fill_invalid_GPIO(e,t,"C",1)
end
a[39]=e
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
e={}
e["pin_no"]="40"
e["texts"]={"ACMP1_O","PWM1_CH5","I2C0_SDA","UART2_RXD","PC.0"}
if o==0 then
fill_M031_GPIO(e,t,"C",0)
elseif o==8 then
fill_M031_UART(e,t,"C",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M031_I2C(e,t,"C",0,"I2C0_SDA",0)
elseif o==12 then
fill_M031_EPWM(e,t,"C",0,"PWM1_CH5",1,5)
elseif o==14 then
fill_M031_ACMP(e,t,"C",0,"ACMP1_O",1)
else
fill_invalid_GPIO(e,t,"C",0)
end
a[40]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],61440),12)
e={}
e["pin_no"]="41"
e["texts"]={"UART0_TXD","SPI0_SS","USCI0_CTL1","PD.3"}
if o==0 then
fill_M031_GPIO(e,t,"D",3)
elseif o==3 then
fill_M031_USCI(e,t,"D",3,"USCI0_CTL1",0)
elseif o==4 then
fill_M031_SPI(e,t,"D",3,"SPI0_SS",0)
elseif o==9 then
fill_M031_UART(e,t,"D",3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",3)
end
a[41]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],3840),8)
e={}
e["pin_no"]="42"
e["texts"]={"UART0_RXD","SPI0_CLK","USCI0_DAT1","PD.2"}
if o==0 then
fill_M031_GPIO(e,t,"D",2)
elseif o==3 then
fill_M031_USCI(e,t,"D",2,"USCI0_DAT1",0)
fill_M031_USCI_IO(e,t,0,1)
elseif o==4 then
fill_M031_SPI(e,t,"D",2,"SPI0_CLK",0)
elseif o==9 then
fill_M031_UART(e,t,"D",2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",2)
end
a[42]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],240),4)
e={}
e["pin_no"]="43"
e["texts"]={"SPI0_MISO","USCI0_DAT0","PD.1"}
if o==0 then
fill_M031_GPIO(e,t,"D",1)
elseif o==3 then
fill_M031_USCI(e,t,"D",1,"USCI0_DAT0",0)
fill_M031_USCI_IO(e,t,0,0)
elseif o==4 then
fill_M031_SPI(e,t,"D",1,"SPI0_MISO",0)
fill_M031_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"D",1)
end
a[43]=e
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
e={}
e["pin_no"]="44"
e["texts"]={"TM2","SPI0_MOSI","USCI0_CLK","PD.0"}
if o==0 then
fill_M031_GPIO(e,t,"D",0)
elseif o==3 then
fill_M031_USCI(e,t,"D",0,"USCI0_CLK",0)
elseif o==4 then
fill_M031_SPI(e,t,"D",0,"SPI0_MOSI",0)
fill_M031_SPI_IO(e,t,0,false)
elseif o==14 then
fill_M031_TM(e,t,"D",0,"TM2",2)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[44]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],983040),16)
e={}
e["pin_no"]="45"
e["texts"]={"I2C1_SCL","PA.12"}
if o==0 then
fill_M031_GPIO(e,t,"A",12)
elseif o==4 then
fill_M031_I2C(e,t,"A",12,"I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,"A",12)
end
a[45]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],15728640),20)
e={}
e["pin_no"]="46"
e["texts"]={"I2C1_SDA","PA.13"}
if o==0 then
fill_M031_GPIO(e,t,"A",13)
elseif o==4 then
fill_M031_I2C(e,t,"A",13,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"A",13)
end
a[46]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],251658240),24)
e={}
e["pin_no"]="47"
e["texts"]={"UART0_TXD","PA.14"}
if o==0 then
fill_M031_GPIO(e,t,"A",14)
elseif o==3 then
fill_M031_UART(e,t,"A",14,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",14)
end
a[47]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],4026531840),28)
e={}
e["pin_no"]="48"
e["texts"]={"UART0_RXD","PA.15"}
if o==0 then
fill_M031_GPIO(e,t,"A",15)
elseif o==3 then
fill_M031_UART(e,t,"A",15,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",15)
end
a[48]=e
e={}
e["pin_no"]="49"
e["texts"]={"VSS"}
fill_M031_Normal(e,t,nil,nil,"VSS")
a[49]=e
e={}
e["pin_no"]="50"
e["texts"]={"LDO_CAP"}
fill_M031_Normal(e,t,nil,nil,"LDO_CAP")
a[50]=e
e={}
e["pin_no"]="51"
e["texts"]={"VDD"}
fill_M031_Normal(e,t,nil,nil,"VDD")
a[51]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],251658240),24)
e={}
e["pin_no"]="52"
e["texts"]={"TM1","USCI0_CTL0","SPI0_I2SMCLK","PC.14"}
if o==0 then
fill_M031_GPIO(e,t,"C",14)
elseif o==4 then
fill_M031_SPI(e,t,"C",14,"SPI0_I2SMCLK",0)
elseif o==5 then
fill_M031_USCI(e,t,"C",14,"USCI0_CTL0",0)
elseif o==13 then
fill_M031_TM(e,t,"C",14,"TM1",1)
else
fill_invalid_GPIO(e,t,"C",14)
end
a[52]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],4026531840),28)
e={}
e["pin_no"]="53"
e["texts"]={"PWM0_BRAKE1","TM0_EXT","PWM1_CH0","UART0_nCTS","USCI0_CTL1","SPI0_SS","EADC0_CH15","PB.15"}
if o==0 then
fill_M031_GPIO(e,t,"B",15)
elseif o==1 then
fill_M031_EADC(e,t,"B",15,"EADC0_CH15")
elseif o==4 then
fill_M031_SPI(e,t,"B",15,"SPI0_SS",0)
elseif o==5 then
fill_M031_USCI(e,t,"B",15,"USCI0_CTL1",0)
elseif o==6 then
fill_M031_UART(e,t,"B",15,"UART0_nCTS",0)
elseif o==11 then
fill_M031_EPWM(e,t,"B",15,"PWM1_CH0",1,0)
elseif o==13 then
fill_M031_TM(e,t,"B",15,"TM0_EXT",0)
elseif o==15 then
fill_M031_EPWM(e,t,"B",15,"PWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"B",15)
end
a[53]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],251658240),24)
e={}
e["pin_no"]="54"
e["texts"]={"CLKO","TM1_EXT","PWM1_CH1","UART0_nRTS","USCI0_DAT1","SPI0_CLK","EADC0_CH14","PB.14"}
if o==0 then
fill_M031_GPIO(e,t,"B",14)
elseif o==1 then
fill_M031_EADC(e,t,"B",14,"EADC0_CH14")
elseif o==4 then
fill_M031_SPI(e,t,"B",14,"SPI0_CLK",0)
elseif o==5 then
fill_M031_USCI(e,t,"B",14,"USCI0_DAT1",0)
fill_M031_USCI_IO(e,t,0,1)
elseif o==6 then
fill_M031_UART(e,t,"B",14,"UART0_nRTS",0)
elseif o==11 then
fill_M031_EPWM(e,t,"B",14,"PWM1_CH1",1,1)
elseif o==13 then
fill_M031_TM(e,t,"B",14,"TM1_EXT",1)
elseif o==14 then
fill_M031_CLKO(e,t,"B",14,"CLKO")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",14)
end
a[54]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],15728640),20)
e={}
e["pin_no"]="55"
e["texts"]={"TM2_EXT","PWM1_CH2","UART0_TXD","USCI0_DAT0","SPI0_MISO","ACMP1_P3","ACMP0_P3","EADC0_CH13","PB.13"}
if o==0 then
fill_M031_GPIO(e,t,"B",13)
elseif o==1 then
fill_M031_Analog(e,t,"B",13,"ACMP1_P3,ACMP0_P3,EADC0_CH13",{0},{0,1})
e["highlight_text"]="ACMP1_P3,ACMP0_P3,EADC0_CH13"
e["texts"]={"TM2_EXT","PWM1_CH2","UART0_TXD","USCI0_DAT0","SPI0_MISO","ACMP1_P3,ACMP0_P3,EADC0_CH13","PB.13"}
elseif o==4 then
fill_M031_SPI(e,t,"B",13,"SPI0_MISO",0)
fill_M031_SPI_IO(e,t,0,true)
elseif o==5 then
fill_M031_USCI(e,t,"B",13,"USCI0_DAT0",0)
fill_M031_USCI_IO(e,t,0,0)
elseif o==6 then
fill_M031_UART(e,t,"B",13,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M031_EPWM(e,t,"B",13,"PWM1_CH2",1,2)
elseif o==13 then
fill_M031_TM(e,t,"B",13,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[55]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],983040),16)
e={}
e["pin_no"]="56"
e["texts"]={"TM3_EXT","PWM1_CH3","UART0_RXD","USCI0_CLK","SPI0_MOSI","ACMP1_P2","ACMP0_P2","EADC0_CH12","PB.12"}
if o==0 then
fill_M031_GPIO(e,t,"B",12)
elseif o==1 then
fill_M031_Analog(e,t,"B",12,"ACMP1_P2,ACMP0_P2,EADC0_CH12",{0},{0,1})
e["highlight_text"]="ACMP1_P2,ACMP0_P2,EADC0_CH12"
e["texts"]={"TM3_EXT","PWM1_CH3","UART0_RXD","USCI0_CLK","SPI0_MOSI","ACMP1_P2,ACMP0_P2,EADC0_CH12","PB.12"}
elseif o==4 then
fill_M031_SPI(e,t,"B",12,"SPI0_MOSI",0)
fill_M031_SPI_IO(e,t,0,false)
elseif o==5 then
fill_M031_USCI(e,t,"B",12,"USCI0_CLK",0)
elseif o==6 then
fill_M031_UART(e,t,"B",12,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M031_EPWM(e,t,"B",12,"PWM1_CH3",1,3)
elseif o==13 then
fill_M031_TM(e,t,"B",12,"TM3_EXT",3)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[56]=e
e={}
e["pin_no"]="57"
e["texts"]={"AVDD"}
fill_M031_Normal(e,t,nil,nil,"AVDD")
a[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"VREF"}
fill_M031_Normal(e,t,nil,nil,"VREF")
a[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"AVSS"}
fill_M031_Normal(e,t,nil,nil,"AVSS")
a[59]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],61440),12)
e={}
e["pin_no"]="60"
e["texts"]={"SPI0_I2SMCLK","I2C1_SCL","UART0_nCTS","EADC0_CH11","PB.11"}
if o==0 then
fill_M031_GPIO(e,t,"B",11)
elseif o==1 then
fill_M031_EADC(e,t,"B",11,"EADC0_CH11")
elseif o==5 then
fill_M031_UART(e,t,"B",11,"UART0_nCTS",0)
elseif o==7 then
fill_M031_I2C(e,t,"B",11,"I2C1_SCL",1)
elseif o==9 then
fill_M031_SPI(e,t,"B",11,"SPI0_I2SMCLK",0)
else
fill_invalid_GPIO(e,t,"B",11)
end
a[60]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],3840),8)
e={}
e["pin_no"]="61"
e["texts"]={"I2C1_SDA","UART0_nRTS","EADC0_CH10","PB.10"}
if o==0 then
fill_M031_GPIO(e,t,"B",10)
elseif o==1 then
fill_M031_EADC(e,t,"B",10,"EADC0_CH10")
elseif o==5 then
fill_M031_UART(e,t,"B",10,"UART0_nRTS",0)
elseif o==7 then
fill_M031_I2C(e,t,"B",10,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[61]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],240),4)
e={}
e["pin_no"]="62"
e["texts"]={"UART1_nCTS","UART0_TXD","EADC0_CH9","PB.9"}
if o==0 then
fill_M031_GPIO(e,t,"B",9)
elseif o==1 then
fill_M031_EADC(e,t,"B",9,"EADC0_CH9")
elseif o==5 then
fill_M031_UART(e,t,"B",9,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M031_UART(e,t,"B",9,"UART1_nCTS",1)
else
fill_invalid_GPIO(e,t,"B",9)
end
a[62]=e
local o=ext.band(t["SYS_SYS_GPB_MFPH"],15)
e={}
e["pin_no"]="63"
e["texts"]={"UART1_nRTS","UART0_RXD","EADC0_CH8","PB.8"}
if o==0 then
fill_M031_GPIO(e,t,"B",8)
elseif o==1 then
fill_M031_EADC(e,t,"B",8,"EADC0_CH8")
elseif o==5 then
fill_M031_UART(e,t,"B",8,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M031_UART(e,t,"B",8,"UART1_nRTS",1)
else
fill_invalid_GPIO(e,t,"B",8)
end
a[63]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],4026531840),28)
e={}
e["pin_no"]="64"
e["texts"]={"INT5","PWM1_CH4","PWM1_BRAKE0","UART1_TXD","EADC0_CH7","PB.7"}
if o==0 then
fill_M031_GPIO(e,t,"B",7)
elseif o==1 then
fill_M031_EADC(e,t,"B",7,"EADC0_CH7")
elseif o==6 then
fill_M031_UART(e,t,"B",7,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M031_EPWM(e,t,"B",7,"PWM1_BRAKE0",1)
elseif o==12 then
fill_M031_EPWM(e,t,"B",7,"PWM1_CH4",1,4)
elseif o==13 then
fill_M031_Normal(e,t,"B",7,"INT5")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",7)
end
a[64]=e
return{name=i,information="",pins=a}
end
