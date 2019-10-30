local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."AU9100.lua")
function get_chip_status_AU9100_AN_LQFP48(i,t,o,e)
local a={}
local t=read_AU9100_Registers(i,t,o,e)
local e
e={}
e["pin_no"]="1"
e["texts"]={"WAKEUP"}
fill_AU9100_Normal(e,t,nil,nil,"WAKEUP")
e["direction"]=kPinDirection_In
a[1]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],49152),14)
e={}
e["pin_no"]="2"
e["texts"]={"PB.7","I2S_SDO","CMP7"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",7)
elseif o==1 then
fill_AU9100_I2S(e,t,"B",7,"I2S_SDO",0)
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",7,"CMP7",0)
else
fill_invalid_GPIO(e,t,"B",7)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],12288),12)
e={}
e["pin_no"]="3"
e["texts"]={"PB.6","I2S_SDI","CMP6","SPI_MOSI1"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",6)
elseif o==1 then
fill_AU9100_I2S(e,t,"B",6,"I2S_SDI",0)
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",6,"CMP6",0)
elseif o==3 then
fill_AU9100_SPI(e,t,"B",6,"SPI_MOSI1",0)
fill_AU9100_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"B",6)
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],3072),10)
e={}
e["pin_no"]="4"
e["texts"]={"PB.5","PWM1B","CMP5","SPI_MISO1"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",5)
elseif o==1 then
fill_AU9100_PWM(e,t,"B",5,"PWM1B")
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",5,"CMP5",0)
elseif o==3 then
fill_AU9100_SPI(e,t,"B",5,"SPI_MISO1",0)
fill_AU9100_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"B",5)
end
a[4]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],768),8)
e={}
e["pin_no"]="5"
e["texts"]={"PB.4","PWM0B","CMP4","SPI_MOSI0"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",4)
elseif o==1 then
fill_AU9100_PWM(e,t,"B",4,"PWM0B")
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",4,"CMP4",0)
elseif o==3 then
fill_AU9100_SPI(e,t,"B",4,"SPI_MOSI0",0)
fill_AU9100_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[5]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],192),6)
e={}
e["pin_no"]="6"
e["texts"]={"PB.3","I2C_SDA","CMP3","SPI_MISO0"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",3)
elseif o==1 then
fill_AU9100_I2C(e,t,"B",3,"I2C_SDA",0)
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",3,"CMP3",0)
elseif o==3 then
fill_AU9100_SPI(e,t,"B",3,"SPI_MISO0",0)
fill_AU9100_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"B",3)
end
a[6]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],48),4)
e={}
e["pin_no"]="7"
e["texts"]={"PB.2","I2C_SCL","CMP2","SPI_SCLK"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",2)
elseif o==1 then
fill_AU9100_I2C(e,t,"B",2,"I2C_SCL",0)
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",2,"CMP2",0)
elseif o==3 then
fill_AU9100_SPI(e,t,"B",2,"SPI_SCLK",0)
else
fill_invalid_GPIO(e,t,"B",2)
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],12),2)
e={}
e["pin_no"]="8"
e["texts"]={"PB.1","MCLK","CMP1","SPI_SSB1"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",1)
elseif o==1 then
fill_AU9100_I2S(e,t,"B",1,"MCLK",0)
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",1,"CMP1",0)
elseif o==3 then
fill_AU9100_SPI(e,t,"B",1,"SPI_SSB1",0)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_GPB_ALT"],3),0)
e={}
e["pin_no"]="9"
e["texts"]={"PB.0","SPI_SSB1","CMP0","SPI_SSB0"}
if o==0 then
fill_AU9100_GPIO(e,t,"B",0)
elseif o==1 then
fill_AU9100_SPI(e,t,"B",0,"SPI_SSB1",0)
elseif o==2 then
fill_AU9100_ACMP(e,t,"B",0,"CMP0",0)
elseif o==3 then
fill_AU9100_SPI(e,t,"B",0,"SPI_SSB0",0)
else
fill_invalid_GPIO(e,t,"B",0)
end
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"VCCD"}
fill_AU9100_Normal(e,t,nil,nil,"VCCD")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"VREG"}
fill_AU9100_Normal(e,t,nil,nil,"VREG")
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
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],3221225472),30)
e={}
e["pin_no"]="14"
e["texts"]={"PA.15","TM1","SDIN"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",15)
elseif o==1 then
fill_AU9100_TM(e,t,"A",15,"TM1",1)
elseif o==2 then
fill_AU9100_Normal(e,t,nil,nil,"SDIN")
else
fill_invalid_GPIO(e,t,"A",15)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],786432),18)
e={}
e["pin_no"]="15"
e["texts"]={"PA.9","UART_RX","I2S_BCLK"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",9)
elseif o==1 then
fill_AU9100_UART(e,t,"A",9,"UART_RX",0)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_AU9100_I2S(e,t,"A",9,"I2S_BCLK",0)
else
fill_invalid_GPIO(e,t,"A",9)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],196608),16)
e={}
e["pin_no"]="16"
e["texts"]={"PA.8","UART_TX","I2S_FS"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",8)
elseif o==1 then
fill_AU9100_UART(e,t,"A",8,"UART_TX",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_AU9100_I2S(e,t,"A",8,"I2S_FS",0)
else
fill_invalid_GPIO(e,t,"A",8)
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VCCSPK"}
fill_AU9100_Normal(e,t,nil,nil,"VCCSPK")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"SPK+"}
fill_AU9100_DPWM(e,t,nil,nil,"SPK+")
e["direction"]=kPinDirection_PushPullOut
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"VSSSPK"}
fill_AU9100_Normal(e,t,nil,nil,"VSSSPK")
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"SPK-"}
fill_AU9100_DPWM(e,t,nil,nil,"SPK-")
e["direction"]=kPinDirection_PushPullOut
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"VCCSPK"}
fill_AU9100_Normal(e,t,nil,nil,"VCCSPK")
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"RESETN"}
fill_AU9100_Normal(e,t,nil,nil,"RESETN")
e["direction"]=kPinDirection_In
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"ICE_DAT"}
fill_AU9100_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"ICE_CLK"}
fill_AU9100_Normal(e,t,nil,nil,"ICE_CLK")
e["direction"]=kPinDirection_In
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"VSSD"}
fill_AU9100_Normal(e,t,nil,nil,"VSSD")
a[25]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],49152),14)
e={}
e["pin_no"]="26"
e["texts"]={"I2S_SDO","PA.7"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",7)
elseif o==1 then
fill_AU9100_I2S(e,t,"A",7,"I2S_SDO",0)
else
fill_invalid_GPIO(e,t,"A",7)
end
a[26]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],12288),12)
e={}
e["pin_no"]="27"
e["texts"]={"I2S_SDI","PA.6"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",6)
elseif o==1 then
fill_AU9100_I2S(e,t,"A",6,"I2S_SDI",0)
else
fill_invalid_GPIO(e,t,"A",6)
end
a[27]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],3072),10)
e={}
e["pin_no"]="28"
e["texts"]={"I2S_BCLK","PA.5"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",5)
elseif o==1 then
fill_AU9100_I2S(e,t,"A",5,"I2S_BCLK",0)
else
fill_invalid_GPIO(e,t,"A",5)
end
a[28]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],768),8)
e={}
e["pin_no"]="29"
e["texts"]={"I2S_FS","PA.4"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",4)
elseif o==1 then
fill_AU9100_I2S(e,t,"A",4,"I2S_FS",0)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[29]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],192),6)
e={}
e["pin_no"]="30"
e["texts"]={"I2C_SDA","SPI_MISO0","PA.3"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",3)
elseif o==1 then
fill_AU9100_SPI(e,t,"A",3,"SPI_MISO0",0)
fill_AU9100_SPI_IO(e,t,0,true)
elseif o==2 then
fill_AU9100_I2C(e,t,"A",3,"I2C_SDA",0)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[30]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],48),4)
e={}
e["pin_no"]="31"
e["texts"]={"SPI_SSB0","PA.2"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",2)
elseif o==1 then
fill_AU9100_SPI(e,t,"A",2,"SPI_SSB0",0)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"VDD33"}
fill_AU9100_Normal(e,t,nil,nil,"VDD33")
a[32]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],12),2)
e={}
e["pin_no"]="33"
e["texts"]={"I2C_SCL","SPI_SCLK","PA.1"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",1)
elseif o==1 then
fill_AU9100_SPI(e,t,"A",1,"SPI_SCLK",0)
elseif o==2 then
fill_AU9100_I2C(e,t,"A",1,"I2C_SCL",0)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],3),0)
e={}
e["pin_no"]="34"
e["texts"]={"MCLK","SPI_MOSI0","PA.0"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",0)
elseif o==1 then
fill_AU9100_SPI(e,t,"A",0,"SPI_MOSI0",0)
fill_AU9100_SPI_IO(e,t,0,false)
elseif o==2 then
fill_AU9100_I2S(e,t,"A",0,"MCLK",0)
else
fill_invalid_GPIO(e,t,"A",0)
end
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"VCCLDO"}
fill_AU9100_Normal(e,t,nil,nil,"VCCLDO")
a[35]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],805306368),28)
e={}
e["pin_no"]="36"
e["texts"]={"SDCLKn","SDCLK","TM0","PA.14"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",14)
elseif o==1 then
fill_AU9100_TM(e,t,"A",14,"TM0",0)
elseif o==2 then
fill_AU9100_ADC(e,t,"A",14,"SDCLK")
elseif o==3 then
fill_AU9100_ADC(e,t,"A",14,"SDCLKn")
else
fill_invalid_GPIO(e,t,"A",14)
end
a[36]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],201326592),26)
e={}
e["pin_no"]="37"
e["texts"]={"I2S_BCLK","SPKM","PWM1","PA.13"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",13)
elseif o==1 then
fill_AU9100_PWM(e,t,"A",13,"PWM1")
elseif o==2 then
fill_AU9100_DPWM(e,t,nil,nil,"SPKM")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_AU9100_I2S(e,t,"A",13,"I2S_BCLK",0)
else
fill_invalid_GPIO(e,t,"A",13)
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],50331648),24)
e={}
e["pin_no"]="38"
e["texts"]={"I2S_FS","SPKP","PWM0","PA.12"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",12)
elseif o==1 then
fill_AU9100_PWM(e,t,"A",12,"PWM0")
elseif o==2 then
fill_AU9100_DPWM(e,t,nil,nil,"SPKP")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_AU9100_I2S(e,t,"A",12,"I2S_FS",0)
else
fill_invalid_GPIO(e,t,"A",12)
end
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"XO32K"}
fill_AU9100_Normal(e,t,nil,nil,"XO32K")
e["direction"]=kPinDirection_PushPullOut
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"XI32K"}
fill_AU9100_Normal(e,t,nil,nil,"XI32K")
e["direction"]=kPinDirection_In
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"VSSA"}
fill_AU9100_Normal(e,t,nil,nil,"VSSA")
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"VMID"}
fill_AU9100_Normal(e,t,nil,nil,"VMID")
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"MIC+"}
fill_AU9100_Normal(e,t,nil,nil,"MIC+")
e["direction"]=kPinDirection_In
a[43]=e
e={}
e["pin_no"]="44"
e["texts"]={"MIC-"}
fill_AU9100_Normal(e,t,nil,nil,"MIC-")
e["direction"]=kPinDirection_In
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"MICBIAS"}
fill_AU9100_Normal(e,t,nil,nil,"MICBIAS")
e["direction"]=kPinDirection_PushPullOut
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"VCCA"}
fill_AU9100_Normal(e,t,nil,nil,"VCCA")
a[46]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],12582912),22)
e={}
e["pin_no"]="47"
e["texts"]={"UART_CTSn","I2S_SDO","I2C_SCL","PA.11"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",11)
elseif o==1 then
fill_AU9100_I2C(e,t,"A",11,"I2C_SCL",0)
elseif o==2 then
fill_AU9100_I2S(e,t,"A",11,"I2S_SDO",0)
elseif o==3 then
fill_AU9100_UART(e,t,"A",11,"UART_CTSn",0)
else
fill_invalid_GPIO(e,t,"A",11)
end
a[47]=e
local o=ext.rshift(ext.band(t["GCR_GPA_ALT"],3145728),20)
e={}
e["pin_no"]="48"
e["texts"]={"UART_RTSn","I2S_SDI","I2C_SDA","PA.10"}
if o==0 then
fill_AU9100_GPIO(e,t,"A",10)
elseif o==1 then
fill_AU9100_I2C(e,t,"A",10,"I2C_SDA",0)
elseif o==2 then
fill_AU9100_I2S(e,t,"A",10,"I2S_SDI",0)
elseif o==3 then
fill_AU9100_UART(e,t,"A",10,"UART_RTSn",0)
else
fill_invalid_GPIO(e,t,"A",10)
end
a[48]=e
return{name=i,information="",pins=a}
end
