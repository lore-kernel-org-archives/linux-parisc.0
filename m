Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hptux.heylan (pD9E4A8A7.dip.t-dialin.net [217.228.168.167])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FDA24829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 09:50:40 -0600 (MDT)
Date: Fri, 20 Sep 2002 17:50:27 +0200
From: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
To: Petr Vandrovec <VANDROVE@vc.cvut.cz>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: partial success with matroxfb
Message-ID: <20020920155026.GA22068@gate450.dyndns.org>
References: <251F50824F2@vcnet.vc.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <251F50824F2@vcnet.vc.cvut.cz>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Petr,
	
* Petr Vandrovec <VANDROVE@vc.cvut.cz> [2002-09-20 12:12]:
>   boot with 'video=matrox:novga'. It looks like that Matrox responded

No success with novga or no_pci_retry either. It results in the same crash. 

> Can you print DAC registers 0x4C,0x4D,0x4E,0x4F after this message?
> 0x4C..0x4E should contain 8,7E,3, and 0x4F should contain 0 when
> PLL is not locked, and 0x40 if PLL is locked.

Ok, the code around the message now looks like this:

     if (!tmout)
	printk(KERN_ERR "matroxfb: Pixel PLL not locked after 5 secs\n");	
     for (i=0x4c; i<0x50; i++)
        printk(KERN_INFO "DAC register %02x=%x\n", i, inDAC1064(i));

It looks like m1064_compute() is called twice and succeeds the second 
time:

==========
anotherhpmachien:/usr/src/linux# modprobe matroxfb_base noinit=0 no_pci_retry=1  novga=1
Warning: /lib/momatroxfb: Matrox Mystique 220 (PCI) detected
dules/2.4.19-pa1post_shift_max: 3
7/kernel/driversref_freq: 14318
/video/matrox/mafreq: 133333
troxfb_base.o syvco_freq_min: 62000
mbol for parametin_div_min: 1
er mtrr not founin_div_max: 31
d
feed_div_min: 100
feed_div_max: 127
fmax: 220000
clk: 0C 78 00 14318 133267 66666
requested 640*480/8bpp (640*6547)
matroxfb: 640x480x8bpp (virtual: 640x6547)
matroxfb: framebuffer at 0xF3000000, mapped to 0xf3000000, size
4194304
requested 640*480/8bpp (640*6547)
post_shift_max: 3
ref_freq: 14318
freq: 25175
vco_freq_min: 62000
in_div_min: 1
in_div_max: 31
feed_div_min: 100
feed_div_max: 127
fmax: 220000
clk: 08 7E 03 14318 202042 50350
matroxfb: Pixel PLL not locked after 5 secs
DAC register 4c=8
DAC register 4d=7e
DAC register 4e=1f
DAC register 4f=0
MiscOutReg: 8B
SEQ regs:   00:01:0F:00:0E:
GDC regs:   00:00:00:00:00:40:05:0F:FF:
CRTC regs:  5F:4F:4F:83:51:9D:0B:3E:00:40:00:00:00:00:00:00:E9:2B:DF:28:00:DF:0C:C3:FF:
ATTR regs:  00:01:02:03:04:05:06:07:08:09:0A:0B:0C:0D:0E:0F:41:FF:0F:00:00:
requested 640*480/8bpp (640*6547)
post_shift_max: 3
ref_freq: 14318
freq: 25175
vco_freq_min: 62000
in_div_min: 1
in_div_max: 31
feed_div_min: 100
feed_div_max: 127
fmax: 220000
clk: 08 7E 03 14318 202042 50350
DAC register 4c=8
DAC register 4d=7e
DAC register 4e=1f
DAC register 4f=40
MiscOutReg: 8B
SEQ regs:   00:01:0F:00:0E:
GDC regs:   00:00:00:00:00:40:05:0F:FF:
CRTC regs:  5F:4F:4F:83:51:9D:0B:3E:00:40:00:00:00:00:00:00:E9:2B:DF:28:00:DF:0C:C3:FF:
ATTR regs:  00:01:02:03:04:05:06:07:08:09:0A:0B:0C:0D:0E:0F:41:FF:0F:00:00:
Console: switching to colour frame buffer device 80x30
fb0: MATROX VGA frame buffer device
anotherhpmachien:/usr/src/linux# sync
anotherhpmachien:/usr/src/linux# ping -f athlon
PING athlon (192.168.0.11): 56 data bytes
............

kernel BUG at printk.c:489!
* box reboots
`àINIT C4CC
INIT C4CF
INIT C4CD
[...]
Main Menu: Enter command > ser pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =   Fri Sep  20 13:55:23 GMT 2002    (20:02:09:20:13:55:23)

HPMC Chassis Codes = 0xcbf0  0x5002  0x540f  0x5508  0xcbfb  

General Registers 0 - 31
00-03   0000000000000000  0000000010368010  000000001024382c  0000000000000001
04-07   0000000000000006  000000001031e810  00000000103c0918  00000000103e2010
08-11   000000000000000f  000000000000004d  000000000004000e  000000001037c5ac
12-15   0000000000000000  0000000000000000  00000000103e3010  00000000103e3010
16-19   00000000103e2810  00000000103e2cdc  000000001031f810  00000000f3fffc0a
20-23   000000000000000e  000000000000000e  0000000000000001  0000000000919dda
24-27   0000000000000001  0000000000000001  00000000ffffff9d  0000000010304010
28-31   0000000000000010  0000000000004001  00000000103c0a40  00000000103e2010

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   000000000000057a  0000000000000000  00000000000000c0  000000000000000a
12-15   0000000000000000  0000000000000000  0000000000107000  00000000f0000000
16-19   0000000712615173  0000000000000000  0000000010243858  0000000000141860
20-23   000000009207ffcf  c0000000fffffc00  000000000004010c  0000000000000000
24-27   0000000000326000  000000000f6d1000  00000000ffffffff  00000000ffffffff
28-31   00000000ffffffff  00000000ffffffff  00000000103c0000  00000000103c8000

Space Registers 0 - 7
00-03   00000000          00000000          00000000          000002bd
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x000000001024385c
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00305004
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff3fffc0a
System Requestor Address     = 0xfffffffffffa0000
Check Summary                = 0x8000000810004000
Available Memory             = 0x0000000000000000
CPU Diagnose Register 2      = 0x0501000000000004
CPU Status Register 0        = 0x1420c20000000000
CPU Status Register 1        = 0x8000000800000000
SADD LOG                     = 0x0f0810940f481094
Read Short LOG               = 0xc14200fff3fffc0a

<Press any key to continue (q to quit)> 

Memory Error Log Information:

Timestamp =   Fri Sep  20 13:55:23 GMT 2002    (20:02:09:20:13:55:23)

   No memory errors logged


I/O Module Error Log Information:

Timestamp =   Fri Sep  20 13:55:25 GMT 2002    (20:02:09:20:13:55:25)

Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Responder
--- ---------- ---------------- -------- -- -- ---- ----- ---------- ----------
 0  0xfff88000 I/O Adapter      8         2  0  he   0x3d 0xf2000000 0x000a1000 
 0  0xfff8a000 I/O Adapter      10        2  2  he   0x0d 0x00000000 0x00000000 

regards
andreas
