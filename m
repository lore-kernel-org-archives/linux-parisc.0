Received: from hermes.mvista.com (gateway-490.mvista.com [63.192.220.206])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id MAA29246
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 12:00:04 -0700
Sender: frowand@hermes.mvista.com
Message-ID: <3A142EE0.5A7E5039@mvista.com>
Date: Thu, 16 Nov 2000 11:00:48 -0800
From: Frank Rowand <frank_rowand@mvista.com>
Reply-To: frowand@mvista.com
MIME-Version: 1.0
To: John Marvin <jsm@udlkern.fc.hp.com>
CC: parisc-linux@puffin.external.hp.com
Subject: Re: Single-stepping
References: <200011161244.FAA03502@udlkern.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
> 
> Richard,
> 
> >
> > Sorry, I worded that very badly.  The code that moves the childs
> > IAOQ on is in the kernel, invoked as a result of the controlling
> > process calling ptrace(PTRACE_SINGLESTEP...) when the childs N
> > bit is set.
> >
> 
> Great.
> 
> > > Does this code properly handle branches in the delay slot of another
> > > branch? (you need to make sure you are not advancing the queues by just
> > > adding 4 to each element).  One concern I have about this method is that
> >
> > Current code does
> >
> >     /* Nullified, just crank over the queue. */
> >     task_regs(child)->iaoq[0] = task_regs(child)->iaoq[1];
> >     task_regs(child)->iasq[0] = task_regs(child)->iasq[1];
> >     task_regs(child)->iaoq[1] = task_regs(child)->iaoq[0] + 4;
> >
> > Does that look right to you?
> >
> 
> Yes, that is the correct way to do it (I'll assume the duplicated line
> is just a cut/paste error).

If iaoq[0] contains a branch, iaoq[1] is in the delay slot.  The instruction
executed after iaoq[1] would then typically _not_ be iaoq[0] + 4 (the next
instruction would be the target of the branch at iaoq[0]).


> Sounds ok with me. And as long as there are no corner cases, it probably
> is the best solution, assuming we don't find another application for
> the recovery counter.

The recovery counter is very useful for performance measurement tools to
understand the cycles per instruction of a code path.  (Using the recovery
counter for the debugger doesn't preclude using it for performance tools -
you just can't easily use it for both purposes at the same instant in time.)


> John

-Frank
-- 
Frank Rowand <frank_rowand@mvista.com>
MontaVista Software, Inc
