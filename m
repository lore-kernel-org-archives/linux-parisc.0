Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust171.bre.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EB6E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 May 2001 08:18:30 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CC289B008; Thu, 24 May 2001 15:16:14 +0100 (BST)
Date: Thu, 24 May 2001 15:16:14 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	John Marvin <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic
Message-ID: <20010524151614.X8736@linuxcare.com>
References: <200105230853.CAA07709@udlkern.fc.hp.com> <200105231859.MAA00753@puffin.external.hp.com> <20010523201317.X23718@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010523201317.X23718@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Wed, May 23, 2001 at 08:13:17PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 23, 2001 at 08:13:17PM +0100, Matthew Wilcox wrote:
> On Wed, May 23, 2001 at 12:59:57PM -0600, Grant Grundler wrote:
> > Exactly. But if the driver is mucking with IRQ enable/disable,
> > does that mean the enable/disable code has to keep reference counts?
> > Don't recall any archs doing that when we did the initial implementation. 
> 
> cli -> disables irqs on all processors
> __cli -> disables irqs on local processor
> sti -> enables irqs on all processors
> __sti -> enable irqs on local processor
> 
> spin_lock_irqsave -> disables interrupts locally, puts the previous
> state into the state variable you supplied and acquires the spinlock
> spin_lock_irqrestore -> releases the spinlock and restores previous
> state from state variable
> 
> no need to keep enable/disable counts, the previous state gets stored
> for you.  if you're using cli and sti inappropriately, you lose.

You mean like scsi_request_fn() calling  spin_unlock_irq(&io_request_lock);
when called at interrupt level?

> OK, the problem is that you are getting into a interrupt loop.
> I see the following repeated sequence on the stack:
>
>       intr_extint         <-----------+
>       do_irq_mask                     |
>       do_irq                          |
>       dino_isr                        |
>       sym53c8xx_intr                  |
>       scsi_old_done                   |
>       rw_intr                         |
>       scsi_io_completion              |
>       __scsi_end_request              |
>       scsi_queue_next_request         |
>       scsi_request_fn                 | <<<< re-enables interrupts
>       scsi_dispatch_cmd               |
>       <NEXT INTERRUPT>    >-----------+

I also found

        spin_lock(&lock) can also be used in your interrupt handler if your
        device only uses one interrupt: the kernel guarantees that a interrupt
        handler is never reentered, even if the interrupt handler runs with
        enabled interrupts.

in <http://kt.zork.net/kernel-traffic/kt20000703_74.txt>

Richard
