local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC123.lua")
function get_chip_status_NUC123_AN_LQFP64(n,e,o,t)
local a={}
local t=read_NUC123_Registers(n,e,o,t)
local e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16384),14)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","/INT0"}
if o==0 then
fill_NUC123_GPIO(e,t,"B",14)
elseif o==1 then
fill_NUC123_Normal(e,t,"B",14,"/INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],8192),13)
e={}
e["pin_no"]="2"
e["texts"]={"PB.13"}
if o==0 then
fill_NUC123_GPIO(e,t,"B",13)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[2]=e
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],1024),10)
e={}
e["pin_no"]="3"
e["texts"]={"PB.12","SPISS10","CLKO"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"B",12,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_SPI(e,t,"B",12,"SPISS10",1,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC123_CLKO(e,t,"B",12,"CLKO","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",12,"GCR_ALT_MFP")
end
a[3]=e
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
e={}
e["pin_no"]="4"
e["texts"]={"PA.11","SPICLK1","MOSI20","I2C1SCL"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif o==1 and i==0 then
fill_NUC123_SPI(e,t,"A",11,"SPICLK1",1,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC123_SPI(e,t,"A",11,"MOSI20",2,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,2,false)
elseif o==0 and i==1 then
fill_NUC123_I2C(e,t,"A",11,"I2C1SCL",1,"GCR_ALT_MFP")
end
a[4]=e
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],4096),12)
e={}
e["pin_no"]="5"
e["texts"]={"PA.10","MISO10","MISO20","I2C1SDA"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif o==1 and i==0 then
fill_NUC123_SPI(e,t,"A",10,"MISO10",1,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,1,true)
elseif o==1 and i==1 then
fill_NUC123_SPI(e,t,"A",10,"MISO20",2,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,2,true)
elseif o==0 and i==1 then
fill_NUC123_I2C(e,t,"A",10,"I2C1SDA",1,"GCR_ALT_MFP")
end
a[5]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],256),8)
e={}
e["pin_no"]="6"
e["texts"]={"PD.8","MOSI10"}
if o==0 then
fill_NUC123_GPIO(e,t,"D",8)
elseif o==1 then
fill_NUC123_SPI(e,t,"D",8,"MOSI10",1)
fill_NUC123_SPI_IO(e,t,1,false)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],512),9)
e={}
e["pin_no"]="7"
e["texts"]={"PD.9"}
if o==0 then
fill_NUC123_GPIO(e,t,"D",9)
else
fill_invalid_GPIO(e,t,"D",9)
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],1024),10)
e={}
e["pin_no"]="8"
e["texts"]={"PD.10","CLKO"}
if o==0 then
fill_NUC123_GPIO(e,t,"D",10)
elseif o==1 then
fill_NUC123_CLKO(e,t,"D",10,"CLKO")
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],2048),11)
e={}
e["pin_no"]="9"
e["texts"]={"PD.11","/INT1"}
if o==0 then
fill_NUC123_GPIO(e,t,"D",11)
elseif o==1 then
fill_NUC123_Normal(e,t,"D",11,"/INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16),4)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],32768),15)
e={}
e["pin_no"]="10"
e["texts"]={"PB.4","RXD1","SPISS20","SPISS11"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",4,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_UART(e,t,"B",4,"RXD1",1,"GCR_ALT_MFP")
elseif i==1 and o==0 then
fill_NUC123_SPI(e,t,"B",4,"SPISS20",2,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC123_SPI(e,t,"B",4,"SPISS11",1,"GCR_ALT_MFP")
end
a[10]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],32),5)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],262144),18)
e={}
e["pin_no"]="11"
e["texts"]={"PB.5","TXD1","SPICLK2"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",5,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_UART(e,t,"B",5,"TXD1",1,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC123_SPI(e,t,"B",5,"SPICLK2",2,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",5,"GCR_ALT_MFP")
end
a[11]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],64),6)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],131072),17)
e={}
e["pin_no"]="12"
e["texts"]={"PB.6","RTS1","MOSI20"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",6,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_UART(e,t,"B",6,"RTS1",1,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC123_SPI(e,t,"B",6,"MOSI20",2,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,2,false)
else
fill_invalid_GPIO(e,t,"B",6,"GCR_ALT_MFP")
end
a[12]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],128),7)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],65536),16)
e={}
e["pin_no"]="13"
e["texts"]={"PB.7","CTS1","MISO20"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",7,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_UART(e,t,"B",7,"CTS1",1,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC123_SPI(e,t,"B",7,"MISO20",2,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,2,true)
else
fill_invalid_GPIO(e,t,"B",7,"GCR_ALT_MFP")
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"LDO"}
fill_NUC123_Normal(e,t,nil,nil,"LDO")
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"VDD"}
fill_NUC123_Normal(e,t,nil,nil,"VDD")
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"VSS"}
fill_NUC123_Normal(e,t,nil,nil,"VSS")
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VBUS"}
fill_NUC123_Normal(e,t,nil,nil,"VBUS")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"VDD33"}
fill_NUC123_Normal(e,t,nil,nil,"VDD33")
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"D-"}
fill_NUC123_USB(e,t,"D-")
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"D+"}
fill_NUC123_USB(e,t,"D+")
a[20]=e
local o=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="21"
e["texts"]={"PB.0","RXD0"}
if o==0 then
fill_NUC123_GPIO(e,t,"B",0)
elseif o==1 then
fill_NUC123_UART(e,t,"B",0,"RXD0",0)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],2),1)
e={}
e["pin_no"]="22"
e["texts"]={"PB.1","TXD0"}
if o==0 then
fill_NUC123_GPIO(e,t,"B",1)
elseif o==1 then
fill_NUC123_UART(e,t,"B",1,"TXD0",0)
end
a[22]=e
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],4),2)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],67108864),26)
e={}
e["pin_no"]="23"
e["texts"]={"PB.2","RTS0","T2EX"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"B",2,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_UART(e,t,"B",2,"RTS0",0,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC123_TM(e,t,"B",2,"T2EX",2,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",2,"GCR_ALT_MFP")
end
a[23]=e
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],134217728),27)
e={}
e["pin_no"]="24"
e["texts"]={"PB.3","CTS0","T3EX"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"B",3,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_UART(e,t,"B",3,"CTS0",0,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC123_TM(e,t,"B",3,"T3EX",3,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",3,"GCR_ALT_MFP")
end
a[24]=e
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],32),5)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],1073741824),30)
e={}
e["pin_no"]="25"
e["texts"]={"PC.5","MOSI01","TXD0"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"C",5,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_SPI(e,t,"C",5,"MOSI01",0,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,0,false)
elseif o==1 and i==1 then
fill_NUC123_UART(e,t,"C",5,"TXD0",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",5,"GCR_ALT_MFP")
end
a[25]=e
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],536870912),29)
e={}
e["pin_no"]="26"
e["texts"]={"PC.4","MISO01","RXD0"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"C",4,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_SPI(e,t,"C",4,"MISO01",0,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,0,true)
elseif o==1 and i==1 then
fill_NUC123_UART(e,t,"C",4,"RXD0",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",4,"GCR_ALT_MFP")
end
a[26]=e
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],256),8)
e={}
e["pin_no"]="27"
e["texts"]={"PC.3","MOSI00","I2SDO"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,0,false)
elseif o==1 and i==1 then
fill_NUC123_I2S(e,t,"C",3,"I2SDO","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP")
end
a[27]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],4),2)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],128),7)
e={}
e["pin_no"]="28"
e["texts"]={"PC.2","MISO00","I2SDI"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,0,true)
elseif i==1 and o==1 then
fill_NUC123_I2S(e,t,"C",2,"I2SDI","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP")
end
a[28]=e
local i=ext.rshift(ext.band(t["GCR_GPC_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],64),6)
e={}
e["pin_no"]="29"
e["texts"]={"PC.1","SPICLK0","I2SBCLK"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC123_I2S(e,t,"C",1,"I2SBCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP")
end
a[29]=e
local o=ext.band(t["GCR_GPC_MFP"],1)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],32),5)
e={}
e["pin_no"]="30"
e["texts"]={"PC.0","SPISS00","I2SLRCLK"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC123_I2S(e,t,"C",0,"I2SLRCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP")
end
a[30]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],1024),10)
local i=ext.band(t["GCR_ALT_MFP"],1)
e={}
e["pin_no"]="31"
e["texts"]={"PB.10","SPISS01","TM2"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",10,nil,"GCR_ALT_MFP")
elseif i==1 and o==1 then
fill_NUC123_SPI(e,t,"B",10,"SPISS01",0,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_TM(e,t,"B",10,"TM2",2,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",10,"GCR_ALT_MFP")
end
a[31]=e
local i=ext.rshift(ext.band(t["GCR_GPB_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2),1)
e={}
e["pin_no"]="32"
e["texts"]={"PB.9","SPISS11","TM1"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"B",9,nil,"GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC123_SPI(e,t,"B",9,"SPISS11",1,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_TM(e,t,"B",9,"TM1",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",9,"GCR_ALT_MFP")
end
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"VSS"}
fill_NUC123_Normal(e,t,nil,nil,"VSS")
a[33]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],8192),13)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],2097152),21)
e={}
e["pin_no"]="34"
e["texts"]={"CLKO","PWM3","MOSI11","PC.13"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"C",13,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_SPI(e,t,"C",13,"MOSI11",1,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,1,false)
elseif i==1 and o==1 then
fill_NUC123_PWM(e,t,"C",13,"PWM3","GCR_ALT_MFP")
elseif i==1 and o==0 then
fill_NUC123_CLKO(e,t,"C",13,"CLKO","GCR_ALT_MFP")
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],4096),12)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],1048576),20)
e={}
e["pin_no"]="35"
e["texts"]={"I2SMCLK","PWM2","MISO11","PC.12"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"C",12,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_SPI(e,t,"C",12,"MISO11",1,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,1,true)
elseif i==1 and o==1 then
fill_NUC123_PWM(e,t,"C",12,"PWM2","GCR_ALT_MFP")
elseif i==1 and o==0 then
fill_NUC123_I2S(e,t,"C",12,"I2SMCLK","GCR_ALT_MFP")
end
a[35]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2048),11)
e={}
e["pin_no"]="36"
e["texts"]={"MOSI10","PC.11"}
if o==0 then
fill_NUC123_GPIO(e,t,"C",11)
elseif o==1 then
fill_NUC123_SPI(e,t,"C",11,"MOSI10",1)
fill_NUC123_SPI_IO(e,t,1,false)
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],1024),10)
e={}
e["pin_no"]="37"
e["texts"]={"MISO10","PC.10"}
if o==0 then
fill_NUC123_GPIO(e,t,"C",10)
elseif o==1 then
fill_NUC123_SPI(e,t,"C",10,"MISO10",1)
fill_NUC123_SPI_IO(e,t,1,true)
end
a[37]=e
e={}
e["pin_no"]="38"
e["texts"]={"VDD"}
fill_NUC123_Normal(e,t,nil,nil,"VDD")
a[38]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],512),9)
e={}
e["pin_no"]="39"
e["texts"]={"SPICLK1","PC.9"}
if o==0 then
fill_NUC123_GPIO(e,t,"C",9)
elseif o==1 then
fill_NUC123_SPI(e,t,"C",9,"SPICLK1",1)
end
a[39]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],256),8)
e={}
e["pin_no"]="40"
e["texts"]={"SPISS10","PC.8"}
if o==0 then
fill_NUC123_GPIO(e,t,"C",8)
elseif o==1 then
fill_NUC123_SPI(e,t,"C",8,"SPISS10",1)
end
a[40]=e
local i=ext.rshift(ext.band(t["GCR_GPA_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],512),9)
e={}
e["pin_no"]="41"
e["texts"]={"CLKO","I2SMCLK","PWM3","PA.15"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"A",15,nil,"GCR_ALT_MFP")
elseif o==0 and i==1 then
fill_NUC123_PWM(e,t,"A",15,"PWM3","GCR_ALT_MFP")
elseif o==1 and i==1 then
fill_NUC123_I2S(e,t,"A",15,"I2SMCLK","GCR_ALT_MFP")
elseif o==1 and i==0 then
fill_NUC123_CLKO(e,t,"A",15,"CLKO","GCR_ALT_MFP")
end
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"VSS"}
fill_NUC123_Normal(e,t,nil,nil,"VSS")
a[42]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],16384),14)
e={}
e["pin_no"]="43"
e["texts"]={"PWM2","PA.14"}
if o==0 then
fill_NUC123_GPIO(e,t,"A",14)
elseif o==1 then
fill_NUC123_PWM(e,t,"A",14,"PWM2")
end
a[43]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],8192),13)
e={}
e["pin_no"]="44"
e["texts"]={"PWM1","PA.13"}
if o==0 then
fill_NUC123_GPIO(e,t,"A",13)
elseif o==1 then
fill_NUC123_PWM(e,t,"A",13,"PWM1")
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],4096),12)
e={}
e["pin_no"]="45"
e["texts"]={"PWM0","PA.12"}
if o==0 then
fill_NUC123_GPIO(e,t,"A",12)
elseif o==1 then
fill_NUC123_PWM(e,t,"A",12,"PWM0")
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"ICE_DAT"}
fill_NUC123_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"ICE_CK"}
fill_NUC123_Normal(e,t,nil,nil,"ICE_CK")
e["direction"]=kPinDirection_In
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"AVDD"}
fill_NUC123_Normal(e,t,nil,nil,"AVDD")
a[48]=e
local i=ext.band(t["GCR_GPD_MFP"],1)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],65536),16)
e={}
e["pin_no"]="49"
e["texts"]={"SPISS20","ADC0","PD.0"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"D",0,nil,"GCR_ALT_MFP1")
elseif o==1 and i==1 then
fill_NUC123_ADC(e,t,"D",0,"ADC0","GCR_ALT_MFP1")
elseif o==1 and i==0 then
fill_NUC123_SPI(e,t,"D",0,"SPISS20",2,"GCR_ALT_MFP1")
else
fill_invalid_GPIO(e,t,"D",0,"GCR_ALT_MFP1")
end
a[49]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],2),1)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],131072),17)
e={}
e["pin_no"]="50"
e["texts"]={"SPISS01","SPICLK2","ADC1","PD.1"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"D",1,nil,"GCR_ALT_MFP1")
elseif i==1 and o==1 then
fill_NUC123_ADC(e,t,"D",1,"ADC1","GCR_ALT_MFP1")
elseif i==1 and o==0 then
fill_NUC123_SPI(e,t,"D",1,"SPICLK2",2,"GCR_ALT_MFP1")
elseif i==0 and o==1 then
fill_NUC123_SPI(e,t,"D",1,"SPISS01",0,"GCR_ALT_MFP1")
end
a[50]=e
local i=ext.rshift(ext.band(t["GCR_GPD_MFP"],4),2)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],262144),18)
e={}
e["pin_no"]="51"
e["texts"]={"MISO01","MISO20","ADC2","PD.2"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"D",2,nil,"GCR_ALT_MFP1")
elseif o==1 and i==1 then
fill_NUC123_ADC(e,t,"D",2,"ADC2","GCR_ALT_MFP1")
elseif o==1 and i==0 then
fill_NUC123_SPI(e,t,"D",2,"MISO20",2,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,2,true)
elseif o==0 and i==1 then
fill_NUC123_SPI(e,t,"D",2,"MISO01",0,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,0,true)
end
a[51]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],8),3)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],524288),19)
e={}
e["pin_no"]="52"
e["texts"]={"MOSI01","MOSI20","ADC3","PD.3"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"D",3,nil,"GCR_ALT_MFP1")
elseif i==1 and o==1 then
fill_NUC123_ADC(e,t,"D",3,"ADC3","GCR_ALT_MFP1")
elseif i==1 and o==0 then
fill_NUC123_SPI(e,t,"D",3,"MOSI20",2,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,2,false)
elseif i==0 and o==1 then
fill_NUC123_SPI(e,t,"D",3,"MOSI01",0,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,0,false)
end
a[52]=e
local i=ext.rshift(ext.band(t["GCR_GPD_MFP"],16),4)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],1048576),20)
e={}
e["pin_no"]="53"
e["texts"]={"MISO21","ADC4","PD.4"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"D",4,nil,"GCR_ALT_MFP1")
elseif o==1 and i==1 then
fill_NUC123_ADC(e,t,"D",4,"ADC4","GCR_ALT_MFP1")
elseif o==1 and i==0 then
fill_NUC123_SPI(e,t,"D",4,"MISO21",2,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,2,true)
else
fill_invalid_GPIO(e,t,"D",4,"GCR_ALT_MFP1")
end
a[53]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFP"],32),5)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP1"],2097152),21)
e={}
e["pin_no"]="54"
e["texts"]={"MOSI21","ADC5","PD.5"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"D",5,nil,"GCR_ALT_MFP1")
elseif i==1 and o==1 then
fill_NUC123_ADC(e,t,"D",5,"ADC5","GCR_ALT_MFP1")
elseif i==1 and o==0 then
fill_NUC123_SPI(e,t,"D",5,"MOSI21",2,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,2,false)
else
fill_invalid_GPIO(e,t,"D",5,"GCR_ALT_MFP1")
end
a[54]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],32768),15)
local i=ext.rshift(ext.band(t["GCR_ALT_MFP"],16777216),24)
e={}
e["pin_no"]="55"
e["texts"]={"T0EX","/INT1","PB.15"}
if i==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",15,nil,"GCR_ALT_MFP")
elseif i==0 and o==1 then
fill_NUC123_Normal(e,t,"B",15,"/INT1","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif i==1 and o==1 then
fill_NUC123_TM(e,t,"B",15,"T0EX",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",15,"GCR_ALT_MFP")
end
a[55]=e
local o=ext.band(t["GCR_GPF_MFP"],1)
e={}
e["pin_no"]="56"
e["texts"]={"XT1_OUT","PF.0"}
if o==0 then
fill_NUC123_GPIO(e,t,"F",0)
elseif o==1 then
fill_NUC123_Normal(e,t,"F",0,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
end
a[56]=e
local o=ext.rshift(ext.band(t["GCR_GPF_MFP"],2),1)
e={}
e["pin_no"]="57"
e["texts"]={"XT1_IN","PF.1"}
if o==0 then
fill_NUC123_GPIO(e,t,"F",1)
elseif o==1 then
fill_NUC123_Normal(e,t,"F",1,"XT1_IN")
e["direction"]=kPinDirection_In
end
a[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"/RESET"}
fill_NUC123_Normal(e,t,nil,nil,"/RESET")
e["direction"]=kPinDirection_In
a[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"VSS"}
fill_NUC123_Normal(e,t,nil,nil,"VSS")
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"VDD"}
fill_NUC123_Normal(e,t,nil,nil,"VDD")
a[60]=e
local i=ext.rshift(ext.band(t["GCR_GPF_MFP"],4),2)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],50331648),24)
e={}
e["pin_no"]="61"
e["texts"]={"PS2DAT","I2C0SDA","ADC6","PF.2"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"F",2,nil,"GCR_ALT_MFP1")
elseif o==3 and i==1 then
fill_NUC123_ADC(e,t,"F",2,"ADC6","GCR_ALT_MFP1")
elseif o==2 and i==1 then
fill_NUC123_I2C(e,t,"F",2,"I2C0SDA",0,"GCR_ALT_MFP1")
elseif o==0 and i==1 then
fill_NUC123_PS2(e,t,"PS2DAT")
else
fill_invalid_GPIO(e,t,"F",2,"GCR_ALT_MFP1")
end
a[61]=e
local i=ext.rshift(ext.band(t["GCR_GPF_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],201326592),26)
e={}
e["pin_no"]="62"
e["texts"]={"PS2CLK","I2C0SCL","ADC7","PF.3"}
if o==0 and i==0 then
fill_NUC123_GPIO(e,t,"F",3,nil,"GCR_ALT_MFP1")
elseif o==3 and i==1 then
fill_NUC123_ADC(e,t,"F",3,"ADC7","GCR_ALT_MFP1")
elseif o==2 and i==1 then
fill_NUC123_I2C(e,t,"F",3,"I2C0SCL",0,"GCR_ALT_MFP1")
elseif o==0 and i==1 then
fill_NUC123_PS2(e,t,"PS2CLK")
else
fill_invalid_GPIO(e,t,"F",3,"GCR_ALT_MFP1")
end
a[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"PVSS"}
fill_NUC123_Normal(e,t,nil,nil,"PVSS")
a[63]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],256),8)
e={}
e["pin_no"]="64"
e["texts"]={"TM0","PB.8"}
if o==0 then
fill_NUC123_GPIO(e,t,"B",8)
elseif o==1 then
fill_NUC123_TM(e,t,"B",8,"TM0",0)
end
a[64]=e
return{name=n,information="",pins=a}
end
