Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AD47482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Sep 2001 07:56:44 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id F40557C8
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Sep 2001 09:56:42 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id HAA22153
	for parisc-linux@lists.parisc-linux.org; Fri, 7 Sep 2001 07:56:42 -0600 (MDT)
Date: Fri, 7 Sep 2001 07:56:42 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200109071356.HAA22153@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Trace/Breakpoint trap on "make mrproper"
List-ID: <linux-parisc.vger.kernel.org>

>
> It looks like this patch:
> >Date: Thu, 6 Sep 2001 03:48:16 -0600 (MDT)
> >From: John Marvin jsm@udlkern.fc.hp.com
> >Subject: [parisc-linux-cvs] Patch for SMP support, etc.>
> >A rather large patch that includes my current SMP support changes, plus
> >a variety of other fixes/changes.
>
> did something. But it's so large I'm not sure what exactly :-)
>
> Jurriaan
>

I was pretty sure my changes to handle_break (in traps.c) would fix that
problem.  When I read your note I remembered that I had seen a similar
problem and fixed it.  The kernel would hang when a user program executed
a break instruction (either intentionally or not) without an attached
debugger. That is the problem you were seeing.

However, now that the machine doesn't hang, I am not sure if the remaining
problem you are seeing is a kernel bug or a userland bug.  It would appear
that you are executing 0's (0x00000000 is a break instruction). That
should cause the kernel to send you a SIGTRAP signal. I just checked some
of your old mail, and it looks like you are getting a SIGTRAP. One thing
that looks strange is that you are getting signals delivered using stack
addresses both at ~0xfaf00000 and ~0xbff00000. I wonder if make is using
an alternate signal stack?

John
