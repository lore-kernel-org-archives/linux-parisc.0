Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19-pa24 (uaccess.h patch) 
In-Reply-To: Message from John Marvin <jsm@udlkern.fc.hp.com>
   of "Mon, 28 Oct 2002 22:55:02 MST." <200210290555.WAA12774@udlkern.fc.hp.com>
References: <200210290555.WAA12774@udlkern.fc.hp.com> 
Date: Tue, 29 Oct 2002 10:41:26 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021029174126.65B9A4829@dsl2.external.hp.com>
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

John Marvin wrote:
> However, Grant is right in that there is a hole if the kernel faults with
> the I bit off.

yes - I guess that's another way of looking at it.
My concern was around all the places in entry.S that return to
the intr_return label. That results in I-bit getting unconditional
set (thus re-enabling interrupts) until rfir restores it.
It opens a window where 

> Normally that would be a bug, i.e. there are few valid
> reasons for the kernel to fault with the I bit off (what I mean by fault
> in this case is something that makes it to handle_interruption, not
> something that gets handled at a lower level, like a tlb miss).

hmm...not sure about that. We have lots of misc reasons for traps/faults
where we just might not be handling the CPU correctly. In "Group 2"
Interrupt Class, only LPMC might be expected - but we don't protect
against the others either. I need to add code to "handle_interrupt()"
to see if I'm hitting that code path and how.

> But, I can think of a few possible scenarios where it might be happen
> legitimately, although I don't know if any actually occur.

I guess i should convince myself 100% it is happening and which trap/fault
is the offending bit.

> The right solution is to restore the I bit to whatever it was at the time
> of the fault.

I'm thinking the right solution is *only* the 'extr_interrupt' code
path should touch the I-bit after it's handled the external interrupt.
rfir will restore to what it should be. In practice, this would
mean that only extr_intr label will return to intr_return.
Everyone else will return to intr_restore.

And we need to find instances of local_irq_disable() when
I-bit is already off. Non-trivial since some code will save flags,
disable IRQ, and restore flags later.

> That is probably more appropriately handled at virt_map
> time (add a register argument to the macro holding the desired I bit
> state, call with r0 for intr_extint, call with previous masked value from
> ipsw for intr_save).  I believe if done right, we can also set things up
> properly in hpmc.S so that when it calls intr_save, the I bit won't be
> turned on, and we can remove the special case code from handle_interruption.

sounds like you understand this part of the code alot better than I do.

> I'm also looking at a potential problem in parisc's return from
> syscall/faults.  I'll hopefully fix all the above soon.  And yes, I'll
> merge it into 2.5 also.

cool - I'm testing my proposal to change other to use intr_restore path
but it's still deadlocking on io_request_lock at boot. Either some other
code must still be mucking with the I-bit or something is corrupting
the io_request_lock.

thanks,
grant
