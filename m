From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Sat, 23 Aug 2008 10:49:47 -0400 (EDT)
Message-ID: <20080823144948.B4F104E4A@hiauly1.hia.nrc.ca>
References: <48A49B70.9030706@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gmsoft@tuxicoman.be, kraxel@goldbach.in-berlin.de,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48A49B70.9030706@gmx.de> from "Helge Deller" at Aug 14, 2008 10:54:08 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The driver sets a video mode and then checks if the syscall modified the 
> parameters with the function fbdev_modes_equal():
> 
> --snip--
> /* static*/ Bool
> fbdev_modes_equal(struct fb_var_screeninfo *set, struct 
> fb_var_screeninfo *req)
> {
>          return (set->xres_virtual >= req->xres_virtual &&
>                  set->yres_virtual >= req->yres_virtual &&
>                  set->bits_per_pixel == req->bits_per_pixel &&
>                  set->red.length == req->red.length &&
>                  set->green.length == req->green.length &&
>                  set->blue.length == req->blue.length &&
>                  set->xres == req->xres && set->yres == req->yres &&
>                  set->pixclock == req->pixclock &&
>                  set->right_margin == req->right_margin &&
>                  set->hsync_len == req->hsync_len &&
>                  set->left_margin == req->left_margin &&
>                  set->lower_margin == req->lower_margin &&
>                  set->vsync_len == req->vsync_len &&
>                  set->upper_margin == req->upper_margin &&
>                  set->sync == req->sync && set->vmode == req->vmode);

The is the kernel's implementation:

int fb_mode_is_equal(const struct fb_videomode *mode1,
                     const struct fb_videomode *mode2)
{
     return (mode1->xres         == mode2->xres &&
     mode1->yres         == mode2->yres &&
     mode1->pixclock     == mode2->pixclock &&
     mode1->hsync_len    == mode2->hsync_len &&
     mode1->vsync_len    == mode2->vsync_len &&
     mode1->left_margin  == mode2->left_margin &&
     mode1->right_margin == mode2->right_margin &&
     mode1->upper_margin == mode2->upper_margin &&
     mode1->lower_margin == mode2->lower_margin &&
     mode1->sync         == mode2->sync &&
     mode1->vmode        == mode2->vmode);
}

> Tracing with gdb gives the following:
> 
> Breakpoint 1, fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8)
>      at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
> 256     }
> (gdb) p *set
> $1 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
> xoffset = 0, yoffset = 0,
>    bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
> msb_right = 0}, green = {offset = 0,
>      length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
> msb_right = 0}, transp = {offset = 0,
>      length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
> width = 0, accel_flags = 0,
>    pixclock = 0, left_margin = 0, right_margin = 0, upper_margin = 0, 
> lower_margin = 0, hsync_len = 0,
>    vsync_len = 0, sync = 0, vmode = 0, reserved = {0, 0, 0, 0, 0, 0}}
> 
> (gdb) p *req
> $2 = {xres = 1024, yres = 768, xres_virtual = 1024, yres_virtual = 768, 
> xoffset = 0, yoffset = 0,
>    bits_per_pixel = 8, grayscale = 0, red = {offset = 0, length = 8, 
> msb_right = 0}, green = {offset = 0,
>      length = 8, msb_right = 0}, blue = {offset = 0, length = 8, 
> msb_right = 0}, transp = {offset = 0,
>      length = 0, msb_right = 0}, nonstd = 0, activate = 0, height = 0, 
> width = 0, accel_flags = 0,
>    pixclock = 22271, left_margin = 56, right_margin = 8, upper_margin = 
> 41, lower_margin = 0,
>    hsync_len = 176, vsync_len = 8, sync = 3, vmode = 1, reserved = {0, 
> 0, 0, 0, 0, 0}}
> 
> (gdb) bt
> #0  fbdev_modes_equal (set=0xfb5ed568, req=0xfb5ed4c8) at 
> ../../../../hw/xfree86/fbdevhw/fbdevhw.c:256
> #1  0x40bcfb64 in fbdevHWSetMode (pScrn=0x2142a0, mode=<value optimized 
> out>, check=1)
>      at ../../../../hw/xfree86/fbdevhw/fbdevhw.c:528
> #2  0x40bd07e8 in fbdevHWSetVideoModes (pScrn=0x2142a0) at 
> ../../../../hw/xfree86/fbdevhw/fbdevhw.c:568
> #3  0x40cf5bec in ?? () from /usr/lib/xorg/modules/drivers//fbdev_drv.so
> #4  0x00074e88 in InitOutput ()
> #5  0x00039d04 in main ()
> 
> As you can see, the main video parameters are OK, while the 
> monitor/modeline values (pixclock, left_margin, right_margin, 
> upper_margin, lower_margin, hsync_len, vsync_len, sync and vmode)
> were changed to zero.

> Any ideas?

Given that the kernel considers the above as part of the video mode,
I believe that this is a kernel bug.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
