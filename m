Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7015D4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 16:07:50 -0700 (MST)
Message-Id: <200102052310.PAA02945@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Fun with RAID 
In-reply-to: Your message of "Sun, 04 Feb 2001 04:08:21 PST."
             <20010204040821.A12539@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 05 Feb 2001 15:10:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> As some of you will have noticed, the current Head branch, as well as
> enabling lots of strange and curious segfaults also enables Software Raid.
> I suspect someone with the time & inclination will eventaully write some
> optimised XOR functions for PA-RISC, but in the meantime, we shall use the
> generic C functions.

I've pointed out to Matthew that using speculative loads (for PA2.0)
would help to preload cachelines.

> So, just for fun, let's see how they stack up.  Here's results from a 712
> (PCX/L CPU):
> 
> raid5: measuring checksumming speed
>    8regs     :    60.960 MB/sec
>    32regs    :   107.442 MB/sec
> 
> and here's a C200+ (PCX/U+ CPU):
> 
>    8regs     :   421.386 MB/sec
>    32regs    :   531.876 MB/sec
> 
> which is as you would expect, but i have a vague recollection that grant
> said the 8regs was the faster code on the A500.

Yeah. I've had both:
   8regs     :  2091.309 MB/sec
   32regs    :  2266.569 MB/sec

and

   8regs     :  2090.928 MB/sec
   32regs    :  1637.157 MB/sec

The first was from an NFS boot.
The second from the same vmlinux booted from local SCSI disk.
Don't ask me. I don't know why the difference.

On C3000 (same 64-bit kernel again):
   8regs     :  1900.809 MB/sec
   32regs    :  1799.082 MB/sec

and again with 32-bit on same C3000:
   8regs     :   950.214 MB/sec
   32regs    :   937.260 MB/sec

Both c3k results were using NFS root and "head".

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
