local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M0564.lua")
function get_chip_status_NUC1261_AE_LQFP48(i,e,o,t)
local a={}
local t=read_M0564_Registers(i,e,o,t)
local e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="1"
e["texts"]={"PB.5","ADC0_CH13","SPI0_MOSI","SPI1_MOSI","ACMP0_P2","EBI_AD6","UART2_RXD"}
if o==0 then
fill_M0564_GPIO(e,t,"B",5)
elseif o==1 then
fill_M0564_ADC(e,t,"B",5,"ADC0_CH13")
elseif o==2 then
fill_M0564_SPI(e,t,"B",5,"SPI0_MOSI",0)
fill_M0564_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M0564_SPI(e,t,"B",5,"SPI1_MOSI",1)
fill_M0564_SPI_IO(e,t,1,false)
elseif o==5 then
fill_M0564_ACMP(e,t,"B",5,"ACMP0_P2",0)
elseif o==7 then
fill_M0564_EBI(e,t,"B",5,"EBI_AD6")
e["direction"]=kPinDirection_Bi
elseif o==9 then
fill_M0564_UART(e,t,"B",5,"UART2_RXD",2)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",5)
end
a[1]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],251658240),24)
e={}
e["pin_no"]="2"
e["texts"]={"PB.6","ADC0_CH14","SPI0_MISO","SPI1_MISO","ACMP0_P1","EBI_AD5"}
if o==0 then
fill_M0564_GPIO(e,t,"B",6)
elseif o==1 then
fill_M0564_ADC(e,t,"B",6,"ADC0_CH14")
elseif o==2 then
fill_M0564_SPI(e,t,"B",6,"SPI0_MISO",0)
fill_M0564_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M0564_SPI(e,t,"B",6,"SPI1_MISO",1)
fill_M0564_SPI_IO(e,t,1,true)
elseif o==5 then
fill_M0564_ACMP(e,t,"B",6,"ACMP0_P1",0)
elseif o==7 then
fill_M0564_EBI(e,t,"B",6,"EBI_AD5")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",6)
end
a[2]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],4026531840),28)
e={}
e["pin_no"]="3"
e["texts"]={"PB.7","ADC0_CH15","SPI0_CLK","SPI1_CLK","USCI2_CTL1","ACMP0_P0","EBI_AD4"}
if o==0 then
fill_M0564_GPIO(e,t,"B",7)
elseif o==1 then
fill_M0564_ADC(e,t,"B",7,"ADC0_CH15")
elseif o==2 then
fill_M0564_SPI(e,t,"B",7,"SPI0_CLK",0)
elseif o==3 then
fill_M0564_SPI(e,t,"B",7,"SPI1_CLK",1)
elseif o==4 then
fill_M0564_USCI(e,t,"B",7,"USCI2_CTL1",2)
elseif o==5 then
fill_M0564_ACMP(e,t,"B",7,"ACMP0_P0",0)
elseif o==7 then
fill_M0564_EBI(e,t,"B",7,"EBI_AD4")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",7)
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"nRESET"}
fill_M0564_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[4]=e
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
e={}
e["pin_no"]="5"
e["texts"]={"PD.0","SPI0_I2SMCLK","SPI1_I2SMCLK","UART0_RXD","USCI2_CTL0","ACMP1_N","INT3"}
if o==0 then
fill_M0564_GPIO(e,t,"D",0)
elseif o==1 then
fill_M0564_SPI(e,t,"D",0,"SPI0_I2SMCLK",0)
elseif o==2 then
fill_M0564_SPI(e,t,"D",0,"SPI1_I2SMCLK",1)
elseif o==3 then
fill_M0564_UART(e,t,"D",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M0564_USCI(e,t,"D",0,"USCI2_CTL0",2)
elseif o==5 then
fill_M0564_ACMP(e,t,"D",0,"ACMP1_N",1)
elseif o==8 then
fill_M0564_Normal(e,t,"D",0,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",0)
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"AVSS"}
fill_M0564_Normal(e,t,nil,nil,"AVSS")
a[6]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],240),4)
e={}
e["pin_no"]="7"
e["texts"]={"PD.1","ADC0_CH19","PWM0_SYNC_IN","UART0_TXD","USCI2_CLK","ACMP1_P2","TM0","EBI_nRD"}
if o==0 then
fill_M0564_GPIO(e,t,"D",1)
elseif o==1 then
fill_M0564_ADC(e,t,"D",1,"ADC0_CH19")
elseif o==2 then
fill_M0564_PWM(e,t,"D",1,"PWM0_SYNC_IN",0)
elseif o==3 then
fill_M0564_UART(e,t,"D",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M0564_USCI(e,t,"D",1,"USCI2_CLK",2)
elseif o==5 then
fill_M0564_ACMP(e,t,"D",1,"ACMP1_P2",1)
elseif o==6 then
fill_M0564_TM(e,t,"D",1,"TM0",0)
elseif o==7 then
fill_M0564_EBI(e,t,"D",1,"EBI_nRD")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",1)
end
a[7]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],3840),8)
e={}
e["pin_no"]="8"
e["texts"]={"PD.2","ADC0_ST","TM0_EXT","USCI2_DAT0","ACMP1_P1","PWM0_BRAKE0","EBI_nWR","INT0"}
if o==0 then
fill_M0564_GPIO(e,t,"D",2)
elseif o==1 then
fill_M0564_ADC(e,t,"D",2,"ADC0_ST")
elseif o==3 then
fill_M0564_TM(e,t,"D",2,"TM0_EXT",0)
elseif o==4 then
fill_M0564_USCI(e,t,"D",2,"USCI2_DAT0",2)
fill_M0564_USCI_IO(e,t,2,0)
elseif o==5 then
fill_M0564_ACMP(e,t,"D",2,"ACMP1_P1",1)
elseif o==6 then
fill_M0564_PWM(e,t,"D",2,"PWM0_BRAKE0",0)
elseif o==7 then
fill_M0564_EBI(e,t,"D",2,"EBI_nWR")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M0564_Normal(e,t,"D",2,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",2)
end
a[8]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],61440),12)
e={}
e["pin_no"]="9"
e["texts"]={"PD.3","TM2","SPI0_I2SMCLK","TM1_EXT","USCI2_DAT1","ACMP1_P0","PWM0_BRAKE1","EBI_MCLK","INT1"}
if o==0 then
fill_M0564_GPIO(e,t,"D",3)
elseif o==1 then
fill_M0564_TM(e,t,"D",3,"TM2",2)
elseif o==2 then
fill_M0564_SPI(e,t,"D",3,"SPI0_I2SMCLK",0)
elseif o==3 then
fill_M0564_TM(e,t,"D",3,"TM1_EXT",1)
elseif o==4 then
fill_M0564_USCI(e,t,"D",3,"USCI2_DAT1",2)
fill_M0564_USCI_IO(e,t,2,1)
elseif o==5 then
fill_M0564_ACMP(e,t,"D",3,"ACMP1_P0",1)
elseif o==6 then
fill_M0564_PWM(e,t,"D",3,"PWM0_BRAKE1",0)
elseif o==7 then
fill_M0564_EBI(e,t,"D",3,"EBI_MCLK")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M0564_Normal(e,t,"D",3,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",3)
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"VBAT"}
fill_M0564_Normal(e,t,nil,nil,"VBAT")
a[10]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="11"
e["texts"]={"PF.0","X32_OUT","USCI2_CTL1","INT5"}
if o==0 then
fill_M0564_GPIO(e,t,"F",0)
elseif o==1 then
fill_M0564_Normal(e,t,"F",0,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M0564_USCI(e,t,"F",0,"USCI2_CTL1",2)
elseif o==8 then
fill_M0564_Normal(e,t,"F",0,"INT5")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",0)
end
a[11]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="12"
e["texts"]={"PF.1","X32_IN","USCI2_CTL0","PWM1_BRAKE0"}
if o==0 then
fill_M0564_GPIO(e,t,"F",1)
elseif o==1 then
fill_M0564_Normal(e,t,"F",1,"X32_IN")
e["direction"]=kPinDirection_In
elseif o==5 then
fill_M0564_USCI(e,t,"F",1,"USCI2_CTL0",2)
elseif o==6 then
fill_M0564_PWM(e,t,"F",1,"PWM1_BRAKE0",1)
else
fill_invalid_GPIO(e,t,"F",1)
end
a[12]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="13"
e["texts"]={"PF.2","USCI2_CLK","PWM1_BRAKE1"}
if o==0 then
fill_M0564_GPIO(e,t,"F",2)
elseif o==5 then
fill_M0564_USCI(e,t,"F",2,"USCI2_CLK",2)
elseif o==6 then
fill_M0564_PWM(e,t,"F",2,"PWM1_BRAKE1",1)
else
fill_invalid_GPIO(e,t,"F",2)
end
a[13]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],4026531840),28)
e={}
e["pin_no"]="14"
e["texts"]={"PD.7","USCI1_CTL1","SPI0_I2SMCLK","PWM0_SYNC_IN","TM1","ACMP0_O","PWM0_CH5","EBI_nRD"}
if o==0 then
fill_M0564_GPIO(e,t,"D",7)
elseif o==1 then
fill_M0564_USCI(e,t,"D",7,"USCI1_CTL1",1)
elseif o==2 then
fill_M0564_SPI(e,t,"D",7,"SPI0_I2SMCLK",0)
elseif o==3 then
fill_M0564_PWM(e,t,"D",7,"PWM0_SYNC_IN",0)
elseif o==4 then
fill_M0564_TM(e,t,"D",7,"TM1",1)
elseif o==5 then
fill_M0564_ACMP(e,t,"D",7,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M0564_PWM(e,t,"D",7,"PWM0_CH5",0,5)
elseif o==7 then
fill_M0564_EBI(e,t,"D",7,"EBI_nRD")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",7)
end
a[14]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="15"
e["texts"]={"PF.3","XT1_OUT","I2C1_SCL"}
if o==0 then
fill_M0564_GPIO(e,t,"F",3)
elseif o==1 then
fill_M0564_Normal(e,t,"F",3,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M0564_I2C(e,t,"F",3,"I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[15]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],983040),16)
e={}
e["pin_no"]="16"
e["texts"]={"PF.4","XT1_IN","I2C1_SDA"}
if o==0 then
fill_M0564_GPIO(e,t,"F",4)
elseif o==1 then
fill_M0564_Normal(e,t,"F",4,"XT1_IN")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M0564_I2C(e,t,"F",4,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"F",4)
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VSS"}
fill_M0564_Normal(e,t,nil,nil,"VSS")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"LDO_CAP"}
fill_M0564_Normal(e,t,nil,nil,"LDO_CAP")
a[18]=e
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
e={}
e["pin_no"]="19"
e["texts"]={"PC.0","SPI0_CLK","UART2_nCTS","USCI0_DAT0","ACMP0_WLAT","PWM0_CH0","EBI_AD8","INT2"}
if o==0 then
fill_M0564_GPIO(e,t,"C",0)
elseif o==2 then
fill_M0564_SPI(e,t,"C",0,"SPI0_CLK",0)
elseif o==3 then
fill_M0564_UART(e,t,"C",0,"UART2_nCTS",2)
elseif o==4 then
fill_M0564_USCI(e,t,"C",0,"USCI0_DAT0",0)
fill_M0564_USCI_IO(e,t,0,0)
elseif o==5 then
fill_M0564_ACMP(e,t,"C",0,"ACMP0_WLAT",0)
elseif o==6 then
fill_M0564_PWM(e,t,"C",0,"PWM0_CH0",0,0)
elseif o==7 then
fill_M0564_EBI(e,t,"C",0,"EBI_AD8")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_Normal(e,t,"C",0,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",0)
end
a[19]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],240),4)
e={}
e["pin_no"]="20"
e["texts"]={"PC.1","CLKO","UART2_nRTS","USCI0_DAT1","ACMP1_WLAT","PWM0_CH1","EBI_AD9"}
if o==0 then
fill_M0564_GPIO(e,t,"C",1)
elseif o==1 then
fill_M0564_CLKO(e,t,"C",1,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M0564_UART(e,t,"C",1,"UART2_nRTS",2)
elseif o==4 then
fill_M0564_USCI(e,t,"C",1,"USCI0_DAT1",0)
fill_M0564_USCI_IO(e,t,0,1)
elseif o==5 then
fill_M0564_ACMP(e,t,"C",1,"ACMP1_WLAT",1)
elseif o==6 then
fill_M0564_PWM(e,t,"C",1,"PWM0_CH1",0,1)
elseif o==7 then
fill_M0564_EBI(e,t,"C",1,"EBI_AD9")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",1)
end
a[20]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="21"
e["texts"]={"PC.2","SPI0_SS","UART2_TXD","USCI0_CTL1","ACMP1_O","PWM0_CH2","EBI_AD10"}
if o==0 then
fill_M0564_GPIO(e,t,"C",2)
elseif o==2 then
fill_M0564_SPI(e,t,"C",2,"SPI0_SS",0)
elseif o==3 then
fill_M0564_UART(e,t,"C",2,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M0564_USCI(e,t,"C",2,"USCI0_CTL1",0)
elseif o==5 then
fill_M0564_ACMP(e,t,"C",2,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M0564_PWM(e,t,"C",2,"PWM0_CH2",0,2)
elseif o==7 then
fill_M0564_EBI(e,t,"C",2,"EBI_AD10")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",2)
end
a[21]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="22"
e["texts"]={"PC.3","SPI0_MOSI","UART2_RXD","USCI0_CTL0","PWM0_CH3","EBI_AD11"}
if o==0 then
fill_M0564_GPIO(e,t,"C",3)
elseif o==2 then
fill_M0564_SPI(e,t,"C",3,"SPI0_MOSI",0)
fill_M0564_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M0564_UART(e,t,"C",3,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_M0564_USCI(e,t,"C",3,"USCI0_CTL0",0)
elseif o==6 then
fill_M0564_PWM(e,t,"C",3,"PWM0_CH3",0,3)
elseif o==7 then
fill_M0564_EBI(e,t,"C",3,"EBI_AD11")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",3)
end
a[22]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],983040),16)
e={}
e["pin_no"]="23"
e["texts"]={"PC.4","SPI0_MISO","I2C1_SCL","USCI0_CLK","PWM0_CH4","EBI_AD12"}
if o==0 then
fill_M0564_GPIO(e,t,"C",4)
elseif o==2 then
fill_M0564_SPI(e,t,"C",4,"SPI0_MISO",0)
fill_M0564_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M0564_I2C(e,t,"C",4,"I2C1_SCL",1)
elseif o==5 then
fill_M0564_USCI(e,t,"C",4,"USCI0_CLK",0)
elseif o==6 then
fill_M0564_PWM(e,t,"C",4,"PWM0_CH4",0,4)
elseif o==7 then
fill_M0564_EBI(e,t,"C",4,"EBI_AD12")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",4)
end
a[23]=e
local o=ext.band(t["SYS_SYS_GPE_MFPL"],15)
e={}
e["pin_no"]="24"
e["texts"]={"PE.0","SPI0_CLK","I2C1_SDA","TM2_EXT","PWM0_CH0","EBI_nCS1","INT4"}
if o==0 then
fill_M0564_GPIO(e,t,"E",0)
elseif o==2 then
fill_M0564_SPI(e,t,"E",0,"SPI0_CLK",0)
elseif o==3 then
fill_M0564_I2C(e,t,"E",0,"I2C1_SDA",1)
elseif o==4 then
fill_M0564_TM(e,t,"E",0,"TM2_EXT",2)
elseif o==6 then
fill_M0564_PWM(e,t,"E",0,"PWM0_CH0",0,0)
elseif o==7 then
fill_M0564_EBI(e,t,"E",0,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M0564_Normal(e,t,"E",0,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"E",0)
end
a[24]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],251658240),24)
e={}
e["pin_no"]="25"
e["texts"]={"UART0_RXD","I2C0_SCL","ICE_CLK","PE.6"}
if o==0 then
fill_M0564_GPIO(e,t,"E",6)
elseif o==1 then
fill_M0564_Normal(e,t,"E",6,"ICE_CLK")
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M0564_I2C(e,t,"E",6,"I2C0_SCL",0)
elseif o==3 then
fill_M0564_UART(e,t,"E",6,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"E",6)
end
a[25]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],4026531840),28)
e={}
e["pin_no"]="26"
e["texts"]={"UART0_TXD","I2C0_SDA","ICE_DAT","PE.7"}
if o==0 then
fill_M0564_GPIO(e,t,"E",7)
elseif o==1 then
fill_M0564_Normal(e,t,"E",7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif o==2 then
fill_M0564_I2C(e,t,"E",7,"I2C0_SDA",0)
elseif o==3 then
fill_M0564_UART(e,t,"E",7,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"E",7)
end
a[26]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],3840),8)
e={}
e["pin_no"]="27"
e["texts"]={"TM0_EXT","EBI_AD7","SPI1_CLK","UART1_nCTS","SPI0_MISO","SPI1_MISO","PE.10"}
if o==0 then
fill_M0564_GPIO(e,t,"E",10)
elseif o==1 then
fill_M0564_SPI(e,t,"E",10,"SPI1_MISO",1)
fill_M0564_SPI_IO(e,t,1,true)
elseif o==2 then
fill_M0564_SPI(e,t,"E",10,"SPI0_MISO",0)
fill_M0564_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M0564_UART(e,t,"E",10,"UART1_nCTS",1)
elseif o==6 then
fill_M0564_SPI(e,t,"E",10,"SPI1_CLK",1)
elseif o==7 then
fill_M0564_EBI(e,t,"E",10,"EBI_AD7")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_TM(e,t,"E",10,"TM0_EXT",0)
else
fill_invalid_GPIO(e,t,"E",10)
end
a[27]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],61440),12)
e={}
e["pin_no"]="28"
e["texts"]={"TM1_EXT","EBI_AD6","SPI1_MISO","UART1_nRTS","SPI0_MOSI","SPI1_MOSI","PE.11"}
if o==0 then
fill_M0564_GPIO(e,t,"E",11)
elseif o==1 then
fill_M0564_SPI(e,t,"E",11,"SPI1_MOSI",1)
fill_M0564_SPI_IO(e,t,1,false)
elseif o==2 then
fill_M0564_SPI(e,t,"E",11,"SPI0_MOSI",0)
fill_M0564_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M0564_UART(e,t,"E",11,"UART1_nRTS",1)
elseif o==6 then
fill_M0564_SPI(e,t,"E",11,"SPI1_MISO",1)
fill_M0564_SPI_IO(e,t,1,true)
elseif o==7 then
fill_M0564_EBI(e,t,"E",11,"EBI_AD6")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_TM(e,t,"E",11,"TM1_EXT",1)
else
fill_invalid_GPIO(e,t,"E",11)
end
a[28]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],983040),16)
e={}
e["pin_no"]="29"
e["texts"]={"TM2_EXT","EBI_AD5","SPI1_MOSI","I2C0_SCL","UART1_TXD","SPI0_SS","SPI1_SS","PE.12"}
if o==0 then
fill_M0564_GPIO(e,t,"E",12)
elseif o==1 then
fill_M0564_SPI(e,t,"E",12,"SPI1_SS",1)
elseif o==2 then
fill_M0564_SPI(e,t,"E",12,"SPI0_SS",0)
elseif o==3 then
fill_M0564_UART(e,t,"E",12,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M0564_I2C(e,t,"E",12,"I2C0_SCL",0)
elseif o==6 then
fill_M0564_SPI(e,t,"E",12,"SPI1_MOSI",1)
fill_M0564_SPI_IO(e,t,1,false)
elseif o==7 then
fill_M0564_EBI(e,t,"E",12,"EBI_AD5")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_TM(e,t,"E",12,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"E",12)
end
a[29]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],15728640),20)
e={}
e["pin_no"]="30"
e["texts"]={"TM3_EXT","EBI_AD4","SPI1_SS","I2C0_SDA","UART1_RXD","SPI0_CLK","SPI1_CLK","PE.13"}
if o==0 then
fill_M0564_GPIO(e,t,"E",13)
elseif o==1 then
fill_M0564_SPI(e,t,"E",13,"SPI1_CLK",1)
elseif o==2 then
fill_M0564_SPI(e,t,"E",13,"SPI0_CLK",0)
elseif o==3 then
fill_M0564_UART(e,t,"E",13,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M0564_I2C(e,t,"E",13,"I2C0_SDA",0)
elseif o==6 then
fill_M0564_SPI(e,t,"E",13,"SPI1_SS",1)
elseif o==7 then
fill_M0564_EBI(e,t,"E",13,"EBI_AD4")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_TM(e,t,"E",13,"TM3_EXT",3)
else
fill_invalid_GPIO(e,t,"E",13)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"VDDIO"}
fill_M0564_Normal(e,t,nil,nil,"VDDIO")
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"USB_VBUS"}
fill_M0564_USB(e,t,nil,nil,"USB_VBUS")
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"USB_D-"}
fill_M0564_USB(e,t,nil,nil,"USB_D-")
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"USB_D+"}
fill_M0564_USB(e,t,nil,nil,"USB_D+")
a[34]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],4026531840),28)
e={}
e["pin_no"]="35"
e["texts"]={"PF.7"}
if o==0 then
fill_M0564_GPIO(e,t,"F",7)
else
fill_invalid_GPIO(e,t,"F",7)
end
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"USB_VDD33_CAP"}
fill_M0564_USB(e,t,nil,nil,"USB_VDD33_CAP")
a[36]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="37"
e["texts"]={"USCI1_CLK","EBI_AD3","PWM1_CH2","I2C0_SCL","UART0_nRTS","UART0_RXD","PA.3"}
if o==0 then
fill_M0564_GPIO(e,t,"A",3)
elseif o==2 then
fill_M0564_UART(e,t,"A",3,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M0564_UART(e,t,"A",3,"UART0_nRTS",0)
elseif o==4 then
fill_M0564_I2C(e,t,"A",3,"I2C0_SCL",0)
elseif o==6 then
fill_M0564_PWM(e,t,"A",3,"PWM1_CH2",1,2)
elseif o==7 then
fill_M0564_EBI(e,t,"A",3,"EBI_AD3")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_USCI(e,t,"A",3,"USCI1_CLK",1)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[37]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="38"
e["texts"]={"USCI1_CTL0","EBI_AD2","PWM1_CH3","I2C0_SDA","UART0_nCTS","UART0_TXD","PA.2"}
if o==0 then
fill_M0564_GPIO(e,t,"A",2)
elseif o==2 then
fill_M0564_UART(e,t,"A",2,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M0564_UART(e,t,"A",2,"UART0_nCTS",0)
elseif o==4 then
fill_M0564_I2C(e,t,"A",2,"I2C0_SDA",0)
elseif o==6 then
fill_M0564_PWM(e,t,"A",2,"PWM1_CH3",1,3)
elseif o==7 then
fill_M0564_EBI(e,t,"A",2,"EBI_AD2")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_USCI(e,t,"A",2,"USCI1_CTL0",1)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[38]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],240),4)
e={}
e["pin_no"]="39"
e["texts"]={"EBI_AD1","PWM1_CH4","USCI1_CTL1","UART1_RXD","UART1_nRTS","PA.1"}
if o==0 then
fill_M0564_GPIO(e,t,"A",1)
elseif o==1 then
fill_M0564_UART(e,t,"A",1,"UART1_nRTS",1)
elseif o==3 then
fill_M0564_UART(e,t,"A",1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M0564_USCI(e,t,"A",1,"USCI1_CTL1",1)
elseif o==6 then
fill_M0564_PWM(e,t,"A",1,"PWM1_CH4",1,4)
elseif o==7 then
fill_M0564_EBI(e,t,"A",1,"EBI_AD1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",1)
end
a[39]=e
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
e={}
e["pin_no"]="40"
e["texts"]={"INT0","EBI_AD0","PWM1_CH5","USCI1_CTL0","UART1_TXD","UART1_nCTS","PA.0"}
if o==0 then
fill_M0564_GPIO(e,t,"A",0)
elseif o==1 then
fill_M0564_UART(e,t,"A",0,"UART1_nCTS",1)
elseif o==3 then
fill_M0564_UART(e,t,"A",0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M0564_USCI(e,t,"A",0,"USCI1_CTL0",1)
elseif o==6 then
fill_M0564_PWM(e,t,"A",0,"PWM1_CH5",1,5)
elseif o==7 then
fill_M0564_EBI(e,t,"A",0,"EBI_AD0")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_Normal(e,t,"A",0,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",0)
end
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"VDD"}
fill_M0564_Normal(e,t,nil,nil,"VDD")
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"AVDD"}
fill_M0564_Normal(e,t,nil,nil,"AVDD")
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"VREF"}
fill_M0564_Normal(e,t,nil,nil,"VREF")
a[43]=e
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
e={}
e["pin_no"]="44"
e["texts"]={"TM1_EXT","INT1","EBI_nWRL","USCI1_DAT0","TM2","UART2_RXD","VDET_P0","ADC0_CH0","PB.0"}
if o==0 then
fill_M0564_GPIO(e,t,"B",0)
elseif o==1 then
fill_M0564_ADC(e,t,"B",0,"ADC0_CH0")
elseif o==2 then
fill_M0564_Normal(e,t,"B",0,"VDET_P0")
elseif o==3 then
fill_M0564_UART(e,t,"B",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M0564_TM(e,t,"B",0,"TM2",2)
elseif o==6 then
fill_M0564_USCI(e,t,"B",0,"USCI1_DAT0",1)
fill_M0564_USCI_IO(e,t,1,0)
elseif o==7 then
fill_M0564_EBI(e,t,"B",0,"EBI_nWRL")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M0564_Normal(e,t,"B",0,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==10 then
fill_M0564_TM(e,t,"B",0,"TM1_EXT",1)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[44]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],240),4)
e={}
e["pin_no"]="45"
e["texts"]={"USCI1_DAT1","EBI_nWRH","PWM0_SYNC_OUT","TM3","UART2_TXD","VDET_P1","ADC0_CH1","PB.1"}
if o==0 then
fill_M0564_GPIO(e,t,"B",1)
elseif o==1 then
fill_M0564_ADC(e,t,"B",1,"ADC0_CH1")
elseif o==2 then
fill_M0564_Normal(e,t,"B",1,"VDET_P1")
elseif o==3 then
fill_M0564_UART(e,t,"B",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M0564_TM(e,t,"B",1,"TM3",3)
elseif o==6 then
fill_M0564_PWM(e,t,"B",1,"PWM0_SYNC_OUT",0)
elseif o==7 then
fill_M0564_EBI(e,t,"B",1,"EBI_nWRH")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M0564_USCI(e,t,"B",1,"USCI1_DAT1",1)
fill_M0564_USCI_IO(e,t,1,1)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[45]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="46"
e["texts"]={"TM2_EXT","USCI0_DAT0","EBI_nCS0","TM_BRAKE0","UART1_RXD","SPI1_CLK","SPI0_CLK","ADC0_CH2","PB.2"}
if o==0 then
fill_M0564_GPIO(e,t,"B",2)
elseif o==1 then
fill_M0564_ADC(e,t,"B",2,"ADC0_CH2")
elseif o==2 then
fill_M0564_SPI(e,t,"B",2,"SPI0_CLK",0)
elseif o==3 then
fill_M0564_SPI(e,t,"B",2,"SPI1_CLK",1)
elseif o==4 then
fill_M0564_UART(e,t,"B",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M0564_TM(e,t,"B",2,"TM_BRAKE0",0)
elseif o==7 then
fill_M0564_EBI(e,t,"B",2,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M0564_USCI(e,t,"B",2,"USCI0_DAT0",0)
fill_M0564_USCI_IO(e,t,0,0)
elseif o==10 then
fill_M0564_TM(e,t,"B",2,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"B",2)
end
a[46]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="47"
e["texts"]={"TM0_EXT","USCI0_DAT1","EBI_ALE","TM_BRAKE1","UART1_TXD","SPI1_MISO","SPI0_MISO","ADC0_CH3","PB.3"}
if o==0 then
fill_M0564_GPIO(e,t,"B",3)
elseif o==1 then
fill_M0564_ADC(e,t,"B",3,"ADC0_CH3")
elseif o==2 then
fill_M0564_SPI(e,t,"B",3,"SPI0_MISO",0)
fill_M0564_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M0564_SPI(e,t,"B",3,"SPI1_MISO",1)
fill_M0564_SPI_IO(e,t,1,true)
elseif o==4 then
fill_M0564_UART(e,t,"B",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M0564_TM(e,t,"B",3,"TM_BRAKE1",1)
elseif o==7 then
fill_M0564_EBI(e,t,"B",3,"EBI_ALE")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M0564_USCI(e,t,"B",3,"USCI0_DAT1",0)
fill_M0564_USCI_IO(e,t,0,1)
elseif o==10 then
fill_M0564_TM(e,t,"B",3,"TM0_EXT",0)
else
fill_invalid_GPIO(e,t,"B",3)
end
a[47]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="48"
e["texts"]={"TM1_EXT","UART2_RXD","USCI0_CTL1","EBI_AD7","ACMP0_N","UART1_nCTS","SPI1_SS","SPI0_SS","ADC0_CH4","PB.4"}
if o==0 then
fill_M0564_GPIO(e,t,"B",4)
elseif o==1 then
fill_M0564_ADC(e,t,"B",4,"ADC0_CH4")
elseif o==2 then
fill_M0564_SPI(e,t,"B",4,"SPI0_SS",0)
elseif o==3 then
fill_M0564_SPI(e,t,"B",4,"SPI1_SS",1)
elseif o==4 then
fill_M0564_UART(e,t,"B",4,"UART1_nCTS",1)
elseif o==5 then
fill_M0564_ACMP(e,t,"B",4,"ACMP0_N",0)
elseif o==7 then
fill_M0564_EBI(e,t,"B",4,"EBI_AD7")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M0564_USCI(e,t,"B",4,"USCI0_CTL1",0)
elseif o==9 then
fill_M0564_UART(e,t,"B",4,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==10 then
fill_M0564_TM(e,t,"B",4,"TM1_EXT",1)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[48]=e
return{name=i,information="",pins=a}
end