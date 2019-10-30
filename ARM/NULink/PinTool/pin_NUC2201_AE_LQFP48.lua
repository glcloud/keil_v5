local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC200.lua")
function get_chip_status_NUC2201_AE_LQFP48(r,o,e,t)
local a={}
local t=read_NUC200_Registers(r,o,e,t)
local e
e={}
e["pin_no"]="1"
e["texts"]={"VBAT"}
fill_NUC200_Normal(e,t,nil,nil,"VBAT")
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"X32_OUT"}
fill_NUC200_Normal(e,t,nil,nil,"X32_OUT")
e["direction"]=kPinDirection_PushPullOut
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"X32_IN"}
fill_NUC200_Normal(e,t,nil,nil,"X32_IN")
e["direction"]=kPinDirection_In
a[3]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],2048),11)
e={}
e["pin_no"]="4"
e["texts"]={"PA.11","I2C1_SCL","nRD"}
if i==0 and o==0 then
fill_NUC200_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC200_I2C(e,t,"A",11,"I2C1_SCL",1,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC200_EBI(e,t,"A",11,"nRD","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",11,"GCR_ALT_MFP")
end
a[4]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],1024),10)
e={}
e["pin_no"]="5"
e["texts"]={"PA.10","I2C1_SDA","nWR"}
if i==0 and o==0 then
fill_NUC200_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC200_I2C(e,t,"A",10,"I2C1_SDA",1,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC200_EBI(e,t,"A",10,"nWR","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",10,"GCR_ALT_MFP")
end
a[5]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],512),9)
e={}
e["pin_no"]="6"
e["texts"]={"PA.9","I2C0_SCL"}
if o==0 then
fill_NUC200_GPIO(e,t,"A",9,nil)
elseif o==1 then
fill_NUC200_I2C(e,t,"A",9,"I2C0_SCL",0)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],256),8)
e={}
e["pin_no"]="7"
e["texts"]={"PA.8","I2C0_SDA"}
if o==0 then
fill_NUC200_GPIO(e,t,"A",8,nil)
elseif o==1 then
fill_NUC200_I2C(e,t,"A",8,"I2C0_SDA",0)
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16),4)
e={}
e["pin_no"]="8"
e["texts"]={"PB.4","UART1_RXD"}
if o==0 then
fill_NUC200_GPIO(e,t,"B",4,nil)
elseif o==1 then
fill_NUC200_UART(e,t,"B",4,"UART1_RXD",1)
e["direction"]=kPinDirection_In
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],32),5)
e={}
e["pin_no"]="9"
e["texts"]={"PB.5","UART1_TXD"}
if o==0 then
fill_NUC200_GPIO(e,t,"B",5,nil)
elseif o==1 then
fill_NUC200_UART(e,t,"B",5,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"LDO_CAP"}
fill_NUC200_Normal(e,t,nil,nil,"LDO_CAP")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VDD"}
fill_NUC200_Normal(e,t,nil,nil,"VDD")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"VSS"}
fill_NUC200_Normal(e,t,nil,nil,"VSS")
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"USB_VBUS"}
fill_NUC200_Normal(e,t,nil,nil,"USB_VBUS")
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"USB_VDD33_CAP"}
fill_NUC200_Normal(e,t,nil,nil,"USB_VDD33_CAP")
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"USB_D-"}
fill_NUC200_USB(e,t,"USB_D-")
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"USB_D+"}
fill_NUC200_USB(e,t,"USB_D+")
a[16]=e
local o=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="17"
e["texts"]={"PB.0","UART0_RXD"}
if o==0 then
fill_NUC200_GPIO(e,t,"B",0,nil)
elseif o==1 then
fill_NUC200_UART(e,t,"B",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],2),1)
e={}
e["pin_no"]="18"
e["texts"]={"PB.1","UART0_TXD"}
if o==0 then
fill_NUC200_GPIO(e,t,"B",1,nil)
elseif o==1 then
fill_NUC200_UART(e,t,"B",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
end
a[18]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],8192),13)
local h=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP2"],16),4)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],67108864),26)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],4),2)
e={}
e["pin_no"]="19"
e["texts"]={"PB.2","UART0_nRTS","TM2_EXT","TM2","nWRL"}
if s==0 and h==0 and n==0 and i==0 and o==0 then
fill_NUC200_GPIO(e,t,"B",2,nil,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif s==0 and h==0 and n==0 and i==0 and o==1 then
fill_NUC200_UART(e,t,"B",2,"UART0_nRTS",0,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif s==0 and h==0 and n==0 and i==1 and o==1 then
fill_NUC200_TM(e,t,"B",2,"TM2_EXT",2,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif s==0 and h==0 and n==1 and i==0 and o==1 then
fill_NUC200_TM(e,t,"B",2,"TM2",2,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif s==1 and h==1 and n==0 and i==0 and o==1 then
fill_NUC200_EBI(e,t,"B",2,"nWRL","GCR_ALT_MFP","GCR_ALT_MFP2")
else
fill_invalid_GPIO(e,t,"B",2,"GCR_ALT_MFP","GCR_ALT_MFP2")
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],16384),14)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP2"],32),5)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],134217728),27)
local h=ext.rshift(ext.band(t["GCR_GPB_MFP"],8),3)
e={}
e["pin_no"]="20"
e["texts"]={"PB.3","UART0_nCTS","TM3_EXT","TM3","nWRH"}
if o==0 and i==0 and s==0 and n==0 and h==0 then
fill_NUC200_GPIO(e,t,"B",3,nil,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif o==0 and i==0 and s==0 and n==0 and h==1 then
fill_NUC200_UART(e,t,"B",3,"UART0_nCTS",0,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif o==0 and i==0 and s==0 and n==1 and h==1 then
fill_NUC200_TM(e,t,"B",3,"TM3_EXT",3,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif o==0 and i==0 and s==1 and n==0 and h==1 then
fill_NUC200_TM(e,t,"B",3,"TM3",3,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif o==1 and i==1 and s==0 and n==0 and h==1 then
fill_NUC200_EBI(e,t,"B",3,"nWRH","GCR_ALT_MFP","GCR_ALT_MFP2")
else
fill_invalid_GPIO(e,t,"B",3,"GCR_ALT_MFP","GCR_ALT_MFP2")
end
a[20]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],8),3)
e={}
e["pin_no"]="21"
e["texts"]={"PC.3","SPI0_MOSI0"}
if o==0 then
fill_NUC200_GPIO(e,t,"C",3,nil)
elseif o==1 then
fill_NUC200_SPI(e,t,"C",3,"SPI0_MOSI0",0)
fill_NUC200_SPI_IO(e,t,0,false)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],4),2)
e={}
e["pin_no"]="22"
e["texts"]={"PC.2","SPI0_MISO0"}
if o==0 then
fill_NUC200_GPIO(e,t,"C",2,nil)
elseif o==1 then
fill_NUC200_SPI(e,t,"C",2,"SPI0_MISO0",0)
fill_NUC200_SPI_IO(e,t,0,true)
end
a[22]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2),1)
e={}
e["pin_no"]="23"
e["texts"]={"PC.1","SPI0_CLK"}
if o==0 then
fill_NUC200_GPIO(e,t,"C",1,nil)
elseif o==1 then
fill_NUC200_SPI(e,t,"C",1,"SPI0_CLK",0)
end
a[23]=e
local o=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="24"
e["texts"]={"PC.0","SPI0_SS0"}
if o==0 then
fill_NUC200_GPIO(e,t,"C",0,nil)
elseif o==1 then
fill_NUC200_SPI(e,t,"C",0,"SPI0_SS0",0)
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],32768),15)
e={}
e["pin_no"]="25"
e["texts"]={"PWM3","PA.15"}
if o==0 then
fill_NUC200_GPIO(e,t,"A",15,nil)
elseif o==1 then
fill_NUC200_PWM(e,t,"A",15,"PWM3")
end
a[25]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],8388608),23)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],16384),14)
e={}
e["pin_no"]="26"
e["texts"]={"AD15","PWM2","PA.14"}
if i==0 and n==0 and o==0 then
fill_NUC200_GPIO(e,t,"A",14,nil,"GCR_ALT_MFP")
elseif i==0 and n==0 and o==1 then
fill_NUC200_PWM(e,t,"A",14,"PWM2","GCR_ALT_MFP")
elseif i==1 and n==1 and o==1 then
fill_NUC200_EBI(e,t,"A",14,"AD15","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",14,"GCR_ALT_MFP")
end
a[26]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],4194304),22)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local n=ext.rshift(ext.band(t["GCR_GPA_MFP"],8192),13)
e={}
e["pin_no"]="27"
e["texts"]={"AD14","PWM1","PA.13"}
if i==0 and o==0 and n==0 then
fill_NUC200_GPIO(e,t,"A",13,nil,"GCR_ALT_MFP")
elseif i==0 and o==0 and n==1 then
fill_NUC200_PWM(e,t,"A",13,"PWM1","GCR_ALT_MFP")
elseif i==1 and o==1 and n==1 then
fill_NUC200_EBI(e,t,"A",13,"AD14","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",13,"GCR_ALT_MFP")
end
a[27]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2097152),21)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],4096),12)
e={}
e["pin_no"]="28"
e["texts"]={"AD13","PWM0","PA.12"}
if n==0 and i==0 and o==0 then
fill_NUC200_GPIO(e,t,"A",12,nil,"GCR_ALT_MFP")
elseif n==0 and i==0 and o==1 then
fill_NUC200_PWM(e,t,"A",12,"PWM0","GCR_ALT_MFP")
elseif n==1 and i==1 and o==1 then
fill_NUC200_EBI(e,t,"A",12,"AD13","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",12,"GCR_ALT_MFP")
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"ICE_DAT"}
fill_NUC200_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"ICE_CLK"}
fill_NUC200_Normal(e,t,nil,nil,"ICE_CLK")
e["direction"]=kPinDirection_In
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"AVSS"}
fill_NUC200_Normal(e,t,nil,nil,"AVSS")
a[31]=e
local o=ext.band(t["GCR_GPA_MFP"],1)
e={}
e["pin_no"]="32"
e["texts"]={"ADC0","PA.0"}
if o==0 then
fill_NUC200_GPIO(e,t,"A",0,nil)
elseif o==1 then
fill_NUC200_ADC(e,t,"A",0,"ADC0")
end
a[32]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],1048576),20)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],2),1)
e={}
e["pin_no"]="33"
e["texts"]={"AD12","ADC1","PA.1"}
if n==0 and o==0 and i==0 then
fill_NUC200_GPIO(e,t,"A",1,nil,"GCR_ALT_MFP")
elseif n==0 and o==0 and i==1 then
fill_NUC200_ADC(e,t,"A",1,"ADC1","GCR_ALT_MFP")
elseif n==1 and o==1 and i==1 then
fill_NUC200_EBI(e,t,"A",1,"AD12","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",1,"GCR_ALT_MFP")
end
a[33]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],524288),19)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],4),2)
e={}
e["pin_no"]="34"
e["texts"]={"AD11","ADC2","PA.2"}
if n==0 and i==0 and o==0 then
fill_NUC200_GPIO(e,t,"A",2,nil,"GCR_ALT_MFP")
elseif n==0 and i==0 and o==1 then
fill_NUC200_ADC(e,t,"A",2,"ADC2","GCR_ALT_MFP")
elseif n==1 and i==1 and o==1 then
fill_NUC200_EBI(e,t,"A",2,"AD11","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",2,"GCR_ALT_MFP")
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],262144),18)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local n=ext.rshift(ext.band(t["GCR_GPA_MFP"],8),3)
e={}
e["pin_no"]="35"
e["texts"]={"AD10","ADC3","PA.3"}
if o==0 and i==0 and n==0 then
fill_NUC200_GPIO(e,t,"A",3,nil,"GCR_ALT_MFP")
elseif o==0 and i==0 and n==1 then
fill_NUC200_ADC(e,t,"A",3,"ADC3","GCR_ALT_MFP")
elseif o==1 and i==1 and n==1 then
fill_NUC200_EBI(e,t,"A",3,"AD10","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",3,"GCR_ALT_MFP")
end
a[35]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],131072),17)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],16),4)
e={}
e["pin_no"]="36"
e["texts"]={"AD9","ADC4","PA.4"}
if i==0 and n==0 and o==0 then
fill_NUC200_GPIO(e,t,"A",4,nil,"GCR_ALT_MFP")
elseif i==0 and n==0 and o==1 then
fill_NUC200_ADC(e,t,"A",4,"ADC4","GCR_ALT_MFP")
elseif i==1 and n==1 and o==1 then
fill_NUC200_EBI(e,t,"A",4,"AD9","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",4,"GCR_ALT_MFP")
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],65536),16)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],32),5)
e={}
e["pin_no"]="37"
e["texts"]={"AD8","ADC5","PA.5"}
if o==0 and n==0 and i==0 then
fill_NUC200_GPIO(e,t,"A",5,nil,"GCR_ALT_MFP")
elseif o==0 and n==0 and i==1 then
fill_NUC200_ADC(e,t,"A",5,"ADC5","GCR_ALT_MFP")
elseif o==1 and n==1 and i==1 then
fill_NUC200_EBI(e,t,"A",5,"AD8","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",5,"GCR_ALT_MFP")
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],64),6)
e={}
e["pin_no"]="38"
e["texts"]={"AD7","ADC6","PA.6"}
if o==0 and i==0 then
fill_NUC200_GPIO(e,t,"A",6,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC200_ADC(e,t,"A",6,"ADC6","GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC200_EBI(e,t,"A",6,"AD7","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",6,"GCR_ALT_MFP")
end
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"VREF"}
fill_NUC200_Normal(e,t,nil,nil,"VREF")
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"AVDD"}
fill_NUC200_Normal(e,t,nil,nil,"AVDD")
a[40]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],128),7)
e={}
e["pin_no"]="41"
e["texts"]={"AD5","ADC7","PC.7"}
if o==0 and i==0 then
fill_NUC200_GPIO(e,t,"C",7,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC200_ADC(e,t,"C",7,"ADC7","GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC200_EBI(e,t,"C",7,"AD5","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",7,"GCR_ALT_MFP")
end
a[41]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],64),6)
e={}
e["pin_no"]="42"
e["texts"]={"AD4","ADC8","PC.6"}
if i==0 and o==0 then
fill_NUC200_GPIO(e,t,"C",6,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC200_ADC(e,t,"C",6,"ADC8","GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC200_EBI(e,t,"C",6,"AD4","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",6,"GCR_ALT_MFP")
end
a[42]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP2"],2),1)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],16777216),24)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP2"],4),2)
local n=ext.rshift(ext.band(t["GCR_GPB_MFP"],32768),15)
e={}
e["pin_no"]="43"
e["texts"]={"AD6","ADC11","TM0","TM0_EXT","INT1","PB.15"}
if i==0 and o==0 and s==0 and n==0 then
fill_NUC200_GPIO(e,t,"B",15,nil,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif i==0 and o==0 and s==0 and n==1 then
fill_NUC200_Normal(e,t,"B",15,"INT1","GCR_ALT_MFP","GCR_ALT_MFP2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif i==0 and o==1 and s==0 and n==1 then
fill_NUC200_TM(e,t,"B",15,"TM0_EXT",0,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif i==0 and o==0 and s==1 and n==1 then
fill_NUC200_TM(e,t,"B",15,"TM0",0,"GCR_ALT_MFP","GCR_ALT_MFP2")
elseif i==0 and o==1 and s==0 and n==0 then
fill_NUC200_ADC(e,t,"B",15,"ADC11","GCR_ALT_MFP","GCR_ALT_MFP2")
elseif i==1 and o==0 and s==0 and n==1 then
fill_NUC200_EBI(e,t,"B",15,"AD6","GCR_ALT_MFP","GCR_ALT_MFP2")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",15,"GCR_ALT_MFP","GCR_ALT_MFP2")
end
a[43]=e
local o=ext.band(t["GCR_GPF_MFP"],1)
e={}
e["pin_no"]="44"
e["texts"]={"XT1_OUT","PF.0"}
if o==0 then
fill_NUC200_GPIO(e,t,"F",0,nil)
elseif o==1 then
fill_NUC200_Normal(e,t,"F",0,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],2),1)
e={}
e["pin_no"]="45"
e["texts"]={"XT1_IN","PF.1"}
if o==0 then
fill_NUC200_GPIO(e,t,"F",1,nil)
elseif o==1 then
fill_NUC200_Normal(e,t,"F",1,"XT1_IN")
e["direction"]=kPinDirection_In
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"nRESET"}
fill_NUC200_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"PVSS"}
fill_NUC200_Normal(e,t,nil,nil,"PVSS")
a[47]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],536870912),29)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],256),8)
e={}
e["pin_no"]="48"
e["texts"]={"CLKO","TM0","STADC","PB.8"}
if o==0 and i==0 then
fill_NUC200_GPIO(e,t,"B",8,nil,"GCR_ALT_MFP")
elseif o==1 and i==0 then
fill_NUC200_ADC(e,t,"B",8,"STADC","GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC200_TM(e,t,"B",8,"TM0",0,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC200_CLKO(e,t,"B",8,"CLKO","GCR_ALT_MFP")
end
a[48]=e
return{name=r,information="",pins=a}
end