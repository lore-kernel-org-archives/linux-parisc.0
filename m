Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA03547
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 22:42:05 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id EC50B157
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 00:44:16 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id WAA23694 for parisc-linux@puffin.external.hp.com; Sun, 19 Nov 2000 22:43:02 -0700 (MST)
Date: Sun, 19 Nov 2000 22:43:02 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011200543.WAA23694@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: Single-stepping
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> > Note that this is the short explanation. It is not as simple as it sounds.
> > One major complication is that branches with links don't work properly
> > with the instruction queue magic, so the link register has to be updated
> > in the taken branch trap handler. Also branch externals won't update
> > the space of the space queue tail properly (again, that has to be fixed
> > in the taken branch handler). I can provide more details if the recovery
> > counter method doesn't work out.
>
> I'm a little intrigued about these "complications".  How can the link
> register or space _not_ be updated properly?  As far as I can see, the
> only really tricky instruction to single-step is RFI - which shouldn't
> ever occur in userspace, and which we'd just emulate if it was important.

The problem is that the link register is set to IAOQ_Back + 4. and in
the case of ble, sr0 is set to IASQ_Back. Since we've played games with
the queues, IAOQ_Back and IASQ_Back are pointing at the break page, not
at the instruction following the branch.

The additional complication is that the taken branch trap traps at the
branch destination, not at the branch, so at the point of the trap you
don't know where you came from in order to fix the problem easily.  So,
what HP-UX does is check each instruction before it executes it to see if
it is a branch, and if so, what the link register is (and that is all that
needs to be parsed, since we are not emulating the instruction).  It then
stores the branch location, and also sets some branch state flags (e.g.
UBE for a branch external, and UBL for a branch with a link, both flags
being set for a ble instruction).  Then in the taken branch handler you
have all the information you need to fix the queue.  You also need
to check this saved state if a signal handler is invoked while single
stepping, so that the proper pc queue values can be saved in the signal
context.

John Marvin
jsm@fc.hp.com
