From: j.raspe@t-online.de (Johannes Raspe)
Subject: Re: Penguin color problems on HCRX-24 (was: [parisc-linux] Re: STI crash on B132L with HCRX-24)
Date: Sun, 31 Oct 2004 15:06:00 +0100
Message-ID: <200410311506.00662.j.raspe@t-online.de>
References: <200410292228.14940.j.raspe@t-online.de> <200410311406.46194.j.raspe@t-online.de> <200410311456.50753.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: ajwalker@broadpark.no,
 parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <j.raspe@t-online.de>
In-Reply-To: <200410311456.50753.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

> > For solving the (cosmetical) penguin-color-problem I took a shot with my
> > digicam and attached it (sorry for poor quality).
>
> I was hoping my last patch would have fixed this too. Oh well :-)
>
> Right now I don't have any real idea why the penguin colors are wrong.
> But I have two assumptions:
> a) cfb_imageblit() works wrong in the current tree with 24/32bpp output and
> 8bpp input on big endian b) fb_set_logo_truepalette() creates a wrong
> palette for 24bpp output [but this function seems correct IMHO].
>
> Both of those I'm currently lost without any testing possibility, but I'll
> continue to look into it.
>
> BTW, does everything else seemscorrect wrt. colors on the text console,
> e.g. does midnight command shows blue background ?

Yes. mc looks normal and a "make menuconfig" shows the right colors too.

> Regards,
> Helge

Regards Johannes

-- 
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
Fingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105
