local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC100_DN_LQFP64(r,e,t,o)
local a={}
local t=read_NUC100_Registers(r,e,t,o)
local e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],8),3)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],16384),14)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","/INT0","SPISS31"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",14,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_Normal(e,t,"B",14,"/INT0","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==1 and i==1 then
fill_NUC100_SPI(e,t,"B",14,"SPISS31",3,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",14,"GCR_ALT_MFP")
end
a[1]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],8192),13)
e={}
e["pin_no"]="2"
e["texts"]={"PB.13","CPO1","AD1"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"B",13,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_ACMP(e,t,"B",13,"CPO1","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
elseif i==1 and o==1 then
fill_NUC100_EBI(e,t,"B",13,"AD1","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",13,"GCR_ALT_MFP")
end
a[2]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],1024),10)
local n=ext.rshift(ext.band(t["GCR_GPB_MFP"],4096),12)
e={}
e["pin_no"]="3"
e["texts"]={"PB.12","CPO0","CLKO","AD0"}
if i==0 and o==0 and n==0 then
fill_NUC100_GPIO(e,t,"B",12,nil,"GCR_ALT_MFP")
elseif i==0 and o==0 and n==1 then
fill_NUC100_ACMP(e,t,"B",12,"CPO0","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
elseif i==0 and o==1 and n==1 then
fill_NUC100_CLKO(e,t,"B",12,"CLKO","GCR_ALT_MFP")
elseif i==1 and o==0 and n==1 then
fill_NUC100_EBI(e,t,"B",12,"AD0","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",12,"GCR_ALT_MFP")
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"X32O"}
fill_NUC100_Normal(e,t,nil,nil,"X32O")
e["direction"]=kPinDirection_PushPullOut
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"X32I"}
fill_NUC100_Normal(e,t,nil,nil,"X32I")
e["direction"]=kPinDirection_In
a[5]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],2048),11)
e={}
e["pin_no"]="6"
e["texts"]={"PA.11","I2C1SCL","nRD"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC100_EBI(e,t,"A",11,"nRD","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",11,"GCR_ALT_MFP")
end
a[6]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],1024),10)
e={}
e["pin_no"]="7"
e["texts"]={"PA.10","I2C1SDA","nWR"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC100_EBI(e,t,"A",10,"nWR","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",10,"GCR_ALT_MFP")
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],512),9)
e={}
e["pin_no"]="8"
e["texts"]={"PA.9","I2C0SCL"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",9,nil)
elseif o==1 then
fill_NUC100_I2C(e,t,"A",9,"I2C0SCL",0)
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],256),8)
e={}
e["pin_no"]="9"
e["texts"]={"PA.8","I2C0SDA"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",8,nil)
elseif o==1 then
fill_NUC100_I2C(e,t,"A",8,"I2C0SDA",0)
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16),4)
e={}
e["pin_no"]="10"
e["texts"]={"PB.4","RXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",4,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"B",4,"RXD1",1)
e["direction"]=kPinDirection_In
end
a[10]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],32),5)
e={}
e["pin_no"]="11"
e["texts"]={"PB.5","TXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",5,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
end
a[11]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],64),6)
e={}
e["pin_no"]="12"
e["texts"]={"PB.6","RTS1","ALE"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",6,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_UART(e,t,"B",6,"RTS1",1,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC100_EBI(e,t,"B",6,"ALE","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",6,"GCR_ALT_MFP")
end
a[12]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],128),7)
e={}
e["pin_no"]="13"
e["texts"]={"PB.7","CTS1","nCS"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",7,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_UART(e,t,"B",7,"CTS1",1,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC100_EBI(e,t,"B",7,"nCS","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",7,"GCR_ALT_MFP")
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"LDO"}
fill_NUC100_Normal(e,t,nil,nil,"LDO")
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"VDD"}
fill_NUC100_Normal(e,t,nil,nil,"VDD")
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"VSS"}
fill_NUC100_Normal(e,t,nil,nil,"VSS")
a[16]=e
local o=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="17"
e["texts"]={"PB.0","RXD0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",0,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"B",0,"RXD0",0)
e["direction"]=kPinDirection_In
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],2),1)
e={}
e["pin_no"]="18"
e["texts"]={"PB.1","TXD0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",1,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"B",1,"TXD0",0)
e["direction"]=kPinDirection_PushPullOut
end
a[18]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],8192),13)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],4),2)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],67108864),26)
e={}
e["pin_no"]="19"
e["texts"]={"PB.2","RTS0","T2EX","nWRL"}
if s==0 and n==0 and i==0 and o==0 then
fill_NUC100_GPIO(e,t,"B",2,nil,"GCR_ALT_MFP")
elseif s==0 and n==0 and i==1 and o==0 then
fill_NUC100_UART(e,t,"B",2,"RTS0",0,"GCR_ALT_MFP")
elseif s==0 and n==0 and i==1 and o==1 then
fill_NUC100_TM(e,t,"B",2,"T2EX",2,"GCR_ALT_MFP")
elseif s==1 and n==1 and i==1 and o==0 then
fill_NUC100_EBI(e,t,"B",2,"nWRL","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",2,"GCR_ALT_MFP")
end
a[19]=e
local h=ext.rshift(ext.band(t["GCR_ALT_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP1"],16384),14)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],134217728),27)
local n=ext.rshift(ext.band(t["GCR_GPB_MFP"],8),3)
e={}
e["pin_no"]="20"
e["texts"]={"PB.3","CTS0","T3EX","SC2CD","nWRH"}
if h==0 and o==0 and s==0 and i==0 and n==0 then
fill_NUC100_GPIO(e,t,"B",3,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif h==0 and o==0 and s==0 and i==0 and n==1 then
fill_NUC100_UART(e,t,"B",3,"CTS0",0,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif h==0 and o==0 and s==0 and i==1 and n==1 then
fill_NUC100_TM(e,t,"B",3,"T3EX",3,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif h==0 and o==0 and s==1 and i==0 and n==1 then
fill_NUC100_SC(e,t,"B",3,"SC2CD",2,"GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_In
elseif h==1 and o==1 and s==0 and i==0 and n==1 then
fill_NUC100_EBI(e,t,"B",3,"nWRH","GCR_ALT_MFP","GCR_ALT_MFP1")
else
fill_invalid_GPIO(e,t,"B",3,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"PD.6"}
fill_NUC100_GPIO(e,t,"D",6)
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"PD.7"}
fill_NUC100_GPIO(e,t,"D",7)
a[22]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],16384),14)
e={}
e["pin_no"]="23"
e["texts"]={"PD.14","RXD2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",14,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"D",14,"RXD2",2)
e["direction"]=kPinDirection_In
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],32768),15)
e={}
e["pin_no"]="24"
e["texts"]={"PD.15","TXD2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",15,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"D",15,"TXD2",2)
e["direction"]=kPinDirection_PushPullOut
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],256),8)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],8),3)
e={}
e["pin_no"]="25"
e["texts"]={"PC.3","MOSI00","I2SDO"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
elseif o==1 and i==1 then
fill_NUC100_I2S(e,t,"C",3,"I2SDO","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP")
end
a[25]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],128),7)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],4),2)
e={}
e["pin_no"]="26"
e["texts"]={"PC.2","MISO00","I2SDI"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
elseif o==1 and i==1 then
fill_NUC100_I2S(e,t,"C",2,"I2SDI","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP")
end
a[26]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2),1)
e={}
e["pin_no"]="27"
e["texts"]={"PC.1","SPICLK0","I2SBCLK"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC100_I2S(e,t,"C",1,"I2SBCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP")
end
a[27]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],32),5)
local i=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="28"
e["texts"]={"PC.0","SPISS00","I2SLRCLK"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC100_I2S(e,t,"C",0,"I2SLRCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP")
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],33554432),25)
local i=ext.rshift(ext.band(t["GCR_GPE_MFP"],32),5)
e={}
e["pin_no"]="29"
e["texts"]={"PE.5","PWM5","T1EX"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"E",5,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_PWM(e,t,"E",5,"PWM5","GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC100_TM(e,t,"E",5,"T1EX",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"E",5,"GCR_ALT_MFP")
end
a[29]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],2048),11)
e={}
e["pin_no"]="30"
e["texts"]={"PB.11","TM3","PWM4"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"B",11,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_TM(e,t,"B",11,"TM3",3,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC100_PWM(e,t,"B",11,"PWM4","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",11,"GCR_ALT_MFP")
end
a[30]=e
local o=ext.band(t["GCR_ALT_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],1024),10)
e={}
e["pin_no"]="31"
e["texts"]={"PB.10","TM2","SPISS01"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",10,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_TM(e,t,"B",10,"TM2",2,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC100_SPI(e,t,"B",10,"SPISS01",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",10,"GCR_ALT_MFP")
end
a[31]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],512),9)
e={}
e["pin_no"]="32"
e["texts"]={"PB.9","TM1","SPISS11"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"B",9,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_TM(e,t,"B",9,"TM1",1,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC100_SPI(e,t,"B",9,"SPISS11",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",9,"GCR_ALT_MFP")
end
a[32]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2048),11)
e={}
e["pin_no"]="33"
e["texts"]={"MOSI10","PC.11"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",11,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",11,"MOSI10",1)
fill_NUC100_SPI_IO(e,t,1,false)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],1024),10)
e={}
e["pin_no"]="34"
e["texts"]={"MISO10","PC.10"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",10,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",10,"MISO10",1)
fill_NUC100_SPI_IO(e,t,1,true)
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],512),9)
e={}
e["pin_no"]="35"
e["texts"]={"SPICLK1","PC.9"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",9,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",9,"SPICLK1",1)
end
a[35]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local n=ext.rshift(ext.band(t["GCR_GPC_MFP"],256),8)
e={}
e["pin_no"]="36"
e["texts"]={"MCLK","SPISS10","PC.8"}
if o==0 and i==0 and n==0 then
fill_NUC100_GPIO(e,t,"C",8,nil,"GCR_ALT_MFP")
elseif o==0 and i==0 and n==1 then
fill_NUC100_SPI(e,t,"C",8,"SPISS10",1,"GCR_ALT_MFP")
elseif o==1 and i==1 and n==1 then
fill_NUC100_EBI(e,t,"C",8,"MCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",8,"GCR_ALT_MFP")
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],4096),12)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],512),9)
local n=ext.rshift(ext.band(t["GCR_GPA_MFP"],32768),15)
e={}
e["pin_no"]="37"
e["texts"]={"SC2PWR","I2SMCLK","PWM3","PA.15"}
if o==0 and i==0 and n==0 then
fill_NUC100_GPIO(e,t,"A",15,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==0 and n==1 then
fill_NUC100_PWM(e,t,"A",15,"PWM3","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==1 and n==1 then
fill_NUC100_I2S(e,t,"A",15,"I2SMCLK","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==1 and i==0 and n==1 then
fill_NUC100_SC(e,t,"A",15,"SC2PWR",2,"GCR_ALT_MFP","GCR_ALT_MFP1")
else
fill_invalid_GPIO(e,t,"A",15,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[37]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],8388608),23)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],8192),13)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],16384),14)
e={}
e["pin_no"]="38"
e["texts"]={"AD15","SC2RST","PWM2","PA.14"}
if n==0 and s==0 and i==0 and o==0 then
fill_NUC100_GPIO(e,t,"A",14,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==0 and s==0 and i==0 and o==1 then
fill_NUC100_PWM(e,t,"A",14,"PWM2","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==0 and s==0 and i==1 and o==1 then
fill_NUC100_SC(e,t,"A",14,"SC2RST",2,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==1 and s==1 and i==0 and o==1 then
fill_NUC100_EBI(e,t,"A",14,"AD15","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",14,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[38]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],4194304),22)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP1"],1024),10)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],8192),13)
e={}
e["pin_no"]="39"
e["texts"]={"AD14","SC2CLK","PWM1","PA.13"}
if o==0 and s==0 and n==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",13,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and s==0 and n==0 and i==1 then
fill_NUC100_PWM(e,t,"A",13,"PWM1","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and s==0 and n==1 and i==1 then
fill_NUC100_SC(e,t,"A",13,"SC2CLK",2,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==1 and s==1 and n==0 and i==1 then
fill_NUC100_EBI(e,t,"A",13,"AD14","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",13,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[39]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2097152),21)
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],4096),12)
e={}
e["pin_no"]="40"
e["texts"]={"AD13","SC2DAT","PWM0","PA.12"}
if n==0 and s==0 and i==0 and o==0 then
fill_NUC100_GPIO(e,t,"A",12,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==0 and s==0 and i==0 and o==1 then
fill_NUC100_PWM(e,t,"A",12,"PWM0","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==0 and s==0 and i==1 and o==1 then
fill_NUC100_SC(e,t,"A",12,"SC2DAT",2,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==1 and s==1 and i==0 and o==1 then
fill_NUC100_EBI(e,t,"A",12,"AD13","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",12,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"ICE_DAT"}
fill_NUC100_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"ICE_CLK"}
fill_NUC100_Normal(e,t,nil,nil,"ICE_CLK")
e["direction"]=kPinDirection_In
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"AVSS"}
fill_NUC100_Normal(e,t,nil,nil,"AVSS")
a[43]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],4),2)
local i=ext.band(t["GCR_GPA_MFP"],1)
e={}
e["pin_no"]="44"
e["texts"]={"SC0PWR","ADC0","PA.0"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",0,nil,"GCR_ALT_MFP1")
elseif o==0 and i==1 then
fill_NUC100_ADC(e,t,"A",0,"ADC0","GCR_ALT_MFP1")
elseif o==1 and i==1 then
fill_NUC100_SC(e,t,"A",0,"SC0PWR",0,"GCR_ALT_MFP1")
else
fill_invalid_GPIO(e,t,"A",0,"GCR_ALT_MFP1")
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],1048576),20)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP1"],8),3)
local s=ext.rshift(ext.band(t["GCR_GPA_MFP"],2),1)
e={}
e["pin_no"]="45"
e["texts"]={"AD12","SC0RST","ADC1","PA.1"}
if o==0 and i==0 and n==0 and s==0 then
fill_NUC100_GPIO(e,t,"A",1,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==0 and n==0 and s==1 then
fill_NUC100_ADC(e,t,"A",1,"ADC1","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==0 and n==1 and s==1 then
fill_NUC100_SC(e,t,"A",1,"SC0RST",0,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==1 and i==1 and n==0 and s==1 then
fill_NUC100_EBI(e,t,"A",1,"AD12","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",1,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[45]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],524288),19)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local s=ext.band(t["GCR_ALT_MFP1"],1)
local n=ext.rshift(ext.band(t["GCR_GPA_MFP"],4),2)
e={}
e["pin_no"]="46"
e["texts"]={"AD11","SC0CLK","ADC2","PA.2"}
if o==0 and i==0 and s==0 and n==0 then
fill_NUC100_GPIO(e,t,"A",2,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==0 and s==0 and n==1 then
fill_NUC100_ADC(e,t,"A",2,"ADC2","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==0 and s==1 and n==1 then
fill_NUC100_SC(e,t,"A",2,"SC0CLK",0,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==1 and i==1 and s==0 and n==1 then
fill_NUC100_EBI(e,t,"A",2,"AD11","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",2,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[46]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],262144),18)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],2),1)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],8),3)
e={}
e["pin_no"]="47"
e["texts"]={"AD10","SC0DAT","ADC3","PA.3"}
if s==0 and n==0 and o==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",3,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==0 and n==0 and o==0 and i==1 then
fill_NUC100_ADC(e,t,"A",3,"ADC3","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==0 and n==0 and o==1 and i==1 then
fill_NUC100_SC(e,t,"A",3,"SC0DAT",0,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==1 and n==1 and o==0 and i==1 then
fill_NUC100_EBI(e,t,"A",3,"AD10","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",3,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[47]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],131072),17)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],128),7)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],16),4)
e={}
e["pin_no"]="48"
e["texts"]={"AD9","SC1PWR","ADC4","PA.4"}
if s==0 and n==0 and o==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",4,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==0 and n==0 and o==0 and i==1 then
fill_NUC100_ADC(e,t,"A",4,"ADC4","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==0 and n==0 and o==1 and i==1 then
fill_NUC100_SC(e,t,"A",4,"SC1PWR",1,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==1 and n==1 and o==0 and i==1 then
fill_NUC100_EBI(e,t,"A",4,"AD9","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",4,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[48]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],65536),16)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],256),8)
local s=ext.rshift(ext.band(t["GCR_GPA_MFP"],32),5)
e={}
e["pin_no"]="49"
e["texts"]={"AD8","SC1RST","ADC5","PA.5"}
if o==0 and n==0 and i==0 and s==0 then
fill_NUC100_GPIO(e,t,"A",5,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and n==0 and i==0 and s==1 then
fill_NUC100_ADC(e,t,"A",5,"ADC5","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and n==0 and i==1 and s==1 then
fill_NUC100_SC(e,t,"A",5,"SC1RST",1,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==1 and n==1 and i==0 and s==1 then
fill_NUC100_EBI(e,t,"A",5,"AD8","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",5,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[49]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],32),5)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],64),6)
e={}
e["pin_no"]="50"
e["texts"]={"AD7","SC1CLK","ADC6","PA.6"}
if n==0 and i==0 and o==0 then
fill_NUC100_GPIO(e,t,"A",6,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==0 and i==0 and o==1 then
fill_NUC100_ADC(e,t,"A",6,"ADC6","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==0 and i==1 and o==1 then
fill_NUC100_SC(e,t,"A",6,"SC1CLK",1,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif n==1 and i==0 and o==1 then
fill_NUC100_EBI(e,t,"A",6,"AD7","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",6,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[50]=e
local s=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],64),6)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],4),2)
local n=ext.rshift(ext.band(t["GCR_GPA_MFP"],128),7)
e={}
e["pin_no"]="51"
e["texts"]={"AD6","SPISS21","SC1DAT","ADC7","PA.7"}
if s==0 and i==0 and o==0 and n==0 then
fill_NUC100_GPIO(e,t,"A",7,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==0 and i==0 and o==0 and n==1 then
fill_NUC100_ADC(e,t,"A",7,"ADC7","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==0 and i==1 and o==0 and n==1 then
fill_NUC100_SC(e,t,"A",7,"SC1DAT",1,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==0 and i==0 and o==1 and n==1 then
fill_NUC100_SPI(e,t,"A",7,"SPISS21",2,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif s==1 and i==0 and o==0 and n==1 then
fill_NUC100_EBI(e,t,"A",7,"AD6","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",7,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[51]=e
e={}
e["pin_no"]="52"
e["texts"]={"AVDD"}
fill_NUC100_Normal(e,t,nil,nil,"AVDD")
a[52]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],512),9)
local n=ext.rshift(ext.band(t["GCR_GPC_MFP"],128),7)
e={}
e["pin_no"]="53"
e["texts"]={"AD5","SC1CD","CPN0","PC.7"}
if i==0 and o==0 and n==0 then
fill_NUC100_GPIO(e,t,"C",7,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif i==0 and o==0 and n==1 then
fill_NUC100_ACMP(e,t,"C",7,"CPN0","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif i==0 and o==1 and n==1 then
fill_NUC100_SC(e,t,"C",7,"SC1CD",1,"GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_In
elseif i==1 and o==0 and n==1 then
fill_NUC100_EBI(e,t,"C",7,"AD5","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",7,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[53]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],16),4)
local n=ext.rshift(ext.band(t["GCR_GPC_MFP"],64),6)
e={}
e["pin_no"]="54"
e["texts"]={"AD4","SC0CD","CPP0","PC.6"}
if o==0 and i==0 and n==0 then
fill_NUC100_GPIO(e,t,"C",6,nil,"GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==0 and n==1 then
fill_NUC100_ACMP(e,t,"C",6,"CPP0","GCR_ALT_MFP","GCR_ALT_MFP1")
elseif o==0 and i==1 and n==1 then
fill_NUC100_SC(e,t,"C",6,"SC0CD",0,"GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_In
elseif o==1 and i==0 and n==1 then
fill_NUC100_EBI(e,t,"C",6,"AD4","GCR_ALT_MFP","GCR_ALT_MFP1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",6,"GCR_ALT_MFP","GCR_ALT_MFP1")
end
a[54]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],32768),15)
e={}
e["pin_no"]="55"
e["texts"]={"AD3","CPN1","PC.15"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",15,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_ACMP(e,t,"C",15,"CPN1","GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC100_EBI(e,t,"C",15,"AD3","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",15,"GCR_ALT_MFP")
end
a[55]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],16384),14)
e={}
e["pin_no"]="56"
e["texts"]={"AD2","CPP1","PC.14"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",14,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_ACMP(e,t,"C",14,"CPP1","GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC100_EBI(e,t,"C",14,"AD2","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",14,"GCR_ALT_MFP")
end
a[56]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],16777216),24)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],32768),15)
e={}
e["pin_no"]="57"
e["texts"]={"T0EX","/INT1","PB.15"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",15,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_Normal(e,t,"B",15,"/INT1","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==1 and i==1 then
fill_NUC100_TM(e,t,"B",15,"T0EX",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",15,"GCR_ALT_MFP")
end
a[57]=e
local o=ext.band(t["GCR_GPF_MFP"],1)
e={}
e["pin_no"]="58"
e["texts"]={"XT1_OUT","PF.0"}
if o==0 then
fill_NUC100_GPIO(e,t,"F",0,nil)
elseif o==1 then
fill_NUC100_Normal(e,t,"F",0,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
end
a[58]=e
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],2),1)
e={}
e["pin_no"]="59"
e["texts"]={"XT1_IN","PF.1"}
if o==0 then
fill_NUC100_GPIO(e,t,"F",1,nil)
elseif o==1 then
fill_NUC100_Normal(e,t,"F",1,"XT1_IN")
e["direction"]=kPinDirection_In
end
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"/RESET"}
fill_NUC100_Normal(e,t,nil,nil,"/RESET")
e["direction"]=kPinDirection_In
a[60]=e
e={}
e["pin_no"]="61"
e["texts"]={"VSS"}
fill_NUC100_Normal(e,t,nil,nil,"VSS")
a[61]=e
e={}
e["pin_no"]="62"
e["texts"]={"VDD"}
fill_NUC100_Normal(e,t,nil,nil,"VDD")
a[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"PVSS"}
fill_NUC100_Normal(e,t,nil,nil,"PVSS")
a[63]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],256),8)
local n=ext.band(t["ADC_ADCR"],256)
local i=ext.band(t["ADC_ADCR"],48)
e={}
e["pin_no"]="64"
e["texts"]={"TM0","STADC","PB.8"}
if o==0 then
if n~=0 and i==0 then
fill_NUC100_GPIO(e,t,"B",8,"PB.8,STADC","ADC_ADCR")
e["highlight_text"]="PB.8,STADC"
e["texts"]={"TM0","PB.8,STADC"}
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
else
fill_NUC100_GPIO(e,t,"B",8,nil,"ADC_ADCR")
end
elseif o==1 then
fill_NUC100_TM(e,t,"B",8,"TM0",0,"ADC_ADCR")
if n~=0 and i==0 then
e["texts"]={"STADC,TM0","PB.8"}
e["highlight_text"]="STADC,TM0"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
end
a[64]=e
return{name=r,information="",pins=a}
end
