local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC100.lua")
function get_chip_status_NUC120_BN_LQFP48(i,o,e,t)
local a={}
local t=read_NUC100_Registers(i,o,e,t)
local e
local n=ext.band(t["GCR_ALT_MFP"],1024)
local o=ext.band(t["GCR_GPB_MFP"],4096)
e={}
e["pin_no"]="1"
e["texts"]={"PB.12","CPO0","CLKO"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",12,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_ACMP(e,t,"B",12,"CPO0","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
else
fill_NUC100_CLKO(e,t,"B",12,"CLKO","GCR_ALT_MFP")
end
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
local o=ext.band(t["GCR_GPA_MFP"],2048)
e={}
e["pin_no"]="4"
e["texts"]={"PA.11","I2C1SCL"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",11)
else
fill_NUC100_I2C(e,t,"A",11,"I2C1SCL",1)
end
a[4]=e
local o=ext.band(t["GCR_GPA_MFP"],1024)
e={}
e["pin_no"]="5"
e["texts"]={"PA.10","I2C1SDA"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",10)
else
fill_NUC100_I2C(e,t,"A",10,"I2C1SDA",1)
end
a[5]=e
local o=ext.band(t["GCR_GPA_MFP"],512)
e={}
e["pin_no"]="6"
e["texts"]={"PA.9","I2C0SCL"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",9)
else
fill_NUC100_I2C(e,t,"A",9,"I2C0SCL",0)
end
a[6]=e
local o=ext.band(t["GCR_GPA_MFP"],256)
e={}
e["pin_no"]="7"
e["texts"]={"PA.8","I2C0SDA"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",8)
else
fill_NUC100_I2C(e,t,"A",8,"I2C0SDA",0)
end
a[7]=e
local o=ext.band(t["GCR_GPB_MFP"],16)
e={}
e["pin_no"]="8"
e["texts"]={"PB.4","RXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",4)
else
fill_NUC100_UART(e,t,"B",4,"RXD1",1)
e["direction"]=kPinDirection_In
end
a[8]=e
local o=ext.band(t["GCR_GPB_MFP"],32)
e={}
e["pin_no"]="9"
e["texts"]={"PB.5","TXD1"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",5)
else
fill_NUC100_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
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
local o=ext.band(t["GCR_GPB_MFP"],1)
e={}
e["pin_no"]="17"
e["texts"]={"PB.0","RXD0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",0)
else
fill_NUC100_UART(e,t,"B",0,"RXD0",0)
e["direction"]=kPinDirection_In
end
a[17]=e
local o=ext.band(t["GCR_GPB_MFP"],2)
e={}
e["pin_no"]="18"
e["texts"]={"PB.1","TXD0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",1)
else
fill_NUC100_UART(e,t,"B",1,"TXD0",0)
e["direction"]=kPinDirection_PushPullOut
end
a[18]=e
local o=ext.band(t["GCR_GPB_MFP"],4)
e={}
e["pin_no"]="19"
e["texts"]={"PB.2","RTS0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",2)
else
fill_NUC100_UART(e,t,"B",2,"RTS0",0)
end
a[19]=e
local o=ext.band(t["GCR_GPB_MFP"],8)
e={}
e["pin_no"]="20"
e["texts"]={"PB.3","CTS0"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",3)
else
fill_NUC100_UART(e,t,"B",3,"CTS0",0)
end
a[20]=e
local o=ext.band(t["GCR_ALT_MFP"],256)
local n=ext.band(t["GCR_GPC_MFP"],8)
e={}
e["pin_no"]="21"
e["texts"]={"PC.3","MOSI00","I2SDO"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,false)
else
fill_NUC100_I2S(e,t,"C",3,"I2SDO","GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
end
a[21]=e
local n=ext.band(t["GCR_ALT_MFP"],128)
local o=ext.band(t["GCR_GPC_MFP"],4)
e={}
e["pin_no"]="22"
e["texts"]={"PC.2","MISO00","I2SDI"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC100_SPI_IO(e,t,0,true)
else
fill_NUC100_I2S(e,t,"C",2,"I2SDI","GCR_ALT_MFP")
e["direction"]=kPinDirection_In
end
a[22]=e
local o=ext.band(t["GCR_ALT_MFP"],64)
local n=ext.band(t["GCR_GPC_MFP"],2)
e={}
e["pin_no"]="23"
e["texts"]={"PC.1","SPICLK0","I2SBCLK"}
if n==0 then
fill_NUC100_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif o==0 then
fill_NUC100_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"C",1,"I2SBCLK","GCR_ALT_MFP")
end
a[23]=e
local n=ext.band(t["GCR_ALT_MFP"],32)
local o=ext.band(t["GCR_GPC_MFP"],1)
e={}
e["pin_no"]="24"
e["texts"]={"PC.0","SPISS00","I2SLRCLK"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"C",0,"I2SLRCLK","GCR_ALT_MFP")
end
a[24]=e
local n=ext.band(t["GCR_ALT_MFP"],512)
local o=ext.band(t["GCR_GPA_MFP"],32768)
e={}
e["pin_no"]="25"
e["texts"]={"I2SMCLK","PWM3","PA.15"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",15,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_PWM(e,t,"A",15,"PWM3","GCR_ALT_MFP")
else
fill_NUC100_I2S(e,t,"A",15,"I2SMCLK","GCR_ALT_MFP")
end
a[25]=e
local o=ext.band(t["GCR_GPA_MFP"],16384)
e={}
e["pin_no"]="26"
e["texts"]={"PWM2","PA.14"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",14)
else
fill_NUC100_PWM(e,t,"A",14,"PWM2")
end
a[26]=e
local o=ext.band(t["GCR_GPA_MFP"],8192)
e={}
e["pin_no"]="27"
e["texts"]={"PWM1","PA.13"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",13)
else
fill_NUC100_PWM(e,t,"A",13,"PWM1")
end
a[27]=e
local o=ext.band(t["GCR_GPA_MFP"],4096)
e={}
e["pin_no"]="28"
e["texts"]={"PWM0","PA.12"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",12)
else
fill_NUC100_PWM(e,t,"A",12,"PWM0")
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"ICE_DAT"}
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"ICE_CK"}
e["highlight_text"]="ICE_CK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"AVSS"}
e["highlight_text"]="AVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[31]=e
local o=ext.band(t["GCR_GPA_MFP"],1)
e={}
e["pin_no"]="32"
e["texts"]={"ADC0","PA.0"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",0)
else
fill_NUC100_ADC(e,t,"A",0,"ADC0")
end
a[32]=e
local o=ext.band(t["GCR_GPA_MFP"],2)
e={}
e["pin_no"]="33"
e["texts"]={"ADC1","PA.1"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",1)
else
fill_NUC100_ADC(e,t,"A",1,"ADC1")
end
a[33]=e
local o=ext.band(t["GCR_GPA_MFP"],4)
e={}
e["pin_no"]="34"
e["texts"]={"ADC2","PA.2"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",2)
else
fill_NUC100_ADC(e,t,"A",2,"ADC2")
end
a[34]=e
local o=ext.band(t["GCR_GPA_MFP"],8)
e={}
e["pin_no"]="35"
e["texts"]={"ADC3","PA.3"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",3)
else
fill_NUC100_ADC(e,t,"A",3,"ADC3")
end
a[35]=e
local o=ext.band(t["GCR_GPA_MFP"],16)
e={}
e["pin_no"]="36"
e["texts"]={"ADC4","PA.4"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",4)
else
fill_NUC100_ADC(e,t,"A",4,"ADC4")
end
a[36]=e
local o=ext.band(t["GCR_GPA_MFP"],32)
e={}
e["pin_no"]="37"
e["texts"]={"ADC5","PA.5",}
if o==0 then
fill_NUC100_GPIO(e,t,"A",5)
else
fill_NUC100_ADC(e,t,"A",5,"ADC5")
end
a[37]=e
local o=ext.band(t["GCR_GPA_MFP"],64)
e={}
e["pin_no"]="38"
e["texts"]={"ADC6","PA.6"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",6)
else
fill_NUC100_ADC(e,t,"A",6,"ADC6")
end
a[38]=e
local n=ext.band(t["GCR_ALT_MFP"],4)
local o=ext.band(t["GCR_GPA_MFP"],128)
e={}
e["pin_no"]="39"
e["texts"]={"ADC7","PA.7"}
if o==0 then
fill_NUC100_GPIO(e,t,"A",7,nil,"GCR_ALT_MFP")
elseif n==0 then
fill_NUC100_ADC(e,t,"A",7,"ADC7","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"A",7,"GCR_ALT_MFP")
end
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"AVDD"}
e["highlight_text"]="AVDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[40]=e
local o=ext.band(t["GCR_GPC_MFP"],128)
e={}
e["pin_no"]="41"
e["texts"]={"CPN0","PC.7"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",7)
else
fill_NUC100_ACMP(e,t,"C",7,"CPN0")
end
a[41]=e
local o=ext.band(t["GCR_GPC_MFP"],64)
e={}
e["pin_no"]="42"
e["texts"]={"CPP0","PC.6"}
if o==0 then
fill_NUC100_GPIO(e,t,"C",6)
else
fill_NUC100_ACMP(e,t,"C",6,"CPP0")
end
a[42]=e
local o=ext.band(t["GCR_GPB_MFP"],32768)
e={}
e["pin_no"]="43"
e["texts"]={"INT1#","PB.15"}
if o==0 then
fill_NUC100_GPIO(e,t,"B",15)
else
fill_NUC100_GPIO(e,t,"B",15,"INT1#")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
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
e["texts"]={"PVSS"}
e["highlight_text"]="PVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[47]=e
local o=ext.band(t["ADC_ADCR"],256)
local n=ext.band(t["ADC_ADCR"],48)
local s=ext.band(t["GCR_GPB_MFP"],256)
e={}
e["pin_no"]="48"
e["texts"]={"STADC","TM0","PB.8"}
if s==0 then
if o~=0 and n==0 then
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
if o~=0 and n==0 then
e["texts"]={"STADC,TM0","PB.8"}
e["highlight_text"]="STADC,TM0"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
end
a[48]=e
return{name=i,information="",pins=a}
end
