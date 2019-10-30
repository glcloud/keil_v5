local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC121.lua")
function get_chip_status_NUC121_AE_QFN33(i,e,o,t)
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
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],61440),12)
e={}
e["pin_no"]="2"
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
a[2]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],3840),8)
e={}
e["pin_no"]="3"
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
a[3]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="4"
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
a[4]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="5"
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
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"LDO_CAP"}
fill_NUC121_Normal(e,t,nil,nil,"LDO_CAP")
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"VDD"}
fill_NUC121_Normal(e,t,nil,nil,"VDD")
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"VSS"}
fill_NUC121_Normal(e,t,nil,nil,"VSS")
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"USB_VBUS"}
fill_NUC121_USB(e,t,nil,nil,"USB_VBUS")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"USB_VDD33_CAP"}
fill_NUC121_USB(e,t,nil,nil,"USB_VDD33_CAP")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"USB_D-"}
fill_NUC121_USB(e,t,nil,nil,"USB_D-")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"USB_D+"}
fill_NUC121_USB(e,t,nil,nil,"USB_D+")
a[12]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="13"
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
a[13]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="14"
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
a[14]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],240),4)
e={}
e["pin_no"]="15"
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
a[15]=e
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
e={}
e["pin_no"]="16"
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
a[16]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],15728640),20)
e={}
e["pin_no"]="17"
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
a[17]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],983040),16)
e={}
e["pin_no"]="18"
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
a[18]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],61440),12)
e={}
e["pin_no"]="19"
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
a[19]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],3840),8)
e={}
e["pin_no"]="20"
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
a[20]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],240),4)
e={}
e["pin_no"]="21"
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
a[21]=e
local o=ext.band(t["SYS_SYS_GPC_MFPH"],15)
e={}
e["pin_no"]="22"
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
a[22]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],983040),16)
e={}
e["pin_no"]="23"
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
a[23]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],15728640),20)
e={}
e["pin_no"]="24"
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
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"AVDD"}
fill_NUC121_Normal(e,t,nil,nil,"AVDD")
a[25]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],240),4)
e={}
e["pin_no"]="26"
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
a[26]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],3840),8)
e={}
e["pin_no"]="27"
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
a[27]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],61440),12)
e={}
e["pin_no"]="28"
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
a[28]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="29"
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
a[29]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="30"
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
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"nRESET"}
fill_NUC121_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"VSS"}
fill_NUC121_Normal(e,t,nil,nil,"VSS")
a[32]=e
return{name=i,information="",pins=a}
end