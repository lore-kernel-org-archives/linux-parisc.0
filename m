Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C14D4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 May 2001 13:07:34 -0600 (MDT)
Message-Id: <200105231859.MAA00753@puffin.external.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic 
In-Reply-To: Your message of "Wed, 23 May 2001 02:53:15 MDT."
             <200105230853.CAA07709@udlkern.fc.hp.com>
Date: Wed, 23 May 2001 12:59:57 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
...
> OK, the problem is that you are getting into a interrupt loop.
> I see the following repeated sequence on the stack:
> 
> 	intr_extint         <-----------+
> 	do_irq_mask                     |
> 	do_irq                          |
> 	dino_isr                        |
> 	sym53c8xx_intr                  |
> 	scsi_old_done                   |
> 	rw_intr                         |
> 	scsi_io_completion              |
> 	__scsi_end_request              |
> 	scsi_queue_next_request         |
> 	scsi_request_fn                 |
> 	scsi_dispatch_cmd               |
> 	<NEXT INTERRUPT>    >-----------+

Uh oh. that's a bug. From irq.c:do_irq_mask() 

...
                mask_irq(irq_num);
                do_irq(&region->action[irq], irq_num, regs);
                unmask_irq(irq_num);
...

So it shouldn't be possible to take another interrupt
while in do_irq().

...
> to Richard Hirst, and he said a later version of the sym53c8xx driver
> processes things differently (using scsi_done instead of scsi_old_done)
> so that this shouldn't happen. However, I believe it shouldn't be
> happening anyway, because we should be preventing the isr from being
> re-entered in the general irq handling code.

Exactly. But if the driver is mucking with IRQ enable/disable,
does that mean the enable/disable code has to keep reference counts?
Don't recall any archs doing that when we did the initial implementation. 

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
