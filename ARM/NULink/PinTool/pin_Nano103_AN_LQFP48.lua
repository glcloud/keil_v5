local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Nano103.lua")
function get_chip_status_Nano103_AN_LQFP48(i,e,t,o)
local a={}
local t=read_Nano103_Registers(i,e,t,o)
local e
e={}
e["pin_no"]="1"
e["texts"]={"VBAT"}
fill_Nano103_Normal(e,t,nil,nil,"VBAT")
a[1]=e
local o=ext.rshift(ext.band(t["SYS_GPF_MFPL"],251658240),24)
e={}
e["pin_no"]="2"
e["texts"]={"PF.6","I2C1_SDA","X32O"}
if o==1 then
fill_Nano103_I2C(e,t,"F","L","I2C1_SDA",1)
elseif o==7 or o==15 then
fill_Nano103_Normal(e,t,"F","L","X32O")
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"F",6)
else
fill_invalid_GPIO(e,t,"F",6)
end
a[2]=e
local o=ext.rshift(ext.band(t["SYS_GPF_MFPL"],4026531840),28)
e={}
e["pin_no"]="3"
e["texts"]={"PF.7","I2C1_SCL","SC0_CD","X32I"}
if o==1 then
fill_Nano103_I2C(e,t,"F","L","I2C1_SCL",1)
elseif o==3 then
fill_Nano103_SC(e,t,"F","L","SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==7 or o==15 then
fill_Nano103_Normal(e,t,"F","L","X32I")
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"F",7)
else
fill_invalid_GPIO(e,t,"F",7)
end
a[3]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPH"],61440),12)
e={}
e["pin_no"]="4"
e["texts"]={"PA.11","I2C1_SCL","TM3_ECNT_IN","SC0_RST","SPI2_MOSI0","TM3_TOG_OUT"}
if o==1 then
fill_Nano103_I2C(e,t,"A","H","I2C1_SCL",1)
elseif o==2 then
fill_Nano103_TM(e,t,"A","H","TM3_ECNT_IN",1,1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_SC(e,t,"A","H","SC0_RST",0)
elseif o==4 then
fill_Nano103_SPI(e,t,"A","H","SPI2_MOSI0",2)
fill_Nano103_SPI_IO(e,t,2,false)
elseif o==5 then
fill_Nano103_TM(e,t,"A","H","TM3_TOG_OUT",1,1)
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",11)
else
fill_invalid_GPIO(e,t,"A",11)
end
a[4]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPH"],3840),8)
e={}
e["pin_no"]="5"
e["texts"]={"PA.10","I2C1_SDA","TM2_ECNT_IN","SC0_PWR","SPI2_MISO0","TM2_TOG_OUT"}
if o==1 then
fill_Nano103_I2C(e,t,"A","H","I2C1_SDA",1)
elseif o==2 then
fill_Nano103_TM(e,t,"A","H","TM2_ECNT_IN",1,0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_SC(e,t,"A","H","SC0_PWR",0)
elseif o==4 then
fill_Nano103_SPI(e,t,"A","H","SPI2_MISO0",2)
fill_Nano103_SPI_IO(e,t,2,true)
elseif o==5 then
fill_Nano103_TM(e,t,"A","H","TM2_TOG_OUT",1,0)
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",10)
else
fill_invalid_GPIO(e,t,"A",10)
end
a[5]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPH"],240),4)
local n=ext.band(t["SC0_SCn_UARTCTL"],1)
e={}
e["pin_no"]="6"
e["texts"]={"PA.9","I2C0_SCL","TM1_ECNT_IN","SC0_DAT","SPI2_SCLK","TM1_TOG_OUT","UART1_RTSn","SNOOPER"}
if o==1 then
fill_Nano103_I2C(e,t,"A","H","I2C0_SCL",0)
elseif o==2 then
fill_Nano103_TM(e,t,"A","H","TM1_ECNT_IN",0,1)
e["direction"]=kPinDirection_In
elseif o==3 then
if n==0 then
fill_Nano103_SC(e,t,"A","H","SC0_DAT",0)
else
fill_Nano103_SC(e,t,"A","H","SC0_UART_RXD",0)
e["texts"]={"PA.9","I2C0_SCL","TM1_ECNT_IN","SC0_UART_RXD","SPI2_SCLK","TM1_TOG_OUT","UART1_RTSn","SNOOPER"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_In
end
elseif o==4 then
fill_Nano103_SPI(e,t,"A","H","SPI2_SCLK",2)
elseif o==5 then
fill_Nano103_TM(e,t,"A","H","TM1_TOG_OUT",0,1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_Nano103_UART(e,t,"A","H","UART1_RTSn",1)
elseif o==7 then
fill_Nano103_Normal(e,t,"A","H","SNOOPER")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",9)
else
fill_invalid_GPIO(e,t,"A",9)
end
a[6]=e
local o=ext.band(t["SYS_GPA_MFPH"],15)
local n=ext.band(t["SC0_SCn_UARTCTL"],1)
e={}
e["pin_no"]="7"
e["texts"]={"PA.8","I2C0_SDA","TM0_ECNT_IN","SC0_CLK","SPI2_SS0","TM0_TOG_OUT","UART1_CTSn"}
if o==1 then
fill_Nano103_I2C(e,t,"A","H","I2C0_SDA",0)
elseif o==2 then
fill_Nano103_TM(e,t,"A","H","TM0_ECNT_IN",0,0)
e["direction"]=kPinDirection_In
elseif o==3 then
if n==0 then
fill_Nano103_SC(e,t,"A","H","SC0_CLK",0)
else
fill_Nano103_SC(e,t,"A","H","SC0_UART_TXD",0)
e["texts"]={"PA.8","I2C0_SDA","TM0_ECNT_IN","SC0_UART_TXD","SPI2_SS0","TM0_TOG_OUT","UART1_CTSn"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_PushPullOut
end
elseif o==4 then
fill_Nano103_SPI(e,t,"A","H","SPI2_SS0",2)
elseif o==5 then
fill_Nano103_TM(e,t,"A","H","TM0_TOG_OUT",0,0)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_Nano103_UART(e,t,"A","H","UART1_CTSn",1)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",8)
else
fill_invalid_GPIO(e,t,"A",8)
end
a[7]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="8"
e["texts"]={"PB.4","UART1_RXD","SC0_CD","SPI2_SS0","RTC_HZ_OUT"}
if o==1 then
fill_Nano103_UART(e,t,"B","L","UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_SC(e,t,"B","L","SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_SPI(e,t,"B","L","SPI2_SS0",2)
elseif o==6 then
fill_Nano103_Normal(e,t,"B","L","RTC_HZ_OUT")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",4)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[8]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="9"
e["texts"]={"PB.5","UART1_TXD","SC0_RST","SPI2_SCLK"}
if o==1 then
fill_Nano103_UART(e,t,"B","L","UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Nano103_SC(e,t,"B","L","SC0_RST",0)
elseif o==4 then
fill_Nano103_SPI(e,t,"B","L","SPI2_SCLK",2)
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",5)
else
fill_invalid_GPIO(e,t,"B",5)
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"LDO_CAP"}
fill_Nano103_Normal(e,t,nil,nil,"LDO_CAP")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VDD"}
fill_Nano103_Normal(e,t,nil,nil,"VDD")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"VSS"}
fill_Nano103_Normal(e,t,nil,nil,"VSS")
a[12]=e
local o=ext.band(t["SYS_GPB_MFPL"],15)
e={}
e["pin_no"]="13"
e["texts"]={"PB.0","UART0_RXD","SPI1_MOSI0"}
if o==1 then
fill_Nano103_UART(e,t,"B","L","UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_SPI(e,t,"B","L","SPI1_MOSI0",1)
fill_Nano103_SPI_IO(e,t,1,false)
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",0)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[13]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPL"],240),4)
e={}
e["pin_no"]="14"
e["texts"]={"PB.1","UART0_TXD","SPI1_MISO0"}
if o==1 then
fill_Nano103_UART(e,t,"B","L","UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Nano103_SPI(e,t,"B","L","SPI1_MISO0",1)
fill_Nano103_SPI_IO(e,t,1,true)
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",1)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[14]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="15"
e["texts"]={"PB.2","UART0_RTSn","SPI1_SCLK","FCLKO"}
if o==1 then
fill_Nano103_UART(e,t,"B","L","UART0_RTSn",0)
elseif o==3 then
fill_Nano103_SPI(e,t,"B","L","SPI1_SCLK",1)
elseif o==4 then
fill_Nano103_CLKO(e,t,"B","L","FCLKO")
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",2)
else
fill_invalid_GPIO(e,t,"B",2)
end
a[15]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="16"
e["texts"]={"PB.3","UART0_CTSn","SPI1_SS0","SC1_CD"}
if o==1 then
fill_Nano103_UART(e,t,"B","L","UART0_CTSn",0)
elseif o==3 then
fill_Nano103_SPI(e,t,"B","L","SPI1_SS0",1)
elseif o==4 then
fill_Nano103_SC(e,t,"B","L","SC1_CD",1)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",3)
else
fill_invalid_GPIO(e,t,"B",3)
end
a[16]=e
local o=ext.rshift(ext.band(t["SYS_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="17"
e["texts"]={"PC.3","SPI0_MOSI0","SC1_RST","PWM0_BKP0_P0"}
if o==1 then
fill_Nano103_SPI(e,t,"C","L","SPI0_MOSI0",0)
fill_Nano103_SPI_IO(e,t,0,false)
elseif o==4 then
fill_Nano103_SC(e,t,"C","L","SC1_RST",1)
elseif o==5 then
fill_Nano103_PWM(e,t,"C","L","PWM0_BKP0_P0",0)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"C",3)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[17]=e
local o=ext.rshift(ext.band(t["SYS_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="18"
e["texts"]={"PC.2","SPI0_MISO0","SC1_PWR","PWM0_BKP0_P1"}
if o==1 then
fill_Nano103_SPI(e,t,"C","L","SPI0_MISO0",0)
fill_Nano103_SPI_IO(e,t,0,true)
elseif o==4 then
fill_Nano103_SC(e,t,"C","L","SC1_PWR",1)
elseif o==5 then
fill_Nano103_PWM(e,t,"C","L","PWM0_BKP0_P1",0)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"C",2)
else
fill_invalid_GPIO(e,t,"C",2)
end
a[18]=e
local o=ext.rshift(ext.band(t["SYS_GPC_MFPL"],240),4)
local n=ext.band(t["SC1_SCn_UARTCTL"],1)
e={}
e["pin_no"]="19"
e["texts"]={"PC.1","SPI0_SCLK","SC1_DAT","PWM0_BKP1_P0"}
if o==1 then
fill_Nano103_SPI(e,t,"C","L","SPI0_SCLK",0)
elseif o==4 then
if n==0 then
fill_Nano103_SC(e,t,"C","L","SC1_DAT",1)
else
fill_Nano103_SC(e,t,"C","L","SC1_UART_RXD",1)
e["texts"]={"PC.1","SPI0_SCLK","SC1_UART_RXD","PWM0_BKP1_P0"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_In
end
elseif o==5 then
fill_Nano103_PWM(e,t,"C","L","PWM0_BKP1_P0",0)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"C",1)
else
fill_invalid_GPIO(e,t,"C",1)
end
a[19]=e
local o=ext.band(t["SYS_GPC_MFPL"],15)
local n=ext.band(t["SC1_SCn_UARTCTL"],1)
e={}
e["pin_no"]="20"
e["texts"]={"PC.0","SPI0_SS0","SC1_CLK","PWM0_BKP1_P1"}
if o==1 then
fill_Nano103_SPI(e,t,"C","L","SPI0_SS0",0)
elseif o==4 then
if n==0 then
fill_Nano103_SC(e,t,"C","L","SC1_CLK",1)
else
fill_Nano103_SC(e,t,"C","L","SC1_UART_TXD",1)
e["texts"]={"PC.0","SPI0_SS0","SC1_UART_TXD","PWM0_BKP1_P1"}
e["highlight_color"]=kColor_UART
e["pin_bg_color"]=kBgColor_UART
e["direction"]=kPinDirection_PushPullOut
end
elseif o==5 then
fill_Nano103_PWM(e,t,"C","L","PWM0_BKP1_P1",0)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"C",0)
else
fill_invalid_GPIO(e,t,"C",0)
end
a[20]=e
local o=ext.rshift(ext.band(t["SYS_GPE_MFPL"],15728640),20)
e={}
e["pin_no"]="21"
e["texts"]={"PE.5","PWM0_CH5","RTC_HZ_OUT"}
if o==1 then
fill_Nano103_PWM(e,t,"E","L","PWM0_CH5",0,5)
elseif o==6 then
fill_Nano103_Normal(e,t,"E","L","RTC_HZ_OUT")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"E",5)
else
fill_invalid_GPIO(e,t,"E",5)
end
a[21]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPH"],61440),12)
e={}
e["pin_no"]="22"
e["texts"]={"PB.11","PWM0_CH4","TM3_ECNT_IN","TM3_TOG_OUT","SPI0_MISO0"}
if o==1 then
fill_Nano103_PWM(e,t,"B","H","PWM0_CH4",0,4)
elseif o==2 then
fill_Nano103_TM(e,t,"B","H","TM3_ECNT_IN",1,1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_TM(e,t,"B","H","TM3_TOG_OUT",1,1)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_Nano103_SPI(e,t,"B","H","SPI0_MISO0",0)
fill_Nano103_SPI_IO(e,t,0,true)
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",11)
else
fill_invalid_GPIO(e,t,"B",11)
end
a[22]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPH"],3840),8)
e={}
e["pin_no"]="23"
e["texts"]={"PB.10","SPI0_MOSI0","TM2_TOG_OUT","SPI0_SS1"}
if o==1 then
fill_Nano103_SPI(e,t,"B","H","SPI0_MOSI0",0)
fill_Nano103_SPI_IO(e,t,0,false)
elseif o==4 then
fill_Nano103_TM(e,t,"B","H","TM2_TOG_OUT",1,0)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_Nano103_SPI(e,t,"B","H","SPI0_SS1",0)
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",10)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[23]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPH"],240),4)
e={}
e["pin_no"]="24"
e["texts"]={"PB.9","SPI1_SS1","TM1_ECNT_IN","TM1_TOG_OUT","INT0"}
if o==1 then
fill_Nano103_SPI(e,t,"B","H","SPI1_SS1",1)
elseif o==2 then
fill_Nano103_TM(e,t,"B","H","TM1_ECNT_IN",0,1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_TM(e,t,"B","H","TM1_TOG_OUT",0,1)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_Nano103_Normal(e,t,"B","H","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",9)
else
fill_invalid_GPIO(e,t,"B",9)
end
a[24]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPH"],4026531840),28)
e={}
e["pin_no"]="25"
e["texts"]={"TM3_TOG_OUT","UART0_TXD","SC0_PWR","TM3_CAP_IN","I2C1_SCL","PWM0_CH3","PA.15"}
if o==1 then
fill_Nano103_PWM(e,t,"A","H","PWM0_CH3",0,3)
elseif o==2 then
fill_Nano103_I2C(e,t,"A","H","I2C1_SCL",1)
elseif o==3 then
fill_Nano103_TM(e,t,"A","H","TM3_CAP_IN",1,1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_SC(e,t,"A","H","SC0_PWR",0)
elseif o==6 then
fill_Nano103_UART(e,t,"A","H","UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_Nano103_TM(e,t,"A","H","TM3_TOG_OUT",1,1)
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",15)
else
fill_invalid_GPIO(e,t,"A",15)
end
a[25]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPH"],251658240),24)
e={}
e["pin_no"]="26"
e["texts"]={"TM2_TOG_OUT","UART0_RXD","TM2_ECNT_IN","TM2_CAP_IN","I2C1_SDA","PWM0_CH2","PA.14"}
if o==1 then
fill_Nano103_PWM(e,t,"A","H","PWM0_CH2",0,2)
elseif o==2 then
fill_Nano103_I2C(e,t,"A","H","I2C1_SDA",1)
elseif o==3 then
fill_Nano103_TM(e,t,"A","H","TM2_CAP_IN",1,0)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_TM(e,t,"A","H","TM2_ECNT_IN",1,0)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_Nano103_UART(e,t,"A","H","UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==7 then
fill_Nano103_TM(e,t,"A","H","TM2_TOG_OUT",1,0)
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",14)
else
fill_invalid_GPIO(e,t,"A",14)
end
a[26]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPH"],15728640),20)
e={}
e["pin_no"]="27"
e["texts"]={"I2C0_SCL","TM1_CAP_IN","PWM0_CH1","PA.13"}
if o==1 then
fill_Nano103_PWM(e,t,"A","H","PWM0_CH1",0,1)
elseif o==3 then
fill_Nano103_TM(e,t,"A","H","TM1_CAP_IN",0,1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_I2C(e,t,"A","H","I2C0_SCL",0)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",13)
else
fill_invalid_GPIO(e,t,"A",13)
end
a[27]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPH"],983040),16)
e={}
e["pin_no"]="28"
e["texts"]={"I2C0_SDA","TM0_CAP_IN","PWM0_CH0","PA.12"}
if o==1 then
fill_Nano103_PWM(e,t,"A","H","PWM0_CH0",0,0)
elseif o==3 then
fill_Nano103_TM(e,t,"A","H","TM0_CAP_IN",0,0)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_I2C(e,t,"A","H","I2C0_SDA",0)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",12)
else
fill_invalid_GPIO(e,t,"A",12)
end
a[28]=e
local o=ext.band(t["SYS_GPF_MFPL"],15)
e={}
e["pin_no"]="29"
e["texts"]={"ICE_DAT","INT0","PF.0"}
if o==5 then
fill_Nano103_Normal(e,t,"F","L","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==7 or o==15 then
fill_Nano103_Normal(e,t,"F","L","ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif o==0 then
fill_Nano103_GPIO(e,t,"F",0)
else
fill_invalid_GPIO(e,t,"F",0)
end
a[29]=e
local o=ext.rshift(ext.band(t["SYS_GPF_MFPL"],240),4)
e={}
e["pin_no"]="30"
e["texts"]={"ICE_CLK","INT1","FCLKO","PF.1"}
if o==4 then
fill_Nano103_CLKO(e,t,"F","L","FCLKO")
elseif o==5 then
fill_Nano103_Normal(e,t,"F","L","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==7 or o==15 then
fill_Nano103_Normal(e,t,"F","L","ICE_CLK")
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"F",1)
else
fill_invalid_GPIO(e,t,"F",1)
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"AVSS"}
fill_Nano103_Normal(e,t,nil,nil,"AVSS")
a[31]=e
local o=ext.band(t["SYS_GPA_MFPL"],15)
e={}
e["pin_no"]="32"
e["texts"]={"PWM0_CH2","TM2_CAP_IN","CMP1_P","AD0","PA.0"}
if o==1 then
fill_Nano103_ADC(e,t,"A","L","AD0")
e["direction"]=kPinDirection_In
elseif o==2 then
fill_Nano103_ACMP(e,t,"A","L","CMP1_P")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_TM(e,t,"A","L","TM2_CAP_IN",1,0)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_PWM(e,t,"A","L","PWM0_CH2",0,2)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",0)
else
fill_invalid_GPIO(e,t,"A",0)
end
a[32]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPL"],240),4)
e={}
e["pin_no"]="33"
e["texts"]={"SPI3_MISO1","CMP1_N","AD1","PA.1"}
if o==1 then
fill_Nano103_ADC(e,t,"A","L","AD1")
e["direction"]=kPinDirection_In
elseif o==2 then
fill_Nano103_ACMP(e,t,"A","L","CMP1_N")
e["direction"]=kPinDirection_In
elseif o==6 then
fill_Nano103_SPI(e,t,"A","L","SPI3_MISO1",3)
fill_Nano103_SPI_IO(e,t,3,true)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",1)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[33]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="34"
e["texts"]={"UART1_RXD","AD2","PA.2"}
if o==1 then
fill_Nano103_ADC(e,t,"A","L","AD2")
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_UART(e,t,"A","L","UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",2)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[34]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="35"
e["texts"]={"SPI3_MOSI0","UART1_TXD","AD3","PA.3"}
if o==1 then
fill_Nano103_ADC(e,t,"A","L","AD3")
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_UART(e,t,"A","L","UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==6 then
fill_Nano103_SPI(e,t,"A","L","SPI3_MOSI0",3)
fill_Nano103_SPI_IO(e,t,3,false)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",3)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[35]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPL"],983040),16)
e={}
e["pin_no"]="36"
e["texts"]={"SPI3_MISO0","I2C0_SDA","AD4","PA.4"}
if o==1 then
fill_Nano103_ADC(e,t,"A","L","AD4")
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_I2C(e,t,"A","L","I2C0_SDA",0)
elseif o==6 then
fill_Nano103_SPI(e,t,"A","L","SPI3_MISO0",3)
fill_Nano103_SPI_IO(e,t,3,true)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",4)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[36]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPL"],15728640),20)
e={}
e["pin_no"]="37"
e["texts"]={"SPI3_SCLK","I2C0_SCL","AD5","PA.5"}
if o==1 then
fill_Nano103_ADC(e,t,"A","L","AD5")
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_I2C(e,t,"A","L","I2C0_SCL",0)
elseif o==6 then
fill_Nano103_SPI(e,t,"A","L","SPI3_SCLK",3)
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",5)
else
fill_invalid_GPIO(e,t,"A",5)
end
a[37]=e
local o=ext.rshift(ext.band(t["SYS_GPA_MFPL"],251658240),24)
e={}
e["pin_no"]="38"
e["texts"]={"TM3_TOG_OUT","PWM0_CH3","TM3_ECNT_IN","TM3_CAP_IN","CMP1_OUT","AD6","PA.6"}
if o==1 then
fill_Nano103_ADC(e,t,"A","L","AD6")
e["direction"]=kPinDirection_In
elseif o==2 then
fill_Nano103_ACMP(e,t,"A","L","CMP1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Nano103_TM(e,t,"A","L","TM3_CAP_IN",1,1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_TM(e,t,"A","L","TM3_ECNT_IN",1,1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_PWM(e,t,"A","L","PWM0_CH3",0,3)
elseif o==7 then
fill_Nano103_TM(e,t,"A","L","TM3_TOG_OUT",1,1)
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"A",6)
else
fill_invalid_GPIO(e,t,"A",6)
end
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"VREF"}
fill_Nano103_Normal(e,t,nil,nil,"VREF")
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"AVDD"}
fill_Nano103_Normal(e,t,nil,nil,"AVDD")
a[40]=e
local o=ext.rshift(ext.band(t["SYS_GPC_MFPL"],4026531840),28)
e={}
e["pin_no"]="41"
e["texts"]={"PWM0_CH1","TM1_CAP_IN","AD7","UART1_TXD","PC.7"}
if o==1 then
fill_Nano103_UART(e,t,"C","L","UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_Nano103_ADC(e,t,"C","L","AD7")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_TM(e,t,"C","L","TM1_CAP_IN",0,1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_PWM(e,t,"C","L","PWM0_CH1",0,1)
elseif o==0 then
fill_Nano103_GPIO(e,t,"C",7)
else
fill_invalid_GPIO(e,t,"C",7)
end
a[41]=e
local o=ext.rshift(ext.band(t["SYS_GPC_MFPL"],251658240),24)
e={}
e["pin_no"]="42"
e["texts"]={"PWM0_CH0","SC1_CD","TM0_CAP_IN","UART1_RXD","PC.6"}
if o==1 then
fill_Nano103_UART(e,t,"C","L","UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_TM(e,t,"C","L","TM0_CAP_IN",0,0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_SC(e,t,"C","L","SC1_CD",1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano103_PWM(e,t,"C","L","PWM0_CH0",0,0)
elseif o==0 then
fill_Nano103_GPIO(e,t,"C",6)
else
fill_invalid_GPIO(e,t,"C",6)
end
a[42]=e
local o=ext.rshift(ext.band(t["SYS_GPB_MFPH"],4026531840),28)
e={}
e["pin_no"]="43"
e["texts"]={"SC1_CD","SNOOPER","INT1","PB.15"}
if o==1 then
fill_Nano103_Normal(e,t,"B","H","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_Normal(e,t,"B","H","SNOOPER")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_SC(e,t,"B","H","SC1_CD",1)
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",15)
else
fill_invalid_GPIO(e,t,"B",15)
end
a[43]=e
local o=ext.rshift(ext.band(t["SYS_GPF_MFPL"],61440),12)
e={}
e["pin_no"]="44"
e["texts"]={"XT1_IN","PF.3"}
if o==7 or o==15 then
fill_Nano103_Normal(e,t,"F","L","XT1_IN")
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"F",3)
else
fill_invalid_GPIO(e,t,"F",3)
end
a[44]=e
local o=ext.rshift(ext.band(t["SYS_GPF_MFPL"],3840),8)
e={}
e["pin_no"]="45"
e["texts"]={"XT1_OUT","PF.2"}
if o==7 or o==15 then
fill_Nano103_Normal(e,t,"F","L","XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==0 then
fill_Nano103_GPIO(e,t,"F",2)
else
fill_invalid_GPIO(e,t,"F",2)
end
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"nRESET"}
fill_Nano103_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"VSS"}
fill_Nano103_Normal(e,t,nil,nil,"VSS")
a[47]=e
local o=ext.band(t["SYS_GPB_MFPH"],15)
e={}
e["pin_no"]="48"
e["texts"]={"SNOOPER","TM0_TOG_OUT","INT0","TM0_ECNT_IN","STADC","PB.8"}
if o==1 then
fill_Nano103_ADC(e,t,"B","H","STADC")
elseif o==2 then
fill_Nano103_TM(e,t,"B","H","TM0_ECNT_IN",0,0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Nano103_Normal(e,t,"B","H","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano103_TM(e,t,"B","H","TM0_TOG_OUT",0,0)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_Nano103_Normal(e,t,"B","H","SNOOPER")
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_In
elseif o==0 then
fill_Nano103_GPIO(e,t,"B",8)
else
fill_invalid_GPIO(e,t,"B",8)
end
a[48]=e
return{name=i,information="",pins=a}
end
