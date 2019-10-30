local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."NUC400.lua")
function get_chip_status_NUC472_AE_LQFP100(i,t,o,e)
local a={}
local t=read_NUC400_Registers(i,t,o,e)
local e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPH"],983040),16)
e={}
e["pin_no"]="1"
e["texts"]={"PE.12","ADC1_4","ACMP1_P3","ACMP2_P2","EBI_nCS1","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",12,true)
elseif o==1 then
fill_NUC400_EADC(e,t,"E","H","ADC1_4")
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","H","ACMP1_P3")
elseif o==3 then
fill_NUC400_ACMP(e,t,"E","H","ACMP2_P2")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","H","EBI_nCS1")
else
fill_invalid_GPIO(e,t,"E",12)
end
a[1]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPH"],15728640),20)
e={}
e["pin_no"]="2"
e["texts"]={"PE.13","ADC1_5","ACMP2_P1","EBI_nCS2","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",13,true)
elseif o==1 then
fill_NUC400_EADC(e,t,"E","H","ADC1_5")
elseif o==3 then
fill_NUC400_ACMP(e,t,"E","H","ACMP2_P1")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","H","EBI_nCS2")
else
fill_invalid_GPIO(e,t,"E",13)
end
a[2]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPH"],251658240),24)
e={}
e["pin_no"]="3"
e["texts"]={"PE.14","ADC1_6","ACMP2_P0","EBI_nCS3","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",14,true)
elseif o==1 then
fill_NUC400_EADC(e,t,"E","H","ADC1_6")
elseif o==3 then
fill_NUC400_ACMP(e,t,"E","H","ACMP2_P0")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","H","EBI_nCS3")
else
fill_invalid_GPIO(e,t,"E",14)
end
a[3]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPH"],4026531840),28)
e={}
e["pin_no"]="4"
e["texts"]={"PE.15","ADC1_7","ACMP2_N"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",15,false)
elseif o==1 then
fill_NUC400_EADC(e,t,"E","H","ADC1_7")
elseif o==3 then
fill_NUC400_ACMP(e,t,"E","H","ACMP2_N")
else
fill_invalid_GPIO(e,t,"E",15)
end
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"VSS"}
fill_NUC400_Normal(e,t,nil,nil,"VSS")
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"VDD"}
fill_NUC400_Normal(e,t,nil,nil,"VDD")
a[6]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPH"],983040),16)
e={}
e["pin_no"]="7"
e["texts"]={"PC.12","SPI1_SS0","SC4_CD","SD1_CDn","CAP_DATA7","EBI_A0","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",12,true)
elseif o==1 then
fill_NUC400_SPI(e,t,"C","H","SPI1_SS0",1)
elseif o==2 then
fill_NUC400_SC(e,t,"C","H","SC4_CD",4)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC400_SD(e,t,"C","H","SD1_CDn")
elseif o==5 then
fill_NUC400_VCAP(e,t,"C","H","CAP_DATA7")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","H","EBI_A0")
else
fill_invalid_GPIO(e,t,"C",12)
end
a[7]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPH"],15728640),20)
e={}
e["pin_no"]="8"
e["texts"]={"PC.13","SPI1_MOSI1","SC4_RST","SD1_CMD","CAP_DATA6","EBI_A1","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",13,true)
elseif o==1 then
fill_NUC400_SPI(e,t,"C","H","SPI1_MOSI1",1)
fill_NUC400_SPI_IO(e,t,1,false)
elseif o==2 then
fill_NUC400_SC(e,t,"C","H","SC4_RST",4)
elseif o==4 then
fill_NUC400_SD(e,t,"C","H","SD1_CMD")
elseif o==5 then
fill_NUC400_VCAP(e,t,"C","H","CAP_DATA6")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","H","EBI_A1")
else
fill_invalid_GPIO(e,t,"C",13)
end
a[8]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPH"],251658240),24)
e={}
e["pin_no"]="9"
e["texts"]={"PC.14","SPI1_MISO1","SC4_PWR","TM3_EXT","SD1_CLK","CAP_DATA5","EBI_A2","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",14,true)
elseif o==1 then
fill_NUC400_SPI(e,t,"C","H","SPI1_MISO1",1)
fill_NUC400_SPI_IO(e,t,1,true)
elseif o==2 then
fill_NUC400_SC(e,t,"C","H","SC4_PWR",4)
elseif o==3 then
fill_NUC400_TM(e,t,"C","H","TM3_EXT",3)
elseif o==4 then
fill_NUC400_SD(e,t,"C","H","SD1_CLK")
elseif o==5 then
fill_NUC400_VCAP(e,t,"C","H","CAP_DATA5")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","H","EBI_A2")
else
fill_invalid_GPIO(e,t,"C",14)
end
a[9]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPH"],4026531840),28)
e={}
e["pin_no"]="10"
e["texts"]={"PC.15","SPI1_MOSI0","SC4_DAT","SD1_DAT3","CAP_DATA4","EBI_A3","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",15,true)
elseif o==1 then
fill_NUC400_SPI(e,t,"C","H","SPI1_MOSI0",1)
fill_NUC400_SPI_IO(e,t,1,false)
elseif o==2 then
fill_NUC400_SC(e,t,"C","H","SC4_DAT",4)
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_NUC400_SD(e,t,"C","H","SD1_DAT3")
elseif o==5 then
fill_NUC400_VCAP(e,t,"C","H","CAP_DATA4")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","H","EBI_A3")
else
fill_invalid_GPIO(e,t,"C",15)
end
a[10]=e
local o=ext.band(t["GCR_GPD_MFPL"],15)
e={}
e["pin_no"]="11"
e["texts"]={"PD.0","SPI1_MISO0","SC4_CLK","SD1_DAT2","CAP_DATA3","EBI_A4","INT3","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"D",0,true)
elseif o==1 then
fill_NUC400_SPI(e,t,"D","L","SPI1_MISO0",1)
fill_NUC400_SPI_IO(e,t,1,true)
elseif o==2 then
fill_NUC400_SC(e,t,"D","L","SC4_CLK",4)
elseif o==4 then
fill_NUC400_SD(e,t,"D","L","SD1_DAT2")
elseif o==5 then
fill_NUC400_VCAP(e,t,"D","L","CAP_DATA3")
elseif o==7 then
fill_NUC400_EBI(e,t,"D","L","EBI_A4")
elseif o==8 then
fill_NUC400_Normal(e,t,"D","L","INT3")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"D",0)
end
a[11]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFPL"],240),4)
e={}
e["pin_no"]="12"
e["texts"]={"PD.1","SPI1_CLK","TM0_CNT_OUT","SD1_DAT1","CAP_DATA2","EBI_A5","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"D",1,true)
elseif o==1 then
fill_NUC400_SPI(e,t,"D","L","SPI1_CLK",1)
elseif o==3 then
fill_NUC400_TM(e,t,"D","L","TM0_CNT_OUT",0)
elseif o==4 then
fill_NUC400_SD(e,t,"D","L","SD1_DAT1")
elseif o==5 then
fill_NUC400_VCAP(e,t,"D","L","CAP_DATA2")
elseif o==7 then
fill_NUC400_EBI(e,t,"D","L","EBI_A5")
else
fill_invalid_GPIO(e,t,"D",1)
end
a[12]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFPL"],61440),12)
e={}
e["pin_no"]="13"
e["texts"]={"PD.3","SC5_CLK","I2C3_SDA","ACMP2_O","SD0_CDn","CAP_DATA0","EBI_A7","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"D",3,true)
elseif o==1 then
fill_NUC400_SC(e,t,"D","L","SC5_CLK",5)
elseif o==2 then
fill_NUC400_I2C(e,t,"D","L","I2C3_SDA",3)
elseif o==3 then
fill_NUC400_ACMP(e,t,"D","L","ACMP2_O")
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC400_SD(e,t,"D","L","SD0_CDn")
elseif o==5 then
fill_NUC400_VCAP(e,t,"D","L","CAP_DATA0")
elseif o==7 then
fill_NUC400_EBI(e,t,"D","L","EBI_A7")
else
fill_invalid_GPIO(e,t,"D",3)
end
a[13]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFPL"],983040),16)
e={}
e["pin_no"]="14"
e["texts"]={"PD.4","SC5_CD","UART3_RXD","ACMP1_O","CAP_SCLK","EBI_A8","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"D",4,true)
elseif o==1 then
fill_NUC400_SC(e,t,"D","L","SC5_CD",5)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_NUC400_UART(e,t,"D","L","UART3_RXD",3)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC400_ACMP(e,t,"D","L","ACMP1_O")
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_NUC400_VCAP(e,t,"D","L","CAP_SCLK")
elseif o==7 then
fill_NUC400_EBI(e,t,"D","L","EBI_A8")
else
fill_invalid_GPIO(e,t,"D",4)
end
a[14]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFPL"],15728640),20)
e={}
e["pin_no"]="15"
e["texts"]={"PD.5","SC5_RST","UART3_TXD","CAP_VSYNC","EBI_A9","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"D",5,true)
elseif o==1 then
fill_NUC400_SC(e,t,"D","L","SC5_RST",5)
elseif o==2 then
fill_NUC400_UART(e,t,"D","L","UART3_TXD",3)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_NUC400_VCAP(e,t,"D","L","CAP_VSYNC")
elseif o==7 then
fill_NUC400_EBI(e,t,"D","L","EBI_A9")
else
fill_invalid_GPIO(e,t,"D",5)
end
a[15]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFPL"],251658240),24)
e={}
e["pin_no"]="16"
e["texts"]={"PD.6","SC5_PWR","UART3_RTS","SD0_CMD","CAP_HSYNC","EBI_A10","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"D",6,true)
elseif o==1 then
fill_NUC400_SC(e,t,"D","L","SC5_PWR",5)
elseif o==2 then
fill_NUC400_UART(e,t,"D","L","UART3_RTS",3)
elseif o==4 then
fill_NUC400_SD(e,t,"D","L","SD0_CMD")
elseif o==5 then
fill_NUC400_VCAP(e,t,"D","L","CAP_HSYNC")
elseif o==7 then
fill_NUC400_EBI(e,t,"D","L","EBI_A10")
else
fill_invalid_GPIO(e,t,"D",6)
end
a[16]=e
local o=ext.rshift(ext.band(t["GCR_GPD_MFPL"],4026531840),28)
e={}
e["pin_no"]="17"
e["texts"]={"PD.7","SC5_DAT","UART3_CTS","SD0_CLK","CAP_PIXCLK","EBI_A11","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"D",7,true)
elseif o==1 then
fill_NUC400_SC(e,t,"D","L","SC5_DAT",5)
e["direction"]=kPinDirection_Bi
elseif o==2 then
fill_NUC400_UART(e,t,"D","L","UART3_CTS",3)
elseif o==4 then
fill_NUC400_SD(e,t,"D","L","SD0_CLK")
elseif o==5 then
fill_NUC400_VCAP(e,t,"D","L","CAP_PIXCLK")
elseif o==7 then
fill_NUC400_EBI(e,t,"D","L","EBI_A11")
else
fill_invalid_GPIO(e,t,"D",7)
end
a[17]=e
local o=ext.rshift(ext.band(t["GCR_GPG_MFPH"],15728640),20)
e={}
e["pin_no"]="18"
e["texts"]={"PG.13","XT1_IN"}
if o==0 then
fill_NUC400_GPIO(e,t,"G",13,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"G","H","XT1_IN")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"G",13)
end
a[18]=e
local o=ext.rshift(ext.band(t["GCR_GPG_MFPH"],983040),16)
e={}
e["pin_no"]="19"
e["texts"]={"PG.12","XT1_OUT"}
if o==0 then
fill_NUC400_GPIO(e,t,"G",12,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"G","H","XT1_OUT")
e["direction"]=kPinDirection_PushPullOut
else
fill_invalid_GPIO(e,t,"G",12)
end
a[19]=e
e={}
e["pin_no"]="20"
e["texts"]={"nRESET"}
fill_NUC400_Normal(e,t,nil,nil,"nRESET")
e["direction"]=kPinDirection_In
a[20]=e
e={}
e["pin_no"]="21"
e["texts"]={"LDO_CAP"}
fill_NUC400_Normal(e,t,nil,nil,"LDO_CAP")
a[21]=e
e={}
e["pin_no"]="22"
e["texts"]={"VSS"}
fill_NUC400_Normal(e,t,nil,nil,"VSS")
a[22]=e
e={}
e["pin_no"]="23"
e["texts"]={"VDD"}
fill_NUC400_Normal(e,t,nil,nil,"VDD")
a[23]=e
local o=ext.rshift(ext.band(t["GCR_GPG_MFPH"],3840),8)
e={}
e["pin_no"]="24"
e["texts"]={"PG.10","ICE_CLK"}
if o==0 then
fill_NUC400_GPIO(e,t,"G",10,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"G","H","ICE_CLK")
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"G",10)
end
a[24]=e
local o=ext.rshift(ext.band(t["GCR_GPG_MFPH"],61440),12)
e={}
e["pin_no"]="25"
e["texts"]={"PG.11","ICE_DAT"}
if o==0 then
fill_NUC400_GPIO(e,t,"G",11,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"G","H","ICE_DAT")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"G",11)
end
a[25]=e
local o=ext.rshift(ext.band(t["GCR_GPG_MFPH"],4026531840),28)
e={}
e["pin_no"]="26"
e["texts"]={"PG.15","X32K_IN","I2C1_SCL"}
if o==0 then
fill_NUC400_GPIO(e,t,"G",15,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"G","H","X32K_IN")
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC400_I2C(e,t,"G","H","I2C1_SCL",1)
else
fill_invalid_GPIO(e,t,"G",15)
end
a[26]=e
local o=ext.rshift(ext.band(t["GCR_GPG_MFPH"],251658240),24)
e={}
e["pin_no"]="27"
e["texts"]={"PG.14","X32K_OUT","I2C1_SDA"}
if o==0 then
fill_NUC400_GPIO(e,t,"G",14,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"G","H","X32K_OUT")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_NUC400_I2C(e,t,"G","H","I2C1_SDA",1)
else
fill_invalid_GPIO(e,t,"G",14)
end
a[27]=e
e={}
e["pin_no"]="28"
e["texts"]={"VBAT"}
fill_NUC400_Normal(e,t,nil,nil,"VBAT")
a[28]=e
local o=ext.band(t["GCR_GPA_MFPL"],15)
e={}
e["pin_no"]="29"
e["texts"]={"PA.0","TAMPER0","SC0_CD","CAN1_RXD","INT0"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",0,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"A","L","TAMPER0")
elseif o==2 then
fill_NUC400_SC(e,t,"A","L","SC0_CD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC400_CAN(e,t,"A","L","CAN1_RXD",1)
elseif o==8 then
fill_NUC400_Normal(e,t,"A","L","INT0")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"A",0)
end
a[29]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPL"],240),4)
e={}
e["pin_no"]="30"
e["texts"]={"PA.1","TAMPER1","SC5_CD","CAN1_TXD","EBI_A22"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",1,false)
elseif o==1 then
fill_NUC400_Normal(e,t,"A","L","TAMPER1")
elseif o==2 then
fill_NUC400_SC(e,t,"A","L","SC5_CD",5)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC400_CAN(e,t,"A","L","CAN1_TXD",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","L","EBI_A22")
else
fill_invalid_GPIO(e,t,"A",1)
end
a[30]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPL"],3840),8)
e={}
e["pin_no"]="31"
e["texts"]={"PA.2","SC2_DAT","SPI3_MISO0","I2S0_MCLK","BRAKE11","CAP_SFIELD","EBI_A12","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",2,true)
elseif o==1 then
fill_NUC400_SC(e,t,"A","L","SC2_DAT",2)
e["direction"]=kPinDirection_Bi
elseif o==2 then
fill_NUC400_SPI(e,t,"A","L","SPI3_MISO0",3)
fill_NUC400_SPI_IO(e,t,3,true)
elseif o==3 then
fill_NUC400_I2S(e,t,"A","L","I2S0_MCLK",0)
elseif o==4 then
fill_NUC400_EPWM(e,t,"A","L","BRAKE11",1)
elseif o==5 then
fill_NUC400_VCAP(e,t,"A","L","CAP_SFIELD")
elseif o==7 then
fill_NUC400_EBI(e,t,"A","L","EBI_A12")
else
fill_invalid_GPIO(e,t,"A",2)
end
a[31]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPL"],61440),12)
e={}
e["pin_no"]="32"
e["texts"]={"PA.3","SC2_CLK","SPI3_MOSI0","I2S0_DO","BRAKE10","EBI_A13","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",3,true)
elseif o==1 then
fill_NUC400_SC(e,t,"A","L","SC2_CLK",2)
elseif o==2 then
fill_NUC400_SPI(e,t,"A","L","SPI3_MOSI0",3)
fill_NUC400_SPI_IO(e,t,3,false)
elseif o==3 then
fill_NUC400_I2S(e,t,"A","L","I2S0_DO",0)
elseif o==4 then
fill_NUC400_EPWM(e,t,"A","L","BRAKE10",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","L","EBI_A13")
else
fill_invalid_GPIO(e,t,"A",3)
end
a[32]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPL"],983040),16)
e={}
e["pin_no"]="33"
e["texts"]={"PA.4","SC2_PWR","SPI3_CLK","I2S0_DI","QEI1_Z","EBI_A14","ECAP1_IC2","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",4,true)
elseif o==1 then
fill_NUC400_SC(e,t,"A","L","SC2_PWR",2)
elseif o==2 then
fill_NUC400_SPI(e,t,"A","L","SPI3_CLK",3)
elseif o==3 then
fill_NUC400_I2S(e,t,"A","L","I2S0_DI",0)
elseif o==5 then
fill_NUC400_QEI(e,t,"A","L","QEI1_Z",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","L","EBI_A14")
elseif o==8 then
fill_NUC400_ECAP(e,t,"A","L","ECAP1_IC2",1)
else
fill_invalid_GPIO(e,t,"A",4)
end
a[33]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPL"],15728640),20)
e={}
e["pin_no"]="34"
e["texts"]={"PA.5","SC2_RST","SPI3_SS0","I2S0_BCLK","PWM0_0","QEI1_B","EBI_A15","ECAP1_IC1","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",5,true)
elseif o==1 then
fill_NUC400_SC(e,t,"A","L","SC2_RST",2)
elseif o==2 then
fill_NUC400_SPI(e,t,"A","L","SPI3_SS0",3)
elseif o==3 then
fill_NUC400_I2S(e,t,"A","L","I2S0_BCLK",0)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","L","PWM0_0",0,0)
elseif o==5 then
fill_NUC400_QEI(e,t,"A","L","QEI1_B",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","L","EBI_A15")
elseif o==8 then
fill_NUC400_ECAP(e,t,"A","L","ECAP1_IC1",1)
else
fill_invalid_GPIO(e,t,"A",5)
end
a[34]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPL"],251658240),24)
e={}
e["pin_no"]="35"
e["texts"]={"PA.6","SC2_CD","I2S0_LRCK","PWM0_1","QEI1_A","CAN1_TXD","EBI_A16","ECAP1_IC0","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",6,true)
elseif o==1 then
fill_NUC400_SC(e,t,"A","L","SC2_CD",2)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC400_I2S(e,t,"A","L","I2S0_LRCK",0)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","L","PWM0_1",0,1)
elseif o==5 then
fill_NUC400_QEI(e,t,"A","L","QEI1_A",1)
elseif o==6 then
fill_NUC400_CAN(e,t,"A","L","CAN1_TXD",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","L","EBI_A16")
elseif o==8 then
fill_NUC400_ECAP(e,t,"A","L","ECAP1_IC0",1)
else
fill_invalid_GPIO(e,t,"A",6)
end
a[35]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPL"],4026531840),28)
e={}
e["pin_no"]="36"
e["texts"]={"PA.7","SC0_CLK","SPI3_SS0","PWM1_3","EPWM0_5","EBI_A17","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",7,true)
elseif o==2 then
fill_NUC400_SC(e,t,"A","L","SC0_CLK",0)
elseif o==3 then
fill_NUC400_SPI(e,t,"A","L","SPI3_SS0",3)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","L","PWM1_3",1,3)
elseif o==5 then
fill_NUC400_EPWM(e,t,"A","L","EPWM0_5",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","L","EBI_A17")
else
fill_invalid_GPIO(e,t,"A",7)
end
a[36]=e
local o=ext.band(t["GCR_GPA_MFPH"],15)
e={}
e["pin_no"]="37"
e["texts"]={"PA.8","SC0_RST","SPI3_CLK","PWM1_2","EPWM0_4","EBI_A18","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",8,true)
elseif o==2 then
fill_NUC400_SC(e,t,"A","H","SC0_RST",0)
elseif o==3 then
fill_NUC400_SPI(e,t,"A","H","SPI3_CLK",3)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","H","PWM1_2",1,2)
elseif o==5 then
fill_NUC400_EPWM(e,t,"A","H","EPWM0_4",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_A18")
else
fill_invalid_GPIO(e,t,"A",8)
end
a[37]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPH"],240),4)
e={}
e["pin_no"]="38"
e["texts"]={"PA.9","SC0_PWR","SPI3_MISO0","PWM1_1","EPWM0_3","EBI_A19","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",9,true)
elseif o==2 then
fill_NUC400_SC(e,t,"A","H","SC0_PWR",0)
elseif o==3 then
fill_NUC400_SPI(e,t,"A","H","SPI3_MISO0",3)
fill_NUC400_SPI_IO(e,t,3,true)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","H","PWM1_1",1,1)
elseif o==5 then
fill_NUC400_EPWM(e,t,"A","H","EPWM0_3",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_A19")
else
fill_invalid_GPIO(e,t,"A",9)
end
a[38]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPH"],3840),8)
e={}
e["pin_no"]="39"
e["texts"]={"PA.10","SC0_DAT","SPI3_MOSI0","PWM1_0","EPWM0_2","EBI_A20","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",10,true)
elseif o==2 then
fill_NUC400_SC(e,t,"A","H","SC0_DAT",0)
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_NUC400_SPI(e,t,"A","H","SPI3_MOSI0",3)
fill_NUC400_SPI_IO(e,t,3,false)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","H","PWM1_0",1,0)
elseif o==5 then
fill_NUC400_EPWM(e,t,"A","H","EPWM0_2",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_A20")
else
fill_invalid_GPIO(e,t,"A",10)
end
a[39]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPH"],61440),12)
e={}
e["pin_no"]="40"
e["texts"]={"PA.11","UART0_RTS","SPI3_MISO1","PWM0_5","EPWM0_1","EBI_AD0","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",11,true)
elseif o==1 then
fill_NUC400_UART(e,t,"A","H","UART0_RTS",0)
elseif o==3 then
fill_NUC400_SPI(e,t,"A","H","SPI3_MISO1",3)
fill_NUC400_SPI_IO(e,t,3,true)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","H","PWM0_5",0,5)
elseif o==5 then
fill_NUC400_EPWM(e,t,"A","H","EPWM0_1",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_AD0")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",11)
end
a[40]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPH"],983040),16)
e={}
e["pin_no"]="41"
e["texts"]={"PA.12","UART0_CTS","SPI3_MOSI1","PWM0_4","EPWM0_0","EBI_AD1","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",12,true)
elseif o==1 then
fill_NUC400_UART(e,t,"A","H","UART0_CTS",0)
elseif o==3 then
fill_NUC400_SPI(e,t,"A","H","SPI3_MOSI1",3)
fill_NUC400_SPI_IO(e,t,3,false)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","H","PWM0_4",0,4)
elseif o==5 then
fill_NUC400_EPWM(e,t,"A","H","EPWM0_0",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_AD1")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",12)
end
a[41]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPH"],15728640),20)
e={}
e["pin_no"]="42"
e["texts"]={"PA.13","UART0_RXD","SC3_DAT","PWM1_4","EBI_AD2","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",13,true)
elseif o==1 then
fill_NUC400_UART(e,t,"A","H","UART0_RXD",0)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC400_SC(e,t,"A","H","SC3_DAT",3)
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_NUC400_PWM(e,t,"A","H","PWM1_4",1,4)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_AD2")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",13)
end
a[42]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPH"],251658240),24)
e={}
e["pin_no"]="43"
e["texts"]={"PA.14","UART0_TXD","SC3_CLK","PWM1_5","EBI_AD3","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",14,true)
elseif o==1 then
fill_NUC400_UART(e,t,"A","H","UART0_TXD",0)
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_NUC400_SC(e,t,"A","H","SC3_CLK",3)
elseif o==4 then
fill_NUC400_PWM(e,t,"A","H","PWM1_5",1,5)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_AD3")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"A",14)
end
a[43]=e
local o=ext.rshift(ext.band(t["GCR_GPA_MFPH"],4026531840),28)
e={}
e["pin_no"]="44"
e["texts"]={"PA.15","SC3_PWR","UART2_RTS","I2C0_SCL","EBI_A21","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"A",15,true)
elseif o==1 then
fill_NUC400_SC(e,t,"A","H","SC3_PWR",3)
elseif o==2 then
fill_NUC400_UART(e,t,"A","H","UART2_RTS",2)
elseif o==4 then
fill_NUC400_I2C(e,t,"A","H","I2C0_SCL",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"A","H","EBI_A21")
else
fill_invalid_GPIO(e,t,"A",15)
end
a[44]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPH"],240),4)
e={}
e["pin_no"]="45"
e["texts"]={"PC.9","STADC","UART2_CTS","SC3_RST","I2C0_SDA","CAP_DATA1","I2C3_SCL","EBI_A22","SD1_DAT0","EBI_A6","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",9,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"C","H","STADC")
else
fill_NUC400_EADC(e,t,"C","H","STADC")
end
elseif o==2 then
fill_NUC400_UART(e,t,"C","H","UART2_CTS",2)
elseif o==3 then
fill_NUC400_SC(e,t,"C","H","SC3_RST",3)
elseif o==4 then
fill_NUC400_I2C(e,t,"C","H","I2C0_SDA",0)
elseif o==5 then
fill_NUC400_VCAP(e,t,"C","H","CAP_DATA1")
elseif o==6 then
fill_NUC400_I2C(e,t,"C","H","I2C3_SCL",3)
elseif o==7 then
fill_NUC400_EBI(e,t,"C","H","EBI_A22")
elseif o==8 then
fill_NUC400_SD(e,t,"C","H","SD1_DAT0")
elseif o==9 then
fill_NUC400_EBI(e,t,"C","H","EBI_A6")
else
fill_invalid_GPIO(e,t,"C",9)
end
a[45]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPH"],3840),8)
e={}
e["pin_no"]="46"
e["texts"]={"PC.10","SC3_CD","UART2_RXD","PWM0_2","EBI_A23","EBI_AD2","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",10,true)
elseif o==1 then
fill_NUC400_SC(e,t,"C","H","SC3_CD",3)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_NUC400_UART(e,t,"C","H","UART2_RXD",2)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC400_PWM(e,t,"C","H","PWM0_2",0,2)
elseif o==6 then
fill_NUC400_EBI(e,t,"C","H","EBI_A23")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","H","EBI_AD2")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",10)
end
a[46]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPH"],61440),12)
e={}
e["pin_no"]="47"
e["texts"]={"PC.11","UART2_TXD","PWM0_3","EBI_A24","EBI_AD3","HS"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",11,true)
elseif o==2 then
fill_NUC400_UART(e,t,"C","H","UART2_TXD",2)
e["direction"]=kPinDirection_PushPullOut
elseif o==4 then
fill_NUC400_PWM(e,t,"C","H","PWM0_3",0,3)
elseif o==6 then
fill_NUC400_EBI(e,t,"C","H","EBI_A24")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","H","EBI_AD3")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",11)
end
a[47]=e
e={}
e["pin_no"]="48"
e["texts"]={"LDO_CAP"}
fill_NUC400_Normal(e,t,nil,nil,"LDO_CAP")
a[48]=e
e={}
e["pin_no"]="49"
e["texts"]={"VSS"}
fill_NUC400_Normal(e,t,nil,nil,"VSS")
a[49]=e
e={}
e["pin_no"]="50"
e["texts"]={"VDD"}
fill_NUC400_Normal(e,t,nil,nil,"VDD")
a[50]=e
e={}
e["pin_no"]="51"
e["texts"]={"VRES"}
fill_NUC400_Normal(e,t,nil,nil,"VRES")
a[51]=e
e={}
e["pin_no"]="52"
e["texts"]={"VBUS"}
fill_NUC400_Normal(e,t,nil,nil,"VBUS")
a[52]=e
e={}
e["pin_no"]="53"
e["texts"]={"USB_VDD33_CAP"}
fill_NUC400_Normal(e,t,nil,nil,"USB_VDD33_CAP")
a[53]=e
e={}
e["pin_no"]="54"
e["texts"]={"VSSA"}
fill_NUC400_Normal(e,t,nil,nil,"VSSA")
a[54]=e
e={}
e["pin_no"]="55"
e["texts"]={"USB0_D-"}
fill_NUC400_USB_OTG(e,t,nil,nil,"USB0_D-")
a[55]=e
e={}
e["pin_no"]="56"
e["texts"]={"USB0_D+"}
fill_NUC400_USB_OTG(e,t,nil,nil,"USB0_D+")
a[56]=e
e={}
e["pin_no"]="57"
e["texts"]={"USB0_OTG_ID"}
fill_NUC400_USB_OTG(e,t,nil,nil,"USB0_OTG_ID")
a[57]=e
local o=ext.band(t["GCR_GPB_MFPL"],15)
e={}
e["pin_no"]="58"
e["texts"]={"INT1","I2C4_SCL","USB0_VBUS_ST","PB.0"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",0,false)
elseif o==1 then
fill_NUC400_USB_OTG(e,t,"B","L","USB0_VBUS_ST")
elseif o==2 then
fill_NUC400_I2C(e,t,"B","L","I2C4_SCL",4)
elseif o==8 then
fill_NUC400_Normal(e,t,"B","L","INT1")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"B",0)
end
a[58]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPL"],240),4)
e={}
e["pin_no"]="59"
e["texts"]={"TM1_CNT_OUT","I2C4_SDA","USB0_VBUS_EN","PB.1"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",1,false)
elseif o==1 then
fill_NUC400_USB_OTG(e,t,"B","L","USB0_VBUS_EN")
elseif o==2 then
fill_NUC400_I2C(e,t,"B","L","I2C4_SDA",4)
elseif o==3 then
fill_NUC400_TM(e,t,"B","L","TM1_CNT_OUT",1)
else
fill_invalid_GPIO(e,t,"B",1)
end
a[59]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPL"],3840),8)
e={}
e["pin_no"]="60"
e["texts"]={"HS","EBI_AD4","USB1_D-","SPI2_SS0","UART1_RXD","PB.2"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",2,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","L","UART1_RXD",1)
e["direction"]=kPinDirection_In
elseif o==2 then
fill_NUC400_SPI(e,t,"B","L","SPI2_SS0",2)
elseif o==3 then
fill_NUC400_USB(e,t,"B","L","USB1_D-")
elseif o==7 then
fill_NUC400_EBI(e,t,"B","L","EBI_AD4")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",2)
end
a[60]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPL"],61440),12)
e={}
e["pin_no"]="61"
e["texts"]={"HS","EBI_AD5","USB1_D+","SPI2_CLK","UART1_TXD","PB.3"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",3,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","L","UART1_TXD",1)
e["direction"]=kPinDirection_PushPullOut
elseif o==2 then
fill_NUC400_SPI(e,t,"B","L","SPI2_CLK",2)
elseif o==3 then
fill_NUC400_USB(e,t,"B","L","USB1_D+")
elseif o==7 then
fill_NUC400_EBI(e,t,"B","L","EBI_AD5")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",3)
end
a[61]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPL"],983040),16)
e={}
e["pin_no"]="62"
e["texts"]={"HS","EBI_AD6","TM0_CNT_OUT","UART4_RXD","SPI2_MISO0","UART1_RTS","PB.4"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",4,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","L","UART1_RTS",1)
elseif o==2 then
fill_NUC400_SPI(e,t,"B","L","SPI2_MISO0",2)
fill_NUC400_SPI_IO(e,t,2,true)
elseif o==3 then
fill_NUC400_UART(e,t,"B","L","UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==4 then
fill_NUC400_TM(e,t,"B","L","TM0_CNT_OUT",0)
elseif o==7 then
fill_NUC400_EBI(e,t,"B","L","EBI_AD6")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",4)
end
a[62]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPL"],15728640),20)
e={}
e["pin_no"]="63"
e["texts"]={"HS","EBI_AD7","UART4_TXD","SPI2_MOSI0","UART1_CTS","PB.5"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",5,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","L","UART1_CTS",1)
elseif o==2 then
fill_NUC400_SPI(e,t,"B","L","SPI2_MOSI0",2)
fill_NUC400_SPI_IO(e,t,2,false)
elseif o==3 then
fill_NUC400_UART(e,t,"B","L","UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==7 then
fill_NUC400_EBI(e,t,"B","L","EBI_AD7")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",5)
end
a[63]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPL"],251658240),24)
e={}
e["pin_no"]="64"
e["texts"]={"HS","EBI_AD8","EPWM1_0","PWM1_4","UART4_RTS","BRAKE01","I2C2_SCL","PB.6"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",6,true)
elseif o==1 then
fill_NUC400_I2C(e,t,"B","L","I2C2_SCL",2)
elseif o==2 then
fill_NUC400_EPWM(e,t,"B","L","BRAKE01",0)
elseif o==3 then
fill_NUC400_UART(e,t,"B","L","UART4_RTS",4)
elseif o==4 then
fill_NUC400_PWM(e,t,"B","L","PWM1_4",1,4)
elseif o==5 then
fill_NUC400_EPWM(e,t,"B","L","EPWM1_0",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"B","L","EBI_AD8")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",6)
end
a[64]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPL"],4026531840),28)
e={}
e["pin_no"]="65"
e["texts"]={"HS","EBI_AD9","EPWM1_1","PWM1_5","UART4_CTS","BRAKE00","I2C2_SDA","PB.7"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",7,true)
elseif o==1 then
fill_NUC400_I2C(e,t,"B","L","I2C2_SDA",2)
elseif o==2 then
fill_NUC400_EPWM(e,t,"B","L","BRAKE00",0)
elseif o==3 then
fill_NUC400_UART(e,t,"B","L","UART4_CTS",4)
elseif o==4 then
fill_NUC400_PWM(e,t,"B","L","PWM1_5",1,5)
elseif o==5 then
fill_NUC400_EPWM(e,t,"B","L","EPWM1_1",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"B","L","EBI_AD9")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",7)
end
a[65]=e
local o=ext.band(t["GCR_GPB_MFPH"],15)
e={}
e["pin_no"]="66"
e["texts"]={"HS","EBI_AD10","EPWM1_2","UART5_CTS","PB.8"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",8,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","H","UART5_CTS",5)
elseif o==5 then
fill_NUC400_EPWM(e,t,"B","H","EPWM1_2",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"B","H","EBI_AD10")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",8)
end
a[66]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPH"],240),4)
e={}
e["pin_no"]="67"
e["texts"]={"HS","EBI_AD11","EPWM1_3","UART5_RTS","PB.9"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",9,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","H","UART5_RTS",5)
elseif o==5 then
fill_NUC400_EPWM(e,t,"B","H","EPWM1_3",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"B","H","EBI_AD11")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",9)
end
a[67]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPH"],3840),8)
e={}
e["pin_no"]="68"
e["texts"]={"HS","EBI_AD12","EPWM1_4","UART5_TXD","PB.10"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",10,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","H","UART5_TXD",5)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_NUC400_EPWM(e,t,"B","H","EPWM1_4",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"B","H","EBI_AD12")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",10)
end
a[68]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPH"],61440),12)
e={}
e["pin_no"]="69"
e["texts"]={"HS","EBI_AD13","EPWM1_5","UART5_RXD","PB.11"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",11,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","H","UART5_RXD",5)
e["direction"]=kPinDirection_In
elseif o==5 then
fill_NUC400_EPWM(e,t,"B","H","EPWM1_5",1)
elseif o==7 then
fill_NUC400_EBI(e,t,"B","H","EBI_AD13")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",11)
end
a[69]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPH"],983040),16)
e={}
e["pin_no"]="70"
e["texts"]={"HS","EBI_AD14","EMAC_MII_MDC","CAN0_RXD","SPI2_MISO1","UART4_RTS","PB.12"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",12,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","H","UART4_RTS",4)
elseif o==2 then
fill_NUC400_SPI(e,t,"B","H","SPI2_MISO1",2)
fill_NUC400_SPI_IO(e,t,2,true)
elseif o==3 then
fill_NUC400_CAN(e,t,"B","H","CAN0_RXD",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"B","H","EMAC_MII_MDC")
elseif o==7 then
fill_NUC400_EBI(e,t,"B","H","EBI_AD14")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",12)
end
a[70]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPH"],15728640),20)
e={}
e["pin_no"]="71"
e["texts"]={"HS","EBI_AD15","EMAC_MII_MDIO","CAN0_TXD","SPI2_MOSI1","UART4_CTS","PB.13"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",13,true)
elseif o==1 then
fill_NUC400_UART(e,t,"B","H","UART4_CTS",4)
elseif o==2 then
fill_NUC400_SPI(e,t,"B","H","SPI2_MOSI1",2)
fill_NUC400_SPI_IO(e,t,2,false)
elseif o==3 then
fill_NUC400_CAN(e,t,"B","H","CAN0_TXD",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"B","H","EMAC_MII_MDIO")
elseif o==7 then
fill_NUC400_EBI(e,t,"B","H","EBI_AD15")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"B",13)
end
a[71]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPH"],251658240),24)
e={}
e["pin_no"]="72"
e["texts"]={"HS","EMAC_MII_MDC","BRAKE01","SC1_RST","I2S1_MCLK","PB.14"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",14,true)
elseif o==1 then
fill_NUC400_I2S(e,t,"B","H","I2S1_MCLK",1)
elseif o==2 then
fill_NUC400_SC(e,t,"B","H","SC1_RST",1)
elseif o==4 then
fill_NUC400_EPWM(e,t,"B","H","BRAKE01",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"B","H","EMAC_MII_MDC")
else
fill_invalid_GPIO(e,t,"B",14)
end
a[72]=e
local o=ext.rshift(ext.band(t["GCR_GPB_MFPH"],4026531840),28)
e={}
e["pin_no"]="73"
e["texts"]={"HS","EMAC_MII_MDIO","BRAKE00","SC1_DAT","I2S1_DO","PB.15"}
if o==0 then
fill_NUC400_GPIO(e,t,"B",15,true)
elseif o==1 then
fill_NUC400_I2S(e,t,"B","H","I2S1_DO",1)
elseif o==2 then
fill_NUC400_SC(e,t,"B","H","SC1_DAT",1)
e["direction"]=kPinDirection_Bi
elseif o==4 then
fill_NUC400_EPWM(e,t,"B","H","BRAKE00",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"B","H","EMAC_MII_MDIO")
else
fill_invalid_GPIO(e,t,"B",15)
end
a[73]=e
e={}
e["pin_no"]="74"
e["texts"]={"VDD"}
fill_NUC400_Normal(e,t,nil,nil,"VDD")
a[74]=e
local o=ext.band(t["GCR_GPC_MFPL"],15)
e={}
e["pin_no"]="75"
e["texts"]={"HS","INT2","EBI_MCLK","EMAC_REFCLK","UART4_RXD","SC1_DAT","I2S1_DI","PC.0"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",0,true)
elseif o==1 then
fill_NUC400_I2S(e,t,"C","L","I2S1_DI",1)
elseif o==2 then
fill_NUC400_SC(e,t,"C","L","SC1_DAT",1)
e["direction"]=kPinDirection_Bi
elseif o==3 then
fill_NUC400_UART(e,t,"C","L","UART4_RXD",4)
e["direction"]=kPinDirection_In
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_REFCLK")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_MCLK")
elseif o==8 then
fill_NUC400_Normal(e,t,"C","L","INT2")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"C",0)
end
a[75]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPL"],240),4)
e={}
e["pin_no"]="76"
e["texts"]={"HS","EBI_AD13","EMAC_MII_RXERR","TM3_CNT_OUT","UART4_TXD","SC1_CLK","I2S1_BCLK","PC.1"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",1,true)
elseif o==1 then
fill_NUC400_I2S(e,t,"C","L","I2S1_BCLK",1)
elseif o==2 then
fill_NUC400_SC(e,t,"C","L","SC1_CLK",1)
elseif o==3 then
fill_NUC400_UART(e,t,"C","L","UART4_TXD",4)
e["direction"]=kPinDirection_PushPullOut
elseif o==5 then
fill_NUC400_TM(e,t,"C","L","TM3_CNT_OUT",3)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_MII_RXERR")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_AD13")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",1)
end
a[76]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPL"],3840),8)
e={}
e["pin_no"]="77"
e["texts"]={"HS","EBI_AD12","EMAC_MII_RXDV","SPI0_SS0","UART4_RTS","SC1_PWR","I2S1_LRCK","PC.2"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",2,true)
elseif o==1 then
fill_NUC400_I2S(e,t,"C","L","I2S1_LRCK",1)
elseif o==2 then
fill_NUC400_SC(e,t,"C","L","SC1_PWR",1)
elseif o==3 then
fill_NUC400_UART(e,t,"C","L","UART4_RTS",4)
elseif o==4 then
fill_NUC400_SPI(e,t,"C","L","SPI0_SS0",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_MII_RXDV")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_AD12")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",2)
end
a[77]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPL"],61440),12)
e={}
e["pin_no"]="78"
e["texts"]={"HS","ECAP0_IC2","EBI_AD11","EMAC_MII_RXD1","QEI0_Z","SPI0_MISO1","UART4_CTS","SC1_CD","I2S1_MCLK","PC.3"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",3,true)
elseif o==1 then
fill_NUC400_I2S(e,t,"C","L","I2S1_MCLK",1)
elseif o==2 then
fill_NUC400_SC(e,t,"C","L","SC1_CD",1)
e["direction"]=kPinDirection_In
elseif o==3 then
fill_NUC400_UART(e,t,"C","L","UART4_CTS",4)
elseif o==4 then
fill_NUC400_SPI(e,t,"C","L","SPI0_MISO1",0)
fill_NUC400_SPI_IO(e,t,0,true)
elseif o==5 then
fill_NUC400_QEI(e,t,"C","L","QEI0_Z",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_MII_RXD1")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_AD11")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_NUC400_ECAP(e,t,"C","L","ECAP0_IC2",0)
else
fill_invalid_GPIO(e,t,"C",3)
end
a[78]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPL"],983040),16)
e={}
e["pin_no"]="79"
e["texts"]={"HS","ECAP0_IC1","EBI_AD10","EMAC_MII_RXD0","QEI0_B","SPI0_MOSI1","SC1_RST","I2S1_DO","PC.4"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",4,true)
elseif o==1 then
fill_NUC400_I2S(e,t,"C","L","I2S1_DO",1)
elseif o==2 then
fill_NUC400_SC(e,t,"C","L","SC1_RST",1)
elseif o==4 then
fill_NUC400_SPI(e,t,"C","L","SPI0_MOSI1",0)
fill_NUC400_SPI_IO(e,t,0,false)
elseif o==5 then
fill_NUC400_QEI(e,t,"C","L","QEI0_B",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_MII_RXD0")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_AD10")
e["direction"]=kPinDirection_Bi
elseif o==8 then
fill_NUC400_ECAP(e,t,"C","L","ECAP0_IC1",0)
else
fill_invalid_GPIO(e,t,"C",4)
end
a[79]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPL"],15728640),20)
e={}
e["pin_no"]="80"
e["texts"]={"HS","ECAP0_IC0","EBI_MCLK","EMAC_MII_RXCLK","QEI0_A","CLKO","PC.5"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",5,true)
elseif o==1 then
fill_NUC400_CLKO(e,t,"C","L","CLKO")
elseif o==5 then
fill_NUC400_QEI(e,t,"C","L","QEI0_A",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_MII_RXCLK")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_MCLK")
elseif o==8 then
fill_NUC400_ECAP(e,t,"C","L","ECAP0_IC0",0)
else
fill_invalid_GPIO(e,t,"C",5)
end
a[80]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPL"],251658240),24)
e={}
e["pin_no"]="81"
e["texts"]={"HS","EBI_AD9","EMAC_MII_TXD0","TM2_CNT_OUT","SPI0_MISO0","TM2_EXT","PC.6"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",6,true)
elseif o==1 then
fill_NUC400_TM(e,t,"C","L","TM2_EXT",2)
elseif o==4 then
fill_NUC400_SPI(e,t,"C","L","SPI0_MISO0",0)
fill_NUC400_SPI_IO(e,t,0,true)
elseif o==5 then
fill_NUC400_TM(e,t,"C","L","TM2_CNT_OUT",2)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_MII_TXD0")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_AD9")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",6)
end
a[81]=e
local o=ext.rshift(ext.band(t["GCR_GPC_MFPL"],4026531840),28)
e={}
e["pin_no"]="82"
e["texts"]={"HS","EBI_AD8","EMAC_MII_TXD1","SPI0_MOSI0","TM1_EXT","PC.7"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",7,true)
elseif o==1 then
fill_NUC400_TM(e,t,"C","L","TM1_EXT",1)
elseif o==4 then
fill_NUC400_SPI(e,t,"C","L","SPI0_MOSI0",0)
fill_NUC400_SPI_IO(e,t,0,false)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","L","EMAC_MII_TXD1")
elseif o==7 then
fill_NUC400_EBI(e,t,"C","L","EBI_AD8")
e["direction"]=kPinDirection_Bi
else
fill_invalid_GPIO(e,t,"C",7)
end
a[82]=e
local o=ext.band(t["GCR_GPC_MFPH"],15)
e={}
e["pin_no"]="83"
e["texts"]={"HS","EMAC_MII_TXEN","SPI0_CLK","TM0_EXT","PC.8"}
if o==0 then
fill_NUC400_GPIO(e,t,"C",8,true)
elseif o==1 then
fill_NUC400_TM(e,t,"C","H","TM0_EXT",0)
elseif o==4 then
fill_NUC400_SPI(e,t,"C","H","SPI0_CLK",0)
elseif o==6 then
fill_NUC400_EMC(e,t,"C","H","EMAC_MII_TXEN")
else
fill_invalid_GPIO(e,t,"C",8)
end
a[83]=e
e={}
e["pin_no"]="84"
e["texts"]={"LDO_CAP"}
fill_NUC400_Normal(e,t,nil,nil,"LDO_CAP")
a[84]=e
e={}
e["pin_no"]="85"
e["texts"]={"VSS"}
fill_NUC400_Normal(e,t,nil,nil,"VSS")
a[85]=e
local o=ext.band(t["GCR_GPE_MFPL"],15)
e={}
e["pin_no"]="86"
e["texts"]={"INT4","ADC0_0","PE.0"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",0,false)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_0")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_0")
end
elseif o==8 then
fill_NUC400_Normal(e,t,"E","L","INT4")
e["highlight_color"]=kColor_EINT
e["pin_bg_color"]=kBgColor_EINT
e["direction"]=kPinDirection_In
else
fill_invalid_GPIO(e,t,"E",0)
end
a[86]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPL"],240),4)
e={}
e["pin_no"]="87"
e["texts"]={"TM2_CNT_OUT","ADC0_1","PE.1"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",1,false)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_1")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_1")
end
elseif o==3 then
fill_NUC400_TM(e,t,"E","L","TM2_CNT_OUT",2)
else
fill_invalid_GPIO(e,t,"E",1)
end
a[87]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPL"],3840),8)
e={}
e["pin_no"]="88"
e["texts"]={"HS","SPI0_MISO0","ACMP0_O","ADC0_2","PE.2"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",2,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_2")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_2")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","L","ACMP0_O")
e["direction"]=kPinDirection_PushPullOut
elseif o==3 then
fill_NUC400_SPI(e,t,"E","L","SPI0_MISO0",0)
fill_NUC400_SPI_IO(e,t,0,true)
else
fill_invalid_GPIO(e,t,"E",2)
end
a[88]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPL"],61440),12)
e={}
e["pin_no"]="89"
e["texts"]={"HS","SPI0_MOSI0","ACMP0_P3","ADC0_3","PE.3"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",3,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_3")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_3")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","L","ACMP0_P3")
elseif o==3 then
fill_NUC400_SPI(e,t,"E","L","SPI0_MOSI0",0)
fill_NUC400_SPI_IO(e,t,0,false)
else
fill_invalid_GPIO(e,t,"E",3)
end
a[89]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPL"],983040),16)
e={}
e["pin_no"]="90"
e["texts"]={"HS","SPI0_SS0","ACMP0_P2","ADC0_4","PE.4"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",4,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_4")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_4")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","L","ACMP0_P2")
elseif o==3 then
fill_NUC400_SPI(e,t,"E","L","SPI0_SS0",0)
else
fill_invalid_GPIO(e,t,"E",4)
end
a[90]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPL"],15728640),20)
e={}
e["pin_no"]="91"
e["texts"]={"HS","SD0_CDn","SPI0_CLK","ACMP0_P1","ADC0_5","PE.5"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",5,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_5")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_5")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","L","ACMP0_P1")
elseif o==3 then
fill_NUC400_SPI(e,t,"E","L","SPI0_CLK",0)
elseif o==4 then
fill_NUC400_SD(e,t,"E","L","SD0_CDn")
else
fill_invalid_GPIO(e,t,"E",5)
end
a[91]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPL"],251658240),24)
e={}
e["pin_no"]="92"
e["texts"]={"HS","EBI_nWR","SD0_CMD","SPI0_MISO0","ACMP0_P0","ADC0_6","PE.6"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",6,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_6")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_6")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","L","ACMP0_P0")
elseif o==3 then
fill_NUC400_SPI(e,t,"E","L","SPI0_MISO0",0)
fill_NUC400_SPI_IO(e,t,0,true)
elseif o==4 then
fill_NUC400_SD(e,t,"E","L","SD0_CMD")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","L","EBI_nWR")
else
fill_invalid_GPIO(e,t,"E",6)
end
a[92]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPL"],4026531840),28)
e={}
e["pin_no"]="93"
e["texts"]={"HS","EBI_nRD","SD0_CLK","SPI0_MOSI0","ACMP0_N","ADC0_7","PE.7"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",7,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a==0 then
fill_NUC400_ADC(e,t,"E","L","ADC0_7")
else
fill_NUC400_EADC(e,t,"E","L","ADC0_7")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","L","ACMP0_N")
elseif o==3 then
fill_NUC400_SPI(e,t,"E","L","SPI0_MOSI0",0)
fill_NUC400_SPI_IO(e,t,0,false)
elseif o==4 then
fill_NUC400_SD(e,t,"E","L","SD0_CLK")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","L","EBI_nRD")
else
fill_invalid_GPIO(e,t,"E",7)
end
a[93]=e
e={}
e["pin_no"]="94"
e["texts"]={"AVSS"}
fill_NUC400_Normal(e,t,nil,nil,"AVSS")
a[94]=e
e={}
e["pin_no"]="95"
e["texts"]={"Vref"}
fill_NUC400_Normal(e,t,nil,nil,"Vref")
a[95]=e
e={}
e["pin_no"]="96"
e["texts"]={"AVDD"}
fill_NUC400_Normal(e,t,nil,nil,"AVDD")
a[96]=e
local o=ext.band(t["GCR_GPE_MFPH"],15)
e={}
e["pin_no"]="97"
e["texts"]={"HS","EBI_ALE","SD0_DAT3","TM1_CNT_OUT","ACMP1_N","ADC0_8","ADC1_0","PE.8"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",8,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a~=0 then
fill_NUC400_EADC(e,t,"E","H","ADC1_0")
end
if a==0 then
fill_NUC400_ADC(e,t,"E","H","ADC0_8")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","H","ACMP1_N")
elseif o==3 then
fill_NUC400_TM(e,t,"E","H","TM1_CNT_OUT",1)
elseif o==4 then
fill_NUC400_SD(e,t,"E","H","SD0_DAT3")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","H","EBI_ALE")
else
fill_invalid_GPIO(e,t,"E",8)
end
a[97]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPH"],240),4)
e={}
e["pin_no"]="98"
e["texts"]={"HS","EBI_nWRH","SD0_DAT2","ACMP1_P0","ADC0_9","ADC1_1","PE.9"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",9,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a~=0 then
fill_NUC400_EADC(e,t,"E","H","ADC1_1")
end
if a==0 then
fill_NUC400_ADC(e,t,"E","H","ADC0_9")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","H","ACMP1_P0")
elseif o==4 then
fill_NUC400_SD(e,t,"E","H","SD0_DAT2")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","H","EBI_nWRH")
else
fill_invalid_GPIO(e,t,"E",9)
end
a[98]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPH"],3840),8)
e={}
e["pin_no"]="99"
e["texts"]={"HS","EBI_nWRL","SD0_DAT1","SPI0_MISO1","ACMP1_P1","ADC0_10","ADC1_2","PE.10"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",10,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a~=0 then
fill_NUC400_EADC(e,t,"E","H","ADC1_2")
end
if a==0 then
fill_NUC400_ADC(e,t,"E","H","ADC0_10")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","H","ACMP1_P1")
elseif o==3 then
fill_NUC400_SPI(e,t,"E","H","SPI0_MISO1",0)
fill_NUC400_SPI_IO(e,t,0,true)
elseif o==4 then
fill_NUC400_SD(e,t,"E","H","SD0_DAT1")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","H","EBI_nWRL")
else
fill_invalid_GPIO(e,t,"E",10)
end
a[99]=e
local o=ext.rshift(ext.band(t["GCR_GPE_MFPH"],61440),12)
e={}
e["pin_no"]="100"
e["texts"]={"HS","EBI_nCS0","ACMP2_P3","SD0_DAT0","SPI0_MOSI1","ACMP1_P2","ADC0_11","ADC1_3","PE.11"}
if o==0 then
fill_NUC400_GPIO(e,t,"E",11,true)
elseif o==1 then
local a=ext.band(t["GCR_VREFCR"],256)
if a~=0 then
fill_NUC400_EADC(e,t,"E","H","ADC1_3")
end
if a==0 then
fill_NUC400_ADC(e,t,"E","H","ADC0_11")
end
elseif o==2 then
fill_NUC400_ACMP(e,t,"E","H","ACMP1_P2")
elseif o==3 then
fill_NUC400_SPI(e,t,"E","H","SPI0_MOSI1",0)
fill_NUC400_SPI_IO(e,t,0,false)
elseif o==4 then
fill_NUC400_SD(e,t,"E","H","SD0_DAT0")
elseif o==5 then
fill_NUC400_ACMP(e,t,"E","H","ACMP2_P3")
elseif o==7 then
fill_NUC400_EBI(e,t,"E","H","EBI_nCS0")
else
fill_invalid_GPIO(e,t,"E",11)
end
a[100]=e
return{name=i,information="",pins=a}
end