Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ex1.ncsa.uiuc.edu (ex1.ncsa.uiuc.edu [141.142.2.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DBFA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Sep 2001 07:43:03 -0600 (MDT)
Received: from mx1.ncsa.uiuc.edu (mx1.ncsa.uiuc.edu [141.142.2.8])
	by ex1.ncsa.uiuc.edu (8.11.6/8.11.0) with ESMTP id f87DguU14030
	for <parisc-linux@lists.parisc-linux.org>; Fri, 7 Sep 2001 08:42:56 -0500 (CDT)
Received: from osage.ncsa.uiuc.edu (osage.ncsa.uiuc.edu [141.142.2.56])
	by mx1.ncsa.uiuc.edu (8.11.6/8.11.0) with ESMTP id f87DguT21743
	for <parisc-linux@lists.parisc-linux.org>; Fri, 7 Sep 2001 08:42:56 -0500 (CDT)
Date: Fri, 7 Sep 2001 08:42:56 -0500 (CDT)
From: Galen Arnold <arnoldg@ncsa.uiuc.edu>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0109070842320.13232-100000@osage.ncsa.uiuc.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: smp kernel hangs during boot on L2000 ... (fwd)
List-ID: <linux-parisc.vger.kernel.org>

---------- Forwarded message ----------
Date: Fri, 7 Sep 2001 07:31:05 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
To: arnoldg@ncsa.uiuc.edu
Subject: Re: smp kernel hangs during boot on L2000 ...


Galen,

>
> My L2000 box is hanging here with the smp 64bit
> kernel I've built:
>
> CPU(s): 2 x PA8600 (PCX-W+) at 540.000000 MHz
> Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
> Console: colour dummy device 160x64
> Initialized PDC Console for debu
>                                 ^^^^^hangs right there...
>

...

> Has anyone got an SMP kernel running on their L2000, and if so, could you
> send me your .config and palo.conf for comparison?

I've done most of my SMP development on a 4 CPU L2000.  So far I've only
tested a SMP kernel on a L2000 (64 bit) and a J5000 (32 & 64 bit).
However, I have 440 Mhz PA8500 CPU's.  That shouldn't make a significant
difference, other than some possible timing problem.  I'll try to test on
a 2 CPU A500 with PA8600 CPU's on Monday just in case.

I am using the standard config (arch/parisc/defconfig), with the exception
of defining CONFIG_SMP. I don't see any problem with your kernel command
line either.

One possibility is that you are not using a new enough compiler. There was
a compiler bug (64 bit kernels only) that seemed to manifest itself more
on SMP kernels.

The latest native cross compiler can be found at:

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/unofficial-debs/

The latest 386 cross compiler is at:

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tar.gz

however, last time I checked, the 386 cross compiler did not yet have the
fix in it. Matt Taggart was going to try to build a new one.

Note for those wanting to start using the SMP code. The CONFIG_SMP support
should be considered as a base for continued development. It still has
a variety of bugs and instabilities. When building linux kernels in a
continuous loop, 10 out of about 320 builds failed to generate a kernel.
The kernel will typically hang if you start swapping heavily. Another
known problem is that the support has not been implemented for a clean
SMP shutdown (should not be difficult to add if someone cares to work
on that before I get a chance).

There is also some code that is not optimal for performance, i.e. there
are a fair number of tuning possibilities. Some code specifically was
not optimized due to the intention of changing the design (for example
the single spinlock used for all tlb dirty bit updates).

John

P.S. I am assuming you can boot a non CONFIG_SMP kernel on your L2000.
Is that a correct assumption?
