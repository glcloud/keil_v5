local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M451.lua")
function get_chip_status_M452_AE_LQFP48(i,e,t,o)
local a={}
local t=read_M451_Registers(i,e,t,o)
local e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="1"
e["texts"]={"PB.5","EADC_CH13","SPI0_MOSI0","SPI1_MOSI","TK3","ACMP0_P2","EBI_AD6"}
if o==0 then
fill_M451_GPIO(e,t,"B",5)
elseif o==1 then
fill_M451_ADC(e,t,"B",5,"EADC_CH13",13)
elseif o==2 then
fill_M451_SPI(e,t,"B",5,"SPI0_MOSI0",0)
fill_M451_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M451_SPI(e,t,"B",5,"SPI1_MOSI",1)
fill_M451_SPI_IO(e,t,1,false)
elseif o==4 then
fill_M451_TK(e,t,"B",5,"TK3",3)
elseif o==5 then
fill_M451_ACMP(e,t,"B",5,"ACMP0_P2",0)
elseif o==7 then
fill_M451_EBI(e,t,"B",5,"EBI_AD6")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",5)
end
a[1]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],251658240),24)
e={}
e["pin_no"]="2"
e["texts"]={"PB.6","EADC_CH14","SPI0_MISO0","SPI1_MISO","TK4","ACMP0_P1","EBI_AD5"}
if o==0 then
fill_M451_GPIO(e,t,"B",6)
elseif o==1 then
fill_M451_ADC(e,t,"B",6,"EADC_CH14",14)
elseif o==2 then
fill_M451_SPI(e,t,"B",6,"SPI0_MISO0",0)
fill_M451_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M451_SPI(e,t,"B",6,"SPI1_MISO",1)
fill_M451_SPI_IO(e,t,1,true)
elseif o==4 then
fill_M451_TK(e,t,"B",6,"TK4",4)
elseif o==5 then
fill_M451_ACMP(e,t,"B",6,"ACMP0_P1",0)
elseif o==7 then
fill_M451_EBI(e,t,"B",6,"EBI_AD5")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",6)
end
a[2]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],4026531840),28)
e={}
e["pin_no"]="3"
e["texts"]={"PB.7","EADC_CH15","SPI0_CLK","SPI1_CLK","TK5","ACMP0_P0","EBI_AD4"}
if o==0 then
fill_M451_GPIO(e,t,"B",7)
elseif o==1 then
fill_M451_ADC(e,t,"B",7,"EADC_CH15",15)
elseif o==2 then
fill_M451_SPI(e,t,"B",7,"SPI0_CLK",0)
elseif o==3 then
fill_M451_SPI(e,t,"B",7,"SPI1_CLK",1)
elseif o==4 then
fill_M451_TK(e,t,"B",7,"TK5",5)
elseif o==5 then
fill_M451_ACMP(e,t,"B",7,"ACMP0_P0",0)
elseif o==7 then
fill_M451_EBI(e,t,"B",7,"EBI_AD4")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",7)
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"nRESET"}
fill_M451_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[4]=e
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
e={}
e["pin_no"]="5"
e["texts"]={"PD.0","SPI1_I2SMCLK","UART0_RXD","TK6","ACMP1_N","INT3"}
if o==0 then
fill_M451_GPIO(e,t,"D",0)
elseif o==2 then
fill_M451_SPI(e,t,"D",0,"SPI1_I2SMCLK",1)
elseif o==3 then
fill_M451_UART(e,t,"D",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M451_TK(e,t,"D",0,"TK6",6)
elseif o==5 then
fill_M451_ACMP(e,t,"D",0,"ACMP1_N",1)
elseif o==8 then
fill_M451_Normal(e,t,"D",0,"INT3")
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
fill_M451_Normal(e,t,nil,nil,"AVSS")
a[6]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],240),4)
e={}
e["pin_no"]="7"
e["texts"]={"PD.1","PWM0_SYNC_IN","UART0_TXD","TK10","ACMP1_P2","T0","EBI_nRD"}
if o==0 then
fill_M451_GPIO(e,t,"D",1)
elseif o==2 then
fill_M451_PWM(e,t,"D",1,"PWM0_SYNC_IN",0)
elseif o==3 then
fill_M451_UART(e,t,"D",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M451_TK(e,t,"D",1,"TK10",10)
elseif o==5 then
fill_M451_ACMP(e,t,"D",1,"ACMP1_P2",1)
elseif o==6 then
fill_M451_TM(e,t,"D",1,"T0",0)
elseif o==7 then
fill_M451_EBI(e,t,"D",1,"EBI_nRD")
else
fill_invalid_GPIO(e,t,"D",1)
end
a[7]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],3840),8)
e={}
e["pin_no"]="8"
e["texts"]={"PD.2","STADC","T0_EXT","TK11","ACMP1_P1","PWM0_BRAKE0","EBI_nWR","INT0"}
if o==0 then
fill_M451_GPIO(e,t,"D",2)
elseif o==1 then
fill_M451_ADC(e,t,"D",2,"STADC")
elseif o==3 then
fill_M451_TM(e,t,"D",2,"T0_EXT",0)
elseif o==4 then
fill_M451_TK(e,t,"D",2,"TK11",11)
elseif o==5 then
fill_M451_ACMP(e,t,"D",2,"ACMP1_P1",1)
elseif o==6 then
fill_M451_PWM(e,t,"D",2,"PWM0_BRAKE0",0)
elseif o==7 then
fill_M451_EBI(e,t,"D",2,"EBI_nWR")
elseif o==8 then
fill_M451_Normal(e,t,"D",2,"INT0")
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
e["texts"]={"PD.3","T2","T1_EXT","TK12","ACMP1_P0","PWM0_BRAKE1","EBI_MCLK","INT1"}
if o==0 then
fill_M451_GPIO(e,t,"D",3)
elseif o==1 then
fill_M451_TM(e,t,"D",3,"T2",2)
elseif o==3 then
fill_M451_TM(e,t,"D",3,"T1_EXT",1)
elseif o==4 then
fill_M451_TK(e,t,"D",3,"TK12",12)
elseif o==5 then
fill_M451_ACMP(e,t,"D",3,"ACMP1_P0",1)
elseif o==6 then
fill_M451_PWM(e,t,"D",3,"PWM0_BRAKE1",0)
elseif o==7 then
fill_M451_EBI(e,t,"D",3,"EBI_MCLK")
elseif o==8 then
fill_M451_Normal(e,t,"D",3,"INT1")
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
fill_M451_Normal(e,t,nil,nil,"VBAT")
a[10]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="11"
e["texts"]={"PF.0","X32_OUT","INT5"}
if o==0 then
fill_M451_GPIO(e,t,"F",0)
elseif o==1 then
fill_M451_Normal(e,t,"F",0,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M451_Normal(e,t,"F",0,"INT5")
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
e["texts"]={"PF.1","X32_IN"}
if o==0 then
fill_M451_GPIO(e,t,"F",1)
elseif o==1 then
fill_M451_Normal(e,t,"F",1,"X32_IN")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
a[12]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="13"
e["texts"]={"PF.2","TAMPER"}
if o==0 then
fill_M451_GPIO(e,t,"F",2)
elseif o==1 then
fill_M451_Normal(e,t,"F",2,"TAMPER")
else
fill_invalid_GPIO(e,t,"F",2)
end
a[13]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],4026531840),28)
e={}
e["pin_no"]="14"
e["texts"]={"PD.7","PWM0_SYNC_IN","T1","ACMP0_O","PWM0_CH5","EBI_nRD"}
if o==0 then
fill_M451_GPIO(e,t,"D",7)
elseif o==3 then
fill_M451_PWM(e,t,"D",7,"PWM0_SYNC_IN",0)
elseif o==4 then
fill_M451_TM(e,t,"D",7,"T1",1)
elseif o==5 then
fill_M451_ACMP(e,t,"D",7,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M451_PWM(e,t,"D",7,"PWM0_CH5",0,5)
elseif o==7 then
fill_M451_EBI(e,t,"D",7,"EBI_nRD")
else
fill_invalid_GPIO(e,t,"D",7)
end
a[14]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="15"
e["texts"]={"PF.3","XT1_OUT","I2C1_SCL"}
if o==0 then
fill_M451_GPIO(e,t,"F",3)
elseif o==1 then
fill_M451_Normal(e,t,"F",3,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M451_I2C(e,t,"F",3,"I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[15]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],983040),16)
e={}
e["pin_no"]="16"
e["texts"]={"PF.4","XT1_IN","I2C1_SDA"}
if o==0 then
fill_M451_GPIO(e,t,"F",4)
elseif o==1 then
fill_M451_Normal(e,t,"F",4,"XT1_IN")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M451_I2C(e,t,"F",4,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"F",4)
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VSS"}
fill_M451_Normal(e,t,nil,nil,"VSS")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"LDO_CAP"}
fill_M451_Normal(e,t,nil,nil,"LDO_CAP")
a[18]=e
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
e={}
e["pin_no"]="19"
e["texts"]={"PC.0","SPI2_CLK","UART2_nCTS","CAN0_TXD","PWM0_CH0","EBI_AD8","INT2"}
if o==0 then
fill_M451_GPIO(e,t,"C",0)
elseif o==2 then
fill_M451_SPI(e,t,"C",0,"SPI2_CLK",2)
elseif o==3 then
fill_M451_UART(e,t,"C",0,"UART2_nCTS",2)
elseif o==4 then
fill_M451_CAN(e,t,"C",0,"CAN0_TXD",0)
elseif o==6 then
fill_M451_PWM(e,t,"C",0,"PWM0_CH0",0,0)
elseif o==7 then
fill_M451_EBI(e,t,"C",0,"EBI_AD8")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M451_Normal(e,t,"C",0,"INT2")
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
e["texts"]={"PC.1","CLKO","STDAC","UART2_nRTS","CAN0_RXD","PWM0_CH1","EBI_AD9"}
if o==0 then
fill_M451_GPIO(e,t,"C",1)
elseif o==1 then
fill_M451_CLKO(e,t,"C",1,"CLKO")
elseif o==2 then
fill_M451_DAC(e,t,"C",1,"STDAC")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M451_UART(e,t,"C",1,"UART2_nRTS",2)
elseif o==4 then
fill_M451_CAN(e,t,"C",1,"CAN0_RXD",0)
elseif o==6 then
fill_M451_PWM(e,t,"C",1,"PWM0_CH1",0,1)
elseif o==7 then
fill_M451_EBI(e,t,"C",1,"EBI_AD9")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",1)
end
a[20]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="21"
e["texts"]={"PC.2","SPI2_SS","UART2_TXD","ACMP1_O","PWM0_CH2","EBI_AD10"}
if o==0 then
fill_M451_GPIO(e,t,"C",2)
elseif o==2 then
fill_M451_SPI(e,t,"C",2,"SPI2_SS",2)
elseif o==3 then
fill_M451_UART(e,t,"C",2,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M451_ACMP(e,t,"C",2,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M451_PWM(e,t,"C",2,"PWM0_CH2",0,2)
elseif o==7 then
fill_M451_EBI(e,t,"C",2,"EBI_AD10")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",2)
end
a[21]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="22"
e["texts"]={"PC.3","SPI2_MOSI","UART2_RXD","USB_VBUS_ST","PWM0_CH3","EBI_AD11"}
if o==0 then
fill_M451_GPIO(e,t,"C",3)
elseif o==2 then
fill_M451_SPI(e,t,"C",3,"SPI2_MOSI",2)
fill_M451_SPI_IO(e,t,2,false)
elseif o==3 then
fill_M451_UART(e,t,"C",3,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M451_USB(e,t,"C",3,"USB_VBUS_ST")
elseif o==6 then
fill_M451_PWM(e,t,"C",3,"PWM0_CH3",0,3)
elseif o==7 then
fill_M451_EBI(e,t,"C",3,"EBI_AD11")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",3)
end
a[22]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],983040),16)
e={}
e["pin_no"]="23"
e["texts"]={"PC.4","SPI2_MISO","I2C1_SCL","USB_VBUS_EN","PWM0_CH4","EBI_AD12"}
if o==0 then
fill_M451_GPIO(e,t,"C",4)
elseif o==2 then
fill_M451_SPI(e,t,"C",4,"SPI2_MISO",2)
fill_M451_SPI_IO(e,t,2,true)
elseif o==3 then
fill_M451_I2C(e,t,"C",4,"I2C1_SCL",1)
elseif o==4 then
fill_M451_USB(e,t,"C",4,"USB_VBUS_EN")
elseif o==6 then
fill_M451_PWM(e,t,"C",4,"PWM0_CH4",0,4)
elseif o==7 then
fill_M451_EBI(e,t,"C",4,"EBI_AD12")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",4)
end
a[23]=e
local o=ext.band(t["SYS_SYS_GPE_MFPL"],15)
e={}
e["pin_no"]="24"
e["texts"]={"PE.0","SPI2_CLK","I2C1_SDA","T2_EXT","SC0_CD","PWM0_CH0","EBI_nCS1","INT4"}
if o==0 then
fill_M451_GPIO(e,t,"E",0)
elseif o==2 then
fill_M451_SPI(e,t,"E",0,"SPI2_CLK",2)
elseif o==3 then
fill_M451_I2C(e,t,"E",0,"I2C1_SDA",1)
elseif o==4 then
fill_M451_TM(e,t,"E",0,"T2_EXT",2)
elseif o==5 then
fill_M451_SC(e,t,"E",0,"SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M451_PWM(e,t,"E",0,"PWM0_CH0",0,0)
elseif o==7 then
fill_M451_EBI(e,t,"E",0,"EBI_nCS1")
elseif o==8 then
fill_M451_Normal(e,t,"E",0,"INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"E",0)
end
a[24]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],15728640),20)
e={}
e["pin_no"]="25"
e["texts"]={"ICE_CLK","PF.5"}
if o==0 then
fill_M451_GPIO(e,t,"F",5)
elseif o==1 then
fill_M451_Normal(e,t,"F",5,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",5)
end
a[25]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],251658240),24)
e={}
e["pin_no"]="26"
e["texts"]={"ICE_DAT","PF.6"}
if o==0 then
fill_M451_GPIO(e,t,"F",6)
elseif o==1 then
fill_M451_Normal(e,t,"F",6,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"F",6)
end
a[26]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],3840),8)
e={}
e["pin_no"]="27"
e["texts"]={"SC0_DAT","I2C0_SMBAL","UART1_nCTS","SPI0_MISO0","SPI1_MISO","PE.10"}
if o==0 then
fill_M451_GPIO(e,t,"E",10)
elseif o==1 then
fill_M451_SPI(e,t,"E",10,"SPI1_MISO",1)
fill_M451_SPI_IO(e,t,1,true)
elseif o==2 then
fill_M451_SPI(e,t,"E",10,"SPI0_MISO0",0)
fill_M451_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M451_UART(e,t,"E",10,"UART1_nCTS",1)
elseif o==4 then
fill_M451_I2C(e,t,"E",10,"I2C0_SMBAL",0)
elseif o==5 then
fill_M451_SC(e,t,"E",10,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
else
fill_invalid_GPIO(e,t,"E",10)
end
a[27]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],61440),12)
e={}
e["pin_no"]="28"
e["texts"]={"SC0_CLK","I2C0_SMBSUS","UART1_nRTS","SPI0_MOSI0","SPI1_MOSI","PE.11"}
if o==0 then
fill_M451_GPIO(e,t,"E",11)
elseif o==1 then
fill_M451_SPI(e,t,"E",11,"SPI1_MOSI",1)
fill_M451_SPI_IO(e,t,1,false)
elseif o==2 then
fill_M451_SPI(e,t,"E",11,"SPI0_MOSI0",0)
fill_M451_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M451_UART(e,t,"E",11,"UART1_nRTS",1)
elseif o==4 then
fill_M451_I2C(e,t,"E",11,"I2C0_SMBSUS",0)
elseif o==5 then
fill_M451_SC(e,t,"E",11,"SC0_CLK",0)
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_PushPullOut
end
else
fill_invalid_GPIO(e,t,"E",11)
end
a[28]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],983040),16)
e={}
e["pin_no"]="29"
e["texts"]={"I2C0_SCL","UART1_TXD","SPI0_SS","SPI1_SS","PE.12"}
if o==0 then
fill_M451_GPIO(e,t,"E",12)
elseif o==1 then
fill_M451_SPI(e,t,"E",12,"SPI1_SS",1)
elseif o==2 then
fill_M451_SPI(e,t,"E",12,"SPI0_SS",0)
elseif o==3 then
fill_M451_UART(e,t,"E",12,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M451_I2C(e,t,"E",12,"I2C0_SCL",0)
else
fill_invalid_GPIO(e,t,"E",12)
end
a[29]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],15728640),20)
e={}
e["pin_no"]="30"
e["texts"]={"I2C0_SDA","UART1_RXD","SPI0_CLK","SPI1_CLK","PE.13"}
if o==0 then
fill_M451_GPIO(e,t,"E",13)
elseif o==1 then
fill_M451_SPI(e,t,"E",13,"SPI1_CLK",1)
elseif o==2 then
fill_M451_SPI(e,t,"E",13,"SPI0_CLK",0)
elseif o==3 then
fill_M451_UART(e,t,"E",13,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M451_I2C(e,t,"E",13,"I2C0_SDA",0)
else
fill_invalid_GPIO(e,t,"E",13)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"VDDIO"}
fill_M451_Normal(e,t,nil,nil,"VDDIO")
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"USB_VBUS"}
fill_M451_USB(e,t,nil,nil,"USB_VBUS")
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"USB_D-"}
fill_M451_USB(e,t,nil,nil,"USB_D-")
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"USB_D+"}
fill_M451_USB(e,t,nil,nil,"USB_D+")
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"USB_ID"}
fill_M451_USB(e,t,nil,nil,"USB_ID")
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"USB_VDD33_CAP"}
fill_M451_USB(e,t,nil,nil,"USB_VDD33_CAP")
a[36]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="37"
e["texts"]={"EBI_AD3","PWM1_CH2","SC0_PWR","I2C0_SCL","UART0_nRTS","UART0_RXD","USB_VBUS_ST","PA.3"}
if o==0 then
fill_M451_GPIO(e,t,"A",3)
elseif o==1 then
fill_M451_USB(e,t,"A",3,"USB_VBUS_ST")
elseif o==2 then
fill_M451_UART(e,t,"A",3,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M451_UART(e,t,"A",3,"UART0_nRTS",0)
elseif o==4 then
fill_M451_I2C(e,t,"A",3,"I2C0_SCL",0)
elseif o==5 then
fill_M451_SC(e,t,"A",3,"SC0_PWR",0)
elseif o==6 then
fill_M451_PWM(e,t,"A",3,"PWM1_CH2",1,2)
elseif o==7 then
fill_M451_EBI(e,t,"A",3,"EBI_AD3")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",3)
end
a[37]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="38"
e["texts"]={"EBI_AD2","PWM1_CH3","SC0_RST","I2C0_SDA","UART0_nCTS","UART0_TXD","USB_VBUS_EN","PA.2"}
if o==0 then
fill_M451_GPIO(e,t,"A",2)
elseif o==1 then
fill_M451_USB(e,t,"A",2,"USB_VBUS_EN")
elseif o==2 then
fill_M451_UART(e,t,"A",2,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M451_UART(e,t,"A",2,"UART0_nCTS",0)
elseif o==4 then
fill_M451_I2C(e,t,"A",2,"I2C0_SDA",0)
elseif o==5 then
fill_M451_SC(e,t,"A",2,"SC0_RST",0)
elseif o==6 then
fill_M451_PWM(e,t,"A",2,"PWM1_CH3",1,3)
elseif o==7 then
fill_M451_EBI(e,t,"A",2,"EBI_AD2")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",2)
end
a[38]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],240),4)
e={}
e["pin_no"]="39"
e["texts"]={"EBI_AD1","PWM1_CH4","SC0_DAT","CAN0_TXD","UART1_RXD","UART1_nRTS","PA.1"}
if o==0 then
fill_M451_GPIO(e,t,"A",1)
elseif o==1 then
fill_M451_UART(e,t,"A",1,"UART1_nRTS",1)
elseif o==3 then
fill_M451_UART(e,t,"A",1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M451_CAN(e,t,"A",1,"CAN0_TXD",0)
elseif o==5 then
fill_M451_SC(e,t,"A",1,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==6 then
fill_M451_PWM(e,t,"A",1,"PWM1_CH4",1,4)
elseif o==7 then
fill_M451_EBI(e,t,"A",1,"EBI_AD1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",1)
end
a[39]=e
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
e={}
e["pin_no"]="40"
e["texts"]={"INT0","EBI_AD0","PWM1_CH5","SC0_CLK","CAN0_RXD","UART1_TXD","UART1_nCTS","PA.0"}
if o==0 then
fill_M451_GPIO(e,t,"A",0)
elseif o==1 then
fill_M451_UART(e,t,"A",0,"UART1_nCTS",1)
elseif o==3 then
fill_M451_UART(e,t,"A",0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M451_CAN(e,t,"A",0,"CAN0_RXD",0)
elseif o==5 then
fill_M451_SC(e,t,"A",0,"SC0_CLK",0)
local t=ext.band(t["SC0_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_PushPullOut
end
elseif o==6 then
fill_M451_PWM(e,t,"A",0,"PWM1_CH5",1,5)
elseif o==7 then
fill_M451_EBI(e,t,"A",0,"EBI_AD0")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M451_Normal(e,t,"A",0,"INT0")
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
fill_M451_Normal(e,t,nil,nil,"VDD")
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"AVDD"}
fill_M451_Normal(e,t,nil,nil,"AVDD")
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"VREF"}
fill_M451_Normal(e,t,nil,nil,"VREF")
a[43]=e
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
e={}
e["pin_no"]="44"
e["texts"]={"INT1","EBI_nWRL","DAC","T2","UART2_RXD","SPI0_MOSI1","EADC_CH0","PB.0"}
if o==0 then
fill_M451_GPIO(e,t,"B",0)
elseif o==1 then
fill_M451_ADC(e,t,"B",0,"EADC_CH0",0)
elseif o==2 then
fill_M451_SPI(e,t,"B",0,"SPI0_MOSI1",0)
fill_M451_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M451_UART(e,t,"B",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M451_TM(e,t,"B",0,"T2",2)
elseif o==5 then
fill_M451_DAC(e,t,"B",0,"DAC")
elseif o==7 then
fill_M451_EBI(e,t,"B",0,"EBI_nWRL")
elseif o==8 then
fill_M451_Normal(e,t,"B",0,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",0)
end
a[44]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],240),4)
e={}
e["pin_no"]="45"
e["texts"]={"EBI_nWRH","PWM0_SYNC_OUT","SC0_RST","T3","UART2_TXD","SPI0_MISO1","EADC_CH1","PB.1"}
if o==0 then
fill_M451_GPIO(e,t,"B",1)
elseif o==1 then
fill_M451_ADC(e,t,"B",1,"EADC_CH1",1)
elseif o==2 then
fill_M451_SPI(e,t,"B",1,"SPI0_MISO1",0)
fill_M451_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M451_UART(e,t,"B",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M451_TM(e,t,"B",1,"T3",3)
elseif o==5 then
fill_M451_SC(e,t,"B",1,"SC0_RST",0)
elseif o==6 then
fill_M451_PWM(e,t,"B",1,"PWM0_SYNC_OUT",0)
elseif o==7 then
fill_M451_EBI(e,t,"B",1,"EBI_nWRH")
else
fill_invalid_GPIO(e,t,"B",1)
end
a[45]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="46"
e["texts"]={"SC0_CD","UART1_RXD","SPI1_CLK","SPI0_CLK","EADC_CH2","PB.2"}
if o==0 then
fill_M451_GPIO(e,t,"B",2)
elseif o==1 then
fill_M451_ADC(e,t,"B",2,"EADC_CH2",2)
elseif o==2 then
fill_M451_SPI(e,t,"B",2,"SPI0_CLK",0)
elseif o==3 then
fill_M451_SPI(e,t,"B",2,"SPI1_CLK",1)
elseif o==4 then
fill_M451_UART(e,t,"B",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_M451_SC(e,t,"B",2,"SC0_CD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",2)
end
a[46]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="47"
e["texts"]={"UART1_TXD","SPI1_MISO","SPI0_MISO0","EADC_CH3","PB.3"}
if o==0 then
fill_M451_GPIO(e,t,"B",3)
elseif o==1 then
fill_M451_ADC(e,t,"B",3,"EADC_CH3",3)
elseif o==2 then
fill_M451_SPI(e,t,"B",3,"SPI0_MISO0",0)
fill_M451_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M451_SPI(e,t,"B",3,"SPI1_MISO",1)
fill_M451_SPI_IO(e,t,1,true)
elseif o==4 then
fill_M451_UART(e,t,"B",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",3)
end
a[47]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="48"
e["texts"]={"EBI_AD7","ACMP0_N","UART1_nCTS","SPI1_SS","SPI0_SS","EADC_CH4","PB.4"}
if o==0 then
fill_M451_GPIO(e,t,"B",4)
elseif o==1 then
fill_M451_ADC(e,t,"B",4,"EADC_CH4",4)
elseif o==2 then
fill_M451_SPI(e,t,"B",4,"SPI0_SS",0)
elseif o==3 then
fill_M451_SPI(e,t,"B",4,"SPI1_SS",1)
elseif o==4 then
fill_M451_UART(e,t,"B",4,"UART1_nCTS",1)
elseif o==5 then
fill_M451_ACMP(e,t,"B",4,"ACMP0_N",0)
elseif o==7 then
fill_M451_EBI(e,t,"B",4,"EBI_AD7")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",4)
end
a[48]=e
return{name=i,information="",pins=a}
end
