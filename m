Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer 
In-Reply-To: Message from John Marvin <jsm@udlkern.fc.hp.com>
   of "Mon, 21 Oct 2002 18:41:48 MDT." <200210220041.SAA17351@udlkern.fc.hp.com>
References: <200210220041.SAA17351@udlkern.fc.hp.com> 
Date: Tue, 22 Oct 2002 19:19:12 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021023011912.A23F5482F@dsl2.external.hp.com>
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
...
> Upon return from
> handle_interruption we turn on the I bit, but then later we disable I and
> Q before calling rfir in the return path from handle_interruption, so this
> is not an issue.

Ah ok - my bad. I should have checked.
When doing any bottom half stuff, I think it should be ok for
I-bit to be enabled.

> Note that we are currently turning the I bit on when we return from
> handle_interruption, so this, so removing the local_irq_enable() is not
> going to actually change any behaviour.

hmmm. It changes the timing a bit but basically you are right.
I'm worried about the nesting of traps/interrupts in this case.
My gut feeling says we never want to enable I-bit for handling faults/traps.
Maybe to enable console output in a kernel_die() code path.

The obvious deadlock sequence to me is:
	spin_lock_irqsave() -> trap -> interrupt -> spin_lock()
or
	spin_lock_irqsave() -> trap -> interrupt/bottom half -> spin_lock()

I use "interrupt" to mean "External Interrupts" as defined by parisc arch.

> I just don't think it is necessary, and the enablement upon return may
> be wrong also.

yeah. I suspect it is.

...
> Now, I've also spent some time looking at the I bit enablement at the head
> of intr_return in entry.S.  I don't think that is correct either.  But
> just removing it is not the correct answer.

Please let me know if (a) you are chasing this down or (b) you
already found the correct answer. I'm very tempted to just try
removing it and see what breaks. I may not be able to debug the
resulting mess though...

...
> Note, I don't think any of this is going to explain the problem specific
> to the rp2470.

When scsi_lock_irqsave() blocks interrupts, we can't take any
external interrupt.  It results in a deadlock.

I'm suspecting that's also what was causing the deadlock on xtime_lock.
I added code to set EIEM to 0 in do_cpu_irq_mask() to avoid that deadlock.
I can't do the same for sym2 driver.

thanks,
grant
