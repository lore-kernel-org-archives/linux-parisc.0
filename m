Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id FAA24651
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 05:01:19 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 30FDAB007; Thu, 16 Nov 2000 12:00:47 +0000 (GMT)
Date: Thu, 16 Nov 2000 12:00:47 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: Single-stepping
Message-ID: <20001116120047.U32715@linuxcare.com>
References: <200011160901.CAA00367@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011160901.CAA00367@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Thu, Nov 16, 2000 at 02:01:12AM -0700
List-ID: <linux-parisc.vger.kernel.org>

Hi John,

On Thu, Nov 16, 2000 at 02:01:12AM -0700, John Marvin wrote:
> Just to be clear, it is impossible to restore the entire PSW without
> an RFI. So, I assume you are referring to the system mask subset of
> the PSW that can be manipulated by the ssm,rsm, and mtsm instructions.

Yes, mtsm in this case.

> You mention restoring from the task's saved registers, but we currently
> do not save the system mask during a syscall (because it should be the
> same for all processes). Have you added code to do that also? If not,

Yes I have.

> you are restoring from whatever the state was at the last interruption.
> Which in this case works (since the R bit state will be changed
> by another process while the debugged process is suspended, this should
> guarantee that the R bit state is up to date), but it seems a little ugly.
> In my opinion, you should just be checking a bit in the ptrace flags
> in the task structure, and setting the R bit with an ssm instruction
> based on that.

Sounds better, I'll look in to it.

> > Nullified instructions are handled by the controlling process
> > manually moving the childs IAOQ over the instruction without
> > actually setting it running, because the recovery counter isn't
> > decremented for nullified instructions.

Sorry, I worded that very badly.  The code that moves the childs
IAOQ on is in the kernel, invoked as a result of the controlling
process calling ptrace(PTRACE_SINGLESTEP...) when the childs N
bit is set.

> Does this code properly handle branches in the delay slot of another
> branch? (you need to make sure you are not advancing the queues by just
> adding 4 to each element).  One concern I have about this method is that

Current code does

    /* Nullified, just crank over the queue. */
    task_regs(child)->iaoq[0] = task_regs(child)->iaoq[1];
    task_regs(child)->iasq[0] = task_regs(child)->iasq[1];
    task_regs(child)->iaoq[1] = task_regs(child)->iaoq[0] + 4;

Does that look right to you?

> I wonder if it is necessary to do this.  So what if we don't stop on the
> nullified instruction.  Since it is nullified, it doesn't actually do
> anything, so why does the user have to see it, i.e. just let the recovery
> counter trap happen on the next truly executed instruction (i.e. the
> debugger performs a "double step" in this case).  Am I missing something
> here?

I don't see why we really need to stop on a nullified instruction, but
I'll wait for Alan to comment as he wrote this initially.

>     1) When single stepping over a syscall, when do you actually stop the
>     single stepping and execute the syscall?  Hopefully you are not
>     allowing single stepping after the gate instruction on the gateway
>     page (and returning control to a non privileged debugging process).
>     The recovery counter trap should detect when the user code gets
>     to the gateway page.

At the moment my test harness notes IAOQ=0x100 and stops single stepping,
but obviously the kernel needs to enforce that.

>     2) Does your solution properly handle single stepping into and out of
>     a signal handler?  Note that the debugger will trap the signal as part
>     of this process. Since the return is handled through a hidden syscall
>     you may not have to do anything special here.

Havn't looked at signal handling yet.

> Note that HP-UX does not use the recovery counter for single stepping.  I

Thanks for the description of how HP-UX does it.  I'll stick with
the recovery counter for now as it does seem to be basically working.
I'll also try to ensure that it is completely encapsulated within the kernel
so it is less painful to change later, if need be.

Thanks,
  Richard
