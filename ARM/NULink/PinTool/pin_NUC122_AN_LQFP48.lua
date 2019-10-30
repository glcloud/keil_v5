local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC122_AN_LQFP48(s,t,o,e)
local a={}
local t=read_NUC100_Registers(s,t,o,e)
local e
local o=ext.band(t["GCR_ALT_MFP"],2048)
e={}
e["pin_no"]="1"
e["texts"]={"PVSS"}
e["highlight_text"]="PVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"X32O"}
e["highlight_text"]="X32O"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"X32I"}
e["highlight_text"]="X32I"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[3]=e
local i=ext.band(t["GCR_GPA_MFP"],2048)
e={}
e["pin_no"]="4"
e["texts"]={"PA.11","I2C1SCL"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",11,"GCR_ALT_MFP")
end
a[4]=e
local i=ext.band(t["GCR_GPA_MFP"],1024)
e={}
e["pin_no"]="5"
e["texts"]={"PA.10","I2C1SDA"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",10,"GCR_ALT_MFP")
end
a[5]=e
local i=ext.band(t["GCR_ALT_MFP"],32768)
local n=ext.band(t["GCR_GPB_MFP"],16)
e={}
e["pin_no"]="6"
e["texts"]={"PB.4","RXD1"}
if n==0 then
fill_NUC100_GPIO(e,t,"B",4)
elseif i==0 then
fill_NUC100_UART(e,t,"B",4,"RXD1",1,"GCR_ALT_MFP")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",4,"GCR_ALT_MFP")
end
a[6]=e
local i=ext.band(t["GCR_GPB_MFP"],32)
e={}
e["pin_no"]="7"
e["texts"]={"PB.5","TXD1"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",5)
else
fill_NUC100_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
end
a[7]=e
local i=ext.band(t["GCR_ALT_MFP"],131072)
local n=ext.band(t["GCR_GPB_MFP"],64)
e={}
e["pin_no"]="8"
e["texts"]={"PB.6","RTS1"}
if i==0 and n==0 then
fill_NUC100_GPIO(e,t,"B",6,nil,"GCR_ALT_MFP")
elseif i==0 and n~=0 then
fill_NUC100_UART(e,t,"B",6,"RTS1",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",6,"GCR_ALT_MFP")
end
a[8]=e
local n=ext.band(t["GCR_ALT_MFP"],65536)
local i=ext.band(t["GCR_GPB_MFP"],128)
e={}
e["pin_no"]="9"
e["texts"]={"PB.7","CTS1"}
if n==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",7,nil,"GCR_ALT_MFP")
elseif n==0 and i~=0 then
fill_NUC100_UART(e,t,"B",7,"CTS1",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",7,"GCR_ALT_MFP")
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"LDO"}
e["highlight_text"]="LDO"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"VBUS"}
e["highlight_text"]="VBUS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"VDD33"}
e["highlight_text"]="VDD33"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"D-"}
fill_NUC100_USB(e,t,"D-")
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"D+"}
fill_NUC100_USB(e,t,"D+")
a[16]=e
local i=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="17"
e["texts"]={"PB.0","RXD0"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",0)
else
fill_NUC100_UART(e,t,"B",0,"RXD0",0)
e["direction"]=kPinDirection_In
end
a[17]=e
local i=ext.band(t["GCR_GPB_MFP"],2)
e={}
e["pin_no"]="18"
e["texts"]={"PB.1","TXD0"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",1)
else
fill_NUC100_UART(e,t,"B",1,"TXD0",0)
e["direction"]=kPinDirection_PushPullOut
end
a[18]=e
local n=ext.band(t["GCR_ALT_MFP"],256)
local i=ext.band(t["GCR_GPC_MFP"],8)
e={}
e["pin_no"]="19"
e["texts"]={"PC.3","MOSI00"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP")
end
a[19]=e
local n=ext.band(t["GCR_ALT_MFP"],128)
local i=ext.band(t["GCR_GPC_MFP"],4)
e={}
e["pin_no"]="20"
e["texts"]={"PC.2","MISO00"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP")
end
a[20]=e
local n=ext.band(t["GCR_ALT_MFP"],64)
local i=ext.band(t["GCR_GPC_MFP"],2)
e={}
e["pin_no"]="21"
e["texts"]={"PC.1","SPICLK0"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP")
end
a[21]=e
local n=ext.band(t["GCR_ALT_MFP"],32)
local i=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="22"
e["texts"]={"PC.0","SPISS00"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP")
end
a[22]=e
local n=ext.band(t["GCR_ALT_MFP"],1)
local i=ext.band(t["GCR_GPB_MFP"],1024)
e={}
e["pin_no"]="23"
e["texts"]={"PB.10","SPISS01","TM2"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",10,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_TM(e,t,"B",10,"TM2",2,"GCR_ALT_MFP")
else
fill_NUC100_SPI(e,t,"B",10,"SPISS01",0,"GCR_ALT_MFP")
end
a[23]=e
local n=ext.band(t["GCR_ALT_MFP"],2)
local i=ext.band(t["GCR_GPB_MFP"],512)
e={}
e["pin_no"]="24"
e["texts"]={"PB.9","SPISS11","TM1"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",9,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_TM(e,t,"B",9,"TM1",1,"GCR_ALT_MFP")
else
fill_NUC100_SPI(e,t,"B",9,"SPISS11",1,"GCR_ALT_MFP")
end
a[24]=e
local n=ext.band(t["GCR_ALT_MFP"],2097152)
local i=ext.band(t["GCR_GPC_MFP"],8192)
e={}
e["pin_no"]="25"
e["texts"]={"PC.13"}
if n==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",13,nil,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",13,"GCR_ALT_MFP")
end
a[25]=e
local i=ext.band(t["GCR_ALT_MFP"],8192)
local n=ext.band(t["GCR_GPC_MFP"],4096)
e={}
e["pin_no"]="26"
e["texts"]={"PC.12"}
if i==0 and n==0 then
fill_NUC100_GPIO(e,t,"C",12,nil,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",12,"GCR_ALT_MFP")
end
a[26]=e
local i=ext.band(t["GCR_ALT_MFP"],524288)
local n=ext.band(t["GCR_GPC_MFP"],2048)
e={}
e["pin_no"]="27"
e["texts"]={"MOSI10","PC.11"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",11,nil,"GCR_ALT_MFP")
elseif i==0 then
fill_NUC100_SPI(e,t,"C",11,"MOSI10",1,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,1,false)
else
fill_invalid_GPIO(e,t,"C",11,"GCR_ALT_MFP")
end
a[27]=e
local n=ext.band(t["GCR_ALT_MFP"],262144)
local i=ext.band(t["GCR_GPC_MFP"],1024)
e={}
e["pin_no"]="28"
e["texts"]={"MISO10","PC.10"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",10,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",10,"MISO10",1,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"C",10,"GCR_ALT_MFP")
end
a[28]=e
local n=ext.band(t["GCR_ALT_MFP"],131072)
local i=ext.band(t["GCR_GPC_MFP"],512)
e={}
e["pin_no"]="29"
e["texts"]={"SPICLK1","PC.9"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",9,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",9,"SPICLK1",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",9,"GCR_ALT_MFP")
end
a[29]=e
local i=ext.band(t["GCR_ALT_MFP"],65536)
local n=ext.band(t["GCR_GPC_MFP"],256)
e={}
e["pin_no"]="30"
e["texts"]={"SPISS10","PC.8"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",8,nil,"GCR_ALT_MFP")
elseif i==0 then
fill_NUC100_SPI(e,t,"C",8,"SPISS10",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",8,"GCR_ALT_MFP")
end
a[30]=e
local i=ext.band(t["GCR_ALT_MFP"],512)
local n=ext.band(t["GCR_GPA_MFP"],32768)
e={}
e["pin_no"]="31"
e["texts"]={"PWM3","PA.15"}
if n==0 then
fill_NUC100_GPIO(e,t,"A",15,nil,"GCR_ALT_MFP")
elseif i==0 then
fill_NUC100_PWM(e,t,"A",15,"PWM3","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",15,"GCR_ALT_MFP")
end
a[31]=e
local i=ext.band(t["GCR_GPA_MFP"],16384)
e={}
e["pin_no"]="32"
e["texts"]={"PWM2","PA.14"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",14,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_PWM(e,t,"A",14,"PWM2","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",14,"GCR_ALT_MFP")
end
a[32]=e
local i=ext.band(t["GCR_GPA_MFP"],8192)
e={}
e["pin_no"]="33"
e["texts"]={"PWM1","PA.13"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",13,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_PWM(e,t,"A",13,"PWM1","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",13,"GCR_ALT_MFP")
end
a[33]=e
local i=ext.band(t["GCR_GPA_MFP"],4096)
e={}
e["pin_no"]="34"
e["texts"]={"PWM0","PA.12"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",12,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_PWM(e,t,"A",12,"PWM0","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",12,"GCR_ALT_MFP")
end
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"ICE_DAT"}
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"ICE_CK"}
e["highlight_text"]="ICE_CK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[36]=e
e={}
e["pin_no"]="37"
e["texts"]={"AVDD"}
e["highlight_text"]="AVDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[37]=e
local o=ext.band(t["GCR_GPD_MFP"],1)
e={}
e["pin_no"]="38"
e["texts"]={"PD.0"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",0)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[38]=e
local o=ext.band(t["GCR_GPD_MFP"],2)
e={}
e["pin_no"]="39"
e["texts"]={"PD.1"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",1)
else
fill_invalid_GPIO(e,t,"D",1)
end
a[39]=e
local o=ext.band(t["GCR_GPD_MFP"],4)
e={}
e["pin_no"]="40"
e["texts"]={"PD.2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",2)
else
fill_invalid_GPIO(e,t,"D",2)
end
a[40]=e
local o=ext.band(t["GCR_GPD_MFP"],8)
e={}
e["pin_no"]="41"
e["texts"]={"PD.3"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",3)
else
fill_invalid_GPIO(e,t,"D",3)
end
a[41]=e
local o=ext.band(t["GCR_GPD_MFP"],16)
e={}
e["pin_no"]="42"
e["texts"]={"PD.4"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",4)
else
fill_invalid_GPIO(e,t,"D",4)
end
a[42]=e
local o=ext.band(t["GCR_GPD_MFP"],32)
e={}
e["pin_no"]="43"
e["texts"]={"PD.5"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",5)
else
fill_invalid_GPIO(e,t,"D",5)
end
a[43]=e
e={}
e["pin_no"]="44"
e["texts"]={"XT1_OUT"}
e["highlight_text"]="XT1_OUT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"XT1_IN"}
e["highlight_text"]="XT1_IN"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"RESET#"}
e["highlight_text"]="RESET#"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"PS2DAT"}
fill_NUC100_PS2(e,t,"PS2DAT")
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"PS2CLK"}
fill_NUC100_PS2(e,t,"PS2CLK")
a[48]=e
return{name=s,information="",pins=a}
end
