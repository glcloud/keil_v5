local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC121.lua")
function get_chip_status_NUC121_AE_LQFP64(i,e,o,t)
local a={}
local t=read_NUC121_Registers(i,e,o,t)
local e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],251658240),24)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","INT0","UART0_nRTS","ADC_CH9","BPWM1_CH0","SPI0_SS"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",14)
elseif o==1 then
fill_NUC121_Normal(e,t,"B",14,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==2 then
fill_NUC121_UART(e,t,"B",14,"UART0_nRTS",0)
elseif o==3 then
fill_NUC121_ADC(e,t,"B",14,"ADC_CH9")
elseif o==4 then
fill_NUC121_BPWM(e,t,"B",14,"BPWM1_CH0",1,0)
elseif o==7 then
fill_NUC121_SPI(e,t,"B",14,"SPI0_SS",0)
else
fill_invalid_GPIO(e,t,"B",14)
end
a[1]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],15728640),20)
e={}
e["pin_no"]="2"
e["texts"]={"PB.13","ADC_CH10","USCI0_CTL1"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",13)
elseif o==3 then
fill_NUC121_ADC(e,t,"B",13,"ADC_CH10")
elseif o==6 then
fill_NUC121_USCI(e,t,"B",13,"USCI0_CTL1",0)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[2]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],983040),16)
e={}
e["pin_no"]="3"
e["texts"]={"PB.12","CLKO","ADC_CH11","USCI0_CTL0"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",12)
elseif o==2 then
fill_NUC121_CLKO(e,t,"B",12,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_NUC121_ADC(e,t,"B",12,"ADC_CH11")
elseif o==6 then
fill_NUC121_USCI(e,t,"B",12,"USCI0_CTL0",0)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[3]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],61440),12)
e={}
e["pin_no"]="4"
e["texts"]={"PA.11","I2C1_SCL","BPWM0_CH5","TM0","USCI0_CLK","USCI0_DAT0"}
if o==0 then
fill_NUC121_GPIO(e,t,"A",11)
elseif o==1 then
fill_NUC121_I2C(e,t,"A",11,"I2C1_SCL",1)
elseif o==4 then
fill_NUC121_BPWM(e,t,"A",11,"BPWM0_CH5",0,5)
elseif o==5 then
fill_NUC121_TM(e,t,"A",11,"TM0",0)
elseif o==6 then
fill_NUC121_USCI(e,t,"A",11,"USCI0_CLK",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"A",11,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
else
fill_invalid_GPIO(e,t,"A",11)
end
a[4]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],3840),8)
e={}
e["pin_no"]="5"
e["texts"]={"PA.10","I2C1_SDA","BPWM0_CH4","PWM0_BRAKE0","USCI0_DAT1"}
if o==0 then
fill_NUC121_GPIO(e,t,"A",10)
elseif o==1 then
fill_NUC121_I2C(e,t,"A",10,"I2C1_SDA",1)
elseif o==4 then
fill_NUC121_BPWM(e,t,"A",10,"BPWM0_CH4",0,4)
elseif o==5 then
fill_NUC121_PWM(e,t,"A",10,"PWM0_BRAKE0",0)
elseif o==6 then
fill_NUC121_USCI(e,t,"A",10,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
else
fill_invalid_GPIO(e,t,"A",10)
end
a[5]=e
local o=ext.band(t["SYS_SYS_GPD_MFPH"],15)
e={}
e["pin_no"]="6"
e["texts"]={"PD.8","USCI0_DAT0"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",8)
elseif o==6 then
fill_NUC121_USCI(e,t,"D",8,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
else
fill_invalid_GPIO(e,t,"D",8)
end
a[6]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],240),4)
e={}
e["pin_no"]="7"
e["texts"]={"PD.9","PWM0_BRAKE1"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",9)
elseif o==5 then
fill_NUC121_PWM(e,t,"D",9,"PWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,"D",9)
end
a[7]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],3840),8)
e={}
e["pin_no"]="8"
e["texts"]={"PD.10","CLKO","BPWM0_CH5"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",10)
elseif o==1 then
fill_NUC121_CLKO(e,t,"D",10,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC121_BPWM(e,t,"D",10,"BPWM0_CH5",0,5)
else
fill_invalid_GPIO(e,t,"D",10)
end
a[8]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],61440),12)
e={}
e["pin_no"]="9"
e["texts"]={"PD.11","INT1","BPWM0_CH4"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",11)
elseif o==1 then
fill_NUC121_Normal(e,t,"D",11,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC121_BPWM(e,t,"D",11,"BPWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"D",11)
end
a[9]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="10"
e["texts"]={"PB.4","BPWM0_CH3","TM2_EXT","USCI0_CTL0","USCI0_DAT0"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",4)
elseif o==4 then
fill_NUC121_BPWM(e,t,"B",4,"BPWM0_CH3",0,3)
elseif o==5 then
fill_NUC121_TM(e,t,"B",4,"TM2_EXT",2)
elseif o==6 then
fill_NUC121_USCI(e,t,"B",4,"USCI0_CTL0",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"B",4,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[10]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="11"
e["texts"]={"PB.5","BPWM0_CH2","TM3","USCI0_CLK","USCI0_DAT1"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",5)
elseif o==4 then
fill_NUC121_BPWM(e,t,"B",5,"BPWM0_CH2",0,2)
elseif o==5 then
fill_NUC121_TM(e,t,"B",5,"TM3",3)
elseif o==6 then
fill_NUC121_USCI(e,t,"B",5,"USCI0_CLK",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"B",5,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
else
fill_invalid_GPIO(e,t,"B",5)
end
a[11]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],251658240),24)
e={}
e["pin_no"]="12"
e["texts"]={"PB.6","BPWM0_CH1","USCI0_DAT0","USCI0_CTL1"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",6)
elseif o==4 then
fill_NUC121_BPWM(e,t,"B",6,"BPWM0_CH1",0,1)
elseif o==6 then
fill_NUC121_USCI(e,t,"B",6,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
elseif o==7 then
fill_NUC121_USCI(e,t,"B",6,"USCI0_CTL1",0)
else
fill_invalid_GPIO(e,t,"B",6)
end
a[12]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],4026531840),28)
e={}
e["pin_no"]="13"
e["texts"]={"PB.7","BPWM0_CH0","USCI0_DAT1","USCI0_CTL0"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",7)
elseif o==4 then
fill_NUC121_BPWM(e,t,"B",7,"BPWM0_CH0",0,0)
elseif o==6 then
fill_NUC121_USCI(e,t,"B",7,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
elseif o==7 then
fill_NUC121_USCI(e,t,"B",7,"USCI0_CTL0",0)
else
fill_invalid_GPIO(e,t,"B",7)
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"LDO_CAP"}
fill_NUC121_Normal(e,t,nil,nil,"LDO_CAP")
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"VDD"}
fill_NUC121_Normal(e,t,nil,nil,"VDD")
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"VSS"}
fill_NUC121_Normal(e,t,nil,nil,"VSS")
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"USB_VBUS"}
fill_NUC121_USB(e,t,nil,nil,"USB_VBUS")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"USB_VDD33_CAP"}
fill_NUC121_USB(e,t,nil,nil,"USB_VDD33_CAP")
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"USB_D-"}
fill_NUC121_USB(e,t,nil,nil,"USB_D-")
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"USB_D+"}
fill_NUC121_USB(e,t,nil,nil,"USB_D+")
a[20]=e
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
e={}
e["pin_no"]="21"
e["texts"]={"PB.0","UART0_RXD","PWM1_CH0"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",0)
elseif o==1 then
fill_NUC121_UART(e,t,"B",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC121_PWM(e,t,"B",0,"PWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[21]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],240),4)
e={}
e["pin_no"]="22"
e["texts"]={"PB.1","UART0_TXD","PWM1_CH1"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",1)
elseif o==1 then
fill_NUC121_UART(e,t,"B",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC121_PWM(e,t,"B",1,"PWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[22]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="23"
e["texts"]={"PB.2","UART0_nRTS","TM2_EXT","PWM1_CH2"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",2)
elseif o==1 then
fill_NUC121_UART(e,t,"B",2,"UART0_nRTS",0)
elseif o==2 then
fill_NUC121_TM(e,t,"B",2,"TM2_EXT",2)
elseif o==4 then
fill_NUC121_PWM(e,t,"B",2,"PWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"B",2)
end
a[23]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="24"
e["texts"]={"PB.3","UART0_nCTS","TM3_EXT","PWM1_CH3"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",3)
elseif o==1 then
fill_NUC121_UART(e,t,"B",3,"UART0_nCTS",0)
elseif o==2 then
fill_NUC121_TM(e,t,"B",3,"TM3_EXT",3)
elseif o==4 then
fill_NUC121_PWM(e,t,"B",3,"PWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"B",3)
end
a[24]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],15728640),20)
e={}
e["pin_no"]="25"
e["texts"]={"PC.5","UART0_TXD","PWM1_CH5","USCI0_DAT0"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",5)
elseif o==2 then
fill_NUC121_UART(e,t,"C",5,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC121_PWM(e,t,"C",5,"PWM1_CH5",1,5)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",5,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
else
fill_invalid_GPIO(e,t,"C",5)
end
a[25]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],983040),16)
e={}
e["pin_no"]="26"
e["texts"]={"PC.4","UART0_RXD","SPI0_I2SMCLK","PWM1_CH4","USCI0_DAT1"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",4)
elseif o==2 then
fill_NUC121_UART(e,t,"C",4,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC121_SPI(e,t,"C",4,"SPI0_I2SMCLK",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",4,"PWM1_CH4",1,4)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",4,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
else
fill_invalid_GPIO(e,t,"C",4)
end
a[26]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="27"
e["texts"]={"PC.3","SPI0_MOSI","I2C1_SDA","PWM1_CH3","UART0_nRTS","USCI0_DAT0"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",3)
elseif o==1 then
fill_NUC121_SPI(e,t,"C",3,"SPI0_MOSI",0)
fill_NUC121_SPI_IO(e,t,0,false)
elseif o==3 then
fill_NUC121_I2C(e,t,"C",3,"I2C1_SDA",1)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",3,"PWM1_CH3",1,3)
elseif o==6 then
fill_NUC121_UART(e,t,"C",3,"UART0_nRTS",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",3,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[27]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="28"
e["texts"]={"PC.2","SPI0_MISO","I2C1_SCL","PWM1_CH2","UART0_nCTS","USCI0_DAT1"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",2)
elseif o==1 then
fill_NUC121_SPI(e,t,"C",2,"SPI0_MISO",0)
fill_NUC121_SPI_IO(e,t,0,true)
elseif o==3 then
fill_NUC121_I2C(e,t,"C",2,"I2C1_SCL",1)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",2,"PWM1_CH2",1,2)
elseif o==6 then
fill_NUC121_UART(e,t,"C",2,"UART0_nCTS",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",2,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
else
fill_invalid_GPIO(e,t,"C",2)
end
a[28]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],240),4)
e={}
e["pin_no"]="29"
e["texts"]={"PC.1","SPI0_CLK","PWM1_CH1","UART0_TXD","USCI0_CTL0"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",1)
elseif o==1 then
fill_NUC121_SPI(e,t,"C",1,"SPI0_CLK",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",1,"PWM1_CH1",1,1)
elseif o==6 then
fill_NUC121_UART(e,t,"C",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_NUC121_USCI(e,t,"C",1,"USCI0_CTL0",0)
else
fill_invalid_GPIO(e,t,"C",1)
end
a[29]=e
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
e={}
e["pin_no"]="30"
e["texts"]={"PC.0","SPI0_SS","PWM1_CH0","TM2","UART0_RXD","USCI0_CLK"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",0)
elseif o==1 then
fill_NUC121_SPI(e,t,"C",0,"SPI0_SS",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",0,"PWM1_CH0",1,0)
elseif o==5 then
fill_NUC121_TM(e,t,"C",0,"TM2",2)
elseif o==6 then
fill_NUC121_UART(e,t,"C",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_NUC121_USCI(e,t,"C",0,"USCI0_CLK",0)
else
fill_invalid_GPIO(e,t,"C",0)
end
a[30]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],3840),8)
e={}
e["pin_no"]="31"
e["texts"]={"PB.10","TM2","SPI0_I2SMCLK","PWM0_CH5"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",10)
elseif o==1 then
fill_NUC121_TM(e,t,"B",10,"TM2",2)
elseif o==3 then
fill_NUC121_SPI(e,t,"B",10,"SPI0_I2SMCLK",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"B",10,"PWM0_CH5",0,5)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[31]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],240),4)
e={}
e["pin_no"]="32"
e["texts"]={"PB.9","TM1","SPI0_I2SMCLK","PWM0_CH4"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",9)
elseif o==1 then
fill_NUC121_TM(e,t,"B",9,"TM1",1)
elseif o==3 then
fill_NUC121_SPI(e,t,"B",9,"SPI0_I2SMCLK",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"B",9,"PWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,"B",9)
end
a[32]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],3840),8)
e={}
e["pin_no"]="33"
e["texts"]={"USCI0_CTL1","I2C0_SCL","TM0_EXT","INT1","PE.2"}
if o==0 then
fill_NUC121_GPIO(e,t,"E",2)
elseif o==1 then
fill_NUC121_Normal(e,t,"E",2,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==5 then
fill_NUC121_TM(e,t,"E",2,"TM0_EXT",0)
elseif o==6 then
fill_NUC121_I2C(e,t,"E",2,"I2C0_SCL",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"E",2,"USCI0_CTL1",0)
else
fill_invalid_GPIO(e,t,"E",2)
end
a[33]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],15728640),20)
e={}
e["pin_no"]="34"
e["texts"]={"I2C0_SDA","INT0","CLKO","PWM0_CH3","PC.13"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",13)
elseif o==2 then
fill_NUC121_PWM(e,t,"C",13,"PWM0_CH3",0,3)
elseif o==3 then
fill_NUC121_CLKO(e,t,"C",13,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_NUC121_Normal(e,t,"C",13,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==6 then
fill_NUC121_I2C(e,t,"C",13,"I2C0_SDA",0)
else
fill_invalid_GPIO(e,t,"C",13)
end
a[34]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],983040),16)
e={}
e["pin_no"]="35"
e["texts"]={"USCI0_CTL1","I2C0_SCL","INT0","CLKO","SPI0_I2SMCLK","PWM0_CH2","PC.12"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",12)
elseif o==2 then
fill_NUC121_PWM(e,t,"C",12,"PWM0_CH2",0,2)
elseif o==3 then
fill_NUC121_SPI(e,t,"C",12,"SPI0_I2SMCLK",0)
elseif o==4 then
fill_NUC121_CLKO(e,t,"C",12,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_NUC121_Normal(e,t,"C",12,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==6 then
fill_NUC121_I2C(e,t,"C",12,"I2C0_SCL",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",12,"USCI0_CTL1",0)
else
fill_invalid_GPIO(e,t,"C",12)
end
a[35]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],61440),12)
e={}
e["pin_no"]="36"
e["texts"]={"USCI0_DAT0","I2C0_SDA","TM1","PWM0_CH1","SPI0_MOSI","PC.11"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",11)
elseif o==3 then
fill_NUC121_SPI(e,t,"C",11,"SPI0_MOSI",0)
fill_NUC121_SPI_IO(e,t,0,false)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",11,"PWM0_CH1",0,1)
elseif o==5 then
fill_NUC121_TM(e,t,"C",11,"TM1",1)
elseif o==6 then
fill_NUC121_I2C(e,t,"C",11,"I2C0_SDA",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",11,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
else
fill_invalid_GPIO(e,t,"C",11)
end
a[36]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],3840),8)
e={}
e["pin_no"]="37"
e["texts"]={"USCI0_DAT1","PWM0_CH0","SPI0_MISO","PC.10"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",10)
elseif o==3 then
fill_NUC121_SPI(e,t,"C",10,"SPI0_MISO",0)
fill_NUC121_SPI_IO(e,t,0,true)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",10,"PWM0_CH0",0,0)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",10,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
else
fill_invalid_GPIO(e,t,"C",10)
end
a[37]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],240),4)
e={}
e["pin_no"]="38"
e["texts"]={"USCI0_DAT1","TM3","CLKO","STADC","PE.1"}
if o==0 then
fill_NUC121_GPIO(e,t,"E",1)
elseif o==2 then
fill_NUC121_ADC(e,t,"E",1,"STADC")
elseif o==3 then
fill_NUC121_CLKO(e,t,"E",1,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_NUC121_TM(e,t,"E",1,"TM3",3)
elseif o==7 then
fill_NUC121_USCI(e,t,"E",1,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
else
fill_invalid_GPIO(e,t,"E",1)
end
a[38]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],240),4)
e={}
e["pin_no"]="39"
e["texts"]={"USCI0_CLK","PWM0_BRAKE1","PWM0_CH5","SPI0_CLK","PC.9"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",9)
elseif o==3 then
fill_NUC121_SPI(e,t,"C",9,"SPI0_CLK",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",9,"PWM0_CH5",0,5)
elseif o==5 then
fill_NUC121_PWM(e,t,"C",9,"PWM0_BRAKE1",0)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",9,"USCI0_CLK",0)
else
fill_invalid_GPIO(e,t,"C",9)
end
a[39]=e
local o=ext.band(t["SYS_SYS_GPC_MFPH"],15)
e={}
e["pin_no"]="40"
e["texts"]={"USCI0_CTL0","PWM1_BRAKE0","PWM0_CH4","SPI0_SS","STADC","PC.8"}
if o==0 then
fill_NUC121_GPIO(e,t,"C",8)
elseif o==2 then
fill_NUC121_ADC(e,t,"C",8,"STADC")
elseif o==3 then
fill_NUC121_SPI(e,t,"C",8,"SPI0_SS",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"C",8,"PWM0_CH4",0,4)
elseif o==5 then
fill_NUC121_PWM(e,t,"C",8,"PWM1_BRAKE0",1)
elseif o==7 then
fill_NUC121_USCI(e,t,"C",8,"USCI0_CTL0",0)
else
fill_invalid_GPIO(e,t,"C",8)
end
a[40]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],4026531840),28)
e={}
e["pin_no"]="41"
e["texts"]={"UART0_nRTS","PWM1_BRAKE1","CLKO","SPI_I2SMCLK","PWM0_CH3","PA.15"}
if o==0 then
fill_NUC121_GPIO(e,t,"A",15)
elseif o==1 then
fill_NUC121_PWM(e,t,"A",15,"PWM0_CH3",0,3)
elseif o==2 then
elseif o==3 then
fill_NUC121_CLKO(e,t,"A",15,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC121_PWM(e,t,"A",15,"PWM1_BRAKE1",1)
elseif o==5 then
fill_NUC121_UART(e,t,"A",15,"UART0_nRTS",0)
else
fill_invalid_GPIO(e,t,"A",15)
end
a[41]=e
local o=ext.band(t["SYS_SYS_GPE_MFPL"],15)
e={}
e["pin_no"]="42"
e["texts"]={"USCI0_DAT0","TM1_EXT","PWM0_CH3","CLKO","INT0","PE.0"}
if o==0 then
fill_NUC121_GPIO(e,t,"E",0)
elseif o==1 then
fill_NUC121_Normal(e,t,"E",0,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC121_CLKO(e,t,"E",0,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC121_PWM(e,t,"E",0,"PWM0_CH3",0,3)
elseif o==5 then
fill_NUC121_TM(e,t,"E",0,"TM1_EXT",1)
elseif o==7 then
fill_NUC121_USCI(e,t,"E",0,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
else
fill_invalid_GPIO(e,t,"E",0)
end
a[42]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],251658240),24)
e={}
e["pin_no"]="43"
e["texts"]={"PWM0_BRAKE0","UART0_nCTS","PWM0_CH2","PA.14"}
if o==0 then
fill_NUC121_GPIO(e,t,"A",14)
elseif o==1 then
fill_NUC121_PWM(e,t,"A",14,"PWM0_CH2",0,2)
elseif o==3 then
fill_NUC121_UART(e,t,"A",14,"UART0_nCTS",0)
elseif o==4 then
fill_NUC121_PWM(e,t,"A",14,"PWM0_BRAKE0",0)
else
fill_invalid_GPIO(e,t,"A",14)
end
a[43]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],15728640),20)
e={}
e["pin_no"]="44"
e["texts"]={"UART0_TXD","I2C1_SDA","PWM0_CH1","PA.13"}
if o==0 then
fill_NUC121_GPIO(e,t,"A",13)
elseif o==1 then
fill_NUC121_PWM(e,t,"A",13,"PWM0_CH1",0,1)
elseif o==2 then
fill_NUC121_I2C(e,t,"A",13,"I2C1_SDA",1)
elseif o==3 then
fill_NUC121_UART(e,t,"A",13,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",13)
end
a[44]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],983040),16)
e={}
e["pin_no"]="45"
e["texts"]={"UART0_RXD","I2C1_SCL","PWM0_CH0","PA.12"}
if o==0 then
fill_NUC121_GPIO(e,t,"A",12)
elseif o==1 then
fill_NUC121_PWM(e,t,"A",12,"PWM0_CH0",0,0)
elseif o==2 then
fill_NUC121_I2C(e,t,"A",12,"I2C1_SCL",1)
elseif o==3 then
fill_NUC121_UART(e,t,"A",12,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",12)
end
a[45]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],983040),16)
e={}
e["pin_no"]="46"
e["texts"]={"PWM0_CH3","UART0_TXD","I2C0_SDA","ICE_DAT","PF.4"}
if o==0 then
fill_NUC121_GPIO(e,t,"F",4)
elseif o==1 then
fill_NUC121_Normal(e,t,"F",4,"ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif o==2 then
fill_NUC121_I2C(e,t,"F",4,"I2C0_SDA",0)
elseif o==3 then
fill_NUC121_UART(e,t,"F",4,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC121_PWM(e,t,"F",4,"PWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"F",4)
end
a[46]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],15728640),20)
e={}
e["pin_no"]="47"
e["texts"]={"UART0_RXD","I2C0_SCL","ICE_CLK","PF.5"}
if o==0 then
fill_NUC121_GPIO(e,t,"F",5)
elseif o==1 then
fill_NUC121_Normal(e,t,"F",5,"ICE_CLK")
e["direction"]=kPinDirection_In
elseif o==2 then
fill_NUC121_I2C(e,t,"F",5,"I2C0_SCL",0)
elseif o==3 then
fill_NUC121_UART(e,t,"F",5,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",5)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"AVDD"}
fill_NUC121_Normal(e,t,nil,nil,"AVDD")
a[48]=e
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
e={}
e["pin_no"]="49"
e["texts"]={"SPI0_SS","USCI0_CTL0","UART0_nRTS","ADC_CH0","PD.0"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",0)
elseif o==3 then
fill_NUC121_ADC(e,t,"D",0,"ADC_CH0")
elseif o==5 then
fill_NUC121_UART(e,t,"D",0,"UART0_nRTS",0)
elseif o==6 then
fill_NUC121_USCI(e,t,"D",0,"USCI0_CTL0",0)
elseif o==7 then
fill_NUC121_SPI(e,t,"D",0,"SPI0_SS",0)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[49]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],240),4)
e={}
e["pin_no"]="50"
e["texts"]={"SPI0_CLK","USCI0_CLK","UART0_RXD","TM0_EXT","ADC_CH1","PD.1"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",1)
elseif o==3 then
fill_NUC121_ADC(e,t,"D",1,"ADC_CH1")
elseif o==4 then
fill_NUC121_TM(e,t,"D",1,"TM0_EXT",0)
elseif o==5 then
fill_NUC121_UART(e,t,"D",1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_NUC121_USCI(e,t,"D",1,"USCI0_CLK",0)
elseif o==7 then
fill_NUC121_SPI(e,t,"D",1,"SPI0_CLK",0)
else
fill_invalid_GPIO(e,t,"D",1)
end
a[50]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],3840),8)
e={}
e["pin_no"]="51"
e["texts"]={"SPI0_MISO","USCI0_DAT1","UART0_TXD","TM3","ADC_CH2","PD.2"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",2)
elseif o==3 then
fill_NUC121_ADC(e,t,"D",2,"ADC_CH2")
elseif o==4 then
fill_NUC121_TM(e,t,"D",2,"TM3",3)
elseif o==5 then
fill_NUC121_UART(e,t,"D",2,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_NUC121_USCI(e,t,"D",2,"USCI0_DAT1",0)
fill_NUC121_USCI_IO(e,t,0,1)
elseif o==7 then
fill_NUC121_SPI(e,t,"D",2,"SPI0_MISO",0)
fill_NUC121_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"D",2)
end
a[51]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],61440),12)
e={}
e["pin_no"]="52"
e["texts"]={"SPI0_MOSI","USCI0_DAT0","UART0_nCTS","TM1_EXT","ADC_CH3","PD.3"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",3)
elseif o==3 then
fill_NUC121_ADC(e,t,"D",3,"ADC_CH3")
elseif o==4 then
fill_NUC121_TM(e,t,"D",3,"TM1_EXT",1)
elseif o==5 then
fill_NUC121_UART(e,t,"D",3,"UART0_nCTS",0)
elseif o==6 then
fill_NUC121_USCI(e,t,"D",3,"USCI0_DAT0",0)
fill_NUC121_USCI_IO(e,t,0,0)
elseif o==7 then
fill_NUC121_SPI(e,t,"D",3,"SPI0_MOSI",0)
fill_NUC121_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"D",3)
end
a[52]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],983040),16)
e={}
e["pin_no"]="53"
e["texts"]={"SPI0_SS","USCI0_CTL0","UART0_nRTS","BPWM1_CH5","ADC_CH4","PD.4"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",4)
elseif o==2 then
fill_NUC121_ADC(e,t,"D",4,"ADC_CH4")
elseif o==4 then
fill_NUC121_BPWM(e,t,"D",4,"BPWM1_CH5",1,5)
elseif o==5 then
fill_NUC121_UART(e,t,"D",4,"UART0_nRTS",0)
elseif o==6 then
fill_NUC121_USCI(e,t,"D",4,"USCI0_CTL0",0)
elseif o==7 then
fill_NUC121_SPI(e,t,"D",4,"SPI0_SS",0)
else
fill_invalid_GPIO(e,t,"D",4)
end
a[53]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],15728640),20)
e={}
e["pin_no"]="54"
e["texts"]={"BPWM1_CH4","ADC_CH5","PD.5"}
if o==0 then
fill_NUC121_GPIO(e,t,"D",5)
elseif o==2 then
fill_NUC121_ADC(e,t,"D",5,"ADC_CH5")
elseif o==4 then
fill_NUC121_BPWM(e,t,"D",5,"BPWM1_CH4",1,4)
else
fill_invalid_GPIO(e,t,"D",5)
end
a[54]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],4026531840),28)
e={}
e["pin_no"]="55"
e["texts"]={"BPWM1_CH5","TM0_EXT","INT1","PB.15"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",15)
elseif o==1 then
fill_NUC121_Normal(e,t,"B",15,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==2 then
fill_NUC121_TM(e,t,"B",15,"TM0_EXT",0)
elseif o==4 then
fill_NUC121_BPWM(e,t,"B",15,"BPWM1_CH5",1,5)
else
fill_invalid_GPIO(e,t,"B",15)
end
a[55]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="56"
e["texts"]={"TM3","BPWM1_CH3","XT_OUT","PF.0"}
if o==0 then
fill_NUC121_GPIO(e,t,"F",0)
elseif o==1 then
fill_NUC121_Normal(e,t,"F",0,"XT_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC121_BPWM(e,t,"F",0,"BPWM1_CH3",1,3)
elseif o==5 then
fill_NUC121_TM(e,t,"F",0,"TM3",3)
else
fill_invalid_GPIO(e,t,"F",0)
end
a[56]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="57"
e["texts"]={"TM1_EXT","BPWM1_CH2","XT_IN","PF.1"}
if o==0 then
fill_NUC121_GPIO(e,t,"F",1)
elseif o==1 then
fill_NUC121_Normal(e,t,"F",1,"XT_IN")
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC121_BPWM(e,t,"F",1,"BPWM1_CH2",1,2)
elseif o==5 then
fill_NUC121_TM(e,t,"F",1,"TM1_EXT",1)
else
fill_invalid_GPIO(e,t,"F",1)
end
a[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"nRESET"}
fill_NUC121_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"VSS"}
fill_NUC121_Normal(e,t,nil,nil,"VSS")
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"VDD"}
fill_NUC121_Normal(e,t,nil,nil,"VDD")
a[60]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="61"
e["texts"]={"BPWM1_CH3","ADC_CH6","I2C0_SDA","PF.2"}
if o==0 then
fill_NUC121_GPIO(e,t,"F",2)
elseif o==2 then
fill_NUC121_I2C(e,t,"F",2,"I2C0_SDA",0)
elseif o==3 then
fill_NUC121_ADC(e,t,"F",2,"ADC_CH6")
elseif o==4 then
fill_NUC121_BPWM(e,t,"F",2,"BPWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"F",2)
end
a[61]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="62"
e["texts"]={"BPWM1_CH2","ADC_CH7","I2C0_SCL","PF.3"}
if o==0 then
fill_NUC121_GPIO(e,t,"F",3)
elseif o==2 then
fill_NUC121_I2C(e,t,"F",3,"I2C0_SCL",0)
elseif o==3 then
fill_NUC121_ADC(e,t,"F",3,"ADC_CH7")
elseif o==4 then
fill_NUC121_BPWM(e,t,"F",3,"BPWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"VSS"}
fill_NUC121_Normal(e,t,nil,nil,"VSS")
a[63]=e
local o=ext.band(t["SYS_SYS_GPB_MFPH"],15)
e={}
e["pin_no"]="64"
e["texts"]={"BPWM1_CH1","ADC_CH8","TM0","PB.8"}
if o==0 then
fill_NUC121_GPIO(e,t,"B",8)
elseif o==1 then
fill_NUC121_TM(e,t,"B",8,"TM0",0)
elseif o==3 then
fill_NUC121_ADC(e,t,"B",8,"ADC_CH8")
elseif o==4 then
fill_NUC121_BPWM(e,t,"B",8,"BPWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"B",8)
end
a[64]=e
return{name=i,information="",pins=a}
end