local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC101_BN_QFN36(s,e,t,o)
local a={}
local t=read_NUC100_Registers(s,e,t,o)
local e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16384),14)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","/INT0"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"B",14,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_Normal(e,t,"B",14,"/INT0","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",14,"GCR_ALT_MFP")
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],2048),11)
e={}
e["pin_no"]="2"
e["texts"]={"PA.11","I2C1SCL"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",11,"GCR_ALT_MFP")
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],1024),10)
e={}
e["pin_no"]="3"
e["texts"]={"PA.10","I2C1SDA"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",10,"GCR_ALT_MFP")
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16),4)
e={}
e["pin_no"]="4"
e["texts"]={"PB.4","RXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",4,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"B",4,"RXD1",1)
e["direction"]=kPinDirection_In
end
a[4]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],32),5)
e={}
e["pin_no"]="5"
e["texts"]={"PB.5","TXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",5,nil)
elseif o==1 then
fill_NUC100_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
end
a[5]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],64),6)
e={}
e["pin_no"]="6"
e["texts"]={"PB.6"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"B",6,nil,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",6,"GCR_ALT_MFP")
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"LDO"}
fill_NUC100_Normal(e,t,nil,nil,"LDO")
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"VDD"}
fill_NUC100_Normal(e,t,nil,nil,"VDD")
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"VSS"}
fill_NUC100_Normal(e,t,nil,nil,"VSS")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"VBUS"}
fill_NUC100_Normal(e,t,nil,nil,"VBUS")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VDD33"}
fill_NUC100_Normal(e,t,nil,nil,"VDD33")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"D-"}
fill_NUC100_USB(e,t,"D-")
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"D+"}
fill_NUC100_USB(e,t,"D+")
a[13]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],256),8)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],8),3)
e={}
e["pin_no"]="14"
e["texts"]={"PC.3","MOSI00"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP")
end
a[14]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],128),7)
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],4),2)
e={}
e["pin_no"]="15"
e["texts"]={"PC.2","MISO00"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP")
end
a[15]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],64),6)
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2),1)
e={}
e["pin_no"]="16"
e["texts"]={"PC.1","SPICLK0"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP")
end
a[16]=e
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],32),5)
local o=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="17"
e["texts"]={"PC.0","SPISS00"}
if i==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP")
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2),1)
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],512),9)
e={}
e["pin_no"]="18"
e["texts"]={"PB.9","TM1","SPISS11"}
if o==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",9,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC100_TM(e,t,"B",9,"TM1",1,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC100_SPI(e,t,"B",9,"SPISS11",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",9,"GCR_ALT_MFP")
end
a[18]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],8192),13)
e={}
e["pin_no"]="19"
e["texts"]={"MOSI11","PC.13"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",13,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",13,"MOSI11",1)
fill_NUC100_SPI_IO(e,t,1,false)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],4096),12)
e={}
e["pin_no"]="20"
e["texts"]={"MISO11","PC.12"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",12,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",12,"MISO11",1)
fill_NUC100_SPI_IO(e,t,1,true)
end
a[20]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2048),11)
e={}
e["pin_no"]="21"
e["texts"]={"MOSI10","PC.11"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",11,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",11,"MOSI10",1)
fill_NUC100_SPI_IO(e,t,1,false)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],1024),10)
e={}
e["pin_no"]="22"
e["texts"]={"MISO10","PC.10"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",10,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",10,"MISO10",1)
fill_NUC100_SPI_IO(e,t,1,true)
end
a[22]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],512),9)
e={}
e["pin_no"]="23"
e["texts"]={"SPICLK1","PC.9"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",9,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"C",9,"SPICLK1",1)
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],4096),12)
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],256),8)
e={}
e["pin_no"]="24"
e["texts"]={"SPISS10","PC.8"}
if o==0 and n==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",8,nil,"GCR_ALT_MFP")
elseif o==0 and n==0 and i==1 then
fill_NUC100_SPI(e,t,"C",8,"SPISS10",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",8,"GCR_ALT_MFP")
end
a[24]=e
local n=ext.rshift(ext.band(t["GCR_ALT_MFP"],2097152),21)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],4096),12)
e={}
e["pin_no"]="25"
e["texts"]={"PWM0","PA.12"}
if n==0 and i==0 and o==0 then
fill_NUC100_GPIO(e,t,"A",12,nil,"GCR_ALT_MFP")
elseif n==0 and i==0 and o==1 then
fill_NUC100_PWM(e,t,"A",12,"PWM0","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",12,"GCR_ALT_MFP")
end
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"ICE_DAT"}
fill_NUC100_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"ICE_CK"}
fill_NUC100_Normal(e,t,nil,nil,"ICE_CK")
e["direction"]=kPinDirection_In
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"AVDD"}
fill_NUC100_Normal(e,t,nil,nil,"AVDD")
a[28]=e
local o=ext.band(t["GCR_GPD_MFP"],1)
e={}
e["pin_no"]="29"
e["texts"]={"PD.0"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",0,nil)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[29]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],2),1)
e={}
e["pin_no"]="30"
e["texts"]={"SPISS01","PD.1"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",1,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"D",1,"SPISS01",0)
end
a[30]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],4),2)
e={}
e["pin_no"]="31"
e["texts"]={"MISO01","PD.2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",2,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"D",2,"MISO01",0)
fill_NUC100_SPI_IO(e,t,0,true)
end
a[31]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],8),3)
e={}
e["pin_no"]="32"
e["texts"]={"MOSI01","PD.3"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",3,nil)
elseif o==1 then
fill_NUC100_SPI(e,t,"D",3,"MOSI01",0)
fill_NUC100_SPI_IO(e,t,0,false)
end
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"XT1_OUT"}
fill_NUC100_Normal(e,t,nil,nil,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"XT1_IN"}
fill_NUC100_Normal(e,t,nil,nil,"XT1_IN")
e["direction"]=kPinDirection_In
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"/RESET"}
fill_NUC100_Normal(e,t,nil,nil,"/RESET")
e["direction"]=kPinDirection_In
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"PVSS"}
fill_NUC100_Normal(e,t,nil,nil,"PVSS")
a[36]=e
return{name=s,information="",pins=a}
end
