local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Mini51.lua")
function get_chip_status_Mini51_AN_LQFP48(n,e,e)
local a={}
local t=read_Mini51_Registers()
local e
e={}
e["pin_no"]="1"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[1]=e
local o=ext.band(t["GCR_P1_MFP"],8192)
local i=ext.band(t["GCR_P1_MFP"],32)
e={}
e["pin_no"]="2"
e["texts"]={"P1.5","AIN5","CPP0"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,5)
elseif o==0 and i~=0 then
fill_Mini51_ADC(e,t,1,5,"AIN5")
elseif o~=0 and i~=0 then
fill_Mini51_ACMP(e,t,1,5,"CPP0")
else
fill_invalid_GPIO(e,t,1,5)
end
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"RESET#"}
e["highlight_text"]="RESET#"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
a[3]=e
local o=ext.band(t["GCR_P3_MFP"],256)
local i=ext.band(t["GCR_P3_MFP"],1)
e={}
e["pin_no"]="4"
e["texts"]={"P3.0","AIN6","CPN1"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,3,0)
elseif o~=0 and i==0 then
fill_Mini51_ACMP(e,t,3,0,"CPN1")
elseif o~=0 and i~=0 then
fill_Mini51_ADC(e,t,3,0,"AIN6")
else
fill_invalid_GPIO(e,t,3,0)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"AVSS"}
e["highlight_text"]="AVSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[5]=e
local o=ext.band(t["GCR_P5_MFP"],4096)
local i=ext.band(t["GCR_P5_MFP"],16)
e={}
e["pin_no"]="6"
e["texts"]={"P5.4"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,4)
else
fill_invalid_GPIO(e,t,5,4)
end
a[6]=e
local i=ext.band(t["GCR_P3_MFP"],512)
local o=ext.band(t["GCR_P3_MFP"],2)
e={}
e["pin_no"]="7"
e["texts"]={"P3.1","AIN7","CPP1"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,1)
elseif i~=0 and o==0 then
fill_Mini51_ACMP(e,t,3,1,"CPP1")
elseif i~=0 and o~=0 then
fill_Mini51_ADC(e,t,3,1,"AIN7")
else
fill_invalid_GPIO(e,t,3,1)
end
a[7]=e
local o=ext.band(t["GCR_P3_MFP"],1024)
local i=ext.band(t["GCR_P3_MFP"],4)
e={}
e["pin_no"]="8"
e["texts"]={"P3.2","INT0","STADC","T0EX"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,3,2)
elseif o==0 and i~=0 then
fill_Mini51_GPIO(e,t,3,2,"INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
elseif o~=0 and i==0 then
fill_Mini51_TM(e,t,3,2,"T0EX",0)
else
fill_Mini51_ADC(e,t,3,2,"STADC")
end
a[8]=e
local i=ext.band(t["GCR_P3_MFP"],4096)
local o=ext.band(t["GCR_P3_MFP"],16)
e={}
e["pin_no"]="9"
e["texts"]={"P3.4","T0","SDA"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,4)
elseif i==0 and o~=0 then
fill_Mini51_TM(e,t,3,4,"T0",0)
elseif i~=0 and o==0 then
fill_Mini51_I2C(e,t,3,4,"SDA")
else
fill_invalid_GPIO(e,t,3,4)
end
a[9]=e
local i=ext.band(t["GCR_P3_MFP"],8192)
local o=ext.band(t["GCR_P3_MFP"],32)
e={}
e["pin_no"]="10"
e["texts"]={"P3.5","T1","SCL"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,5)
elseif i==0 and o~=0 then
fill_Mini51_TM(e,t,3,5,"T1",1)
elseif i~=0 and o==0 then
fill_Mini51_I2C(e,t,3,5,"SCL")
else
fill_invalid_GPIO(e,t,3,5)
end
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[13]=e
local i=ext.band(t["GCR_P3_MFP"],16384)
local o=ext.band(t["GCR_P3_MFP"],64)
e={}
e["pin_no"]="14"
e["texts"]={"P3.6","CKO","T1EX","CPO0"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,3,6)
elseif i==0 and o~=0 then
fill_Mini51_TM(e,t,3,6,"T1EX",1)
elseif i~=0 and o==0 then
fill_Mini51_CKO(e,t,3,6,"CKO")
else
fill_Mini51_ACMP(e,t,3,6,"CPO0")
e["direction"]=kPinDirection_PushPullOut
end
a[14]=e
local o=ext.band(t["GCR_P5_MFP"],512)
local i=ext.band(t["GCR_P5_MFP"],2)
e={}
e["pin_no"]="15"
e["texts"]={"P5.1","XTAL2"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,1)
elseif o==0 and i~=0 then
e["highlight_text"]="XTAL2"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_PushPullOut
e["status"]=kPinStatus_Unknown
local a=""
if ext.band(t["CLK_PWRCON"],3)==0
or ext.band(t["CLK_PWRCON"],3)==3 then
e["pin_no_color"]=kBgColor_Error
a="<font color=red>PWRCON[0:1] set this pin as GPIO</font><br>"
end
e["information"]=string.format("<b>XTAL2</b><br>%s<br>"..
"<b>Multi-Function register</b><br>"..
"<font face=consolas>"..
"P5_MFP  = 0x%08x<br>"..
"</font><br>"..
"<b>Clock setting registers</b><br>"..
"<font face=consolas>"..
"PWRCON  = 0x%08x<br>"..
"</font><br>",
a,
t["GCR_P5_MFP"],
t["CLK_PWRCON"])
else
fill_invalid_GPIO(e,t,5,1)
end
a[15]=e
local o=ext.band(t["GCR_P5_MFP"],256)
local i=ext.band(t["GCR_P5_MFP"],1)
e={}
e["pin_no"]="16"
e["texts"]={"P5.0","XTAL1"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,0)
elseif o==0 and i~=0 then
e["highlight_text"]="XTAL1"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
local a=""
if ext.band(t["CLK_PWRCON"],3)==0 then
e["pin_no_color"]=kBgColor_Error
a="<font color=red>PWRCON[0:1] set this pin as GPIO</font><br>"
end
e["information"]=string.format("<b>XTAL1</b><br>%s<br>"..
"<b>Multi-Function register</b><br>"..
"<font face=consolas>"..
"P5_MFP  = 0x%08x<br>"..
"</font><br>"..
"<b>Clock setting registers</b><br>"..
"<font face=consolas>"..
"PWRCON  = 0x%08x<br>"..
"</font><br>",
a,
t["GCR_P5_MFP"],
t["CLK_PWRCON"])
else
fill_invalid_GPIO(e,t,5,0)
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VSS"}
e["highlight_text"]="VSS"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"LDO_CAP"}
e["highlight_text"]="LDO_CAP"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[18]=e
local i=ext.band(t["GCR_P5_MFP"],8192)
local o=ext.band(t["GCR_P5_MFP"],32)
e={}
e["pin_no"]="19"
e["texts"]={"P5.5"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,5,5)
else
fill_invalid_GPIO(e,t,5,5)
end
a[19]=e
local o=ext.band(t["GCR_P5_MFP"],1024)
local i=ext.band(t["GCR_P5_MFP"],4)
e={}
e["pin_no"]="20"
e["texts"]={"P5.2","INT1"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,2)
elseif o==0 and i~=0 then
fill_Mini51_GPIO(e,t,5,2,"INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
else
fill_invalid_GPIO(e,t,5,2)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[21]=e
local i=ext.band(t["GCR_P2_MFP"],1024)
local o=ext.band(t["GCR_P2_MFP"],4)
e={}
e["pin_no"]="22"
e["texts"]={"P2.2","PWM0"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,2)
elseif i~=0 and o==0 then
fill_Mini51_PWM(e,t,2,2,"PWM0")
else
fill_invalid_GPIO(e,t,2,2)
end
a[22]=e
local i=ext.band(t["GCR_P2_MFP"],2048)
local o=ext.band(t["GCR_P2_MFP"],8)
e={}
e["pin_no"]="23"
e["texts"]={"P2.3","PWM1"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,3)
elseif i~=0 and o==0 then
fill_Mini51_PWM(e,t,2,3,"PWM1")
else
fill_invalid_GPIO(e,t,2,3)
end
a[23]=e
local o=ext.band(t["GCR_P2_MFP"],4096)
local i=ext.band(t["GCR_P2_MFP"],16)
e={}
e["pin_no"]="24"
e["texts"]={"P2.4","PWM2"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,2,4)
elseif o~=0 and i==0 then
fill_Mini51_PWM(e,t,2,4,"PWM2")
else
fill_invalid_GPIO(e,t,2,4)
end
a[24]=e
local i=ext.band(t["GCR_P2_MFP"],8192)
local o=ext.band(t["GCR_P2_MFP"],32)
e={}
e["pin_no"]="25"
e["texts"]={"PWM3","P2.5"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,5)
elseif i~=0 and o==0 then
fill_Mini51_PWM(e,t,2,5,"PWM3")
else
fill_invalid_GPIO(e,t,2,5)
end
a[25]=e
local i=ext.band(t["GCR_P2_MFP"],16384)
local o=ext.band(t["GCR_P2_MFP"],64)
e={}
e["pin_no"]="26"
e["texts"]={"CPO1","PWM4","P2.6"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,2,6)
elseif i~=0 and o==0 then
fill_Mini51_PWM(e,t,2,6,"PWM4")
elseif i~=0 and o~=0 then
fill_Mini51_ACMP(e,t,2,6,"CPO1")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,2,6)
end
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[28]=e
local i=ext.band(t["GCR_P4_MFP"],16384)
local o=ext.band(t["GCR_P4_MFP"],64)
e={}
e["pin_no"]="29"
e["texts"]={"ICE_CLK","P4.6"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,4,6)
elseif i==0 and o~=0 then
e["highlight_text"]="ICE_CLK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
else
fill_invalid_GPIO(e,t,4,6)
end
a[29]=e
local o=ext.band(t["GCR_P4_MFP"],32768)
local i=ext.band(t["GCR_P4_MFP"],128)
e={}
e["pin_no"]="30"
e["texts"]={"ICE_DAT","P4.7"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,4,7)
elseif o==0 and i~=0 then
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
else
fill_invalid_GPIO(e,t,4,7)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[31]=e
local i=ext.band(t["GCR_P0_MFP"],32768)
local o=ext.band(t["GCR_P0_MFP"],128)
e={}
e["pin_no"]="32"
e["texts"]={"SPICLK","P0.7"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,7)
elseif i~=0 and o==0 then
fill_Mini51_SPI(e,t,0,7,"SPICLK")
else
fill_invalid_GPIO(e,t,0,7)
end
a[32]=e
local o=ext.band(t["GCR_P0_MFP"],16384)
local i=ext.band(t["GCR_P0_MFP"],64)
e={}
e["pin_no"]="33"
e["texts"]={"MISO","P0.6"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,6)
elseif o~=0 and i==0 then
fill_Mini51_SPI(e,t,0,6,"MISO")
fill_Mini51_SPI_IO(e,t,true)
else
fill_invalid_GPIO(e,t,0,6)
end
a[33]=e
local i=ext.band(t["GCR_P0_MFP"],8192)
local o=ext.band(t["GCR_P0_MFP"],32)
e={}
e["pin_no"]="34"
e["texts"]={"MOSI","P0.5"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,5)
elseif i~=0 and o==0 then
fill_Mini51_SPI(e,t,0,5,"MOSI")
fill_Mini51_SPI_IO(e,t,false)
else
fill_invalid_GPIO(e,t,0,5)
end
a[34]=e
local i=ext.band(t["GCR_P0_MFP"],4096)
local o=ext.band(t["GCR_P0_MFP"],16)
e={}
e["pin_no"]="35"
e["texts"]={"PWM5","SPISS","P0.4"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,4)
elseif i~=0 and o==0 then
fill_Mini51_SPI(e,t,0,4,"SPISS")
elseif i~=0 and o~=0 then
fill_Mini51_PWM(e,t,0,4,"PWM5")
else
fill_invalid_GPIO(e,t,0,4)
end
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[36]=e
local o=ext.band(t["GCR_P0_MFP"],512)
local i=ext.band(t["GCR_P0_MFP"],2)
e={}
e["pin_no"]="37"
e["texts"]={"SPISS","RX","RTSn","P0.1"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,0,1)
elseif o==0 and i~=0 then
fill_Mini51_SPI(e,t,0,1,"SPISS")
elseif o~=0 and i==0 then
fill_Mini51_UART(e,t,0,1,"RTSn")
else
fill_Mini51_UART(e,t,0,1,"RX")
e["direction"]=kPinDirection_In
end
a[37]=e
local i=ext.band(t["GCR_P0_MFP"],256)
local o=ext.band(t["GCR_P0_MFP"],1)
e={}
e["pin_no"]="38"
e["texts"]={"TX","CTSn","P0.0"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,0,0)
elseif i~=0 and o==0 then
fill_Mini51_UART(e,t,0,0,"CTSn")
elseif i~=0 and o~=0 then
fill_Mini51_UART(e,t,0,0,"TX")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,0,0)
end
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[40]=e
local o=ext.band(t["GCR_P5_MFP"],2048)
local i=ext.band(t["GCR_P5_MFP"],8)
e={}
e["pin_no"]="41"
e["texts"]={"AIN0","P5.3"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,5,3)
elseif o==0 and i~=0 then
fill_Mini51_ADC(e,t,5,3,"AIN0")
else
fill_invalid_GPIO(e,t,5,3)
end
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"VDD"}
e["highlight_text"]="VDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"AVDD"}
e["highlight_text"]="AVDD"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
a[43]=e
local o=ext.band(t["GCR_P1_MFP"],256)
local i=ext.band(t["GCR_P1_MFP"],1)
e={}
e["pin_no"]="44"
e["texts"]={"AIN1","P1.0"}
if o==0 and i==0 then
fill_Mini51_GPIO(e,t,1,0)
elseif o==0 and i~=0 then
fill_Mini51_ADC(e,t,1,0,"AIN1")
else
fill_invalid_GPIO(e,t,1,0)
end
a[44]=e
local i=ext.band(t["GCR_P1_MFP"],1024)
local o=ext.band(t["GCR_P1_MFP"],4)
e={}
e["pin_no"]="45"
e["texts"]={"RX","AIN2","P1.2"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,2)
elseif i==0 and o~=0 then
fill_Mini51_ADC(e,t,1,2,"AIN2")
elseif i~=0 and o==0 then
fill_Mini51_UART(e,t,1,2,"RX")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,1,2)
end
a[45]=e
local i=ext.band(t["GCR_P1_MFP"],2048)
local o=ext.band(t["GCR_P1_MFP"],8)
e={}
e["pin_no"]="46"
e["texts"]={"TX","AIN3","P1.3"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,3)
elseif i==0 and o~=0 then
fill_Mini51_ADC(e,t,1,3,"AIN3")
elseif i~=0 and o==0 then
fill_Mini51_UART(e,t,1,3,"TX")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,1,3)
end
a[46]=e
local i=ext.band(t["GCR_P1_MFP"],4096)
local o=ext.band(t["GCR_P1_MFP"],16)
e={}
e["pin_no"]="47"
e["texts"]={"CPN0","AIN4","P1.4"}
if i==0 and o==0 then
fill_Mini51_GPIO(e,t,1,4)
elseif i==0 and o~=0 then
fill_Mini51_ADC(e,t,1,4,"AIN4")
elseif i~=0 and o~=0 then
fill_Mini51_ACMP(e,t,1,4,"CPN0")
else
fill_invalid_GPIO(e,t,1,4)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[48]=e
return{name=n,information="",pins=a}
end
