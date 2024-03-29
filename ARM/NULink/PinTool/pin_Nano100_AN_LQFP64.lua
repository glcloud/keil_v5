local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Nano100.lua")
function get_chip_status_Nano100_AN_LQFP64(i,e,e)
local a={}
local t=read_Nano100_Registers()
local e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],117440512),24)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","nINT0","SPISS21"}
if o==1 then
e["highlight_text"]="nINT0"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="nINT0"
elseif o==4 then
fill_Nano100_SPI(e,t,"B","H","SPISS21",2)
else
fill_Nano100_GPIO(e,t,"B",14)
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],7340032),20)
e={}
e["pin_no"]="2"
e["texts"]={"PB.13","AD1"}
if o==2 then
fill_Nano100_EBI(e,t,"B","H","AD1")
e["direction"]=kPinDirection_Bi
else
fill_Nano100_GPIO(e,t,"B",13)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],458752),16)
e={}
e["pin_no"]="3"
e["texts"]={"PB.12","AD0","CLKO"}
if o==2 then
fill_Nano100_EBI(e,t,"B","H","AD0")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_Nano100_CLKO(e,t,"B","H","CLKO")
else
fill_Nano100_GPIO(e,t,"B",12)
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
e["information"]="X32O"
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
e["information"]="X32I"
a[5]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],28672),12)
e={}
e["pin_no"]="6"
e["texts"]={"PA.11","I2C1SCK","nRD","SC0RST","MOSI20"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C1SCK",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","nRD")
elseif o==3 then
fill_Nano100_SC(e,t,"A","H","SC0RST",0)
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","MOSI20",2)
fill_Nano100_SPI_IO(e,t,2,false)
else
fill_Nano100_GPIO(e,t,"A",11)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],1792),8)
e={}
e["pin_no"]="7"
e["texts"]={"PA.10","I2C1SDA","nWR","SC0PWR","MISO20"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C1SDA",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","nWR")
elseif o==3 then
fill_Nano100_SC(e,t,"A","H","SC0PWR",0)
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","MISO20",2)
fill_Nano100_SPI_IO(e,t,2,true)
else
fill_Nano100_GPIO(e,t,"A",10)
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],112),4)
e={}
e["pin_no"]="8"
e["texts"]={"PA.9","I2C0SCL","SC0DAT","SPICLK2"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C0SCL",0)
elseif o==3 then
fill_Nano100_SC(e,t,"A","H","SC0DAT",0)
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","SPICLK2",2)
else
fill_Nano100_GPIO(e,t,"A",9)
end
a[8]=e
local o=ext.band(t["GCR_PA_H_MFP"],7)
e={}
e["pin_no"]="9"
e["texts"]={"PA.8","I2C0SDA","SC0CLK","SPISS20"}
if o==1 then
fill_Nano100_I2C(e,t,"A","H","I2C0SDA",0)
elseif o==3 then
fill_Nano100_SC(e,t,"A","H","SC0CLK",0)
elseif o==4 then
fill_Nano100_SPI(e,t,"A","H","SPISS20",2)
else
fill_Nano100_GPIO(e,t,"A",8)
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],458752),16)
e={}
e["pin_no"]="10"
e["texts"]={"PB.4","RX1","SC0CD","SPISS20"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","RX1",1)
elseif o==3 then
fill_Nano100_SC(e,t,"B","L","SC0CD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","SPISS20",2)
else
fill_Nano100_GPIO(e,t,"B",4)
end
a[10]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],7340032),20)
e={}
e["pin_no"]="11"
e["texts"]={"PB.5","TX1","SPICLK2"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","TX1",1)
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","SPICLK2",2)
else
fill_Nano100_GPIO(e,t,"B",5)
end
a[11]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],117440512),24)
e={}
e["pin_no"]="12"
e["texts"]={"PB.6","RTSn1","ALE","MISO20"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","RTSn1",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","ALE")
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","MISO20",2)
fill_Nano100_SPI_IO(e,t,2,true)
else
fill_Nano100_GPIO(e,t,"B",6)
end
a[12]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],1879048192),28)
e={}
e["pin_no"]="13"
e["texts"]={"PB.7","CTSn1","nCS","MOSI20"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","CTSn1",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","nCS")
elseif o==4 then
fill_Nano100_SPI(e,t,"B","L","MOSI20",2)
fill_Nano100_SPI_IO(e,t,2,false)
else
fill_Nano100_GPIO(e,t,"B",7)
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
e["information"]="LDO"
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
e["information"]="VDD"
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
e["information"]="VSS"
a[16]=e
local o=ext.band(t["GCR_PB_L_MFP"],7)
e={}
e["pin_no"]="17"
e["texts"]={"PB.0","RX0","MOSI10"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","RX0",0)
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","MOSI10",1)
fill_Nano100_SPI_IO(e,t,1,false)
else
fill_Nano100_GPIO(e,t,"B",0)
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],112),4)
e={}
e["pin_no"]="18"
e["texts"]={"PB.1","TX0","MISO10"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","TX0",0)
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","MISO10",1)
fill_Nano100_SPI_IO(e,t,1,true)
else
fill_Nano100_GPIO(e,t,"B",1)
end
a[18]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],1792),8)
e={}
e["pin_no"]="19"
e["texts"]={"PB.2","RTSn0","nWRL","SPICLK1"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","RTSn0",0)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","nWRL")
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPICLK1",1)
else
fill_Nano100_GPIO(e,t,"B",2)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_PB_L_MFP"],28672),12)
e={}
e["pin_no"]="20"
e["texts"]={"PB.3","CTSn0","nWRH","SPISS10"}
if o==1 then
fill_Nano100_UART(e,t,"B","L","CTSn0",0)
elseif o==2 then
fill_Nano100_EBI(e,t,"B","L","nWRH")
elseif o==3 then
fill_Nano100_SPI(e,t,"B","L","SPISS10",1)
else
fill_Nano100_GPIO(e,t,"B",3)
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"PD.6"}
e["highlight_text"]="PD.6"
fill_Nano100_GPIO(e,t,"D",6)
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"PD.7"}
e["highlight_text"]="PD.7"
fill_Nano100_GPIO(e,t,"D",7)
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"PD.14"}
e["highlight_text"]="PD.14"
fill_Nano100_GPIO(e,t,"D",14)
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"PD.15"}
e["highlight_text"]="PD.15"
fill_Nano100_GPIO(e,t,"D",15)
a[24]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],28672),12)
e={}
e["pin_no"]="25"
e["texts"]={"PC.3","MOSI00","I2SDO","SC1RST"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","MOSI00",0)
fill_Nano100_SPI_IO(e,t,0,false)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2SDO")
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1RST",1)
else
fill_Nano100_GPIO(e,t,"C",3)
end
a[25]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],1792),8)
e={}
e["pin_no"]="26"
e["texts"]={"PC.2","MISO00","I2SDI","SC1PWR"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","MISO00",0)
fill_Nano100_SPI_IO(e,t,0,true)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2SDI")
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1PWR",1)
else
fill_Nano100_GPIO(e,t,"C",2)
end
a[26]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],112),4)
e={}
e["pin_no"]="27"
e["texts"]={"PC.1","SPICLK0","I2SBCLK","SC1DAT"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPICLK0",0)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2SBCLK")
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1DAT",1)
else
fill_Nano100_GPIO(e,t,"C",1)
end
a[27]=e
local o=ext.band(t["GCR_PC_L_MFP"],7)
e={}
e["pin_no"]="28"
e["texts"]={"PC.0","SPISS00","I2SLRCLK","SC1CLK"}
if o==1 then
fill_Nano100_SPI(e,t,"C","L","SPISS00",0)
elseif o==2 then
fill_Nano100_I2S(e,t,"C","L","I2SLRCLK")
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1CLK",1)
else
fill_Nano100_GPIO(e,t,"C",0)
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_PE_L_MFP"],7340032),20)
e={}
e["pin_no"]="29"
e["texts"]={"PE.5","PWM1CH1"}
if o==1 then
fill_Nano100_PWM(e,t,"E","L","PWM1CH1",1,1)
else
fill_Nano100_GPIO(e,t,"E",5)
end
a[29]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],28672),12)
e={}
e["pin_no"]="30"
e["texts"]={"PB.11","PWM1CH0","TMR3","MISO00"}
if o==1 then
fill_Nano100_PWM(e,t,"B","H","PWM1CH0",1,0)
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TMR3",1,1)
elseif o==5 then
fill_Nano100_SPI(e,t,"B","H","MISO00",0)
fill_Nano100_SPI_IO(e,t,0,true)
else
fill_Nano100_GPIO(e,t,"B",11)
end
a[30]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],1792),8)
e={}
e["pin_no"]="31"
e["texts"]={"PB.10","SPISS01","TMR2","MOSI00"}
if o==1 then
fill_Nano100_SPI(e,t,"B","H","SPISS01",0)
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TMR2",1,0)
elseif o==5 then
fill_Nano100_SPI(e,t,"B","H","MOSI00",0)
fill_Nano100_SPI_IO(e,t,0,false)
else
fill_Nano100_GPIO(e,t,"B",10)
end
a[31]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],112),4)
e={}
e["pin_no"]="32"
e["texts"]={"PB.9","SPISS11","TMR1","nINT0"}
if o==1 then
fill_Nano100_SPI(e,t,"B","H","SPISS11",1)
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TMR1",0,1)
elseif o==5 then
e["highlight_text"]="nINT0"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="nINT0"
else
fill_Nano100_GPIO(e,t,"B",9)
end
a[32]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],28672),12)
e={}
e["pin_no"]="33"
e["texts"]={"TX1","MOSI10","PC.11"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","MOSI10",1)
fill_Nano100_SPI_IO(e,t,1,false)
elseif o==5 then
fill_Nano100_UART(e,t,"C","H","TX1",1)
elseif o==6 then
fill_invalid_GPIO(e,t,"C",11)
else
fill_Nano100_GPIO(e,t,"C",11)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],1792),8)
e={}
e["pin_no"]="34"
e["texts"]={"RX1","MISO10","PC.10"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","MISO10",1)
fill_Nano100_SPI_IO(e,t,1,true)
elseif o==5 then
fill_Nano100_UART(e,t,"C","H","RX1",1)
elseif o==6 then
fill_invalid_GPIO(e,t,"C",10)
else
fill_Nano100_GPIO(e,t,"C",10)
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],112),4)
e={}
e["pin_no"]="35"
e["texts"]={"I2C1SCK","SPICLK1","PC.9"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPICLK1",1)
elseif o==5 then
fill_Nano100_I2C(e,t,"C","H","I2C1SCK",1)
elseif o==6 then
fill_invalid_GPIO(e,t,"C",9)
else
fill_Nano100_GPIO(e,t,"C",9)
end
a[35]=e
local o=ext.band(t["GCR_PC_H_MFP"],7)
e={}
e["pin_no"]="36"
e["texts"]={"I2C1SDA","MCLK","SPISS10","PC.8"}
if o==1 then
fill_Nano100_SPI(e,t,"C","H","SPISS10",1)
elseif o==2 then
fill_Nano100_EBI(e,t,"C","H","MCLK")
elseif o==5 then
fill_Nano100_I2C(e,t,"C","H","I2C1SDA",1)
elseif o==6 then
fill_invalid_GPIO(e,t,"C",8)
else
fill_Nano100_GPIO(e,t,"C",8)
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],1879048192),28)
e={}
e["pin_no"]="37"
e["texts"]={"TX0","TC3","I2SMCLK","PWM0CH3","PA.15"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0CH3",0,3)
elseif o==2 then
fill_Nano100_I2S(e,t,"A","H","I2SMCLK")
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC3",1,1)
elseif o==6 then
fill_Nano100_UART(e,t,"A","H","TX0",0)
else
fill_Nano100_GPIO(e,t,"A",15)
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],117440512),24)
e={}
e["pin_no"]="38"
e["texts"]={"RX0","TC2","AD15","PWM0CH2","PA.14"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0CH2",0,2)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","AD15")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC2",1,0)
elseif o==6 then
fill_Nano100_UART(e,t,"A","H","RX0",0)
else
fill_Nano100_GPIO(e,t,"A",14)
end
a[38]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],7340032),20)
e={}
e["pin_no"]="39"
e["texts"]={"I2C0SCK","TC1","AD14","PWM0CH1","PA.13"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0CH1",0,1)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","AD14")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC1",0,1)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C0SCK",0)
elseif o==6 then
fill_invalid_GPIO(e,t,"A",13)
else
fill_Nano100_GPIO(e,t,"A",13)
end
a[39]=e
local o=ext.rshift(ext.band(t["GCR_PA_H_MFP"],458752),16)
e={}
e["pin_no"]="40"
e["texts"]={"I2C0SDA","TC0","AD13","PWM0CH0","PA.12"}
if o==1 then
fill_Nano100_PWM(e,t,"A","H","PWM0CH0",0,0)
elseif o==2 then
fill_Nano100_EBI(e,t,"A","H","AD13")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","H","TC0",0,0)
elseif o==5 then
fill_Nano100_I2C(e,t,"A","H","I2C0SDA",0)
elseif o==6 then
fill_invalid_GPIO(e,t,"A",12)
else
fill_Nano100_GPIO(e,t,"A",12)
end
a[40]=e
local o=ext.band(t["GCR_PF_L_MFP"],7)
e={}
e["pin_no"]="41"
e["texts"]={"ICE_DAT","nINT0","PF.0"}
if o==5 then
e["highlight_text"]="nINT0"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="nINT0"
elseif o==7 then
e["highlight_text"]="ICE_DAT"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Bi
e["status"]=kPinStatus_Unknown
e["information"]="ICE_DAT"
else
fill_Nano100_GPIO(e,t,"F",0)
end
a[41]=e
local o=ext.rshift(ext.band(t["GCR_PF_L_MFP"],112),4)
e={}
e["pin_no"]="42"
e["texts"]={"ICE_CK","nINT1","CLKO","PF.1"}
if o==4 then
fill_Nano100_CLKO(e,t,"F","L","CLKO")
elseif o==5 then
e["highlight_text"]="nINT1"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="nINT1"
elseif o==7 then
e["highlight_text"]="ICE_CK"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="ICE_CK"
else
fill_Nano100_GPIO(e,t,"F",1)
end
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
e["information"]="AVSS"
a[43]=e
local o=ext.band(t["GCR_PA_L_MFP"],7)
e={}
e["pin_no"]="44"
e["texts"]={"ADC0","PA.0"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC0")
elseif o==6 then
fill_invalid_GPIO(e,t,"A",0)
else
fill_Nano100_GPIO(e,t,"A",0)
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],112),4)
e={}
e["pin_no"]="45"
e["texts"]={"AD12","ADC1","PA.1"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC1")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","AD12")
e["direction"]=kPinDirection_Bi
elseif o==6 then
fill_invalid_GPIO(e,t,"A",1)
else
fill_Nano100_GPIO(e,t,"A",1)
end
a[45]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],1792),8)
e={}
e["pin_no"]="46"
e["texts"]={"RX1","AD11","ADC2","PA.2"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC2")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","AD11")
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_Nano100_UART(e,t,"A","L","RX1",1)
else
fill_Nano100_GPIO(e,t,"A",2)
end
a[46]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],28672),12)
e={}
e["pin_no"]="47"
e["texts"]={"TX1","AD10","ADC3","PA.3"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC3")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","AD10")
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_Nano100_UART(e,t,"A","L","TX1",1)
else
fill_Nano100_GPIO(e,t,"A",3)
end
a[47]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],458752),16)
e={}
e["pin_no"]="48"
e["texts"]={"I2C0SDA","AD9","ADC4","PA.4"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC4")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","AD9")
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_Nano100_I2C(e,t,"A","L","I2C0SDA",0)
else
fill_Nano100_GPIO(e,t,"A",4)
end
a[48]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],7340032),20)
e={}
e["pin_no"]="49"
e["texts"]={"I2C0SCK","AD8","ADC5","PA.5"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC5")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","AD8")
e["direction"]=kPinDirection_Bi
elseif o==5 then
fill_Nano100_I2C(e,t,"A","L","I2C0SCK",0)
else
fill_Nano100_GPIO(e,t,"A",5)
end
a[49]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],117440512),24)
e={}
e["pin_no"]="50"
e["texts"]={"PWM0CH3","TC3","AD7","ADC6","PA.6"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC6")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","AD7")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","L","TC3",1,1)
elseif o==5 then
fill_Nano100_PWM(e,t,"A","L","PWM0CH3",0,3)
else
fill_Nano100_GPIO(e,t,"A",6)
end
a[50]=e
local o=ext.rshift(ext.band(t["GCR_PA_L_MFP"],1879048192),28)
e={}
e["pin_no"]="51"
e["texts"]={"PWM0CH2","TC2","AD6","ADC7","PA.7"}
if o==1 then
fill_Nano100_ADC(e,t,"A","L","ADC7")
elseif o==2 then
fill_Nano100_EBI(e,t,"A","L","AD6")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"A","L","TC2",1,0)
elseif o==5 then
fill_Nano100_PWM(e,t,"A","L","PWM0CH2",0,2)
elseif o==6 then
fill_invalid_GPIO(e,t,"A",7)
else
fill_Nano100_GPIO(e,t,"A",7)
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
e["information"]="AVDD"
a[52]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],1879048192),28)
e={}
e["pin_no"]="53"
e["texts"]={"PWM0CH1","TC1","AD5","DAC1OUT","PC.7"}
if o==1 then
fill_Nano100_DAC(e,t,"C","L","DAC1OUT")
elseif o==2 then
fill_Nano100_EBI(e,t,"C","L","AD5")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"C","L","TC1",0,1)
elseif o==5 then
fill_Nano100_PWM(e,t,"C","L","PWM0CH1",0,1)
else
fill_Nano100_GPIO(e,t,"C",7)
end
a[53]=e
local o=ext.rshift(ext.band(t["GCR_PC_L_MFP"],117440512),24)
e={}
e["pin_no"]="54"
e["texts"]={"PWM0CH0","SC1CD","TC0","AD4","DAC0OUT","PC.6"}
if o==1 then
fill_Nano100_DAC(e,t,"C","L","DAC0OUT")
elseif o==2 then
fill_Nano100_EBI(e,t,"C","L","AD4")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"C","L","TC0",0,0)
elseif o==4 then
fill_Nano100_SC(e,t,"C","L","SC1CD",1)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Nano100_PWM(e,t,"C","L","PWM0CH0",0,0)
else
fill_Nano100_GPIO(e,t,"C",6)
end
a[54]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],1879048192),28)
e={}
e["pin_no"]="55"
e["texts"]={"PWM1CH2","TC0","AD3","PC.15"}
if o==2 then
fill_Nano100_EBI(e,t,"C","H","AD3")
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_Nano100_TM(e,t,"C","H","TC0",0,0)
elseif o==4 then
fill_Nano100_PWM(e,t,"C","H","PWM1CH2",1,2)
else
fill_Nano100_GPIO(e,t,"C",15)
end
a[55]=e
local o=ext.rshift(ext.band(t["GCR_PC_H_MFP"],117440512),24)
e={}
e["pin_no"]="56"
e["texts"]={"PWM1CH3","AD2","PC.14"}
if o==2 then
fill_Nano100_EBI(e,t,"C","H","AD2")
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_Nano100_PWM(e,t,"C","H","PWM1CH3",1,3)
else
fill_Nano100_GPIO(e,t,"C",14)
end
a[56]=e
local o=ext.rshift(ext.band(t["GCR_PB_H_MFP"],1879048192),28)
e={}
e["pin_no"]="57"
e["texts"]={"SNOOPER","nINT1","PB.15"}
if o==1 then
e["highlight_text"]="nINT1"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="nINT1"
elseif o==3 then
e["highlight_text"]="SNOOPER"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_RTC
e["pin_bg_color"]=kBgColor_RTC
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="SNOOPER"
else
fill_Nano100_GPIO(e,t,"B",15)
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
e["information"]="XT1_OUT"
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
e["information"]="XT1_IN"
a[59]=e
e={}
e["pin_no"]="60"
e["texts"]={"nRESET"}
e["highlight_text"]="nRESET"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="nRESET"
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
e["information"]="VSS"
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
e["information"]="VDD"
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
e["information"]="PVSS"
a[63]=e
local o=ext.band(t["GCR_PB_H_MFP"],7)
e={}
e["pin_no"]="64"
e["texts"]={"nINT0","TMR0","ADCTRG","PB.8"}
if o==1 then
fill_Nano100_ADC(e,t,"B","H","ADCTRG")
elseif o==2 then
fill_Nano100_TM(e,t,"B","H","TMR0",0,0)
elseif o==3 then
e["highlight_text"]="nINT0"
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
e["information"]="nINT0"
else
fill_Nano100_GPIO(e,t,"B",8)
end
a[64]=e
return{name=i,information="",pins=a}
end