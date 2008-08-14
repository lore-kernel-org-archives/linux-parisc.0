From: Helge Deller <deller@gmx.de>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Thu, 14 Aug 2008 22:54:08 +0200
Message-ID: <48A49B70.9030706@gmx.de>
References: <488DFD62.4080307@hp.com>	<20080728171500.GB16059@parisc-linux.org>	<488F777E.6090405@hp.com>	<1217363136.6103.68.camel@localhost.localdomain>	<488F842F.3040000@hp.com>	<1217369386.6103.73.camel@localhost.localdomain>	<20080731051524.GC18732@colo.lackof.org>	<4891F5C0.8010307@hp.com>	<20080801233142.GC26550@colo.lackof.org>	<7d01f9f00808040159ud7f1afw8e0ee77760bc9c68@mail.gmail.com>	<20080806014207.GA2590@hiauly1.hia.nrc.ca> <20080806071119.22b6a21f@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>,
	Gerd Knorr <kraxel@goldbach.in-berlin.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080806071119.22b6a21f@bleh.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Guy, thanks for the hint, and yes I see this problem as well.

The problem is really caused by hw/xfree86/fbdevhw/fbdevhw.c.

The driver sets a video mode and then checks if the syscall modified the 
parameters with the function fbdev_modes_equal():

--snip--
/* static*/ Bool
fbdev_modes_equal(struct fb_var_screeninfo *set, struct 
fb_var_screeninfo *req)
{
         return (set->xres_virtual >= req->xres_virtual &&
                 set->yres_virtual >= req->yres_virtual &&
                 set->bits_per_pixel == req->bits_per_pixel &&
                 set->red.length == req->red.length &&
                 set->green.length == req->green.length &&
                 set->blue.length == req->blue.length &&
                 set->xres == req->xres && set->yres == req->yres &&
                 set->pixclock == req->pixclock &&
                 set->right_margin == req->right_margin &&
                 set->hsync_len == req->hsync_len &&
                 set->left_margin == req->left_margin &&
                 set->lower_margin == req->lower_margin &&
                 set->vsync_len == req->vsync_len &&
                 set->upper_margin == req->upper_margin &&
                 set->sync == req->sync && set->vmode == req->vmode);
}
--snip--

Tracing with gdb gives the following:

Breakpoint 1, fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8)
     at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
256     }
(gdb) p *set
$1 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
xoffset = 0, yoffset = 0,
   bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
msb_right = 0}, green = {offset = 0,
     length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
msb_right = 0}, transp = {offset = 0,
     length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
width = 0, accel_flags = 0,
   pixclock = 0, left_margin = 0, right_margin = 0, upper_margin = 0, 
lower_margin = 0, hsync_len = 0,
   vsync_len = 0, sync = 0, vmode = 0, reserved = {0, 0, 0, 0, 0, 0}}

(gdb) p *req
$2 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
xoffset = 0, yoffset = 0,
   bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
msb_right = 0}, green = {offset = 0,
     length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
msb_right = 0}, transp = {offset = 0,
     length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
width = 0, accel_flags = 0,
   pixclock = 22271, left_margin = 56, right_margin = 8, upper_margin = 
41, lower_margin = 0,
   hsync_len = 176, vsync_len = 8, sync = 3, vmode = 1, reserved = {0, 
0, 0, 0, 0, 0}}

(gdb) bt
#0  fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8) at 
../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
#1  0x40bcfb64 in fbdevHWSetMode (pScrn=0x2142a0, mode=<value optimized 
out>, check=1)
     at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:528
#2  0x40bd07e8 in fbdevHWSetVideoModes (pScrn=0x2142a0) at 
../../../../hw/xfree86/fbdevhw/fbdevhw.c:568
#3  0x40cf5bec in ?? () from /usr/lib/xorg/modules/drivers//fbdev_drv.so
#4  0x00074e88 in InitOutput ()
#5  0x00039d04 in main ()

