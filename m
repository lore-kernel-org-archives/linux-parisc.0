Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns1.rz.fh-heilbronn.de (dns1.rz.fh-heilbronn.de [141.7.1.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87B544829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 15:11:01 -0600 (MDT)
Message-ID: <03bf01c2627c$9a5147c0$1f96078d@acid>
From: "Yves Bodack" <bodack@stud.fh-heilbronn.de>
To: "Thibaut VARENE" <varenet@esiee.fr>,
	<parisc-linux@lists.parisc-linux.org>
References: <03ab01c26266$2416dea0$1f96078d@acid> <20020922220323.0113cbca.varenet@esiee.fr>
Subject: Re: [parisc-linux] RTC and FB on 735/125
Date: Sun, 22 Sep 2002 23:11:22 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

----- Original Message -----
From: "Thibaut VARENE" <varenet@esiee.fr>
Subject: Re: [parisc-linux] RTC and FB on 735/125


> > i have a 'new' 735/125 workstation, which I run Debian 3.0 on.
> > hp735# uname -a
> > Linux hp735 2.4.19-32 #1 Tue Aug 20 03:25:39 MDT 2002 parisc unknown
unknown
> > GNU/Linux
> > >
> > 2nd problem is I can't start X. I'm using Helge Deller's XFConfig-4 from
> > ftp.p-l.org and just changed Depth from 8 to 24 bpp.
> I didn't try X on 735, but I bet it doesn't support 24bpp. ;)

I bet it does ;)

dmesg says:

Found devices:
1. Coral SGC Graphics (10) at 0xf8000000 [1], versions 0x4, 0x0, 0x77
[...]
fb0: stifb 1280x1024-32 frame buffer device, id: 26d148ee, mmio: 0xf8100000


XFree86.0.log with 24 bpp says:

(II) FBDev(0): using default device
(II) Running in FRAMEBUFFER Mode
(==) FBDev(0): Depth 24, (==) framebuffer bpp 24
(==) FBDev(0): RGB weight 888
(==) FBDev(0): Default visual is TrueColor
(==) FBDev(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDev(0): Hardware:  (vidmem: 16384k)
(II) FBDev(0): Checking Modes against framebuffer device...
(II) FBDev(0):  mode "1280x1024" ok
(II) FBDev(0): Checking Modes against monitor...
(--) FBDev(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDev(0): Default mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz),
64.0 kHz, 60.0 Hz
(II) FBDev(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 1025
1028 1066 +hsync +vsync
(++) FBDev(0): DPI set to (100, 100)
(**) FBDev(0): Using "Shadow Framebuffer"
(--) Depth 24 pixmap format is 24 bpp
(EE) FBDev(0): FBIOPUT_VSCREENINFO: Invalid argument
Fatal server error:
AddScreen/ScreenInit failed for driver 0


and with 8 bpp it says:

(EE) FBDev(0): No Display subsection in Screen section "Default Screen" for
depth/fbbpp 24/24
(EE) Screen(s) found, but none have a usable configuration.
Fatal server error:
no screens found


greetings,

yves...
