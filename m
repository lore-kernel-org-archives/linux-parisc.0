Received: from rhirst.linuxcare.com (user-143-103.jakinternet.co.uk [212.187.143.103] (may be forged))
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA30374
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 13:29:19 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BE3C1B007; Thu, 16 Nov 2000 20:28:42 +0000 (GMT)
Date: Thu, 16 Nov 2000 20:28:42 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: frowand@mvista.com
Cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@puffin.external.hp.com
Subject: Re: Single-stepping
Message-ID: <20001116202842.Y32715@linuxcare.com>
References: <200011161244.FAA03502@udlkern.fc.hp.com> <3A142EE0.5A7E5039@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A142EE0.5A7E5039@mvista.com>; from frank_rowand@mvista.com on Thu, Nov 16, 2000 at 11:00:48AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 16, 2000 at 11:00:48AM -0800, Frank Rowand wrote:
> John Marvin wrote:
> > > > Does this code properly handle branches in the delay slot of another
> > > > branch? (you need to make sure you are not advancing the queues by just
> > > > adding 4 to each element).  One concern I have about this method is that
> > >
> > > Current code does
> > >
> > >     /* Nullified, just crank over the queue. */
> > >     task_regs(child)->iaoq[0] = task_regs(child)->iaoq[1];
> > >     task_regs(child)->iasq[0] = task_regs(child)->iasq[1];
> > >     task_regs(child)->iaoq[1] = task_regs(child)->iaoq[0] + 4;
> > >
> > > Does that look right to you?
> > >
> > 
> > Yes, that is the correct way to do it (I'll assume the duplicated line
> > is just a cut/paste error).
> 
> If iaoq[0] contains a branch, iaoq[1] is in the delay slot.  The instruction
> executed after iaoq[1] would then typically _not_ be iaoq[0] + 4 (the next
> instruction would be the target of the branch at iaoq[0]).

But the above code is only executed if the current instruction is
nullified.  In your example, the branch in iaoq[0] would be
nullified and therefore never taken.

Richard
