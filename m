Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 355394854
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 02:32:55 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id D3ED51F7A7
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 04:30:52 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id CAA10917
	for parisc-linux@lists.parisc-linux.org; Wed, 3 Oct 2001 02:32:54 -0600 (MDT)
Date: Wed, 3 Oct 2001 02:32:54 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110030832.CAA10917@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PCXS fixes
List-ID: <linux-parisc.vger.kernel.org>

I just committed some PCXS fixes, some of which were based on the ideas
posted here in the last week or so for 720 support.  One new fix is that I
program the Asp interrupts correctly, fixing a bug which was preventing
710's from booting (I think there is at least one person on this list
with such a machine).

However, ls still hangs randomly (actually it is not random, it depends on
which directory the ls is done in).  It gets stuck in a ldcw loop due to
the lock word not being 16 byte aligned.  The problem is that we fixed the
alignment problems for static and dynamic allocations, but the align
attribute is ignored for automatic (stack) allocations. Note that
although ldcw requires 16 byte alignment for correct function, it does
not cause an unaligned fault if the address is not aligned, it just
doesn't work correctly!

Here are some suggested fixes:

    1) Fix the compiler to honor the aligned attribute for stack
    allocations. I'm not sure how difficult this would be. I'm
    not a compiler person, so someone else would have to do this.
    I would guess that this problem is in the machine independent
    part of the compiler. I'm not sure whether or not it would
    be considered a bug. It might be worth writing a test for
    the 386 version of gcc, and if it fails, report the "bug" and
    see what happens ...

    2) Change the lock structure to have 4 contiguous lock words, each
    initialized to 1.  Then the lock code can round the address up to the
    nearest 16 byte aligned address and use that for the semaphore.  If we
    choose this solution we can just get rid of the aligned attribute,
    since it would no longer serve any purpose.


John Marvin
jsm@fc.hp.com
