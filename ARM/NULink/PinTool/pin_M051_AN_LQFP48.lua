local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M051.lua")
function get_chip_status_M051_AN_LQFP48(s,e,t,o)
local a={}
local t=read_M051_Registers(s,e,t,o)
local e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],32),5)
e={}
e["pin_no"]="1"
e["texts"]={"P1.5","MOSI_0","AIN5"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,1,5)
elseif i==1 and o==0 then
fill_M051_SPI(e,t,1,5,"MOSI_0",0)
fill_M051_SPI_IO(e,t,0,false)
elseif i==0 and o==1 then
fill_M051_ADC(e,t,1,5,"AIN5")
else
fill_invalid_GPIO(e,t,1,5)
end
a[1]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],64),6)
e={}
e["pin_no"]="2"
e["texts"]={"P1.6","MISO_0","AIN6"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,1,6)
elseif i==1 and o==0 then
fill_M051_SPI(e,t,1,6,"MISO_0",0)
fill_M051_SPI_IO(e,t,0,true)
elseif i==0 and o==1 then
fill_M051_ADC(e,t,1,6,"AIN6")
else
fill_invalid_GPIO(e,t,1,6)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],128),7)
e={}
e["pin_no"]="3"
e["texts"]={"P1.7","SPICLK0","AIN7"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,1,7)
elseif o==1 and i==0 then
fill_M051_SPI(e,t,1,7,"SPICLK0",0)
elseif o==0 and i==1 then
fill_M051_ADC(e,t,1,7,"AIN7")
else
fill_invalid_GPIO(e,t,1,7)
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"/RST"}
fill_M051_Normal(e,t,nil,nil,"/RST")
e["direction"]=kPinDirection_In
a[4]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],256),8)
local o=ext.band(t["GCR_P3_MFP"],1)
e={}
e["pin_no"]="5"
e["texts"]={"P3.0","RXD"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,0)
elseif i==0 and o==1 then
fill_M051_UART(e,t,3,0,"RXD",0)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,3,0)
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"AVSS"}
fill_M051_Normal(e,t,nil,nil,"AVSS")
a[6]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],2),1)
e={}
e["pin_no"]="7"
e["texts"]={"P3.1","TXD"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,1)
elseif i==0 and o==1 then
fill_M051_UART(e,t,3,1,"TXD",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,3,1)
end
a[7]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4),2)
local n=ext.band(t["ADC_ADCR"],256)
local h=ext.band(t["ADC_ADCR"],48)
e={}
e["pin_no"]="8"
e["texts"]={"P3.2","/INT0","STADC"}
if i==0 and o==0 then
if n~=0 and h==0 then
fill_M051_GPIO(e,t,3,2,"P3.2,STADC")
e["highlight_text"]="P3.2,STADC"
e["texts"]={"P3.2,STADC","/INT0"}
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
else
fill_M051_GPIO(e,t,3,2)
end
elseif i==0 and o==1 then
fill_M051_Normal(e,t,3,2,"/INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
if n~=0 and h==0 then
e["texts"]={"P3.2","/INT0,STADC"}
e["highlight_text"]="/INT0,STADC"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
else
fill_invalid_GPIO(e,t,3,2)
end
a[8]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],8),3)
e={}
e["pin_no"]="9"
e["texts"]={"P3.3","/INT1","MCLK"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,3)
elseif i==0 and o==1 then
fill_M051_Normal(e,t,3,3,"/INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif i==1 and o==0 then
fill_M051_EBI(e,t,3,3,"MCLK")
else
fill_invalid_GPIO(e,t,3,3)
end
a[9]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],16),4)
e={}
e["pin_no"]="10"
e["texts"]={"P3.4","T0","SDA"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,4)
elseif i==0 and o==1 then
fill_M051_TM(e,t,3,4,"T0",0)
elseif i==1 and o==0 then
fill_M051_I2C(e,t,3,4,"SDA",0)
else
fill_invalid_GPIO(e,t,3,4)
end
a[10]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],32),5)
e={}
e["pin_no"]="11"
e["texts"]={"P3.5","T1","SCL"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,3,5)
elseif o==0 and i==1 then
fill_M051_TM(e,t,3,5,"T1",1)
elseif o==1 and i==0 then
fill_M051_I2C(e,t,3,5,"SCL",0)
else
fill_invalid_GPIO(e,t,3,5)
end
a[11]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],8),3)
e={}
e["pin_no"]="12"
e["texts"]={"P4.3","PWM3"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,4,3)
elseif o==0 and i==1 then
fill_M051_PWM(e,t,4,3,"PWM3")
else
fill_invalid_GPIO(e,t,4,3)
end
a[12]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],64),6)
e={}
e["pin_no"]="13"
e["texts"]={"P3.6","/WR","CKO"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,6)
elseif i==0 and o==1 then
fill_M051_EBI(e,t,3,6,"/WR")
elseif i==1 and o==0 then
fill_M051_CLKO(e,t,3,6,"CKO")
else
fill_invalid_GPIO(e,t,3,6)
end
a[13]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],128),7)
e={}
e["pin_no"]="14"
e["texts"]={"P3.7","/RD"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,7)
elseif i==0 and o==1 then
fill_M051_EBI(e,t,3,7,"/RD")
else
fill_invalid_GPIO(e,t,3,7)
end
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"XTAL2"}
fill_M051_Normal(e,t,nil,nil,"XTAL2")
e["direction"]=kPinDirection_PushPullOut
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"XTAL1"}
fill_M051_Normal(e,t,nil,nil,"XTAL1")
e["direction"]=kPinDirection_In
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VSS"}
fill_M051_Normal(e,t,nil,nil,"VSS")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"LDO_CAP"}
fill_M051_Normal(e,t,nil,nil,"LDO_CAP")
a[18]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],256),8)
local i=ext.band(t["GCR_P2_MFP"],1)
e={}
e["pin_no"]="19"
e["texts"]={"P2.0","PWM0","AD8"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,2,0)
elseif o==1 and i==0 then
fill_M051_PWM(e,t,2,0,"PWM0")
elseif o==0 and i==1 then
fill_M051_EBI(e,t,2,0,"AD8")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,0)
end
a[19]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],2),1)
e={}
e["pin_no"]="20"
e["texts"]={"P2.1","PWM1","AD9"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,2,1)
elseif i==1 and o==0 then
fill_M051_PWM(e,t,2,1,"PWM1")
elseif i==0 and o==1 then
fill_M051_EBI(e,t,2,1,"AD9")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,1)
end
a[20]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],4),2)
e={}
e["pin_no"]="21"
e["texts"]={"P2.2","PWM2","AD10"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,2,2)
elseif i==1 and o==0 then
fill_M051_PWM(e,t,2,2,"PWM2")
elseif i==0 and o==1 then
fill_M051_EBI(e,t,2,2,"AD10")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,2)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],8),3)
e={}
e["pin_no"]="22"
e["texts"]={"P2.3","PWM3","AD11"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,2,3)
elseif o==1 and i==0 then
fill_M051_PWM(e,t,2,3,"PWM3")
elseif o==0 and i==1 then
fill_M051_EBI(e,t,2,3,"AD11")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,3)
end
a[22]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],16),4)
e={}
e["pin_no"]="23"
e["texts"]={"P2.4","PWM4","AD12"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,2,4)
elseif o==1 and i==0 then
fill_M051_PWM(e,t,2,4,"PWM4")
elseif o==0 and i==1 then
fill_M051_EBI(e,t,2,4,"AD12")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,4)
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],256),8)
local i=ext.band(t["GCR_P4_MFP"],1)
e={}
e["pin_no"]="24"
e["texts"]={"P4.0","PWM0"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,4,0)
elseif o==0 and i==1 then
fill_M051_PWM(e,t,4,0,"PWM0")
else
fill_invalid_GPIO(e,t,4,0)
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32),5)
e={}
e["pin_no"]="25"
e["texts"]={"AD13","PWM5","P2.5"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,2,5)
elseif o==1 and i==0 then
fill_M051_PWM(e,t,2,5,"PWM5")
elseif o==0 and i==1 then
fill_M051_EBI(e,t,2,5,"AD13")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,5)
end
a[25]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],64),6)
e={}
e["pin_no"]="26"
e["texts"]={"AD14","PWM6","P2.6"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,2,6)
elseif o==1 and i==0 then
fill_M051_PWM(e,t,2,6,"PWM6")
elseif o==0 and i==1 then
fill_M051_EBI(e,t,2,6,"AD14")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,6)
end
a[26]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],128),7)
e={}
e["pin_no"]="27"
e["texts"]={"AD15","PWM7","P2.7"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,2,7)
elseif i==1 and o==0 then
fill_M051_PWM(e,t,2,7,"PWM7")
elseif i==0 and o==1 then
fill_M051_EBI(e,t,2,7,"AD15")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,2,7)
end
a[27]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],16),4)
e={}
e["pin_no"]="28"
e["texts"]={"/CS","P4.4"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,4,4)
elseif o==0 and i==1 then
fill_M051_EBI(e,t,4,4,"/CS")
else
fill_invalid_GPIO(e,t,4,4)
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],32),5)
e={}
e["pin_no"]="29"
e["texts"]={"ALE","P4.5"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,4,5)
elseif o==0 and i==1 then
fill_M051_EBI(e,t,4,5,"ALE")
else
fill_invalid_GPIO(e,t,4,5)
end
a[29]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],64),6)
e={}
e["pin_no"]="30"
e["texts"]={"ICE_CLK","P4.6"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,4,6)
elseif o==0 and i==1 then
fill_M051_Normal(e,t,4,6,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,4,6)
end
a[30]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],128),7)
e={}
e["pin_no"]="31"
e["texts"]={"ICE_DAT","P4.7"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,4,7)
elseif o==0 and i==1 then
fill_M051_Normal(e,t,4,7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,4,7)
end
a[31]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],128),7)
e={}
e["pin_no"]="32"
e["texts"]={"AD7","SPICLK1","P0.7"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,0,7)
elseif i==1 and o==0 then
fill_M051_SPI(e,t,0,7,"SPICLK1",1)
elseif i==0 and o==1 then
fill_M051_EBI(e,t,0,7,"AD7")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,7)
end
a[32]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],64),6)
e={}
e["pin_no"]="33"
e["texts"]={"AD6","MISO_1","P0.6"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,0,6)
elseif i==1 and o==0 then
fill_M051_SPI(e,t,0,6,"MISO_1",1)
fill_M051_SPI_IO(e,t,1,true)
elseif i==0 and o==1 then
fill_M051_EBI(e,t,0,6,"AD6")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,6)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],32),5)
e={}
e["pin_no"]="34"
e["texts"]={"AD5","MOSI_1","P0.5"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,0,5)
elseif o==1 and i==0 then
fill_M051_SPI(e,t,0,5,"MOSI_1",1)
fill_M051_SPI_IO(e,t,1,false)
elseif o==0 and i==1 then
fill_M051_EBI(e,t,0,5,"AD5")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,5)
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16),4)
e={}
e["pin_no"]="35"
e["texts"]={"AD4","SPISS1","P0.4"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,0,4)
elseif o==1 and i==0 then
fill_M051_SPI(e,t,0,4,"SPISS1",1)
elseif o==0 and i==1 then
fill_M051_EBI(e,t,0,4,"AD4")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,4)
end
a[35]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],2),1)
e={}
e["pin_no"]="36"
e["texts"]={"PWM1","P4.1"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,4,1)
elseif i==0 and o==1 then
fill_M051_PWM(e,t,4,1,"PWM1")
else
fill_invalid_GPIO(e,t,4,1)
end
a[36]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],8),3)
e={}
e["pin_no"]="37"
e["texts"]={"AD3","RTS0","P0.3"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,0,3)
elseif i==1 and o==0 then
fill_M051_UART(e,t,0,3,"RTS0",0)
elseif i==0 and o==1 then
fill_M051_EBI(e,t,0,3,"AD3")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,3)
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],1024),10)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],4),2)
e={}
e["pin_no"]="38"
e["texts"]={"AD2","CTS0","P0.2"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,0,2)
elseif o==1 and i==0 then
fill_M051_UART(e,t,0,2,"CTS0",0)
elseif o==0 and i==1 then
fill_M051_EBI(e,t,0,2,"AD2")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,2)
end
a[38]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],512),9)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],2),1)
e={}
e["pin_no"]="39"
e["texts"]={"AD1","RTS1","P0.1"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,0,1)
elseif o==1 and i==0 then
fill_M051_UART(e,t,0,1,"RTS1",1)
elseif o==0 and i==1 then
fill_M051_EBI(e,t,0,1,"AD1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,1)
end
a[39]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],256),8)
local o=ext.band(t["GCR_P0_MFP"],1)
e={}
e["pin_no"]="40"
e["texts"]={"AD0","CTS1","P0.0"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,0,0)
elseif i==1 and o==0 then
fill_M051_UART(e,t,0,0,"CTS1",1)
elseif i==0 and o==1 then
fill_M051_EBI(e,t,0,0,"AD0")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,0,0)
end
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"VDD"}
fill_M051_Normal(e,t,nil,nil,"VDD")
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"AVDD"}
fill_M051_Normal(e,t,nil,nil,"AVDD")
a[42]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],256),8)
local o=ext.band(t["GCR_P1_MFP"],1)
e={}
e["pin_no"]="43"
e["texts"]={"AIN0","T2","P1.0"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,1,0)
elseif i==1 and o==0 then
fill_M051_TM(e,t,1,0,"T2",2)
elseif i==0 and o==1 then
fill_M051_ADC(e,t,1,0,"AIN0")
else
fill_invalid_GPIO(e,t,1,0)
end
a[43]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2),1)
e={}
e["pin_no"]="44"
e["texts"]={"AIN1","T3","P1.1"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,1,1)
elseif i==1 and o==0 then
fill_M051_TM(e,t,1,1,"T3",3)
elseif i==0 and o==1 then
fill_M051_ADC(e,t,1,1,"AIN1")
else
fill_invalid_GPIO(e,t,1,1)
end
a[44]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4),2)
e={}
e["pin_no"]="45"
e["texts"]={"AIN2","RXD1","P1.2"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,1,2)
elseif i==1 and o==0 then
fill_M051_UART(e,t,1,2,"RXD1",1)
e["direction"]=kPinDirection_In
elseif i==0 and o==1 then
fill_M051_ADC(e,t,1,2,"AIN2")
else
fill_invalid_GPIO(e,t,1,2)
end
a[45]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8),3)
e={}
e["pin_no"]="46"
e["texts"]={"AIN3","TXD1","P1.3"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,1,3)
elseif o==1 and i==0 then
fill_M051_UART(e,t,1,3,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==0 and i==1 then
fill_M051_ADC(e,t,1,3,"AIN3")
else
fill_invalid_GPIO(e,t,1,3)
end
a[46]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
e={}
e["pin_no"]="47"
e["texts"]={"AIN4","SPISS0","P1.4"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,1,4)
elseif i==1 and o==0 then
fill_M051_SPI(e,t,1,4,"SPISS0",0)
elseif i==0 and o==1 then
fill_M051_ADC(e,t,1,4,"AIN4")
else
fill_invalid_GPIO(e,t,1,4)
end
a[47]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],4),2)
e={}
e["pin_no"]="48"
e["texts"]={"PWM2","P4.2"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,4,2)
elseif i==0 and o==1 then
fill_M051_PWM(e,t,4,2,"PWM2")
else
fill_invalid_GPIO(e,t,4,2)
end
a[48]=e
return{name=s,information="",pins=a}
end
