Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dual.buttafuoco.net (vsat-148-63-214-126.c3.sb4.mrt.starband.net [148.63.214.126])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6EF084869
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 05:58:20 -0600 (MDT)
Date: Wed, 3 Oct 2001 07:58:17 -0400
Message-Id: <200110031158.f93BwH402719@dual.buttafuoco.net>
From: "Jim Buttafuoco" <jim@buttafuoco.net>
To: John Marvin <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Reply-To: jim@buttafuoco.net
Subject: Re: [parisc-linux] PCXS fixes
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

John,

I have a couple of 710's and would love to test if you can provide me 
with a kernel to net boot from.

Jim


> I just committed some PCXS fixes, some of which were based on the 
ideas
> posted here in the last week or so for 720 support.  One new fix is 
that I
> program the Asp interrupts correctly, fixing a bug which was 
preventing
> 710's from booting (I think there is at least one person on this list
> with such a machine).
> 
> However, ls still hangs randomly (actually it is not random, it 
depends on
> which directory the ls is done in).  It gets stuck in a ldcw loop due 
to
> the lock word not being 16 byte aligned.  The problem is that we 
fixed the
> alignment problems for static and dynamic allocations, but the align
> attribute is ignored for automatic (stack) allocations. Note that
> although ldcw requires 16 byte alignment for correct function, it does
> not cause an unaligned fault if the address is not aligned, it just
> doesn't work correctly!
> 
> Here are some suggested fixes:
> 
>     1) Fix the compiler to honor the aligned attribute for stack
>     allocations. I'm not sure how difficult this would be. I'm
>     not a compiler person, so someone else would have to do this.
>     I would guess that this problem is in the machine independent
>     part of the compiler. I'm not sure whether or not it would
>     be considered a bug. It might be worth writing a test for
>     the 386 version of gcc, and if it fails, report the "bug" and
>     see what happens ...
> 
>     2) Change the lock structure to have 4 contiguous lock words, each
>     initialized to 1.  Then the lock code can round the address up to 
the
>     nearest 16 byte aligned address and use that for the semaphore.  
If we
>     choose this solution we can just get rid of the aligned attribute,
>     since it would no longer serve any purpose.
> 
> 
> John Marvin
> jsm@fc.hp.com
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
> 
