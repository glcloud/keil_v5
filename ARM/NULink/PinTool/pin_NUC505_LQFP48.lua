local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC505.lua")
function get_chip_status_NUC505_LQFP48(i,e,o,t)
local a={}
local t=read_NUC505_Registers(i,e,o,t)
local e
e={}
e["pin_no"]="1"
e["texts"]={"nRESET"}
fill_NUC505_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[1]=e
local o=ext.band(t["GCR_SYS_GPD_MFPL"],7)
e={}
e["pin_no"]="2"
e["texts"]={"PD.0,ICE_CLK","I2C0_SCL"}
if o==0 then
fill_NUC505_GPIO(e,t,"D",0,"PD.0,ICE_CLK")
elseif o==2 then
fill_NUC505_I2C(e,t,"D",0,"I2C0_SCL",0)
else
fill_invalid_GPIO(e,t,"D",0)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPD_MFPL"],112),4)
e={}
e["pin_no"]="3"
e["texts"]={"PD.1,ICE_DAT","I2C0_SDA"}
if o==0 then
fill_NUC505_GPIO(e,t,"D",1,"PD.1,ICE_DAT")
elseif o==2 then
fill_NUC505_I2C(e,t,"D",1,"I2C0_SDA",0)
else
fill_invalid_GPIO(e,t,"D",1)
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],117440512),24)
e={}
e["pin_no"]="4"
e["texts"]={"PB.14","USBH1_D+","I2C1_SCL"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",14)
elseif o==1 then
fill_NUC505_USBH(e,t,"B",14,"USBH1_D+")
elseif o==2 then
fill_NUC505_I2C(e,t,"B",14,"I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,"B",14)
end
a[4]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],1879048192),28)
e={}
e["pin_no"]="5"
e["texts"]={"PB.15","USBH1_D-","I2C1_SDA"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",15)
elseif o==1 then
fill_NUC505_USBH(e,t,"B",15,"USBH1_D-")
elseif o==2 then
fill_NUC505_I2C(e,t,"B",15,"I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"B",15)
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"VDD"}
fill_NUC505_Normal(e,t,nil,nil,"VDD")
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"XT1_IN"}
fill_NUC505_Normal(e,t,nil,nil,"XT1_IN")
e["direction"]=kPinDirection_In
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"XT1_OUT"}
fill_NUC505_Normal(e,t,nil,nil,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"VDD12"}
fill_NUC505_Normal(e,t,nil,nil,"VDD12")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"USB_D-"}
fill_NUC505_USBD(e,t,nil,nil,"USB_D-")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"USB_D+"}
fill_NUC505_USBD(e,t,nil,nil,"USB_D+")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"AVDDUSB"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDUSB")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"USB_REXT"}
fill_NUC505_Normal(e,t,nil,nil,"USB_REXT")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[13]=e
local o=ext.band(t["GCR_SYS_GPA_MFPH"],7)
e={}
e["pin_no"]="14"
e["texts"]={"PA.8","SPIM_SS","I2S_LRCLK","UART1_TXD"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",8)
elseif o==1 then
fill_NUC505_SPIM(e,t,"A",8,"SPIM_SS")
elseif o==2 then
fill_NUC505_I2S(e,t,"A",8,"I2S_LRCLK",0)
elseif o==3 then
fill_NUC505_UART(e,t,"A",8,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"A",8)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],112),4)
e={}
e["pin_no"]="15"
e["texts"]={"PA.9,SYSCFG[0]","SPIM_CLK","I2S_BCLK","UART1_RXD"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",9,"PA.9,SYSCFG[0]")
elseif o==1 then
fill_NUC505_SPIM(e,t,"A",9,"SPIM_CLK")
elseif o==2 then
fill_NUC505_I2S(e,t,"A",9,"I2S_BCLK",0)
elseif o==3 then
fill_NUC505_UART(e,t,"A",9,"UART1_RXD",1)
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",9)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],1792),8)
e={}
e["pin_no"]="16"
e["texts"]={"PA.10,SYSCFG[1]","SPIM_MOSI","I2C1_SCL","SD_CLK"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",10,"PA.10,SYSCFG[1]")
elseif o==1 then
fill_NUC505_SPIM(e,t,"A",10,"SPIM_MOSI")
elseif o==2 then
fill_NUC505_I2C(e,t,"A",10,"I2C1_SCL",1)
elseif o==4 then
fill_NUC505_SD(e,t,"A",10,"SD_CLK")
else
fill_invalid_GPIO(e,t,"A",10)
end
a[16]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],28672),12)
e={}
e["pin_no"]="17"
e["texts"]={"PA.11","SPIM_MISO","I2C1_SDA","SD_CMD"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",11)
elseif o==1 then
fill_NUC505_SPIM(e,t,"A",11,"SPIM_MISO")
elseif o==2 then
fill_NUC505_I2C(e,t,"A",11,"I2C1_SDA",1)
elseif o==4 then
fill_NUC505_SD(e,t,"A",11,"SD_CMD")
else
fill_invalid_GPIO(e,t,"A",11)
end
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"VDD"}
fill_NUC505_Normal(e,t,nil,nil,"VDD")
a[18]=e
local o=ext.band(t["GCR_SYS_GPB_MFPL"],7)
e={}
e["pin_no"]="19"
e["texts"]={"PB.0","I2C0_SCL","UART0_TXD","SD_DAT2"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",0)
elseif o==2 then
fill_NUC505_I2C(e,t,"B",0,"I2C0_SCL",0)
elseif o==3 then
fill_NUC505_UART(e,t,"B",0,"UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC505_SD(e,t,"B",0,"SD_DAT2")
else
fill_invalid_GPIO(e,t,"B",0)
end
a[19]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],112),4)
e={}
e["pin_no"]="20"
e["texts"]={"PB.1","I2C0_SDA","UART0_RXD","SD_DAT3"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",1)
elseif o==2 then
fill_NUC505_I2C(e,t,"B",1,"I2C0_SDA",0)
elseif o==3 then
fill_NUC505_UART(e,t,"B",1,"UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC505_SD(e,t,"B",1,"SD_DAT3")
else
fill_invalid_GPIO(e,t,"B",1)
end
a[20]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],1792),8)
e={}
e["pin_no"]="21"
e["texts"]={"PB.2","SPI0_SS","SD_CMD"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",2)
elseif o==1 then
fill_NUC505_SPI(e,t,"B",2,"SPI0_SS",0)
elseif o==4 then
fill_NUC505_SD(e,t,"B",2,"SD_CMD")
else
fill_invalid_GPIO(e,t,"B",2)
end
a[21]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],28672),12)
e={}
e["pin_no"]="22"
e["texts"]={"PB.3,SYSCFG[2]","SPI0_CLK","SD_CLK"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",3,"PB.3,SYSCFG[2]")
elseif o==1 then
fill_NUC505_SPI(e,t,"B",3,"SPI0_CLK",0)
elseif o==4 then
fill_NUC505_SD(e,t,"B",3,"SD_CLK")
else
fill_invalid_GPIO(e,t,"B",3)
end
a[22]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],458752),16)
e={}
e["pin_no"]="23"
e["texts"]={"PB.4,SYSCFG[3]","SPI0_MOSI"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",4,"PB.4,SYSCFG[3]")
elseif o==1 then
fill_NUC505_SPI(e,t,"B",4,"SPI0_MOSI",0)
fill_NUC505_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[23]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],7340032),20)
e={}
e["pin_no"]="24"
e["texts"]={"PB.5","SPI0_MISO","SD_nCD"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",5)
elseif o==1 then
fill_NUC505_SPI(e,t,"B",5,"SPI0_MISO",0)
fill_NUC505_SPI_IO(e,t,0,true)
elseif o==4 then
fill_NUC505_SD(e,t,"B",5,"SD_nCD")
else
fill_invalid_GPIO(e,t,"B",5)
end
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"USB_VBUS"}
fill_NUC505_Normal(e,t,nil,nil,"USB_VBUS")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"VSS"}
fill_NUC505_Normal(e,t,nil,nil,"VSS")
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"AVDDHP"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDHP")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"LHPOUT"}
fill_NUC505_Normal(e,t,nil,nil,"LHPOUT")
e["direction"]=kPinDirection_PushPullOut
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"RHPOUT"}
fill_NUC505_Normal(e,t,nil,nil,"RHPOUT")
e["direction"]=kPinDirection_PushPullOut
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"AVSSHP"}
fill_NUC505_Normal(e,t,nil,nil,"AVSSHP")
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"VMID"}
fill_NUC505_Normal(e,t,nil,nil,"VMID")
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"AVDDCODEC"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDCODEC")
a[32]=e
e={}
e["pin_no"]="33"
e["texts"]={"MIC0_P"}
fill_NUC505_Normal(e,t,nil,nil,"MIC0_P")
e["direction"]=kPinDirection_In
a[33]=e
e={}
e["pin_no"]="34"
e["texts"]={"MIC0_N"}
fill_NUC505_Normal(e,t,nil,nil,"MIC0_N")
e["direction"]=kPinDirection_In
a[34]=e
e={}
e["pin_no"]="35"
e["texts"]={"MIC_BIAS"}
fill_NUC505_Normal(e,t,nil,nil,"MIC_BIAS")
a[35]=e
e={}
e["pin_no"]="36"
e["texts"]={"VDD12"}
fill_NUC505_Normal(e,t,nil,nil,"VDD12")
a[36]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPD_MFPL"],458752),16)
e={}
e["pin_no"]="37"
e["texts"]={"RLINEIN","PD.4"}
if o==0 then
fill_NUC505_GPIO(e,t,"D",4)
elseif o==1 then
fill_NUC505_Normal(e,t,"D",4,"RLINEIN")
else
fill_invalid_GPIO(e,t,"D",4)
end
a[37]=e
e={}
e["pin_no"]="38"
e["texts"]={"AVDDADC"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDADC")
a[38]=e
e={}
e["pin_no"]="39"
e["texts"]={"AVSSADC"}
fill_NUC505_Normal(e,t,nil,nil,"AVSSADC")
a[39]=e
local o=ext.band(t["GCR_SYS_GPA_MFPL"],7)
e={}
e["pin_no"]="40"
e["texts"]={"ADC_CH0","PA.0"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",0)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",0,"ADC_CH0")
else
fill_invalid_GPIO(e,t,"A",0)
end
a[40]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],112),4)
e={}
e["pin_no"]="41"
e["texts"]={"ADC_CH1","PA.1"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",1)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",1,"ADC_CH1")
else
fill_invalid_GPIO(e,t,"A",1)
end
a[41]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],1792),8)
e={}
e["pin_no"]="42"
e["texts"]={"I2S_MCLK","ADC_CH2","PA.2"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",2)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",2,"ADC_CH2")
elseif o==2 then
fill_NUC505_I2S(e,t,"A",2,"I2S_MCLK",0)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[42]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],28672),12)
e={}
e["pin_no"]="43"
e["texts"]={"I2S_DI","ADC_CH3","PA.3"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",3)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",3,"ADC_CH3")
elseif o==2 then
fill_NUC505_I2S(e,t,"A",3,"I2S_DI",0)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[43]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],458752),16)
e={}
e["pin_no"]="44"
e["texts"]={"I2S_DO","ADC_CH4","PA.4"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",4)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",4,"ADC_CH4")
elseif o==2 then
fill_NUC505_I2S(e,t,"A",4,"I2S_DO",0)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"VDD12"}
fill_NUC505_Normal(e,t,nil,nil,"VDD12")
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"VDD"}
fill_NUC505_Normal(e,t,nil,nil,"VDD")
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"LDO_CAP"}
fill_NUC505_Normal(e,t,nil,nil,"LDO_CAP")
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"VSS"}
fill_NUC505_Normal(e,t,nil,nil,"VSS")
a[48]=e
return{name=i,information="",pins=a}
end
