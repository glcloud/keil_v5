REG=
{
GCR_GPA_ALT=1342177336,
GCR_GPB_ALT=1342177340,
CLK_PWRCON=1342177792,
CLK_AHBCLK=1342177796,
CLK_APBCLK=1342177800,
CLK_CLKSEL0=1342177808,
CLK_CLKSEL1=1342177812,
CLK_CLKDIV=1342177816,
CLK_CLKSEL2=1342177820,
GPIOA_PMD=1342193664,
GPIOA_INDIS=1342193668,
GPIOA_DOUT=1342193672,
GPIOA_DMASK=1342193676,
GPIOA_PIN=1342193680,
GPIOB_PMD=1342193728,
GPIOB_INDIS=1342193732,
GPIOB_DOUT=1342193736,
GPIOB_DMASK=1342193740,
GPIOB_PIN=1342193744,
UART0_BAUD=1074069540,
SPI0_CNTRL=1073938432,
SPI0_DIVIDER=1073938436,
I2C0_I2CON=1073872896,
I2C0_I2CLK=1073872912,
I2S_CON=1074397184,
I2S_CLKDIV=1074397188,
PWMA_PPR=1074003968,
PWMA_CSR=1074003972,
DPWM_CTRL=1074200576,
DPWM_ZOH_DIV=1074200592,
ADC_CLK_DIV=1074659336,
}
g_AU9100_regs=REG
function read_AU9100_Registers(e,e,e,e)
local e={}
e["GCR_GPA_ALT"],
e["GCR_GPB_ALT"]=ice:ReadMem32(g_AU9100_regs.GCR_GPA_ALT,2)
e["CLK_PWRCON"],
e["CLK_AHBCLK"],
e["CLK_APBCLK"],
e["REG_DUMMY0"],
e["CLK_CLKSEL0"],
e["CLK_CLKSEL1"],
e["CLK_CLKDIV"],
e["CLK_CLKSEL2"]=ice:ReadMem32(g_AU9100_regs.CLK_PWRCON,8)
e["GPIOA_PMD"],
e["GPIOA_INDIS"],
e["GPIOA_DOUT"],
e["GPIOA_DMASK"],
e["GPIOA_PIN"]=ice:ReadMem32(g_AU9100_regs.GPIOA_PMD,5)
e["GPIOB_PMD"],
e["GPIOB_INDIS"],
e["GPIOB_DOUT"],
e["GPIOB_DMASK"],
e["GPIOB_PIN"]=ice:ReadMem32(g_AU9100_regs.GPIOB_PMD,5)
e["SPI0_CNTRL"],
e["SPI0_DIVIDER"]=ice:ReadMem32(g_AU9100_regs.SPI0_CNTRL,2)
e["UART0_BAUD"],
e["I2C0_I2CON"],
e["I2C0_I2CLK"]=ice:ReadMemMulti(g_AU9100_regs.UART0_BAUD,
g_AU9100_regs.I2C0_I2CON,
g_AU9100_regs.I2C0_I2CLK)
e["I2S_CON"],
e["I2S_CLKDIV"],
e["ADC_CLK_DIV"]=ice:ReadMemMulti(g_AU9100_regs.I2S_CON,
g_AU9100_regs.I2S_CLKDIV,
g_AU9100_regs.ADC_CLK_DIV)
e["PWMA_PPR"],
e["PWMA_CSR"],
e["DPWM_CTRL"],
e["DPWM_ZOH_DIV"]=ice:ReadMemMulti(g_AU9100_regs.PWMA_PPR,
g_AU9100_regs.PWMA_CSR,
g_AU9100_regs.DPWM_CTRL,
g_AU9100_regs.DPWM_ZOH_DIV)
return e
end
local n={
[0]=kPinDirection_In,
[1]=kPinDirection_PushPullOut,
[2]=kPinDirection_OpenDrainOut,
[3]=kPinDirection_Bi,
}
local c={
[0]="INPUT",
[1]="OUTPUT",
[2]="Open-Drain",
[3]="Quasi-bidirectional",
}
function get_mfp_regs(t,e)
local e={"GCR_GP"..e.."_ALT"}
return reg2str("Multi-Function register",g_AU9100_regs,t,e)
end
function get_OSC48M_clock(a,o)
local t
local e
table.insert(o,"CLK_PWRCON")
local a=ext.band(a["CLK_PWRCON"],4)
if a==0 then
t=0
e="invalid internal <b>49.152MHz</b> high speed oscillator clock (see PWRCON[2].OSC49M_EN)"
else
t=49152000
e="internal <b>49.152MHz</b> high speed oscillator clock"
end
return t,e
end
function get_OSC16K_clock(o,a)
local t
local e
table.insert(a,"CLK_PWRCON")
local a=ext.band(o["CLK_PWRCON"],8)
if a==0 then
t=0
e="invalid internal <b>16kHz</b> low speed oscillator clock (see PWRCON[3].OSC16K_EN)"
else
t=16384
e="internal <b>16kHz</b> low speed oscillator clock"
end
return t,e
end
function get_XTL32K_clock(a,o)
local e
local t
table.insert(o,"CLK_PWRCON")
local a=ext.band(a["CLK_PWRCON"],2)
if a==0 then
e=0
t="invalid external <b>32.768kHz</b> low speed crystal clock (see PWRCON[1].XTL32K_EN)"
else
e=32768
t="external <b>32.768kHz</b> low speed crystal clock"
end
return e,t
end
function get_sys_clock(o,a,n)
table.insert(a,"CLK_CLKSEL0")
local i=ext.band(o["CLK_CLKSEL0"],7)
local e
local t
if i==0 then
e,t=get_OSC48M_clock(o,a)
elseif i==1 then
e,t=get_XTL32K_clock(o,a)
elseif i==2 then
e,t=get_OSC16K_clock(o,a)
else
e=0
t="invalid <b>"..n.."</b> clock (see CLKSEL0[2:0].HCLK_S)"
return e,t
end
if e==0 then
t="<b>"..n.."</b> clock from "..t
else
table.insert(a,"CLK_CLKDIV")
local a=ext.band(o["CLK_CLKDIV"],15)
e=e/(a+1)
t=string.format("<b>%s</b> clock (<b>%sHz</b>), from %s",n,val2str(e),t)
end
return e,t
end
function get_HCLK_clock(t,e)
return get_sys_clock(t,e,"HCLK")
end
function get_PCLK_clock(e,t)
return get_sys_clock(e,t,"PCLK")
end
function get_clk_informnation(t,e)
return reg2str("Clock setting registers",g_AU9100_regs,t,e)
end
function fill_AU9100_GPIO(i,s,t,e,l)
local o
if l==nil then l=string.format("P%s.%d",t,e)end
local a=s["GPIO"..t.."_PMD"]
local u=s["GPIO"..t.."_INDIS"]
local d=s["GPIO"..t.."_DOUT"]
local h=s["GPIO"..t.."_DMASK"]
local r=s["GPIO"..t.."_PIN"]
i["highlight_text"]=l
i["normal_color"]=kColor_Invalid
i["highlight_color"]=kColor_GPIO
i["pin_bg_color"]=kBgColor_GPIO
o=ext.band(ext.rshift(a,e*2),3)
i["direction"]=n[o]
if n[o]==kPinDirection_In
or n[o]==kPinDirection_Bi then
if ext.band(r,ext.lshift(1,e))==0 then
i["status"]=kPinStatus_Low
else
i["status"]=kPinStatus_High
end
else
if ext.band(h,ext.lshift(1,e))~=0 then
i["status"]=kPinStatus_Unknown
elseif ext.band(d,ext.lshift(1,e))==0 then
i["status"]=kPinStatus_Low
else
i["status"]=kPinStatus_High
end
end
local a=string.format("P%s.%d is in <b>%s</b> mode<br>",
t,e,c[o])
if n[o]==kPinDirection_In
or n[o]==kPinDirection_Bi then
if ext.band(r,ext.lshift(1,e))==0 then
a=a.."Pin input <b>low</b><br>"
else
a=a.."Pin input <b>high</b><br>"
end
end
if n[o]==kPinDirection_PushPullOut
or n[o]==kPinDirection_OpenDrainOut
or n[o]==kPinDirection_Bi then
if ext.band(h,ext.lshift(1,e))~=0 then
a=a.."Pin output <b>masked</b><br>"
elseif ext.band(d,ext.lshift(1,e))==0 then
a=a.."Pin output <b>low</b><br>"
else
a=a.."Pin output <b>high</b><br>"
end
end
if ext.band(u,ext.lshift(1,e+16))==0 then
a=a.."IO digital input path <b>enabled</b><br>"
else
a=a.."IO digital input path <b>disabled</b>(digital input tied to low)<br>"
end
local h=""
if n[o]==kPinDirection_PushPullOut
or n[o]==kPinDirection_Bi then
if ext.band(d,ext.lshift(1,e))==0 and ext.band(r,ext.lshift(1,e))~=0 then
h=string.format("Leakage warning: GP%s_DOUT[%d] = 0, GP%s_PIN[%d] = 1<br>",t,e,t,e)
elseif ext.band(d,ext.lshift(1,e))~=0 and ext.band(r,ext.lshift(1,e))==0 then
h=string.format("Leakage warning: GP%s_DOUT[%d] = 1, GP%s_PIN[%d] = 0<br>",t,e,t,e)
end
end
if h~=""then
i["pin_no_color"]=kBgColor_Error
h="<font color=red>"..h.."</font>"
end
local e={
"GPIO"..t.."_PMD",
"GPIO"..t.."_INDIS",
"GPIO"..t.."_DOUT",
"GPIO"..t.."_DMASK",
"GPIO"..t.."_PIN"}
local e=reg2str("GPIO setting registers",g_AU9100_regs,s,e)
i["information"]=string.format("<b>%s</b><br>%s<br>"..
"%s%s"..
"<b>Information</b><br>"..
"%s",
l,
h,
get_mfp_regs(s,t),
e,
a)
end
function fill_invalid_GPIO(e,i,t,a)
e["highlight_text"]=string.format("P%s.%d",t,a)
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Invalid
e["pin_bg_color"]=kBgColor_Invalid
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
e["pin_no_color"]=kBgColor_Error
local o="<font color=red>Undefined setting in Multi-Function registers for this pin</font><br>"
e["information"]=string.format("<b>P%s.%d</b><br>%s<br>"..
"%s",
t,a,
o,
get_mfp_regs(i,t))
end
function fill_AU9100_UART(t,e,d,a,r,o,a,a)
local i=""
local a=""
local n={}
local s=0
t["highlight_text"]=r
t["normal_color"]=kColor_Invalid
t["highlight_color"]=kColor_UART
t["pin_bg_color"]=kBgColor_UART
t["direction"]=kPinDirection_Unknown
t["status"]=kPinStatus_Unknown
function get_uart_baudate(i)
local s=string.format("UART%d",o)
local t=string.format("UART%d_BAUD",o)
table.insert(n,t)
local n=ext.band(e[t],536870912)
local o=ext.band(e[t],268435456)
local h=ext.rshift(ext.band(e[t],251658240),24)
local a=ext.band(e[t],65535)
local t=0
local e=""
if n==0 and o==0 then
t=i/(16*(a+2))
elseif n~=0 and o==0 then
if h>=8 then
t=i/((h+1)*(a+2))
else
e="invalid "..s.."'s BAUD value, DIVX must >= 8"
end
elseif n~=0 and o~=0 then
if a>=3 then
t=i/(a+2)
else
e="invalid "..s.."'s BAUD value, BRD must >= 3"
end
else
e="invalid "..s.."'s BAUD value"
end
return t,e
end
table.insert(n,"CLK_APBCLK")
if ext.band(e["CLK_APBCLK"],ext.lshift(65536,o))~=0 then
local h
local t
h,t=get_HCLK_clock(e,n)
local e=ext.band(ext.rshift(e["CLK_CLKDIV"],8),15)
s=h/(e+1)
if s~=0 then
table.insert(n,"CLK_CLKDIV")
i=string.format("UART%d clock frequency: <b>%sHz</b>, from %s.<br>",o,val2str(s),t)
else
a=string.format("UART%d clock is not available, %s.<br>",o,t)
end
else
a=string.format("UART%d clock is not available (see APBCLK[%d].UART%d_EN).<br>",
o,o+16,o)
end
if a==""then
local e,t=get_uart_baudate(s)
if e~=0 then
i=i..string.format("UART baudrate: <b>%d</b><br>",e)
else
a=t..".<br>"
end
end
if a~=""then
a="<font color=red>"..a.."</font>"
t["pin_no_color"]=kBgColor_Error
end
if i~=""then
i="<b>Information</b><br>"..i
end
t["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
r,
a,
get_mfp_regs(e,d),
get_clk_informnation(e,n),
i)
end
function fill_AU9100_ACMP(e,a,n,t,i)
local t=""
local o={}
e["highlight_text"]=i
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_CMP
e["pin_bg_color"]=kBgColor_CMP
e["direction"]=kPinDirection_In
e["status"]=kPinStatus_Unknown
table.insert(o,"CLK_APBCLK")
if ext.band(a["CLK_APBCLK"],4194304)==0 then
t="ACMP clock is not available (see APBCLK[22].ACMP_EN).<br>"
t="<font color=red>"..t.."</font>"
e["pin_no_color"]=kBgColor_Error
end
e["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s",
i,
t,
get_mfp_regs(a,n),
get_clk_informnation(a,o))
end
function fill_AU9100_SPI(o,a,d,t,r,e)
local t=""
local i=""
local n={}
o["highlight_text"]=r
o["normal_color"]=kColor_Invalid
o["highlight_color"]=kColor_SPI
o["pin_bg_color"]=kBgColor_SPI
o["direction"]=kPinDirection_Unknown
o["status"]=kPinStatus_Unknown
table.insert(n,"CLK_APBCLK")
if ext.band(a["CLK_APBCLK"],ext.lshift(4096,e))~=0 then
local s
local o
s,o=get_PCLK_clock(a,n)
if s~=0 then
local h=string.format("SPI%d_CNTRL",e)
local i=string.format("SPI%d_DIVIDER",e)
table.insert(n,h)
local r=ext.band(a[h],262144)
if r~=0 then
t=string.format("SPI%d is in <b>slave</b> mode.<br>",e)
else
t=string.format("SPI%d is in <b>master</b> mode.<br>",e)
table.insert(n,i)
local r=ext.band(a[i],65535)
local n=ext.band(ext.rshift(a[i],16),65535)
local i=s/((r+1)*2)
local n=s/((n+1)*2)
local a=ext.band(a[h],8388608)
if a~=0 then
t=t..string.format("SPI%d clock frequency is variable: <b>%sHz</b> or <b>%sHz</b>, from %s.<br>",
e,val2str(i),val2str(n),o)
else
t=t..string.format("SPI%d clock frequency: <b>%sHz</b>, from %s.<br>",
e,val2str(i),o)
end
end
else
i=string.format("SPI%d clock is not available, %s.<br>",e,o)
end
else
i=string.format("SPI%d clock is not available (see APBCLK[%d].SPI%d_EN).<br>",e,e+12,e)
end
if i~=""then
i="<font color=red>"..i.."</font>"
o["pin_no_color"]=kBgColor_Error
end
if t~=""then
t="<b>Information</b><br>"..t
end
o["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
r,
i,
get_mfp_regs(a,d),
get_clk_informnation(a,n),
t)
end
function fill_AU9100_SPI_IO(e,o,a,t)
local a=string.format("SPI%d_CNTRL",a)
local a=ext.band(o[a],262144)
if a==0 then
if t then
e["direction"]=kPinDirection_In
else
e["direction"]=kPinDirection_PushPullOut
end
else
if t then
e["direction"]=kPinDirection_PushPullOut
else
e["direction"]=kPinDirection_In
end
end
end
function fill_AU9100_TM(t,e,d,o,r,a)
local n=""
local o=""
local i={}
t["highlight_text"]=r
t["normal_color"]=kColor_Invalid
t["highlight_color"]=kColor_TM
t["pin_bg_color"]=kBgColor_TM
t["direction"]=kPinDirection_Unknown
t["status"]=kPinStatus_Unknown
table.insert(i,"CLK_APBCLK")
local s=ext.band(e["CLK_APBCLK"],ext.lshift(64,a))
local h
if s~=0 then
table.insert(i,"CLK_CLKSEL1")
h=ext.band(ext.rshift(e["CLK_CLKSEL1"],8+a*4),7)
local t
local s
if h==0 then
t,s=get_OSC16K_clock(e,i)
elseif h==1 then
t,s=get_XTL32K_clock(e,i)
elseif h==2 then
t,s=get_HCLK_clock(e,i)
elseif h==3 then
n=string.format("Timer%d clock source is from external pin.<br>",a)
else
t,s=get_OSC48M_clock(e,i)
end
if o==""and n==""then
if t~=0 then
n=string.format("Timer%d clock frequency: <b>%sHz</b>, from %s<br>",
a,val2str(t),s)
else
o=string.format("Timer%d clock is not available, %s.<br>",a,s)
end
end
else
o=string.format("Timer%d clock is disabled (see APBCLK[%d].TMR%d_EN).<br>",a,(a+6),a)
end
if o~=""then
o="<font color=red>"..o.."</font>"
t["pin_no_color"]=kBgColor_Error
end
if n~=""then
n="<b>Information</b><br>"..n
end
t["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
r,
o,
get_mfp_regs(e,d),
get_clk_informnation(e,i),
n)
end
function fill_AU9100_I2C(t,o,r,a,h,e)
local i=""
local a=""
local n={}
t["highlight_text"]=h
t["normal_color"]=kColor_Invalid
t["highlight_color"]=kColor_I2C
t["pin_bg_color"]=kBgColor_I2C
t["direction"]=kPinDirection_Unknown
t["status"]=kPinStatus_Unknown
table.insert(n,"CLK_APBCLK")
if ext.band(o["CLK_APBCLK"],ext.lshift(256,e))~=0 then
local t=string.format("I2C%d_I2CON",e)
local h=string.format("I2C%d_I2CLK",e)
table.insert(n,t)
local t=ext.band(o[t],64)
if t~=0 then
local s
local t
s,t=get_PCLK_clock(o,n)
if s~=0 then
table.insert(n,h)
local a=ext.band(o[h],255)
local a=s/(4*(a+1))
i=string.format("I2C%d clock frequency: <b>%sHz</b>, from %s.<br>",e,val2str(a),t)
else
a=string.format("I2C%d clock is not available, %s.<br>",e,t)
end
else
a=string.format("I2C%d controller disabled (see I2C%d.I2CON[6].ENS1).<br>",e,e)
end
else
a=string.format("I2C%d clock is not available (see APBCLK[%d].I2C%d_EN).<br>",e,8+e,e)
end
if a~=""then
a="<font color=red>"..a.."</font>"
t["pin_no_color"]=kBgColor_Error
end
if i~=""then
i="<b>Information</b><br>"..i
end
t["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
h,
a,
get_mfp_regs(o,r),
get_clk_informnation(o,n),
i)
end
function fill_AU9100_I2S(i,t,r,e,h)
local e=""
local n=""
local a={}
i["highlight_text"]=h
i["normal_color"]=kColor_Invalid
i["highlight_color"]=kColor_I2S
i["pin_bg_color"]=kBgColor_I2S
i["direction"]=kPinDirection_Unknown
i["status"]=kPinStatus_Unknown
table.insert(a,"CLK_APBCLK")
if ext.band(t["CLK_APBCLK"],536870912)~=0 then
table.insert(a,"CLK_CLKSEL2")
local s=ext.band(t["CLK_CLKSEL2"],3)
local o
local i
if s==0 then
o,i=get_OSC16K_clock(t,a)
elseif s==1 then
o,i=get_XTL32K_clock(t,a)
elseif s==2 then
o,i=get_HCLK_clock(t,a)
else
o,i=get_OSC48M_clock(t,a)
end
if o~=0 then
table.insert(a,"I2S_CLKDIV")
table.insert(a,"I2S_CON")
local a=ext.band(t["I2S_CON"],1)
if a~=0 then
e="I2S controller <b>enabled</b><br>"
else
e="I2S controller <font color=red><b>disabled</b></font>, (see I2S_CON[0].I2SEN)<br>"
end
e=e..string.format("I2S clock frequency: <b>%sHz</b>, from %s.<br>",val2str(o),i)
local i=ext.band(ext.rshift(t["I2S_CLKDIV"],8),255)
local a=ext.band(t["I2S_CLKDIV"],7)
local i=o/(2*(i+1))
local t=o
if a~=0 then
t=o/(2*a)
end
e=e..string.format("I2S BCLK frequency: <b>%sHz</b><br>",val2str(i))
e=e..string.format("I2S MCLK frequency: <b>%sHz</b><br>",val2str(t))
else
n="I2S clock is not available, "..i..".<br>"
end
else
n="I2S clock is not available (see APBCLK[29].I2S_EN).<br>"
end
if n~=""then
n="<font color=red>"..n.."</font>"
i["pin_no_color"]=kBgColor_Error
end
if e~=""then
e="<b>Information</b><br>"..e
end
i["information"]=string.format(
"<b>%s</b><br>%s<br>%s%s%s",
h,
n,
get_mfp_regs(t,r),
get_clk_informnation(t,a),
e)
end
function fill_AU9100_PWM(h,t,c,e,u)
local d=""
local n=""
local i={}
local a=tonumber((u:gsub("^PWM","")))
local e=ext.rshift(a,1)
local o=ext.rshift(e,1)
local l=({'PWMA','PWMB'})[1+o]
h["highlight_text"]=u
h["normal_color"]=kColor_Invalid
h["highlight_color"]=kColor_PWM
h["pin_bg_color"]=kBgColor_PWM
h["direction"]=kPinDirection_Unknown
h["status"]=kPinStatus_Unknown
table.insert(i,"CLK_APBCLK")
local r=ext.band(t["CLK_APBCLK"],ext.lshift(1048576,e))
local s
if r~=0 then
local h
local r
if e==0 then
h="CLKSEL1"
r="[29:28]"
s=ext.rshift(ext.band(t["CLK_CLKSEL1"],805306368),28)
elseif e==1 then
h="CLKSEL1"
r="[31:30]"
s=ext.rshift(ext.band(t["CLK_CLKSEL1"],3221225472),30)
elseif e==2 then
h="CLKSEL2"
r="[5:4]"
s=ext.rshift(ext.band(t["CLK_CLKSEL2"],48),4)
else
h="CLKSEL2"
r="[7:6]"
s=ext.rshift(ext.band(t["CLK_CLKSEL2"],192),6)
end
table.insert(i,"CLK_"..h)
local r
local h
if s==0 then
r,h=get_OSC16K_clock(t,i)
elseif s==1 then
r,h=get_XTL32K_clock(t,i)
elseif s==2 then
r,h=get_HCLK_clock(t,i)
elseif s==3 then
r,h=get_OSC48M_clock(t,i)
end
if n==""then
if r==0 then
n=string.format("PWM%d clock is not available, %s.<br>",a,h)
else
local u=l.."_CSR"
local s=l.."_PPR"
table.insert(i,u)
table.insert(i,s)
local i=ext.band(ext.rshift(t[u],4*(a-4*o)),7)
local i=({2,4,8,16,1,0,0,0})[i+1]
local t=ext.band(ext.rshift(t[s],8*(e-2*o)),255)
if t==0 then
n=string.format("PWM%d counter will be stopped since %s_PPR[%d:%d].CP%d%d = 0<br>",
a,l,
8*(e-2*o)+7,
8*(e-2*o),
(e-2*o)*2,
(e-2*o)*2+1)
elseif i==0 then
n=string.format("PWM%d counter clock is not available (see %s_CSR[%d:%d].CSR%d).<br>",
a,l,
4*(a-4*o)+3,
4*(a-4*o),
(a-4*o))
else
local e=r/(t+1)
local t=e/i
d=string.format("PWM%d clock frequency: <b>%sHz</b> (Pre-Scaled), from %s.<br>"..
"PWM%d counter frequency: <b>%sHz</b><br>",
a,val2str(e),h,
a,val2str(t))
end
end
end
else
n=string.format("PWM%d clock is not available (see APBCLK[%d].PWM%d%d_EN).<br>",
a,e+20,e*2,e*2+1)
end
if n~=""then
n="<font color=red>"..n.."</font>"
h["pin_no_color"]=kBgColor_Error
end
if d~=""then
d="<b>Information</b><br>"..d
end
h["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
u,
n,
get_mfp_regs(t,c),
get_clk_informnation(t,i),
d)
end
function fill_AU9100_DPWM(e,t,h,a,s)
local i=""
local o=""
local a={}
e["highlight_text"]=s
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_PWM
e["pin_bg_color"]=kBgColor_PWM
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
table.insert(a,"CLK_APBCLK")
if ext.band(t["CLK_APBCLK"],8192)~=0 then
local e
local n
e,n=get_OSC48M_clock(t,a)
table.insert(a,"CLK_CLKSEL1")
local s=ext.rshift(ext.band(t["CLK_CLKSEL1"],16),4)
if s==1 then
e=e*2
end
if e~=0 then
table.insert(a,"DPWM_CTRL")
local s=ext.band(t["DPWM_CTRL"],64)
if s~=0 then
i=string.format("DPWM clock frequency: <b>%sHz</b>, from %s.<br>",val2str(e),n)
table.insert(a,"DPWM_ZOH_DIV")
local o
local e
o,e=get_HCLK_clock(t,a)
local t=o/ext.band(t["DPWM_ZOH_DIV"],255)/64
i=i..string.format("Sample rate: <b>%sHz</b>, from %s.<br>",val2str(t),e)
else
o=string.format("DPWM disabled (see DPWM_CTRL[6].Enable).<br>")
end
else
o="DPWM clock is not available, "..n..".<br>"
end
else
o="DPWM clock is not available (see APBCLK[13].DPWM_EN).<br>"
end
if o~=""then
o="<font color=red>"..o.."</font>"
e["pin_no_color"]=kBgColor_Error
end
if i~=""then
i="<b>Information</b><br>"..i
end
if h==nil then
e["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s",
s,
o,
get_clk_informnation(t,a),
i)
else
e["information"]=string.format(
"<b>%s</b><br>%s<br>"..
"%s%s%s",
s,
o,
get_mfp_regs(t,h),
get_clk_informnation(t,a),
i)
end
end
function fill_AU9100_ADC(t,o,h,e,s)
local a=""
local e=""
local i={}
t["highlight_text"]=s
t["normal_color"]=kColor_Invalid
t["highlight_color"]=kColor_ADC
t["pin_bg_color"]=kBgColor_ADC
t["direction"]=kPinDirection_Unknown
t["status"]=kPinStatus_Unknown
table.insert(i,"CLK_APBCLK")
if ext.band(o["CLK_APBCLK"],268435456)~=0 then
local n
local t
n,t=get_HCLK_clock(o,i)
local s=ext.rshift(ext.band(o["CLK_CLKDIV"],16711680),16)
if e==""then
local s=n/(s+1)
if s~=0 then
table.insert(i,"CLK_CLKDIV")
a=string.format("ADC clock frequency: <b>%sHz</b>, from %s.<br>",val2str(s),t)
else
e="ADC clock is not available, "..t..".<br>"
end
table.insert(i,"ADC_CLK_DIV")
local o=ext.band(o["ADC_CLK_DIV"],255)
if o>2 then
local o=n/o
if o~=0 then
a=a..string.format("SD clock frequency: <b>%sHz</b>, from %s.<br>",val2str(o),t)
else
e="SD clock is not available, "..t..".<br>"
end
else
e="SD clock is not available, ADC CLK_DIV must be greater than 2.<br>"
end
end
else
e="ADC clock is not available (see APBCLK[28].ADC_EN).<br>"
end
if e~=""then
e="<font color=red>"..e.."</font>"
t["pin_no_color"]=kBgColor_Error
end
if a~=""then
a="<b>Information</b><br>"..a
end
t["information"]=string.format(
"<b>%s</b><br>%s<br>%s%s%s",
s,
e,
get_mfp_regs(o,h),
get_clk_informnation(o,i),
a)
end
function fill_AU9100_Normal(e,o,a,i,t)
local i=""
e["highlight_text"]=t
e["normal_color"]=kColor_Invalid
e["highlight_color"]=kColor_Normal
e["pin_bg_color"]=kBgColor_Normal
e["direction"]=kPinDirection_Unknown
e["status"]=kPinStatus_Unknown
i=t.."<br>"
if a==nil then
e["information"]=string.format(
"<b>%s</b><br>",
t)
else
e["information"]=string.format(
"<b>%s</b><br><br>"..
"%s",
t,
get_mfp_regs(o,a))
end
end