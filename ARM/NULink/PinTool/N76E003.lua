REG=
{
TA=199,
SFRS=145,
P0=128,
P1=144,
P2=160,
AUXR1=162,
P3=176,
P0M1=177,
I2CON=192,
PIOCON0=222,
ADCCON1=225,
P0M2=178,
P1M1=179,
P1M2=180,
P2S=181,
P3M1=172,
P3M2=173,
P0S=177,
P0SR=178,
P1S=179,
P1SR=180,
P2S=181,
P3S=172,
P3SR=173,
PIOCON1=198,
}
g_N76E003_regs=REG
function read_N76E003_Registers(e,e,e,e)
local e={}
e[0]={}
e[1]={}
function WriteMem8(e,t)
ice:WriteMem(536870912+e,{t})
end
function ReadMem8(a,t)
if not t then t=1 end
return unpack(ice:ReadMem(536870912+a,t))
end
e[0]["P0"]=ReadMem8(g_N76E003_regs.P0)
e[0]["P1"]=ReadMem8(g_N76E003_regs.P1)
e[0]["P2"]=ReadMem8(g_N76E003_regs.P2)
e[0]["P3"]=ReadMem8(g_N76E003_regs.P3)
e[1]["P0"]=e[0]["P0"]
e[1]["P1"]=e[0]["P1"]
e[1]["P2"]=e[0]["P2"]
e[1]["P3"]=e[0]["P3"]
e[0]["SFRS"]=ReadMem8(g_N76E003_regs.SFRS)
e[1]["SFRS"]=e[0]["SFRS"]
e[0]["AUXR1"]=ReadMem8(g_N76E003_regs.AUXR1)
e[1]["AUXR1"]=e[0]["AUXR1"]
e[0]["I2CON"]=ReadMem8(g_N76E003_regs.I2CON)
e[1]["I2CON"]=e[0]["I2CON"]
e[0]["ADCCON1"]=ReadMem8(g_N76E003_regs.ADCCON1)
e[1]["ADCCON1"]=e[0]["ADCCON1"]
e[0]["PIOCON0"]=ReadMem8(g_N76E003_regs.PIOCON0)
e[1]["PIOCON0"]=e[0]["PIOCON0"]
if e[0]["SFRS"]==0 then
e[0]["P0M1"],
e[0]["P0M2"],
e[0]["P1M1"],
e[0]["P1M2"],
e[0]["P2S"]=ReadMem8(g_N76E003_regs.P0M1,5)
e[0]["P3M1"]=ReadMem8(g_N76E003_regs.P3M1)
e[0]["P3M2"]=ReadMem8(g_N76E003_regs.P3M2)
end
if e[0]["SFRS"]==1 then
e[1]["P0S"],
e[1]["P0SR"],
e[1]["P1S"],
e[1]["P1SR"],
e[1]["P2S"]=ReadMem8(g_N76E003_regs.P0S,5)
e[1]["P3S"]=ReadMem8(g_N76E003_regs.P3S)
e[1]["P3SR"]=ReadMem8(g_N76E003_regs.P3SR)
e[1]["PIOCON1"]=ReadMem8(g_N76E003_regs.PIOCON1)
end
return e
end
local s={
[0]=kPinDirection_Bi,
[1]=kPinDirection_PushPullOut,
[2]=kPinDirection_In,
[3]=kPinDirection_OpenDrainOut,
}
local e={
[0]="Quasi-bidirectional",
[1]="OUTPUT",
[2]="INPUT",
[3]="Open-Drain",
}
function get_common_regs(o,e,t)
local a={"SFRS"}
if(e==0 and t==6)
or(e==0 and t==7)then
table.insert(a,"AUXR1")
end
if(e==1 and t==3)
or(e==1 and t==4)
or(e==1 and t==6)
or(e==0 and t==2)then
table.insert(a,"I2CON")
end
if(e==0 and t==4)
or(e==1 and t==3)then
table.insert(a,"ADCCON1")
end
if(e==0 and t==5)
or(e==1 and t==5)
or(e==1 and t==4)
or(e==0 and t==4)then
table.insert(a,"PIOCON1")
end
return reg2str("Common registers",g_N76E003_regs,o,a,true)
end
function fill_N76E003_GPIO(o,i,e,a,h)
if h==nil then h=string.format("P%d.%d",e,a)end
local r=i[0]["SFRS"]
local n={}
n[0]={}
n[1]={}
o["highlight_text"]=h
o["normal_color"]=kColor_Invalid
o["highlight_color"]=kColor_GPIO
o["pin_bg_color"]=kBgColor_GPIO
if not(e==2)then
table.insert(n[0],string.format("P%dM1",e))
table.insert(n[0],string.format("P%dM2",e))
if r==0 then
local t=i[0][string.format("P%dM1",e)]
local e=i[0][string.format("P%dM2",e)]
local t=ext.band(ext.rshift(t,a),1)
local e=ext.band(ext.rshift(e,a),1)
o["direction"]=s[2*t+e]
else
o["direction"]=kPinDirection_Unknown
end
elseif a==0 then
o["direction"]=kPinDirection_In
end
local t=""
table.insert(n[0],string.format("P%d",e))
local s=i[0][string.format("P%d",e)]
if ext.band(s,ext.lshift(1,a))==0 then
o["status"]=kPinStatus_Low
t=t.."Pin I/O <b>low</b><br>"
else
o["status"]=kPinStatus_High
t=t.."Pin I/O <b>high</b><br>"
end
table.insert(n[1],string.format("P%dS",e))
if r==0 then
else
local o=i[1][string.format("P%dS",e)]
if ext.band(o,ext.lshift(1,a))==0 then
t=t..string.format("P%d.%d Schmitt triggered input <b>disabled</b><br>",e,a)
else
t=t..string.format("P%d.%d Schmitt triggered input <b>enabled</b><br>",e,a)
end
end
if not(e==2)then
table.insert(n[1],string.format("P%dSR",e))
if r==0 then
else
local o=i[1][string.format("P%dSR",e)]
if ext.band(o,ext.lshift(1,a))==0 then
t=t..string.format("P%d.%d <b>normal</b> output slew rate<br>",e,a)
else
t=t..string.format("P%d.%d <b>high-speed</b> output slew rate<br>",e,a)
end
end
end
local s=""
if s~=""then
o["pin_no_color"]=kBgColor_Error
s="<font color=red>"..s.."</font>"
end
local e=get_common_regs(i[r],e,a)
local a=reg2str("GPIO setting registers (SFR0)",g_N76E003_regs,i[0],n[0],true)
local i=reg2str("GPIO setting registers (SFR1)",g_N76E003_regs,i[1],n[1],true)
o["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s"..
"<b>Information</b><br>"..
"%s",
h,
s,
e,
a,
i,
t)
return h,s,e,a,i,t
end
function fill_N76E003_PWM(e,i,o,a,t)
local s,a,o,i,n,s=fill_N76E003_GPIO(e,i,o,a)
e["highlight_text"]=t
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_PWM
e["pin_bg_color"]=kBgColor_PWM
e["status"]=kPinStatus_Unknown
e["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
t,
a,
o,
i,
n)
end
function fill_N76E003_Normal(e,a,a,a,t)
e["highlight_text"]=t
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
e["information"]=string.format(
"<b>%s</b><br>",
t)
end
function fill_N76E003_Unknown(e,o,i,a,t)
local s,i,a,o,n,s=fill_N76E003_GPIO(e,o,i,a)
e["highlight_text"]=t
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["status"]=kPinStatus_Unknown
e["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
"<font color=blue>Unable to get pin function select via ICE</font>",
i,
a,
o,
n)
end
