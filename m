Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95A954829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 18:41:52 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id E8726804D62
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 20:41:48 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id SAA17351
	for parisc-linux@lists.parisc-linux.org; Mon, 21 Oct 2002 18:41:48 -0600 (MDT)
Date: Mon, 21 Oct 2002 18:41:48 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200210220041.SAA17351@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> ok, going back through the CVS logs finds the answer:
>
> http://cvs.parisc-linux.org/obsolete/linux-2.3/arch/parisc/kernel/traps.c#rev1.
> 9
>
> Revision 1.9 / (as text) / (view) - annotate - [select for diffs] , Tue Feb 15
> 17:02:03 2000 UTC (2 years, 8 months ago) by jsm
> Branch: MAIN
> Changes since 1.8: +11 -2 lines
> Diff to previous 1.8
>
> Enable interrupts in fault path. Trap kernel space faults.
>
> So I think we want to change the sti() call to local_irq_enable().
>

Oooh, enabling interrupts on all processors is very bad.  Bad jsm, bad
jsm.  I tried to go back and figure out what was going on in my head back
then (2 years, 8 months ago).  Had to rummage around in the CVS attic to
find interruption.S for changes made at the same time.  At the time, user
processes were not being rescheduled properly (we had just turned on user
space), and they were running with I bit off.  I don't really remember why
I thought enabling interrupts here was a good idea.  Probably had
something to do with not wanting to handle faults with the I bit off.  But
that is bogus too (see below). One possible reason is that we didn't
have exception table support yet, and were probably taking kernel space
faults for bogus user addresses in the user copy routines.

Also, at the time we had not begun the SMP support, and the CONFIG_SMP
part of system.h was not filled in, and therefore I just saw the UP
definition of sti.  I probably couldn't imagine that the CONFIG_SMP
support would have sti enabling interrupts on all processors.  Yes, I know
now that that is the solution that Linux has chosen for supporting broken
(non SMP safe) drivers on SMP kernels ...

> Matthew Wilcox wrote:
> > So I think we want to change the sti() call to local_irq_enable().
>
> I think we want to remove it all together. Since I don't have a PA2.0
> book handy, PA1.1 Arch and Instruction Set Manual, page 5-141 says:
>         "... Execution of an RFIR instruction when any of the
>         PSW Q, I, or R bits are ones is an undefined operation."
>
> When "handle_interrupts()" is done, execution will return to entry.S
> and execute "rfir".  I expect RFIR to put I-bit back the way it was.

Well, I too think we shouldn't be calling local_irq_enable(), but NOT for
the reason above.  We would have had more severe problems if we called
rfir with I bit on (or Q bit for that matter).  Upon return from
handle_interruption we turn on the I bit, but then later we disable I and
Q before calling rfir in the return path from handle_interruption, so this
is not an issue.

Anyway, it would be bad to handle page faults with the I bit off.  But the
only time we should be coming into handle_interruption with the I bit off
should be during a kernel fault.  And we shouldn't be processing a user
space page fault in that case.

Note that we are currently turning the I bit on when we return from
handle_interruption, so this, so removing the local_irq_enable() is not
going to actually change any behaviour.  I just don't think it is
necessary, and the enablement upon return may be wrong also.  I believe
that the reason I put the original sti in (thinking it was a local cpu I
bit enable only) was based on a wrong understanding of the problem, and
that it was probably fixed the right way later on.

Now, I've also spent some time looking at the I bit enablement at the head
of intr_return in entry.S.  I don't think that is correct either.  But
just removing it is not the correct answer.  I know at one time I was
under the impression that calling schedule() with I bit off was a bad
thing.  But that is wrong.  Other architectures explicitly do this before
checking the RESCHED bit, and it is OK to call schedule with I bit off,
since schedule unconditionally turns it off without saving the I bit state
near the front of the routine with a spin_lock_irq() anyway.

So there MAY be a race condition bug with our checking for rescheds and
signals pending, but it needs more thought (we also check software
interrupts in the same path, need to make sure we do the right thing for
all of that).

Note, I don't think any of this is going to explain the problem specific
to the rp2470.

But, the original bad sti call may very well explain the apt-get SMP bug
(apt-get was causing an unaligned fault, which by itself shouldn't have
been a problem).

John

P.S. I'll try to do a more thorough investigation of the I bit handling
in intr_return tonight.
