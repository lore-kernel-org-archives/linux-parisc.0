Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 805E9482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 14:35:59 -0600 (MDT)
Date: Tue, 28 Aug 2001 16:36:39 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828163639.C4741@megatonmonkey.net>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net> <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk> <20010828071743.A1289@megatonmonkey.net> <20010828155619.I18341@parcelfarce.linux.theplanet.co.uk> <20010828112900.B30657@megatonmonkey.net> <20010828194713.A2995@parcelfarce.linux.theplanet.co.uk> <20010828152221.B4741@megatonmonkey.net> <20010828204458.B2995@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828204458.B2995@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Aug 28, 2001 at 08:44:58PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> Yes, but you were crosscompiling.  `make install' is very different
> with a crossbuild.
> 

What are the major differences? Crosscompiling vs. Crossbuild?
Better yet, where can I learn about those difference?

> 
> THe program which is being run is
> /home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/timezone/zic; glibc
> is making sure it's run with the new ld.so and all the new versions of
> the libs.
> 

So the native build of zic barfs. I'm not even sure if zic runs when
you compile glibc by hand? Hrm... zic.c is 52,000 loc.. eww.


> Have you actually tried installing glibc 2.2.4-1 on a live system and
> running programs with it?
> 
> It's more likely that one of the other debian patches conflicts with
> what we're doing.  The debian/rules file will apply the patches in the
> debian/patches directory in the order given by debian/patches/0list.
> I seem to remember a couple of other diffs that need to get applied...

Question:
In theory since those patches are changes that haven't been merged upstream,
should the only requirements be:

- Have 2.2.4 Original
- Carry out any one of the dpatch's since they are dif'd against 2.2.4 Original
- Then carry out the 2.2.4-1 patch

For x86 Cross Compiler, the only requirement would be:
- Apply the dpatch's that are critical to the running hppa port

Quesiton:
If the pool has the hppa changes commented out in the 0list file, does
that mean that glibc2.2.4 is not available for hppa yet? (Since it fails to 
compile? The first error probably being the Elf32_Addr* problem with
that '& 3' fixed by a cast to (unsigned int)).

> 
> That's changing all the testandset to trylock.
>

Why would that be in the hppa dpatch?

Cheers,
Carlos. 
