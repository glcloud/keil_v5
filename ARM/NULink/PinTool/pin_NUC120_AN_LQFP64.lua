local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC120_AN_LQFP64(o,e,t,i)
local a={}
local t=read_NUC100_Registers(o,e,t,i)
local e
local i=ext.band(t["GCR_ALT_MFP"],8)
local n=ext.band(t["GCR_GPB_MFP"],16384)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","INT0#"}
if n==0 then
fill_NUC100_GPIO(e,t,"B",14)
elseif i==0 then
fill_NUC100_GPIO(e,t,"B",14,"INT0#","GCR_ALT_MFP")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
else
fill_invalid_GPIO(e,t,"B",14,"GCR_ALT_MFP")
end
a[1]=e
local i=ext.band(t["GCR_GPB_MFP"],8192)
e={}
e["pin_no"]="2"
e["texts"]={"PB.13","CPO1"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",13)
else
fill_NUC100_ACMP(e,t,"B",13,"CPO1")
e["direction"]=kPinDirection_PushPullOut
end
a[2]=e
local n=ext.band(t["GCR_ALT_MFP"],1024)
local i=ext.band(t["GCR_GPB_MFP"],4096)
e={}
e["pin_no"]="3"
e["texts"]={"PB.12","CPO0","CLKO"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",12)
elseif n==0 then
fill_NUC100_ACMP(e,t,"B",12,"CPO0","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
else
fill_NUC100_CLKO(e,t,"B",12,"CLKO","GCR_ALT_MFP")
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"X32O"}
e["highlight_text"]="X32O"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"X32I"}
e["highlight_text"]="X32I"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[5]=e
local i=ext.band(t["GCR_GPA_MFP"],2048)
e={}
e["pin_no"]="6"
e["texts"]={"PA.11","I2C1SCL"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",11)
else
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1)
end
a[6]=e
local i=ext.band(t["GCR_GPA_MFP"],1024)
e={}
e["pin_no"]="7"
e["texts"]={"PA.10","I2C1SDA"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",10)
else
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1)
end
a[7]=e
local i=ext.band(t["GCR_GPA_MFP"],512)
e={}
e["pin_no"]="8"
e["texts"]={"PA.9","I2C0SCL"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",9)
else
fill_NUC100_I2C(e,t,"A",9,"I2C0SCL",0)
end
a[8]=e
local i=ext.band(t["GCR_GPA_MFP"],256)
e={}
e["pin_no"]="9"
e["texts"]={"PA.8","I2C0SDA"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",8)
else
fill_NUC100_I2C(e,t,"A",8,"I2C0SDA",0)
end
a[9]=e
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
a[10]=e
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
a[11]=e
local i=ext.band(t["GCR_GPB_MFP"],64)
e={}
e["pin_no"]="12"
e["texts"]={"PB.6","RTS1"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",6)
else
fill_NUC100_UART(e,t,"B",6,"RTS1",1)
end
a[12]=e
local i=ext.band(t["GCR_GPB_MFP"],128)
e={}
e["pin_no"]="13"
e["texts"]={"PB.7","CTS1"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",7)
else
fill_NUC100_UART(e,t,"B",7,"CTS1",1)
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"LDO"}
e["highlight_text"]="LDO"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VBUS"}
e["highlight_text"]="VBUS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"VDD33"}
e["highlight_text"]="VDD33"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"D-"}
fill_NUC100_USB(e,t,"D-")
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"D+"}
fill_NUC100_USB(e,t,"D+")
a[20]=e
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
a[21]=e
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
a[22]=e
local i=ext.band(t["GCR_GPB_MFP"],4)
e={}
e["pin_no"]="23"
e["texts"]={"PB.2","RTS0"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",2)
else
fill_NUC100_UART(e,t,"B",2,"RTS0",0)
end
a[23]=e
local i=ext.band(t["GCR_GPB_MFP"],8)
e={}
e["pin_no"]="24"
e["texts"]={"PB.3","CTS0"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",3)
else
fill_NUC100_UART(e,t,"B",3,"CTS0",0)
end
a[24]=e
local n=ext.band(t["GCR_ALT_MFP"],256)
local i=ext.band(t["GCR_GPC_MFP"],8)
e={}
e["pin_no"]="25"
e["texts"]={"PC.3","MOSI00","I2SDO"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",3)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
else
fill_NUC100_I2S(e,t,"C",3,"I2SDO","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
end
a[25]=e
local i=ext.band(t["GCR_ALT_MFP"],128)
local n=ext.band(t["GCR_GPC_MFP"],4)
e={}
e["pin_no"]="26"
e["texts"]={"PC.2","MISO00","I2SDI"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",2)
elseif i==0 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
else
fill_NUC100_I2S(e,t,"C",2,"I2SDI","GCR_ALT_MFP")
e["direction"]=kPinDirection_In
end
a[26]=e
local n=ext.band(t["GCR_ALT_MFP"],64)
local i=ext.band(t["GCR_GPC_MFP"],2)
e={}
e["pin_no"]="27"
e["texts"]={"PC.1","SPICLK0","I2SBCLK"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",1)
elseif n==0 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"C",1,"I2SBCLK","GCR_ALT_MFP")
end
a[27]=e
local i=ext.band(t["GCR_ALT_MFP"],32)
local n=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="28"
e["texts"]={"PC.0","SPISS00","I2SLRCLK"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",0)
elseif i==0 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"C",0,"I2SLRCLK","GCR_ALT_MFP")
end
a[28]=e
local i=ext.band(t["GCR_GPE_MFP"],32)
e={}
e["pin_no"]="29"
e["texts"]={"PE.5","PWM5"}
if i==0 then
fill_NUC100_GPIO(e,t,"E",5)
else
fill_NUC100_PWM(e,t,"E",5,"PWM5")
end
a[29]=e
local n=ext.band(t["GCR_ALT_MFP"],16)
local i=ext.band(t["GCR_GPB_MFP"],2048)
e={}
e["pin_no"]="30"
e["texts"]={"PB.11","PWM4"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",11)
elseif n==0 then
fill_invalid_GPIO(e,t,"B",11,"GCR_ALT_MFP")
else
fill_NUC100_PWM(e,t,"B",11,"PWM4","GCR_ALT_MFP")
end
a[30]=e
local i=ext.band(t["GCR_GPB_MFP"],1024)
e={}
e["pin_no"]="31"
e["texts"]={"PB.10"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",10)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[31]=e
local i=ext.band(t["GCR_GPB_MFP"],512)
e={}
e["pin_no"]="32"
e["texts"]={"PB.9"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",9)
else
fill_invalid_GPIO(e,t,"B",9)
end
a[32]=e
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
a[33]=e
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
a[34]=e
local i=ext.band(t["GCR_GPC_MFP"],512)
e={}
e["pin_no"]="35"
e["texts"]={"SPICLK1","PC.9"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",9)
else
fill_NUC100_SPI(e,t,"C",9,"SPICLK1",1)
end
a[35]=e
local i=ext.band(t["GCR_GPC_MFP"],256)
e={}
e["pin_no"]="36"
e["texts"]={"SPISS10","PC.8"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",8)
else
fill_NUC100_SPI(e,t,"C",8,"SPISS10",1)
end
a[36]=e
local n=ext.band(t["GCR_ALT_MFP"],512)
local i=ext.band(t["GCR_GPA_MFP"],32768)
e={}
e["pin_no"]="37"
e["texts"]={"I2SMCLK","PWM3","PA.15"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",15)
elseif n==0 then
fill_NUC100_PWM(e,t,"A",15,"PWM3","GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"A",15,"I2SMCLK","GCR_ALT_MFP")
end
a[37]=e
local i=ext.band(t["GCR_GPA_MFP"],16384)
e={}
e["pin_no"]="38"
e["texts"]={"PWM2","PA.14"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",14)
else
fill_NUC100_PWM(e,t,"A",14,"PWM2")
end
a[38]=e
local i=ext.band(t["GCR_GPA_MFP"],8192)
e={}
e["pin_no"]="39"
e["texts"]={"PWM1","PA.13"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",13)
else
fill_NUC100_PWM(e,t,"A",13,"PWM1")
end
a[39]=e
local i=ext.band(t["GCR_GPA_MFP"],4096)
e={}
e["pin_no"]="40"
e["texts"]={"PWM0","PA.12"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",12)
else
fill_NUC100_PWM(e,t,"A",12,"PWM0")
end
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"ICE_DAT"}
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"ICE_CK"}
e["highlight_text"]="ICE_CK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"AVSS"}
e["highlight_text"]="AVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[43]=e
local i=ext.band(t["GCR_GPA_MFP"],1)
e={}
e["pin_no"]="44"
e["texts"]={"ADC0","PA.0"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",0)
else
fill_NUC100_ADC(e,t,"A",0,"ADC0")
end
a[44]=e
local i=ext.band(t["GCR_GPA_MFP"],2)
e={}
e["pin_no"]="45"
e["texts"]={"ADC1","PA.1"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",1)
else
fill_NUC100_ADC(e,t,"A",1,"ADC1")
end
a[45]=e
local i=ext.band(t["GCR_GPA_MFP"],4)
e={}
e["pin_no"]="46"
e["texts"]={"ADC2","PA.2"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",2)
else
fill_NUC100_ADC(e,t,"A",2,"ADC2")
end
a[46]=e
local i=ext.band(t["GCR_GPA_MFP"],8)
e={}
e["pin_no"]="47"
e["texts"]={"ADC3","PA.3"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",3)
else
fill_NUC100_ADC(e,t,"A",3,"ADC3")
end
a[47]=e
local i=ext.band(t["GCR_GPA_MFP"],16)
e={}
e["pin_no"]="48"
e["texts"]={"ADC4","PA.4"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",4)
else
fill_NUC100_ADC(e,t,"A",4,"ADC4")
end
a[48]=e
local i=ext.band(t["GCR_GPA_MFP"],32)
e={}
e["pin_no"]="49"
e["texts"]={"ADC5","PA.5"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",5)
else
fill_NUC100_ADC(e,t,"A",5,"ADC5")
end
a[49]=e
local i=ext.band(t["GCR_GPA_MFP"],64)
e={}
e["pin_no"]="50"
e["texts"]={"ADC6","PA.6"}
if i==0 then
fill_NUC100_GPIO(e,t,"A",6)
else
fill_NUC100_ADC(e,t,"A",6,"ADC6")
end
a[50]=e
local i=ext.band(t["GCR_ALT_MFP"],4)
local n=ext.band(t["GCR_GPA_MFP"],128)
e={}
e["pin_no"]="51"
e["texts"]={"ADC7","PA.7"}
if n==0 then
fill_NUC100_GPIO(e,t,"A",7)
elseif i==0 then
fill_NUC100_ADC(e,t,"A",7,"ADC7","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",7,"GCR_ALT_MFP")
end
a[51]=e
e={}
e["pin_no"]="52"
e["texts"]={"AVDD"}
e["highlight_text"]="AVDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[52]=e
local i=ext.band(t["GCR_GPC_MFP"],128)
e={}
e["pin_no"]="53"
e["texts"]={"CPN0","PC.7"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",7)
else
fill_NUC100_ACMP(e,t,"C",7,"CPN0")
end
a[53]=e
local i=ext.band(t["GCR_GPC_MFP"],64)
e={}
e["pin_no"]="54"
e["texts"]={"CPP0","PC.6"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",6)
else
fill_NUC100_ACMP(e,t,"C",6,"CPP0")
end
a[54]=e
local i=ext.band(t["GCR_GPC_MFP"],32768)
e={}
e["pin_no"]="55"
e["texts"]={"CPN1","PC.15"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",15)
else
fill_NUC100_ACMP(e,t,"C",15,"CPN1")
end
a[55]=e
local i=ext.band(t["GCR_GPC_MFP"],16384)
e={}
e["pin_no"]="56"
e["texts"]={"CPP1","PC.14"}
if i==0 then
fill_NUC100_GPIO(e,t,"C",14)
else
fill_NUC100_ACMP(e,t,"C",14,"CPP1")
end
a[56]=e
local i=ext.band(t["GCR_GPB_MFP"],32768)
e={}
e["pin_no"]="57"
e["texts"]={"INT1#","PB.15"}
if i==0 then
fill_NUC100_GPIO(e,t,"B",15)
else
fill_NUC100_GPIO(e,t,"B",15,"INT1#")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
end
a[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"XT1_OUT"}
e["highlight_text"]="XT1_OUT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
a[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"XT1_IN"}
e["highlight_text"]="XT1_IN"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"RESET#"}
e["highlight_text"]="RESET#"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[60]=e
e={}
e["pin_no"]="61"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[61]=e
e={}
e["pin_no"]="62"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"PVSS"}
e["highlight_text"]="PVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[63]=e
local i=ext.band(t["ADC_ADCR"],256)
local n=ext.band(t["ADC_ADCR"],48)
local s=ext.band(t["GCR_GPB_MFP"],256)
e={}
e["pin_no"]="64"
e["texts"]={"STADC","PB.8"}
if s==0 then
if i~=0 and n==0 then
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
a[64]=e
return{name=o,information="",pins=a}
end
