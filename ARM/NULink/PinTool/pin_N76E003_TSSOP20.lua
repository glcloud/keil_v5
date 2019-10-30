local e=debug.getinfo(1).source:gsub("^@",""):gsub("(.+[\\/])[^\\/]+$","%1")
dofile(e.."N76E003.lua")
function get_chip_status_N76E003_TSSOP20(n,e,e)
local a={}
local t=read_N76E003_Registers()
local e
e={}
e["pin_no"]="1"
e["texts"]={"P0.5","AIN4","T0","IC6","PWM2"}
if t[0]["SFRS"]==1 then
local a=ext.band(ext.rshift(t[1]["PIOCON1"],2),1)
if a==0 then
fill_N76E003_GPIO(e,t,0,5)
else
fill_N76E003_PWM(e,t,0,5,"PWM2")
end
else
fill_N76E003_Unknown(e,t,0,5,"")
end
a[1]=e
e={}
e["pin_no"]="2"
local o=ext.band(ext.rshift(t[0]["AUXR1"],2),1)
if o==0 then
e["texts"]={"P0.6","AIN3","TXD"}
else
e["texts"]={"P0.6","AIN3","RXD"}
end
fill_N76E003_GPIO(e,t,0,6)
a[2]=e
e={}
e["pin_no"]="3"
local o=ext.band(ext.rshift(t[0]["AUXR1"],2),1)
if o==0 then
e["texts"]={"P0.7","AIN2","RXD"}
else
e["texts"]={"P0.7","AIN2","TXD"}
end
fill_N76E003_GPIO(e,t,0,7)
a[3]=e
e={}
e["pin_no"]="4"
e["texts"]={"P2.0,RST"}
fill_N76E003_GPIO(e,t,2,0,"P2.0,RST")
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
a[4]=e
e={}
e["pin_no"]="5"
e["texts"]={"P3.0","AIN1","OSCIN","INT0"}
fill_N76E003_GPIO(e,t,3,0)
a[5]=e
e={}
e["pin_no"]="6"
e["texts"]={"P1.7","AIN0","INT1"}
fill_N76E003_GPIO(e,t,1,7)
a[6]=e
e={}
e["pin_no"]="7"
e["texts"]={"GND"}
fill_N76E003_Normal(e,t,nil,nil,"GND")
a[7]=e
e={}
e["pin_no"]="8"
local o=ext.band(t[0]["I2CON"],1)
if o==1 then
e["texts"]={"P1.6","OCDDA","ICPDA","TXD_1","SDA"}
else
e["texts"]={"P1.6","OCDDA","ICPDA","TXD_1"}
end
fill_N76E003_GPIO(e,t,1,6)
a[8]=e
e={}
e["pin_no"]="9"
e["texts"]={"VDD"}
fill_N76E003_Normal(e,t,nil,nil,"VDD")
a[9]=e
e={}
e["pin_no"]="10"
e["texts"]={"P1.5","SS","IC7","PWM5"}
if t[0]["SFRS"]==1 then
local a=ext.band(ext.rshift(t[1]["PIOCON1"],5),1)
if a==0 then
fill_N76E003_GPIO(e,t,1,5)
else
fill_N76E003_PWM(e,t,1,5,"PWM5")
end
else
fill_N76E003_Unknown(e,t,1,5,"")
end
a[10]=e
e={}
e["pin_no"]="11"
local o=ext.band(t[0]["I2CON"],1)
if o==0 then
e["texts"]={"PWM1","FB","SDA","P1.4"}
else
e["texts"]={"PWM1","FB","P1.4"}
end
if t[0]["SFRS"]==1 then
local a=ext.band(ext.rshift(t[1]["PIOCON1"],1),1)
if a==0 then
fill_N76E003_GPIO(e,t,1,4)
else
fill_N76E003_PWM(e,t,1,4,"PWM1")
end
else
fill_N76E003_Unknown(e,t,1,4,"")
end
a[11]=e
e={}
e["pin_no"]="12"
local i=ext.band(t[0]["I2CON"],1)
local o=ext.band(ext.rshift(t[0]["ADCCON1"],6),1)
if i==0 and o==0 then
e["texts"]={"SCL","P1.3"}
elseif i==1 and o==0 then
e["texts"]={"P1.3"}
elseif i==0 and o==1 then
e["texts"]={"STADC","SCL","P1.3"}
elseif i==1 and o==1 then
e["texts"]={"STADC","P1.3"}
end
fill_N76E003_GPIO(e,t,1,3)
a[12]=e
e={}
e["pin_no"]="13"
e["texts"]={"IC0","PWM0","P1.2"}
local o=ext.band(ext.rshift(t[0]["PIOCON0"],0),1)
if o==0 then
fill_N76E003_GPIO(e,t,1,2)
else
fill_N76E003_PWM(e,t,1,2,"PWM0")
end
a[13]=e
e={}
e["pin_no"]="14"
e["texts"]={"CLO","AIN7","IC1","PWM1","P1.1"}
local o=ext.band(ext.rshift(t[0]["PIOCON0"],1),1)
if o==0 then
fill_N76E003_GPIO(e,t,1,1)
else
fill_N76E003_PWM(e,t,1,1,"PWM1")
end
a[14]=e
e={}
e["pin_no"]="15"
e["texts"]={"SPCLK","IC2","PWM2","P1.0"}
local o=ext.band(ext.rshift(t[0]["PIOCON0"],2),1)
if o==0 then
fill_N76E003_GPIO(e,t,1,0)
else
fill_N76E003_PWM(e,t,1,0,"PWM2")
end
a[15]=e
e={}
e["pin_no"]="16"
e["texts"]={"T1","MOSI","IC3","PWM3","P0.0"}
local o=ext.band(ext.rshift(t[0]["PIOCON0"],3),1)
if o==0 then
fill_N76E003_GPIO(e,t,0,0)
else
fill_N76E003_PWM(e,t,0,0,"PWM3")
end
a[16]=e
e={}
e["pin_no"]="17"
e["texts"]={"MISO","IC4","PWM4","P0.1"}
local o=ext.band(ext.rshift(t[0]["PIOCON0"],4),1)
if o==0 then
fill_N76E003_GPIO(e,t,0,1)
else
fill_N76E003_PWM(e,t,0,1,"PWM4")
end
a[17]=e
e={}
e["pin_no"]="18"
local o=ext.band(t[0]["I2CON"],1)
if o==1 then
e["texts"]={"SCL","RXD_1","OCDCK","ICPCK","P0.2"}
else
e["texts"]={"RXD_1","OCDCK","ICPCK","P0.2"}
end
fill_N76E003_GPIO(e,t,0,2)
a[18]=e
e={}
e["pin_no"]="19"
e["texts"]={"AIN6","IC5","PWM5","P0.3"}
local o=ext.band(ext.rshift(t[0]["PIOCON0"],5),1)
if o==0 then
fill_N76E003_GPIO(e,t,0,3)
else
fill_N76E003_PWM(e,t,0,3,"PWM5")
end
a[19]=e
e={}
e["pin_no"]="20"
local o=ext.band(ext.rshift(t[0]["ADCCON1"],6),1)
if o==0 then
e["texts"]={"IC3","PWM3","STADC","AIN5","P0.4"}
else
e["texts"]={"IC3","PWM3","AIN5","P0.4"}
end
if t[0]["SFRS"]==1 then
local a=ext.band(ext.rshift(t[1]["PIOCON1"],3),1)
if a==0 then
fill_N76E003_GPIO(e,t,0,4)
else
fill_N76E003_PWM(e,t,0,4,"PWM3")
end
else
fill_N76E003_Unknown(e,t,0,4,"")
end
a[20]=e
return{name=n,information="",pins=a}
end
