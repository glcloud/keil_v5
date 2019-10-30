local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."M051.lua")
function get_chip_status_M058S_AN_TSSOP20(n,t,e,o)
local a={}
local t=read_M051_Registers(n,t,e,o)
local e
e={}
e["pin_no"]="19"
e["texts"]={"VDD"}
fill_M051_Normal(e,t,nil,nil,"VDD")
a[19]=e
e={}
e["pin_no"]="11"
e["texts"]={"VSS"}
fill_M051_Normal(e,t,nil,nil,"VSS")
a[11]=e
e={}
e["pin_no"]="20"
e["texts"]={"AVDD"}
fill_M051_Normal(e,t,nil,nil,"AVDD")
a[20]=e
e={}
e["pin_no"]="5"
e["texts"]={"AVSS"}
fill_M051_Normal(e,t,nil,nil,"AVSS")
a[5]=e
e={}
e["pin_no"]="12"
e["texts"]={"LDO_CAP"}
fill_M051_Normal(e,t,nil,nil,"LDO_CAP")
a[12]=e
e={}
e["pin_no"]="3"
e["texts"]={"/RST"}
fill_M051_Normal(e,t,nil,nil,"/RST")
e["direction"]=kPinDirection_In
a[3]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],32),5)
e={}
e["pin_no"]="18"
e["texts"]={"MOSI","P0.5"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,0,5)
elseif i==1 and o==0 then
fill_M051_SPI(e,t,0,5,"MOSI",0)
fill_M051_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,0,5)
end
a[18]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],64),6)
e={}
e["pin_no"]="17"
e["texts"]={"MISO","P0.6"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,0,6)
elseif o==1 and i==0 then
fill_M051_SPI(e,t,0,6,"MISO",0)
fill_M051_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,0,6)
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],128),7)
e={}
e["pin_no"]="16"
e["texts"]={"SPICLK","P0.7"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,0,7)
elseif o==1 and i==0 then
fill_M051_SPI(e,t,0,7,"SPICLK",0)
else
fill_invalid_GPIO(e,t,0,7)
end
a[16]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],256),8)
local i=ext.band(t["GCR_P1_MFP"],1)
e={}
e["pin_no"]="1"
e["texts"]={"P1.0","T2","AIN0"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,1,0)
elseif o==1 and i==0 then
fill_M051_TM(e,t,1,0,"T2",2)
elseif o==0 and i==1 then
fill_M051_ADC(e,t,1,0,"AIN0")
else
fill_invalid_GPIO(e,t,1,0)
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
e={}
e["pin_no"]="2"
e["texts"]={"P1.4","SPISS","AIN4"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,1,4)
elseif o==1 and i==0 then
fill_M051_SPI(e,t,1,4,"SPISS",0)
elseif o==0 and i==1 then
fill_M051_ADC(e,t,1,4,"AIN4")
else
fill_invalid_GPIO(e,t,1,4)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],8),3)
e={}
e["pin_no"]="13"
e["texts"]={"PWM3","P2.3"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,2,3)
elseif o==1 and i==0 then
fill_M051_PWM(e,t,2,3,"PWM3")
else
fill_invalid_GPIO(e,t,2,3)
end
a[13]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],256),8)
local o=ext.band(t["GCR_P3_MFP"],1)
e={}
e["pin_no"]="4"
e["texts"]={"P3.0","RXD"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,0)
elseif i==0 and o==1 then
fill_M051_UART(e,t,3,0,"RXD",0)
else
fill_invalid_GPIO(e,t,3,0)
end
a[4]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],512),9)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],2),1)
e={}
e["pin_no"]="6"
e["texts"]={"P3.1","TXD"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,3,1)
elseif o==0 and i==1 then
fill_M051_UART(e,t,3,1,"TXD",0)
else
fill_invalid_GPIO(e,t,3,1)
end
a[6]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],16),4)
e={}
e["pin_no"]="7"
e["texts"]={"P3.4","T0","SDA0"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,4)
elseif i==0 and o==1 then
fill_M051_TM(e,t,3,4,"T0",0)
elseif i==1 and o==0 then
fill_M051_I2C(e,t,3,4,"SDA0",0)
else
fill_invalid_GPIO(e,t,3,4)
end
a[7]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],32),5)
e={}
e["pin_no"]="8"
e["texts"]={"P3.5","T1","SCL0","CKO"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,3,5)
elseif i==0 and o==1 then
fill_M051_TM(e,t,3,5,"T1",1)
elseif i==1 and o==0 then
fill_M051_I2C(e,t,3,5,"SCL0",0)
elseif i==1 and o==1 then
fill_M051_CLKO(e,t,3,5,"CKO")
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],64),6)
e={}
e["pin_no"]="14"
e["texts"]={"ICE_CLK","P4.6"}
if o==0 and i==0 then
fill_M051_GPIO(e,t,4,6)
elseif o==0 and i==1 then
fill_M051_Normal(e,t,4,6,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,4,6)
end
a[14]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],128),7)
e={}
e["pin_no"]="15"
e["texts"]={"ICE_DAT","P4.7"}
if i==0 and o==0 then
fill_M051_GPIO(e,t,4,7)
elseif i==0 and o==1 then
fill_M051_Normal(e,t,4,7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,4,7)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],256),8)
local o=ext.band(t["GCR_P7_MFP"],1)
e={}
e["pin_no"]="9"
e["texts"]={"P7.0","XTAL2"}
if o==0 then
fill_M051_GPIO(e,t,7,0)
elseif o==1 then
fill_M051_Normal(e,t,7,0,"XTAL2")
e["direction"]=kPinDirection_PushPullOut
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],2),1)
e={}
e["pin_no"]="10"
e["texts"]={"P7.1","XTAL1"}
if o==0 then
fill_M051_GPIO(e,t,7,1)
elseif o==1 then
fill_M051_Normal(e,t,7,1,"XTAL1")
e["direction"]=kPinDirection_In
end
a[10]=e
return{name=n,information="",pins=a}
end
