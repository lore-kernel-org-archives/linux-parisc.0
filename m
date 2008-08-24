From: Helge Deller <deller@gmx.de>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Sun, 24 Aug 2008 12:35:38 +0200
Message-ID: <48B1397A.9020303@gmx.de>
References: <20080823164809.8F3CC4E4A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: gmsoft@tuxicoman.be, kraxel@goldbach.in-berlin.de,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080823164809.8F3CC4E4A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>>> Tracing with gdb gives the following:
>>>
>>> Breakpoint 1, fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8)
>>>      at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
>>> 256     }
>>> (gdb) p *set
>>> $1 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
>>> xoffset = 0, yoffset = 0,
>>>    bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
>>> msb_right = 0}, green = {offset = 0,
>>>      length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
>>> msb_right = 0}, transp = {offset = 0,
>>>      length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
>>> width = 0, accel_flags = 0,
>>>    pixclock = 0, left_margin = 0, right_margin = 0, upper_margin = 0, 
>>> lower_margin = 0, hsync_len = 0,
>>>    vsync_len = 0, sync = 0, vmode = 0, reserved = {0, 0, 0, 0, 0, 0}}
>>>
>>> (gdb) p *req
>>> $2 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
>>> xoffset = 0, yoffset = 0,
>>>    bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
>>> msb_right = 0}, green = {offset = 0,
>>>      length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
>>> msb_right = 0}, transp = {offset = 0,
>>>      length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
>>> width = 0, accel_flags = 0,
>>>    pixclock = 22271, left_margin = 56, right_margin = 8, upper_margin = 
>>> 41, lower_margin = 0,
>>>    hsync_len = 176, vsync_len = 8, sync = 3, vmode = 1, reserved = {0, 
>>> 0, 0, 0, 0, 0}}
>>>
>>> (gdb) bt
>>> #0  fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8) at 
>>> ../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
>>> #1  0x40bcfb64 in fbdevHWSetMode (pScrn=0x2142a0, mode=<value optimized 
>>> out>, check=1)
>>>      at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:528
>>> #2  0x40bd07e8 in fbdevHWSetVideoModes (pScrn=0x2142a0) at 
>>> ../../../../hw/xfree86/fbdevhw/fbdevhw.c:568
>>> #3  0x40cf5bec in ?? () from /usr/lib/xorg/modules/drivers//fbdev_drv.so
>>> #4  0x00074e88 in InitOutput ()
>>> #5  0x00039d04 in main ()
>>>
>>> As you can see, the main video parameters are OK, while the 
>>> monitor/modeline values (pixclock, left_margin, right_margin, 
>>> upper_margin, lower_margin, hsync_len, vsync_len, sync and vmode)
>>> were changed to zero.
> 
> It would appear that none of these values are relevant to the stifb.
> The stifb.c code uses kzalloc to allocate the struct stifb_info, so
> I think the above values should be zero.  Some code is clearly computing
> values for pixclock, etc.  I don't see that this code is in the kernel.
> It may be X that's making up these values.
> 
> I see in the log:
> 
> (II) FBDEV(0): hardware: stifb (video memory: 2048kB)
> (II) FBDEV(0): checking modes against framebuffer device...
> (II) FBDEV(0):  mode "1280x1024" test failed
> (II) FBDEV(0): checking modes against monitor...
> (--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
> (**) FBDEV(0):  Built-in mode "current": 28000.0 MHz, 21875.0 kHz, 21362.3 Hz
> (II) FBDEV(0): Modeline "current"x0.0  28000.00  1280 1280 1280 1280  1024 1024 
> 1024 1024 -hsync -vsync -csync (21875.0 kHz)
> (==) FBDEV(0): DPI set to (96, 96)
> 
> Could X be requesting a mode with invalid mode parameters?

In general X behaves correctly if you have a fb device, which is able to 
set sync timings.
But stifb and a few other fb drivers are not able to set sync timings, 
and for those X behaves IMHO wrong. For those X should assume that the 
timings set by the driver are correct as long as the resolution and bit 
depth are correct.

This is what happens:
1. In xorg.conf you configured a pixel resolution and bpp (e.g. 
1280x1024-16)
2. In xorg.conf you might have configured a monitor (with or without 
some timing/sync informations)
3. X reads those config parameters and try to set them through kernel calls.
4. Kernel returns that it now has set up the mode (1280x1024-16) and has 
set up the timings. Since stifb does not support timing modes, it 
returns zeros in those values (IMHO thats correct behavior if you look 
at the comments in skeletonfb.c)
5. X verifies the returned values and aborts since the timing values are 
different to what it fed to the kernel, although the resolution 
(1280x1024-16) is correctly set and returned like that.

I think X is right in noticing that the timing/sync values are not what 
it expected. Nevertheless, I would prefer that it would just warn (in 
the fbdev drivers only!) that the timings are incorrect instead of 
aborting completely. X is right to abort, if the pixel resolution and 
bpp can not be set.
So, X's tests should be like that:
a) resolution and bpp different -> abort
b) resolution and bpp correct, but sync timings/monitor timings 
different -> warn but continue

Right now X's tests are:
resolution, bpp or sync/monitor timings different -> abort.

Of course it's easily possible to change stifb in that it just takes any 
timing values, but that is not how it is documented in skeletonfb.

Helge
