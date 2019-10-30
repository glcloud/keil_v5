local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Mini51.lua")
function get_chip_status_Mini58_DE_LQFP48(s,e,e)
local a={}
local t=read_Mini51_Registers()
local e
e={}
e["pin_no"]="1"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[1]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],32),5)
e={}
e["pin_no"]="2"
e["texts"]={"P1.5","ADC_CH5","UART1_TXD","ACMP0_P0"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,5)
elseif i==0 and o==1 then
fill_Mini51_ADC(e,t,1,5,"ADC_CH5")
elseif i==1 and o==0 then
fill_Mini51_UART(e,t,1,5,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,1,5,"ACMP0_P0")
end
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"nRESET"}
fill_Mini51_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[3]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],256),8)
local i=ext.band(t["GCR_P3_MFP"],1)
e={}
e["pin_no"]="4"
e["texts"]={"P3.0","ADC_CH6","ACMP1_N"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,3,0)
elseif o==1 and i==1 then
fill_Mini51_ADC(e,t,3,0,"ADC_CH6")
elseif o==1 and i==0 then
fill_Mini51_ACMP(e,t,3,0,"ACMP1_N")
else
fill_invalid_GPIO(e,t,3,0)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"AVSS"}
fill_Mini51_Normal(e,t,nil,nil,"AVSS")
a[5]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],16),4)
e={}
e["pin_no"]="6"
e["texts"]={"P5.4"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,5,4)
else
fill_invalid_GPIO(e,t,5,4)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],512),9)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],2),1)
e={}
e["pin_no"]="7"
e["texts"]={"P3.1","ADC_CH7","ACMP1_P0"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,3,1)
elseif o==1 and i==1 then
fill_Mini51_ADC(e,t,3,1,"ADC_CH7")
elseif o==1 and i==0 then
fill_Mini51_ACMP(e,t,3,1,"ACMP1_P0")
else
fill_invalid_GPIO(e,t,3,1)
end
a[7]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],67108864),26)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],1024),10)
local n=ext.rshift(ext.band(t["GCR_P3_MFP"],4),2)
e={}
e["pin_no"]="8"
e["texts"]={"P3.2","INT0","STADC","TM0_EXT","ACMP1_P1"}
if i==0 and o==0 and n==0 then
fill_Mini51_GPIO(e,t,3,2)
elseif i==0 and o==0 and n==1 then
fill_Mini51_Normal(e,t,3,2,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif i==0 and o==1 and n==1 then
fill_Mini51_ADC(e,t,3,2,"STADC")
elseif i==0 and o==1 and n==0 then
fill_Mini51_TM(e,t,3,2,"TM0_EXT",0)
elseif i==1 and o==0 and n==0 then
fill_Mini51_ACMP(e,t,3,2,"ACMP1_P1")
else
fill_invalid_GPIO(e,t,3,2)
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],16),4)
e={}
e["pin_no"]="9"
e["texts"]={"P3.4","TM0_CNT_OUT","I2C0_SDA","ACMP1_P2"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,3,4)
elseif o==0 and i==1 then
fill_Mini51_TM(e,t,3,4,"TM0_CNT_OUT",0)
elseif o==1 and i==0 then
fill_Mini51_I2C(e,t,3,4,"I2C0_SDA",0)
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,3,4,"ACMP1_P2")
end
a[9]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],32),5)
e={}
e["pin_no"]="10"
e["texts"]={"P3.5","TM1_CNT_OUT","I2C0_SCL","ACMP1_P3"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,5)
elseif i==0 and o==1 then
fill_Mini51_TM(e,t,3,5,"TM1_CNT_OUT",1)
elseif i==1 and o==0 then
fill_Mini51_I2C(e,t,3,5,"I2C0_SCL",0)
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,3,5,"ACMP1_P3")
end
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[13]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],64),6)
e={}
e["pin_no"]="14"
e["texts"]={"P3.6","ACMP0_O","CLKO","TM1_EXT"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,6)
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,3,6,"ACMP0_O")
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==0 then
fill_Mini51_CKO(e,t,3,6,"CLKO")
elseif i==0 and o==1 then
fill_Mini51_TM(e,t,3,6,"TM1_EXT",1)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],512),9)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],2),1)
e={}
e["pin_no"]="15"
e["texts"]={"P5.1","XT1_OUT","I2C1_SCL","UART0_RXD"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,1)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,5,1,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==1 and i==0 then
fill_Mini51_I2C(e,t,5,1,"I2C1_SCL",1)
elseif o==1 and i==1 then
fill_Mini51_UART(e,t,5,1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],256),8)
local i=ext.band(t["GCR_P5_MFP"],1)
e={}
e["pin_no"]="16"
e["texts"]={"P5.0","XT1_IN","I2C1_SDA","UART0_TXD"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,0)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,5,0,"XT1_IN")
e["direction"]=kPinDirection_In
elseif o==1 and i==0 then
fill_Mini51_I2C(e,t,5,0,"I2C1_SDA",1)
elseif o==1 and i==1 then
fill_Mini51_UART(e,t,5,0,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VSS"}
fill_Mini51_Normal(e,t,nil,nil,"VSS")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"LDO_CAP"}
fill_Mini51_Normal(e,t,nil,nil,"LDO_CAP")
a[18]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],32),5)
e={}
e["pin_no"]="19"
e["texts"]={"P5.5"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,5)
else
fill_invalid_GPIO(e,t,5,5)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],1024),10)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],4),2)
e={}
e["pin_no"]="20"
e["texts"]={"P5.2","INT1"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,2)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,5,2,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,5,2)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[21]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],1024),10)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],4),2)
e={}
e["pin_no"]="22"
e["texts"]={"P2.2","PWM0_CH0","I2C1_SCL"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,2)
elseif o==1 and i==0 then
fill_Mini51_PWM(e,t,2,2,"PWM0_CH0",0)
elseif o==1 and i==1 then
fill_Mini51_I2C(e,t,2,2,"I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,2,2)
end
a[22]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8),3)
e={}
e["pin_no"]="23"
e["texts"]={"P2.3","PWM0_CH1","I2C1_SDA"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,3)
elseif i==1 and o==0 then
fill_Mini51_PWM(e,t,2,3,"PWM0_CH1",1)
elseif i==1 and o==1 then
fill_Mini51_I2C(e,t,2,3,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,2,3)
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],16),4)
e={}
e["pin_no"]="24"
e["texts"]={"P2.4","UART1_RXD","PWM0_CH2"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,4)
elseif o==0 and i==1 then
fill_Mini51_UART(e,t,2,4,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==1 and i==0 then
fill_Mini51_PWM(e,t,2,4,"PWM0_CH2",2)
else
fill_invalid_GPIO(e,t,2,4)
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32),5)
e={}
e["pin_no"]="25"
e["texts"]={"PWM0_CH3","UART1_TXD","P2.5"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,5)
elseif o==0 and i==1 then
fill_Mini51_UART(e,t,2,5,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==1 and i==0 then
fill_Mini51_PWM(e,t,2,5,"PWM0_CH3",3)
else
fill_invalid_GPIO(e,t,2,5)
end
a[25]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],64),6)
e={}
e["pin_no"]="26"
e["texts"]={"ACMP1_O","PWM0_CH4","P2.6"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,6)
elseif i==1 and o==0 then
fill_Mini51_PWM(e,t,2,6,"PWM0_CH4",4)
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,2,6,"ACMP1_O")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,2,6)
end
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[28]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],64),6)
e={}
e["pin_no"]="29"
e["texts"]={"UART1_RXD","ICE_CLK","P4.6"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,4,6)
elseif i==0 and o==1 then
fill_Mini51_Normal(e,t,4,6,"ICE_CLK")
e["direction"]=kPinDirection_In
elseif i==1 and o==0 then
fill_Mini51_UART(e,t,4,6,"UART1_RXD",1)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,4,6)
end
a[29]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],128),7)
e={}
e["pin_no"]="30"
e["texts"]={"UART1_TXD","ICE_DAT","P4.7"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,4,7)
elseif i==0 and o==1 then
fill_Mini51_Normal(e,t,4,7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif i==1 and o==0 then
fill_Mini51_UART(e,t,4,7,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,4,7)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[31]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],128),7)
e={}
e["pin_no"]="32"
e["texts"]={"PWM0_CH0","SPI0_CLK","P0.7"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,7)
elseif o==1 and i==0 then
fill_Mini51_SPI(e,t,0,7,"SPI0_CLK")
elseif o==1 and i==1 then
fill_Mini51_PWM(e,t,0,7,"PWM0_CH0",0)
else
fill_invalid_GPIO(e,t,0,7)
end
a[32]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],64),6)
e={}
e["pin_no"]="33"
e["texts"]={"PWM0_CH1","SPI0_MISO","P0.6"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,6)
elseif i==1 and o==0 then
fill_Mini51_SPI(e,t,0,6,"SPI0_MISO")
fill_Mini51_SPI_IO(e,t,true)
elseif i==1 and o==1 then
fill_Mini51_PWM(e,t,0,6,"PWM0_CH1",1)
else
fill_invalid_GPIO(e,t,0,6)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],32),5)
e={}
e["pin_no"]="34"
e["texts"]={"PWM0_CH4","SPI0_MOSI","P0.5"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,5)
elseif o==1 and i==0 then
fill_Mini51_SPI(e,t,0,5,"SPI0_MOSI")
fill_Mini51_SPI_IO(e,t,false)
elseif o==1 and i==1 then
fill_Mini51_PWM(e,t,0,5,"PWM0_CH4",4)
else
fill_invalid_GPIO(e,t,0,5)
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16),4)
e={}
e["pin_no"]="35"
e["texts"]={"PWM0_CH5","SPI0_SS","P0.4"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,4)
elseif o==1 and i==0 then
fill_Mini51_SPI(e,t,0,4,"SPI0_SS")
elseif o==1 and i==1 then
fill_Mini51_PWM(e,t,0,4,"PWM0_CH5",5)
else
fill_invalid_GPIO(e,t,0,4)
end
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[36]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],512),9)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],2),1)
e={}
e["pin_no"]="37"
e["texts"]={"SPI0_SS","UART0_RXD","UART0_nRTS","P0.1"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,1)
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,0,1,"UART0_nRTS",0)
elseif o==1 and i==1 then
fill_Mini51_UART(e,t,0,1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==0 and i==1 then
fill_Mini51_SPI(e,t,0,1,"SPI0_SS")
end
a[37]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],256),8)
local o=ext.band(t["GCR_P0_MFP"],1)
e={}
e["pin_no"]="38"
e["texts"]={"UART0_TXD","UART0_nCTS","P0.0"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,0)
elseif i==1 and o==0 then
fill_Mini51_UART(e,t,0,0,"UART0_nCTS",0)
elseif i==1 and o==1 then
fill_Mini51_UART(e,t,0,0,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,0,0)
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
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],8),3)
e={}
e["pin_no"]="41"
e["texts"]={"ADC_CH0","P5.3"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,5,3)
elseif i==0 and o==1 then
fill_Mini51_ADC(e,t,5,3,"ADC_CH0")
else
fill_invalid_GPIO(e,t,5,3)
end
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"VDD"}
fill_Mini51_Normal(e,t,nil,nil,"VDD")
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"AVDD"}
fill_Mini51_Normal(e,t,nil,nil,"AVDD")
a[43]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],256),8)
local i=ext.band(t["GCR_P1_MFP"],1)
e={}
e["pin_no"]="44"
e["texts"]={"ACMP0_P1","ADC_CH1","P1.0"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,0)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,1,0,"ADC_CH1")
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,1,0,"ACMP0_P1")
else
fill_invalid_GPIO(e,t,1,0)
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],67108864),26)
local n=ext.rshift(ext.band(t["GCR_P1_MFP"],1024),10)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],4),2)
e={}
e["pin_no"]="45"
e["texts"]={"PWM0_CH0","ACMP0_P2","UART0_RXD","ADC_CH2","P1.2"}
if o==0 and n==0 and i==0 then
fill_Mini51_GPIO(e,t,1,2)
elseif o==0 and n==0 and i==1 then
fill_Mini51_ADC(e,t,1,2,"ADC_CH2")
elseif o==0 and n==1 and i==0 then
fill_Mini51_UART(e,t,1,2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==0 and n==1 and i==1 then
fill_Mini51_ACMP(e,t,1,2,"ACMP0_P2")
elseif o==1 and n==0 and i==0 then
fill_Mini51_PWM(e,t,1,2,"PWM0_CH0",0)
else
fill_invalid_GPIO(e,t,1,2)
end
a[45]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],134217728),27)
local n=ext.rshift(ext.band(t["GCR_P1_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8),3)
e={}
e["pin_no"]="46"
e["texts"]={"PWM0_CH1","ACMP0_P3","UART0_TXD","ADC_CH3","P1.3"}
if o==0 and n==0 and i==0 then
fill_Mini51_GPIO(e,t,1,3)
elseif o==0 and n==0 and i==1 then
fill_Mini51_ADC(e,t,1,3,"ADC_CH3")
elseif o==0 and n==1 and i==0 then
fill_Mini51_UART(e,t,1,3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==0 and n==1 and i==1 then
fill_Mini51_ACMP(e,t,1,3,"ACMP0_P3")
elseif o==1 and n==0 and i==0 then
fill_Mini51_PWM(e,t,1,3,"PWM0_CH1",1)
else
fill_invalid_GPIO(e,t,1,3)
end
a[46]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],268435456),28)
local n=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
e={}
e["pin_no"]="47"
e["texts"]={"PWM0_CH4","ACMP0_N","UART1_RXD","ADC_CH4","P1.4"}
if i==0 and n==0 and o==0 then
fill_Mini51_GPIO(e,t,1,4)
elseif i==0 and n==0 and o==1 then
fill_Mini51_ADC(e,t,1,4,"ADC_CH4")
elseif i==0 and n==1 and o==0 then
fill_Mini51_UART(e,t,1,4,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif i==0 and n==1 and o==1 then
fill_Mini51_ACMP(e,t,1,4,"ACMP0_N")
elseif i==1 and n==0 and o==0 then
fill_Mini51_PWM(e,t,1,4,"PWM0_CH4",4)
else
fill_invalid_GPIO(e,t,1,4)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[48]=e
return{name=s,information="",pins=a}
end