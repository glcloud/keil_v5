local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NM1500.lua")
function get_chip_status_NM1510_AE_LQFP48(n,e,t,o)
local a={}
local t=read_NM1500_Registers(n,e,t,o)
local e
e={}
e["pin_no"]="5"
e["texts"]={"VDD"}
fill_NM1500_Normal(e,t,nil,nil,"VDD")
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"VSS"}
fill_NM1500_Normal(e,t,nil,nil,"VSS")
a[6]=e
e={}
e["pin_no"]="4"
e["texts"]={"LDO_CAP"}
fill_NM1500_Normal(e,t,nil,nil,"LDO_CAP")
a[4]=e
e={}
e["pin_no"]="1"
e["texts"]={"PVSS"}
fill_NM1500_Normal(e,t,nil,nil,"PVSS")
a[1]=e
e={}
e["pin_no"]="36"
e["texts"]={"AVDD"}
fill_NM1500_Normal(e,t,nil,nil,"AVDD")
a[36]=e
e={}
e["pin_no"]="35"
e["texts"]={"AVSS"}
fill_NM1500_Normal(e,t,nil,nil,"AVSS")
a[35]=e
e={}
e["pin_no"]="44"
e["texts"]={"/RESET"}
fill_NM1500_Normal(e,t,nil,nil,"/RESET")
e["direction"]=kPinDirection_In
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"XT_OUT"}
fill_NM1500_Normal(e,t,nil,nil,"XT_OUT")
e["direction"]=kPinDirection_PushPullOut
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"XT_IN"}
fill_NM1500_Normal(e,t,nil,nil,"XT_IN")
e["direction"]=kPinDirection_In
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"ICE_DAT"}
fill_NM1500_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"ICE_CLK"}
fill_NM1500_Normal(e,t,nil,nil,"ICE_CLK")
e["direction"]=kPinDirection_In
a[48]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],256),8)
local o=ext.band(t["GCR_P0_MFP"],1)
e={}
e["pin_no"]="26"
e["texts"]={"PWM00","P0.0"}
if o==0 then
fill_NM1500_GPIO(e,t,0,0)
elseif o==1 then
fill_NM1500_EPWM(e,t,0,0,"PWM00",0)
end
a[26]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],4),2)
e={}
e["pin_no"]="25"
e["texts"]={"PWM02","P0.2"}
if o==0 then
fill_NM1500_GPIO(e,t,0,2)
elseif o==1 then
fill_NM1500_EPWM(e,t,0,2,"PWM02",0)
end
a[25]=e
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P0_MFP"],16),4)
e={}
e["pin_no"]="23"
e["texts"]={"P0.4","PWM04"}
if o==0 then
fill_NM1500_GPIO(e,t,0,4)
elseif o==1 then
fill_NM1500_EPWM(e,t,0,4,"PWM04",0)
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],256),8)
local o=ext.band(t["GCR_P1_MFP"],1)
e={}
e["pin_no"]="14"
e["texts"]={"P1.0","PWM10"}
if o==0 then
fill_NM1500_GPIO(e,t,1,0)
elseif o==1 then
fill_NM1500_EPWM(e,t,1,0,"PWM10",1)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2),1)
e={}
e["pin_no"]="13"
e["texts"]={"P1.1","PWM11"}
if o==0 then
fill_NM1500_GPIO(e,t,1,1)
elseif o==1 then
fill_NM1500_EPWM(e,t,1,1,"PWM11",1)
end
a[13]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4),2)
e={}
e["pin_no"]="12"
e["texts"]={"P1.2","PWM12"}
if o==0 then
fill_NM1500_GPIO(e,t,1,2)
elseif o==1 then
fill_NM1500_EPWM(e,t,1,2,"PWM12",1)
end
a[12]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],8),3)
e={}
e["pin_no"]="11"
e["texts"]={"P1.3","PWM13"}
if o==0 then
fill_NM1500_GPIO(e,t,1,3)
elseif o==1 then
fill_NM1500_EPWM(e,t,1,3,"PWM13",1)
end
a[11]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],16),4)
e={}
e["pin_no"]="10"
e["texts"]={"P1.4","PWM14"}
if o==0 then
fill_NM1500_GPIO(e,t,1,4)
elseif o==1 then
fill_NM1500_EPWM(e,t,1,4,"PWM14",1)
end
a[10]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],32),5)
e={}
e["pin_no"]="9"
e["texts"]={"P1.5","PWM15"}
if o==0 then
fill_NM1500_GPIO(e,t,1,5)
elseif o==1 then
fill_NM1500_EPWM(e,t,1,5,"PWM15",1)
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P1_MFP"],128),7)
e={}
e["pin_no"]="3"
e["texts"]={"P1.7","BKP10"}
if o==0 then
fill_NM1500_GPIO(e,t,1,7)
elseif o==1 then
fill_NM1500_EPWM(e,t,1,7,"BKP10",1)
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],16),4)
e={}
e["pin_no"]="22"
e["texts"]={"P2.4","QEIA0"}
if o==0 then
fill_NM1500_GPIO(e,t,2,4)
elseif o==1 then
fill_NM1500_QEI(e,t,2,4,"QEIA0",0)
end
a[22]=e
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],32),5)
e={}
e["pin_no"]="21"
e["texts"]={"P2.5","QEIB0"}
if o==0 then
fill_NM1500_GPIO(e,t,2,5)
elseif o==1 then
fill_NM1500_QEI(e,t,2,5,"QEIB0",0)
end
a[21]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],16384),14)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],64),6)
e={}
e["pin_no"]="20"
e["texts"]={"P2.6","IDX0","/SS0","CTS1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,2,6)
elseif i==0 and o==1 then
fill_NM1500_QEI(e,t,2,6,"IDX0",0)
elseif i==1 and o==0 then
fill_NM1500_SPI(e,t,2,6,"/SS0",0)
elseif i==1 and o==1 then
fill_NM1500_UART(e,t,2,6,"CTS1",1)
else
fill_invalid_GPIO(e,t,2,6)
end
a[20]=e
local i=ext.rshift(ext.band(t["GCR_P2_MFP"],32768),15)
local o=ext.rshift(ext.band(t["GCR_P2_MFP"],128),7)
e={}
e["pin_no"]="19"
e["texts"]={"P2.7","SPI_CLK0","RTS1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,2,7)
elseif i==0 and o==1 then
fill_NM1500_GPIO(e,t,2,7)
elseif i==1 and o==0 then
fill_NM1500_SPI(e,t,2,7,"SPI_CLK0",0)
elseif i==1 and o==1 then
fill_NM1500_UART(e,t,2,7,"RTS1",1)
else
fill_invalid_GPIO(e,t,2,7)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],256),8)
local o=ext.band(t["GCR_P3_MFP"],1)
e={}
e["pin_no"]="15"
e["texts"]={"P3.0","RX0"}
if o==0 then
fill_NM1500_GPIO(e,t,3,0)
elseif o==1 then
fill_NM1500_UART(e,t,3,0,"RX0",0)
end
a[15]=e
local i=ext.rshift(ext.band(t["GCR_P3_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],2),1)
e={}
e["pin_no"]="16"
e["texts"]={"P3.1","TX0","CPO0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,3,1)
elseif i==0 and o==1 then
fill_NM1500_UART(e,t,3,1,"TX0",0)
elseif i==1 and o==0 then
fill_NM1500_ACMP(e,t,3,1,"CPO0",0)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,3,1)
end
a[16]=e
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P3_MFP"],4),2)
e={}
e["pin_no"]="2"
e["texts"]={"P3.2","/INT0"}
if o==0 then
fill_NM1500_GPIO(e,t,3,2)
elseif o==1 then
fill_NM1500_Normal(e,t,3,2,"/INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],256),8)
local i=ext.band(t["GCR_P5_MFP"],1)
e={}
e["pin_no"]="17"
e["texts"]={"P5.0","MOSI0","RTS0"}
if o==0 and i==0 then
fill_NM1500_GPIO(e,t,5,0)
elseif o==0 and i==1 then
fill_NM1500_SPI(e,t,5,0,"MOSI0",0)
fill_NM1500_SPI_IO(e,t,0,false)
elseif o==1 and i==0 then
fill_NM1500_UART(e,t,5,0,"RTS0",0)
else
fill_invalid_GPIO(e,t,5,0)
end
a[17]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],2),1)
e={}
e["pin_no"]="18"
e["texts"]={"P5.1","MISO0","CTS0"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,5,1)
elseif i==0 and o==1 then
fill_NM1500_SPI(e,t,5,1,"MISO0",0)
fill_NM1500_SPI_IO(e,t,0,true)
elseif i==1 and o==0 then
fill_NM1500_UART(e,t,5,1,"CTS0",0)
else
fill_invalid_GPIO(e,t,5,1)
end
a[18]=e
local i=ext.rshift(ext.band(t["GCR_P5_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P5_MFP"],4),2)
e={}
e["pin_no"]="24"
e["texts"]={"P5.2","MISO2","CPO1"}
if i==0 and o==0 then
fill_NM1500_GPIO(e,t,5,2)
elseif i==0 and o==1 then
fill_NM1500_SPI(e,t,5,2,"MISO2",2)
fill_NM1500_SPI_IO(e,t,2,true)
elseif i==1 and o==0 then
fill_NM1500_ACMP(e,t,5,2,"CPO1",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,5,2)
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],2),1)
e={}
e["pin_no"]="31"
e["texts"]={"AINA1","P6.1"}
if o==0 then
fill_NM1500_GPIO(e,t,6,1)
elseif o==1 then
fill_NM1500_ADC(e,t,6,1,"AINA1")
end
a[31]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],4),2)
e={}
e["pin_no"]="30"
e["texts"]={"AINA2","P6.2"}
if o==0 then
fill_NM1500_GPIO(e,t,6,2)
elseif o==1 then
fill_NM1500_ADC(e,t,6,2,"AINA2")
end
a[30]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],8),3)
e={}
e["pin_no"]="29"
e["texts"]={"AINA3","P6.3"}
if o==0 then
fill_NM1500_GPIO(e,t,6,3)
elseif o==1 then
fill_NM1500_ADC(e,t,6,3,"AINA3")
end
a[29]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],16),4)
e={}
e["pin_no"]="28"
e["texts"]={"CPN1","AINA4","P6.4"}
if o==0 then
fill_NM1500_GPIO(e,t,6,4)
elseif o==1 then
local o=fill_NM1500_ADC(e,t,6,4,"AINA4")
local a=fill_NM1500_ACMP(e,t,6,4,"CPN1")
local i=string.format("%s%s",o.warn,a.warn)
local n=string.format("%s%s",o.info,a.info)
local o=o.clk_regs
for t,e in ipairs(a.clk_regs)do
table.insert(o,e)
end
if i~=""then
e["pin_no_color"]=kBgColor_Error
end
e["information"]=string.format(
"<b>%s</b><br>%s<br>%s%s%s",
"AINA4,CPN1",
i,
get_mfp_regs(t,6),
get_clk_informnation(t,o),
n)
e["texts"]={"AINA4,CPN1","P6.4"}
e["highlight_text"]="AINA4,CPN1"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P6_MFP"],32),5)
e={}
e["pin_no"]="27"
e["texts"]={"CPP1","AINA5","P6.5"}
if o==0 then
fill_NM1500_GPIO(e,t,6,5)
elseif o==1 then
local a=fill_NM1500_ADC(e,t,6,5,"AINA5")
local o=fill_NM1500_ACMP(e,t,6,5,"CPP1")
local i=string.format("%s%s",a.warn,o.warn)
local n=string.format("%s%s",a.info,o.info)
local a=a.clk_regs
for t,e in ipairs(o.clk_regs)do
table.insert(a,e)
end
if i~=""then
e["pin_no_color"]=kBgColor_Error
end
e["information"]=string.format(
"<b>%s</b><br>%s<br>%s%s%s",
"AINA5,CPP1",
i,
get_mfp_regs(t,6),
get_clk_informnation(t,a),
n)
e["texts"]={"AINA5,CPP1","P6.5"}
e["highlight_text"]="AINA5,CPP1"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
a[27]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],2),1)
e={}
e["pin_no"]="40"
e["texts"]={"AINB1","P7.1"}
if o==0 then
fill_NM1500_GPIO(e,t,7,1)
elseif o==1 then
fill_NM1500_ADC(e,t,7,1,"AINB1")
end
a[40]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],4),2)
e={}
e["pin_no"]="39"
e["texts"]={"AINB2","P7.2"}
if o==0 then
fill_NM1500_GPIO(e,t,7,2)
elseif o==1 then
fill_NM1500_ADC(e,t,7,2,"AINB2")
end
a[39]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],2048),11)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],8),3)
e={}
e["pin_no"]="38"
e["texts"]={"AINB3","P7.3"}
if o==0 then
fill_NM1500_GPIO(e,t,7,3)
elseif o==1 then
fill_NM1500_ADC(e,t,7,3,"AINB3")
end
a[38]=e
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_P7_MFP"],32),5)
e={}
e["pin_no"]="37"
e["texts"]={"CPP2","AINB5","P7.5"}
if o==0 then
fill_NM1500_GPIO(e,t,7,5)
elseif o==1 then
local o=fill_NM1500_ADC(e,t,7,5,"AINB5")
local a=fill_NM1500_ACMP(e,t,7,5,"CPP2")
local i=string.format("%s%s",o.warn,a.warn)
local n=string.format("%s%s",o.info,a.info)
local o=o.clk_regs
for t,e in ipairs(a.clk_regs)do
table.insert(o,e)
end
if i~=""then
e["pin_no_color"]=kBgColor_Error
end
e["information"]=string.format(
"<b>%s</b><br>%s<br>%s%s%s",
"AINB5,CPP2",
i,
get_mfp_regs(t,7),
get_clk_informnation(t,o),
n)
e["texts"]={"AINB5,CPP2","P7.5"}
e["highlight_text"]="AINB5,CPP2"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_ADC
e["pin_bg_color"]=kBgColor_ADC
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],256),8)
local o=ext.band(t["GCR_P8_MFP"],1)
e={}
e["pin_no"]="34"
e["texts"]={"OPP0","P8.0"}
if o==0 then
fill_NM1500_GPIO(e,t,8,0)
elseif o==1 then
fill_NM1500_OPA(e,t,8,0,"OPP0",0)
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],2),1)
e={}
e["pin_no"]="33"
e["texts"]={"OPN0","P8.1"}
if o==0 then
fill_NM1500_GPIO(e,t,8,1)
elseif o==1 then
fill_NM1500_OPA(e,t,8,1,"OPN0",0)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P8_MFP"],4),2)
e={}
e["pin_no"]="32"
e["texts"]={"OPO0","P8.2"}
if o==0 then
fill_NM1500_GPIO(e,t,8,2)
elseif o==1 then
fill_NM1500_OPA(e,t,8,2,"OPO0",0)
e["direction"]=kPinDirection_PushPullOut
end
a[32]=e
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],256),8)
local o=ext.band(t["GCR_P9_MFP"],1)
e={}
e["pin_no"]="41"
e["texts"]={"OPO1","P9.0"}
if o==0 then
fill_NM1500_GPIO(e,t,9,0)
elseif o==1 then
fill_NM1500_OPA(e,t,9,0,"OPO1",1)
e["direction"]=kPinDirection_PushPullOut
end
a[41]=e
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],2),1)
e={}
e["pin_no"]="42"
e["texts"]={"OPN1","P9.1"}
if o==0 then
fill_NM1500_GPIO(e,t,9,1)
elseif o==1 then
fill_NM1500_OPA(e,t,9,1,"OPN1",1)
end
a[42]=e
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],1024),10)
local o=ext.rshift(ext.band(t["GCR_P9_MFP"],4),2)
e={}
e["pin_no"]="43"
e["texts"]={"OPP1","P9.2"}
if o==0 then
fill_NM1500_GPIO(e,t,9,2)
elseif o==1 then
fill_NM1500_OPA(e,t,9,2,"OPP1",1)
end
a[43]=e
local o=ext.rshift(ext.band(t["GCR_PA_MFP"],256),8)
local o=ext.band(t["GCR_PA_MFP"],1)
e={}
e["pin_no"]="8"
e["texts"]={"PA.0","TX1"}
if o==0 then
fill_NM1500_GPIO(e,t,10,0)
elseif o==1 then
fill_NM1500_UART(e,t,10,0,"TX1",1)
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_PA_MFP"],512),9)
local o=ext.rshift(ext.band(t["GCR_PA_MFP"],2),1)
e={}
e["pin_no"]="7"
e["texts"]={"PA.1","RX1"}
if o==0 then
fill_NM1500_GPIO(e,t,10,1)
elseif o==1 then
fill_NM1500_UART(e,t,10,1,"RX1",1)
end
a[7]=e
return{name=n,information="",pins=a}
end
