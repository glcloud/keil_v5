local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Nano100.lua")
function get_chip_status_Nano100_BN_LQFP48(n,e,e)
local a={}
local t=read_Nano100_Registers()
local e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],458752),16)
e={}
e["pin_no"]="1"
e["texts"]={"PB.12","EBI_AD0","FCLKO"}
if o==2 then
fill_Nano100_EBI(e,t,"B","H","EBI_AD0")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_Nano100_CLKO(e,t,"B","H","FCLKO")
else
fill_Nano100_GPIO(e,t,"B",12)
end
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"X32O"}
fill_Nano100_Normal(e,t,nil,nil,"X32O")
e["direction"]=kPinDirection_PushPullOut
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"X32I"}
fill_Nano100_Normal(e,t,nil,nil,"X32I")
e["direction"]=kPinDirection_In
a[3]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],28672),12)
e={}
e["pin_no"]="4"
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
a[4]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],1792),8)
e={}
e["pin_no"]="5"
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
a[5]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],112),4)
local i=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="6"
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
a[6]=e
local o=ext.band(t["GCR_PA_H_MFP"],7)
local i=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="7"
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
a[7]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],458752),16)
e={}
e["pin_no"]="8"
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
a[8]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],7340032),20)
e={}
e["pin_no"]="9"
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
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"LDO_CAP"}
fill_Nano100_Normal(e,t,nil,nil,"LDO_CAP")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VDD"}
fill_Nano100_Normal(e,t,nil,nil,"VDD")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[12]=e
local o=ext.band(t["GCR_PB_L_MFP"],7)
e={}
e["pin_no"]="13"
e["texts"]={"PB.0","UART0_RXD","SPI1_MOSI0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART0_RXD",0)
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPI1_MOSI0",1)
fill_Nano100_SPI_IO(e,t,1,false)
else
fill_Nano100_GPIO(e,t,"B",0)
end
a[13]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],112),4)
e={}
e["pin_no"]="14"
e["texts"]={"PB.1","UART0_TXD","SPI1_MISO0"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","UART0_TXD",0)
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPI1_MISO0",1)
fill_Nano100_SPI_IO(e,t,1,true)
else
fill_Nano100_GPIO(e,t,"B",1)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],1792),8)
e={}
e["pin_no"]="15"
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
a[15]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],28672),12)
e={}
e["pin_no"]="16"
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
a[16]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],28672),12)
e={}
e["pin_no"]="17"
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
a[17]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],1792),8)
e={}
e["pin_no"]="18"
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
a[18]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],112),4)
local i=ext.band(t["SC1_SCx_UACTL"],1)
e={}
e["pin_no"]="19"
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
a[19]=e
local o=ext.band(t["GCR_PC_L_MFP"],7)
local s=ext.band(t["SC1_SCx_UACTL"],1)
local i=ext.band(t["CLK_MCLKO"],128)
e={}
e["pin_no"]="20"
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
a[20]=e
local o=ext.rshift(ext.band(t["GCR_PE_L_MFP"],7340032),20)
e={}
e["pin_no"]="21"
e["texts"]={"PE.5","PWM1_CH1"}
if o==1 then
fill_Nano100_PWM(e,t,"E","L","PWM1_CH1",1,1)
else
fill_Nano100_GPIO(e,t,"E",5)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],28672),12)
local i=ext.band(t["SC2_SCx_UACTL"],1)
e={}
e["pin_no"]="22"
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
a[22]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],1792),8)
local i=ext.band(t["SC2_SCx_UACTL"],1)
e={}
e["pin_no"]="23"
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
a[23]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],112),4)
e={}
e["pin_no"]="24"
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
a[24]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],1879048192),28)
e={}
e["pin_no"]="25"
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
a[25]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],117440512),24)
e={}
e["pin_no"]="26"
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
a[26]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],7340032),20)
e={}
e["pin_no"]="27"
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
a[27]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],458752),16)
e={}
e["pin_no"]="28"
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
a[28]=e
local o=ext.band(t["GCR_PF_L_MFP"],7)
e={}
e["pin_no"]="29"
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
a[29]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],112),4)
e={}
e["pin_no"]="30"
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
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"AVSS"}
fill_Nano100_Normal(e,t,nil,nil,"AVSS")
a[31]=e
local o=ext.band(t["GCR_PA_L_MFP"],7)
e={}
e["pin_no"]="32"
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
a[32]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],112),4)
e={}
e["pin_no"]="33"
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
a[33]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],1792),8)
e={}
e["pin_no"]="34"
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
a[34]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],28672),12)
e={}
e["pin_no"]="35"
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
a[35]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],458752),16)
e={}
e["pin_no"]="36"
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
a[36]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],7340032),20)
e={}
e["pin_no"]="37"
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
a[37]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],117440512),24)
local i=ext.band(t["SC2_SCx_UACTL"],1)
e={}
e["pin_no"]="38"
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
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"VREF"}
fill_Nano100_Normal(e,t,nil,nil,"VREF")
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"AVDD"}
fill_Nano100_Normal(e,t,nil,nil,"AVDD")
a[40]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],1879048192),28)
e={}
e["pin_no"]="41"
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
a[41]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],117440512),24)
e={}
e["pin_no"]="42"
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
a[42]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],1879048192),28)
e={}
e["pin_no"]="43"
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
a[43]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],28672),12)
e={}
e["pin_no"]="44"
e["texts"]={"XT1_IN","PF.3"}
if o==7 then
fill_Nano100_Normal(e,t,"F","L","XT1_IN")
e["direction"]=kPinDirection_In
else
fill_Nano100_GPIO(e,t,"F",3)
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],1792),8)
e={}
e["pin_no"]="45"
e["texts"]={"XT1_OUT","PF.2"}
if o==7 then
fill_Nano100_Normal(e,t,"F","L","XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_Nano100_GPIO(e,t,"F",2)
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"nRESET"}
fill_Nano100_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"PVSS"}
fill_Nano100_Normal(e,t,nil,nil,"PVSS")
a[47]=e
local o=ext.band(t["GCR_PB_H_MFP"],7)
e={}
e["pin_no"]="48"
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
a[48]=e
return{name=n,information="",pins=a}
end