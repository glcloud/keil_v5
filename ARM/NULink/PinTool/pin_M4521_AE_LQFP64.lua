local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M4521.lua")
function get_chip_status_M4521_AE_LQFP64(i,o,t,e)
local a={}
local t=read_M4521_Registers(i,o,t,e)
local e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],4026531840),28)
e={}
e["pin_no"]="1"
e["texts"]={"PB.15","EADC_CH12","EBI_nCS1"}
if o==0 then
fill_M4521_GPIO(e,t,"B",15)
elseif o==1 then
fill_M4521_EADC(e,t,"B",15,"EADC_CH12")
elseif o==7 then
fill_M4521_EBI(e,t,"B",15,"EBI_nCS1")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",15)
end
a[1]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="2"
e["texts"]={"PB.5","EADC_CH13","SPI0_MOSI0","SPI1_MOSI","EBI_AD6","UART2_RXD"}
if o==0 then
fill_M4521_GPIO(e,t,"B",5)
elseif o==1 then
fill_M4521_EADC(e,t,"B",5,"EADC_CH13")
elseif o==2 then
fill_M4521_SPI(e,t,"B",5,"SPI0_MOSI0",0)
fill_M4521_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M4521_SPI(e,t,"B",5,"SPI1_MOSI",1)
fill_M4521_SPI_IO(e,t,1,false)
elseif o==7 then
fill_M4521_EBI(e,t,"B",5,"EBI_AD6")
e["direction"]=kPinDirection_Bi
elseif o==9 then
fill_M4521_UART(e,t,"B",5,"UART2_RXD",2)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",5)
end
a[2]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],251658240),24)
e={}
e["pin_no"]="3"
e["texts"]={"PB.6","EADC_CH14","SPI0_MISO0","SPI1_MISO","EBI_AD5"}
if o==0 then
fill_M4521_GPIO(e,t,"B",6)
elseif o==1 then
fill_M4521_EADC(e,t,"B",6,"EADC_CH14")
elseif o==2 then
fill_M4521_SPI(e,t,"B",6,"SPI0_MISO0",0)
fill_M4521_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M4521_SPI(e,t,"B",6,"SPI1_MISO",1)
fill_M4521_SPI_IO(e,t,1,true)
elseif o==7 then
fill_M4521_EBI(e,t,"B",6,"EBI_AD5")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",6)
end
a[3]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],4026531840),28)
e={}
e["pin_no"]="4"
e["texts"]={"PB.7","EADC_CH15","SPI0_CLK","SPI1_CLK","EBI_AD4","STADC"}
if o==0 then
fill_M4521_GPIO(e,t,"B",7)
elseif o==1 then
fill_M4521_EADC(e,t,"B",7,"EADC_CH15")
elseif o==2 then
fill_M4521_SPI(e,t,"B",7,"SPI0_CLK",0)
elseif o==3 then
fill_M4521_SPI(e,t,"B",7,"SPI1_CLK",1)
elseif o==7 then
fill_M4521_EBI(e,t,"B",7,"EBI_AD4")
e["direction"]=kPinDirection_Bi
elseif o==10 then
fill_M4521_ADC(e,t,"B",7,"STADC")
else
fill_invalid_GPIO(e,t,"B",7)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"nRESET"}
fill_M4521_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[5]=e
local o=ext.band(t["SYS_SYS_GPD_MFPL"],15)
e={}
e["pin_no"]="6"
e["texts"]={"PD.0","EADC_CH6","UART0_RXD","INT3","T3"}
if o==0 then
fill_M4521_GPIO(e,t,"D",0)
elseif o==1 then
fill_M4521_EADC(e,t,"D",0,"EADC_CH6")
elseif o==3 then
fill_M4521_UART(e,t,"D",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==8 then
fill_M4521_Normal(e,t,"D",0,"INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M4521_TM(e,t,"D",0,"T3",3)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"AVSS"}
fill_M4521_Normal(e,t,nil,nil,"AVSS")
a[7]=e
local o=ext.band(t["SYS_SYS_GPD_MFPH"],15)
e={}
e["pin_no"]="8"
e["texts"]={"PD.8","EADC_CH7","EBI_nCS0"}
if o==0 then
fill_M4521_GPIO(e,t,"D",8)
elseif o==1 then
fill_M4521_EADC(e,t,"D",8,"EADC_CH7")
elseif o==7 then
fill_M4521_EBI(e,t,"D",8,"EBI_nCS0")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",8)
end
a[8]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],240),4)
e={}
e["pin_no"]="9"
e["texts"]={"PD.9","EADC_CH10","EBI_ALE"}
if o==0 then
fill_M4521_GPIO(e,t,"D",9)
elseif o==1 then
fill_M4521_EADC(e,t,"D",9,"EADC_CH10")
elseif o==7 then
fill_M4521_EBI(e,t,"D",9,"EBI_ALE")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",9)
end
a[9]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],240),4)
e={}
e["pin_no"]="10"
e["texts"]={"PD.1","EADC_CH11","PWM0_SYNC_IN","UART0_TXD","T0","EBI_nRD"}
if o==0 then
fill_M4521_GPIO(e,t,"D",1)
elseif o==1 then
fill_M4521_EADC(e,t,"D",1,"EADC_CH11")
elseif o==2 then
fill_M4521_PWM(e,t,"D",1,"PWM0_SYNC_IN",0)
elseif o==3 then
fill_M4521_UART(e,t,"D",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M4521_TM(e,t,"D",1,"T0",0)
elseif o==7 then
fill_M4521_EBI(e,t,"D",1,"EBI_nRD")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",1)
end
a[10]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],3840),8)
e={}
e["pin_no"]="11"
e["texts"]={"PD.2","STADC","T0_EXT","PWM0_BRAKE0","EBI_nWR","INT0"}
if o==0 then
fill_M4521_GPIO(e,t,"D",2)
elseif o==1 then
fill_M4521_ADC(e,t,"D",2,"STADC")
elseif o==3 then
fill_M4521_TM(e,t,"D",2,"T0_EXT",0)
elseif o==6 then
fill_M4521_PWM(e,t,"D",2,"PWM0_BRAKE0",0)
elseif o==7 then
fill_M4521_EBI(e,t,"D",2,"EBI_nWR")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M4521_Normal(e,t,"D",2,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",2)
end
a[11]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],61440),12)
e={}
e["pin_no"]="12"
e["texts"]={"PD.3","T2","T1_EXT","PWM0_BRAKE1","EBI_MCLK","INT1"}
if o==0 then
fill_M4521_GPIO(e,t,"D",3)
elseif o==1 then
fill_M4521_TM(e,t,"D",3,"T2",2)
elseif o==3 then
fill_M4521_TM(e,t,"D",3,"T1_EXT",1)
elseif o==6 then
fill_M4521_PWM(e,t,"D",3,"PWM0_BRAKE1",0)
elseif o==7 then
fill_M4521_EBI(e,t,"D",3,"EBI_MCLK")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M4521_Normal(e,t,"D",3,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",3)
end
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"VBAT"}
fill_M4521_Normal(e,t,nil,nil,"VBAT")
a[13]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="14"
e["texts"]={"PF.0","X32_OUT","INT5"}
if o==0 then
fill_M4521_GPIO(e,t,"F",0)
elseif o==1 then
fill_M4521_Normal(e,t,"F",0,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M4521_Normal(e,t,"F",0,"INT5")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",0)
end
a[14]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="15"
e["texts"]={"PF.1","X32_IN"}
if o==0 then
fill_M4521_GPIO(e,t,"F",1)
elseif o==1 then
fill_M4521_Normal(e,t,"F",1,"X32_IN")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
a[15]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="16"
e["texts"]={"PF.2","TAMPER"}
if o==0 then
fill_M4521_GPIO(e,t,"F",2)
elseif o==1 then
fill_M4521_Normal(e,t,"F",2,"TAMPER")
else
fill_invalid_GPIO(e,t,"F",2)
end
a[16]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],983040),16)
e={}
e["pin_no"]="17"
e["texts"]={"PD.12","UART3_TXD","PWM1_CH0","EBI_ADR16"}
if o==0 then
fill_M4521_GPIO(e,t,"D",12)
elseif o==3 then
fill_M4521_UART(e,t,"D",12,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M4521_PWM(e,t,"D",12,"PWM1_CH0",1,0)
elseif o==7 then
fill_M4521_EBI(e,t,"D",12,"EBI_ADR16")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",12)
end
a[17]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],15728640),20)
e={}
e["pin_no"]="18"
e["texts"]={"PD.13","UART3_RXD","PWM1_CH1","EBI_ADR17"}
if o==0 then
fill_M4521_GPIO(e,t,"D",13)
elseif o==3 then
fill_M4521_UART(e,t,"D",13,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M4521_PWM(e,t,"D",13,"PWM1_CH1",1,1)
elseif o==7 then
fill_M4521_EBI(e,t,"D",13,"EBI_ADR17")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",13)
end
a[18]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],251658240),24)
e={}
e["pin_no"]="19"
e["texts"]={"PD.14","UART3_nCTS","PWM1_CH2","EBI_ADR18"}
if o==0 then
fill_M4521_GPIO(e,t,"D",14)
elseif o==3 then
fill_M4521_UART(e,t,"D",14,"UART3_nCTS",3)
elseif o==6 then
fill_M4521_PWM(e,t,"D",14,"PWM1_CH2",1,2)
elseif o==7 then
fill_M4521_EBI(e,t,"D",14,"EBI_ADR18")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",14)
end
a[19]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPH"],4026531840),28)
e={}
e["pin_no"]="20"
e["texts"]={"PD.15","UART3_nRTS","PWM1_CH3","EBI_ADR19"}
if o==0 then
fill_M4521_GPIO(e,t,"D",15)
elseif o==3 then
fill_M4521_UART(e,t,"D",15,"UART3_nRTS",3)
elseif o==6 then
fill_M4521_PWM(e,t,"D",15,"PWM1_CH3",1,3)
elseif o==7 then
fill_M4521_EBI(e,t,"D",15,"EBI_ADR19")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",15)
end
a[20]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFPL"],4026531840),28)
e={}
e["pin_no"]="21"
e["texts"]={"PD.7","PWM0_SYNC_IN","T1","PWM0_CH5","EBI_nRD"}
if o==0 then
fill_M4521_GPIO(e,t,"D",7)
elseif o==3 then
fill_M4521_PWM(e,t,"D",7,"PWM0_SYNC_IN",0)
elseif o==4 then
fill_M4521_TM(e,t,"D",7,"T1",1)
elseif o==6 then
fill_M4521_PWM(e,t,"D",7,"PWM0_CH5",0,5)
elseif o==7 then
fill_M4521_EBI(e,t,"D",7,"EBI_nRD")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"D",7)
end
a[21]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="22"
e["texts"]={"PF.3","XT1_OUT","I2C1_SCL"}
if o==0 then
fill_M4521_GPIO(e,t,"F",3)
elseif o==1 then
fill_M4521_Normal(e,t,"F",3,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M4521_I2C(e,t,"F",3,"I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[22]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],983040),16)
e={}
e["pin_no"]="23"
e["texts"]={"PF.4","XT1_IN","I2C1_SDA"}
if o==0 then
fill_M4521_GPIO(e,t,"F",4)
elseif o==1 then
fill_M4521_Normal(e,t,"F",4,"XT1_IN")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M4521_I2C(e,t,"F",4,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"F",4)
end
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"VSS"}
fill_M4521_Normal(e,t,nil,nil,"VSS")
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"VDD"}
fill_M4521_Normal(e,t,nil,nil,"VDD")
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"LDO_CAP"}
fill_M4521_Normal(e,t,nil,nil,"LDO_CAP")
a[26]=e
local o=ext.band(t["SYS_SYS_GPC_MFPL"],15)
e={}
e["pin_no"]="27"
e["texts"]={"PC.0","SPI1_CLK","UART2_nCTS","PWM0_CH0","EBI_AD8","INT2","UART3_TXD","T3_EXT"}
if o==0 then
fill_M4521_GPIO(e,t,"C",0)
elseif o==2 then
fill_M4521_SPI(e,t,"C",0,"SPI1_CLK",1)
elseif o==3 then
fill_M4521_UART(e,t,"C",0,"UART2_nCTS",2)
elseif o==6 then
fill_M4521_PWM(e,t,"C",0,"PWM0_CH0",0,0)
elseif o==7 then
fill_M4521_EBI(e,t,"C",0,"EBI_AD8")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M4521_Normal(e,t,"C",0,"INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M4521_UART(e,t,"C",0,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M4521_TM(e,t,"C",0,"T3_EXT",3)
else
fill_invalid_GPIO(e,t,"C",0)
end
a[27]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],240),4)
e={}
e["pin_no"]="28"
e["texts"]={"PC.1","CLKO","UART2_nRTS","PWM0_CH1","EBI_AD9","UART3_RXD"}
if o==0 then
fill_M4521_GPIO(e,t,"C",1)
elseif o==1 then
fill_M4521_CLKO(e,t,"C",1,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M4521_UART(e,t,"C",1,"UART2_nRTS",2)
elseif o==6 then
fill_M4521_PWM(e,t,"C",1,"PWM0_CH1",0,1)
elseif o==7 then
fill_M4521_EBI(e,t,"C",1,"EBI_AD9")
e["direction"]=kPinDirection_Bi
elseif o==9 then
fill_M4521_UART(e,t,"C",1,"UART3_RXD",3)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",1)
end
a[28]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="29"
e["texts"]={"PC.2","SPI1_SS","UART2_TXD","PWM0_CH2","EBI_AD10"}
if o==0 then
fill_M4521_GPIO(e,t,"C",2)
elseif o==2 then
fill_M4521_SPI(e,t,"C",2,"SPI1_SS",1)
elseif o==3 then
fill_M4521_UART(e,t,"C",2,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_M4521_PWM(e,t,"C",2,"PWM0_CH2",0,2)
elseif o==7 then
fill_M4521_EBI(e,t,"C",2,"EBI_AD10")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",2)
end
a[29]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="30"
e["texts"]={"PC.3","SPI1_MOSI","UART2_RXD","PWM0_CH3","EBI_AD11"}
if o==0 then
fill_M4521_GPIO(e,t,"C",3)
elseif o==2 then
fill_M4521_SPI(e,t,"C",3,"SPI1_MOSI",1)
fill_M4521_SPI_IO(e,t,1,false)
elseif o==3 then
fill_M4521_UART(e,t,"C",3,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_M4521_PWM(e,t,"C",3,"PWM0_CH3",0,3)
elseif o==7 then
fill_M4521_EBI(e,t,"C",3,"EBI_AD11")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",3)
end
a[30]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],983040),16)
e={}
e["pin_no"]="31"
e["texts"]={"PC.4","SPI1_MISO","I2C1_SCL","PWM0_CH4","EBI_AD12"}
if o==0 then
fill_M4521_GPIO(e,t,"C",4)
elseif o==2 then
fill_M4521_SPI(e,t,"C",4,"SPI1_MISO",1)
fill_M4521_SPI_IO(e,t,1,true)
elseif o==3 then
fill_M4521_I2C(e,t,"C",4,"I2C1_SCL",1)
elseif o==6 then
fill_M4521_PWM(e,t,"C",4,"PWM0_CH4",0,4)
elseif o==7 then
fill_M4521_EBI(e,t,"C",4,"EBI_AD12")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",4)
end
a[31]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],15728640),20)
e={}
e["pin_no"]="32"
e["texts"]={"PC.5","PWM0_CH5","EBI_AD13"}
if o==0 then
fill_M4521_GPIO(e,t,"C",5)
elseif o==6 then
fill_M4521_PWM(e,t,"C",5,"PWM0_CH5",0,5)
elseif o==7 then
fill_M4521_EBI(e,t,"C",5,"EBI_AD13")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",5)
end
a[32]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],251658240),24)
e={}
e["pin_no"]="33"
e["texts"]={"UART0_TXD","EBI_AD14","PWM1_CH0","I2C1_SMBAL","PC.6"}
if o==0 then
fill_M4521_GPIO(e,t,"C",6)
elseif o==3 then
fill_M4521_I2C(e,t,"C",6,"I2C1_SMBAL",1)
elseif o==6 then
fill_M4521_PWM(e,t,"C",6,"PWM1_CH0",1,0)
elseif o==7 then
fill_M4521_EBI(e,t,"C",6,"EBI_AD14")
e["direction"]=kPinDirection_Bi
elseif o==9 then
fill_M4521_UART(e,t,"C",6,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",6)
end
a[33]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFPL"],4026531840),28)
e={}
e["pin_no"]="34"
e["texts"]={"UART0_RXD","EBI_AD15","PWM1_CH1","I2C1_SMBSUS","PC.7"}
if o==0 then
fill_M4521_GPIO(e,t,"C",7)
elseif o==3 then
fill_M4521_I2C(e,t,"C",7,"I2C1_SMBSUS",1)
elseif o==6 then
fill_M4521_PWM(e,t,"C",7,"PWM1_CH1",1,1)
elseif o==7 then
fill_M4521_EBI(e,t,"C",7,"EBI_AD15")
e["direction"]=kPinDirection_Bi
elseif o==9 then
fill_M4521_UART(e,t,"C",7,"UART0_RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",7)
end
a[34]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],15728640),20)
e={}
e["pin_no"]="35"
e["texts"]={"ICE_CLK","PF.5"}
if o==0 then
fill_M4521_GPIO(e,t,"F",5)
elseif o==1 then
fill_M4521_Normal(e,t,"F",5,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",5)
end
a[35]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],251658240),24)
e={}
e["pin_no"]="36"
e["texts"]={"ICE_DAT","PF.6"}
if o==0 then
fill_M4521_GPIO(e,t,"F",6)
elseif o==1 then
fill_M4521_Normal(e,t,"F",6,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"F",6)
end
a[36]=e
local o=ext.band(t["SYS_SYS_GPE_MFPH"],15)
e={}
e["pin_no"]="37"
e["texts"]={"T1","PWM0_BRAKE0","CLKO","SC0_PWR","I2C1_SCL","SPI0_MISO1","UART1_TXD","PE.8"}
if o==0 then
fill_M4521_GPIO(e,t,"E",8)
elseif o==1 then
fill_M4521_UART(e,t,"E",8,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_M4521_SPI(e,t,"E",8,"SPI0_MISO1",0)
fill_M4521_SPI_IO(e,t,0,true)
elseif o==4 then
fill_M4521_I2C(e,t,"E",8,"I2C1_SCL",1)
elseif o==5 then
fill_M4521_SC(e,t,"E",8,"SC0_PWR",0)
elseif o==9 then
fill_M4521_CLKO(e,t,"E",8,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==10 then
fill_M4521_PWM(e,t,"E",8,"PWM0_BRAKE0",0)
elseif o==11 then
fill_M4521_TM(e,t,"E",8,"T1",1)
else
fill_invalid_GPIO(e,t,"E",8)
end
a[37]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],240),4)
e={}
e["pin_no"]="38"
e["texts"]={"T2","PWM1_BRAKE1","SC0_RST","I2C1_SDA","SPI0_MOSI1","UART1_RXD","PE.9"}
if o==0 then
fill_M4521_GPIO(e,t,"E",9)
elseif o==1 then
fill_M4521_UART(e,t,"E",9,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_M4521_SPI(e,t,"E",9,"SPI0_MOSI1",0)
fill_M4521_SPI_IO(e,t,0,false)
elseif o==4 then
fill_M4521_I2C(e,t,"E",9,"I2C1_SDA",1)
elseif o==5 then
fill_M4521_SC(e,t,"E",9,"SC0_RST",0)
elseif o==10 then
fill_M4521_PWM(e,t,"E",9,"PWM1_BRAKE1",1)
elseif o==11 then
fill_M4521_TM(e,t,"E",9,"T2",2)
else
fill_invalid_GPIO(e,t,"E",9)
end
a[38]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],3840),8)
e={}
e["pin_no"]="39"
e["texts"]={"I2C1_SCL","UART3_TXD","SC0_DAT","I2C0_SMBAL","UART1_nCTS","SPI0_MISO0","SPI1_MISO","PE.10"}
if o==0 then
fill_M4521_GPIO(e,t,"E",10)
elseif o==1 then
fill_M4521_SPI(e,t,"E",10,"SPI1_MISO",1)
fill_M4521_SPI_IO(e,t,1,true)
elseif o==2 then
fill_M4521_SPI(e,t,"E",10,"SPI0_MISO0",0)
fill_M4521_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M4521_UART(e,t,"E",10,"UART1_nCTS",1)
elseif o==4 then
fill_M4521_I2C(e,t,"E",10,"I2C0_SMBAL",0)
elseif o==5 then
fill_M4521_SC(e,t,"E",10,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==9 then
fill_M4521_UART(e,t,"E",10,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M4521_I2C(e,t,"E",10,"I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,"E",10)
end
a[39]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],61440),12)
e={}
e["pin_no"]="40"
e["texts"]={"I2C1_SDA","UART3_RXD","SC0_CLK","I2C0_SMBSUS","UART1_nRTS","SPI0_MOSI0","SPI1_MOSI","PE.11"}
if o==0 then
fill_M4521_GPIO(e,t,"E",11)
elseif o==1 then
fill_M4521_SPI(e,t,"E",11,"SPI1_MOSI",1)
fill_M4521_SPI_IO(e,t,1,false)
elseif o==2 then
fill_M4521_SPI(e,t,"E",11,"SPI0_MOSI0",0)
fill_M4521_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M4521_UART(e,t,"E",11,"UART1_nRTS",1)
elseif o==4 then
fill_M4521_I2C(e,t,"E",11,"I2C0_SMBSUS",0)
elseif o==5 then
fill_M4521_SC(e,t,"E",11,"SC0_CLK",0)
local t=ext.band(t["SC_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_PushPullOut
end
elseif o==9 then
fill_M4521_UART(e,t,"E",11,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M4521_I2C(e,t,"E",11,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"E",11)
end
a[40]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],983040),16)
e={}
e["pin_no"]="41"
e["texts"]={"I2C0_SCL","UART1_TXD","SPI0_SS","SPI1_SS","PE.12"}
if o==0 then
fill_M4521_GPIO(e,t,"E",12)
elseif o==1 then
fill_M4521_SPI(e,t,"E",12,"SPI1_SS",1)
elseif o==2 then
fill_M4521_SPI(e,t,"E",12,"SPI0_SS",0)
elseif o==3 then
fill_M4521_UART(e,t,"E",12,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M4521_I2C(e,t,"E",12,"I2C0_SCL",0)
else
fill_invalid_GPIO(e,t,"E",12)
end
a[41]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPE_MFPH"],15728640),20)
e={}
e["pin_no"]="42"
e["texts"]={"I2C0_SDA","UART1_RXD","SPI0_CLK","SPI1_CLK","PE.13"}
if o==0 then
fill_M4521_GPIO(e,t,"E",13)
elseif o==1 then
fill_M4521_SPI(e,t,"E",13,"SPI1_CLK",1)
elseif o==2 then
fill_M4521_SPI(e,t,"E",13,"SPI0_CLK",0)
elseif o==3 then
fill_M4521_UART(e,t,"E",13,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M4521_I2C(e,t,"E",13,"I2C0_SDA",0)
else
fill_invalid_GPIO(e,t,"E",13)
end
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"VDDIO"}
fill_M4521_Normal(e,t,nil,nil,"VDDIO")
a[43]=e
e={}
e["pin_no"]="44"
e["texts"]={"USB_VBUS"}
fill_M4521_Normal(e,t,nil,nil,"USB_VBUS")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"USB_D-"}
fill_M4521_USB(e,t,nil,nil,"USB_D-")
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"USB_D+"}
fill_M4521_USB(e,t,nil,nil,"USB_D+")
a[46]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],4026531840),28)
e={}
e["pin_no"]="47"
e["texts"]={"PF.7"}
if o==0 then
fill_M4521_GPIO(e,t,"F",7)
else
fill_invalid_GPIO(e,t,"F",7)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"USB_VDD33_CAP"}
fill_M4521_Normal(e,t,nil,nil,"USB_VDD33_CAP")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[48]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="49"
e["texts"]={"EBI_AD3","PWM1_CH2","SC0_PWR","I2C0_SCL","UART0_nRTS","UART0_RXD","PA.3"}
if o==0 then
fill_M4521_GPIO(e,t,"A",3)
elseif o==2 then
fill_M4521_UART(e,t,"A",3,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_M4521_UART(e,t,"A",3,"UART0_nRTS",0)
elseif o==4 then
fill_M4521_I2C(e,t,"A",3,"I2C0_SCL",0)
elseif o==5 then
fill_M4521_SC(e,t,"A",3,"SC0_PWR",0)
elseif o==6 then
fill_M4521_PWM(e,t,"A",3,"PWM1_CH2",1,2)
elseif o==7 then
fill_M4521_EBI(e,t,"A",3,"EBI_AD3")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",3)
end
a[49]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="50"
e["texts"]={"EBI_AD2","PWM1_CH3","SC0_RST","I2C0_SDA","UART0_nCTS","UART0_TXD","PA.2"}
if o==0 then
fill_M4521_GPIO(e,t,"A",2)
elseif o==2 then
fill_M4521_UART(e,t,"A",2,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_M4521_UART(e,t,"A",2,"UART0_nCTS",0)
elseif o==4 then
fill_M4521_I2C(e,t,"A",2,"I2C0_SDA",0)
elseif o==5 then
fill_M4521_SC(e,t,"A",2,"SC0_RST",0)
elseif o==6 then
fill_M4521_PWM(e,t,"A",2,"PWM1_CH3",1,3)
elseif o==7 then
fill_M4521_EBI(e,t,"A",2,"EBI_AD2")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",2)
end
a[50]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],240),4)
e={}
e["pin_no"]="51"
e["texts"]={"STADC","EBI_AD1","PWM1_CH4","SC0_DAT","UART1_RXD","UART1_nRTS","PA.1"}
if o==0 then
fill_M4521_GPIO(e,t,"A",1)
elseif o==1 then
fill_M4521_UART(e,t,"A",1,"UART1_nRTS",1)
elseif o==3 then
fill_M4521_UART(e,t,"A",1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_M4521_SC(e,t,"A",1,"SC0_DAT",0)
e["direction"]=kPinDirection_Bi
local t=ext.band(t["SC_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_In
end
elseif o==6 then
fill_M4521_PWM(e,t,"A",1,"PWM1_CH4",1,4)
elseif o==7 then
fill_M4521_EBI(e,t,"A",1,"EBI_AD1")
e["direction"]=kPinDirection_Bi
elseif o==10 then
fill_M4521_ADC(e,t,"A",1,"STADC")
else
fill_invalid_GPIO(e,t,"A",1)
end
a[51]=e
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
e={}
e["pin_no"]="52"
e["texts"]={"INT0","EBI_AD0","PWM1_CH5","SC0_CLK","UART1_TXD","UART1_nCTS","PA.0"}
if o==0 then
fill_M4521_GPIO(e,t,"A",0)
elseif o==1 then
fill_M4521_UART(e,t,"A",0,"UART1_nCTS",1)
elseif o==3 then
fill_M4521_UART(e,t,"A",0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_M4521_SC(e,t,"A",0,"SC0_CLK",0)
local t=ext.band(t["SC_SC_UARTCTL"],1)
if t~=0 then
e["direction"]=kPinDirection_PushPullOut
end
elseif o==6 then
fill_M4521_PWM(e,t,"A",0,"PWM1_CH5",1,5)
elseif o==7 then
fill_M4521_EBI(e,t,"A",0,"EBI_AD0")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_M4521_Normal(e,t,"A",0,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",0)
end
a[52]=e
e={}
e["pin_no"]="53"
e["texts"]={"VSS"}
fill_M4521_Normal(e,t,nil,nil,"VSS")
a[53]=e
e={}
e["pin_no"]="54"
e["texts"]={"VDD"}
fill_M4521_Normal(e,t,nil,nil,"VDD")
a[54]=e
e={}
e["pin_no"]="55"
e["texts"]={"AVDD"}
fill_M4521_Normal(e,t,nil,nil,"AVDD")
a[55]=e
e={}
e["pin_no"]="56"
e["texts"]={"VREF"}
fill_M4521_Normal(e,t,nil,nil,"VREF")
a[56]=e
local o=ext.band(t["SYS_SYS_GPB_MFPL"],15)
e={}
e["pin_no"]="57"
e["texts"]={"INT1","EBI_nWRL","T2","UART2_RXD","SPI0_MOSI1","EADC_CH0","PB.0"}
if o==0 then
fill_M4521_GPIO(e,t,"B",0)
elseif o==1 then
fill_M4521_EADC(e,t,"B",0,"EADC_CH0")
elseif o==2 then
fill_M4521_SPI(e,t,"B",0,"SPI0_MOSI1",0)
fill_M4521_SPI_IO(e,t,0,false)
elseif o==3 then
fill_M4521_UART(e,t,"B",0,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_M4521_TM(e,t,"B",0,"T2",2)
elseif o==7 then
fill_M4521_EBI(e,t,"B",0,"EBI_nWRL")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_M4521_Normal(e,t,"B",0,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",0)
end
a[57]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],240),4)
e={}
e["pin_no"]="58"
e["texts"]={"EBI_nWRH","PWM0_SYNC_OUT","SC0_RST","T3","UART2_TXD","SPI0_MISO1","EADC_CH1","PB.1"}
if o==0 then
fill_M4521_GPIO(e,t,"B",1)
elseif o==1 then
fill_M4521_EADC(e,t,"B",1,"EADC_CH1")
elseif o==2 then
fill_M4521_SPI(e,t,"B",1,"SPI0_MISO1",0)
fill_M4521_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M4521_UART(e,t,"B",1,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_M4521_TM(e,t,"B",1,"T3",3)
elseif o==5 then
fill_M4521_SC(e,t,"B",1,"SC0_RST",0)
elseif o==6 then
fill_M4521_PWM(e,t,"B",1,"PWM0_SYNC_OUT",0)
elseif o==7 then
fill_M4521_EBI(e,t,"B",1,"EBI_nWRH")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",1)
end
a[58]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="59"
e["texts"]={"T2_EXT","UART3_RXD","SC0_CD","UART1_RXD","SPI1_CLK","SPI0_CLK","EADC_CH2","PB.2"}
if o==0 then
fill_M4521_GPIO(e,t,"B",2)
elseif o==1 then
fill_M4521_EADC(e,t,"B",2,"EADC_CH2")
elseif o==2 then
fill_M4521_SPI(e,t,"B",2,"SPI0_CLK",0)
elseif o==3 then
fill_M4521_SPI(e,t,"B",2,"SPI1_CLK",1)
elseif o==4 then
fill_M4521_UART(e,t,"B",2,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_M4521_SC(e,t,"B",2,"SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==9 then
fill_M4521_UART(e,t,"B",2,"UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==11 then
fill_M4521_TM(e,t,"B",2,"T2_EXT",2)
else
fill_invalid_GPIO(e,t,"B",2)
end
a[59]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="60"
e["texts"]={"T0_EXT","UART3_TXD","EBI_ALE","UART1_TXD","SPI1_MISO","SPI0_MISO0","EADC_CH3","PB.3"}
if o==0 then
fill_M4521_GPIO(e,t,"B",3)
elseif o==1 then
fill_M4521_EADC(e,t,"B",3,"EADC_CH3")
elseif o==2 then
fill_M4521_SPI(e,t,"B",3,"SPI0_MISO0",0)
fill_M4521_SPI_IO(e,t,0,true)
elseif o==3 then
fill_M4521_SPI(e,t,"B",3,"SPI1_MISO",1)
fill_M4521_SPI_IO(e,t,1,true)
elseif o==4 then
fill_M4521_UART(e,t,"B",3,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_M4521_EBI(e,t,"B",3,"EBI_ALE")
e["direction"]=kPinDirection_PushPullOut
elseif o==9 then
fill_M4521_UART(e,t,"B",3,"UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M4521_TM(e,t,"B",3,"T0_EXT",0)
else
fill_invalid_GPIO(e,t,"B",3)
end
a[60]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="61"
e["texts"]={"T1_EXT","UART2_TXD","EBI_AD7","UART1_nCTS","SPI1_SS","SPI0_SS","EADC_CH4","PB.4"}
if o==0 then
fill_M4521_GPIO(e,t,"B",4)
elseif o==1 then
fill_M4521_EADC(e,t,"B",4,"EADC_CH4")
elseif o==2 then
fill_M4521_SPI(e,t,"B",4,"SPI0_SS",0)
elseif o==3 then
fill_M4521_SPI(e,t,"B",4,"SPI1_SS",1)
elseif o==4 then
fill_M4521_UART(e,t,"B",4,"UART1_nCTS",1)
elseif o==7 then
fill_M4521_EBI(e,t,"B",4,"EBI_AD7")
e["direction"]=kPinDirection_Bi
elseif o==9 then
fill_M4521_UART(e,t,"B",4,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==11 then
fill_M4521_TM(e,t,"B",4,"T1_EXT",1)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[61]=e
local o=ext.band(t["SYS_SYS_GPB_MFPH"],15)
e={}
e["pin_no"]="62"
e["texts"]={"PWM0_CH2","UART1_nRTS","EADC_CH5","PB.8"}
if o==0 then
fill_M4521_GPIO(e,t,"B",8)
elseif o==1 then
fill_M4521_EADC(e,t,"B",8,"EADC_CH5")
elseif o==4 then
fill_M4521_UART(e,t,"B",8,"UART1_nRTS",1)
elseif o==6 then
fill_M4521_PWM(e,t,"B",8,"PWM0_CH2",0,2)
else
fill_invalid_GPIO(e,t,"B",8)
end
a[62]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],61440),12)
e={}
e["pin_no"]="63"
e["texts"]={"EADC_CH8","PB.11"}
if o==0 then
fill_M4521_GPIO(e,t,"B",11)
elseif o==1 then
fill_M4521_EADC(e,t,"B",11,"EADC_CH8")
else
fill_invalid_GPIO(e,t,"B",11)
end
a[63]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],983040),16)
e={}
e["pin_no"]="64"
e["texts"]={"EADC_CH9","PB.12"}
if o==0 then
fill_M4521_GPIO(e,t,"B",12)
elseif o==1 then
fill_M4521_EADC(e,t,"B",12,"EADC_CH9")
else
fill_invalid_GPIO(e,t,"B",12)
end
a[64]=e
return{name=i,information="",pins=a}
end