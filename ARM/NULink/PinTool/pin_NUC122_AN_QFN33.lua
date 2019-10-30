local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC122_AN_QFN33(i,t,o,e)
local a={}
local t=read_NUC100_Registers(i,t,o,e)
local e
local o=ext.band(t["GCR_ALT_MFP"],2048)
local n=ext.band(t["GCR_ALT_MFP"],8)
local s=ext.band(t["GCR_GPB_MFP"],16384)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","INT0#"}
if s==0 then
fill_NUC100_GPIO(e,t,"B",14)
elseif n==0 then
fill_NUC100_GPIO(e,t,"B",14,"INT0#","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
else
fill_invalid_GPIO(e,t,"B",14,"GCR_ALT_MFP")
end
a[1]=e
local n=ext.band(t["GCR_GPA_MFP"],2048)
e={}
e["pin_no"]="2"
e["texts"]={"PA.11","I2C1SCL"}
if n==0 then
fill_NUC100_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",11,"GCR_ALT_MFP")
end
a[2]=e
local n=ext.band(t["GCR_GPA_MFP"],1024)
e={}
e["pin_no"]="3"
e["texts"]={"PA.10","I2C1SDA"}
if n==0 then
fill_NUC100_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",10,"GCR_ALT_MFP")
end
a[3]=e
local n=ext.band(t["GCR_ALT_MFP"],32768)
local o=ext.band(t["GCR_GPB_MFP"],16)
e={}
e["pin_no"]="4"
e["texts"]={"PB.4","RXD1","SPISS11"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",4)
elseif n==0 then
fill_NUC100_UART(e,t,"B",4,"RXD1",1,"GCR_ALT_MFP")
e["direction"]=kPinDirection_In
else
fill_NUC100_SPI(e,t,"B",4,"SPISS11",1,"GCR_ALT_MFP")
end
a[4]=e
local o=ext.band(t["GCR_GPB_MFP"],32)
e={}
e["pin_no"]="5"
e["texts"]={"PB.5","TXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",5)
else
fill_NUC100_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"LDO"}
e["highlight_text"]="LDO"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"VBUS"}
e["highlight_text"]="VBUS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"VDD33"}
e["highlight_text"]="VDD33"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"D-"}
fill_NUC100_USB(e,t,"D-")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"D+"}
fill_NUC100_USB(e,t,"D+")
a[12]=e
local n=ext.band(t["GCR_ALT_MFP"],256)
local o=ext.band(t["GCR_GPC_MFP"],8)
e={}
e["pin_no"]="13"
e["texts"]={"PC.3","MOSI00"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",3)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP")
end
a[13]=e
local n=ext.band(t["GCR_ALT_MFP"],128)
local o=ext.band(t["GCR_GPC_MFP"],4)
e={}
e["pin_no"]="14"
e["texts"]={"PC.2","MISO00"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",2)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP")
end
a[14]=e
local n=ext.band(t["GCR_ALT_MFP"],64)
local o=ext.band(t["GCR_GPC_MFP"],2)
e={}
e["pin_no"]="15"
e["texts"]={"PC.1","SPICLK0"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",1)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP")
end
a[15]=e
local n=ext.band(t["GCR_ALT_MFP"],32)
local o=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="16"
e["texts"]={"PC.0","SPISS00"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",0)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP")
end
a[16]=e
local n=ext.band(t["GCR_ALT_MFP"],2097152)
local o=ext.band(t["GCR_GPC_MFP"],8192)
e={}
e["pin_no"]="17"
e["texts"]={"PC.13"}
if n==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",13,nil,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",13,"GCR_ALT_MFP")
end
a[17]=e
local n=ext.band(t["GCR_ALT_MFP"],8192)
local o=ext.band(t["GCR_GPC_MFP"],4096)
e={}
e["pin_no"]="18"
e["texts"]={"PC.12"}
if n==0 and o==0 then
fill_NUC100_GPIO(e,t,"C",12,nil,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",12,"GCR_ALT_MFP")
end
a[18]=e
local o=ext.band(t["GCR_ALT_MFP"],524288)
local n=ext.band(t["GCR_GPC_MFP"],2048)
e={}
e["pin_no"]="19"
e["texts"]={"MOSI10","PC.11"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",11)
elseif o==0 then
fill_NUC100_SPI(e,t,"C",11,"MOSI10",1,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,1,false)
else
fill_invalid_GPIO(e,t,"C",11,"GCR_ALT_MFP")
end
a[19]=e
local n=ext.band(t["GCR_ALT_MFP"],262144)
local o=ext.band(t["GCR_GPC_MFP"],1024)
e={}
e["pin_no"]="20"
e["texts"]={"MISO10","PC.10"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",10)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",10,"MISO10",1,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"C",10,"GCR_ALT_MFP")
end
a[20]=e
local o=ext.band(t["GCR_ALT_MFP"],131072)
local n=ext.band(t["GCR_GPC_MFP"],512)
e={}
e["pin_no"]="21"
e["texts"]={"SPICLK1","PC.9"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",9)
elseif o==0 then
fill_NUC100_SPI(e,t,"C",9,"SPICLK1",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",9,"GCR_ALT_MFP")
end
a[21]=e
local n=ext.band(t["GCR_ALT_MFP"],65536)
local o=ext.band(t["GCR_GPC_MFP"],256)
e={}
e["pin_no"]="22"
e["texts"]={"SPISS10","PC.8"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",8)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",8,"SPISS10",1,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",8,"GCR_ALT_MFP")
end
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"ICE_DAT"}
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"ICE_CK"}
e["highlight_text"]="ICE_CK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"AVDD"}
e["highlight_text"]="AVDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[25]=e
local o=ext.band(t["GCR_GPD_MFP"],2)
e={}
e["pin_no"]="26"
e["texts"]={"SPISS01","PD.1"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",1)
else
fill_NUC100_SPI(e,t,"D",1,"SPISS01",0)
end
a[26]=e
local o=ext.band(t["GCR_GPD_MFP"],4)
e={}
e["pin_no"]="27"
e["texts"]={"PD.2"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",2)
else
fill_invalid_GPIO(e,t,"D",2,"GCR_ALT_MFP")
end
a[27]=e
local o=ext.band(t["GCR_GPD_MFP"],8)
e={}
e["pin_no"]="28"
e["texts"]={"PD.3"}
if o==0 then
fill_NUC100_GPIO(e,t,"D",3)
else
fill_invalid_GPIO(e,t,"D",3)
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"XT1_OUT"}
e["highlight_text"]="XT1_OUT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"XT1_IN"}
e["highlight_text"]="XT1_IN"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"RESET#"}
e["highlight_text"]="RESET#"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"PVSS"}
e["highlight_text"]="PVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[32]=e
return{name=i,information="",pins=a}
end
