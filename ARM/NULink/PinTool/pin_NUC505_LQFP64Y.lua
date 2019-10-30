local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC505.lua")
function get_chip_status_NUC505_LQFP64Y(i,o,t,e)
local a={}
local t=read_NUC505_Registers(i,o,t,e)
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
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],7340032),20)
e={}
e["pin_no"]="4"
e["texts"]={"PB.13","SPI1_MISO","USBH1_D-","UART2_nRTS","PWM_CH3"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",13)
elseif o==1 then
fill_NUC505_SPI(e,t,"B",13,"SPI1_MISO",1)
fill_NUC505_SPI_IO(e,t,1,true)
elseif o==2 then
fill_NUC505_USBH(e,t,"B",13,"USBH1_D-")
elseif o==3 then
fill_NUC505_UART(e,t,"B",13,"UART2_nRTS",2)
elseif o==4 then
fill_NUC505_PWM(e,t,"B",13,"PWM_CH3",3)
else
fill_invalid_GPIO(e,t,"B",13)
end
a[4]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],117440512),24)
e={}
e["pin_no"]="5"
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
a[5]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],1879048192),28)
e={}
e["pin_no"]="6"
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
a[6]=e
local o=ext.band(t["GCR_SYS_GPC_MFPL"],7)
e={}
e["pin_no"]="7"
e["texts"]={"PC.0","SD_CMD"}
if o==0 then
fill_NUC505_GPIO(e,t,"C",0)
elseif o==1 then
fill_NUC505_SD(e,t,"C",0,"SD_CMD")
else
fill_invalid_GPIO(e,t,"C",0)
end
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"VDD"}
fill_NUC505_Normal(e,t,nil,nil,"VDD")
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"VSS"}
fill_NUC505_Normal(e,t,nil,nil,"VSS")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"XT1_IN"}
fill_NUC505_Normal(e,t,nil,nil,"XT1_IN")
e["direction"]=kPinDirection_In
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"XT1_OUT"}
fill_NUC505_Normal(e,t,nil,nil,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"VDD12"}
fill_NUC505_Normal(e,t,nil,nil,"VDD12")
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"USB_D-"}
fill_NUC505_USBD(e,t,nil,nil,"USB_D-")
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"USB_D+"}
fill_NUC505_USBD(e,t,nil,nil,"USB_D+")
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"AVDDUSB"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDUSB")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"USB_REXT"}
fill_NUC505_Normal(e,t,nil,nil,"USB_REXT")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"VBAT"}
fill_NUC505_Normal(e,t,nil,nil,"VBAT")
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"RTC_RPWR"}
fill_NUC505_RTC(e,t,nil,nil,"RTC_RPWR")
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"RTC_nRWAKE"}
fill_NUC505_RTC(e,t,nil,nil,"RTC_nRWAKE")
a[19]=e
local o=ext.band(t["GCR_SYS_GPA_MFPH"],7)
e={}
e["pin_no"]="20"
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
a[20]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],112),4)
e={}
e["pin_no"]="21"
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
a[21]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],1792),8)
e={}
e["pin_no"]="22"
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
a[22]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],28672),12)
e={}
e["pin_no"]="23"
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
a[23]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],458752),16)
e={}
e["pin_no"]="24"
e["texts"]={"PA.12","SPIM_D2","TM0_CNT_OUT"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",12)
elseif o==1 then
fill_NUC505_SPIM(e,t,"A",12,"SPIM_D2")
elseif o==2 then
fill_NUC505_TM(e,t,"A",12,"TM0_CNT_OUT",0)
else
fill_invalid_GPIO(e,t,"A",12)
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],7340032),20)
e={}
e["pin_no"]="25"
e["texts"]={"PA.13","SPIM_D3","TM0_EXT","SD_nCD"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",13)
elseif o==1 then
fill_NUC505_SPIM(e,t,"A",13,"SPIM_D3")
elseif o==2 then
fill_NUC505_TM(e,t,"A",13,"TM0_EXT",0)
elseif o==4 then
fill_NUC505_SD(e,t,"A",13,"SD_nCD")
else
fill_invalid_GPIO(e,t,"A",13)
end
a[25]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],117440512),24)
e={}
e["pin_no"]="26"
e["texts"]={"PA.14","I2C0_SCL","SD_DAT0"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",14)
elseif o==2 then
fill_NUC505_I2C(e,t,"A",14,"I2C0_SCL",0)
elseif o==4 then
fill_NUC505_SD(e,t,"A",14,"SD_DAT0")
else
fill_invalid_GPIO(e,t,"A",14)
end
a[26]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPH"],1879048192),28)
e={}
e["pin_no"]="27"
e["texts"]={"PA.15","I2C0_SDA","SD_DAT1"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",15)
elseif o==2 then
fill_NUC505_I2C(e,t,"A",15,"I2C0_SDA",0)
elseif o==4 then
fill_NUC505_SD(e,t,"A",15,"SD_DAT1")
else
fill_invalid_GPIO(e,t,"A",15)
end
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"VDD"}
fill_NUC505_Normal(e,t,nil,nil,"VDD")
a[28]=e
local o=ext.band(t["GCR_SYS_GPB_MFPL"],7)
e={}
e["pin_no"]="29"
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
a[29]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],112),4)
e={}
e["pin_no"]="30"
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
a[30]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],1792),8)
e={}
e["pin_no"]="31"
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
a[31]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],28672),12)
e={}
e["pin_no"]="32"
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
a[32]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],458752),16)
e={}
e["pin_no"]="33"
e["texts"]={"SPI0_MOSI","SYSCFG[3],PB.4"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",4,"SYSCFG[3],PB.4")
elseif o==1 then
fill_NUC505_SPI(e,t,"B",4,"SPI0_MOSI",0)
fill_NUC505_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],7340032),20)
e={}
e["pin_no"]="34"
e["texts"]={"SD_nCD","SPI0_MISO","PB.5"}
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
a[34]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],117440512),24)
e={}
e["pin_no"]="35"
e["texts"]={"SD_DAT0","UART1_TXD","PB.6"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",6)
elseif o==3 then
fill_NUC505_UART(e,t,"B",6,"UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC505_SD(e,t,"B",6,"SD_DAT0")
else
fill_invalid_GPIO(e,t,"B",6)
end
a[35]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPL"],1879048192),28)
e={}
e["pin_no"]="36"
e["texts"]={"SD_DAT1","UART1_RXD","PB.7"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",7)
elseif o==3 then
fill_NUC505_UART(e,t,"B",7,"UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC505_SD(e,t,"B",7,"SD_DAT1")
else
fill_invalid_GPIO(e,t,"B",7)
end
a[36]=e
e={}
e["pin_no"]="37"
e["texts"]={"USB_VBUS"}
fill_NUC505_Normal(e,t,nil,nil,"USB_VBUS")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
a[37]=e
local o=ext.band(t["GCR_SYS_GPB_MFPH"],7)
e={}
e["pin_no"]="38"
e["texts"]={"SD_DAT2","UART1_nCTS","TM1_CNT_OUT","USBH_PWEN","PB.8"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",8)
elseif o==1 then
fill_NUC505_Normal(e,t,"B",8,"USBH_PWEN")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
elseif o==2 then
fill_NUC505_TM(e,t,"B",8,"TM1_CNT_OUT",1)
elseif o==3 then
fill_NUC505_UART(e,t,"B",8,"UART1_nCTS",1)
elseif o==4 then
fill_NUC505_SD(e,t,"B",8,"SD_DAT2")
else
fill_invalid_GPIO(e,t,"B",8)
end
a[38]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],112),4)
e={}
e["pin_no"]="39"
e["texts"]={"SD_DAT3","UART1_nRTS","TM1_EXT","USBH_OVD","PB.9"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",9)
elseif o==1 then
fill_NUC505_Normal(e,t,"B",9,"USBH_OVD")
e["highlight_color"]=kColor_USB
e["pin_bg_color"]=kBgColor_USB
elseif o==2 then
fill_NUC505_TM(e,t,"B",9,"TM1_EXT",1)
elseif o==3 then
fill_NUC505_UART(e,t,"B",9,"UART1_nRTS",1)
elseif o==4 then
fill_NUC505_SD(e,t,"B",9,"SD_DAT3")
else
fill_invalid_GPIO(e,t,"B",9)
end
a[39]=e
e={}
e["pin_no"]="40"
e["texts"]={"VSS"}
fill_NUC505_Normal(e,t,nil,nil,"VSS")
a[40]=e
e={}
e["pin_no"]="41"
e["texts"]={"AVDDHP"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDHP")
a[41]=e
e={}
e["pin_no"]="42"
e["texts"]={"LHPOUT"}
fill_NUC505_Normal(e,t,nil,nil,"LHPOUT")
e["direction"]=kPinDirection_PushPullOut
a[42]=e
e={}
e["pin_no"]="43"
e["texts"]={"RHPOUT"}
fill_NUC505_Normal(e,t,nil,nil,"RHPOUT")
e["direction"]=kPinDirection_PushPullOut
a[43]=e
e={}
e["pin_no"]="44"
e["texts"]={"AVSSHP"}
fill_NUC505_Normal(e,t,nil,nil,"AVSSHP")
a[44]=e
e={}
e["pin_no"]="45"
e["texts"]={"VMID"}
fill_NUC505_Normal(e,t,nil,nil,"VMID")
a[45]=e
e={}
e["pin_no"]="46"
e["texts"]={"AVDDCODEC"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDCODEC")
a[46]=e
e={}
e["pin_no"]="47"
e["texts"]={"AVDDADC"}
fill_NUC505_Normal(e,t,nil,nil,"AVDDADC")
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"AVSSADC"}
fill_NUC505_Normal(e,t,nil,nil,"AVSSADC")
a[48]=e
local o=ext.band(t["GCR_SYS_GPA_MFPL"],7)
e={}
e["pin_no"]="49"
e["texts"]={"ADC_CH0","PA.0"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",0)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",0,"ADC_CH0")
else
fill_invalid_GPIO(e,t,"A",0)
end
a[49]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],112),4)
e={}
e["pin_no"]="50"
e["texts"]={"ADC_CH1","PA.1"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",1)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",1,"ADC_CH1")
else
fill_invalid_GPIO(e,t,"A",1)
end
a[50]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],1792),8)
e={}
e["pin_no"]="51"
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
a[51]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],28672),12)
e={}
e["pin_no"]="52"
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
a[52]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],458752),16)
e={}
e["pin_no"]="53"
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
a[53]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],7340032),20)
e={}
e["pin_no"]="54"
e["texts"]={"ADC_CH5","PA.5"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",5)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",5,"ADC_CH5")
else
fill_invalid_GPIO(e,t,"A",5)
end
a[54]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],117440512),24)
e={}
e["pin_no"]="55"
e["texts"]={"ADC_CH6","PA.6"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",6)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",6,"ADC_CH6")
else
fill_invalid_GPIO(e,t,"A",6)
end
a[55]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPA_MFPL"],1879048192),28)
e={}
e["pin_no"]="56"
e["texts"]={"ADC_CH7","PA.7"}
if o==0 then
fill_NUC505_GPIO(e,t,"A",7)
elseif o==1 then
fill_NUC505_ADC(e,t,"A",7,"ADC_CH7")
else
fill_invalid_GPIO(e,t,"A",7)
end
a[56]=e
e={}
e["pin_no"]="57"
e["texts"]={"VDD12"}
fill_NUC505_Normal(e,t,nil,nil,"VDD12")
a[57]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],1792),8)
e={}
e["pin_no"]="58"
e["texts"]={"PWM_CH0","UART2_TXD","I2C1_SCL","SPI1_SS","PB.10"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",10)
elseif o==1 then
fill_NUC505_SPI(e,t,"B",10,"SPI1_SS",1)
elseif o==2 then
fill_NUC505_I2C(e,t,"B",10,"I2C1_SCL",1)
elseif o==3 then
fill_NUC505_UART(e,t,"B",10,"UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC505_PWM(e,t,"B",10,"PWM_CH0",0)
else
fill_invalid_GPIO(e,t,"B",10)
end
a[58]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],28672),12)
e={}
e["pin_no"]="59"
e["texts"]={"PWM_CH1","UART2_RXD","I2C1_SDA","SPI1_CLK","PB.11"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",11)
elseif o==1 then
fill_NUC505_SPI(e,t,"B",11,"SPI1_CLK",1)
elseif o==2 then
fill_NUC505_I2C(e,t,"B",11,"I2C1_SDA",1)
elseif o==3 then
fill_NUC505_UART(e,t,"B",11,"UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC505_PWM(e,t,"B",11,"PWM_CH1",1)
else
fill_invalid_GPIO(e,t,"B",11)
end
a[59]=e
local o=ext.rshift(ext.band(t["GCR_SYS_GPB_MFPH"],458752),16)
e={}
e["pin_no"]="60"
e["texts"]={"PWM_CH2","UART2_nCTS","USBH1_D+","SPI1_MOSI","PB.12"}
if o==0 then
fill_NUC505_GPIO(e,t,"B",12)
elseif o==1 then
fill_NUC505_SPI(e,t,"B",12,"SPI1_MOSI",1)
fill_NUC505_SPI_IO(e,t,1,false)
elseif o==2 then
fill_NUC505_USBH(e,t,"B",12,"USBH1_D+")
elseif o==3 then
fill_NUC505_UART(e,t,"B",12,"UART2_nCTS",2)
elseif o==4 then
fill_NUC505_PWM(e,t,"B",12,"PWM_CH2",2)
else
fill_invalid_GPIO(e,t,"B",12)
end
a[60]=e
e={}
e["pin_no"]="61"
e["texts"]={"VDD"}
fill_NUC505_Normal(e,t,nil,nil,"VDD")
a[61]=e
e={}
e["pin_no"]="62"
e["texts"]={"VDD"}
fill_NUC505_Normal(e,t,nil,nil,"VDD")
a[62]=e
e={}
e["pin_no"]="63"
e["texts"]={"LDO_CAP"}
fill_NUC505_Normal(e,t,nil,nil,"LDO_CAP")
a[63]=e
e={}
e["pin_no"]="64"
e["texts"]={"VSS"}
fill_NUC505_Normal(e,t,nil,nil,"VSS")
a[64]=e
return{name=i,information="",pins=a}
end
