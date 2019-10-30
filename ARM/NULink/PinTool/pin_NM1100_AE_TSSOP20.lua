local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Mini51.lua")
function get_chip_status_NM1100_AE_TSSOP20(s,e,e)
local a={}
local t=read_Mini51_Registers()
local e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],32),5)
e={}
e["pin_no"]="4"
e["texts"]={"P1.5","ADC_CH5","ACMP0_P0","UART1_TXD"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,5)
elseif i==0 and o==1 then
fill_Mini51_ADC(e,t,1,5,"ADC_CH5")
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,1,5,"ACMP0_P0")
elseif i==1 and o==0 then
fill_Mini51_UART(e,t,1,5,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"/RESET"}
fill_Mini51_Normal(e,t,nil,nil,"/RESET")
e["direction"]=kPinDirection_In
a[5]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],256),8)
local o=ext.band(t["GCR_P3_MFP"],1)
e={}
e["pin_no"]="6"
e["texts"]={"P3.0","ADC_CH6","ACMP1_N"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,0)
elseif i==1 and o==1 then
fill_Mini51_ADC(e,t,3,0,"ADC_CH6")
elseif i==1 and o==0 then
fill_Mini51_ACMP(e,t,3,0,"ACMP1_N")
else
fill_invalid_GPIO(e,t,3,0)
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
local n=ext.band(ext.rshift(t["ADC_ADCHER"],12),1)
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],64),6)
e={}
e["pin_no"]="8"
e["texts"]={"P3.6","ACMP0_O","CLKO","TM1_EXT","ADC_CH11"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,6)
elseif n==0 and i==1 and o==1 then
fill_Mini51_ACMP(e,t,3,6,"ACMP0_O","ADC_ADCHER")
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==0 then
fill_Mini51_CKO(e,t,3,6,"CLKO")
elseif i==0 and o==1 then
fill_Mini51_TM(e,t,3,6,"TM1_EXT",1)
elseif n==1 and i==1 and o==1 then
fill_Mini51_ADC(e,t,3,6,"ADC_CH11","ADC_ADCHER")
end
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"VSS"}
fill_Mini51_Normal(e,t,nil,nil,"VSS")
a[9]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],1024),10)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],4),2)
e={}
e["pin_no"]="10"
e["texts"]={"P2.2","PWM0_CH0"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,2)
elseif o==1 and i==0 then
fill_Mini51_PWM(e,t,2,2,"PWM0_CH0",0)
else
fill_invalid_GPIO(e,t,2,2)
end
a[10]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8),3)
e={}
e["pin_no"]="11"
e["texts"]={"PWM0_CH1","P2.3"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,3)
elseif i==1 and o==0 then
fill_Mini51_PWM(e,t,2,3,"PWM0_CH1",1)
else
fill_invalid_GPIO(e,t,2,3)
end
a[11]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],16),4)
e={}
e["pin_no"]="12"
e["texts"]={"UART1_RXD","PWM0_CH2","P2.4"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,4)
elseif i==1 and o==0 then
fill_Mini51_PWM(e,t,2,4,"PWM0_CH2",2)
elseif i==1 and o==1 then
fill_Mini51_UART(e,t,2,4,"UART1_RXD",1)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,2,4)
end
a[12]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32),5)
e={}
e["pin_no"]="13"
e["texts"]={"UART1_TXD","PWM0_CH3","P2.5"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,5)
elseif o==1 and i==0 then
fill_Mini51_PWM(e,t,2,5,"PWM0_CH3",3)
elseif o==1 and i==1 then
fill_Mini51_UART(e,t,2,5,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,2,5)
end
a[13]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],64),6)
e={}
e["pin_no"]="14"
e["texts"]={"ACMP1_O0","PWM0_CH4","P2.6"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,6)
elseif i==1 and o==0 then
fill_Mini51_PWM(e,t,2,6,"PWM0_CH4",4)
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,2,6,"ACMP1_O0")
else
fill_invalid_GPIO(e,t,2,6)
end
a[14]=e
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],64),6)
e={}
e["pin_no"]="15"
e["texts"]={"ICE_CLK","P4.6"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,4,6)
elseif i==0 and o==1 then
fill_Mini51_Normal(e,t,4,6,"ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,4,6)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_P4_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_P4_MFP"],128),7)
e={}
e["pin_no"]="16"
e["texts"]={"ICE_DAT","P4.7"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,4,7)
elseif o==0 and i==1 then
fill_Mini51_Normal(e,t,4,7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,4,7)
end
a[16]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],16),4)
e={}
e["pin_no"]="17"
e["texts"]={"PWM0_CH5","SPI0_SS","P0.4"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,4)
elseif i==1 and o==0 then
fill_Mini51_SPI(e,t,0,4,"SPI0_SS",0)
elseif i==1 and o==1 then
fill_Mini51_PWM(e,t,0,4,"PWM0_CH5",5)
else
fill_invalid_GPIO(e,t,0,4)
end
a[17]=e
local i=ext.rshift(ext.band(t["GCR_P0_MFP"],256),8)
local o=ext.band(t["GCR_P0_MFP"],1)
e={}
e["pin_no"]="18"
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
a[18]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],8),3)
e={}
e["pin_no"]="19"
e["texts"]={"ADC_CH0","P5.3"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,3)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,5,3,"ADC_CH0")
else
fill_invalid_GPIO(e,t,5,3)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"VDD"}
fill_Mini51_Normal(e,t,nil,nil,"VDD")
a[20]=e
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],256),8)
local o=ext.band(t["GCR_P1_MFP"],1)
e={}
e["pin_no"]="1"
e["texts"]={"P1.0","ADC_CH1","ACMP0_P1"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,0)
elseif i==0 and o==1 then
fill_Mini51_ADC(e,t,1,0,"ADC_CH1")
elseif i==1 and o==1 then
fill_Mini51_ACMP(e,t,1,0,"ACMP0_P1")
else
fill_invalid_GPIO(e,t,1,0)
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],8),3)
e={}
e["pin_no"]="2"
e["texts"]={"P1.3","ADC_CH3","UART0_TXD","ACMP0_P3"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,3)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,1,3,"ADC_CH3")
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,1,3,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,1,3,"ACMP0_P3")
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
e={}
e["pin_no"]="3"
e["texts"]={"P1.4","ADC_CH4","ACMP0_N","UART1_RXD"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,4)
elseif o==0 and i==1 then
fill_Mini51_ADC(e,t,1,4,"ADC_CH4")
elseif o==1 and i==1 then
fill_Mini51_ACMP(e,t,1,4,"ACMP0_N")
elseif o==1 and i==0 then
fill_Mini51_UART(e,t,1,4,"UART1_RXD",1)
e["direction"]=kPinDirection_In
end
a[3]=e
return{name=s,information="",pins=a}
end
