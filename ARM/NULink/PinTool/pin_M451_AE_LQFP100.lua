local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M451.lua")
function get_chip_status_M451_AE_LQFP100(i,e,o,t)
local a={}
local t=read_M451_Registers(i,e,o,t)
local e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],15728640),20)
e={}
e["pin_no"]="1"
e["texts"]={"PB.13","EADC_CH10"}
if o==0 then
fill_M451_GPIO(e,t,"B",13)
elseif o==1 then
fill_M451_ADC(e,t,"B",13,"EADC_CH10",10)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[1]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],251658240),24)
e={}
e["pin_no"]="2"
e["texts"]={"PB.14","EADC_CH11"}
if o==0 then
fill_M451_GPIO(e,t,"B",14)
elseif o==1 then
fill_M451_ADC(e,t,"B",14,"EADC_CH11",11)
else
fill_invalid_GPIO(e,t,"B",14)
end
a[2]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],4026531840),28)
e={}
e["pin_no"]="3"
e["texts"]={"PB.15","EADC_CH12","TK2","ACMP0_P3","EBI_nCS1"}
if o==0 then
fill_M451_GPIO(e,t,"B",15)
elseif o==1 then
fill_M451_ADC(e,t,"B",15,"EADC_CH12",12)
elseif o==4 then
fill_M451_TK(e,t,"B",15,"TK2",2)
elseif o==5 then
fill_M451_ACMP(e,t,"B",15,"ACMP0_P3",0)
elseif o==7 then
fill_M451_EBI(e,t,"B",15,"EBI_nCS1")
else
fill_invalid_GPIO(e,t,"B",15)
end
a[3]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="4"
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
a[4]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],251658240),24)
e={}
e["pin_no"]="5"
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
a[5]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],4026531840),28)
e={}
e["pin_no"]="6"
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
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"nRESET"}
fill_M451_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[7]=e
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
e={}
e["pin_no"]="8"
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
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"AVSS"}
fill_M451_Normal(e,t,nil,nil,"AVSS")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"VDD"}
fill_M451_Normal(e,t,nil,nil,"VDD")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VSS"}
fill_M451_Normal(e,t,nil,nil,"VSS")
a[11]=e
local o=ext.band(t["SYS_SYS_GPC_MFPH"],15)
e={}
e["pin_no"]="12"
e["texts"]={"PC.8","TK7"}
if o==0 then
fill_M451_GPIO(e,t,"C",8)
elseif o==4 then
fill_M451_TK(e,t,"C",8,"TK7",7)
else
fill_invalid_GPIO(e,t,"C",8)
end
a[12]=e
local o=ext.band(t["SYS_SYS_GPD_MFPH"],15)
e={}
e["pin_no"]="13"
e["texts"]={"PD.8","TK8","EBI_nCS0"}
if o==0 then
fill_M451_GPIO(e,t,"D",8)
elseif o==4 then
fill_M451_TK(e,t,"D",8,"TK8",8)
elseif o==7 then
fill_M451_EBI(e,t,"D",8,"EBI_nCS0")
else
fill_invalid_GPIO(e,t,"D",8)
end
a[13]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],240),4)
e={}
e["pin_no"]="14"
e["texts"]={"PD.9","TK9","ACMP1_P3","EBI_ALE"}
if o==0 then
fill_M451_GPIO(e,t,"D",9)
elseif o==4 then
fill_M451_TK(e,t,"D",9,"TK9",9)
elseif o==5 then
fill_M451_ACMP(e,t,"D",9,"ACMP1_P3",1)
elseif o==7 then
fill_M451_EBI(e,t,"D",9,"EBI_ALE")
else
fill_invalid_GPIO(e,t,"D",9)
end
a[14]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],240),4)
e={}
e["pin_no"]="15"
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
a[15]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],3840),8)
e={}
e["pin_no"]="16"
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
a[16]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],61440),12)
e={}
e["pin_no"]="17"
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
a[17]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],983040),16)
e={}
e["pin_no"]="18"
e["texts"]={"PD.4","SPI1_CLK","I2C0_SDA","TK13","PWM0_BRAKE0","T0"}
if o==0 then
fill_M451_GPIO(e,t,"D",4)
elseif o==2 then
fill_M451_SPI(e,t,"D",4,"SPI1_CLK",1)
elseif o==3 then
fill_M451_I2C(e,t,"D",4,"I2C0_SDA",0)
elseif o==4 then
fill_M451_TK(e,t,"D",4,"TK13",13)
elseif o==5 then
fill_M451_PWM(e,t,"D",4,"PWM0_BRAKE0",0)
elseif o==6 then
fill_M451_TM(e,t,"D",4,"T0",0)
else
fill_invalid_GPIO(e,t,"D",4)
end
a[18]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],15728640),20)
e={}
e["pin_no"]="19"
e["texts"]={"PD.5","CLKO","SPI1_MISO","I2C0_SCL","TK14","PWM0_BRAKE1","T1"}
if o==0 then
fill_M451_GPIO(e,t,"D",5)
elseif o==1 then
fill_M451_CLKO(e,t,"D",5,"CLKO")
elseif o==2 then
fill_M451_SPI(e,t,"D",5,"SPI1_MISO",1)
fill_M451_SPI_IO(e,t,1,true)
elseif o==3 then
fill_M451_I2C(e,t,"D",5,"I2C0_SCL",0)
elseif o==4 then
fill_M451_TK(e,t,"D",5,"TK14",14)
elseif o==5 then
fill_M451_PWM(e,t,"D",5,"PWM0_BRAKE1",0)
elseif o==6 then
fill_M451_TM(e,t,"D",5,"T1",1)
else
fill_invalid_GPIO(e,t,"D",5)
end
a[19]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],61440),12)
e={}
e["pin_no"]="20"
e["texts"]={"PE.3","SPI1_MOSI","TK15","PWM0_CH3"}
if o==0 then
fill_M451_GPIO(e,t,"E",3)
elseif o==2 then
fill_M451_SPI(e,t,"E",3,"SPI1_MOSI",1)
fill_M451_SPI_IO(e,t,1,false)
elseif o==4 then
fill_M451_TK(e,t,"E",3,"TK15",15)
elseif o==6 then
fill_M451_PWM(e,t,"E",3,"PWM0_CH3",0,3)
else
fill_invalid_GPIO(e,t,"E",3)
end
a[20]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],251658240),24)
e={}
e["pin_no"]="21"
e["texts"]={"PD.6","CLKO","SPI1_SS","UART0_RXD","TK16","ACMP0_O","PWM0_CH5","EBI_nWR"}
if o==0 then
fill_M451_GPIO(e,t,"D",6)
elseif o==1 then
fill_M451_CLKO(e,t,"D",6,"CLKO")
elseif o==2 then
fill_M451_SPI(e,t,"D",6,"SPI1_SS",1)
elseif o==3 then
fill_M451_UART(e,t,"D",6,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M451_TK(e,t,"D",6,"TK16",16)
elseif o==5 then
fill_M451_ACMP(e,t,"D",6,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M451_PWM(e,t,"D",6,"PWM0_CH5",0,5)
elseif o==7 then
fill_M451_EBI(e,t,"D",6,"EBI_nWR")
else
fill_invalid_GPIO(e,t,"D",6)
end
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"VBAT"}
fill_M451_Normal(e,t,nil,nil,"VBAT")
a[22]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="23"
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
a[23]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="24"
e["texts"]={"PF.1","X32_IN"}
if o==0 then
fill_M451_GPIO(e,t,"F",1)
elseif o==1 then
fill_M451_Normal(e,t,"F",1,"X32_IN")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
a[24]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="25"
e["texts"]={"PF.2","TAMPER"}
if o==0 then
fill_M451_GPIO(e,t,"F",2)
elseif o==1 then
fill_M451_Normal(e,t,"F",2,"TAMPER")
else
fill_invalid_GPIO(e,t,"F",2)
end
a[25]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],3840),8)
e={}
e["pin_no"]="26"
e["texts"]={"PD.10","T2"}
if o==0 then
fill_M451_GPIO(e,t,"D",10)
elseif o==4 then
fill_M451_TM(e,t,"D",10,"T2",2)
else
fill_invalid_GPIO(e,t,"D",10)
end
a[26]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],61440),12)
e={}
e["pin_no"]="27"
e["texts"]={"PD.11","T3"}
if o==0 then
fill_M451_GPIO(e,t,"D",11)
elseif o==4 then
fill_M451_TM(e,t,"D",11,"T3",3)
else
fill_invalid_GPIO(e,t,"D",11)
end
a[27]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],983040),16)
e={}
e["pin_no"]="28"
e["texts"]={"PD.12","SPI2_SS","UART3_TXD","PWM1_CH0","EBI_ADR16"}
if o==0 then
fill_M451_GPIO(e,t,"D",12)
elseif o==2 then
fill_M451_SPI(e,t,"D",12,"SPI2_SS",2)
elseif o==3 then
fill_M451_UART(e,t,"D",12,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M451_PWM(e,t,"D",12,"PWM1_CH0",1,0)
elseif o==7 then
fill_M451_EBI(e,t,"D",12,"EBI_ADR16")
else
fill_invalid_GPIO(e,t,"D",12)
end
a[28]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],15728640),20)
e={}
e["pin_no"]="29"
e["texts"]={"PD.13","SPI2_MOSI","UART3_RXD","PWM1_CH1","EBI_ADR17"}
if o==0 then
fill_M451_GPIO(e,t,"D",13)
elseif o==2 then
fill_M451_SPI(e,t,"D",13,"SPI2_MOSI",2)
fill_M451_SPI_IO(e,t,2,false)
elseif o==3 then
fill_M451_UART(e,t,"D",13,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M451_PWM(e,t,"D",13,"PWM1_CH1",1,1)
elseif o==7 then
fill_M451_EBI(e,t,"D",13,"EBI_ADR17")
else
fill_invalid_GPIO(e,t,"D",13)
end
a[29]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],251658240),24)
e={}
e["pin_no"]="30"
e["texts"]={"PD.14","SPI2_MISO","UART3_nCTS","PWM1_CH2","EBI_ADR18"}
if o==0 then
fill_M451_GPIO(e,t,"D",14)
elseif o==2 then
fill_M451_SPI(e,t,"D",14,"SPI2_MISO",2)
fill_M451_SPI_IO(e,t,2,true)
elseif o==3 then
fill_M451_UART(e,t,"D",14,"UART3_nCTS",3)
elseif o==6 then
fill_M451_PWM(e,t,"D",14,"PWM1_CH2",1,2)
elseif o==7 then
fill_M451_EBI(e,t,"D",14,"EBI_ADR18")
else
fill_invalid_GPIO(e,t,"D",14)
end
a[30]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],4026531840),28)
e={}
e["pin_no"]="31"
e["texts"]={"PD.15","SPI2_CLK","UART3_nRTS","PWM1_CH3","EBI_ADR19"}
if o==0 then
fill_M451_GPIO(e,t,"D",15)
elseif o==2 then
fill_M451_SPI(e,t,"D",15,"SPI2_CLK",2)
elseif o==3 then
fill_M451_UART(e,t,"D",15,"UART3_nRTS",3)
elseif o==6 then
fill_M451_PWM(e,t,"D",15,"PWM1_CH3",1,3)
elseif o==7 then
fill_M451_EBI(e,t,"D",15,"EBI_ADR19")
else
fill_invalid_GPIO(e,t,"D",15)
end
a[31]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],4026531840),28)
e={}
e["pin_no"]="32"
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
a[32]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="33"
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
a[33]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],983040),16)
e={}
e["pin_no"]="34"
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
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"VSS"}
fill_M451_Normal(e,t,nil,nil,"VSS")
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"VDD"}
fill_M451_Normal(e,t,nil,nil,"VDD")
a[36]=e
e={}
e["pin_no"]="37"
e["texts"]={"LDO_CAP"}
fill_M451_Normal(e,t,nil,nil,"LDO_CAP")
a[37]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],240),4)
e={}
e["pin_no"]="38"
e["texts"]={"PC.9","SPI2_I2SMCLK","PWM1_CH0"}
if o==0 then
fill_M451_GPIO(e,t,"C",9)
elseif o==2 then
fill_M451_SPI(e,t,"C",9,"SPI2_I2SMCLK",2)
elseif o==6 then
fill_M451_PWM(e,t,"C",9,"PWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"C",9)
end
a[38]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],3840),8)
e={}
e["pin_no"]="39"
e["texts"]={"PC.10","SPI2_MOSI","PWM1_CH1"}
if o==0 then
fill_M451_GPIO(e,t,"C",10)
elseif o==2 then
fill_M451_SPI(e,t,"C",10,"SPI2_MOSI",2)
fill_M451_SPI_IO(e,t,2,false)
elseif o==6 then
fill_M451_PWM(e,t,"C",10,"PWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"C",10)
end
a[39]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],61440),12)
e={}
e["pin_no"]="40"
e["texts"]={"PC.11","SPI2_MISO","PWM1_CH2"}
if o==0 then
fill_M451_GPIO(e,t,"C",11)
elseif o==2 then
fill_M451_SPI(e,t,"C",11,"SPI2_MISO",2)
fill_M451_SPI_IO(e,t,2,true)
elseif o==6 then
fill_M451_PWM(e,t,"C",11,"PWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,"C",11)
end
a[40]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],983040),16)
e={}
e["pin_no"]="41"
e["texts"]={"PC.12","SPI2_CLK","PWM1_CH3"}
if o==0 then
fill_M451_GPIO(e,t,"C",12)
elseif o==2 then
fill_M451_SPI(e,t,"C",12,"SPI2_CLK",2)
elseif o==6 then
fill_M451_PWM(e,t,"C",12,"PWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,"C",12)
end
a[41]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],15728640),20)
e={}
e["pin_no"]="42"
e["texts"]={"PC.13","SPI2_SS","PWM1_CH4"}
if o==0 then
fill_M451_GPIO(e,t,"C",13)
elseif o==2 then
fill_M451_SPI(e,t,"C",13,"SPI2_SS",2)
elseif o==6 then
fill_M451_PWM(e,t,"C",13,"PWM1_CH4",1,4)
else
fill_invalid_GPIO(e,t,"C",13)
end
a[42]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],251658240),24)
e={}
e["pin_no"]="43"
e["texts"]={"PC.14","PWM1_CH5"}
if o==0 then
fill_M451_GPIO(e,t,"C",14)
elseif o==6 then
fill_M451_PWM(e,t,"C",14,"PWM1_CH5",1,5)
else
fill_invalid_GPIO(e,t,"C",14)
end
a[43]=e
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
e={}
e["pin_no"]="44"
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
a[44]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],240),4)
e={}
e["pin_no"]="45"
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
a[45]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="46"
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
a[46]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="47"
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
a[47]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],983040),16)
e={}
e["pin_no"]="48"
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
a[48]=e
local o=ext.band(t["SYS_SYS_GPE_MFPL"],15)
e={}
e["pin_no"]="49"
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
a[49]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],15728640),20)
e={}
e["pin_no"]="50"
e["texts"]={"PC.5","SPI2_I2SMCLK","PWM0_CH5","EBI_AD13"}
if o==0 then
fill_M451_GPIO(e,t,"C",5)
elseif o==2 then
fill_M451_SPI(e,t,"C",5,"SPI2_I2SMCLK",2)
elseif o==6 then
fill_M451_PWM(e,t,"C",5,"PWM0_CH5",0,5)
elseif o==7 then
fill_M451_EBI(e,t,"C",5,"EBI_AD13")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",5)
end
a[50]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],251658240),24)
e={}
e["pin_no"]="51"
e["texts"]={"EBI_AD14","PWM1_CH0","ACMP1_O","I2C1_SMBAL","PC.6"}
if o==0 then
fill_M451_GPIO(e,t,"C",6)
elseif o==3 then
fill_M451_I2C(e,t,"C",6,"I2C1_SMBAL",1)
elseif o==5 then
fill_M451_ACMP(e,t,"C",6,"ACMP1_O",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M451_PWM(e,t,"C",6,"PWM1_CH0",1,0)
elseif o==7 then
fill_M451_EBI(e,t,"C",6,"EBI_AD14")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",6)
end
a[51]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],4026531840),28)
e={}
e["pin_no"]="52"
e["texts"]={"EBI_AD15","PWM1_CH1","I2C1_SMBSUS","PC.7"}
if o==0 then
fill_M451_GPIO(e,t,"C",7)
elseif o==3 then
fill_M451_I2C(e,t,"C",7,"I2C1_SMBSUS",1)
elseif o==6 then
fill_M451_PWM(e,t,"C",7,"PWM1_CH1",1,1)
elseif o==7 then
fill_M451_EBI(e,t,"C",7,"EBI_AD15")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",7)
end
a[52]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],983040),16)
e={}
e["pin_no"]="53"
e["texts"]={"INT0","EBI_nCS0","PWM1_BRAKE0","SC0_PWR","I2C1_SCL","PE.4"}
if o==0 then
fill_M451_GPIO(e,t,"E",4)
elseif o==3 then
fill_M451_I2C(e,t,"E",4,"I2C1_SCL",1)
elseif o==5 then
fill_M451_SC(e,t,"E",4,"SC0_PWR",0)
elseif o==6 then
fill_M451_PWM(e,t,"E",4,"PWM1_BRAKE0",1)
elseif o==7 then
fill_M451_EBI(e,t,"E",4,"EBI_nCS0")
elseif o==8 then
fill_M451_Normal(e,t,"E",4,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"E",4)
end
a[53]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],15728640),20)
e={}
e["pin_no"]="54"
e["texts"]={"INT1","EBI_ALE","PWM1_BRAKE1","SC0_RST","I2C1_SDA","PE.5"}
if o==0 then
fill_M451_GPIO(e,t,"E",5)
elseif o==3 then
fill_M451_I2C(e,t,"E",5,"I2C1_SDA",1)
elseif o==5 then
fill_M451_SC(e,t,"E",5,"SC0_RST",0)
elseif o==6 then
fill_M451_PWM(e,t,"E",5,"PWM1_BRAKE1",1)
elseif o==7 then
fill_M451_EBI(e,t,"E",5,"EBI_ALE")
elseif o==8 then
fill_M451_Normal(e,t,"E",5,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"E",5)
end
a[54]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],15728640),20)
e={}
e["pin_no"]="55"
e["texts"]={"ICE_CLK","PF.5"}
if o==0 then
fill_M451_GPIO(e,t,"F",5)
elseif o==1 then
fill_M451_Normal(e,t,"F",5,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",5)
end
a[55]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],251658240),24)
e={}
e["pin_no"]="56"
e["texts"]={"ICE_DAT","PF.6"}
if o==0 then
fill_M451_GPIO(e,t,"F",6)
elseif o==1 then
fill_M451_Normal(e,t,"F",6,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"F",6)
end
a[56]=e
local o=ext.band(t["SYS_SYS_GPA_MFPH"],15)
e={}
e["pin_no"]="57"
e["texts"]={"UART3_TXD","PA.8"}
if o==0 then
fill_M451_GPIO(e,t,"A",8)
elseif o==3 then
fill_M451_UART(e,t,"A",8,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",8)
end
a[57]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],240),4)
e={}
e["pin_no"]="58"
e["texts"]={"UART3_RXD","PA.9"}
if o==0 then
fill_M451_GPIO(e,t,"A",9)
elseif o==3 then
fill_M451_UART(e,t,"A",9,"UART3_RXD",3)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",9)
end
a[58]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],3840),8)
e={}
e["pin_no"]="59"
e["texts"]={"UART3_nCTS","PA.10"}
if o==0 then
fill_M451_GPIO(e,t,"A",10)
elseif o==3 then
fill_M451_UART(e,t,"A",10,"UART3_nCTS",3)
else
fill_invalid_GPIO(e,t,"A",10)
end
a[59]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],61440),12)
e={}
e["pin_no"]="60"
e["texts"]={"UART3_nRTS","PA.11"}
if o==0 then
fill_M451_GPIO(e,t,"A",11)
elseif o==3 then
fill_M451_UART(e,t,"A",11,"UART3_nRTS",3)
else
fill_invalid_GPIO(e,t,"A",11)
end
a[60]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],251658240),24)
e={}
e["pin_no"]="61"
e["texts"]={"T3_EXT","PE.6"}
if o==0 then
fill_M451_GPIO(e,t,"E",6)
elseif o==3 then
fill_M451_TM(e,t,"E",6,"T3_EXT",3)
else
fill_invalid_GPIO(e,t,"E",6)
end
a[61]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],4026531840),28)
e={}
e["pin_no"]="62"
e["texts"]={"EBI_AD7","T0_EXT","SPI1_CLK","PA.7"}
if o==0 then
fill_M451_GPIO(e,t,"A",7)
elseif o==2 then
fill_M451_SPI(e,t,"A",7,"SPI1_CLK",1)
elseif o==3 then
fill_M451_TM(e,t,"A",7,"T0_EXT",0)
elseif o==7 then
fill_M451_EBI(e,t,"A",7,"EBI_AD7")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",7)
end
a[62]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],251658240),24)
e={}
e["pin_no"]="63"
e["texts"]={"EBI_AD6","T1_EXT","SPI1_MISO","PA.6"}
if o==0 then
fill_M451_GPIO(e,t,"A",6)
elseif o==2 then
fill_M451_SPI(e,t,"A",6,"SPI1_MISO",1)
fill_M451_SPI_IO(e,t,1,true)
elseif o==3 then
fill_M451_TM(e,t,"A",6,"T1_EXT",1)
elseif o==7 then
fill_M451_EBI(e,t,"A",6,"EBI_AD6")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",6)
end
a[63]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],15728640),20)
e={}
e["pin_no"]="64"
e["texts"]={"EBI_AD5","T2_EXT","SPI1_MOSI","PA.5"}
if o==0 then
fill_M451_GPIO(e,t,"A",5)
elseif o==2 then
fill_M451_SPI(e,t,"A",5,"SPI1_MOSI",1)
fill_M451_SPI_IO(e,t,1,false)
elseif o==3 then
fill_M451_TM(e,t,"A",5,"T2_EXT",2)
elseif o==7 then
fill_M451_EBI(e,t,"A",5,"EBI_AD5")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",5)
end
a[64]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],983040),16)
e={}
e["pin_no"]="65"
e["texts"]={"EBI_AD4","SPI1_SS","PA.4"}
if o==0 then
fill_M451_GPIO(e,t,"A",4)
elseif o==2 then
fill_M451_SPI(e,t,"A",4,"SPI1_SS",1)
elseif o==7 then
fill_M451_EBI(e,t,"A",4,"EBI_AD4")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",4)
end
a[65]=e
e={}
e["pin_no"]="66"
e["texts"]={"VSS"}
fill_M451_Normal(e,t,nil,nil,"VSS")
a[66]=e
e={}
e["pin_no"]="67"
e["texts"]={"VDD"}
fill_M451_Normal(e,t,nil,nil,"VDD")
a[67]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],240),4)
e={}
e["pin_no"]="68"
e["texts"]={"PWM0_CH1","SC0_CD","T3_EXT","PE.1"}
if o==0 then
fill_M451_GPIO(e,t,"E",1)
elseif o==3 then
fill_M451_TM(e,t,"E",1,"T3_EXT",3)
elseif o==5 then
fill_M451_SC(e,t,"E",1,"SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M451_PWM(e,t,"E",1,"PWM0_CH1",0,1)
else
fill_invalid_GPIO(e,t,"E",1)
end
a[68]=e
local o=ext.band(t["SYS_SYS_GPE_MFPH"],15)
e={}
e["pin_no"]="69"
e["texts"]={"SC0_PWR","I2C1_SCL","SPI0_MISO1","UART1_TXD","PE.8"}
if o==0 then
fill_M451_GPIO(e,t,"E",8)
elseif o==1 then
fill_M451_UART(e,t,"E",8,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_M451_SPI(e,t,"E",8,"SPI0_MISO1",0)
fill_M451_SPI_IO(e,t,0,true)
elseif o==4 then
fill_M451_I2C(e,t,"E",8,"I2C1_SCL",1)
elseif o==5 then
fill_M451_SC(e,t,"E",8,"SC0_PWR",0)
else
fill_invalid_GPIO(e,t,"E",8)
end
a[69]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],240),4)
e={}
e["pin_no"]="70"
e["texts"]={"SC0_RST","I2C1_SDA","SPI0_MOSI1","UART1_RXD","PE.9"}
if o==0 then
fill_M451_GPIO(e,t,"E",9)
elseif o==1 then
fill_M451_UART(e,t,"E",9,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M451_SPI(e,t,"E",9,"SPI0_MOSI1",0)
fill_M451_SPI_IO(e,t,0,false)
elseif o==4 then
fill_M451_I2C(e,t,"E",9,"I2C1_SDA",1)
elseif o==5 then
fill_M451_SC(e,t,"E",9,"SC0_RST",0)
else
fill_invalid_GPIO(e,t,"E",9)
end
a[70]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],3840),8)
e={}
e["pin_no"]="71"
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
a[71]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],61440),12)
e={}
e["pin_no"]="72"
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
a[72]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],983040),16)
e={}
e["pin_no"]="73"
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
a[73]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],15728640),20)
e={}
e["pin_no"]="74"
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
a[74]=e
e={}
e["pin_no"]="75"
e["texts"]={"VDDIO"}
fill_M451_Normal(e,t,nil,nil,"VDDIO")
a[75]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],4026531840),28)
e={}
e["pin_no"]="76"
e["texts"]={"PE.7"}
if o==0 then
fill_M451_GPIO(e,t,"E",7)
else
fill_invalid_GPIO(e,t,"E",7)
end
a[76]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPH"],4026531840),28)
e={}
e["pin_no"]="77"
e["texts"]={"PWM1_CH0","PC.15"}
if o==0 then
fill_M451_GPIO(e,t,"C",15)
elseif o==6 then
fill_M451_PWM(e,t,"C",15,"PWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,"C",15)
end
a[77]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPL"],3840),8)
e={}
e["pin_no"]="78"
e["texts"]={"PWM1_CH1","PE.2"}
if o==0 then
fill_M451_GPIO(e,t,"E",2)
elseif o==6 then
fill_M451_PWM(e,t,"E",2,"PWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,"E",2)
end
a[78]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="79"
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
a[79]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="80"
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
a[80]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],240),4)
e={}
e["pin_no"]="81"
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
a[81]=e
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
e={}
e["pin_no"]="82"
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
a[82]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],983040),16)
e={}
e["pin_no"]="83"
e["texts"]={"CAN0_TXD","SPI1_I2SMCLK","PA.12"}
if o==0 then
fill_M451_GPIO(e,t,"A",12)
elseif o==2 then
fill_M451_SPI(e,t,"A",12,"SPI1_I2SMCLK",1)
elseif o==4 then
fill_M451_CAN(e,t,"A",12,"CAN0_TXD",0)
else
fill_invalid_GPIO(e,t,"A",12)
end
a[83]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],15728640),20)
e={}
e["pin_no"]="84"
e["texts"]={"CAN0_RXD","PA.13"}
if o==0 then
fill_M451_GPIO(e,t,"A",13)
elseif o==4 then
fill_M451_CAN(e,t,"A",13,"CAN0_RXD",0)
else
fill_invalid_GPIO(e,t,"A",13)
end
a[84]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],251658240),24)
e={}
e["pin_no"]="85"
e["texts"]={"I2C0_SMBAL","UART2_nCTS","PA.14"}
if o==0 then
fill_M451_GPIO(e,t,"A",14)
elseif o==3 then
fill_M451_UART(e,t,"A",14,"UART2_nCTS",2)
elseif o==4 then
fill_M451_I2C(e,t,"A",14,"I2C0_SMBAL",0)
else
fill_invalid_GPIO(e,t,"A",14)
end
a[85]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPH"],4026531840),28)
e={}
e["pin_no"]="86"
e["texts"]={"I2C0_SMBSUS","UART2_nRTS","PA.15"}
if o==0 then
fill_M451_GPIO(e,t,"A",15)
elseif o==3 then
fill_M451_UART(e,t,"A",15,"UART2_nRTS",2)
elseif o==4 then
fill_M451_I2C(e,t,"A",15,"I2C0_SMBSUS",0)
else
fill_invalid_GPIO(e,t,"A",15)
end
a[86]=e
e={}
e["pin_no"]="87"
e["texts"]={"VSS"}
fill_M451_Normal(e,t,nil,nil,"VSS")
a[87]=e
e={}
e["pin_no"]="88"
e["texts"]={"VDD"}
fill_M451_Normal(e,t,nil,nil,"VDD")
a[88]=e
e={}
e["pin_no"]="89"
e["texts"]={"AVDD"}
fill_M451_Normal(e,t,nil,nil,"AVDD")
a[89]=e
e={}
e["pin_no"]="90"
e["texts"]={"VREF"}
fill_M451_Normal(e,t,nil,nil,"VREF")
a[90]=e
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
e={}
e["pin_no"]="91"
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
a[91]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],240),4)
e={}
e["pin_no"]="92"
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
a[92]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="93"
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
a[93]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="94"
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
a[94]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="95"
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
a[95]=e
local o=ext.band(t["SYS_SYS_GPB_MFPH"],15)
e={}
e["pin_no"]="96"
e["texts"]={"PWM0_CH2","UART1_nRTS","EADC_CH5","PB.8"}
if o==0 then
fill_M451_GPIO(e,t,"B",8)
elseif o==1 then
fill_M451_ADC(e,t,"B",8,"EADC_CH5",5)
elseif o==4 then
fill_M451_UART(e,t,"B",8,"UART1_nRTS",1)
elseif o==6 then
fill_M451_PWM(e,t,"B",8,"PWM0_CH2",0,2)
else
fill_invalid_GPIO(e,t,"B",8)
end
a[96]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],240),4)
e={}
e["pin_no"]="97"
e["texts"]={"EADC_CH6","PB.9"}
if o==0 then
fill_M451_GPIO(e,t,"B",9)
elseif o==1 then
fill_M451_ADC(e,t,"B",9,"EADC_CH6",6)
else
fill_invalid_GPIO(e,t,"B",9)
end
a[97]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],3840),8)
e={}
e["pin_no"]="98"
e["texts"]={"EADC_CH7","PB.10"}
if o==0 then
fill_M451_GPIO(e,t,"B",10)
elseif o==1 then
fill_M451_ADC(e,t,"B",10,"EADC_CH7",7)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[98]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],61440),12)
e={}
e["pin_no"]="99"
e["texts"]={"TK0","EADC_CH8","PB.11"}
if o==0 then
fill_M451_GPIO(e,t,"B",11)
elseif o==1 then
fill_M451_ADC(e,t,"B",11,"EADC_CH8",8)
elseif o==4 then
fill_M451_TK(e,t,"B",11,"TK0",0)
else
fill_invalid_GPIO(e,t,"B",11)
end
a[99]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],983040),16)
e={}
e["pin_no"]="100"
e["texts"]={"TK1","EADC_CH9","PB.12"}
if o==0 then
fill_M451_GPIO(e,t,"B",12)
elseif o==1 then
fill_M451_ADC(e,t,"B",12,"EADC_CH9",9)
elseif o==4 then
fill_M451_TK(e,t,"B",12,"TK1",1)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[100]=e
return{name=i,information="",pins=a}
end
