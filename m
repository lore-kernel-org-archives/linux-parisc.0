From: "Andy Walker" <ajwalker@broadpark.no>
Subject: Re: Penguin color problems on HCRX-24 (was: [parisc-linux] Re: STI
     crash on B132L with HCRX-24)
Date: Mon, 1 Nov 2004 00:09:07 +0100 (CET)
Message-ID: <34676.127.0.0.1.1099264147.squirrel@127.0.0.1>
References: <200410292228.14940.j.raspe@t-online.de>
    <200410311312.21653.deller@gmx.de>
    <200410311406.46194.j.raspe@t-online.de>
    <200410311456.50753.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "Johannes Raspe" <j.raspe@t-online.de>,
 parisc-linux@lists.parisc-linux.org
To: "Helge Deller" <deller@gmx.de>
Return-Path: <ajwalker@broadpark.no>
In-Reply-To: <200410311456.50753.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

> Hi Johannes,
>
> On Sunday 31 October 2004 14:06, Johannes Raspe wrote:
>> For solving the (cosmetical) penguin-color-problem I took a shot with my
>> digicam and attached it (sorry for poor quality).
>
> I was hoping my last patch would have fixed this too. Oh well :-)
>
> Right now I don't have any real idea why the penguin colors are wrong.
> But I have two assumptions:
> a) cfb_imageblit() works wrong in the current tree with 24/32bpp output
> and 8bpp input on big endian
> b) fb_set_logo_truepalette() creates a wrong palette for 24bpp output [but
> this function seems correct IMHO].
>
> Both of those I'm currently lost without any testing possibility, but I'll
> continue to look into it.
>
> BTW, does everything else seemscorrect wrt. colors on the text console,
> e.g. does midnight command shows blue background ?
>
> Regards,
> Helge
>

Hi Helge,

Will get the HCRX24 in the post tomorrow or Tuesday.

The good news with your latest patch is that an HCRX24 on fb1 doesn't
boot up bright magenta anymore - it comes up black. When the HCRX24 is
fb0 and I run X11,  the colour palette is correct on exit and the
virtual consoles all have correct colours. Excellent!

I get the black for green psychedelic tux on boot like Johannes.

The big problem with HCR24 in 32bpp is that the X server only uses
three quarters of the screen width - the last quarter remains black.
Screen content in the visible three quarters is horizontally squashed (i.e.
the image that would have filled the whole width is displayed in 3/4)
and there are colour artefacts on edges, fonts etc.

cheers,
-Andy
