local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC123.lua")
function get_chip_status_NUC123_AE_QFN33(i,e,t,o)
local a={}
local t=read_NUC123_Registers(i,e,t,o)
local e
local o=ext.band(t["GCR_MFP_CSS"],1)
e={}
e["pin_no"]="1"
e["texts"]={"PB.14","/INT0"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPB_MFPH"],117440512),24)
if a==0 then
fill_NUC123_GPIO(e,t,"B",14)
elseif a==1 then
fill_NUC123_Normal(e,t,"B",14,"/INT0")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",14)
end
else
local a=ext.rshift(ext.band(t["GCR_GPB_MFP"],16384),14)
if a==0 then
fill_NUC123_GPIO(e,t,"B",14)
elseif a==1 then
fill_NUC123_Normal(e,t,"B",14,"/INT0")
e["direction"]=kPinDirection_In
end
end
a[1]=e
e={}
e["pin_no"]="2"
e["texts"]={"PA.11","SPICLK1","MOSI20","I2C1SCL"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPA_MFPH"],28672),12)
if a==0 then
fill_NUC123_GPIO(e,t,"A",11)
elseif a==2 then
fill_NUC123_SPI(e,t,"A",11,"SPICLK1",1)
elseif a==3 then
fill_NUC123_SPI(e,t,"A",11,"MOSI20",2)
fill_NUC123_SPI_IO(e,t,2,false)
elseif a==1 then
fill_NUC123_I2C(e,t,"A",11,"I2C1SCL",1)
else
fill_invalid_GPIO(e,t,"A",11)
end
else
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],2048),11)
local a=ext.rshift(ext.band(t["GCR_ALT_MFP"],2048),11)
if a==0 and o==0 then
fill_NUC123_GPIO(e,t,"A",11,nil,"GCR_ALT_MFP")
elseif a==1 and o==0 then
fill_NUC123_SPI(e,t,"A",11,"SPICLK1",1,"GCR_ALT_MFP")
elseif a==1 and o==1 then
fill_NUC123_SPI(e,t,"A",11,"MOSI20",2,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,2,false)
elseif a==0 and o==1 then
fill_NUC123_I2C(e,t,"A",11,"I2C1SCL",1,"GCR_ALT_MFP")
end
end
a[2]=e
e={}
e["pin_no"]="3"
e["texts"]={"PA.10","MISO10","MISO20","I2C1SDA"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPA_MFPH"],1792),8)
if a==0 then
fill_NUC123_GPIO(e,t,"A",10)
elseif a==2 then
fill_NUC123_SPI(e,t,"A",10,"MISO10",1)
fill_NUC123_SPI_IO(e,t,1,true)
elseif a==3 then
fill_NUC123_SPI(e,t,"A",10,"MISO20",2)
fill_NUC123_SPI_IO(e,t,2,true)
elseif a==1 then
fill_NUC123_I2C(e,t,"A",10,"I2C1SDA",1)
else
fill_invalid_GPIO(e,t,"A",10)
end
else
local o=ext.rshift(ext.band(t["GCR_GPA_MFP"],1024),10)
local a=ext.rshift(ext.band(t["GCR_ALT_MFP"],4096),12)
if a==0 and o==0 then
fill_NUC123_GPIO(e,t,"A",10,nil,"GCR_ALT_MFP")
elseif a==1 and o==0 then
fill_NUC123_SPI(e,t,"A",10,"MISO10",1,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,1,true)
elseif a==1 and o==1 then
fill_NUC123_SPI(e,t,"A",10,"MISO20",2,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,2,true)
elseif a==0 and o==1 then
fill_NUC123_I2C(e,t,"A",10,"I2C1SDA",1,"GCR_ALT_MFP")
end
end
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"PB.4","RXD1","SPISS20","SPISS11"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPB_MFPL"],458752),16)
if a==0 then
fill_NUC123_GPIO(e,t,"B",4)
elseif a==1 then
fill_NUC123_UART(e,t,"B",4,"RXD1",1)
e["direction"]=kPinDirection_In
elseif a==2 then
fill_NUC123_SPI(e,t,"B",4,"SPISS20",2)
elseif a==3 then
fill_NUC123_SPI(e,t,"B",4,"SPISS11",1)
else
fill_invalid_GPIO(e,t,"B",4)
end
else
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],16),4)
local a=ext.rshift(ext.band(t["GCR_ALT_MFP"],32768),15)
if a==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",4,nil,"GCR_ALT_MFP")
elseif a==0 and o==1 then
fill_NUC123_UART(e,t,"B",4,"RXD1",1,"GCR_ALT_MFP")
e["direction"]=kPinDirection_In
elseif a==1 and o==0 then
fill_NUC123_SPI(e,t,"B",4,"SPISS20",2,"GCR_ALT_MFP")
elseif a==1 and o==1 then
fill_NUC123_SPI(e,t,"B",4,"SPISS11",1,"GCR_ALT_MFP")
end
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"PB.5","TXD1","SPICLK2"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPB_MFPL"],7340032),20)
if a==0 then
fill_NUC123_GPIO(e,t,"B",5)
elseif a==1 then
fill_NUC123_UART(e,t,"B",5,"TXD1",1)
e["direction"]=kPinDirection_PushPullOut
elseif a==2 then
fill_NUC123_SPI(e,t,"B",5,"SPICLK2",2)
else
fill_invalid_GPIO(e,t,"B",5)
end
else
local o=ext.rshift(ext.band(t["GCR_GPB_MFP"],32),5)
local a=ext.rshift(ext.band(t["GCR_ALT_MFP"],262144),18)
if a==0 and o==0 then
fill_NUC123_GPIO(e,t,"B",5,nil,"GCR_ALT_MFP")
elseif a==0 and o==1 then
fill_NUC123_UART(e,t,"B",5,"TXD1",1,"GCR_ALT_MFP")
e["direction"]=kPinDirection_PushPullOut
elseif a==1 and o==1 then
fill_NUC123_SPI(e,t,"B",5,"SPICLK2",2,"GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"B",5,"GCR_ALT_MFP")
end
end
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"LDO"}
fill_NUC123_Normal(e,t,nil,nil,"LDO")
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"VDD"}
fill_NUC123_Normal(e,t,nil,nil,"VDD")
a[7]=e
e={}
e["pin_no"]="8"
e["texts"]={"VSS"}
fill_NUC123_Normal(e,t,nil,nil,"VSS")
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"VBUS"}
fill_NUC123_Normal(e,t,nil,nil,"VBUS")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"VDD33"}
fill_NUC123_Normal(e,t,nil,nil,"VDD33")
a[10]=e
e={}
e["pin_no"]="11"
e["texts"]={"D-"}
fill_NUC123_USB(e,t,"D-")
a[11]=e
e={}
e["pin_no"]="12"
e["texts"]={"D+"}
fill_NUC123_USB(e,t,"D+")
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"PC.3","MOSI00","I2SDO"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPL"],28672),12)
if a==0 then
fill_NUC123_GPIO(e,t,"C",3)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",3,"MOSI00",0)
fill_NUC123_SPI_IO(e,t,0,false)
elseif a==2 then
fill_NUC123_I2S(e,t,"C",3,"I2SDO")
else
fill_invalid_GPIO(e,t,"C",3)
end
else
local a=ext.rshift(ext.band(t["GCR_GPC_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],256),8)
if o==0 and a==0 then
fill_NUC123_GPIO(e,t,"C",3,nil,"GCR_ALT_MFP")
elseif o==0 and a==1 then
fill_NUC123_SPI(e,t,"C",3,"MOSI00",0,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,0,false)
elseif o==1 and a==1 then
fill_NUC123_I2S(e,t,"C",3,"I2SDO","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",3,"GCR_ALT_MFP")
end
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"PC.2","MISO00","I2SDI"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPL"],1792),8)
if a==0 then
fill_NUC123_GPIO(e,t,"C",2)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",2,"MISO00",0)
fill_NUC123_SPI_IO(e,t,0,true)
elseif a==2 then
fill_NUC123_I2S(e,t,"C",2,"I2SDI")
else
fill_invalid_GPIO(e,t,"C",2)
end
else
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],4),2)
local a=ext.rshift(ext.band(t["GCR_ALT_MFP"],128),7)
if a==0 and o==0 then
fill_NUC123_GPIO(e,t,"C",2,nil,"GCR_ALT_MFP")
elseif a==0 and o==1 then
fill_NUC123_SPI(e,t,"C",2,"MISO00",0,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,0,true)
elseif a==1 and o==1 then
fill_NUC123_I2S(e,t,"C",2,"I2SDI","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",2,"GCR_ALT_MFP")
end
end
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"PC.1","SPICLK0","I2SBCLK"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPL"],112),4)
if a==0 then
fill_NUC123_GPIO(e,t,"C",1)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",1,"SPICLK0",0)
elseif a==2 then
fill_NUC123_I2S(e,t,"C",1,"I2SBCLK")
else
fill_invalid_GPIO(e,t,"C",1)
end
else
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],2),1)
local a=ext.rshift(ext.band(t["GCR_ALT_MFP"],64),6)
if a==0 and o==0 then
fill_NUC123_GPIO(e,t,"C",1,nil,"GCR_ALT_MFP")
elseif a==0 and o==1 then
fill_NUC123_SPI(e,t,"C",1,"SPICLK0",0,"GCR_ALT_MFP")
elseif a==1 and o==1 then
fill_NUC123_I2S(e,t,"C",1,"I2SBCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",1,"GCR_ALT_MFP")
end
end
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"PC.0","SPISS00","I2SLRCLK"}
if o==1 then
local a=ext.band(t["GCR_GPC_MFPL"],7)
if a==0 then
fill_NUC123_GPIO(e,t,"C",0)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",0,"SPISS00",0)
elseif a==2 then
fill_NUC123_I2S(e,t,"C",0,"I2SLRCLK")
else
fill_invalid_GPIO(e,t,"C",0)
end
else
local a=ext.band(t["GCR_GPC_MFP"],1)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],32),5)
if o==0 and a==0 then
fill_NUC123_GPIO(e,t,"C",0,nil,"GCR_ALT_MFP")
elseif o==0 and a==1 then
fill_NUC123_SPI(e,t,"C",0,"SPISS00",0,"GCR_ALT_MFP")
elseif o==1 and a==1 then
fill_NUC123_I2S(e,t,"C",0,"I2SLRCLK","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",0,"GCR_ALT_MFP")
end
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"CLKO","PWM3","MOSI11","PC.13"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPH"],7340032),20)
if a==0 then
fill_NUC123_GPIO(e,t,"C",13)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",13,"MOSI11",1)
fill_NUC123_SPI_IO(e,t,1,false)
elseif a==3 then
fill_NUC123_PWM(e,t,"C",13,"PWM3")
elseif a==2 then
fill_NUC123_CLKO(e,t,"C",13,"CLKO")
else
fill_invalid_GPIO(e,t,"C",13)
end
else
local a=ext.rshift(ext.band(t["GCR_GPC_MFP"],8192),13)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],2097152),21)
if o==0 and a==0 then
fill_NUC123_GPIO(e,t,"C",13,nil,"GCR_ALT_MFP")
elseif o==0 and a==1 then
fill_NUC123_SPI(e,t,"C",13,"MOSI11",1,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,1,false)
elseif o==1 and a==1 then
fill_NUC123_PWM(e,t,"C",13,"PWM3","GCR_ALT_MFP")
elseif o==1 and a==0 then
fill_NUC123_CLKO(e,t,"C",13,"CLKO","GCR_ALT_MFP")
end
end
a[17]=e
e={}
e["pin_no"]="18"
e["texts"]={"PWM2","MISO11","PC.12"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPH"],458752),16)
if a==0 then
fill_NUC123_GPIO(e,t,"C",12)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",12,"MISO11",1)
fill_NUC123_SPI_IO(e,t,1,true)
elseif a==3 then
fill_NUC123_PWM(e,t,"C",12,"PWM2")
else
fill_invalid_GPIO(e,t,"C",12)
end
else
local a=ext.rshift(ext.band(t["GCR_GPC_MFP"],4096),12)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP"],1048576),20)
if o==0 and a==0 then
fill_NUC123_GPIO(e,t,"C",12,nil,"GCR_ALT_MFP")
elseif o==0 and a==1 then
fill_NUC123_SPI(e,t,"C",12,"MISO11",1,"GCR_ALT_MFP")
fill_NUC123_SPI_IO(e,t,1,true)
elseif o==1 and a==1 then
fill_NUC123_PWM(e,t,"C",12,"PWM2","GCR_ALT_MFP")
else
fill_invalid_GPIO(e,t,"C",12,"GCR_ALT_MFP")
end
end
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"MOSI10","PC.11"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPH"],28672),12)
if a==0 then
fill_NUC123_GPIO(e,t,"C",11)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",11,"MOSI10",1)
fill_NUC123_SPI_IO(e,t,1,false)
else
fill_invalid_GPIO(e,t,"C",11)
end
else
local a=ext.rshift(ext.band(t["GCR_GPC_MFP"],2048),11)
if a==0 then
fill_NUC123_GPIO(e,t,"C",11)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",11,"MOSI10",1)
fill_NUC123_SPI_IO(e,t,1,false)
end
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"MISO10","PC.10"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPH"],1792),8)
if a==0 then
fill_NUC123_GPIO(e,t,"C",10)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",10,"MISO10",1)
fill_NUC123_SPI_IO(e,t,1,true)
else
fill_invalid_GPIO(e,t,"C",10)
end
else
local a=ext.rshift(ext.band(t["GCR_GPC_MFP"],1024),10)
if a==0 then
fill_NUC123_GPIO(e,t,"C",10)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",10,"MISO10",1)
fill_NUC123_SPI_IO(e,t,1,true)
end
end
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"SPICLK1","PC.9"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPC_MFPH"],112),4)
if a==0 then
fill_NUC123_GPIO(e,t,"C",9)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",9,"SPICLK1",1)
else
fill_invalid_GPIO(e,t,"C",9)
end
else
local a=ext.rshift(ext.band(t["GCR_GPC_MFP"],512),9)
if a==0 then
fill_NUC123_GPIO(e,t,"C",9)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",9,"SPICLK1",1)
end
end
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"PWM0","SPISS10","PC.8"}
if o==1 then
local a=ext.band(t["GCR_GPC_MFPH"],7)
if a==0 then
fill_NUC123_GPIO(e,t,"C",8)
elseif a==1 then
fill_NUC123_SPI(e,t,"C",8,"SPISS10",1)
elseif a==2 then
fill_NUC123_PWM(e,t,"C",8,"PWM0")
else
fill_invalid_GPIO(e,t,"C",8)
end
else
local o=ext.rshift(ext.band(t["GCR_GPC_MFP"],256),8)
local a=ext.rshift(ext.band(t["GCR_ALT_MFP1"],8388608),23)
if a==0 and o==0 then
fill_NUC123_GPIO(e,t,"C",8,nil,"GCR_ALT_MFP1")
elseif a==0 and o==1 then
fill_NUC123_SPI(e,t,"C",8,"SPISS10",1,"GCR_ALT_MFP1")
elseif a==1 and o==1 then
fill_NUC123_PWM(e,t,"C",8,"PWM0","GCR_ALT_MFP1")
else
fill_invalid_GPIO(e,t,"C",8,"GCR_ALT_MFP1")
end
end
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"ICE_DAT"}
fill_NUC123_Normal(e,t,nil,nil,"ICE_DAT")
e["direction"]=kPinDirection_Bi
a[23]=e
e={}
e["pin_no"]="24"
e["texts"]={"ICE_CK"}
fill_NUC123_Normal(e,t,nil,nil,"ICE_CK")
e["direction"]=kPinDirection_In
a[24]=e
e={}
e["pin_no"]="25"
e["texts"]={"AVDD"}
fill_NUC123_Normal(e,t,nil,nil,"AVDD")
a[25]=e
e={}
e["pin_no"]="26"
e["texts"]={"SPISS01","SPICLK2","ADC1","PD.1"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPD_MFPL"],112),4)
if a==0 then
fill_NUC123_GPIO(e,t,"D",1)
elseif a==3 then
fill_NUC123_ADC(e,t,"D",1,"ADC1")
elseif a==2 then
fill_NUC123_SPI(e,t,"D",1,"SPICLK2",2)
elseif a==1 then
fill_NUC123_SPI(e,t,"D",1,"SPISS01",0)
else
fill_invalid_GPIO(e,t,"D",1)
end
else
local a=ext.rshift(ext.band(t["GCR_GPD_MFP"],2),1)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],131072),17)
if o==0 and a==0 then
fill_NUC123_GPIO(e,t,"D",1,nil,"GCR_ALT_MFP1")
elseif o==1 and a==1 then
fill_NUC123_ADC(e,t,"D",1,"ADC1","GCR_ALT_MFP1")
elseif o==1 and a==0 then
fill_NUC123_SPI(e,t,"D",1,"SPICLK2",2,"GCR_ALT_MFP1")
elseif o==0 and a==1 then
fill_NUC123_SPI(e,t,"D",1,"SPISS01",0,"GCR_ALT_MFP1")
end
end
a[26]=e
e={}
e["pin_no"]="27"
e["texts"]={"MISO01","MISO20","ADC2","PD.2"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPD_MFPL"],1792),8)
if a==0 then
fill_NUC123_GPIO(e,t,"D",2)
elseif a==3 then
fill_NUC123_ADC(e,t,"D",2,"ADC2")
elseif a==2 then
fill_NUC123_SPI(e,t,"D",2,"MISO20",2)
fill_NUC123_SPI_IO(e,t,2,true)
elseif a==1 then
fill_NUC123_SPI(e,t,"D",2,"MISO01",0)
fill_NUC123_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"D",2)
end
else
local a=ext.rshift(ext.band(t["GCR_GPD_MFP"],4),2)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],262144),18)
if o==0 and a==0 then
fill_NUC123_GPIO(e,t,"D",2,nil,"GCR_ALT_MFP1")
elseif o==1 and a==1 then
fill_NUC123_ADC(e,t,"D",2,"ADC2","GCR_ALT_MFP1")
elseif o==1 and a==0 then
fill_NUC123_SPI(e,t,"D",2,"MISO20",2,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,2,true)
elseif o==0 and a==1 then
fill_NUC123_SPI(e,t,"D",2,"MISO01",0,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,0,true)
end
end
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"MOSI01","MOSI20","ADC3","PD.3"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPD_MFPL"],28672),12)
if a==0 then
fill_NUC123_GPIO(e,t,"D",3)
elseif a==3 then
fill_NUC123_ADC(e,t,"D",3,"ADC3")
elseif a==2 then
fill_NUC123_SPI(e,t,"D",3,"MOSI20",2)
fill_NUC123_SPI_IO(e,t,2,false)
elseif a==1 then
fill_NUC123_SPI(e,t,"D",3,"MOSI01",0)
fill_NUC123_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"D",3)
end
else
local a=ext.rshift(ext.band(t["GCR_GPD_MFP"],8),3)
local o=ext.rshift(ext.band(t["GCR_ALT_MFP1"],524288),19)
if o==0 and a==0 then
fill_NUC123_GPIO(e,t,"D",3,nil,"GCR_ALT_MFP1")
elseif o==1 and a==1 then
fill_NUC123_ADC(e,t,"D",3,"ADC3","GCR_ALT_MFP1")
elseif o==1 and a==0 then
fill_NUC123_SPI(e,t,"D",3,"MOSI20",2,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,2,false)
elseif o==0 and a==1 then
fill_NUC123_SPI(e,t,"D",3,"MOSI01",0,"GCR_ALT_MFP1")
fill_NUC123_SPI_IO(e,t,0,false)
end
end
a[28]=e
e={}
e["pin_no"]="29"
e["texts"]={"XT1_OUT","PF.0"}
if o==1 then
local a=ext.band(t["GCR_GPF_MFPL"],7)
if a==0 then
fill_NUC123_GPIO(e,t,"F",0)
elseif a==1 then
fill_NUC123_Normal(e,t,"F",0,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"F",0)
end
else
local a=ext.band(t["GCR_GPF_MFP"],1)
if a==0 then
fill_NUC123_GPIO(e,t,"F",0)
elseif a==1 then
fill_NUC123_Normal(e,t,"F",0,"XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
end
end
a[29]=e
e={}
e["pin_no"]="30"
e["texts"]={"XT1_IN","PF.1"}
if o==1 then
local a=ext.rshift(ext.band(t["GCR_GPF_MFPL"],112),4)
if a==0 then
fill_NUC123_GPIO(e,t,"F",1)
elseif a==1 then
fill_NUC123_Normal(e,t,"F",1,"XT1_IN")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"F",1)
end
else
local a=ext.rshift(ext.band(t["GCR_GPF_MFP"],2),1)
if a==0 then
fill_NUC123_GPIO(e,t,"F",1)
elseif a==1 then
fill_NUC123_Normal(e,t,"F",1,"XT1_IN")
e["direction"]=kPinDirection_In
end
end
a[30]=e
e={}
e["pin_no"]="31"
e["texts"]={"/RESET"}
fill_NUC123_Normal(e,t,nil,nil,"/RESET")
e["direction"]=kPinDirection_In
a[31]=e
e={}
e["pin_no"]="32"
e["texts"]={"PVSS"}
fill_NUC123_Normal(e,t,nil,nil,"PVSS")
a[32]=e
return{name=i,information="",pins=a}
end
