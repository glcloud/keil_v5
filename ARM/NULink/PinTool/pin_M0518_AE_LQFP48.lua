local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC131.lua")
function get_chip_status_M0518_AE_LQFP48(r,e,t,o)
local a={}
local t=read_NUC131_Registers(r,e,t,o)
local e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],2097152),21)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],4096),12)
e={}
e["pin_no"]="1"
e["texts"]={"PB.12","CLKO","BPWM1_CH3"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"B",12,nil,"GCR_ALT_MFP3")
elseif i==0 and o==1 then
fill_NUC131_CLKO(e,t,"B",12,"CLKO","GCR_ALT_MFP3")
elseif i==1 and o==1 then
fill_NUC131_BPWM(e,t,"B",12,"BPWM1_CH3",1,3,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"B",12,"GCR_ALT_MFP3")
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPF_MFP"],32),5)
e={}
e["pin_no"]="2"
e["texts"]={"PF.5","I2C0_SCL","PWM1_CH5"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"F",5,nil,"GCR_ALT_MFP3")
elseif o==0 and i==1 then
fill_NUC131_I2C(e,t,"F",5,"I2C0_SCL",0,"GCR_ALT_MFP3")
elseif o==1 and i==1 then
fill_NUC131_PWM(e,t,"F",5,"PWM1_CH5",1,5,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"F",5,"GCR_ALT_MFP3")
end
a[2]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],1024),10)
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],16),4)
e={}
e["pin_no"]="3"
e["texts"]={"PF.4","I2C0_SDA","PWM1_CH4"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"F",4,nil,"GCR_ALT_MFP3")
elseif i==0 and o==1 then
fill_NUC131_I2C(e,t,"F",4,"I2C0_SDA",0,"GCR_ALT_MFP3")
elseif i==1 and o==1 then
fill_NUC131_PWM(e,t,"F",4,"PWM1_CH4",1,4,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"F",4,"GCR_ALT_MFP3")
end
a[3]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],512),9)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],2048),11)
e={}
e["pin_no"]="4"
e["texts"]={"PA.11","I2C1_SCL","PWM1_CH3"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP3")
elseif i==0 and o==1 then
fill_NUC131_I2C(e,t,"A",11,"I2C1_SCL",1,"GCR_ALT_MFP3")
elseif i==1 and o==1 then
fill_NUC131_PWM(e,t,"A",11,"PWM1_CH3",1,3,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"A",11,"GCR_ALT_MFP3")
end
a[4]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],256),8)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],1024),10)
e={}
e["pin_no"]="5"
e["texts"]={"PA.10","I2C1_SDA","PWM1_CH2"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP3")
elseif o==0 and i==1 then
fill_NUC131_I2C(e,t,"A",10,"I2C1_SDA",1,"GCR_ALT_MFP3")
elseif o==1 and i==1 then
fill_NUC131_PWM(e,t,"A",10,"PWM1_CH2",1,2,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"A",10,"GCR_ALT_MFP3")
end
a[5]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP4"],2),1)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],512),9)
e={}
e["pin_no"]="6"
e["texts"]={"PA.9","I2C0_SCL","UART1_nCTS"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"A",9,nil,"GCR_ALT_MFP4")
elseif i==0 and o==1 then
fill_NUC131_I2C(e,t,"A",9,"I2C0_SCL",0,"GCR_ALT_MFP4")
elseif i==1 and o==1 then
fill_NUC131_UART(e,t,"A",9,"UART1_nCTS",1,"GCR_ALT_MFP4")
else
fill_invalid_GPIO(e,t,"A",9,"GCR_ALT_MFP4")
end
a[6]=e
local i=ext.band(t["GCR_ALT_MFP4"],1)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],256),8)
e={}
e["pin_no"]="7"
e["texts"]={"PA.8","I2C0_SDA","UART1_nRTS"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"A",8,nil,"GCR_ALT_MFP4")
elseif i==0 and o==1 then
fill_NUC131_I2C(e,t,"A",8,"I2C0_SDA",0,"GCR_ALT_MFP4")
elseif i==1 and o==1 then
fill_NUC131_UART(e,t,"A",8,"UART1_nRTS",1,"GCR_ALT_MFP4")
else
fill_invalid_GPIO(e,t,"A",8,"GCR_ALT_MFP4")
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16),4)
e={}
e["pin_no"]="8"
e["texts"]={"PB.4","UART1_RXD"}
if o==0 then
fill_NUC131_GPIO(e,t,"B",4,nil)
elseif o==1 then
fill_NUC131_UART(e,t,"B",4,"UART1_RXD",1)
e["direction"]=kPinDirection_In
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],32),5)
e={}
e["pin_no"]="9"
e["texts"]={"PB.5","UART1_TXD"}
if o==0 then
fill_NUC131_GPIO(e,t,"B",5,nil)
elseif o==1 then
fill_NUC131_UART(e,t,"B",5,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"LDO_CAP"}
fill_NUC131_Normal(e,t,nil,nil,"LDO_CAP")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VDD"}
fill_NUC131_Normal(e,t,nil,nil,"VDD")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"VSS"}
fill_NUC131_Normal(e,t,nil,nil,"VSS")
a[12]=e
local o=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="13"
e["texts"]={"PB.0","UART0_RXD"}
if o==0 then
fill_NUC131_GPIO(e,t,"B",0,nil)
elseif o==1 then
fill_NUC131_UART(e,t,"B",0,"UART0_RXD",0)
e["direction"]=kPinDirection_In
end
a[13]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],2),1)
e={}
e["pin_no"]="14"
e["texts"]={"PB.1","UART0_TXD"}
if o==0 then
fill_NUC131_GPIO(e,t,"B",1,nil)
elseif o==1 then
fill_NUC131_UART(e,t,"B",1,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
end
a[14]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP2"],16),4)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],2147483648),31)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],67108864),26)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],4),2)
e={}
e["pin_no"]="15"
e["texts"]={"PB.2","UART0_nRTS","TM2_EXT","TM2","PWM1_BRAKE1"}
if s==0 and i==0 and n==0 and o==0 then
fill_NUC131_GPIO(e,t,"B",2,nil,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==0 and i==0 and n==0 and o==1 then
fill_NUC131_UART(e,t,"B",2,"UART0_nRTS",0,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==0 and i==0 and n==1 and o==1 then
fill_NUC131_TM(e,t,"B",2,"TM2_EXT",2,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==1 and i==0 and n==0 and o==1 then
fill_NUC131_TM(e,t,"B",2,"TM2",2,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==0 and i==1 and n==0 and o==1 then
fill_NUC131_PWM(e,t,"B",2,"PWM1_BRAKE1",1,nil,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"B",2,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
end
a[15]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP2"],32),5)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP3"],1073741824),30)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],134217728),27)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],8),3)
e={}
e["pin_no"]="16"
e["texts"]={"PB.3","UART0_nCTS","TM3_EXT","TM3","PWM1_BRAKE0"}
if s==0 and n==0 and o==0 and i==0 then
fill_NUC131_GPIO(e,t,"B",3,nil,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==0 and n==0 and o==0 and i==1 then
fill_NUC131_UART(e,t,"B",3,"UART0_nCTS",0,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==0 and n==0 and o==1 and i==1 then
fill_NUC131_TM(e,t,"B",3,"TM3_EXT",3,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==1 and n==0 and o==0 and i==1 then
fill_NUC131_TM(e,t,"B",3,"TM3",3,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif s==0 and n==1 and o==0 and i==1 then
fill_NUC131_PWM(e,t,"B",3,"PWM1_BRAKE0",1,nil,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"B",3,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
end
a[16]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],524288),19)
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],64),6)
e={}
e["pin_no"]="17"
e["texts"]={"PD.6","BPWM1_CH1"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"D",6,nil,"GCR_ALT_MFP3")
elseif i==1 and o==1 then
fill_NUC131_BPWM(e,t,"D",6,"BPWM1_CH1",1,1,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"D",6,"GCR_ALT_MFP3")
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],262144),18)
local i=ext.rshift(ext.band(t["GCR_GPD_MFP"],128),7)
e={}
e["pin_no"]="18"
e["texts"]={"PD.7","BPWM1_CH0"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"D",7,nil,"GCR_ALT_MFP3")
elseif o==1 and i==1 then
fill_NUC131_BPWM(e,t,"D",7,"BPWM1_CH0",1,0,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"D",7,"GCR_ALT_MFP3")
end
a[18]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],131072),17)
local i=ext.rshift(ext.band(t["GCR_GPD_MFP"],16384),14)
e={}
e["pin_no"]="19"
e["texts"]={"PD.14","UART2_RXD","BPWM0_CH5"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"D",14,nil,"GCR_ALT_MFP3")
elseif o==0 and i==1 then
fill_NUC131_UART(e,t,"D",14,"UART2_RXD",2,"GCR_ALT_MFP3")
e["direction"]=kPinDirection_In
elseif o==1 and i==1 then
fill_NUC131_BPWM(e,t,"D",14,"BPWM0_CH5",0,5,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"D",14,"GCR_ALT_MFP3")
end
a[19]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],65536),16)
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],32768),15)
e={}
e["pin_no"]="20"
e["texts"]={"PD.15","UART2_TXD","BPWM0_CH4"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"D",15,nil,"GCR_ALT_MFP3")
elseif i==0 and o==1 then
fill_NUC131_UART(e,t,"D",15,"UART2_TXD",2,"GCR_ALT_MFP3")
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==1 then
fill_NUC131_BPWM(e,t,"D",15,"BPWM0_CH4",0,4,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"D",15,"GCR_ALT_MFP3")
end
a[20]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],32768),15)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],8),3)
e={}
e["pin_no"]="21"
e["texts"]={"PC.3","SPI0_MOSI0","BPWM0_CH3"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP3")
elseif o==0 and i==1 then
fill_NUC131_SPI(e,t,"C",3,"SPI0_MOSI0",0,"GCR_ALT_MFP3")
fill_NUC131_SPI_IO(e,t,0,false)
elseif o==1 and i==1 then
fill_NUC131_BPWM(e,t,"C",3,"BPWM0_CH3",0,3,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP3")
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],16384),14)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],4),2)
e={}
e["pin_no"]="22"
e["texts"]={"PC.2","SPI0_MISO0","BPWM0_CH2"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP3")
elseif o==0 and i==1 then
fill_NUC131_SPI(e,t,"C",2,"SPI0_MISO0",0,"GCR_ALT_MFP3")
fill_NUC131_SPI_IO(e,t,0,true)
elseif o==1 and i==1 then
fill_NUC131_BPWM(e,t,"C",2,"BPWM0_CH2",0,2,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP3")
end
a[22]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],8192),13)
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2),1)
e={}
e["pin_no"]="23"
e["texts"]={"PC.1","SPI0_CLK","BPWM0_CH1"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP3")
elseif i==0 and o==1 then
fill_NUC131_SPI(e,t,"C",1,"SPI0_CLK",0,"GCR_ALT_MFP3")
elseif i==1 and o==1 then
fill_NUC131_BPWM(e,t,"C",1,"BPWM0_CH1",0,1,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP3")
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],4096),12)
local i=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="24"
e["texts"]={"PC.0","SPI0_SS0","BPWM0_CH0"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP3")
elseif o==0 and i==1 then
fill_NUC131_SPI(e,t,"C",0,"SPI0_SS0",0,"GCR_ALT_MFP3")
elseif o==1 and i==1 then
fill_NUC131_BPWM(e,t,"C",0,"BPWM0_CH0",0,0,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP3")
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],32768),15)
e={}
e["pin_no"]="25"
e["texts"]={"PWM0_CH3","PA.15"}
if o==0 then
fill_NUC131_GPIO(e,t,"A",15,nil)
elseif o==1 then
fill_NUC131_PWM(e,t,"A",15,"PWM0_CH3",0,3)
end
a[25]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],16384),14)
e={}
e["pin_no"]="26"
e["texts"]={"PWM0_CH2","PA.14"}
if o==0 then
fill_NUC131_GPIO(e,t,"A",14,nil)
elseif o==1 then
fill_NUC131_PWM(e,t,"A",14,"PWM0_CH2",0,2)
end
a[26]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP4"],512),9)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],8192),13)
e={}
e["pin_no"]="27"
e["texts"]={"UART5_TXD","PWM0_CH1","PA.13"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"A",13,nil,"GCR_ALT_MFP4")
elseif i==0 and o==1 then
fill_NUC131_PWM(e,t,"A",13,"PWM0_CH1",0,1,"GCR_ALT_MFP4")
elseif i==1 and o==1 then
fill_NUC131_UART(e,t,"A",13,"UART5_TXD",5,"GCR_ALT_MFP4")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",13,"GCR_ALT_MFP4")
end
a[27]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP4"],256),8)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],4096),12)
e={}
e["pin_no"]="28"
e["texts"]={"UART5_RXD","PWM0_CH0","PA.12"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"A",12,nil,"GCR_ALT_MFP4")
elseif i==0 and o==1 then
fill_NUC131_PWM(e,t,"A",12,"PWM0_CH0",0,0,"GCR_ALT_MFP4")
elseif i==1 and o==1 then
fill_NUC131_UART(e,t,"A",12,"UART5_RXD",5,"GCR_ALT_MFP4")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",12,"GCR_ALT_MFP4")
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],128),7)
e={}
e["pin_no"]="29"
e["texts"]={"ICE_DAT","PF.7"}
if o==0 then
fill_NUC131_GPIO(e,t,"F",7,nil)
elseif o==1 then
fill_NUC131_Normal(e,t,"F",7,"ICE_DAT")
e["direction"]=kPinDirection_Bi
end
a[29]=e
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],64),6)
e={}
e["pin_no"]="30"
e["texts"]={"ICE_CLK","PF.6"}
if o==0 then
fill_NUC131_GPIO(e,t,"F",6,nil)
elseif o==1 then
fill_NUC131_Normal(e,t,"F",6,"ICE_CLK")
e["direction"]=kPinDirection_In
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"AVSS"}
fill_NUC131_Normal(e,t,nil,nil,"AVSS")
a[31]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP3"],16),4)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP4"],128),7)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP4"],4096),12)
local i=ext.band(t["GCR_GPA_MFP"],1)
e={}
e["pin_no"]="32"
e["texts"]={"UART5_TXD","I2C1_SCL","PWM0_CH4","ADC_CH0","PA.0"}
if s==0 and n==0 and o==0 and i==0 then
fill_NUC131_GPIO(e,t,"A",0,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif s==0 and n==0 and o==0 and i==1 then
fill_NUC131_ADC(e,t,"A",0,"ADC_CH0","GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif s==1 and n==0 and o==0 and i==1 then
fill_NUC131_PWM(e,t,"A",0,"PWM0_CH4",0,4,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif s==0 and n==0 and o==1 and i==1 then
fill_NUC131_I2C(e,t,"A",0,"I2C1_SCL",1,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif s==0 and n==1 and o==0 and i==1 then
fill_NUC131_UART(e,t,"A",0,"UART5_TXD",5,"GCR_ALT_MFP3","GCR_ALT_MFP4")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",0,"GCR_ALT_MFP3","GCR_ALT_MFP4")
end
a[32]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP3"],32),5)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP4"],64),6)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP4"],8192),13)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],2),1)
e={}
e["pin_no"]="33"
e["texts"]={"UART5_RXD","I2C1_SDA","PWM0_CH5","ADC_CH1","PA.1"}
if n==0 and s==0 and i==0 and o==0 then
fill_NUC131_GPIO(e,t,"A",1,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==0 and s==0 and i==0 and o==1 then
fill_NUC131_ADC(e,t,"A",1,"ADC_CH1","GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==1 and s==0 and i==0 and o==1 then
fill_NUC131_PWM(e,t,"A",1,"PWM0_CH5",0,5,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==0 and s==0 and i==1 and o==1 then
fill_NUC131_I2C(e,t,"A",1,"I2C1_SDA",1,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==0 and s==1 and i==0 and o==1 then
fill_NUC131_UART(e,t,"A",1,"UART5_RXD",5,"GCR_ALT_MFP3","GCR_ALT_MFP4")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",1,"GCR_ALT_MFP3","GCR_ALT_MFP4")
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],64),6)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP4"],8),3)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],4),2)
e={}
e["pin_no"]="34"
e["texts"]={"UART3_TXD","PWM1_CH0","ADC_CH2","PA.2"}
if o==0 and n==0 and i==0 then
fill_NUC131_GPIO(e,t,"A",2,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif o==0 and n==0 and i==1 then
fill_NUC131_ADC(e,t,"A",2,"ADC_CH2","GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif o==1 and n==0 and i==1 then
fill_NUC131_PWM(e,t,"A",2,"PWM1_CH0",1,0,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif o==0 and n==1 and i==1 then
fill_NUC131_UART(e,t,"A",2,"UART3_TXD",3,"GCR_ALT_MFP3","GCR_ALT_MFP4")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",2,"GCR_ALT_MFP3","GCR_ALT_MFP4")
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP3"],128),7)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP4"],4),2)
local n=ext.rshift(ext.band(t["GCR_GPA_MFP"],8),3)
e={}
e["pin_no"]="35"
e["texts"]={"UART3_RXD","PWM1_CH1","ADC_CH3","PA.3"}
if o==0 and i==0 and n==0 then
fill_NUC131_GPIO(e,t,"A",3,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif o==0 and i==0 and n==1 then
fill_NUC131_ADC(e,t,"A",3,"ADC_CH3","GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif o==1 and i==0 and n==1 then
fill_NUC131_PWM(e,t,"A",3,"PWM1_CH1",1,1,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif o==0 and i==1 and n==1 then
fill_NUC131_UART(e,t,"A",3,"UART3_RXD",3,"GCR_ALT_MFP3","GCR_ALT_MFP4")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",3,"GCR_ALT_MFP3","GCR_ALT_MFP4")
end
a[35]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],16),4)
e={}
e["pin_no"]="36"
e["texts"]={"ADC_CH4","PA.4"}
if o==0 then
fill_NUC131_GPIO(e,t,"A",4,nil)
elseif o==1 then
fill_NUC131_ADC(e,t,"A",4,"ADC_CH4")
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP4"],16),4)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],32),5)
e={}
e["pin_no"]="37"
e["texts"]={"UART3_RXD","ADC_CH5","PA.5"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"A",5,nil,"GCR_ALT_MFP4")
elseif o==0 and i==1 then
fill_NUC131_ADC(e,t,"A",5,"ADC_CH5","GCR_ALT_MFP4")
elseif o==1 and i==1 then
fill_NUC131_UART(e,t,"A",5,"UART3_RXD",3,"GCR_ALT_MFP4")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",5,"GCR_ALT_MFP4")
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP4"],32),5)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],64),6)
e={}
e["pin_no"]="38"
e["texts"]={"UART3_TXD","ADC_CH6","PA.6"}
if o==0 and i==0 then
fill_NUC131_GPIO(e,t,"A",6,nil,"GCR_ALT_MFP4")
elseif o==0 and i==1 then
fill_NUC131_ADC(e,t,"A",6,"ADC_CH6","GCR_ALT_MFP4")
elseif o==1 and i==1 then
fill_NUC131_UART(e,t,"A",6,"UART3_TXD",3,"GCR_ALT_MFP4")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",6,"GCR_ALT_MFP4")
end
a[38]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP4"],16384),14)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],128),7)
e={}
e["pin_no"]="39"
e["texts"]={"VREF","ADC_CH7","PA.7"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"A",7,nil,"GCR_ALT_MFP4")
elseif i==0 and o==1 then
fill_NUC131_ADC(e,t,"A",7,"ADC_CH7","GCR_ALT_MFP4")
elseif i==1 and o==1 then
fill_NUC131_Normal(e,t,"A",7,"VREF","GCR_ALT_MFP4")
else
fill_invalid_GPIO(e,t,"A",7,"GCR_ALT_MFP4")
end
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"AVDD"}
fill_NUC131_Normal(e,t,nil,nil,"AVDD")
a[40]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP3"],536870912),29)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP4"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],128),7)
e={}
e["pin_no"]="41"
e["texts"]={"PWM0_BRAKE1","I2C0_SCL","UART4_RXD","PC.7"}
if n==0 and o==0 and i==0 then
fill_NUC131_GPIO(e,t,"C",7,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==0 and o==0 and i==1 then
fill_NUC131_UART(e,t,"C",7,"UART4_RXD",4,"GCR_ALT_MFP3","GCR_ALT_MFP4")
e["direction"]=kPinDirection_In
elseif n==0 and o==1 and i==1 then
fill_NUC131_I2C(e,t,"C",7,"I2C0_SCL",0,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==1 and o==0 and i==1 then
fill_NUC131_PWM(e,t,"C",7,"PWM0_BRAKE1",0,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
else
fill_invalid_GPIO(e,t,"C",7,"GCR_ALT_MFP3","GCR_ALT_MFP4")
end
a[41]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP3"],268435456),28)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP4"],1024),10)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],64),6)
e={}
e["pin_no"]="42"
e["texts"]={"PWM0_BRAKE0","I2C0_SDA","UART4_TXD","PC.6"}
if n==0 and o==0 and i==0 then
fill_NUC131_GPIO(e,t,"C",6,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==0 and o==0 and i==1 then
fill_NUC131_UART(e,t,"C",6,"UART4_TXD",4,"GCR_ALT_MFP3","GCR_ALT_MFP4")
e["direction"]=kPinDirection_PushPullOut
elseif n==0 and o==1 and i==1 then
fill_NUC131_I2C(e,t,"C",6,"I2C0_SDA",0,"GCR_ALT_MFP3","GCR_ALT_MFP4")
elseif n==1 and o==0 and i==1 then
fill_NUC131_PWM(e,t,"C",6,"PWM0_BRAKE0",0,nil,"GCR_ALT_MFP3","GCR_ALT_MFP4")
else
fill_invalid_GPIO(e,t,"C",6,"GCR_ALT_MFP3","GCR_ALT_MFP4")
end
a[42]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],8388608),23)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],16777216),24)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP2"],4),2)
local n=ext.rshift(ext.band(t["GCR_GPB_MFP"],32768),15)
e={}
e["pin_no"]="43"
e["texts"]={"BPWM1_CH5","TM0","TM0_EXT","INT1","PB.15"}
if i==0 and o==0 and s==0 and n==0 then
fill_NUC131_GPIO(e,t,"B",15,nil,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif i==0 and o==0 and s==0 and n==1 then
fill_NUC131_Normal(e,t,"B",15,"INT1","GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif i==0 and o==1 and s==0 and n==1 then
fill_NUC131_TM(e,t,"B",15,"TM0_EXT",0,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif i==0 and o==0 and s==1 and n==1 then
fill_NUC131_TM(e,t,"B",15,"TM0",0,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
elseif i==1 and o==0 and s==1 and n==1 then
fill_NUC131_BPWM(e,t,"B",15,"BPWM1_CH5",1,5,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"B",15,"GCR_ALT_MFP","GCR_ALT_MFP2","GCR_ALT_MFP3")
end
a[43]=e
local o=ext.band(t["GCR_GPF_MFP"],1)
e={}
e["pin_no"]="44"
e["texts"]={"XT1_OUT","PF.0"}
if o==0 then
fill_NUC131_GPIO(e,t,"F",0,nil)
elseif o==1 then
fill_NUC131_Normal(e,t,"F",0,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],2),1)
e={}
e["pin_no"]="45"
e["texts"]={"XT1_IN","PF.1"}
if o==0 then
fill_NUC131_GPIO(e,t,"F",1,nil)
elseif o==1 then
fill_NUC131_Normal(e,t,"F",1,"XT1_IN")
e["direction"]=kPinDirection_In
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"nRESET"}
fill_NUC131_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[46]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP3"],4194304),22)
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],256),8)
e={}
e["pin_no"]="47"
e["texts"]={"BPWM1_CH4","CLKO","PF.8"}
if i==0 and o==0 then
fill_NUC131_GPIO(e,t,"F",8,nil,"GCR_ALT_MFP3")
elseif i==0 and o==1 then
fill_NUC131_CLKO(e,t,"F",8,"CLKO","GCR_ALT_MFP3")
elseif i==1 and o==0 then
fill_NUC131_BPWM(e,t,"F",8,"BPWM1_CH4",1,4,"GCR_ALT_MFP3")
else
fill_invalid_GPIO(e,t,"F",8,"GCR_ALT_MFP3")
end
a[47]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP3"],1048576),20)
local h=ext.rshift(ext.band(t["GCR_ALT_MFP"],536870912),29)
local s=ext.rshift(ext.band(t["GCR_GPB_MFP"],256),8)
local o=ext.band(t["ADC_ADCR"],256)
local i=ext.band(t["ADC_ADCR"],48)
e={}
e["pin_no"]="48"
e["texts"]={"BPWM1_CH2","CLKO","TM0","STADC","PB.8"}
if n==0 and h==0 and s==0 then
if o~=0 and i==0 then
fill_NUC131_GPIO(e,t,"B",8,"STADC,PB.8","GCR_ALT_MFP","GCR_ALT_MFP3","ADC_ADCR")
e["highlight_text"]="STADC,PB.8"
e["texts"]={"BPWM1_CH2","CLKO","TM0","STADC,PB.8"}
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
else
fill_NUC131_GPIO(e,t,"B",8,"STADC,PB.8","GCR_ALT_MFP","GCR_ALT_MFP3","ADC_ADCR")
end
elseif n==0 and h==0 and s==1 then
fill_NUC131_TM(e,t,"B",8,"TM0",0,"GCR_ALT_MFP","GCR_ALT_MFP3","ADC_ADCR")
if o~=0 and i==0 then
e["texts"]={"BPWM1_CH2","CLKO","TM0,STADC","PB.8"}
e["highlight_text"]="TM0,STADC"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
elseif n==0 and h==1 and s==1 then
fill_NUC131_CLKO(e,t,"B",8,"CLKO","GCR_ALT_MFP","GCR_ALT_MFP3","ADC_ADCR")
if o~=0 and i==0 then
e["texts"]={"BPWM1_CH2","CLKO,STADC","TM0","PB.8"}
e["highlight_text"]="CLKO,STADC"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
elseif n==1 and h==0 and s==1 then
fill_NUC131_BPWM(e,t,"B",8,"BPWM1_CH2",1,2,"GCR_ALT_MFP","GCR_ALT_MFP3","ADC_ADCR")
if o~=0 and i==0 then
e["texts"]={"BPWM1_CH2,STADC","CLKO","TM0","PB.8"}
e["highlight_text"]="BPWM1_CH2,STADC"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
else
fill_invalid_GPIO(e,t,"B",8,"GCR_ALT_MFP","GCR_ALT_MFP","GCR_ALT_MFP3","ADC_ADCR")
end
a[48]=e
return{name=r,information="",pins=a}
end
