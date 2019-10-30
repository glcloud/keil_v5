local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M031.lua")
function get_chip_status_M031_32K_AE_TSSOP20(i,e,t,o)
local a={}
local t=read_M031_Registers(i,e,t,o)
local e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="8"
e["texts"]={"PB.5","EADC0_CH5","I2C0_SCL","PWM0_CH0","UART2_TXD","TM0","INT0"}
if o==0 then
fill_M031_GPIO(e,t,"B",5)
elseif o==1 then
fill_M031_EADC(e,t,"B",5,"EADC0_CH5")
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
a[8]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="9"
e["texts"]={"PB.4","EADC0_CH4","I2C0_SDA","PWM0_CH1","UART2_RXD","TM1","INT1"}
if o==0 then
fill_M031_GPIO(e,t,"B",4)
elseif o==1 then
fill_M031_EADC(e,t,"B",4,"EADC0_CH4")
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
a[9]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="10"
e["texts"]={"PB.3","EADC0_CH3","I2C1_SCL","UART1_TXD","PWM0_CH2","PWM0_BRAKE0","TM2","INT2"}
if o==0 then
fill_M031_GPIO(e,t,"B",3)
elseif o==1 then
fill_M031_EADC(e,t,"B",3,"EADC0_CH3")
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
a[10]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="11"
e["texts"]={"INT3","TM3","PWM0_CH3","UART1_RXD","I2C1_SDA","EADC0_CH2","PB.2"}
if o==0 then
fill_M031_GPIO(e,t,"B",2)
elseif o==1 then
fill_M031_EADC(e,t,"B",2,"EADC0_CH2")
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
a[11]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="12"
e["texts"]={"XT1_IN","I2C0_SCL","UART0_TXD","PF.3"}
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
a[12]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="13"
e["texts"]={"XT1_OUT","I2C0_SDA","UART0_RXD","PF.2"}
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
a[13]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="14"
e["texts"]={"CLKO","PWM0_CH2","I2C1_SCL","UART1_TXD","SPI0_SS","PA.3"}
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
else
fill_invalid_GPIO(e,t,"A",3)
end
a[14]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="15"
e["texts"]={"PWM0_CH3","I2C1_SDA","UART1_RXD","SPI0_CLK","PA.2"}
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
a[15]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFPL"],240),4)
e={}
e["pin_no"]="16"
e["texts"]={"PWM0_CH4","UART1_nCTS","UART0_TXD","SPI0_MISO","PA.1"}
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
a[16]=e
local o=ext.band(t["SYS_SYS_GPA_MFPL"],15)
e={}
e["pin_no"]="17"
e["texts"]={"PWM0_CH5","UART1_nRTS","UART0_RXD","SPI0_MOSI","PA.0"}
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
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"nRESET"}
fill_M031_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[18]=e
local o=ext.band(t["SYS_SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="19"
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
a[19]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="20"
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
a[20]=e
e={}
e["pin_no"]="1"
e["texts"]={"VSS"}
fill_M031_Normal(e,t,nil,nil,"VSS")
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"LDO_CAP"}
fill_M031_Normal(e,t,nil,nil,"LDO_CAP")
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"VDD"}
fill_M031_Normal(e,t,nil,nil,"VDD")
a[3]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],251658240),24)
e={}
e["pin_no"]="4"
e["texts"]={"PB.14","EADC0_CH14","SPI0_CLK","UART0_nRTS","TM1_EXT","CLKO"}
if o==0 then
fill_M031_GPIO(e,t,"B",14)
elseif o==1 then
fill_M031_EADC(e,t,"B",14,"EADC0_CH14")
elseif o==4 then
fill_M031_SPI(e,t,"B",14,"SPI0_CLK",0)
elseif o==6 then
fill_M031_UART(e,t,"B",14,"UART0_nRTS",0)
elseif o==13 then
fill_M031_TM(e,t,"B",14,"TM1_EXT",1)
elseif o==14 then
fill_M031_CLKO(e,t,"B",14,"CLKO")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"B",14)
end
a[4]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],15728640),20)
e={}
e["pin_no"]="5"
e["texts"]={"PB.13","EADC0_CH13","SPI0_MISO","UART0_TXD","TM2_EXT"}
if o==0 then
fill_M031_GPIO(e,t,"B",13)
elseif o==1 then
fill_M031_EADC(e,t,"B",13,"EADC0_CH13")
elseif o==4 then
fill_M031_SPI(e,t,"B",13,"SPI0_MISO",0)
fill_M031_SPI_IO(e,t,0,true)
elseif o==6 then
fill_M031_UART(e,t,"B",13,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==13 then
fill_M031_TM(e,t,"B",13,"TM2_EXT",2)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[5]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFPH"],983040),16)
e={}
e["pin_no"]="6"
e["texts"]={"PB.12","EADC0_CH12","SPI0_MOSI","UART0_RXD","TM3_EXT"}
if o==0 then
fill_M031_GPIO(e,t,"B",12)
elseif o==1 then
fill_M031_EADC(e,t,"B",12,"EADC0_CH12")
elseif o==4 then
fill_M031_SPI(e,t,"B",12,"SPI0_MOSI",0)
fill_M031_SPI_IO(e,t,0,false)
elseif o==6 then
fill_M031_UART(e,t,"B",12,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==13 then
fill_M031_TM(e,t,"B",12,"TM3_EXT",3)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"AVDD"}
fill_M031_Normal(e,t,nil,nil,"AVDD")
a[7]=e
return{name=i,information="",pins=a}
end