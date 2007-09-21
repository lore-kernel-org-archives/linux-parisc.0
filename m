From: Berthold Gunreben <b.gunreben@web.de>
Subject: [parisc-linux] IBM GXT6000P on parisc linux
Date: Fri, 21 Sep 2007 19:49:21 +0200
Message-ID: <200709211949.21664.b.gunreben__41618.5013404631$1416624443$gmane$org@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

I got a used HP parisc workstation, and found a GXT6000P video card in 
there. The card was detected and initialized by the firmware of this machine 
(a C3750). I just wanted to give it a try and compiled a module gxt4500 to 
try this card. Here are my results:

o The module builds  without errors after adding PARISC to Kconfig for this 
module
o when loading the module, dmesg contains this:
  Console: switching to colour frame buffer device 160x64
  fb0: IBM GXT6000P frame buffer device
o fbset -i gives me the following output:
mode "1280x1024-60"
    # D: 107.504 MHz, H: 63.687 kHz, V: 59.744 Hz
    geometry 1280 1024 1280 1024 8
    timings 9302 248 48 38 1 112 3
    nonstd 304384
    accel true
    rgba 8/0,8/0,8/0,0/0
endmode

Frame buffer device information:
    Name        : IBM GXT6000P
    Address     : 0xf8000000
    Size        : 67108864
    Type        : PACKED PIXELS
    Visual      : PSEUDOCOLOR
    XPanStep    : 8
    YPanStep    : 1
    YWrapStep   : 0
    LineLength  : 2048
    MMIO Address: 0xf7000000
    MMIO Size   : 131072
    Accelerator : No

o I manually configured Xorg, and the fbdev X-Server seems to come up 
(according to the X messages).

However - the monitor stays in powersave mode, and no signal reaches the 
monitor, neither in text mode (console) nor in X11 mode. For some reason, the 
interrupt for this device (according to lspci it is IRQ 70) does not appear 
in /proc/interrupts, but I don't know if this is even necessary for this 
driver.

lspci -vn gives me the following for this card:
03:02.0 Class 0300: 1014:0170 (rev 02) (prog-if 00 [VGA])
        Subsystem: 1092:0173
        Flags: bus master, 66MHz, medium devsel, latency 255, IRQ 70
        Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
        Memory at f8000000 (32-bit, non-prefetchable) [size=64M]
        Expansion ROM at f7040000 [disabled] [size=256K]

If anybody wants to see the log about X coming up, I can send this too, I just 
did not want to send them to the list.

If someone got a hint about how to fix this problem, this would be great.

Thanks

Berthold
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
