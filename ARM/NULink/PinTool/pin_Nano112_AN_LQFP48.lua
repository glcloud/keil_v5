local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Nano100.lua")
function get_chip_status_Nano112_AN_LQFP48(i,t,e,o)
local a={}
local t=read_Nano100_Registers(i,t,e,o)
local e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],983040),16)
e={}
e["pin_no"]="1"
e["texts"]={"PB.12","LCD_SEG15","UART0_RTSn","SPI0_MOSI0","TM0","FCLK0"}
if o==8 then
fill_Nano100_LCD(e,t,"B","H","LCD_SEG15")
elseif o==7 then
fill_Nano100_UART(e,t,"B","H","UART0_RTSn",0)
elseif o==6 then
fill_Nano100_SPI(e,t,"B","H","SPI0_MOSI0",0)
fill_Nano100_SPI_IO(e,t,0,false)
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TM0",0,0)
elseif o==1 then
fill_Nano100_CLKO(e,t,"B","H","FCLK0",0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"B",12)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],15728640),20)
e={}
e["pin_no"]="2"
e["texts"]={"PB.13","LCD_SEG14","UART0_RXD","SPI0_MISO0"}
if o==8 then
fill_Nano100_LCD(e,t,"B","H","LCD_SEG14")
elseif o==7 then
fill_Nano100_UART(e,t,"B","H","UART0_RXD",0)
elseif o==6 then
fill_Nano100_SPI(e,t,"B","H","SPI0_MISO0",0)
fill_Nano100_SPI_IO(e,t,0,true)
elseif o==0 then
fill_Nano100_GPIO(e,t,"B",13)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],251658240),24)
e={}
e["pin_no"]="3"
e["texts"]={"PB.14","LCD_SEG13","UART0_TXD","SPI0_CLK"}
if o==8 then
fill_Nano100_LCD(e,t,"B","H","LCD_SEG13")
elseif o==7 then
fill_Nano100_UART(e,t,"B","H","UART0_TXD",0)
elseif o==6 then
fill_Nano100_SPI(e,t,"B","H","SPI0_CLK",0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"B",14)
else
fill_invalid_GPIO(e,t,"B",14)
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],4026531840),28)
e={}
e["pin_no"]="4"
e["texts"]={"PB.15","LCD_SEG12","UART0_CTSn","SPI0_SS0"}
if o==8 then
fill_Nano100_LCD(e,t,"B","H","LCD_SEG12")
elseif o==7 then
fill_Nano100_UART(e,t,"B","H","UART0_CTSn",0)
elseif o==6 then
fill_Nano100_SPI(e,t,"B","H","SPI0_SS0",0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"B",15)
else
fill_invalid_GPIO(e,t,"B",15)
end
a[4]=e
local o=ext.band(t["GCR_PC_L_MFP"],15)
e={}
e["pin_no"]="5"
e["texts"]={"PC.0","LCD_SEG11","SPI0_SS1","I2C0_SCL","PWM0_CH0"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG11")
elseif o==6 then
fill_Nano100_SPI(e,t,"C","L","SPI0_SS1",0)
elseif o==5 then
fill_Nano100_I2C(e,t,"C","L","I2C0_SCL",0)
elseif o==3 then
fill_Nano100_PWM(e,t,"C","L","PWM0_CH0",0,0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",0)
else
fill_invalid_GPIO(e,t,"C",0)
end
a[5]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],240),4)
e={}
e["pin_no"]="6"
e["texts"]={"PC.1","LCD_SEG10","I2C0_SDA","PWM0_CH1"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG10")
elseif o==5 then
fill_Nano100_I2C(e,t,"C","L","I2C0_SDA",0)
elseif o==3 then
fill_Nano100_PWM(e,t,"C","L","PWM0_CH1",0,1)
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",1)
else
fill_invalid_GPIO(e,t,"C",1)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],3840),8)
e={}
e["pin_no"]="7"
e["texts"]={"PC.2","LCD_SEG9","I2C1_SCL","PWM0_CH2"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG9")
elseif o==5 then
fill_Nano100_I2C(e,t,"C","L","I2C1_SCL",1)
elseif o==3 then
fill_Nano100_PWM(e,t,"C","L","PWM0_CH2",0,2)
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",2)
else
fill_invalid_GPIO(e,t,"C",2)
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],61440),12)
e={}
e["pin_no"]="8"
e["texts"]={"PC.3","LCD_SEG8","I2C1_SDA","PWM0_CH3"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG8")
elseif o==5 then
fill_Nano100_I2C(e,t,"C","L","I2C1_SDA",1)
elseif o==3 then
fill_Nano100_PWM(e,t,"C","L","PWM0_CH3",0,3)
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",3)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],983040),16)
local n=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="9"
e["texts"]={"PC.4","LCD_SEG7","UART1_CTSn","SC0_CLK","INT0"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG7")
elseif o==7 then
fill_Nano100_UART(e,t,"C","L","UART1_CTSn",1)
elseif o==4 then
if n==0 then
fill_Nano100_SC(e,t,"C","L","SC0_CLK",0)
else
fill_Nano100_SC(e,t,"C","L","SC0_UART_TXD",0)
e["texts"]={"PC.4","LCD_SEG7","UART1_CTSn","SC0_UART_TXD","INT0"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==1 then
fill_Nano100_Normal(e,t,"C","L","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",4)
else
fill_invalid_GPIO(e,t,"C",4)
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],15728640),20)
e={}
e["pin_no"]="10"
e["texts"]={"PC.5","LCD_SEG6","SC0_CD"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG6")
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",5)
else
fill_invalid_GPIO(e,t,"C",5)
end
a[10]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],251658240),24)
local n=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="11"
e["texts"]={"PC.6","LCD_SEG5","UART1_RTSn","SC0_DAT"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG5")
elseif o==7 then
fill_Nano100_UART(e,t,"C","L","UART1_RTSn",1)
elseif o==4 then
if n==0 then
fill_Nano100_SC(e,t,"C","L","SC0_DAT",0)
else
fill_Nano100_SC(e,t,"C","L","SC0_UART_RXD",0)
e["texts"]={"PC.6","LCD_SEG5","UART1_RTSn","SC0_UART_RXD"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",6)
else
fill_invalid_GPIO(e,t,"C",6)
end
a[11]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],4026531840),28)
e={}
e["pin_no"]="12"
e["texts"]={"PC.7","LCD_SEG4","UART1_RXD","SC0_PWR"}
if o==8 then
fill_Nano100_LCD(e,t,"C","L","LCD_SEG4")
elseif o==7 then
fill_Nano100_UART(e,t,"C","L","UART1_RXD",1)
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC0_PWR",0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",7)
else
fill_invalid_GPIO(e,t,"C",7)
end
a[12]=e
local o=ext.band(t["GCR_PC_H_MFP"],15)
e={}
e["pin_no"]="13"
e["texts"]={"PC.8","LCD_SEG3","UART1_TXD","SC0_RST"}
if o==8 then
fill_Nano100_LCD(e,t,"C","H","LCD_SEG3")
elseif o==7 then
fill_Nano100_UART(e,t,"C","H","UART1_TXD",1)
elseif o==4 then
fill_Nano100_SC(e,t,"C","H","SC0_RST",0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",8)
else
fill_invalid_GPIO(e,t,"C",8)
end
a[13]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],240),4)
e={}
e["pin_no"]="14"
e["texts"]={"PC.9","LCD_SEG2"}
if o==8 then
fill_Nano100_LCD(e,t,"C","H","LCD_SEG2")
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",9)
else
fill_invalid_GPIO(e,t,"C",9)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],251658240),24)
e={}
e["pin_no"]="15"
e["texts"]={"PC.14","LCD_SEG1","SC1_CD"}
if o==8 then
fill_Nano100_LCD(e,t,"C","H","LCD_SEG1")
elseif o==4 then
fill_Nano100_SC(e,t,"C","H","SC1_CD",1)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",14)
else
fill_invalid_GPIO(e,t,"C",14)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],4026531840),28)
e={}
e["pin_no"]="16"
e["texts"]={"PC.15","LCD_SEG0","SC1_PWR"}
if o==8 then
fill_Nano100_LCD(e,t,"C","H","LCD_SEG0")
elseif o==4 then
fill_Nano100_SC(e,t,"C","H","SC1_PWR",1)
elseif o==0 then
fill_Nano100_GPIO(e,t,"C",15)
else
fill_invalid_GPIO(e,t,"C",15)
end
a[16]=e
local o=ext.rshift(ext.band(t["GCR_PD_L_MFP"],4026531840),28)
local n=ext.band(t["SC1_SCx_UACTL"],1)
e={}
e["pin_no"]="17"
e["texts"]={"PD.7","LCD_COM3","SC1_CLK"}
if o==8 then
fill_Nano100_LCD(e,t,"D","L","LCD_COM3")
elseif o==4 then
if n==0 then
fill_Nano100_SC(e,t,"D","L","SC1_CLK",1)
else
fill_Nano100_SC(e,t,"D","L","SC1_UART_TXD",1)
e["texts"]={"PD.7","LCD_COM3","SC1_UART_TXD"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==0 then
fill_Nano100_GPIO(e,t,"D",7)
else
fill_invalid_GPIO(e,t,"D",7)
end
a[17]=e
local o=ext.band(t["GCR_PD_H_MFP"],15)
local n=ext.band(t["SC1_SCx_UACTL"],1)
e={}
e["pin_no"]="18"
e["texts"]={"PD.8","LCD_COM2","SC1_DAT"}
if o==8 then
fill_Nano100_LCD(e,t,"D","H","LCD_COM2")
elseif o==4 then
if n==0 then
fill_Nano100_SC(e,t,"D","H","SC1_DAT",1)
else
fill_Nano100_SC(e,t,"D","H","SC1_UART_RXD",1)
e["texts"]={"PD.8","LCD_COM2","SC1_UART_RXD"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==0 then
fill_Nano100_GPIO(e,t,"D",8)
else
fill_invalid_GPIO(e,t,"D",8)
end
a[18]=e
local o=ext.rshift(ext.band(t["GCR_PD_H_MFP"],240),4)
e={}
e["pin_no"]="19"
e["texts"]={"PD.9","LCD_COM1","SC1_RST","PWM0_CH3"}
if o==8 then
fill_Nano100_LCD(e,t,"D","H","LCD_COM1")
elseif o==4 then
fill_Nano100_SC(e,t,"D","H","SC1_RST",1)
elseif o==3 then
fill_Nano100_PWM(e,t,"D","H","PWM0_CH3",0,3)
elseif o==0 then
fill_Nano100_GPIO(e,t,"D",9)
else
fill_invalid_GPIO(e,t,"D",9)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_PD_H_MFP"],3840),8)
e={}
e["pin_no"]="20"
e["texts"]={"PD.10","LCD_COM0","PWM0_CH2","TC1"}
if o==8 then
fill_Nano100_LCD(e,t,"D","H","LCD_COM0")
elseif o==3 then
fill_Nano100_PWM(e,t,"D","H","PWM0_CH2",0,2)
elseif o==2 then
fill_Nano100_TM(e,t,"D","H","TC1",0,1)
elseif o==0 then
fill_Nano100_GPIO(e,t,"D",10)
else
fill_invalid_GPIO(e,t,"D",10)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"VLCD"}
fill_Nano100_Normal(e,t,nil,nil,"VLCD")
e["highlight_color"]=kColor_LCD
e["pin_bg_color"]=kBgColor_LCD
e["direction"]=kPinDirection_PushPullOut
a[21]=e
local o=ext.rshift(ext.band(t["GCR_PD_H_MFP"],15728640),20)
e={}
e["pin_no"]="22"
e["texts"]={"PD.13","LCD_V1","INT1"}
if o==8 then
fill_Nano100_LCD(e,t,"D","H","LCD_V1")
elseif o==1 then
fill_Nano100_Normal(e,t,"D","H","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"D",13)
else
fill_invalid_GPIO(e,t,"D",13)
end
a[22]=e
local o=ext.rshift(ext.band(t["GCR_PD_H_MFP"],251658240),24)
e={}
e["pin_no"]="23"
e["texts"]={"PD.14","LCD_V2"}
if o==8 then
fill_Nano100_LCD(e,t,"D","H","LCD_V2")
elseif o==0 then
fill_Nano100_GPIO(e,t,"D",14)
else
fill_invalid_GPIO(e,t,"D",14)
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_PD_H_MFP"],4026531840),28)
e={}
e["pin_no"]="24"
e["texts"]={"PD.15","LCD_V3"}
if o==8 then
fill_Nano100_LCD(e,t,"D","H","LCD_V3")
elseif o==0 then
fill_Nano100_GPIO(e,t,"D",15)
else
fill_invalid_GPIO(e,t,"D",15)
end
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"nRESET"}
fill_Nano100_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"LDO_CAP"}
fill_Nano100_Normal(e,t,nil,nil,"LDO_CAP")
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"VDD"}
fill_Nano100_Normal(e,t,nil,nil,"VDD")
a[27]=e
local o=ext.band(t["GCR_PF_L_MFP"],15)
e={}
e["pin_no"]="28"
e["texts"]={"TM3","X32I","PF.0"}
if o==15 then
fill_Nano100_Normal(e,t,"F","L","X32I")
e["direction"]=kPinDirection_In
elseif o==2 then
fill_Nano100_TM(e,t,"F","L","TM3",1,1)
elseif o==0 then
fill_Nano100_GPIO(e,t,"F",0)
else
fill_invalid_GPIO(e,t,"F",0)
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],240),4)
e={}
e["pin_no"]="29"
e["texts"]={"TM2","X32O","PF.1"}
if o==15 then
fill_Nano100_Normal(e,t,"F","L","X32O")
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_Nano100_TM(e,t,"F","L","TM2",1,0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"F",1)
else
fill_invalid_GPIO(e,t,"F",1)
end
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"VSS"}
fill_Nano100_Normal(e,t,nil,nil,"VSS")
a[30]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],3840),8)
e={}
e["pin_no"]="31"
e["texts"]={"INT1","TC3","UART1_RXD","XT1_IN","PF.2"}
if o==15 then
fill_Nano100_Normal(e,t,"F","L","XT1_IN")
e["direction"]=kPinDirection_In
elseif o==7 then
fill_Nano100_UART(e,t,"F","L","UART1_RXD",1)
elseif o==2 then
fill_Nano100_TM(e,t,"F","L","TC3",1,1)
elseif o==1 then
fill_Nano100_Normal(e,t,"F","L","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"F",2)
else
fill_invalid_GPIO(e,t,"F",2)
end
a[31]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],61440),12)
e={}
e["pin_no"]="32"
e["texts"]={"INT0","TC2","UART1_TXD","XT1_OUT","PF.3"}
if o==15 then
fill_Nano100_Normal(e,t,"F","L","XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_Nano100_UART(e,t,"F","L","UART1_TXD",1)
elseif o==2 then
fill_Nano100_TM(e,t,"F","L","TC2",1,0)
elseif o==1 then
fill_Nano100_Normal(e,t,"F","L","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"F",3)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"AVSS"}
fill_Nano100_Normal(e,t,nil,nil,"AVSS")
a[33]=e
local o=ext.band(t["GCR_PA_L_MFP"],15)
e={}
e["pin_no"]="34"
e["texts"]={"AD0","PA.0"}
if o==2 then
fill_Nano100_ADC(e,t,"A","L","AD0")
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",0)
else
fill_invalid_GPIO(e,t,"A",0)
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],240),4)
e={}
e["pin_no"]="35"
e["texts"]={"AD1","ACMP0_P3","ACMP0_CHDIS","PA.1"}
if o==9 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_P3")
elseif o==2 then
fill_Nano100_ADC(e,t,"A","L","AD1")
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",1)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[35]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],3840),8)
local n=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="36"
e["texts"]={"INT0","AD2","ACMP0_P2","SC0_CLK","ACMP0_CHDIS","PA.2"}
if o==9 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
if n==0 then
fill_Nano100_SC(e,t,"A","L","SC0_CLK",0)
else
fill_Nano100_SC(e,t,"A","L","SC0_UART_TXD",0)
e["texts"]={"INT0","AD2","ACMP0_P2","SC0_UART_TXD","ACMP0_CHDIS","PA.2"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_P2")
elseif o==2 then
fill_Nano100_ADC(e,t,"A","L","AD2")
elseif o==1 then
fill_Nano100_Normal(e,t,"A","L","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",2)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],61440),12)
local n=ext.band(t["SC0_SCx_UACTL"],1)
e={}
e["pin_no"]="37"
e["texts"]={"INT1","AD3","ACMP0_P1","SC0_DAT","ACMP0_CHDIS","PA.3"}
if o==9 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
if n==0 then
fill_Nano100_SC(e,t,"A","L","SC0_DAT",0)
else
fill_Nano100_SC(e,t,"A","L","SC0_UART_RXD",0)
e["texts"]={"INT1","AD3","ACMP0_P1","SC0_UART_RXD","ACMP0_CHDIS","PA.3"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_Unknown
end
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_P1")
elseif o==2 then
fill_Nano100_ADC(e,t,"A","L","AD3")
elseif o==1 then
fill_Nano100_Normal(e,t,"A","L","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",3)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],983040),16)
e={}
e["pin_no"]="38"
e["texts"]={"AD4","ACMP0_P0","SC0_CD","ACMP0_CHDIS","PA.4"}
if o==9 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_Nano100_SC(e,t,"A","L","SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_P0")
elseif o==2 then
fill_Nano100_ADC(e,t,"A","L","AD4")
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",4)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[38]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],15728640),20)
e={}
e["pin_no"]="39"
e["texts"]={"AD5","ACMP0_N","SC0_PWR","I2C1_SDA","SPI1_SS0","ACMP0_CHDIS","PA.5"}
if o==9 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_Nano100_SPI(e,t,"A","L","SPI1_SS0",1)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","L","I2C1_SDA",1)
elseif o==4 then
fill_Nano100_SC(e,t,"A","L","SC0_PWR",0)
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_N")
elseif o==2 then
fill_Nano100_ADC(e,t,"A","L","AD5")
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",5)
else
fill_invalid_GPIO(e,t,"A",5)
end
a[39]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],251658240),24)
e={}
e["pin_no"]="40"
e["texts"]={"AD6","ACMP0_OUT","SC0_RST","ACMP0_CHDIS","PA.6"}
if o==9 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_Nano100_SC(e,t,"A","L","SC0_RST",0)
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","L","ACMP0_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_Nano100_ADC(e,t,"A","L","AD6")
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",6)
else
fill_invalid_GPIO(e,t,"A",6)
end
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"VREF"}
fill_Nano100_Normal(e,t,nil,nil,"VREF")
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"AVDD"}
fill_Nano100_Normal(e,t,nil,nil,"AVDD")
a[42]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],983040),16)
e={}
e["pin_no"]="43"
e["texts"]={"FCLK1","TC1","PWM0_CH2","CLK_Hz","ICE_CLK","PF.4"}
if o==15 then
fill_Nano100_Normal(e,t,"F","L","ICE_CLK")
e["direction"]=kPinDirection_In
elseif o==9 then
fill_Nano100_Normal(e,t,"F","L","CLK_Hz")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Nano100_PWM(e,t,"F","L","PWM0_CH2",0,2)
elseif o==2 then
fill_Nano100_TM(e,t,"F","L","TC1",0,1)
elseif o==1 then
fill_Nano100_CLKO(e,t,"F","L","FCLK1",1)
elseif o==0 then
fill_Nano100_GPIO(e,t,"F",4)
else
fill_invalid_GPIO(e,t,"F",4)
end
a[43]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],15728640),20)
e={}
e["pin_no"]="44"
e["texts"]={"TC0","PWM0_CH3","ACMP0_CHDIS","ICE_DAT","PF.5"}
if o==15 then
fill_Nano100_Normal(e,t,"F","L","ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif o==9 then
fill_Nano100_ACMP(e,t,"F","L","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Nano100_PWM(e,t,"F","L","PWM0_CH3",0,3)
elseif o==2 then
fill_Nano100_TM(e,t,"F","L","TC0",0,0)
elseif o==0 then
fill_Nano100_GPIO(e,t,"F",5)
else
fill_invalid_GPIO(e,t,"F",5)
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],983040),16)
e={}
e["pin_no"]="45"
e["texts"]={"ACMP1_P","I2C0_SCL","SPI1_MOSI0","UART0_TXD","LCD_SEG19","PA.12"}
if o==8 then
fill_Nano100_LCD(e,t,"A","H","LCD_SEG19")
elseif o==7 then
fill_Nano100_UART(e,t,"A","H","UART0_TXD",0)
elseif o==6 then
fill_Nano100_SPI(e,t,"A","H","SPI1_MOSI0",1)
fill_Nano100_SPI_IO(e,t,1,false)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C0_SCL",0)
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","H","ACMP1_P")
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",12)
else
fill_invalid_GPIO(e,t,"A",12)
end
a[45]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],15728640),20)
e={}
e["pin_no"]="46"
e["texts"]={"ACMP1_N","I2C0_SDA","SPI1_MISO0","UART0_RXD","LCD_SEG18","PA.13"}
if o==8 then
fill_Nano100_LCD(e,t,"A","H","LCD_SEG18")
elseif o==7 then
fill_Nano100_UART(e,t,"A","H","UART0_RXD",0)
elseif o==6 then
fill_Nano100_SPI(e,t,"A","H","SPI1_MISO0",1)
fill_Nano100_SPI_IO(e,t,1,true)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C0_SDA",0)
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","H","ACMP1_N")
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",13)
else
fill_invalid_GPIO(e,t,"A",13)
end
a[46]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],251658240),24)
e={}
e["pin_no"]="47"
e["texts"]={"I2C1_SCL","SPI1_CLK","LCD_SEG17","ACMP0_CHDIS","PA.14"}
if o==9 then
fill_Nano100_ACMP(e,t,"A","H","ACMP0_CHDIS")
e["direction"]=kPinDirection_PushPullOut
elseif o==8 then
fill_Nano100_LCD(e,t,"A","H","LCD_SEG17")
elseif o==6 then
fill_Nano100_SPI(e,t,"A","H","SPI1_CLK",1)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C1_SCL",1)
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",14)
else
fill_invalid_GPIO(e,t,"A",14)
end
a[47]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],4026531840),28)
e={}
e["pin_no"]="48"
e["texts"]={"TC3","ACMP1_OUT","I2C1_SDA","SPI1_SS0","LCD_SEG16","PA.15"}
if o==8 then
fill_Nano100_LCD(e,t,"A","H","LCD_SEG16")
elseif o==6 then
fill_Nano100_SPI(e,t,"A","H","SPI1_SS0",1)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C1_SDA",1)
elseif o==3 then
fill_Nano100_ACMP(e,t,"A","H","ACMP1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_Nano100_TM(e,t,"A","H","TC3",1,1)
elseif o==0 then
fill_Nano100_GPIO(e,t,"A",15)
else
fill_invalid_GPIO(e,t,"A",15)
end
a[48]=e
return{name=i,information="",pins=a}
end
