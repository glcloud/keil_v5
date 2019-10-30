local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC120_AN_LQFP100(i,t,e,o)
local a={}
local t=read_NUC100_Registers(i,t,e,o)
local e
e={}
e["pin_no"]="1"
e["texts"]={"PE.15"}
fill_NUC100_GPIO(e,t,"E",15)
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"PE.14"}
fill_NUC100_GPIO(e,t,"E",14)
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"PE.13"}
fill_NUC100_GPIO(e,t,"E",13)
a[3]=e
local n=ext.band(t["GCR_ALT_MFP"],8)
local o=ext.band(t["GCR_GPB_MFP"],16384)
e={}
e["pin_no"]="4"
e["texts"]={"PB.14","INT0#","SPISS31"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",14,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_GPIO(e,t,"B",14,"INT0#","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
else
fill_NUC100_SPI(e,t,"B",14,"SPISS31",3,"GCR_ALT_MFP")
end
a[4]=e
local o=ext.band(t["GCR_GPB_MFP"],8192)
e={}
e["pin_no"]="5"
e["texts"]={"PB.13","CPO1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",13)
else
fill_NUC100_ACMP(e,t,"B",13,"CPO1")
e["direction"]=kPinDirection_PushPullOut
end
a[5]=e
local o=ext.band(t["GCR_ALT_MFP"],1024)
local n=ext.band(t["GCR_GPB_MFP"],4096)
e={}
e["pin_no"]="6"
e["texts"]={"PB.12","CPO0","CLKO"}
if n==0 then
fill_NUC100_GPIO(e,t,"B",12,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_ACMP(e,t,"B",12,"CPO0","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
else
fill_NUC100_CLKO(e,t,"B",12,"CLKO","GCR_ALT_MFP")
end
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"X32O"}
e["highlight_text"]="X32O"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"X32I"}
e["highlight_text"]="X32I"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[8]=e
local o=ext.band(t["GCR_GPA_MFP"],2048)
e={}
e["pin_no"]="9"
e["texts"]={"PA.11","I2C1SCL"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",11)
else
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1)
end
a[9]=e
local o=ext.band(t["GCR_GPA_MFP"],1024)
e={}
e["pin_no"]="10"
e["texts"]={"PA.10","I2C1SDA"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",10)
else
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1)
end
a[10]=e
local o=ext.band(t["GCR_GPA_MFP"],512)
e={}
e["pin_no"]="11"
e["texts"]={"PA.9","I2C0SCL"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",9)
else
fill_NUC100_I2C(e,t,"A",9,"I2C0SCL",0)
end
a[11]=e
local o=ext.band(t["GCR_GPA_MFP"],256)
e={}
e["pin_no"]="12"
e["texts"]={"PA.8","I2C0SDA"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",8)
else
fill_NUC100_I2C(e,t,"A",8,"I2C0SDA",0)
end
a[12]=e
local o=ext.band(t["GCR_GPD_MFP"],256)
e={}
e["pin_no"]="13"
e["texts"]={"PD.8","SPISS30"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",8)
else
fill_NUC100_SPI(e,t,"D",8,"SPISS30",3)
end
a[13]=e
local o=ext.band(t["GCR_GPD_MFP"],512)
e={}
e["pin_no"]="14"
e["texts"]={"PD.9","SPICLK3"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",9)
else
fill_NUC100_SPI(e,t,"D",9,"SPICLK3",3)
end
a[14]=e
local o=ext.band(t["GCR_GPD_MFP"],1024)
e={}
e["pin_no"]="15"
e["texts"]={"PD.10","MISO30"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",10)
else
fill_NUC100_SPI(e,t,"D",10,"MISO30",3)
fill_NUC100_SPI_IO(e,t,3,true)
end
a[15]=e
local o=ext.band(t["GCR_GPD_MFP"],2048)
e={}
e["pin_no"]="16"
e["texts"]={"PD.11","MOSI30"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",11)
else
fill_NUC100_SPI(e,t,"D",11,"MOSI30",3)
fill_NUC100_SPI_IO(e,t,3,false)
end
a[16]=e
local o=ext.band(t["GCR_GPD_MFP"],4096)
e={}
e["pin_no"]="17"
e["texts"]={"PD.12","MISO31"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",12)
else
fill_NUC100_SPI(e,t,"D",12,"MISO31",3)
fill_NUC100_SPI_IO(e,t,3,true)
end
a[17]=e
local o=ext.band(t["GCR_GPD_MFP"],8192)
e={}
e["pin_no"]="18"
e["texts"]={"PD.13","MOSI31"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",13)
else
fill_NUC100_SPI(e,t,"D",13,"MOSI31",3)
fill_NUC100_SPI_IO(e,t,3,false)
end
a[18]=e
local o=ext.band(t["GCR_GPB_MFP"],16)
e={}
e["pin_no"]="19"
e["texts"]={"PB.4","RXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",4)
else
fill_NUC100_UART(e,t,"B",4,"RXD1",1)
e["direction"]=kPinDirection_In
end
a[19]=e
local o=ext.band(t["GCR_GPB_MFP"],32)
e={}
e["pin_no"]="20"
e["texts"]={"PB.5","TXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",5)
else
fill_NUC100_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
end
a[20]=e
local o=ext.band(t["GCR_GPB_MFP"],64)
e={}
e["pin_no"]="21"
e["texts"]={"PB.6","RTS1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",6)
else
fill_NUC100_UART(e,t,"B",6,"RTS1",1)
end
a[21]=e
local o=ext.band(t["GCR_GPB_MFP"],128)
e={}
e["pin_no"]="22"
e["texts"]={"PB.7","CTS1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",7)
else
fill_NUC100_UART(e,t,"B",7,"CTS1",1)
end
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"LDO"}
e["highlight_text"]="LDO"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"PE.8"}
fill_NUC100_GPIO(e,t,"E",8)
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"PE.7"}
fill_NUC100_GPIO(e,t,"E",7)
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"VBUS"}
e["highlight_text"]="VBUS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"VDD33"}
e["highlight_text"]="VDD33"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"D-"}
fill_NUC100_USB(e,t,"D-")
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"D+"}
fill_NUC100_USB(e,t,"D+")
a[31]=e
local o=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="32"
e["texts"]={"PB.0","RXD0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",0)
else
fill_NUC100_UART(e,t,"B",0,"RXD0",0)
e["direction"]=kPinDirection_In
end
a[32]=e
local o=ext.band(t["GCR_GPB_MFP"],2)
e={}
e["pin_no"]="33"
e["texts"]={"PB.1","TXD0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",1)
else
fill_NUC100_UART(e,t,"B",1,"TXD0",0)
e["direction"]=kPinDirection_PushPullOut
end
a[33]=e
local o=ext.band(t["GCR_GPB_MFP"],4)
e={}
e["pin_no"]="34"
e["texts"]={"PB.2","RTS0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",2)
else
fill_NUC100_UART(e,t,"B",2,"RTS0",0)
end
a[34]=e
local o=ext.band(t["GCR_GPB_MFP"],8)
e={}
e["pin_no"]="35"
e["texts"]={"PB.3","CTS0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",3)
else
fill_NUC100_UART(e,t,"B",3,"CTS0",0)
end
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"PD.6"}
fill_NUC100_GPIO(e,t,"D",6)
a[36]=e
e={}
e["pin_no"]="37"
e["texts"]={"PD.7"}
fill_NUC100_GPIO(e,t,"D",7)
a[37]=e
local o=ext.band(t["GCR_GPD_MFP"],16384)
e={}
e["pin_no"]="38"
e["texts"]={"PD.14","RXD2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",14)
else
fill_NUC100_UART(e,t,"D",14,"RXD2",2)
e["direction"]=kPinDirection_In
end
a[38]=e
local o=ext.band(t["GCR_GPD_MFP"],32768)
e={}
e["pin_no"]="39"
e["texts"]={"PD.15","TXD2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",15)
else
fill_NUC100_UART(e,t,"D",15,"TXD2",2)
e["direction"]=kPinDirection_PushPullOut
end
a[39]=e
local o=ext.band(t["GCR_GPC_MFP"],32)
e={}
e["pin_no"]="40"
e["texts"]={"PC.5","MOSI01"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",5)
else
fill_NUC100_SPI(e,t,"C",5,"MOSI01",0)
fill_NUC100_SPI_IO(e,t,0,false)
end
a[40]=e
local o=ext.band(t["GCR_GPC_MFP"],16)
e={}
e["pin_no"]="41"
e["texts"]={"PC.4","MISO01"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",4)
else
fill_NUC100_SPI(e,t,"C",4,"MISO01",0)
fill_NUC100_SPI_IO(e,t,0,true)
end
a[41]=e
local n=ext.band(t["GCR_ALT_MFP"],256)
local o=ext.band(t["GCR_GPC_MFP"],8)
e={}
e["pin_no"]="42"
e["texts"]={"PC.3","MOSI00","I2SDO"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
else
fill_NUC100_I2S(e,t,"C",3,"I2SDO","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
end
a[42]=e
local o=ext.band(t["GCR_ALT_MFP"],128)
local n=ext.band(t["GCR_GPC_MFP"],4)
e={}
e["pin_no"]="43"
e["texts"]={"PC.2","MISO00","I2SDI"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
else
fill_NUC100_I2S(e,t,"C",2,"I2SDI","GCR_ALT_MFP")
e["direction"]=kPinDirection_In
end
a[43]=e
local o=ext.band(t["GCR_ALT_MFP"],64)
local n=ext.band(t["GCR_GPC_MFP"],2)
e={}
e["pin_no"]="44"
e["texts"]={"PC.1","SPICLK0","I2SBCLK"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"C",1,"I2SBCLK","GCR_ALT_MFP")
end
a[44]=e
local n=ext.band(t["GCR_ALT_MFP"],32)
local o=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="45"
e["texts"]={"PC.0","SPISS00","I2SLRCLK"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"C",0,"I2SLRCLK","GCR_ALT_MFP")
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"PE.6"}
fill_NUC100_GPIO(e,t,"E",6)
a[46]=e
local o=ext.band(t["GCR_GPE_MFP"],32)
e={}
e["pin_no"]="47"
e["texts"]={"PE.5","PWM5"}
if o==0 then
fill_NUC100_GPIO(e,t,"E",5)
else
fill_NUC100_PWM(e,t,"E",5,"PWM5")
end
a[47]=e
local s=ext.band(t["GCR_ALT_MFP"],16)
local n=ext.band(t["GCR_GPB_MFP"],2048)
e={}
e["pin_no"]="48"
e["texts"]={"PB.11","PWM4"}
if n==0 then
fill_NUC100_GPIO(e,t,"B",11,nil,"GCR_ALT_MFP")
elseif s==0 then
fill_invalid_GPIO(e,t,"B",11,"GCR_ALT_MFP")
else
fill_NUC100_PWM(e,t,"B",11,"PWM4","GCR_ALT_MFP")
end
a[48]=e
local s=ext.band(t["GCR_ALT_MFP"],1)
local n=ext.band(t["GCR_GPB_MFP"],1024)
e={}
e["pin_no"]="49"
e["texts"]={"PB.10","SPISS01"}
if n==0 then
fill_NUC100_GPIO(e,t,"B",10,nil,"GCR_ALT_MFP")
elseif s==0 then
fill_invalid_GPIO(e,t,"B",10,"GCR_ALT_MFP")
else
fill_NUC100_SPI(e,t,"B",10,"SPISS01",0,"GCR_ALT_MFP")
end
a[49]=e
local n=ext.band(t["GCR_ALT_MFP"],2)
local s=ext.band(t["GCR_GPB_MFP"],512)
e={}
e["pin_no"]="50"
e["texts"]={"PB.9","SPISS11"}
if s==0 then
fill_NUC100_GPIO(e,t,"B",9,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_invalid_GPIO(e,t,"B",9,"GCR_ALT_MFP")
else
fill_NUC100_SPI(e,t,"B",9,"SPISS11",1,"GCR_ALT_MFP")
end
a[50]=e
e={}
e["pin_no"]="51"
e["texts"]={"PE.4"}
fill_NUC100_GPIO(e,t,"E",4)
a[51]=e
e={}
e["pin_no"]="52"
e["texts"]={"PE.3"}
fill_NUC100_GPIO(e,t,"E",3)
a[52]=e
e={}
e["pin_no"]="53"
e["texts"]={"PE.2"}
fill_NUC100_GPIO(e,t,"E",2)
a[53]=e
local n=ext.band(t["GCR_GPE_MFP"],2)
e={}
e["pin_no"]="54"
e["texts"]={"PWM7","PE.1"}
if n==0 then
fill_NUC100_GPIO(e,t,"E",1)
else
fill_NUC100_PWM(e,t,"E",1,"PWM7")
end
a[54]=e
local n=ext.band(t["GCR_GPE_MFP"],1)
e={}
e["pin_no"]="55"
e["texts"]={"PWM6","PE.0"}
if o==0 then
fill_NUC100_GPIO(e,t,"E",0)
else
fill_NUC100_PWM(e,t,"E",0,"PWM6")
end
a[55]=e
local o=ext.band(t["GCR_GPC_MFP"],8192)
e={}
e["pin_no"]="56"
e["texts"]={"MOSI11","PC.13"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",13)
else
fill_NUC100_SPI(e,t,"C",13,"MOSI11",1)
fill_NUC100_SPI_IO(e,t,1,false)
end
a[56]=e
local o=ext.band(t["GCR_GPC_MFP"],4096)
e={}
e["pin_no"]="57"
e["texts"]={"MISO11","PC.12"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",12)
else
fill_NUC100_SPI(e,t,"C",12,"MISO11",1)
fill_NUC100_SPI_IO(e,t,1,true)
end
a[57]=e
local o=ext.band(t["GCR_GPC_MFP"],2048)
e={}
e["pin_no"]="58"
e["texts"]={"MOSI10","PC.11"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",11)
else
fill_NUC100_SPI(e,t,"C",11,"MOSI10",1)
fill_NUC100_SPI_IO(e,t,1,false)
end
a[58]=e
local o=ext.band(t["GCR_GPC_MFP"],1024)
e={}
e["pin_no"]="59"
e["texts"]={"MISO10","PC.10"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",10)
else
fill_NUC100_SPI(e,t,"C",10,"MISO10",1)
fill_NUC100_SPI_IO(e,t,1,true)
end
a[59]=e
local o=ext.band(t["GCR_GPC_MFP"],512)
e={}
e["pin_no"]="60"
e["texts"]={"SPICLK1","PC.9"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",9)
else
fill_NUC100_SPI(e,t,"C",9,"SPICLK1",1)
end
a[60]=e
local o=ext.band(t["GCR_GPC_MFP"],256)
e={}
e["pin_no"]="61"
e["texts"]={"SPISS10","PC.8"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",8)
else
fill_NUC100_SPI(e,t,"C",8,"SPISS10",1)
end
a[61]=e
local n=ext.band(t["GCR_ALT_MFP"],512)
local o=ext.band(t["GCR_GPA_MFP"],32768)
e={}
e["pin_no"]="62"
e["texts"]={"I2SMCLK","PWM3","PA.15"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",15,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_PWM(e,t,"A",15,"PWM3","GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"A",15,"I2SMCLK","GCR_ALT_MFP")
end
a[62]=e
local o=ext.band(t["GCR_GPA_MFP"],16384)
e={}
e["pin_no"]="63"
e["texts"]={"PWM2","PA.14"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",14)
else
fill_NUC100_PWM(e,t,"A",14,"PWM2")
end
a[63]=e
local o=ext.band(t["GCR_GPA_MFP"],8192)
e={}
e["pin_no"]="64"
e["texts"]={"PWM1","PA.13"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",13)
else
fill_NUC100_PWM(e,t,"A",13,"PWM1")
end
a[64]=e
local o=ext.band(t["GCR_GPA_MFP"],4096)
e={}
e["pin_no"]="65"
e["texts"]={"PWM0","PA.12"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",12)
else
fill_NUC100_PWM(e,t,"A",12,"PWM0")
end
a[65]=e
e={}
e["pin_no"]="66"
e["texts"]={"ICE_DAT"}
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
a[66]=e
e={}
e["pin_no"]="67"
e["texts"]={"ICE_CK"}
e["highlight_text"]="ICE_CK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[67]=e
e={}
e["pin_no"]="68"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[68]=e
e={}
e["pin_no"]="69"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[69]=e
e={}
e["pin_no"]="70"
e["texts"]={"AVSS"}
e["highlight_text"]="AVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[70]=e
local o=ext.band(t["GCR_GPA_MFP"],1)
e={}
e["pin_no"]="71"
e["texts"]={"ADC0","PA.0"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",0)
else
fill_NUC100_ADC(e,t,"A",0,"ADC0")
end
a[71]=e
local o=ext.band(t["GCR_GPA_MFP"],2)
e={}
e["pin_no"]="72"
e["texts"]={"ADC1","PA.1"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",1)
else
fill_NUC100_ADC(e,t,"A",1,"ADC1")
end
a[72]=e
local o=ext.band(t["GCR_GPA_MFP"],4)
e={}
e["pin_no"]="73"
e["texts"]={"ADC2","PA.2"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",2)
else
fill_NUC100_ADC(e,t,"A",2,"ADC2")
end
a[73]=e
local o=ext.band(t["GCR_GPA_MFP"],8)
e={}
e["pin_no"]="74"
e["texts"]={"ADC3","PA.3"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",3)
else
fill_NUC100_ADC(e,t,"A",3,"ADC3")
end
a[74]=e
local o=ext.band(t["GCR_GPA_MFP"],16)
e={}
e["pin_no"]="75"
e["texts"]={"ADC4","PA.4"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",4)
else
fill_NUC100_ADC(e,t,"A",4,"ADC4")
end
a[75]=e
local o=ext.band(t["GCR_GPA_MFP"],32)
e={}
e["pin_no"]="76"
e["texts"]={"ADC5","PA.5"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",5)
else
fill_NUC100_ADC(e,t,"A",5,"ADC5")
end
a[76]=e
local o=ext.band(t["GCR_GPA_MFP"],64)
e={}
e["pin_no"]="77"
e["texts"]={"ADC6","PA.6"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",6)
else
fill_NUC100_ADC(e,t,"A",6,"ADC6")
end
a[77]=e
local o=ext.band(t["GCR_ALT_MFP"],4)
local n=ext.band(t["GCR_GPA_MFP"],128)
e={}
e["pin_no"]="78"
e["texts"]={"ADC7","SPISS21","PA.7"}
if n==0 then
fill_NUC100_GPIO(e,t,"A",7,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_ADC(e,t,"A",7,"ADC7","GCR_ALT_MFP")
else
fill_NUC100_SPI(e,t,"A",7,"SPISS21",2,"GCR_ALT_MFP")
end
a[78]=e
e={}
e["pin_no"]="79"
e["texts"]={"Vref"}
e["highlight_text"]="Vref"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[79]=e
e={}
e["pin_no"]="80"
e["texts"]={"AVDD"}
e["highlight_text"]="AVDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[80]=e
local o=ext.band(t["GCR_GPD_MFP"],1)
e={}
e["pin_no"]="81"
e["texts"]={"SPISS20","PD.0"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",0)
else
fill_NUC100_SPI(e,t,"D",0,"SPISS20",2)
end
a[81]=e
local o=ext.band(t["GCR_GPD_MFP"],2)
e={}
e["pin_no"]="82"
e["texts"]={"SPICLK2","PD.1"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",1)
else
fill_NUC100_SPI(e,t,"D",1,"SPICLK2",2)
end
a[82]=e
local o=ext.band(t["GCR_GPD_MFP"],4)
e={}
e["pin_no"]="83"
e["texts"]={"MISO20","PD.2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",2)
else
fill_NUC100_SPI(e,t,"D",2,"MISO20",2)
fill_NUC100_SPI_IO(e,t,2,true)
end
a[83]=e
local o=ext.band(t["GCR_GPD_MFP"],8)
e={}
e["pin_no"]="84"
e["texts"]={"MOSI20","PD.3"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",3)
else
fill_NUC100_SPI(e,t,"D",3,"MOSI20",2)
fill_NUC100_SPI_IO(e,t,2,false)
end
a[84]=e
local o=ext.band(t["GCR_GPD_MFP"],16)
e={}
e["pin_no"]="85"
e["texts"]={"MISO21","PD.4"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",4)
else
fill_NUC100_SPI(e,t,"D",4,"MISO21",2)
fill_NUC100_SPI_IO(e,t,2,true)
end
a[85]=e
local o=ext.band(t["GCR_GPD_MFP"],32)
e={}
e["pin_no"]="86"
e["texts"]={"MOSI21","PD.5"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",5)
else
fill_NUC100_SPI(e,t,"D",5,"MOSI21",2)
fill_NUC100_SPI_IO(e,t,2,false)
end
a[86]=e
local o=ext.band(t["GCR_GPC_MFP"],128)
e={}
e["pin_no"]="87"
e["texts"]={"CPN0","PC.7"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",7)
else
fill_NUC100_ACMP(e,t,"C",7,"CPN0")
end
a[87]=e
local o=ext.band(t["GCR_GPC_MFP"],64)
e={}
e["pin_no"]="88"
e["texts"]={"CPP0","PC.6"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",6)
else
fill_NUC100_ACMP(e,t,"C",6,"CPP0")
end
a[88]=e
local o=ext.band(t["GCR_GPC_MFP"],32768)
e={}
e["pin_no"]="89"
e["texts"]={"CPN1","PC.15"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",15)
else
fill_NUC100_ACMP(e,t,"C",15,"CPN1")
end
a[89]=e
local o=ext.band(t["GCR_GPC_MFP"],16384)
e={}
e["pin_no"]="90"
e["texts"]={"CPP1","PC.14"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",14)
else
fill_NUC100_ACMP(e,t,"C",14,"CPP1")
end
a[90]=e
local o=ext.band(t["GCR_GPB_MFP"],32768)
e={}
e["pin_no"]="91"
e["texts"]={"INT1#","PB.15"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",15)
else
fill_NUC100_GPIO(e,t,"B",15,"INT1#")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
end
a[91]=e
e={}
e["pin_no"]="92"
e["texts"]={"XT1_OUT"}
e["highlight_text"]="XT1_OUT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
a[92]=e
e={}
e["pin_no"]="93"
e["texts"]={"XT1_IN"}
e["highlight_text"]="XT1_IN"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[93]=e
e={}
e["pin_no"]="94"
e["texts"]={"RESET#"}
e["highlight_text"]="RESET#"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[94]=e
e={}
e["pin_no"]="95"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[95]=e
e={}
e["pin_no"]="96"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[96]=e
e={}
e["pin_no"]="97"
e["texts"]={"PS2DAT"}
fill_NUC100_PS2(e,t,"PS2DAT")
a[97]=e
e={}
e["pin_no"]="98"
e["texts"]={"PS2CLK"}
fill_NUC100_PS2(e,t,"PS2CLK")
a[98]=e
e={}
e["pin_no"]="99"
e["texts"]={"PVSS"}
e["highlight_text"]="PVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[99]=e
local o=ext.band(t["ADC_ADCR"],256)
local n=ext.band(t["ADC_ADCR"],48)
local s=ext.band(t["GCR_GPB_MFP"],256)
e={}
e["pin_no"]="100"
e["texts"]={"STADC","PB.8"}
if s==0 then
if o~=0 and n==0 then
fill_NUC100_GPIO(e,t,"B",8,"STADC,PB.8","ADC_ADCR")
e["texts"]={"STADC,PB.8"}
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
else
fill_NUC100_GPIO(e,t,"B",8,nil,"ADC_ADCR")
end
else
fill_invalid_GPIO(e,t,"B",8,"ADC_ADCR")
end
a[100]=e
return{name=i,information="",pins=a}
end
