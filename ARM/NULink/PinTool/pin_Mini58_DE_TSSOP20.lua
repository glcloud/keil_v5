local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Mini51.lua")
function get_chip_status_Mini58_DE_TSSOP20(s,e,e)
local a={}
local t=read_Mini51_Registers()
local e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],32),5)
e={}
e["pin_no"]="4"
e["texts"]={"P1.5","ADC_CH5","UART1_TXD","ACMP0_P0"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,5)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,1,5,"ADC_CH5")
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,1,5,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,1,5,"ACMP0_P0")
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"nRESET"}
fill_Mini51_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[5]=e
local n=ext.rshift(ext.band(t["GCR_P3_MFP"],67108864),26)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4),2)
e={}
e["pin_no"]="6"
e["texts"]={"P3.2","INT0","STADC","TM0_EXT","ACMP1_P1"}
if n==0 and i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,2)
elseif n==0 and i==0 and o==1 then
fill_Mini51_Normal(e,t,3,2,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif n==0 and i==1 and o==1 then
fill_Mini51_ADC(e,t,3,2,"STADC")
elseif n==0 and i==1 and o==0 then
fill_Mini51_TM(e,t,3,2,"TM0_EXT",0)
elseif n==1 and i==0 and o==0 then
fill_Mini51_ACMP(e,t,3,2,"ACMP1_P1")
else
fill_invalid_GPIO(e,t,3,2)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],16),4)
e={}
e["pin_no"]="7"
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
a[7]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],32),5)
e={}
e["pin_no"]="8"
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
a[8]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],2),1)
e={}
e["pin_no"]="9"
e["texts"]={"P5.1","XT1_OUT","I2C1_SCL","UART0_RXD"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,5,1)
elseif i==0 and o==1 then
fill_Mini51_Normal(e,t,5,1,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==0 then
fill_Mini51_I2C(e,t,5,1,"I2C1_SCL",1)
elseif i==1 and o==1 then
fill_Mini51_UART(e,t,5,1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],256),8)
local i=ext.band(t["GCR_P5_MFP"],1)
e={}
e["pin_no"]="10"
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
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VSS"}
fill_Mini51_Normal(e,t,nil,nil,"VSS")
a[11]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],16),4)
e={}
e["pin_no"]="12"
e["texts"]={"PWM0_CH2","UART1_RXD","P2.4"}
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
a[12]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32),5)
e={}
e["pin_no"]="13"
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
a[13]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],64),6)
e={}
e["pin_no"]="14"
e["texts"]={"UART1_RXD","ICE_CLK","P4.6"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,4,6)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,4,6,"ICE_CLK")
e["direction"]=kPinDirection_In
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,4,6,"UART1_RXD",1)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,4,6)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],128),7)
e={}
e["pin_no"]="15"
e["texts"]={"UART1_TXD","ICE_DAT","P4.7"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,4,7)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,4,7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,4,7,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,4,7)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],128),7)
e={}
e["pin_no"]="16"
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
a[16]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],64),6)
e={}
e["pin_no"]="17"
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
a[17]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],32),5)
e={}
e["pin_no"]="18"
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
a[18]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],16),4)
e={}
e["pin_no"]="19"
e["texts"]={"PWM0_CH5","SPI0_SS","P0.4"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,4)
elseif i==1 and o==0 then
fill_Mini51_SPI(e,t,0,4,"SPI0_SS")
elseif i==1 and o==1 then
fill_Mini51_PWM(e,t,0,4,"PWM0_CH5",5)
else
fill_invalid_GPIO(e,t,0,4)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"VDD"}
fill_Mini51_Normal(e,t,nil,nil,"VDD")
a[20]=e
local n=ext.rshift(ext.band(t["GCR_P1_MFP"],67108864),26)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4),2)
e={}
e["pin_no"]="1"
e["texts"]={"P1.2","ADC_CH2","UART0_RXD","ACMP0_P2","PWM0_CH0"}
if n==0 and i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,2)
elseif n==0 and i==0 and o==1 then
fill_Mini51_ADC(e,t,1,2,"ADC_CH2")
elseif n==0 and i==1 and o==0 then
fill_Mini51_UART(e,t,1,2,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif n==0 and i==1 and o==1 then
fill_Mini51_ACMP(e,t,1,2,"ACMP0_P2")
elseif n==1 and i==0 and o==0 then
fill_Mini51_PWM(e,t,1,2,"PWM0_CH0",0)
else
fill_invalid_GPIO(e,t,1,2)
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],134217728),27)
local n=ext.rshift(ext.band(t["GCR_P1_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8),3)
e={}
e["pin_no"]="2"
e["texts"]={"P1.3","ADC_CH3","UART0_TXD","ACMP0_P3","PWM0_CH1"}
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
a[2]=e
local n=ext.rshift(ext.band(t["GCR_P1_MFP"],268435456),28)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
e={}
e["pin_no"]="3"
e["texts"]={"P1.4","ADC_CH4","UART1_RXD","ACMP0_N","PWM0_CH4"}
if n==0 and i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,4)
elseif n==0 and i==0 and o==1 then
fill_Mini51_ADC(e,t,1,4,"ADC_CH4")
elseif n==0 and i==1 and o==0 then
fill_Mini51_UART(e,t,1,4,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif n==0 and i==1 and o==1 then
fill_Mini51_ACMP(e,t,1,4,"ACMP0_N")
elseif n==1 and i==0 and o==0 then
fill_Mini51_PWM(e,t,1,4,"PWM0_CH4",4)
else
fill_invalid_GPIO(e,t,1,4)
end
a[3]=e
return{name=s,information="",pins=a}
end
