Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C82A94A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Feb 2001 21:08:22 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14PGTN-0005y2-00
	for parisc-linux@lists.parisc-linux.org; Sun, 04 Feb 2001 04:08:21 +0000
Date: Sun, 4 Feb 2001 04:08:21 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010204040821.A12539@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Fun with RAID
List-ID: <linux-parisc.vger.kernel.org>

As some of you will have noticed, the current Head branch, as well as
enabling lots of strange and curious segfaults also enables Software Raid.
I suspect someone with the time & inclination will eventaully write some
optimised XOR functions for PA-RISC, but in the meantime, we shall use the
generic C functions.

There are two functions to choose from, and the code does this at
boottime.  One is optimised for processors with 8 registers, and the
other for processors with 32 registers.  The 32regs one uses 8 registers,
interleaving loads, xors, and stores.  The 8regs function just dumbly
loads, xors and stores for each word.

So, just for fun, let's see how they stack up.  Here's results from a 712
(PCX/L CPU):

raid5: measuring checksumming speed
   8regs     :    60.960 MB/sec
   32regs    :   107.442 MB/sec

and here's a C200+ (PCX/U+ CPU):

   8regs     :   421.386 MB/sec
   32regs    :   531.876 MB/sec

which is as you would expect, but i have a vague recollection that grant
said the 8regs was the faster code on the A500.

[thanks to Ryan for the C200+ result]

-- 
Revolutions do not require corporate support.
