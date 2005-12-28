From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] X startup failure
Date: Wed, 28 Dec 2005 16:46:09 -0500 (EST)
Message-ID: <200512282146.jBSLkAZZ028658@hiauly1.hia.nrc.ca>
References: <200512272338.10264.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200512272338.10264.deller@gmx.de> from "Helge Deller" at Dec 27, 2005 11:38:10 pm
List-ID: <linux-parisc.vger.kernel.org>

> I tried myself with current kernel.
> 
> - 32bit kernel on c3k works for me. Can you try again with current kernel ?

I'm currently running 2.6.15-rc6-pa1 but 2.6.8.1-pa11 doesn't work
either.  2.6.8.1-pa11 used to work ok.

> - 64bit kernel on my c3k crashes, but this doesn't seem (with strace) related to stifb. Maybe this is due to some mmap() problems ?

I haven't every been successful in running a 64bit kernel either.

> Sorry, no better idea...

This is what I see when I run startx:

OS Kernel: Linux version 2.6.15-rc6-pa1 (bame@palinux) (gcc version 3.3.5 (Debian 1:3.3.5-13)) #1 Mon Dec 19 15:13:14 MST 2005
Markers: (--) probed, (**) from config file, (==) default setting,
         (++) from command line, (!!) notice, (II) informational,
	 (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/XFree86.0.log", Time: Wed Dec 28 16:26:26 2005
(==) Using config file: "/etc/X11/XF86Config-4"
(EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
Could not init font path element unix/:7100, removing from list!

waiting for X server to shut down

I'm puzzled about the font path element as the font server is running.
The stuff in the log file seems ok:

...
(II) Setting vga for screen 0.
(**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
(==) FBDEV(0): Default visual is PseudoColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): hardware: stifb (video memory: 2048kB)
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0):  mode "1280x1024" ok
(II) FBDEV(0): checking modes against monitor...
(--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDEV(0):  Default mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0
kHz, 60.0 Hz
(II) FBDEV(0): Modeline "1280x1024"  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync
(++) FBDEV(0): DPI set to (100, 100)
(**) FBDEV(0): using shadow framebuffer
...
(EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
(==) FBDEV(0): Backing store disabled
(**) Option "dpms"
(**) FBDEV(0): DPMS enabled
(==) RandR enabled
(II) Setting vga for screen 0.
...
(II) USB Mouse: ps2EnableDataReporting: succeeded
Could not init font path element unix/:7100, removing from list!

I think things broke with the 6.8.2.dfsg.1 update but I'm not sure.

dave@hiauly6:~$ dpkg -l xserver-common
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  xserver-common 6.8.2.dfsg.1-7 files and utilities common to all X servers
dave@hiauly6:~$ dpkg -l xserver-xfree86
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  xserver-xfree8 4.3.0.dfsg.1-1 the XFree86 X server

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
