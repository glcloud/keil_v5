local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."Mini57.lua")
function get_chip_status_Mini57_DE_TSSOP28(i,e,e)
local a={}
local t=read_Mini57_Registers()
local e
e={}
e["pin_no"]="1"
e["texts"]={"VDD"}
fill_Mini57_Normal(e,t,nil,nil,"VDD")
a[1]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFP"],251658240),24)
e={}
e["pin_no"]="2"
e["texts"]={"PD.6","UART0_RXD"}
if o==0 then
fill_Mini57_GPIO(e,t,"D",6)
elseif o==11 then
fill_Mini57_UART(e,t,"D",6,"UART0_RXD",0)
fill_Mini57_UART_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"D",6)
end
a[2]=e
local o=ext.band(t["SYS_SYS_GPB_MFP"],15)
e={}
e["pin_no"]="3"
e["texts"]={"PB.0","ADC0_CH0","ACMP0_P0","ECAP_P0"}
if o==0 then
fill_Mini57_GPIO(e,t,"B",0)
elseif o==2 then
fill_Mini57_ADC(e,t,"B",0,"ADC0_CH0",0)
elseif o==4 then
fill_Mini57_ACMP(e,t,"B",0,"ACMP0_P0",0)
elseif o==7 then
fill_Mini57_ECAP(e,t,"B",0,"ECAP_P0")
else
fill_invalid_GPIO(e,t,"B",0)
end
a[3]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFP"],240),4)
e={}
e["pin_no"]="4"
e["texts"]={"PB.1","ADC0_CH1","ACMP0_P1","ECAP_P1"}
if o==0 then
fill_Mini57_GPIO(e,t,"B",1)
elseif o==2 then
fill_Mini57_ADC(e,t,"B",1,"ADC0_CH1",0)
elseif o==4 then
fill_Mini57_ACMP(e,t,"B",1,"ACMP0_P1",0)
elseif o==7 then
fill_Mini57_ECAP(e,t,"B",1,"ECAP_P1")
else
fill_invalid_GPIO(e,t,"B",1)
end
a[4]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFP"],3840),8)
e={}
e["pin_no"]="5"
e["texts"]={"PB.2","ADC0_CH2","BPWM_CH1","ACMP0_P2","ECAP_P2"}
if o==0 then
fill_Mini57_GPIO(e,t,"B",2)
elseif o==2 then
fill_Mini57_ADC(e,t,"B",2,"ADC0_CH2",0)
elseif o==3 then
fill_Mini57_BPWM(e,t,"B",2,"BPWM_CH1",0,1)
elseif o==4 then
fill_Mini57_ACMP(e,t,"B",2,"ACMP0_P2",0)
elseif o==7 then
fill_Mini57_ECAP(e,t,"B",2,"ECAP_P2")
else
fill_invalid_GPIO(e,t,"B",2)
end
a[5]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFP"],983040),16)
e={}
e["pin_no"]="6"
e["texts"]={"PB.4","ADC1_CH0","ACMP0_N","TM1"}
if o==0 then
fill_Mini57_GPIO(e,t,"B",4)
elseif o==2 then
fill_Mini57_ADC(e,t,"B",4,"ADC1_CH0",1)
elseif o==4 then
fill_Mini57_ACMP(e,t,"B",4,"ACMP0_N",0)
elseif o==7 then
fill_Mini57_TM(e,t,"B",4,"TM1",1)
else
fill_invalid_GPIO(e,t,"B",4)
end
a[6]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFP"],240),4)
e={}
e["pin_no"]="7"
e["texts"]={"PC.1","ADC0_CH4","STADC","ACMP0_P3","ACMP1_P1","SPI0_MOSI","SPI1_MISO"}
if o==0 then
fill_Mini57_GPIO(e,t,"C",1)
elseif o==2 then
fill_Mini57_ADC(e,t,"C",1,"ADC0_CH4",0)
elseif o==3 then
fill_Mini57_ADC(e,t,"C",1,"STADC")
elseif o==4 then
fill_Mini57_ACMP(e,t,"C",1,"ACMP0_P3",0)
elseif o==5 then
fill_Mini57_ACMP(e,t,"C",1,"ACMP1_P1",1)
elseif o==9 then
fill_Mini57_SPI(e,t,"C",1,"SPI0_MOSI",0)
fill_Mini57_SPI_IO(e,t,0,false)
elseif o==10 then
fill_Mini57_SPI(e,t,"C",1,"SPI1_MISO",1)
fill_Mini57_SPI_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"C",1)
end
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"nRESET"}
fill_Mini57_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[8]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPB_MFP"],61440),12)
e={}
e["pin_no"]="9"
e["texts"]={"PB.3","ACMP1_N","PGA_I","TM0"}
if o==0 then
fill_Mini57_GPIO(e,t,"B",3)
elseif o==5 then
fill_Mini57_ACMP(e,t,"B",3,"ACMP1_N",1)
elseif o==6 then
fill_Mini57_PGA(e,t,"B",3,"PGA_I")
elseif o==7 then
fill_Mini57_TM(e,t,"B",3,"TM0",0)
else
fill_invalid_GPIO(e,t,"B",3)
end
a[9]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFP"],3840),8)
e={}
e["pin_no"]="10"
e["texts"]={"PC.2","ADC1_CH2","BRAKE","CCAP_P1","I2C1_SDA","SPI0_MISO","SPI1_MOSI","UART1_RXD"}
if o==0 then
fill_Mini57_GPIO(e,t,"C",2)
elseif o==2 then
fill_Mini57_ADC(e,t,"C",2,"ADC1_CH2",1)
elseif o==3 then
fill_Mini57_EPWM(e,t,"C",2,"BRAKE",0)
elseif o==7 then
fill_Mini57_CCAP(e,t,"C",2,"CCAP_P1")
elseif o==8 then
fill_Mini57_I2C(e,t,"C",2,"I2C1_SDA",1)
elseif o==9 then
fill_Mini57_SPI(e,t,"C",2,"SPI0_MISO",0)
fill_Mini57_SPI_IO(e,t,0,true)
elseif o==10 then
fill_Mini57_SPI(e,t,"C",2,"SPI1_MOSI",1)
fill_Mini57_SPI_IO(e,t,1,false)
elseif o==11 then
fill_Mini57_UART(e,t,"C",2,"UART1_RXD",1)
fill_Mini57_UART_IO(e,t,1,false)
else
fill_invalid_GPIO(e,t,"C",2)
end
a[10]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFP"],3840),8)
e={}
e["pin_no"]="11"
e["texts"]={"PD.2","ICE_DAT","ADC1_CH1","CCAP_P0","I2C0_SDA","SPI0_MOSI","SPI1_MISO","UART0_RXD"}
if o==0 then
fill_Mini57_GPIO(e,t,"D",2)
elseif o==1 then
fill_Mini57_Normal(e,t,"D",2,"ICE_DAT")
e["direction"]=kPinDirection_Bi
elseif o==2 then
fill_Mini57_ADC(e,t,"D",2,"ADC1_CH1",1)
elseif o==7 then
fill_Mini57_CCAP(e,t,"D",2,"CCAP_P0")
elseif o==8 then
fill_Mini57_I2C(e,t,"D",2,"I2C0_SDA",0)
elseif o==9 then
fill_Mini57_SPI(e,t,"D",2,"SPI0_MOSI",0)
fill_Mini57_SPI_IO(e,t,0,false)
elseif o==10 then
fill_Mini57_SPI(e,t,"D",2,"SPI1_MISO",1)
fill_Mini57_SPI_IO(e,t,1,true)
elseif o==11 then
fill_Mini57_UART(e,t,"D",2,"UART0_RXD",0)
fill_Mini57_UART_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"D",2)
end
a[11]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFP"],61440),12)
e={}
e["pin_no"]="12"
e["texts"]={"PD.3","BPWM_CH1","UART1_TXD"}
if o==0 then
fill_Mini57_GPIO(e,t,"D",3)
elseif o==3 then
fill_Mini57_BPWM(e,t,"D",3,"BPWM_CH1",0,1)
elseif o==11 then
fill_Mini57_UART(e,t,"D",3,"UART1_TXD",1)
fill_Mini57_UART_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"D",3)
end
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"NC"}
fill_Mini57_Normal(e,t,nil,nil,"NC")
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"NC"}
fill_Mini57_Normal(e,t,nil,nil,"NC")
a[14]=e
local o=ext.band(t["SYS_SYS_GPC_MFP"],15)
e={}
e["pin_no"]="15"
e["texts"]={"UART1_TXD","SPI1_CLK","SPI0_SS","I2C1_SCL","ACMP1_P0","BPWM_CH0","ADC0_CH3","PC.0"}
if o==0 then
fill_Mini57_GPIO(e,t,"C",0)
elseif o==2 then
fill_Mini57_ADC(e,t,"C",0,"ADC0_CH3",0)
elseif o==3 then
fill_Mini57_BPWM(e,t,"C",0,"BPWM_CH0",0,0)
elseif o==5 then
fill_Mini57_ACMP(e,t,"C",0,"ACMP1_P0",1)
elseif o==8 then
fill_Mini57_I2C(e,t,"C",0,"I2C1_SCL",1)
elseif o==9 then
fill_Mini57_SPI(e,t,"C",0,"SPI0_SS",0)
elseif o==10 then
fill_Mini57_SPI(e,t,"C",0,"SPI1_CLK",1)
elseif o==11 then
fill_Mini57_UART(e,t,"C",0,"UART1_TXD",1)
fill_Mini57_UART_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"C",0)
end
a[15]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFP"],983040),16)
e={}
e["pin_no"]="16"
e["texts"]={"UART1_RXD","BPWM_CH0","PD.4"}
if o==0 then
fill_Mini57_GPIO(e,t,"D",4)
elseif o==3 then
fill_Mini57_BPWM(e,t,"D",4,"BPWM_CH0",0,0)
elseif o==11 then
fill_Mini57_UART(e,t,"D",4,"UART1_RXD",1)
fill_Mini57_UART_IO(e,t,1,false)
else
fill_invalid_GPIO(e,t,"D",4)
end
a[16]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFP"],240),4)
e={}
e["pin_no"]="17"
e["texts"]={"UART0_TXD","SPI1_SS","SPI0_CLK","I2C0_SCL","ACMP1_P2","ICE_CLK","PD.1"}
if o==0 then
fill_Mini57_GPIO(e,t,"D",1)
elseif o==1 then
fill_Mini57_Normal(e,t,"D",1,"ICE_CLK")
e["direction"]=kPinDirection_In
elseif o==5 then
fill_Mini57_ACMP(e,t,"D",1,"ACMP1_P2",1)
elseif o==8 then
fill_Mini57_I2C(e,t,"D",1,"I2C0_SCL",0)
elseif o==9 then
fill_Mini57_SPI(e,t,"D",1,"SPI0_CLK",0)
elseif o==10 then
fill_Mini57_SPI(e,t,"D",1,"SPI1_SS",1)
elseif o==11 then
fill_Mini57_UART(e,t,"D",1,"UART0_TXD",0)
fill_Mini57_UART_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"D",1)
end
a[17]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFP"],61440),12)
e={}
e["pin_no"]="18"
e["texts"]={"SPI1_SS","SPI0_CLK","PGA_O","ACMP1_O","PC.3"}
if o==0 then
fill_Mini57_GPIO(e,t,"C",3)
elseif o==5 then
fill_Mini57_ACMP(e,t,"C",3,"ACMP1_O",1)
elseif o==6 then
fill_Mini57_PGA(e,t,"C",3,"PGA_O")
elseif o==9 then
fill_Mini57_SPI(e,t,"C",3,"SPI0_CLK",0)
elseif o==10 then
fill_Mini57_SPI(e,t,"C",3,"SPI1_SS",1)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[18]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPD_MFP"],15728640),20)
e={}
e["pin_no"]="19"
e["texts"]={"UART0_TXD","PD.5"}
if o==0 then
fill_Mini57_GPIO(e,t,"D",5)
elseif o==11 then
fill_Mini57_UART(e,t,"D",5,"UART0_TXD",0)
fill_Mini57_UART_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"D",5)
end
a[19]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFP"],15728640),20)
e={}
e["pin_no"]="20"
e["texts"]={"ACMP0_O","EPWM_CH5","XT_OUT","PA.5"}
if o==0 then
fill_Mini57_GPIO(e,t,"A",5)
elseif o==1 then
fill_Mini57_Normal(e,t,"A",5,"XT_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Mini57_EPWM(e,t,"A",5,"EPWM_CH5",0,5)
elseif o==4 then
fill_Mini57_ACMP(e,t,"A",5,"ACMP0_O",0)
else
fill_invalid_GPIO(e,t,"A",5)
end
a[20]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFP"],983040),16)
e={}
e["pin_no"]="21"
e["texts"]={"EPWM_CH4","XT_IN","PA.4"}
if o==0 then
fill_Mini57_GPIO(e,t,"A",4)
elseif o==1 then
fill_Mini57_Normal(e,t,"A",4,"XT_IN")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_Mini57_EPWM(e,t,"A",4,"EPWM_CH4",0,4)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[21]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFP"],61440),12)
e={}
e["pin_no"]="22"
e["texts"]={"UART0_TXD","SPI1_SS","SPI0_CLK","I2C0_SCL","EPWM_CH3","PA.3"}
if o==0 then
fill_Mini57_GPIO(e,t,"A",3)
elseif o==3 then
fill_Mini57_EPWM(e,t,"A",3,"EPWM_CH3",0,3)
elseif o==8 then
fill_Mini57_I2C(e,t,"A",3,"I2C0_SCL",0)
elseif o==9 then
fill_Mini57_SPI(e,t,"A",3,"SPI0_CLK",0)
elseif o==10 then
fill_Mini57_SPI(e,t,"A",3,"SPI1_SS",1)
elseif o==11 then
fill_Mini57_UART(e,t,"A",3,"UART0_TXD",0)
fill_Mini57_UART_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"A",3)
end
a[22]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFP"],3840),8)
e={}
e["pin_no"]="23"
e["texts"]={"UART0_RXD","SPI1_MISO","SPI0_MOSI","I2C0_SDA","EPWM_CH2","PA.2"}
if o==0 then
fill_Mini57_GPIO(e,t,"A",2)
elseif o==3 then
fill_Mini57_EPWM(e,t,"A",2,"EPWM_CH2",0,2)
elseif o==8 then
fill_Mini57_I2C(e,t,"A",2,"I2C0_SDA",0)
elseif o==9 then
fill_Mini57_SPI(e,t,"A",2,"SPI0_MOSI",0)
fill_Mini57_SPI_IO(e,t,0,false)
elseif o==10 then
fill_Mini57_SPI(e,t,"A",2,"SPI1_MISO",1)
fill_Mini57_SPI_IO(e,t,1,true)
elseif o==11 then
fill_Mini57_UART(e,t,"A",2,"UART0_RXD",0)
fill_Mini57_UART_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"A",2)
end
a[23]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPA_MFP"],240),4)
e={}
e["pin_no"]="24"
e["texts"]={"UART1_RXD","SPI1_MOSI","SPI0_MISO","I2C1_SDA","EPWM_CH1","PA.1"}
if o==0 then
fill_Mini57_GPIO(e,t,"A",1)
elseif o==3 then
fill_Mini57_EPWM(e,t,"A",1,"EPWM_CH1",0,1)
elseif o==8 then
fill_Mini57_I2C(e,t,"A",1,"I2C1_SDA",1)
elseif o==9 then
fill_Mini57_SPI(e,t,"A",1,"SPI0_MISO",0)
fill_Mini57_SPI_IO(e,t,0,true)
elseif o==10 then
fill_Mini57_SPI(e,t,"A",1,"SPI1_MOSI",1)
fill_Mini57_SPI_IO(e,t,1,false)
elseif o==11 then
fill_Mini57_UART(e,t,"A",1,"UART1_RXD",1)
fill_Mini57_UART_IO(e,t,1,false)
else
fill_invalid_GPIO(e,t,"A",1)
end
a[24]=e
local o=ext.band(t["SYS_SYS_GPA_MFP"],15)
e={}
e["pin_no"]="25"
e["texts"]={"UART1_TXD","SPI1_CLK","SPI0_SS","I2C1_SCL","EPWM_CH0","CLKO","PA.0"}
if o==0 then
fill_Mini57_GPIO(e,t,"A",0)
elseif o==1 then
fill_Mini57_CLKO(e,t,"A",0,"CLKO")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_Mini57_EPWM(e,t,"A",0,"EPWM_CH0",0,0)
elseif o==8 then
fill_Mini57_I2C(e,t,"A",0,"I2C1_SCL",1)
elseif o==9 then
fill_Mini57_SPI(e,t,"A",0,"SPI0_SS",0)
elseif o==10 then
fill_Mini57_SPI(e,t,"A",0,"SPI1_CLK",1)
elseif o==11 then
fill_Mini57_UART(e,t,"A",0,"UART1_TXD",1)
fill_Mini57_UART_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"A",0)
end
a[25]=e
local o=ext.rshift(ext.band(t["SYS_SYS_GPC_MFP"],983040),16)
e={}
e["pin_no"]="26"
e["texts"]={"ECAP_P3","PC.4"}
if o==0 then
fill_Mini57_GPIO(e,t,"C",4)
elseif o==7 then
fill_Mini57_ECAP(e,t,"C",4,"ECAP_P3")
else
fill_invalid_GPIO(e,t,"C",4)
end
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"LDO_CAP"}
fill_Mini57_Normal(e,t,nil,nil,"LDO_CAP")
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"VSS"}
fill_Mini57_Normal(e,t,nil,nil,"VSS")
a[28]=e
return{name=i,information="",pins=a}
end
