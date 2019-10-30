local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Mini51.lua")
function get_chip_status_Mini51_DE_TSSOP20(n,e,e)
local a={}
local t=read_Mini51_Registers()
local e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],32),5)
e={}
e["pin_no"]="4"
e["texts"]={"P1.5","AIN5","ACMP0_P"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,5)
elseif i==0 and o==1 then
fill_Mini51_ADC(e,t,1,5,"AIN5")
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,1,5,"ACMP0_P")
else
fill_invalid_GPIO(e,t,1,5)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"/RESET"}
fill_Mini51_Normal(e,t,nil,nil,"/RESET")
e["direction"]=kPinDirection_In
a[5]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4),2)
local s=ext.rshift(ext.band(t["GCR_P3_MFP"],16777216),24)
e={}
e["pin_no"]="6"
e["texts"]={"P3.2","INT0","STADC","T0EX","ACMP1_P"}
if s==1 then
fill_Mini51_ACMP(e,t,3,2,"ACMP1_P")
else
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,2)
elseif i==0 and o==1 then
fill_Mini51_Normal(e,t,3,2,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif i==1 and o==1 then
fill_Mini51_ADC(e,t,3,2,"STADC")
elseif i==1 and o==0 then
fill_Mini51_TM(e,t,3,2,"T0EX",0)
end
end
a[6]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],16),4)
e={}
e["pin_no"]="7"
e["texts"]={"P3.4","T0","SDA","ACMP1_P"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,4)
elseif i==0 and o==1 then
fill_Mini51_TM(e,t,3,4,"T0",0)
elseif i==1 and o==0 then
fill_Mini51_I2C(e,t,3,4,"SDA")
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,3,4,"ACMP1_P")
end
a[7]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],32),5)
e={}
e["pin_no"]="8"
e["texts"]={"P3.5","T1","SCL","ACMP1_P"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,5)
elseif i==0 and o==1 then
fill_Mini51_TM(e,t,3,5,"T1",1)
elseif i==1 and o==0 then
fill_Mini51_I2C(e,t,3,5,"SCL")
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,3,5,"ACMP1_P")
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],512),9)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],2),1)
e={}
e["pin_no"]="9"
e["texts"]={"P5.1","XTAL2"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,1)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,5,1,"XTAL2")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,5,1)
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],256),8)
local i=ext.band(t["GCR_P5_MFP"],1)
e={}
e["pin_no"]="10"
e["texts"]={"P5.0","XTAL1"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,0)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,5,0,"XTAL1")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,5,0)
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
e["texts"]={"PWM2","P2.4"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,4)
elseif o==1 and i==0 then
fill_Mini51_PWM(e,t,2,4,"PWM2")
else
fill_invalid_GPIO(e,t,2,4)
end
a[12]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32),5)
e={}
e["pin_no"]="13"
e["texts"]={"PWM3","P2.5"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,5)
elseif o==1 and i==0 then
fill_Mini51_PWM(e,t,2,5,"PWM3")
else
fill_invalid_GPIO(e,t,2,5)
end
a[13]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],64),6)
e={}
e["pin_no"]="14"
e["texts"]={"ICE_CLK","P4.6"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,4,6)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,4,6,"ICE_CLK")
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
fill_Mini51_GPIO(e,t,4,7)
elseif i==0 and o==1 then
fill_Mini51_Normal(e,t,4,7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,4,7)
end
a[15]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],128),7)
e={}
e["pin_no"]="16"
e["texts"]={"SPICLK","P0.7"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,7)
elseif i==1 and o==0 then
fill_Mini51_SPI(e,t,0,7,"SPICLK")
else
fill_invalid_GPIO(e,t,0,7)
end
a[16]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],64),6)
e={}
e["pin_no"]="17"
e["texts"]={"MISO","P0.6"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,6)
elseif o==1 and i==0 then
fill_Mini51_SPI(e,t,0,6,"MISO")
fill_Mini51_SPI_IO(e,t,true)
else
fill_invalid_GPIO(e,t,0,6)
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],32),5)
e={}
e["pin_no"]="18"
e["texts"]={"MOSI","P0.5"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,5)
elseif o==1 and i==0 then
fill_Mini51_SPI(e,t,0,5,"MOSI")
fill_Mini51_SPI_IO(e,t,false)
else
fill_invalid_GPIO(e,t,0,5)
end
a[18]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16),4)
e={}
e["pin_no"]="19"
e["texts"]={"PWM5","SPISS","P0.4"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,4)
elseif o==1 and i==0 then
fill_Mini51_SPI(e,t,0,4,"SPISS")
elseif o==1 and i==1 then
fill_Mini51_PWM(e,t,0,4,"PWM5")
else
fill_invalid_GPIO(e,t,0,4)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"VDD"}
fill_Mini51_Normal(e,t,nil,nil,"VDD")
a[20]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],1024),10)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],4),2)
e={}
e["pin_no"]="1"
e["texts"]={"P1.2","AIN2","RX","ACMP0_P"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,2)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,1,2,"AIN2")
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,1,2,"RX")
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,1,2,"ACMP0_P")
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8),3)
e={}
e["pin_no"]="2"
e["texts"]={"P1.3","AIN3","TX","ACMP0_P"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,3)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,1,3,"AIN3")
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,1,3,"TX")
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,1,3,"ACMP0_P")
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
e={}
e["pin_no"]="3"
e["texts"]={"P1.4","AIN4","ACMP0_N"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,4)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,1,4,"AIN4")
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,1,4,"ACMP0_N")
else
fill_invalid_GPIO(e,t,1,4)
end
a[3]=e
return{name=n,information="",pins=a}
end
