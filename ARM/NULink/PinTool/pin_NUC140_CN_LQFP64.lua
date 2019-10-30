local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC140_CN_LQFP64(h,a,e,t)
local o={}
local t=read_NUC100_Registers(h,a,e,t)
local e
local a=ext.band(t["GCR_ALT_MFP"],2048)
local n=ext.band(t["GCR_ALT_MFP"],8)
local i=ext.band(t["GCR_GPB_MFP"],16384)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","INT0#"}
if n==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",14,nil,"GCR_ALT_MFP")
elseif n==0 and i~=0 then
fill_NUC100_GPIO(e,t,"B",14,"INT0#","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
else
fill_invalid_GPIO(e,t,"B",14,"GCR_ALT_MFP")
end
o[1]=e
local i=ext.band(t["GCR_GPB_MFP"],8192)
e={}
e["pin_no"]="2"
e["texts"]={"PB.13","CPO1","AD1"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",13,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_ACMP(e,t,"B",13,"CPO1","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"B",13,"AD1","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",13,"GCR_ALT_MFP")
end
o[2]=e
local n=ext.band(t["GCR_ALT_MFP"],1024)
local i=ext.band(t["GCR_GPB_MFP"],4096)
e={}
e["pin_no"]="3"
e["texts"]={"PB.12","CPO0","CLKO","AD0"}
if a==0 and n==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",12,nil,"GCR_ALT_MFP")
elseif a==0 and n==0 and i~=0 then
fill_NUC100_ACMP(e,t,"B",12,"CPO0","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
elseif a==0 and n~=0 and i~=0 then
fill_NUC100_CLKO(e,t,"B",12,"CLKO","GCR_ALT_MFP")
elseif a~=0 and n==0 and i~=0 then
fill_NUC100_EBI(e,t,"B",12,"AD0","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",12,"GCR_ALT_MFP")
end
o[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"X32O"}
e["highlight_text"]="X32O"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
o[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"X32I"}
e["highlight_text"]="X32I"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
o[5]=e
local i=ext.band(t["GCR_GPA_MFP"],2048)
e={}
e["pin_no"]="6"
e["texts"]={"PA.11","I2C1SCL","nRD"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1,"GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",11,"nRD","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",11,"GCR_ALT_MFP")
end
o[6]=e
local i=ext.band(t["GCR_GPA_MFP"],1024)
e={}
e["pin_no"]="7"
e["texts"]={"PA.10","I2C1SDA","nWR"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1,"GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",10,"nWR","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",10,"GCR_ALT_MFP")
end
o[7]=e
local i=ext.band(t["GCR_GPA_MFP"],512)
e={}
e["pin_no"]="8"
e["texts"]={"PA.9","I2C0SCL"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",9)
else
fill_NUC100_I2C(e,t,"A",9,"I2C0SCL",0)
end
o[8]=e
local i=ext.band(t["GCR_GPA_MFP"],256)
e={}
e["pin_no"]="9"
e["texts"]={"PA.8","I2C0SDA"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",8)
else
fill_NUC100_I2C(e,t,"A",8,"I2C0SDA",0)
end
o[9]=e
local i=ext.band(t["GCR_GPB_MFP"],16)
e={}
e["pin_no"]="10"
e["texts"]={"PB.4","RXD1"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",4)
else
fill_NUC100_UART(e,t,"B",4,"RXD1",1)
e["direction"]=kPinDirection_In
end
o[10]=e
local i=ext.band(t["GCR_GPB_MFP"],32)
e={}
e["pin_no"]="11"
e["texts"]={"PB.5","TXD1"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",5)
else
fill_NUC100_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
end
o[11]=e
local i=ext.band(t["GCR_GPB_MFP"],64)
e={}
e["pin_no"]="12"
e["texts"]={"PB.6","RTS1","ALE"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",6,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_UART(e,t,"B",6,"RTS1",1,"GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"B",6,"ALE","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",6,"GCR_ALT_MFP")
end
o[12]=e
local i=ext.band(t["GCR_GPB_MFP"],128)
e={}
e["pin_no"]="13"
e["texts"]={"PB.7","CTS1","nCS"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",7,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_UART(e,t,"B",7,"CTS1",1,"GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"B",7,"nCS","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",7,"GCR_ALT_MFP")
end
o[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"LDO"}
e["highlight_text"]="LDO"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VBUS"}
e["highlight_text"]="VBUS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"VDD33"}
e["highlight_text"]="VDD33"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"D-"}
fill_NUC100_USB(e,t,"D-")
o[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"D+"}
fill_NUC100_USB(e,t,"D+")
o[20]=e
local i=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="21"
e["texts"]={"PB.0","RXD0"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",0)
else
fill_NUC100_UART(e,t,"B",0,"RXD0",0)
e["direction"]=kPinDirection_In
end
o[21]=e
local i=ext.band(t["GCR_GPB_MFP"],2)
e={}
e["pin_no"]="22"
e["texts"]={"PB.1","TXD0"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",1)
else
fill_NUC100_UART(e,t,"B",1,"TXD0",0)
e["direction"]=kPinDirection_PushPullOut
end
o[22]=e
local n=ext.band(t["GCR_ALT_MFP"],8192)
local i=ext.band(t["GCR_ALT_MFP"],67108864)
local s=ext.band(t["GCR_GPB_MFP"],4)
e={}
e["pin_no"]="23"
e["texts"]={"PB.2","RTS0","nWRL","T2EX"}
if n==0 and a==0 and s==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",2,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and s~=0 and i==0 then
fill_NUC100_UART(e,t,"B",2,"RTS0",0,"GCR_ALT_MFP")
elseif n~=0 and a~=0 and s~=0 and i==0 then
fill_NUC100_EBI(e,t,"B",2,"nWRL","GCR_ALT_MFP")
elseif n==0 and a==0 and s~=0 and i~=0 then
fill_NUC100_TM(e,t,"B",2,"T2EX",2,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",2,"GCR_ALT_MFP")
end
o[23]=e
local n=ext.band(t["GCR_ALT_MFP"],16384)
local s=ext.band(t["GCR_ALT_MFP"],134217728)
local i=ext.band(t["GCR_GPB_MFP"],8)
e={}
e["pin_no"]="24"
e["texts"]={"PB.3","CTS0","nWRH","T3EX"}
if n==0 and a==0 and i==0 and s==0 then
fill_NUC100_GPIO(e,t,"B",3,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 and s==0 then
fill_NUC100_UART(e,t,"B",3,"CTS0",0,"GCR_ALT_MFP")
elseif n~=0 and a~=0 and i~=0 and s==0 then
fill_NUC100_EBI(e,t,"B",3,"nWRH","GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 and s~=0 then
fill_NUC100_TM(e,t,"B",3,"T3EX",3,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",3,"GCR_ALT_MFP")
end
o[24]=e
local i=ext.band(t["GCR_GPD_MFP"],64)
e={}
e["pin_no"]="25"
e["texts"]={"PD.6","CANRX0"}
if i==0 then
fill_NUC100_GPIO(e,t,"D",6)
else
fill_NUC100_CAN(e,t,"D",6,"CANRX0")
e["direction"]=kPinDirection_In
end
o[25]=e
e={}
local i=ext.band(t["GCR_GPD_MFP"],128)
e["pin_no"]="26"
e["texts"]={"PD.7","CANTX0"}
if i==0 then
fill_NUC100_GPIO(e,t,"D",7)
else
fill_NUC100_CAN(e,t,"D",7,"CANTX0")
e["direction"]=kPinDirection_PushPullOut
end
o[26]=e
local i=ext.band(t["GCR_GPD_MFP"],16384)
e={}
e["pin_no"]="27"
e["texts"]={"PD.14","RXD2"}
if i==0 then
fill_NUC100_GPIO(e,t,"D",14)
else
fill_NUC100_UART(e,t,"D",14,"RXD2",2)
e["direction"]=kPinDirection_In
end
o[27]=e
local i=ext.band(t["GCR_GPD_MFP"],32768)
e={}
e["pin_no"]="28"
e["texts"]={"PD.15","TXD2"}
if i==0 then
fill_NUC100_GPIO(e,t,"D",15)
else
fill_NUC100_UART(e,t,"D",15,"TXD2",2)
e["direction"]=kPinDirection_PushPullOut
end
o[28]=e
local n=ext.band(t["GCR_ALT_MFP"],256)
local i=ext.band(t["GCR_GPC_MFP"],8)
e={}
e["pin_no"]="29"
e["texts"]={"PC.3","MOSI00","I2SDO"}
if n==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif n==0 and i~=0 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
elseif n~=0 and i~=0 then
fill_NUC100_I2S(e,t,"C",3,"I2SDO","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP")
end
o[29]=e
local n=ext.band(t["GCR_ALT_MFP"],128)
local i=ext.band(t["GCR_GPC_MFP"],4)
e={}
e["pin_no"]="30"
e["texts"]={"PC.2","MISO00","I2SDI"}
if n==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif n==0 and i~=0 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
elseif n~=0 and i~=0 then
fill_NUC100_I2S(e,t,"C",2,"I2SDI","GCR_ALT_MFP")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP")
end
o[30]=e
local n=ext.band(t["GCR_ALT_MFP"],64)
local i=ext.band(t["GCR_GPC_MFP"],2)
e={}
e["pin_no"]="31"
e["texts"]={"PC.1","SPICLK0","I2SBCLK"}
if n==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif n==0 and i~=0 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
elseif n~=0 and i~=0 then
fill_NUC100_I2S(e,t,"C",1,"I2SBCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP")
end
o[31]=e
local n=ext.band(t["GCR_ALT_MFP"],32)
local i=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="32"
e["texts"]={"PC.0","SPISS00","I2SLRCLK"}
if n==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif n==0 and i~=0 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
elseif n~=0 and i~=0 then
fill_NUC100_I2S(e,t,"C",0,"I2SLRCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP")
end
o[32]=e
local i=ext.band(t["GCR_GPC_MFP"],2048)
e={}
e["pin_no"]="33"
e["texts"]={"MOSI10","PC.11"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",11)
else
fill_NUC100_SPI(e,t,"C",11,"MOSI10",1)
fill_NUC100_SPI_IO(e,t,1,false)
end
o[33]=e
local i=ext.band(t["GCR_GPC_MFP"],1024)
e={}
e["pin_no"]="34"
e["texts"]={"MISO10","PC.10"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",10)
else
fill_NUC100_SPI(e,t,"C",10,"MISO10",1)
fill_NUC100_SPI_IO(e,t,1,true)
end
o[34]=e
local i=ext.band(t["GCR_GPC_MFP"],512)
e={}
e["pin_no"]="35"
e["texts"]={"SPICLK1","PC.9"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",9)
else
fill_NUC100_SPI(e,t,"C",9,"SPICLK1",1)
end
o[35]=e
local n=ext.band(t["GCR_ALT_MFP"],4096)
local i=ext.band(t["GCR_GPC_MFP"],256)
e={}
e["pin_no"]="36"
e["texts"]={"MCLK","SPISS10","PC.8"}
if n==0 and a==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",8,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 then
fill_NUC100_SPI(e,t,"C",8,"SPISS10",1,"GCR_ALT_MFP")
elseif n~=0 and a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"C",8,"MCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",8,"GCR_ALT_MFP")
end
o[36]=e
local i=ext.band(t["GCR_ALT_MFP"],512)
local n=ext.band(t["GCR_GPA_MFP"],32768)
e={}
e["pin_no"]="37"
e["texts"]={"I2SMCLK","PWM3","PA.15"}
if i==0 and n==0 then
fill_NUC100_GPIO(e,t,"A",15,nil,"GCR_ALT_MFP")
elseif i==0 and n~=0 then
fill_NUC100_PWM(e,t,"A",15,"PWM3","GCR_ALT_MFP")
elseif i~=0 and n~=0 then
fill_NUC100_I2S(e,t,"A",15,"I2SMCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",15,"GCR_ALT_MFP")
end
o[37]=e
local n=ext.band(t["GCR_ALT_MFP"],8388608)
local i=ext.band(t["GCR_GPA_MFP"],16384)
e={}
e["pin_no"]="38"
e["texts"]={"AD15","PWM2","PA.14"}
if n==0 and a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",14,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 then
fill_NUC100_PWM(e,t,"A",14,"PWM2","GCR_ALT_MFP")
elseif n~=0 and a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",14,"AD15","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",14,"GCR_ALT_MFP")
end
o[38]=e
local n=ext.band(t["GCR_ALT_MFP"],4194304)
local i=ext.band(t["GCR_GPA_MFP"],8192)
e={}
e["pin_no"]="39"
e["texts"]={"AD14","PWM1","PA.13"}
if n==0 and a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",13,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 then
fill_NUC100_PWM(e,t,"A",13,"PWM1","GCR_ALT_MFP")
elseif n~=0 and a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",13,"AD14","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",13,"GCR_ALT_MFP")
end
o[39]=e
local n=ext.band(t["GCR_ALT_MFP"],2097152)
local i=ext.band(t["GCR_GPA_MFP"],4096)
e={}
e["pin_no"]="40"
e["texts"]={"AD13","PWM0","PA.12"}
if n==0 and a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",12,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 then
fill_NUC100_PWM(e,t,"A",12,"PWM0","GCR_ALT_MFP")
elseif n~=0 and a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",12,"AD13","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",12,"GCR_ALT_MFP")
end
o[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"ICE_DAT"}
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
o[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"ICE_CK"}
e["highlight_text"]="ICE_CK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
o[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"AVSS"}
e["highlight_text"]="AVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[43]=e
local i=ext.band(t["GCR_GPA_MFP"],1)
e={}
e["pin_no"]="44"
e["texts"]={"ADC0","PA.0"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",0)
else
fill_NUC100_ADC(e,t,"A",0,"ADC0")
end
o[44]=e
local i=ext.band(t["GCR_ALT_MFP"],1048576)
local n=ext.band(t["GCR_GPA_MFP"],2)
e={}
e["pin_no"]="45"
e["texts"]={"AD12","ADC1","PA.1"}
if i==0 and a==0 and n==0 then
fill_NUC100_GPIO(e,t,"A",1,nil,"GCR_ALT_MFP")
elseif i==0 and a==0 and n~=0 then
fill_NUC100_ADC(e,t,"A",1,"ADC1","GCR_ALT_MFP")
elseif i~=0 and a~=0 and n~=0 then
fill_NUC100_EBI(e,t,"A",1,"AD12","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",1,"GCR_ALT_MFP")
end
o[45]=e
local n=ext.band(t["GCR_ALT_MFP"],524288)
local i=ext.band(t["GCR_GPA_MFP"],4)
e={}
e["pin_no"]="46"
e["texts"]={"AD11","ADC2","PA.2"}
if n==0 and a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",2,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 then
fill_NUC100_ADC(e,t,"A",2,"ADC2","GCR_ALT_MFP")
elseif n~=0 and a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",2,"AD11","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",2,"GCR_ALT_MFP")
end
o[46]=e
local n=ext.band(t["GCR_ALT_MFP"],262144)
local i=ext.band(t["GCR_GPA_MFP"],8)
e={}
e["pin_no"]="47"
e["texts"]={"AD10","ADC3","PA.3"}
if n==0 and a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",3,nil,"GCR_ALT_MFP")
elseif n==0 and a==0 and i~=0 then
fill_NUC100_ADC(e,t,"A",3,"ADC3","GCR_ALT_MFP")
elseif n~=0 and a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",3,"AD10","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",3,"GCR_ALT_MFP")
end
o[47]=e
local i=ext.band(t["GCR_ALT_MFP"],131072)
local n=ext.band(t["GCR_GPA_MFP"],16)
e={}
e["pin_no"]="48"
e["texts"]={"AD9","ADC4","PA.4"}
if i==0 and a==0 and n==0 then
fill_NUC100_GPIO(e,t,"A",4,nil,"GCR_ALT_MFP")
elseif i==0 and a==0 and n~=0 then
fill_NUC100_ADC(e,t,"A",4,"ADC4","GCR_ALT_MFP")
elseif i~=0 and a~=0 and n~=0 then
fill_NUC100_EBI(e,t,"A",4,"AD9","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",4,"GCR_ALT_MFP")
end
o[48]=e
local i=ext.band(t["GCR_ALT_MFP"],65536)
local n=ext.band(t["GCR_GPA_MFP"],32)
e={}
e["pin_no"]="49"
e["texts"]={"AD8","ADC5","PA.5"}
if i==0 and a==0 and n==0 then
fill_NUC100_GPIO(e,t,"A",5,nil,"GCR_ALT_MFP")
elseif i==0 and a==0 and n~=0 then
fill_NUC100_ADC(e,t,"A",5,"ADC5","GCR_ALT_MFP")
elseif i~=0 and a~=0 and n~=0 then
fill_NUC100_EBI(e,t,"A",5,"AD8","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",5,"GCR_ALT_MFP")
end
o[49]=e
local i=ext.band(t["GCR_GPA_MFP"],64)
e={}
e["pin_no"]="50"
e["texts"]={"AD7","ADC6","PA.6"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",6,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_ADC(e,t,"A",6,"ADC6","GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"A",6,"AD7","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",6,"GCR_ALT_MFP")
end
o[50]=e
local n=ext.band(t["GCR_ALT_MFP"],4)
local i=ext.band(t["GCR_GPA_MFP"],128)
e={}
e["pin_no"]="51"
e["texts"]={"AD6","ADC7","PA.7"}
if a==0 and n==0 and i==0 then
fill_NUC100_GPIO(e,t,"A",7,nil,"GCR_ALT_MFP")
elseif a==0 and n==0 and i~=0 then
fill_NUC100_ADC(e,t,"A",7,"ADC7","GCR_ALT_MFP")
elseif a~=0 and n==0 and i~=0 then
fill_NUC100_EBI(e,t,"A",7,"AD6","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",7,"GCR_ALT_MFP")
end
o[51]=e
e={}
e["pin_no"]="52"
e["texts"]={"AVDD"}
e["highlight_text"]="AVDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[52]=e
local i=ext.band(t["GCR_GPC_MFP"],128)
e={}
e["pin_no"]="53"
e["texts"]={"AD5","CPN0","PC.7"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",7,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_ACMP(e,t,"C",7,"CPN0","GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"C",7,"AD5","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",7,"GCR_ALT_MFP")
end
o[53]=e
local i=ext.band(t["GCR_GPC_MFP"],64)
e={}
e["pin_no"]="54"
e["texts"]={"AD4","CPP0","PC.6"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",6,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_ACMP(e,t,"C",6,"CPP0","GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"C",6,"AD4","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",6,"GCR_ALT_MFP")
end
o[54]=e
local i=ext.band(t["GCR_GPC_MFP"],32768)
e={}
e["pin_no"]="55"
e["texts"]={"AD3","CPN1","PC.15"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",15,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_ACMP(e,t,"C",15,"CPN1","GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"C",15,"AD3","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",15,"GCR_ALT_MFP")
end
o[55]=e
local i=ext.band(t["GCR_GPC_MFP"],16384)
e={}
e["pin_no"]="56"
e["texts"]={"AD2","CPP1","PC.14"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"C",14,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_ACMP(e,t,"C",14,"CPP1","GCR_ALT_MFP")
elseif a~=0 and i~=0 then
fill_NUC100_EBI(e,t,"C",14,"AD2","GCR_ALT_MFP")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",14,"GCR_ALT_MFP")
end
o[56]=e
local a=ext.band(t["GCR_ALT_MFP"],16777216)
local i=ext.band(t["GCR_GPB_MFP"],32768)
e={}
e["pin_no"]="57"
e["texts"]={"T0EX","INT1#","PB.15"}
if a==0 and i==0 then
fill_NUC100_GPIO(e,t,"B",15,nil,"GCR_ALT_MFP")
elseif a==0 and i~=0 then
fill_NUC100_GPIO(e,t,"B",15,"INT1#","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
elseif a~=0 and i~=0 then
fill_NUC100_TM(e,t,"B",15,"T0EX",0,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",15,"GCR_ALT_MFP")
end
o[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"XT1_OUT"}
e["highlight_text"]="XT1_OUT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
o[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"XT1_IN"}
e["highlight_text"]="XT1_IN"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
o[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"RESET#"}
e["highlight_text"]="RESET#"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
o[60]=e
e={}
e["pin_no"]="61"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[61]=e
e={}
e["pin_no"]="62"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"PVSS"}
e["highlight_text"]="PVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
o[63]=e
local a=ext.band(t["ADC_ADCR"],256)
local i=ext.band(t["ADC_ADCR"],48)
local n=ext.band(t["GCR_GPB_MFP"],256)
e={}
e["pin_no"]="64"
e["texts"]={"STADC","TM0","PB.8"}
if n==0 then
if a~=0 and i==0 then
fill_NUC100_GPIO(e,t,"B",8,"STADC,PB.8","ADC_ADCR")
e["texts"]={"TM0","STADC,PB.8"}
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
else
fill_NUC100_GPIO(e,t,"B",8,nil,"ADC_ADCR")
end
else
fill_NUC100_TM(e,t,"B",8,"TM0",0,"ADC_ADCR")
if a~=0 and i==0 then
e["texts"]={"STADC,TM0","PB.8"}
e["highlight_text"]="STADC,TM0"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
end
o[64]=e
return{name=h,information="",pins=o}
end
