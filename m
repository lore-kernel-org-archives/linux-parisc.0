Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx09.cluster1.charter.net (dc-mx09.cluster1.charter.net [209.225.8.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78D29486D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 22:12:04 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by dc-mx09.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 63130480 for parisc-linux@lists.parisc-linux.org; Sat, 24 Aug 2002 00:11:58 -0400
Message-ID: <3D6707CC.6020408@charter.net>
Date: Sat, 24 Aug 2002 00:13:00 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo2 (was: Question ...)
References: <003601c24b1e$757a8120$a80251d9@PLUTO>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

If you check back in the archives for this month
Alan Cox wrote in and was talking about the V2.

There is an sstfb framebuffer for the kernel, which
may need some work to use with hppa. Also, XFree86
has a 2D driver for Voodoo1/2 cards which uses the
glide libraries.

But, yes, the V2 card is initially dead until something
wakes it up, so it won't screw up the C200 firmware
hardware scan. The V2 has no BIOS, so thats not an
issue.

Steps to get it to work:

  a.  Compile Glide 2x on hppa (hopefully easy)
  b.  Tweak XF86Config-4 to get it to work (shouldn't be a big deal)
  c.  Tinker with the kernel sstfb code (probably challenging)


I think that a V2 would be a nifty board for these
HPPA boxen, as the documentation for the original
HP cards is lost / gone, and supporting them is
extremely problematic these days. And V2 cards
are pretty plentiful and very inexpensive these
days. Not to mention, they were real powerhouses.

Most of the HP graphics cards used this top-secret
"color recovery technology" which used a special
dithering method to reduce graphics data to 8bpp,
then the card somehow restored it to 24bpp. What
this means is that for all intents and purposed
all HP cards will be limited to 8bpp unless someone
can reverse engineer this stuff, which is probably
very unlikely to ever happen.

With a V2, at least you have a good chance of 16bpp
which to me is good enough. These boxes will never
be big gaming rigs, but 16bpp is nice for the newer
window managers and generally makes for an appealing
looking display.

I have a $15 V2 board winging its way to me now.
I suppose I oughtta get working on compiling glide.
I'll make the full debian source / binary / etc
available on my little Netwinder server if it works.



Tobias Giesen wrote:
>>I'm going to be attempting to get a *Voodoo2* 
>>board working with X, so if you hang around 
>>I may be able to write a HOWTO-hppa-Voodoo2-
>>XFree86 guide, assuming it works.
> 
> 
> A very good project that is. If you can make it work I'll get one too. I
> assume the Voodoo2 would be initially dead and then activated by
> XFree86? Would it need a new BIOS?
> 
> Cheers,
> Tobias
