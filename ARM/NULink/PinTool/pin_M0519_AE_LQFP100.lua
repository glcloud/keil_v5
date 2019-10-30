local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NM1500.lua")
function get_chip_status_M0519_AE_LQFP100(n,t,e,o)
local a={}
local t=read_NM1500_Registers(n,t,e,o)
local e
e={}
e["pin_no"]="1"
e["texts"]={"VSS"}
fill_NM1500_Normal(e,t,nil,nil,"VSS")
a[1]=e
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],128),7)
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],32768),15)
e={}
e["pin_no"]="2"
e["texts"]={"P9.7","SPI1_SS"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,9,7)
elseif o==0 and i==1 then
fill_NM1500_SPI(e,t,9,7,"SPI1_SS",1)
else
fill_invalid_GPIO(e,t,9,7)
end
a[2]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],128),7)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],32768),15)
e={}
e["pin_no"]="3"
e["texts"]={"P3.7"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,3,7)
else
fill_invalid_GPIO(e,t,3,7)
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],64),6)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],16384),14)
e={}
e["pin_no"]="4"
e["texts"]={"P3.6"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,3,6)
else
fill_invalid_GPIO(e,t,3,6)
end
a[4]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],32),5)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],8192),13)
e={}
e["pin_no"]="5"
e["texts"]={"P3.5","TM1","I2C0_SCL"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,3,5)
elseif o==0 and i==1 then
fill_NM1500_TM(e,t,3,5,"TM1",1)
elseif o==1 and i==0 then
fill_NM1500_I2C(e,t,3,5,"I2C0_SCL",0)
else
fill_invalid_GPIO(e,t,3,5)
end
a[5]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4096),12)
e={}
e["pin_no"]="6"
e["texts"]={"P3.4","TM0","I2C0_SDA"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,3,4)
elseif o==0 and i==1 then
fill_NM1500_TM(e,t,3,4,"TM0",0)
elseif o==1 and i==0 then
fill_NM1500_I2C(e,t,3,4,"I2C0_SDA",0)
else
fill_invalid_GPIO(e,t,3,4)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],1024),10)
e={}
e["pin_no"]="7"
e["texts"]={"P3.2","INT0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,3,2)
elseif i==0 and o==1 then
fill_NM1500_Normal(e,t,3,2,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,3,2)
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],128),7)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],32768),15)
e={}
e["pin_no"]="8"
e["texts"]={"P1.7","EPWM1_BRAKE0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,1,7)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,1,7,"EPWM1_BRAKE0",1)
else
fill_invalid_GPIO(e,t,1,7)
end
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"LDO_CAP"}
fill_NM1500_Normal(e,t,nil,nil,"LDO_CAP")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"VDD"}
fill_NM1500_Normal(e,t,nil,nil,"VDD")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VSS"}
fill_NM1500_Normal(e,t,nil,nil,"VSS")
a[11]=e
local i=ext.rshift(ext.band(t["GCR_PA_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_PA_MFP"],512),9)
e={}
e["pin_no"]="12"
e["texts"]={"PA.1","UART1_RXD","I2C0_SCL"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,10,1)
elseif o==0 and i==1 then
fill_NM1500_UART(e,t,10,1,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==1 and i==1 then
fill_NM1500_I2C(e,t,10,1,"I2C0_SCL",0)
else
fill_invalid_GPIO(e,t,10,1)
end
a[12]=e
local o=ext.band(t["GCR_PA_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_PA_MFP"],256),8)
e={}
e["pin_no"]="13"
e["texts"]={"PA.0","UART1_TXD","I2C0_SDA"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,10,0)
elseif i==0 and o==1 then
fill_NM1500_UART(e,t,10,0,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==1 then
fill_NM1500_I2C(e,t,10,0,"I2C0_SDA",0)
else
fill_invalid_GPIO(e,t,10,0)
end
a[13]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],128),7)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],32768),15)
e={}
e["pin_no"]="14"
e["texts"]={"P5.7","BPWM0_CH1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,5,7)
elseif i==0 and o==1 then
fill_NM1500_BPWM(e,t,5,7,"BPWM0_CH1",0,1)
else
fill_invalid_GPIO(e,t,5,7)
end
a[14]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],16384),14)
e={}
e["pin_no"]="15"
e["texts"]={"P5.6","BPWM0_CH0"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,5,6)
elseif o==0 and i==1 then
fill_NM1500_BPWM(e,t,5,6,"BPWM0_CH0",0,0)
else
fill_invalid_GPIO(e,t,5,6)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],64),6)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],16384),14)
e={}
e["pin_no"]="16"
e["texts"]={"P1.6","EPWM0_BRAKE0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,1,6)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,1,6,"EPWM0_BRAKE0",0)
else
fill_invalid_GPIO(e,t,1,6)
end
a[16]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],32),5)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],8192),13)
e={}
e["pin_no"]="17"
e["texts"]={"P1.5","EPWM1_CH5"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,1,5)
elseif o==0 and i==1 then
fill_NM1500_EPWM(e,t,1,5,"EPWM1_CH5",1,5)
else
fill_invalid_GPIO(e,t,1,5)
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
e={}
e["pin_no"]="18"
e["texts"]={"P1.4","EPWM1_CH4"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,1,4)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,1,4,"EPWM1_CH4",1,4)
else
fill_invalid_GPIO(e,t,1,4)
end
a[18]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2048),11)
e={}
e["pin_no"]="19"
e["texts"]={"P1.3","EPWM1_CH3"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,1,3)
elseif o==0 and i==1 then
fill_NM1500_EPWM(e,t,1,3,"EPWM1_CH3",1,3)
else
fill_invalid_GPIO(e,t,1,3)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],1024),10)
e={}
e["pin_no"]="20"
e["texts"]={"P1.2","EPWM1_CH2"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,1,2)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,1,2,"EPWM1_CH2",1,2)
else
fill_invalid_GPIO(e,t,1,2)
end
a[20]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],4096),12)
e={}
e["pin_no"]="21"
e["texts"]={"P4.4"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,4,4)
else
fill_invalid_GPIO(e,t,4,4)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],32),5)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],8192),13)
e={}
e["pin_no"]="22"
e["texts"]={"P4.5"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,4,5)
else
fill_invalid_GPIO(e,t,4,5)
end
a[22]=e
local o=ext.band(t["GCR_P4_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],256),8)
e={}
e["pin_no"]="23"
e["texts"]={"P4.0","ECAP1_IC0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,4,0)
elseif i==0 and o==1 then
fill_NM1500_CAP(e,t,4,0,"ECAP1_IC0",1)
else
fill_invalid_GPIO(e,t,4,0)
end
a[23]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],512),9)
e={}
e["pin_no"]="24"
e["texts"]={"P4.1","ECAP1_IC1"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,4,1)
elseif o==0 and i==1 then
fill_NM1500_CAP(e,t,4,1,"ECAP1_IC1",1)
else
fill_invalid_GPIO(e,t,4,1)
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],1024),10)
e={}
e["pin_no"]="25"
e["texts"]={"P4.2","ECAP1_IC2"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,4,2)
elseif i==0 and o==1 then
fill_NM1500_CAP(e,t,4,2,"ECAP1_IC2",1)
else
fill_invalid_GPIO(e,t,4,2)
end
a[25]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],2048),11)
e={}
e["pin_no"]="26"
e["texts"]={"P4.3"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,4,3)
else
fill_invalid_GPIO(e,t,4,3)
end
a[26]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],8),3)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],2048),11)
e={}
e["pin_no"]="27"
e["texts"]={"P3.3","INT1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,3,3)
elseif i==0 and o==1 then
fill_NM1500_Normal(e,t,3,3,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,3,3)
end
a[27]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],16384),14)
e={}
e["pin_no"]="28"
e["texts"]={"P4.6","TM2"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,4,6)
elseif o==0 and i==1 then
fill_NM1500_TM(e,t,4,6,"TM2",2)
else
fill_invalid_GPIO(e,t,4,6)
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2),1)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],512),9)
e={}
e["pin_no"]="29"
e["texts"]={"P1.1","EPWM1_CH1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,1,1)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,1,1,"EPWM1_CH1",1,1)
else
fill_invalid_GPIO(e,t,1,1)
end
a[29]=e
local o=ext.band(t["GCR_P1_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],256),8)
e={}
e["pin_no"]="30"
e["texts"]={"P1.0","EPWM1_CH0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,1,0)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,1,0,"EPWM1_CH0",1,0)
else
fill_invalid_GPIO(e,t,1,0)
end
a[30]=e
local i=ext.band(t["GCR_P3_MFP"],1)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],256),8)
e={}
e["pin_no"]="31"
e["texts"]={"P3.0","UART0_RXD","CLKO"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,3,0)
elseif o==0 and i==1 then
fill_NM1500_UART(e,t,3,0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==1 and i==0 then
fill_NM1500_CLKO(e,t,3,0,"CLKO")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,3,0)
end
a[31]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],2),1)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],512),9)
e={}
e["pin_no"]="32"
e["texts"]={"P3.1","UART0_TXD","ACMP0_O"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,3,1)
elseif i==0 and o==1 then
fill_NM1500_UART(e,t,3,1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==0 then
fill_NM1500_ACMP(e,t,3,1,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,3,1)
end
a[32]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],128),7)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],32768),15)
e={}
e["pin_no"]="33"
e["texts"]={"P4.7","TM3"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,4,7)
elseif o==0 and i==1 then
fill_NM1500_TM(e,t,4,7,"TM3",3)
else
fill_invalid_GPIO(e,t,4,7)
end
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"VDD"}
fill_NM1500_Normal(e,t,nil,nil,"VDD")
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"VSS"}
fill_NM1500_Normal(e,t,nil,nil,"VSS")
a[35]=e
local o=ext.band(t["GCR_P5_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],256),8)
e={}
e["pin_no"]="36"
e["texts"]={"P5.0","SPI0_MOSI","UART0_nRTS","I2C0_SCL"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,5,0)
elseif i==0 and o==1 then
fill_NM1500_SPI(e,t,5,0,"SPI0_MOSI",0)
fill_NM1500_SPI_IO(e,t,0,false)
elseif i==1 and o==0 then
fill_NM1500_UART(e,t,5,0,"UART0_nRTS",0)
elseif i==1 and o==1 then
fill_NM1500_I2C(e,t,5,0,"I2C0_SCL",0)
else
fill_invalid_GPIO(e,t,5,0)
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],2),1)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],512),9)
e={}
e["pin_no"]="37"
e["texts"]={"P5.1","SPI0_MISO","UART0_nCTS","I2C0_SDA"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,5,1)
elseif i==0 and o==1 then
fill_NM1500_SPI(e,t,5,1,"SPI0_MISO",0)
fill_NM1500_SPI_IO(e,t,0,true)
elseif i==1 and o==0 then
fill_NM1500_UART(e,t,5,1,"UART0_nCTS",0)
elseif i==1 and o==1 then
fill_NM1500_I2C(e,t,5,1,"I2C0_SDA",0)
else
fill_invalid_GPIO(e,t,5,1)
end
a[37]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],128),7)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],32768),15)
e={}
e["pin_no"]="38"
e["texts"]={"P2.7","SPI0_CLK","UART1_nRTS"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,2,7)
elseif o==1 and i==0 then
fill_NM1500_SPI(e,t,2,7,"SPI0_CLK",0)
elseif o==1 and i==1 then
fill_NM1500_UART(e,t,2,7,"UART1_nRTS",1)
else
fill_invalid_GPIO(e,t,2,7)
end
a[38]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],16384),14)
e={}
e["pin_no"]="39"
e["texts"]={"P2.6","SPI0_SS","UART1_nCTS"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,2,6)
elseif o==1 and i==0 then
fill_NM1500_SPI(e,t,2,6,"SPI0_SS",0)
elseif o==1 and i==1 then
fill_NM1500_UART(e,t,2,6,"UART1_nCTS",1)
else
fill_invalid_GPIO(e,t,2,6)
end
a[39]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32),5)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8192),13)
e={}
e["pin_no"]="40"
e["texts"]={"P2.5"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,2,5)
else
fill_invalid_GPIO(e,t,2,5)
end
a[40]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],4096),12)
e={}
e["pin_no"]="41"
e["texts"]={"P2.4"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,2,4)
else
fill_invalid_GPIO(e,t,2,4)
end
a[41]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],128),7)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],32768),15)
e={}
e["pin_no"]="42"
e["texts"]={"P0.7","STADC"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,0,7)
elseif o==0 and i==1 then
fill_NM1500_ADC(e,t,0,7,"STADC")
else
fill_invalid_GPIO(e,t,0,7)
end
a[42]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],64),6)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16384),14)
e={}
e["pin_no"]="43"
e["texts"]={"P0.6","EPWM0_BRAKE1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,0,6)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,0,6,"EPWM0_BRAKE1",0)
else
fill_invalid_GPIO(e,t,0,6)
end
a[43]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],32),5)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],8192),13)
e={}
e["pin_no"]="44"
e["texts"]={"P0.5","EPWM0_CH5"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,0,5)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,0,5,"EPWM0_CH5",0,5)
else
fill_invalid_GPIO(e,t,0,5)
end
a[44]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],4096),12)
e={}
e["pin_no"]="45"
e["texts"]={"P0.4","EPWM0_CH4"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,0,4)
elseif o==0 and i==1 then
fill_NM1500_EPWM(e,t,0,4,"EPWM0_CH4",0,4)
else
fill_invalid_GPIO(e,t,0,4)
end
a[45]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],2048),11)
e={}
e["pin_no"]="46"
e["texts"]={"P2.3","ECAP0_IC0"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,2,3)
elseif o==0 and i==1 then
fill_NM1500_CAP(e,t,2,3,"ECAP0_IC0",0)
else
fill_invalid_GPIO(e,t,2,3)
end
a[46]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],1024),10)
e={}
e["pin_no"]="47"
e["texts"]={"P2.2","ECAP0_IC1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,2,2)
elseif i==0 and o==1 then
fill_NM1500_CAP(e,t,2,2,"ECAP0_IC1",0)
else
fill_invalid_GPIO(e,t,2,2)
end
a[47]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],512),9)
e={}
e["pin_no"]="48"
e["texts"]={"P2.1","ECAP0_IC2"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,2,1)
elseif o==0 and i==1 then
fill_NM1500_CAP(e,t,2,1,"ECAP0_IC2",0)
else
fill_invalid_GPIO(e,t,2,1)
end
a[48]=e
local i=ext.band(t["GCR_P2_MFP"],1)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],256),8)
e={}
e["pin_no"]="49"
e["texts"]={"P2.0","SPI2_MOSI","ACMP2_O"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,2,0)
elseif o==0 and i==1 then
fill_NM1500_SPI(e,t,2,0,"SPI2_MOSI",2)
fill_NM1500_SPI_IO(e,t,2,false)
elseif o==1 and i==0 then
fill_NM1500_ACMP(e,t,2,0,"ACMP2_O",2)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,2,0)
end
a[49]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],4),2)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],1024),10)
e={}
e["pin_no"]="50"
e["texts"]={"P5.2","SPI2_MISO","ACMP1_O"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,5,2)
elseif o==0 and i==1 then
fill_NM1500_SPI(e,t,5,2,"SPI2_MISO",2)
fill_NM1500_SPI_IO(e,t,2,true)
elseif o==1 and i==0 then
fill_NM1500_ACMP(e,t,5,2,"ACMP1_O",1)
else
fill_invalid_GPIO(e,t,5,2)
end
a[50]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],2048),11)
e={}
e["pin_no"]="51"
e["texts"]={"SPI2_CLK","P5.3"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,5,3)
elseif o==0 and i==1 then
fill_NM1500_SPI(e,t,5,3,"SPI2_CLK",2)
else
fill_invalid_GPIO(e,t,5,3)
end
a[51]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],16),4)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],4096),12)
e={}
e["pin_no"]="52"
e["texts"]={"SPI2_SS","P5.4"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,5,4)
elseif i==0 and o==1 then
fill_NM1500_SPI(e,t,5,4,"SPI2_SS",2)
else
fill_invalid_GPIO(e,t,5,4)
end
a[52]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],32),5)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],8192),13)
e={}
e["pin_no"]="53"
e["texts"]={"CLKO","P5.5"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,5,5)
elseif o==0 and i==1 then
fill_NM1500_CLKO(e,t,5,5,"CLKO")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,5,5)
end
a[53]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],8),3)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],2048),11)
e={}
e["pin_no"]="54"
e["texts"]={"STADC","EPWM0_CH3","P0.3"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,0,3)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,0,3,"EPWM0_CH3",0,3)
elseif i==1 and o==1 then
fill_NM1500_ADC(e,t,0,3,"STADC")
else
fill_invalid_GPIO(e,t,0,3)
end
a[54]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],1024),10)
e={}
e["pin_no"]="55"
e["texts"]={"EPWM0_CH2","P0.2"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,0,2)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,0,2,"EPWM0_CH2",0,2)
else
fill_invalid_GPIO(e,t,0,2)
end
a[55]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],2),1)
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],512),9)
e={}
e["pin_no"]="56"
e["texts"]={"EPWM0_CH1","P0.1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,0,1)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,0,1,"EPWM0_CH1",0,1)
else
fill_invalid_GPIO(e,t,0,1)
end
a[56]=e
local i=ext.band(t["GCR_P0_MFP"],1)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],256),8)
e={}
e["pin_no"]="57"
e["texts"]={"EPWM0_CH0","P0.0"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,0,0)
elseif o==0 and i==1 then
fill_NM1500_EPWM(e,t,0,0,"EPWM0_CH0",0,0)
else
fill_invalid_GPIO(e,t,0,0)
end
a[57]=e
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],128),7)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],32768),15)
e={}
e["pin_no"]="58"
e["texts"]={"ACMP0_O","P8.7"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,8,7)
elseif o==0 and i==1 then
fill_NM1500_ACMP(e,t,8,7,"ACMP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,8,7)
end
a[58]=e
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],16384),14)
e={}
e["pin_no"]="59"
e["texts"]={"P8.6"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,8,6)
else
fill_invalid_GPIO(e,t,8,6)
end
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"VSS"}
fill_NM1500_Normal(e,t,nil,nil,"VSS")
a[60]=e
e={}
e["pin_no"]="61"
e["texts"]={"VDD"}
fill_NM1500_Normal(e,t,nil,nil,"VDD")
a[61]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],128),7)
local i=ext.rshift(ext.band(t["GCR_P6_MFP"],32768),15)
e={}
e["pin_no"]="62"
e["texts"]={"EADC0_CH7","P6.7"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,6,7)
elseif i==0 and o==1 then
fill_NM1500_ADC(e,t,6,7,"EADC0_CH7",0)
else
fill_invalid_GPIO(e,t,6,7)
end
a[62]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],64),6)
local i=ext.rshift(ext.band(t["GCR_P6_MFP"],16384),14)
e={}
e["pin_no"]="63"
e["texts"]={"EADC0_CH6","P6.6"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,6,6)
elseif i==0 and o==1 then
fill_NM1500_ADC(e,t,6,6,"EADC0_CH6",0)
else
fill_invalid_GPIO(e,t,6,6)
end
a[63]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],32),5)
local i=ext.rshift(ext.band(t["GCR_P6_MFP"],8192),13)
e={}
e["pin_no"]="64"
e["texts"]={"EADC0_CH5,ACMP1_P","P6.5"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,6,5)
elseif i==0 and o==1 then
fill_NM1500_Analog(e,t,6,5,"EADC0_CH5,ACMP1_P",{0},{1})
else
fill_invalid_GPIO(e,t,6,5)
end
a[64]=e
local i=ext.rshift(ext.band(t["GCR_P6_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],4096),12)
e={}
e["pin_no"]="65"
e["texts"]={"EADC0_CH4,ACMP1_N","P6.4"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,6,4)
elseif o==0 and i==1 then
fill_NM1500_Analog(e,t,6,4,"EADC0_CH4,ACMP1_N",{0},{1})
else
fill_invalid_GPIO(e,t,6,4)
end
a[65]=e
local i=ext.rshift(ext.band(t["GCR_P6_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],2048),11)
e={}
e["pin_no"]="66"
e["texts"]={"EADC0_CH3","P6.3"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,6,3)
elseif o==0 and i==1 then
fill_NM1500_ADC(e,t,6,3,"EADC0_CH3",0)
else
fill_invalid_GPIO(e,t,6,3)
end
a[66]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P6_MFP"],1024),10)
e={}
e["pin_no"]="67"
e["texts"]={"EADC0_CH2","P6.2"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,6,2)
elseif i==0 and o==1 then
fill_NM1500_ADC(e,t,6,2,"EADC0_CH2",0)
else
fill_invalid_GPIO(e,t,6,2)
end
a[67]=e
local i=ext.rshift(ext.band(t["GCR_P6_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],512),9)
e={}
e["pin_no"]="68"
e["texts"]={"EADC0_CH1","P6.1"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,6,1)
elseif o==0 and i==1 then
fill_NM1500_ADC(e,t,6,1,"EADC0_CH1",0)
else
fill_invalid_GPIO(e,t,6,1)
end
a[68]=e
local i=ext.band(t["GCR_P6_MFP"],1)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],256),8)
e={}
e["pin_no"]="69"
e["texts"]={"EADC0_CH0","P6.0"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,6,0)
elseif o==0 and i==1 then
fill_NM1500_ADC(e,t,6,0,"EADC0_CH0",0)
else
fill_invalid_GPIO(e,t,6,0)
end
a[69]=e
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],4),2)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],1024),10)
e={}
e["pin_no"]="70"
e["texts"]={"OP0_O","P8.2"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,8,2)
elseif o==0 and i==1 then
fill_NM1500_OPA(e,t,8,2,"OP0_O",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,8,2)
end
a[70]=e
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],512),9)
e={}
e["pin_no"]="71"
e["texts"]={"OP0_N","P8.1"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,8,1)
elseif o==0 and i==1 then
fill_NM1500_OPA(e,t,8,1,"OP0_N",0)
else
fill_invalid_GPIO(e,t,8,1)
end
a[71]=e
local o=ext.band(t["GCR_P8_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],256),8)
e={}
e["pin_no"]="72"
e["texts"]={"OP0_P","P8.0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,8,0)
elseif i==0 and o==1 then
fill_NM1500_OPA(e,t,8,0,"OP0_P",0)
else
fill_invalid_GPIO(e,t,8,0)
end
a[72]=e
e={}
e["pin_no"]="73"
e["texts"]={"AVSS"}
fill_NM1500_Normal(e,t,nil,nil,"AVSS")
a[73]=e
e={}
e["pin_no"]="74"
e["texts"]={"AVDD"}
fill_NM1500_Normal(e,t,nil,nil,"AVDD")
a[74]=e
e={}
e["pin_no"]="75"
e["texts"]={"VREF"}
fill_NM1500_Normal(e,t,nil,nil,"VREF")
a[75]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],128),7)
local i=ext.rshift(ext.band(t["GCR_P7_MFP"],32768),15)
e={}
e["pin_no"]="76"
e["texts"]={"EADC1_CH7","P7.7"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,7,7)
elseif i==0 and o==1 then
fill_NM1500_ADC(e,t,7,7,"EADC1_CH7",1)
else
fill_invalid_GPIO(e,t,7,7)
end
a[76]=e
local i=ext.rshift(ext.band(t["GCR_P7_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],16384),14)
e={}
e["pin_no"]="77"
e["texts"]={"EADC1_CH6","P7.6"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,7,6)
elseif o==0 and i==1 then
fill_NM1500_ADC(e,t,7,6,"EADC1_CH6",1)
else
fill_invalid_GPIO(e,t,7,6)
end
a[77]=e
local i=ext.rshift(ext.band(t["GCR_P7_MFP"],32),5)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],8192),13)
e={}
e["pin_no"]="78"
e["texts"]={"EADC1_CH5,ACMP2_P","P7.5"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,7,5)
elseif o==0 and i==1 then
fill_NM1500_Analog(e,t,7,5,"EADC1_CH5,ACMP2_P",{1},{2})
else
fill_invalid_GPIO(e,t,7,5)
end
a[78]=e
local i=ext.rshift(ext.band(t["GCR_P7_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],4096),12)
e={}
e["pin_no"]="79"
e["texts"]={"EADC1_CH4,ACMP2_N","P7.4"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,7,4)
elseif o==0 and i==1 then
fill_NM1500_Analog(e,t,7,4,"EADC1_CH4,ACMP2_N",{1},{2})
else
fill_invalid_GPIO(e,t,7,4)
end
a[79]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],8),3)
local i=ext.rshift(ext.band(t["GCR_P7_MFP"],2048),11)
e={}
e["pin_no"]="80"
e["texts"]={"EADC1_CH3","P7.3"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,7,3)
elseif i==0 and o==1 then
fill_NM1500_ADC(e,t,7,3,"EADC1_CH3",1)
else
fill_invalid_GPIO(e,t,7,3)
end
a[80]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P7_MFP"],1024),10)
e={}
e["pin_no"]="81"
e["texts"]={"EADC1_CH2","P7.2"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,7,2)
elseif i==0 and o==1 then
fill_NM1500_ADC(e,t,7,2,"EADC1_CH2",1)
else
fill_invalid_GPIO(e,t,7,2)
end
a[81]=e
local i=ext.rshift(ext.band(t["GCR_P7_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],512),9)
e={}
e["pin_no"]="82"
e["texts"]={"EADC1_CH1","P7.1"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,7,1)
elseif o==0 and i==1 then
fill_NM1500_ADC(e,t,7,1,"EADC1_CH1",1)
else
fill_invalid_GPIO(e,t,7,1)
end
a[82]=e
local i=ext.band(t["GCR_P7_MFP"],1)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],256),8)
e={}
e["pin_no"]="83"
e["texts"]={"EADC1_CH0","P7.0"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,7,0)
elseif o==0 and i==1 then
fill_NM1500_ADC(e,t,7,0,"EADC1_CH0",1)
else
fill_invalid_GPIO(e,t,7,0)
end
a[83]=e
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],4096),12)
e={}
e["pin_no"]="84"
e["texts"]={"ACMP0_P","P8.4"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,8,4)
elseif o==0 and i==1 then
fill_NM1500_ACMP(e,t,8,4,"ACMP0_P",0)
else
fill_invalid_GPIO(e,t,8,4)
end
a[84]=e
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],8),3)
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],2048),11)
e={}
e["pin_no"]="85"
e["texts"]={"ACMP0_N","P8.3"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,8,3)
elseif i==0 and o==1 then
fill_NM1500_ACMP(e,t,8,3,"ACMP0_N",0)
else
fill_invalid_GPIO(e,t,8,3)
end
a[85]=e
local o=ext.band(t["GCR_P9_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],256),8)
e={}
e["pin_no"]="86"
e["texts"]={"OP1_O","P9.0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,9,0)
elseif i==0 and o==1 then
fill_NM1500_OPA(e,t,9,0,"OP1_O",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,9,0)
end
a[86]=e
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],2),1)
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],512),9)
e={}
e["pin_no"]="87"
e["texts"]={"OP1_N","P9.1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,9,1)
elseif i==0 and o==1 then
fill_NM1500_OPA(e,t,9,1,"OP1_N",1)
else
fill_invalid_GPIO(e,t,9,1)
end
a[87]=e
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],1024),10)
e={}
e["pin_no"]="88"
e["texts"]={"OP1_P","P9.2"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,9,2)
elseif i==0 and o==1 then
fill_NM1500_OPA(e,t,9,2,"OP1_P",1)
else
fill_invalid_GPIO(e,t,9,2)
end
a[88]=e
e={}
e["pin_no"]="89"
e["texts"]={"VDD"}
fill_NM1500_Normal(e,t,nil,nil,"VDD")
a[89]=e
e={}
e["pin_no"]="90"
e["texts"]={"VSS"}
fill_NM1500_Normal(e,t,nil,nil,"VSS")
a[90]=e
local i=ext.rshift(ext.band(t["GCR_P8_MFP"],32),5)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],8192),13)
e={}
e["pin_no"]="91"
e["texts"]={"P8.5"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,8,5)
else
fill_invalid_GPIO(e,t,8,5)
end
a[91]=e
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],8),3)
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],2048),11)
e={}
e["pin_no"]="92"
e["texts"]={"EPWM1_BRAKE1","P9.3"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,9,3)
elseif i==0 and o==1 then
fill_NM1500_EPWM(e,t,9,3,"EPWM1_BRAKE1",1)
else
fill_invalid_GPIO(e,t,9,3)
end
a[92]=e
e={}
e["pin_no"]="93"
e["texts"]={"nRESET"}
fill_NM1500_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[93]=e
e={}
e["pin_no"]="94"
e["texts"]={"XT1_OUT"}
fill_NM1500_Normal(e,t,nil,nil,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
a[94]=e
e={}
e["pin_no"]="95"
e["texts"]={"XT1_IN"}
fill_NM1500_Normal(e,t,nil,nil,"XT1_IN")
e["direction"]=kPinDirection_In
a[95]=e
e={}
e["pin_no"]="96"
e["texts"]={"ICE_DAT"}
fill_NM1500_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[96]=e
e={}
e["pin_no"]="97"
e["texts"]={"ICE_CLK"}
fill_NM1500_Normal(e,t,nil,nil,"ICE_CLK")
e["direction"]=kPinDirection_In
a[97]=e
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],4096),12)
e={}
e["pin_no"]="98"
e["texts"]={"SPI1_CLK","P9.4"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,9,4)
elseif o==0 and i==1 then
fill_NM1500_SPI(e,t,9,4,"SPI1_CLK",1)
else
fill_invalid_GPIO(e,t,9,4)
end
a[98]=e
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],32),5)
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],8192),13)
e={}
e["pin_no"]="99"
e["texts"]={"SPI1_MISO","P9.5"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,9,5)
elseif i==0 and o==1 then
fill_NM1500_SPI(e,t,9,5,"SPI1_MISO",1)
fill_NM1500_SPI_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,9,5)
end
a[99]=e
local i=ext.rshift(ext.band(t["GCR_P9_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],16384),14)
e={}
e["pin_no"]="100"
e["texts"]={"SPI1_MOSI","P9.6"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,9,6)
elseif o==0 and i==1 then
fill_NM1500_SPI(e,t,9,6,"SPI1_MOSI",1)
fill_NM1500_SPI_IO(e,t,1,false)
else
fill_invalid_GPIO(e,t,9,6)
end
a[100]=e
return{name=n,information="",pins=a}
end
