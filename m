Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id FAA25431
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 05:46:18 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by palrel3.hp.com (Postfix) with ESMTP id 1897F133D
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 04:46:09 -0800 (PST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id FAA03502 for parisc-linux@puffin.external.hp.com; Thu, 16 Nov 2000 05:44:55 -0700 (MST)
Date: Thu, 16 Nov 2000 05:44:55 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011161244.FAA03502@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: Single-stepping
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard,

>
> Sorry, I worded that very badly.  The code that moves the childs
> IAOQ on is in the kernel, invoked as a result of the controlling
> process calling ptrace(PTRACE_SINGLESTEP...) when the childs N
> bit is set.
>

Great.

> > Does this code properly handle branches in the delay slot of another
> > branch? (you need to make sure you are not advancing the queues by just
> > adding 4 to each element).  One concern I have about this method is that
>
> Current code does
>
>     /* Nullified, just crank over the queue. */
>     task_regs(child)->iaoq[0] = task_regs(child)->iaoq[1];
>     task_regs(child)->iasq[0] = task_regs(child)->iasq[1];
>     task_regs(child)->iaoq[1] = task_regs(child)->iaoq[0] + 4;
>
> Does that look right to you?
>

Yes, that is the correct way to do it (I'll assume the duplicated line
is just a cut/paste error).

> > I wonder if it is necessary to do this.  So what if we don't stop on the
> > nullified instruction.  Since it is nullified, it doesn't actually do
> > anything, so why does the user have to see it, i.e. just let the recovery
> > counter trap happen on the next truly executed instruction (i.e. the
> > debugger performs a "double step" in this case).  Am I missing something
> > here?
>
> I don't see why we really need to stop on a nullified instruction, but
> I'll wait for Alan to comment as he wrote this initially.
>

Given the above, i.e. that this is being handled in the kernel anyway, I
guess I don't really care which way this goes. Probably it is best to
do it whatever way gdb on hp-ux presents it.

> >     1) When single stepping over a syscall, when do you actually stop the
> >     single stepping and execute the syscall?  Hopefully you are not
> >     allowing single stepping after the gate instruction on the gateway
> >     page (and returning control to a non privileged debugging process).
> >     The recovery counter trap should detect when the user code gets
> >     to the gateway page.
>
> At the moment my test harness notes IAOQ=0x100 and stops single stepping,
> but obviously the kernel needs to enforce that.
>
You should also be checking the space. But yes, the kernel needs to enforce
this for security reasons. You should be able to do it in the recovery
counter trap handler (rather than having to test for it in the syscall
path, which affects all processes).

> >     2) Does your solution properly handle single stepping into and out of
> >     a signal handler?  Note that the debugger will trap the signal as part
> >     of this process. Since the return is handled through a hidden syscall
> >     you may not have to do anything special here.
>
> Havn't looked at signal handling yet.
>

I'm not sure that there is a real issue here or not.  HP-UX has some code
for single stepping with respect to signal handlers, but I believe it may
only be necessary due to the saved state necessary as part of the iaoq
manipulation.  Obviously you should test this case.

> > Note that HP-UX does not use the recovery counter for single stepping.  I
>
> Thanks for the description of how HP-UX does it.  I'll stick with
> the recovery counter for now as it does seem to be basically working.
> I'll also try to ensure that it is completely encapsulated within the kernel
> so it is less painful to change later, if need be.
>

Sounds ok with me. And as long as there are no corner cases, it probably
is the best solution, assuming we don't find another application for
the recovery counter.

John
