local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Nano100.lua")
function get_chip_status_Nano120_BN_LQFP128(n,e,e)
local a={}
local t=read_Nano100_Registers()
local e
e={}
e["pin_no"]="1"
e["texts"]={"PE.13"}
fill_Nano100_GPIO(e,t,"E",13)
a[1]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],117440512),24)
e={}
e["pin_no"]="2"
e["texts"]={"PB.14","INT0","SC2_CD","SPI2_SS1"}
if o==1 then
fill_Nano100_Normal(e,t,"B","H","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano100_SC(e,t,"B","H","SC2_CD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano100_SPI(e,t,"B","H","SPI2_SS1",2)
else
fill_Nano100_GPIO(e,t,"B",14)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],7340032),20)
e={}
e["pin_no"]="3"
e["texts"]={"PB.13","EBI_AD1"}
if o==2 then
fill_Nano100_EBI(e,t,"B","H","EBI_AD1")
e["direction"]=kPinDirection_Bi
else
fill_Nano100_GPIO(e,t,"B",13)
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],458752),16)
e={}
e["pin_no"]="4"
e["texts"]={"PB.12","EBI_AD0","FCLKO"}
if o==2 then
fill_Nano100_EBI(e,t,"B","H","EBI_AD0")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_Nano100_CLKO(e,t,"B","H","FCLKO")
else
fill_Nano100_GPIO(e,t,"B",12)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"X32O"}
fill_Nano100_Normal(e,t,nil,nil,"X32O")
e["direction"]=kPinDirection_PushPullOut
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"X32I"}
fill_Nano100_Normal(e,t,nil,nil,"X32I")
e["direction"]=kPinDirection_In
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[8]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],28672),12)
e={}
e["pin_no"]="9"
e["texts"]={"PA.11","I2C1_SCL","EBI_nRD","SC0_RST","SPI2_MOSI0"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C1_SCL",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","EBI_nRD")
elseif o==3 then
fill_Nano100_SC(e,t,"A","H","SC0_RST",0)
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","SPI2_MOSI0",2)
fill_Nano100_SPI_IO(e,t,2,false)
else
fill_Nano100_GPIO(e,t,"A",11)
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],1792),8)
e={}
e["pin_no"]="10"
e["texts"]={"PA.10","I2C1_SDA","EBI_nWR","SC0_PWR","SPI2_MISO0"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C1_SDA",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","EBI_nWR")
elseif o==3 then
fill_Nano100_SC(e,t,"A","H","SC0_PWR",0)
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","SPI2_MISO0",2)
fill_Nano100_SPI_IO(e,t,2,true)
else
fill_Nano100_GPIO(e,t,"A",10)
end
a[10]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],112),4)
local i=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="11"
e["texts"]={"PA.9","I2C0_SCL","SC0_DAT","SPI2_CLK"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C0_SCL",0)
elseif o==3 then
if i==0 then
fill_Nano100_SC(e,t,"A","H","SC0_DAT",0)
else
fill_Nano100_SC(e,t,"A","H","SC0_UART_RXD",0)
e["texts"]={"PA.9","I2C0_SCL","SC0_UART_RXD","SPI2_CLK"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","SPI2_CLK",2)
else
fill_Nano100_GPIO(e,t,"A",9)
end
a[11]=e
local o=ext.band(t["GCR_PA_H_MFP"],7)
local i=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="12"
e["texts"]={"PA.8","I2C0_SDA","SC0_CLK","SPI2_SS0"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C0_SDA",0)
elseif o==3 then
if i==0 then
fill_Nano100_SC(e,t,"A","H","SC0_CLK",0)
else
fill_Nano100_SC(e,t,"A","H","SC0_UART_TXD",0)
e["texts"]={"PA.8","I2C0_SDA","SC0_UART_TXD","SPI2_SS0"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","SPI2_SS0",2)
else
fill_Nano100_GPIO(e,t,"A",8)
end
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"PD.8"}
fill_Nano100_GPIO(e,t,"D",8)
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"PD.9"}
fill_Nano100_GPIO(e,t,"D",9)
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"PD.10"}
fill_Nano100_GPIO(e,t,"D",10)
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"PD.11"}
fill_Nano100_GPIO(e,t,"D",11)
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"PD.12"}
fill_Nano100_GPIO(e,t,"D",12)
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"PD.13"}
fill_Nano100_GPIO(e,t,"D",13)
a[18]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],458752),16)
e={}
e["pin_no"]="19"
e["texts"]={"PB.4","UART1_RXD","SC0_CD","SPI2_SS0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART1_RXD",1)
elseif o==3 then
fill_Nano100_SC(e,t,"B","L","SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","SPI2_SS0",2)
else
fill_Nano100_GPIO(e,t,"B",4)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],7340032),20)
e={}
e["pin_no"]="20"
e["texts"]={"PB.5","UART1_TXD","SC0_RST","SPI2_CLK"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART1_TXD",1)
elseif o==3 then
fill_Nano100_SC(e,t,"B","L","SC0_RST",0)
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","SPI2_CLK",2)
else
fill_Nano100_GPIO(e,t,"B",5)
end
a[20]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],117440512),24)
e={}
e["pin_no"]="21"
e["texts"]={"PB.6","UART1_RTSn","EBI_ALE","SPI2_MISO0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART1_RTSn",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","EBI_ALE")
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","SPI2_MISO0",2)
fill_Nano100_SPI_IO(e,t,2,true)
else
fill_Nano100_GPIO(e,t,"B",6)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],1879048192),28)
e={}
e["pin_no"]="22"
e["texts"]={"PB.7","UART1_CTSn","EBI_nCS","SPI2_MOSI0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART1_CTSn",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","EBI_nCS")
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","SPI2_MOSI0",2)
fill_Nano100_SPI_IO(e,t,2,false)
else
fill_Nano100_GPIO(e,t,"B",7)
end
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"LDO_CAP"}
fill_Nano100_Normal(e,t,nil,nil,"LDO_CAP")
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"VDD"}
fill_Nano100_Normal(e,t,nil,nil,"VDD")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"PE.12"}
fill_Nano100_GPIO(e,t,"E",12)
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"PE.11"}
fill_Nano100_GPIO(e,t,"E",11)
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"PE.10"}
fill_Nano100_GPIO(e,t,"E",10)
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"PE.9"}
fill_Nano100_GPIO(e,t,"E",9)
a[36]=e
e={}
e["pin_no"]="37"
e["texts"]={"PE.8"}
fill_Nano100_GPIO(e,t,"E",8)
a[37]=e
e={}
e["pin_no"]="38"
e["texts"]={"PE.7"}
fill_Nano100_GPIO(e,t,"E",7)
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"USB_VBUS"}
fill_Nano100_Normal(e,t,nil,nil,"USB_VBUS")
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"USB_VDD33_CAP"}
fill_Nano100_Normal(e,t,nil,nil,"USB_VDD33_CAP")
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"USB_D-"}
fill_Nano100_USB(e,t,"USB_D-")
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"USB_D+"}
fill_Nano100_USB(e,t,"USB_D+")
a[43]=e
local o=ext.band(t["GCR_PB_L_MFP"],7)
e={}
e["pin_no"]="44"
e["texts"]={"PB.0","UART0_RXD","SPI1_MOSI0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART0_RXD",0)
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPI1_MOSI0",1)
fill_Nano100_SPI_IO(e,t,1,false)
else
fill_Nano100_GPIO(e,t,"B",0)
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],112),4)
e={}
e["pin_no"]="45"
e["texts"]={"PB.1","UART0_TXD","SPI1_MISO0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART0_TXD",0)
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPI1_MISO0",1)
fill_Nano100_SPI_IO(e,t,1,true)
else
fill_Nano100_GPIO(e,t,"B",1)
end
a[45]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],1792),8)
e={}
e["pin_no"]="46"
e["texts"]={"PB.2","UART0_RTSn","EBI_nWRL","SPI1_CLK"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART0_RTSn",0)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","EBI_nWRL")
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPI1_CLK",1)
else
fill_Nano100_GPIO(e,t,"B",2)
end
a[46]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],28672),12)
e={}
e["pin_no"]="47"
e["texts"]={"PB.3","UART0_CTSn","EBI_nWRH","SPI1_SS0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART0_CTSn",0)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","EBI_nWRH")
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPI1_SS0",1)
else
fill_Nano100_GPIO(e,t,"B",3)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"PD.6"}
fill_Nano100_GPIO(e,t,"D",6)
a[48]=e
e={}
e["pin_no"]="49"
e["texts"]={"PD.7"}
fill_Nano100_GPIO(e,t,"D",7)
a[49]=e
e={}
e["pin_no"]="50"
e["texts"]={"PD.14"}
fill_Nano100_GPIO(e,t,"D",14)
a[50]=e
e={}
e["pin_no"]="51"
e["texts"]={"PD.15"}
fill_Nano100_GPIO(e,t,"D",15)
a[51]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],7340032),20)
e={}
e["pin_no"]="52"
e["texts"]={"PC.5","SPI0_MOSI1"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPI0_MOSI1",0)
fill_Nano100_SPI_IO(e,t,0,false)
else
fill_Nano100_GPIO(e,t,"C",5)
end
a[52]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],458752),16)
e={}
e["pin_no"]="53"
e["texts"]={"PC.4","SPI0_MISO1"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPI0_MISO1",0)
fill_Nano100_SPI_IO(e,t,0,true)
else
fill_Nano100_GPIO(e,t,"C",4)
end
a[53]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],28672),12)
e={}
e["pin_no"]="54"
e["texts"]={"PC.3","SPI0_MOSI0","I2S_DO","SC1_RST"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPI0_MOSI0",0)
fill_Nano100_SPI_IO(e,t,0,false)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2S_DO")
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1_RST",1)
else
fill_Nano100_GPIO(e,t,"C",3)
end
a[54]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],1792),8)
e={}
e["pin_no"]="55"
e["texts"]={"PC.2","SPI0_MISO0","I2S_DI","SC1_PWR"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPI0_MISO0",0)
fill_Nano100_SPI_IO(e,t,0,true)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2S_DI")
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1_PWR",1)
else
fill_Nano100_GPIO(e,t,"C",2)
end
a[55]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],112),4)
local i=ext.band(t["SC1_SCx_UACTL"],1)
e={}
e["pin_no"]="56"
e["texts"]={"PC.1","SPI0_CLK","I2S_BCLK","SC1_DAT"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPI0_CLK",0)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2S_BCLK")
elseif o==4 then
if i==0 then
fill_Nano100_SC(e,t,"C","L","SC1_DAT",1)
else
fill_Nano100_SC(e,t,"C","L","SC1_UART_RXD",1)
e["texts"]={"PC.1","SPI0_CLK","I2S_BCLK","SC1_UART_RXD"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
else
fill_Nano100_GPIO(e,t,"C",1)
end
a[56]=e
local o=ext.band(t["GCR_PC_L_MFP"],7)
local s=ext.band(t["SC1_SCx_UACTL"],1)
local i=ext.band(t["CLK_MCLKO"],128)
e={}
e["pin_no"]="57"
e["texts"]={"PC.0","MCLKO","SPI0_SS0","I2S_LRCLK","SC1_CLK"}
if i~=0 then
fill_Nano100_MCLKO(e,t,"C","L","MCLKO")
else
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPI0_SS0",0)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2S_LRCLK")
elseif o==4 then
if s==0 then
fill_Nano100_SC(e,t,"C","L","SC1_CLK",1)
else
fill_Nano100_SC(e,t,"C","L","SC1_UART_TXD",1)
e["texts"]={"PC.0","SPI0_SS0","I2S_LRCLK","SC1_UART_TXD"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
else
fill_Nano100_GPIO(e,t,"C",0)
end
end
a[57]=e
e={}
e["pin_no"]="58"
e["texts"]={"PE.6"}
fill_Nano100_GPIO(e,t,"E",6)
a[58]=e
e={}
e["pin_no"]="59"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[60]=e
local o=ext.rshift(ext.band(t["GCR_PE_L_MFP"],7340032),20)
e={}
e["pin_no"]="61"
e["texts"]={"PE.5","PWM1_CH1"}
if o==1 then
fill_Nano100_PWM(e,t,"E","L","PWM1_CH1",1,1)
else
fill_Nano100_GPIO(e,t,"E",5)
end
a[61]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],28672),12)
local i=ext.band(t["SC2_SCx_UACTL"],1)
e={}
e["pin_no"]="62"
e["texts"]={"PB.11","PWM1_CH0","TM3","SC2_DAT","SPI0_MISO0"}
if o==1 then
fill_Nano100_PWM(e,t,"B","H","PWM1_CH0",1,0)
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TM3",1,1)
elseif o==4 then
if i==0 then
fill_Nano100_SC(e,t,"B","H","SC2_DAT",2)
else
fill_Nano100_SC(e,t,"B","H","SC2_UART_RXD",2)
e["texts"]={"PB.11","PWM1_CH0","TM3","SC2_UART_RXD","SPI0_MISO0"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==5 then
fill_Nano100_SPI(e,t,"B","H","SPI0_MISO0",0)
fill_Nano100_SPI_IO(e,t,0,true)
else
fill_Nano100_GPIO(e,t,"B",11)
end
a[62]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],1792),8)
local i=ext.band(t["SC2_SCx_UACTL"],1)
e={}
e["pin_no"]="63"
e["texts"]={"PB.10","SPI0_SS1","TM2","SC2_CLK","SPI0_MOSI0"}
if o==1 then
fill_Nano100_SPI(e,t,"B","H","SPI0_SS1",0)
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TM2",1,0)
elseif o==4 then
if i==0 then
fill_Nano100_SC(e,t,"B","H","SC2_CLK",2)
else
fill_Nano100_SC(e,t,"B","H","SC2_UART_TXD",2)
e["texts"]={"PB.10","SPI0_SS1","TM2","SC2_UART_TXD","SPI0_MOSI0"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==5 then
fill_Nano100_SPI(e,t,"B","H","SPI0_MOSI0",0)
fill_Nano100_SPI_IO(e,t,0,false)
else
fill_Nano100_GPIO(e,t,"B",10)
end
a[63]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],112),4)
e={}
e["pin_no"]="64"
e["texts"]={"PB.9","SPI1_SS1","TM1","SC2_RST","INT0"}
if o==1 then
fill_Nano100_SPI(e,t,"B","H","SPI1_SS1",1)
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TM1",0,1)
elseif o==4 then
fill_Nano100_SC(e,t,"B","H","SC2_RST",2)
elseif o==5 then
fill_Nano100_Normal(e,t,"B","H","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_Nano100_GPIO(e,t,"B",9)
end
a[64]=e
local o=ext.rshift(ext.band(t["GCR_PE_L_MFP"],458752),16)
e={}
e["pin_no"]="65"
e["texts"]={"SPI0_MOSI0","PE.4"}
if o==6 then
fill_Nano100_SPI(e,t,"E","L","SPI0_MOSI0",0)
fill_Nano100_SPI_IO(e,t,0,false)
else
fill_Nano100_GPIO(e,t,"E",4)
end
a[65]=e
local o=ext.rshift(ext.band(t["GCR_PE_L_MFP"],28672),12)
e={}
e["pin_no"]="66"
e["texts"]={"SPI0_MISO0","PE.3"}
if o==6 then
fill_Nano100_SPI(e,t,"E","L","SPI0_MISO0",0)
fill_Nano100_SPI_IO(e,t,0,true)
else
fill_Nano100_GPIO(e,t,"E",3)
end
a[66]=e
local o=ext.rshift(ext.band(t["GCR_PE_L_MFP"],1792),8)
e={}
e["pin_no"]="67"
e["texts"]={"SPI0_CLK","PE.2"}
if o==6 then
fill_Nano100_SPI(e,t,"E","L","SPI0_CLK",0)
else
fill_Nano100_GPIO(e,t,"E",2)
end
a[67]=e
local o=ext.rshift(ext.band(t["GCR_PE_L_MFP"],112),4)
e={}
e["pin_no"]="68"
e["texts"]={"SPI0_SS0","PWM1_CH3","PE.1"}
if o==1 then
fill_Nano100_PWM(e,t,"E","L","PWM1_CH3",1,3)
elseif o==6 then
fill_Nano100_SPI(e,t,"E","L","SPI0_SS0",0)
else
fill_Nano100_GPIO(e,t,"E",1)
end
a[68]=e
local o=ext.band(t["GCR_PE_L_MFP"],7)
e={}
e["pin_no"]="69"
e["texts"]={"I2S_MCLK","PWM1_CH2","PE.0"}
if o==1 then
fill_Nano100_PWM(e,t,"E","L","PWM1_CH2",1,2)
elseif o==2 then
fill_Nano100_I2S(e,t,"E","L","I2S_MCLK")
else
fill_Nano100_GPIO(e,t,"E",0)
end
a[69]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],7340032),20)
e={}
e["pin_no"]="70"
e["texts"]={"I2C0_SCL","INT1","SNOOPER","PWM1_CH1","SPI1_MOSI1","PC.13"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPI1_MOSI1",1)
fill_Nano100_SPI_IO(e,t,1,false)
elseif o==2 then
fill_Nano100_PWM(e,t,"C","H","PWM1_CH1",1,1)
elseif o==4 then
fill_Nano100_Normal(e,t,"C","H","SNOOPER")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano100_Normal(e,t,"C","H","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==6 then
fill_Nano100_I2C(e,t,"C","H","I2C0_SCL",0)
else
fill_Nano100_GPIO(e,t,"C",13)
end
a[70]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],458752),16)
e={}
e["pin_no"]="71"
e["texts"]={"I2C0_SDA","INT0","PWM1_CH0","SPI1_MISO1","PC.12"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPI1_MISO1",1)
fill_Nano100_SPI_IO(e,t,1,true)
elseif o==2 then
fill_Nano100_PWM(e,t,"C","H","PWM1_CH0",1,0)
elseif o==5 then
fill_Nano100_Normal(e,t,"C","H","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==6 then
fill_Nano100_I2C(e,t,"C","H","I2C0_SDA",0)
else
fill_Nano100_GPIO(e,t,"C",12)
end
a[71]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],28672),12)
e={}
e["pin_no"]="72"
e["texts"]={"CTK15","UART1_TXD","SPI1_MOSI0","PC.11"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPI1_MOSI0",1)
fill_Nano100_SPI_IO(e,t,1,false)
elseif o==5 then
fill_Nano100_UART(e,t,"C","H","UART1_TXD",1)
elseif o==6 then
fill_Nano100_TK(e,t,"C","H","CTK15",15)
else
fill_Nano100_GPIO(e,t,"C",11)
end
a[72]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],1792),8)
e={}
e["pin_no"]="73"
e["texts"]={"CTK14","UART1_RXD","SPI1_MISO0","PC.10"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPI1_MISO0",1)
fill_Nano100_SPI_IO(e,t,1,true)
elseif o==5 then
fill_Nano100_UART(e,t,"C","H","UART1_RXD",1)
elseif o==6 then
fill_Nano100_TK(e,t,"C","H","CTK14",14)
else
fill_Nano100_GPIO(e,t,"C",10)
end
a[73]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],112),4)
e={}
e["pin_no"]="74"
e["texts"]={"CTK13","I2C1_SCL","SPI1_CLK","PC.9"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPI1_CLK",1)
elseif o==5 then
fill_Nano100_I2C(e,t,"C","H","I2C1_SCL",1)
elseif o==6 then
fill_Nano100_TK(e,t,"C","H","CTK13",13)
else
fill_Nano100_GPIO(e,t,"C",9)
end
a[74]=e
local o=ext.band(t["GCR_PC_H_MFP"],7)
e={}
e["pin_no"]="75"
e["texts"]={"CTK12","I2C1_SDA","EBI_MCLK","SPI1_SS0","PC.8"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPI1_SS0",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"C","H","EBI_MCLK")
elseif o==5 then
fill_Nano100_I2C(e,t,"C","H","I2C1_SDA",1)
elseif o==6 then
fill_Nano100_TK(e,t,"C","H","CTK12",12)
else
fill_Nano100_GPIO(e,t,"C",8)
end
a[75]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],1879048192),28)
e={}
e["pin_no"]="76"
e["texts"]={"UART0_TXD","SC0_PWR","TC3","I2S_MCLK","PWM0_CH3","PA.15"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0_CH3",0,3)
elseif o==2 then
fill_Nano100_I2S(e,t,"A","H","I2S_MCLK")
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC3",1,1)
elseif o==4 then
fill_Nano100_SC(e,t,"A","H","SC0_PWR",0)
elseif o==6 then
fill_Nano100_UART(e,t,"A","H","UART0_TXD",0)
else
fill_Nano100_GPIO(e,t,"A",15)
end
a[76]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],117440512),24)
e={}
e["pin_no"]="77"
e["texts"]={"UART0_RXD","TC2","EBI_AD15","PWM0_CH2","PA.14"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0_CH2",0,2)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","EBI_AD15")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC2",1,0)
elseif o==6 then
fill_Nano100_UART(e,t,"A","H","UART0_RXD",0)
else
fill_Nano100_GPIO(e,t,"A",14)
end
a[77]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],7340032),20)
e={}
e["pin_no"]="78"
e["texts"]={"CTK11","I2C0_SCL","TC1","EBI_AD14","PWM0_CH1","PA.13"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0_CH1",0,1)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","EBI_AD14")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC1",0,1)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C0_SCL",0)
elseif o==6 then
fill_Nano100_TK(e,t,"A","H","CTK11",11)
else
fill_Nano100_GPIO(e,t,"A",13)
end
a[78]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],458752),16)
e={}
e["pin_no"]="79"
e["texts"]={"CTK10","I2C0_SDA","TC0","EBI_AD13","PWM0_CH0","PA.12"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0_CH0",0,0)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","EBI_AD13")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC0",0,0)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C0_SDA",0)
elseif o==6 then
fill_Nano100_TK(e,t,"A","H","CTK10",10)
else
fill_Nano100_GPIO(e,t,"A",12)
end
a[79]=e
local o=ext.band(t["GCR_PF_L_MFP"],7)
e={}
e["pin_no"]="80"
e["texts"]={"INT0","ICE_DAT","PF.0"}
if o==7 then
fill_Nano100_Normal(e,t,"F","L","ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_Nano100_Normal(e,t,"F","L","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_Nano100_GPIO(e,t,"F",0)
end
a[80]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],112),4)
e={}
e["pin_no"]="81"
e["texts"]={"INT1","CLKO","ICE_CLK","PF.1"}
if o==7 then
fill_Nano100_Normal(e,t,"F","L","ICE_CLK")
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano100_CLKO(e,t,"F","L","CLKO")
elseif o==5 then
fill_Nano100_Normal(e,t,"F","L","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_Nano100_GPIO(e,t,"F",1)
end
a[81]=e
e={}
e["pin_no"]="82"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[82]=e
e={}
e["pin_no"]="83"
e["texts"]={"VDD"}
fill_Nano100_Normal(e,t,nil,nil,"VDD")
a[83]=e
e={}
e["pin_no"]="84"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[84]=e
e={}
e["pin_no"]="85"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[85]=e
e={}
e["pin_no"]="86"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[86]=e
e={}
e["pin_no"]="87"
e["texts"]={"AVSS"}
fill_Nano100_Normal(e,t,nil,nil,"AVSS")
a[87]=e
e={}
e["pin_no"]="88"
e["texts"]={"AVSS"}
fill_Nano100_Normal(e,t,nil,nil,"AVSS")
a[88]=e
local o=ext.band(t["GCR_PA_L_MFP"],7)
e={}
e["pin_no"]="89"
e["texts"]={"CTK8","SC2_CD","AD0","PA.0"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD0")
elseif o==4 then
fill_Nano100_SC(e,t,"A","L","SC2_CD",2)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_Nano100_TK(e,t,"A","L","CTK8",8)
else
fill_Nano100_GPIO(e,t,"A",0)
end
a[89]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],112),4)
e={}
e["pin_no"]="90"
e["texts"]={"CTK9","EBI_AD12","AD1","PA.1"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD1")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","EBI_AD12")
e["direction"]=kPinDirection_Bi
elseif o==6 then
fill_Nano100_TK(e,t,"A","L","CTK9",9)
else
fill_Nano100_GPIO(e,t,"A",1)
end
a[90]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],1792),8)
e={}
e["pin_no"]="91"
e["texts"]={"UART1_RXD","EBI_AD11","AD2","PA.2"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD2")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","EBI_AD11")
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_Nano100_UART(e,t,"A","L","UART1_RXD",1)
else
fill_Nano100_GPIO(e,t,"A",2)
end
a[91]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],28672),12)
e={}
e["pin_no"]="92"
e["texts"]={"UART1_TXD","EBI_AD10","AD3","PA.3"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD3")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","EBI_AD10")
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_Nano100_UART(e,t,"A","L","UART1_TXD",1)
else
fill_Nano100_GPIO(e,t,"A",3)
end
a[92]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],458752),16)
e={}
e["pin_no"]="93"
e["texts"]={"I2C0_SDA","SC2_PWR","EBI_AD9","AD4","PA.4"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD4")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","EBI_AD9")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_Nano100_SC(e,t,"A","L","SC2_PWR",2)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","L","I2C0_SDA",0)
else
fill_Nano100_GPIO(e,t,"A",4)
end
a[93]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],7340032),20)
e={}
e["pin_no"]="94"
e["texts"]={"I2C0_SCL","SC2_RST","EBI_AD8","AD5","PA.5"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD5")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","EBI_AD8")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_Nano100_SC(e,t,"A","L","SC2_RST",2)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","L","I2C0_SCL",0)
else
fill_Nano100_GPIO(e,t,"A",5)
end
a[94]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],117440512),24)
local i=ext.band(t["SC2_SCx_UACTL"],1)
e={}
e["pin_no"]="95"
e["texts"]={"PWM0_CH3","SC2_CLK","TC3","EBI_AD7","AD6","PA.6"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD6")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","EBI_AD7")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","L","TC3",1,1)
elseif o==4 then
if i==0 then
fill_Nano100_SC(e,t,"A","L","SC2_CLK",2)
else
fill_Nano100_SC(e,t,"A","L","SC2_UART_TXD",2)
e["texts"]={"PWM0_CH3","SC2_UART_TXD","TC3","EBI_AD7","AD6","PA.6"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==5 then
fill_Nano100_PWM(e,t,"A","L","PWM0_CH3",0,3)
else
fill_Nano100_GPIO(e,t,"A",6)
end
a[95]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],1879048192),28)
local i=ext.band(t["SC2_SCx_UACTL"],1)
e={}
e["pin_no"]="96"
e["texts"]={"CTK_CAP","PWM0_CH2","SC2_DAT","TC2","EBI_AD6","AD7","PA.7"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","AD7")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","EBI_AD6")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","L","TC2",1,0)
elseif o==4 then
if i==0 then
fill_Nano100_SC(e,t,"A","L","SC2_DAT",2)
else
fill_Nano100_SC(e,t,"A","L","SC2_UART_RXD",2)
e["texts"]={"CTK_CAP","PWM0_CH2","SC2_UART_RXD","TC2","EBI_AD6","AD7","PA.7"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==5 then
fill_Nano100_PWM(e,t,"A","L","PWM0_CH2",0,2)
elseif o==6 then
fill_Nano100_TK(e,t,"A","L","CTK_CAP",nil)
else
fill_Nano100_GPIO(e,t,"A",7)
end
a[96]=e
e={}
e["pin_no"]="97"
e["texts"]={"VREF"}
fill_Nano100_Normal(e,t,nil,nil,"VREF")
a[97]=e
e={}
e["pin_no"]="98"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[98]=e
e={}
e["pin_no"]="99"
e["texts"]={"AVDD"}
fill_Nano100_Normal(e,t,nil,nil,"AVDD")
a[99]=e
local o=ext.band(t["GCR_PD_L_MFP"],7)
local i=ext.band(t["SC1_SCx_UACTL"],1)
e={}
e["pin_no"]="100"
e["texts"]={"AD8","CTK0","SC1_CLK","SPI2_SS0","UART1_RXD","PD.0"}
if o==1 then
fill_Nano100_UART(e,t,"D","L","UART1_RXD",1)
elseif o==3 then
fill_Nano100_SPI(e,t,"D","L","SPI2_SS0",2)
elseif o==4 then
if i==0 then
fill_Nano100_SC(e,t,"D","L","SC1_CLK",1)
else
fill_Nano100_SC(e,t,"D","L","SC1_UART_TXD",1)
e["texts"]={"AD8","CTK0","SC1_UART_TXD","SPI2_SS0","UART1_RXD","PD.0"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==6 then
fill_Nano100_TK(e,t,"D","L","CTK0",0)
elseif o==5 then
fill_Nano100_ADC(e,t,"D","L","AD8")
else
fill_Nano100_GPIO(e,t,"D",0)
end
a[100]=e
local o=ext.rshift(ext.band(t["GCR_PD_L_MFP"],112),4)
local i=ext.band(t["SC1_SCx_UACTL"],1)
e={}
e["pin_no"]="101"
e["texts"]={"CTK1","AD9","SC1_DAT","SPI2_CLK","UART1_TXD","PD.1"}
if o==1 then
fill_Nano100_UART(e,t,"D","L","UART1_TXD",1)
elseif o==3 then
fill_Nano100_SPI(e,t,"D","L","SPI2_CLK",2)
elseif o==4 then
if i==0 then
fill_Nano100_SC(e,t,"D","L","SC1_DAT",1)
else
fill_Nano100_SC(e,t,"D","L","SC1_UART_RXD",1)
e["texts"]={"CTK1","AD9","SC1_UART_RXD","SPI2_CLK","UART1_TXD","PD.1"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==5 then
fill_Nano100_ADC(e,t,"D","L","AD9")
elseif o==6 then
fill_Nano100_TK(e,t,"D","L","CTK1",1)
else
fill_Nano100_GPIO(e,t,"D",1)
end
a[101]=e
local o=ext.rshift(ext.band(t["GCR_PD_L_MFP"],1792),8)
e={}
e["pin_no"]="102"
e["texts"]={"CTK2","AD10","SC1_PWR","SPI2_MISO0","I2S_LRCLK","UART1_RTSn","PD.2"}
if o==1 then
fill_Nano100_UART(e,t,"D","L","UART1_RTSn",1)
elseif o==2 then
fill_Nano100_I2S(e,t,"D","L","I2S_LRCLK")
elseif o==3 then
fill_Nano100_SPI(e,t,"D","L","SPI2_MISO0",2)
fill_Nano100_SPI_IO(e,t,2,true)
elseif o==4 then
fill_Nano100_SC(e,t,"D","L","SC1_PWR",1)
elseif o==5 then
fill_Nano100_ADC(e,t,"D","L","AD10")
elseif o==6 then
fill_Nano100_TK(e,t,"D","L","CTK2",2)
else
fill_Nano100_GPIO(e,t,"D",2)
end
a[102]=e
local o=ext.rshift(ext.band(t["GCR_PD_L_MFP"],28672),12)
e={}
e["pin_no"]="103"
e["texts"]={"CTK3","AD11","SC1_RST","SPI2_MOSI0","I2S_BCLK","UART1_CTSn","PD.3"}
if o==1 then
fill_Nano100_UART(e,t,"D","L","UART1_CTSn",1)
elseif o==2 then
fill_Nano100_I2S(e,t,"D","L","I2S_BCLK")
elseif o==3 then
fill_Nano100_SPI(e,t,"D","L","SPI2_MOSI0",2)
fill_Nano100_SPI_IO(e,t,2,false)
elseif o==4 then
fill_Nano100_SC(e,t,"D","L","SC1_RST",1)
elseif o==5 then
fill_Nano100_ADC(e,t,"D","L","AD11")
elseif o==6 then
fill_Nano100_TK(e,t,"D","L","CTK3",3)
else
fill_Nano100_GPIO(e,t,"D",3)
end
a[103]=e
e={}
e["pin_no"]="104"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[104]=e
local o=ext.rshift(ext.band(t["GCR_PD_L_MFP"],458752),16)
e={}
e["pin_no"]="105"
e["texts"]={"CTK4","SC1_CD","SPI2_MISO1","I2S_DI","PD.4"}
if o==2 then
fill_Nano100_I2S(e,t,"D","L","I2S_DI")
elseif o==3 then
fill_Nano100_SPI(e,t,"D","L","SPI2_MISO1",2)
fill_Nano100_SPI_IO(e,t,2,true)
elseif o==4 then
fill_Nano100_SC(e,t,"D","L","SC1_CD",1)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_Nano100_TK(e,t,"D","L","CTK4",4)
else
fill_Nano100_GPIO(e,t,"D",4)
end
a[105]=e
local o=ext.rshift(ext.band(t["GCR_PD_L_MFP"],7340032),20)
e={}
e["pin_no"]="106"
e["texts"]={"CTK5","SPI2_MOSI1","I2S_DO","PD.5"}
if o==2 then
fill_Nano100_I2S(e,t,"D","L","I2S_DO")
elseif o==3 then
fill_Nano100_SPI(e,t,"D","L","SPI2_MOSI1",2)
fill_Nano100_SPI_IO(e,t,2,false)
elseif o==6 then
fill_Nano100_TK(e,t,"D","L","CTK5",5)
else
fill_Nano100_GPIO(e,t,"D",5)
end
a[106]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],1879048192),28)
e={}
e["pin_no"]="107"
e["texts"]={"PWM0_CH1","TC1","EBI_AD5","DA1_OUT","PC.7"}
if o==1 then
fill_Nano100_DAC(e,t,"C","L","DA1_OUT")
elseif o==2 then
fill_Nano100_EBI(e,t,"C","L","EBI_AD5")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"C","L","TC1",0,1)
elseif o==5 then
fill_Nano100_PWM(e,t,"C","L","PWM0_CH1",0,1)
else
fill_Nano100_GPIO(e,t,"C",7)
end
a[107]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],117440512),24)
e={}
e["pin_no"]="108"
e["texts"]={"PWM0_CH0","SC1_CD","TC0","EBI_AD4","DA0_OUT","PC.6"}
if o==1 then
fill_Nano100_DAC(e,t,"C","L","DA0_OUT")
elseif o==2 then
fill_Nano100_EBI(e,t,"C","L","EBI_AD4")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"C","L","TC0",0,0)
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1_CD",1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano100_PWM(e,t,"C","L","PWM0_CH0",0,0)
else
fill_Nano100_GPIO(e,t,"C",6)
end
a[108]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],1879048192),28)
e={}
e["pin_no"]="109"
e["texts"]={"PWM1_CH2","TC0","EBI_AD3","PC.15"}
if o==2 then
fill_Nano100_EBI(e,t,"C","H","EBI_AD3")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"C","H","TC0",0,0)
elseif o==4 then
fill_Nano100_PWM(e,t,"C","H","PWM1_CH2",1,2)
else
fill_Nano100_GPIO(e,t,"C",15)
end
a[109]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],117440512),24)
e={}
e["pin_no"]="110"
e["texts"]={"PWM1_CH3","EBI_AD2","PC.14"}
if o==2 then
fill_Nano100_EBI(e,t,"C","H","EBI_AD2")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_Nano100_PWM(e,t,"C","H","PWM1_CH3",1,3)
else
fill_Nano100_GPIO(e,t,"C",14)
end
a[110]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],1879048192),28)
e={}
e["pin_no"]="111"
e["texts"]={"SC1_CD","SNOOPER","INT1","PB.15"}
if o==1 then
fill_Nano100_Normal(e,t,"B","H","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano100_Normal(e,t,"B","H","SNOOPER")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano100_SC(e,t,"B","H","SC1_CD",1)
e["direction"]=kPinDirection_In
else
fill_Nano100_GPIO(e,t,"B",15)
end
a[111]=e
e={}
e["pin_no"]="112"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[112]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],28672),12)
e={}
e["pin_no"]="113"
e["texts"]={"XT1_IN","PF.3"}
if o==7 then
fill_Nano100_Normal(e,t,"F","L","XT1_IN")
e["direction"]=kPinDirection_In
else
fill_Nano100_GPIO(e,t,"F",3)
end
a[113]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],1792),8)
e={}
e["pin_no"]="114"
e["texts"]={"XT1_OUT","PF.2"}
if o==7 then
fill_Nano100_Normal(e,t,"F","L","XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_Nano100_GPIO(e,t,"F",2)
end
a[114]=e
e={}
e["pin_no"]="115"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[115]=e
e={}
e["pin_no"]="116"
e["texts"]={"nRESET"}
fill_Nano100_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[116]=e
e={}
e["pin_no"]="117"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[117]=e
e={}
e["pin_no"]="118"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[118]=e
e={}
e["pin_no"]="119"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[119]=e
e={}
e["pin_no"]="120"
e["texts"]={"VDD"}
fill_Nano100_Normal(e,t,nil,nil,"VDD")
a[120]=e
e={}
e["pin_no"]="121"
e["texts"]={"NC"}
fill_invalid_pin(e,"NC")
a[121]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],458752),16)
e={}
e["pin_no"]="122"
e["texts"]={"CTK6","I2C0_SDA","PF.4"}
if o==1 then
fill_Nano100_I2C(e,t,"F","L","I2C0_SDA",0)
elseif o==6 then
fill_Nano100_TK(e,t,"F","L","CTK6",6)
else
fill_Nano100_GPIO(e,t,"F",4)
end
a[122]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],7340032),20)
e={}
e["pin_no"]="123"
e["texts"]={"CTK7","I2C0_SCL","PF.5"}
if o==1 then
fill_Nano100_I2C(e,t,"F","L","I2C0_SCL",0)
elseif o==6 then
fill_Nano100_TK(e,t,"F","L","CTK7",7)
else
fill_Nano100_GPIO(e,t,"F",5)
end
a[123]=e
e={}
e["pin_no"]="124"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[124]=e
e={}
e["pin_no"]="125"
e["texts"]={"PVSS"}
fill_Nano100_Normal(e,t,nil,nil,"PVSS")
a[125]=e
local o=ext.band(t["GCR_PB_H_MFP"],7)
e={}
e["pin_no"]="126"
e["texts"]={"SC2_PWR","INT0","TM0","STADC","PB.8"}
if o==1 then
fill_Nano100_ADC(e,t,"B","H","STADC")
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TM0",0,0)
elseif o==3 then
fill_Nano100_Normal(e,t,"B","H","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano100_SC(e,t,"B","H","SC2_PWR",2)
else
fill_Nano100_GPIO(e,t,"B",8)
end
a[126]=e
e={}
e["pin_no"]="127"
e["texts"]={"PE.15"}
fill_Nano100_GPIO(e,t,"E",15)
a[127]=e
e={}
e["pin_no"]="128"
e["texts"]={"PE.14"}
fill_Nano100_GPIO(e,t,"E",14)
a[128]=e
return{name=n,information="",pins=a}
end
