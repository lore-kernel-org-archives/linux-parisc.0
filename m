Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 8042E487A
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  5 Feb 2004 16:07:40 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 6 Feb 2004 00:07:27 +0100
References: <02d601c3ebef$e3241650$8100a8c0@punk>
In-Reply-To: <02d601c3ebef$e3241650$8100a8c0@punk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200402060007.27911.deller@gmx.de>
Cc: Jens Simmoleit <simmel@anymotion.de>, debian-hppa@lists.debian.org
Subject: [parisc-linux] Re: Install GNOME on 712/80
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thursday 05 February 2004 14:56, Jens Simmoleit wrote:
> My question would be, which packages do I need to succesfully install and run GNOME (and only Gnome) on my system? 

No idea. I use KDE.

> In addition to that, where and how must the xserver or gnome or whatever be configured to make it run properly?
> ....
> (II) FBDev(0): using default device
> (II) Running in FRAMEBUFFER Mode
> (**) FBDev(0): Depth 24, (--) framebuffer bpp 32
> (==) FBDev(0): RGB weight 888
> (==) FBDev(0): Default visual is TrueColor
> (==) FBDev(0): Using gamma correction (1.0, 1.0, 1.0)
> (II) FBDev(0): Hardware:  (vidmem: 2048k)
> (II) FBDev(0): Checking Modes against framebuffer device...
> (II) FBDev(0):  mode "1280x1024" ok
> (II) FBDev(0):  mode "1024x768" ok
> (II) FBDev(0):  mode "800x600" ok
> (II) FBDev(0): Checking Modes against monitor...
> (--) FBDev(0): Virtual size is 1280x1024 (pitch 1280)
> (**) FBDev(0): Default mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2
> kHz, 56.2 Hz
> (II) FBDev(0): Modeline "800x600"   36.00  800 824 896 1024  600 601 603 625
> +hsync +vsync
> (==) FBDev(0): DPI set to (75, 75)
> (**) FBDev(0): Using "Shadow Framebuffer"
> (--) Depth 24 pixmap format is 32 bpp
> Fatal server error:
> AddScreen/ScreenInit failed for driver 0

Look at the dmesg kernel log and search for a line which starts with "stifb:".
There you will see the only resolution & bpp color depth which your card
currently supports and then verify your /etc/X11/XFree86.config file to only 
have exactly those values enabled. After that change X11 should start up....

Helge
