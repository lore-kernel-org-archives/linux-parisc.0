Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92CB248EE
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Sep 2001 01:12:46 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id 0C5441F78F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Sep 2001 03:12:46 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id BAA15478
	for parisc-linux@lists.parisc-linux.org; Sun, 30 Sep 2001 01:12:45 -0600 (MDT)
Date: Sun, 30 Sep 2001 01:12:45 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200109300712.BAA15478@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> It looks (reads) as if it possible to return to the faulting instruction
> (MFCTL in this case) without executing it.  If so, then adjusting the
> instruction (and space) queues within the fault handler can be avoided;
> also avoiding problems with finding the correct "following instruction"
> address.

Using the nullify method you talk about does work, but the normal
convention is to advance the pc queue (there are some performance
advantages, particularly in the case where the instruction we are
emulating is in the delay slot of a branch).  The problem you describe
finding the following instruction doesn't exist.  You are correct about
the space queue though, but only in the case for a delay slot in the
branch to the gateway page.  The correct method of advancing the queue is
the one that has been proposed in the various patches, i.e.:

	regs->iaoq[0] = regs->iaoq[1];
	regs->iaoq[1] += 4;

To be perfectly correct, this should be added:

	regs->iasq[0] = regs->iasq[1];

But, again, that last is only necessary if someone actually puts a mfctl
in the delay slot of the branch to the gateway page (a kernel call) and
since kernel calls are already provided, we know that no such thing
actually happens, nor is it likely to happen unless someone handcodes
their own kernel call. I would put the line in though.

Here is why there is not a problem advancing the queue as above:
the only way that "regs->iaoq[1] += 4" would do the wrong thing would
be if we were emulating a branch instruction. Since we know we are
emulating a mfctl instruction, this is not the case. Note that if
someone needs to emulate a branch instruction, computing the new
value of iaoq[1] would be part of that emulation.

John Marvin
jsm@fc.hp.com
