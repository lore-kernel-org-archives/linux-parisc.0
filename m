From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Sat, 23 Aug 2008 12:48:08 -0400 (EDT)
Message-ID: <20080823164809.8F3CC4E4A@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, gmsoft@tuxicoman.be, kraxel@goldbach.in-berlin.de,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <no.id> from "John David Anglin" at Aug 23, 2008 10:49:47 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Tracing with gdb gives the following:
> > 
> > Breakpoint 1, fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8)
> >      at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
> > 256     }
> > (gdb) p *set
> > $1 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
> > xoffset = 0, yoffset = 0,
> >    bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
> > msb_right = 0}, green = {offset = 0,
> >      length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
> > msb_right = 0}, transp = {offset = 0,
> >      length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
> > width = 0, accel_flags = 0,
> >    pixclock = 0, left_margin = 0, right_margin = 0, upper_margin = 0, 
> > lower_margin = 0, hsync_len = 0,
> >    vsync_len = 0, sync = 0, vmode = 0, reserved = {0, 0, 0, 0, 0, 0}}
> > 
> > (gdb) p *req
> > $2 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
> > xoffset = 0, yoffset = 0,
> >    bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
> > msb_right = 0}, green = {offset = 0,
> >      length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
> > msb_right = 0}, transp = {offset = 0,
> >      length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
> > width = 0, accel_flags = 0,
> >    pixclock = 22271, left_margin = 56, right_margin = 8, upper_margin = 
> > 41, lower_margin = 0,
> >    hsync_len = 176, vsync_len = 8, sync = 3, vmode = 1, reserved = {0, 
> > 0, 0, 0, 0, 0}}
> > 
> > (gdb) bt
> > #0  fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8) at 
> > ../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
> > #1  0x40bcfb64 in fbdevHWSetMode (pScrn=0x2142a0, mode=<value optimized 
> > out>, check=1)
> >      at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:528
> > #2  0x40bd07e8 in fbdevHWSetVideoModes (pScrn=0x2142a0) at 
> > ../../../../hw/xfree86/fbdevhw/fbdevhw.c:568
> > #3  0x40cf5bec in ?? () from /usr/lib/xorg/modules/drivers//fbdev_drv.so
> > #4  0x00074e88 in InitOutput ()
> > #5  0x00039d04 in main ()
> > 
> > As you can see, the main video parameters are OK, while the 
> > monitor/modeline values (pixclock, left_margin, right_margin, 
> > upper_margin, lower_margin, hsync_len, vsync_len, sync and vmode)
> > were changed to zero.

It would appear that none of these values are relevant to the stifb.
The stifb.c code uses kzalloc to allocate the struct stifb_info, so
I think the above values should be zero.  Some code is clearly computing
values for pixclock, etc.  I don't see that this code is in the kernel.
It may be X that's making up these values.

I see in the log:

(II) FBDEV(0): hardware: stifb (video memory: 2048kB)
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0):  mode "1280x1024" test failed
(II) FBDEV(0): checking modes against monitor...
(--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
(**) FBDEV(0):  Built-in mode "current": 28000.0 MHz, 21875.0 kHz, 21362.3 Hz
(II) FBDEV(0): Modeline "current"x0.0  28000.00  1280 1280 1280 1280  1024 1024 
1024 1024 -hsync -vsync -csync (21875.0 kHz)
(==) FBDEV(0): DPI set to (96, 96)

Could X be requesting a mode with invalid mode parameters?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