As you can see, the main video parameters are OK, while the 
monitor/modeline values (pixclock, left_margin, right_margin, 
upper_margin, lower_margin, hsync_len, vsync_len, sync and vmode)
were changed to zero.

Interestingly the stifb driver does not touch those values at all. 
Everything is done inside the main fbmem.c core driver, so it seems it 
could become a generic problem for other framebuffer drivers as well.

I don't see a reason, why a framebuffer driver should care about 
modelines (except for resolution and bpp) at all. OK, on a i386 with 
e.g. vgafb you might be able to change the resolution, but on the hppa 
architecture with the stifb driver this is not the case. It's a fixed 
resolution with (often) a fixed frequency monitor which can't be changed 
at runtime from inside the OS.

Any ideas?
Should I open a debian bug report?
Maybe the fbdev_modes_equal() function should just ignore any changes to 
  the timings?

Helge


xorg log file:
(II) LoadModule: "fbdevhw"
(II) Loading /usr/lib/xorg/modules/linux//libfbdevhw.so
(II) Module fbdevhw: vendor="X.Org Foundation"
         compiled for 1.4.2, module version = 0.0.2
         ABI class: X.Org Video Driver, version 2.0
(II) FBDEV(0): using /dev/fb0
(II) Running in FRAMEBUFFER Mode
(**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
(==) FBDEV(0): Default visual is PseudoColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): hardware: stifb (video memory: 1536kB)
(**) FBDEV(0): Option "fbdev" "/dev/fb0"
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0):  mode "1024x768" test failed
(II) FBDEV(0): checking modes against monitor...
(--) FBDEV(0): Virtual size is 1024x768 (pitch 1024)
(**) FBDEV(0):  Built-in mode "current": 28000.0 MHz, 27343.8 kHz, 
35603.8 Hz
(II) FBDEV(0): Modeline "current"x0.0  28000.00  1024 1024 1024 1024 
768 768 768 768 -hsync -vsync -csync (27343.8 kHz)
(==) FBDEV(0): DPI set to (96, 96)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules//libfb.so
(II) Module fb: vendor="X.Org Foundation"
         compiled for 1.4.2, module version = 1.0.0
         ABI class: X.Org ANSI C Emulation, version 0.3
(**) FBDEV(0): using shadow framebuffer
(II) Loading sub module "shadow"
(II) LoadModule: "shadow"
(II) Loading /usr/lib/xorg/modules//libshadow.so
(II) Module shadow: vendor="X.Org Foundation"
         compiled for 1.4.2, module version = 1.1.0
         ABI class: X.Org ANSI C Emulation, version 0.3
(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
(EE) FBDEV(0): mode initialization failed

Fatal server error:
AddScreen/ScreenInit failed for driver 0




Guy Martin wrote:
> Hi Dave,
> 
> This has been introduced in latest Xorg. When it modify the fb device,
> Xorg query the kernel again to make sure changes are the expected ones.
> Apparently, stifb doesn't return what it was expecting.
> 
> You'll find the Xorg code in hw/xfree86/fbdevhw/fbdevhw.c,
> fbdevHWSetMode().
> 
> 
> Cheers,
>   Guy
> 
> 
> On Tue, 5 Aug 2008 21:42:08 -0400
> John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> 
>>>> It wasn't and the default debian kernel didn't boot either.
>>>> I've set the default kernel to jda's 2.6.22.19 patched kernel.
>>> Is there a source tarball of that, or a list of applied patches? I
>>> would very much like to use that "homebrew" kernel on my cluster as
>>> well, until newer kernels are proven reliable enough...
>> I should mention that I've had a problem with starting X with lenny
>> and 2.6.22.  This has been a problem for sometime.  I've tried
>> simplifying the xorg.conf file and adding the mode helper to the
>> kernel, but I haven't found the magic incantation that works.
>>
>> Dave
> 
> 

