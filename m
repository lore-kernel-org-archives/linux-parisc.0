Received: from cosrel2.hp.com (cosrel2.hp.com [156.153.255.162])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id CAA20858
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 02:00:21 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel2.hp.com (Postfix) with ESMTP id 0262F2B5
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 02:02:01 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id CAA00367 for parisc-linux@puffin.external.hp.com; Thu, 16 Nov 2000 02:01:12 -0700 (MST)
Date: Thu, 16 Nov 2000 02:01:12 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011160901.CAA00367@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: Single-stepping
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>   I've been helping Alan Modra out with kernel changes to support
> single stepping for gdb.  Paul Bame suggested I bounced our ideas
> off you in case you (or anyone else) had any comments.  I havn't
> actually committed my changes yet.
>

I've decided to respond to the whole list, since others are now
participating in the discussion.

> The basic approach is to use the recovery counter to generate
> a trap every instruction.  The scheme is complicated because a
> suspended process may or may not return to user space via an RFI.
>

There is no easy way to do single stepping on parisc. So any single
stepping design will be complicated.

> If it was suspended as a result of an interrupt then we can
> simply set PSW bit R in the tasks saved registers and it will
> get loaded by the RFI.  On every task switch I set the
> recovery counter to 0, just in case the new process is being
> single-stepped.
>
> If a process is suspended during a syscall, then there is no
> RFI on the return path to userland, and we have to handle things
> differently.  I have changed the syscall return path such that
> it loads the recovery counter with 3 before updating the PSW
> with a value from the tasks saved registers.  If that PSW has
> the R bit set, then the count of 3 will generate a trap on the
> first instruction following the branch back to user space.
> Note that PSW wasn't previously restored on the syscall return
> path.
>

Just to be clear, it is impossible to restore the entire PSW without
an RFI. So, I assume you are referring to the system mask subset of
the PSW that can be manipulated by the ssm,rsm, and mtsm instructions.

You mention restoring from the task's saved registers, but we currently
do not save the system mask during a syscall (because it should be the
same for all processes). Have you added code to do that also? If not,
you are restoring from whatever the state was at the last interruption.
Which in this case works (since the R bit state will be changed
by another process while the debugged process is suspended, this should
guarantee that the R bit state is up to date), but it seems a little ugly.
In my opinion, you should just be checking a bit in the ptrace flags
in the task structure, and setting the R bit with an ssm instruction
based on that.

> To avoid further complications of interrupts during the three
> instructions when the recovery counter is decrementing, whenever
> we set the R bit, we also clear the I bit to disable interrupts.

Yuck, but I agree that it would be messier to have to deal with this in
the interrupt handlers.  Please make sure that a comment is added that
explains what you are doing, and clearly documents the dependency on the
number of remaining instructions before we return to user privilege level.
I assume you restore the I bit in the recovery counter trap handler.  I
can think of alternative ways of doing this, but they are probably just as
ugly (e.g. one possibility would be to do an rfi to set the L bit).

>
> Nullified instructions are handled by the controlling process
> manually moving the childs IAOQ over the instruction without
> actually setting it running, because the recovery counter isn't
> decremented for nullified instructions.

Does this code properly handle branches in the delay slot of another
branch? (you need to make sure you are not advancing the queues by just
adding 4 to each element).  One concern I have about this method is that
the userland debugger has to cooperate to make this design work, i.e. the
single stepping is not accomplished entirely within the kernel, so we
cannot easily change the design for single stepping at a later date.

I wonder if it is necessary to do this.  So what if we don't stop on the
nullified instruction.  Since it is nullified, it doesn't actually do
anything, so why does the user have to see it, i.e. just let the recovery
counter trap happen on the next truly executed instruction (i.e. the
debugger performs a "double step" in this case).  Am I missing something
here?

>
> I need to do some more testing before committing this, but would
> welcome any comments on the basic approach taken, areas I have
> mis-understood, or problems with it that might not yet have
> occurred to me.

OK, well here are some issues that you didn't mention, so I don't
know whether or not you addressed them:

    1) When single stepping over a syscall, when do you actually stop the
    single stepping and execute the syscall?  Hopefully you are not
    allowing single stepping after the gate instruction on the gateway
    page (and returning control to a non privileged debugging process).
    The recovery counter trap should detect when the user code gets
    to the gateway page.

    2) Does your solution properly handle single stepping into and out of
    a signal handler?  Note that the debugger will trap the signal as part
    of this process. Since the return is handled through a hidden syscall
    you may not have to do anything special here.

Note that HP-UX does not use the recovery counter for single stepping.  I
made a few phone calls to various engineers to find out what the design
process was, and why they chose the solution they did, but I could not
find anyone who knew.  Looking at the code in HP-UX it looks like someone
implemented that code a long time ago, and some of the engineers who have
worked on it since don't understand it, because some of the comments added
since then clearly show a lack of understanding of what is really going
on.

Others on this list have mentioned that MPE does use the recovery counter
for single stepping. Of course, MPE is not a Unix clone, so just because
it could be done on MPE doesn't mean that the recovery counter can cover
all cases on Unix (e.g. I have no idea how signals and syscalls are
implemented on MPE). But since I have no idea why the recovery counter
was not used for HP-UX, I can't say it is the wrong way to go. I can't
think of anything that will definitely rule it out, I'm just a little
uncomfortable with the fact that HP-UX chose not to use it.

One advantage of the HP-UX method is that it completely encapsulates the
single stepping inside the kernel, so it can be changed if necessary,
without having to modify gdb (and having to worry about old versions of
gdb).

Anyway, for reference, HP-UX does single stepping by using a combination
of the taken branch trap, and loading the instruction queues such that the
front of the queue points to the next instruction to be single stepped and
the back of the queue points to the first of two break instructions on a
"break" page.  It does NOT insert break instructions into the code, so it
does not adversely affect execution on a SMP machine.  Note that we
already put a bunch of break instructions before the syscall entry point
on the gateway page, so it would be easy to use our gateway page for the
"break page".  This way, if the single stepped instruction branches, a
taken branch trap will be taken (which is important in the case where the
branch nullifies its delay slot).  Otherwise, the instruction will be
executed and then the break instruction at the known location on the
"break" page will be executed.  If the single stepped instruction
nullifies the next instruction, the second break instruction on the
"break" page will be executed.

Note that this is the short explanation. It is not as simple as it sounds.
One major complication is that branches with links don't work properly
with the instruction queue magic, so the link register has to be updated
in the taken branch trap handler. Also branch externals won't update
the space of the space queue tail properly (again, that has to be fixed
in the taken branch handler). I can provide more details if the recovery
counter method doesn't work out.

Sincerely,

John Marvin
jsm@fc.hp.com
