Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA05386
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 23:54:06 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA27096;
	Mon, 20 Nov 2000 17:53:18 +1100
Date: Mon, 20 Nov 2000 17:53:18 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: Single-stepping
In-Reply-To: <200011200543.WAA23694@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0011201703290.15391-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 19 Nov 2000, John Marvin wrote:

> > I'm a little intrigued about these "complications".  How can the link
> > register or space _not_ be updated properly?  As far as I can see, the
> > only really tricky instruction to single-step is RFI - which shouldn't
> > ever occur in userspace, and which we'd just emulate if it was important.
> 
> The problem is that the link register is set to IAOQ_Back + 4. and in
> the case of ble, sr0 is set to IASQ_Back. Since we've played games with
> the queues, IAOQ_Back and IASQ_Back are pointing at the break page, not
> at the instruction following the branch.

Ah.  That is a little nasty, especially given the effect on signal
handlers you mention below.  Maybe using the recovery counter isn't such a
bad idea after all, especially since the added syscall and task switch
overhead can be quite small if the kernel only supports single-step by
one instruction.

> The additional complication is that the taken branch trap traps at the
> branch destination, not at the branch, so at the point of the trap you
> don't know where you came from in order to fix the problem easily.  So,
> what HP-UX does is check each instruction before it executes it to see if
> it is a branch, and if so, what the link register is (and that is all that
> needs to be parsed, since we are not emulating the instruction).  It then
> stores the branch location, and also sets some branch state flags (e.g.
> UBE for a branch external, and UBL for a branch with a link, both flags
> being set for a ble instruction).  Then in the taken branch handler you
> have all the information you need to fix the queue.  You also need
> to check this saved state if a signal handler is invoked while single
> stepping, so that the proper pc queue values can be saved in the signal
> context.

Another question for you and/or the list in general:
Why does struct pt_regs have an ipsw field?  Seems like it currently is
unused.

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
