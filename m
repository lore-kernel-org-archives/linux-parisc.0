Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2100482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 May 2001 02:53:16 -0600 (MDT)
Date: Wed, 23 May 2001 02:53:15 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200105230853.CAA07709@udlkern.fc.hp.com>
To: rbrad@beavis.ybsoft.com
Subject: Re: [parisc-linux] kernel panic
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>
> I have attached the panic output and the symbol table again.
>
> Thanks for the help!
>
> - Ryan

OK, the problem is that you are getting into a interrupt loop.
I see the following repeated sequence on the stack:

	intr_extint         <-----------+
	do_irq_mask                     |
	do_irq                          |
	dino_isr                        |
	sym53c8xx_intr                  |
	scsi_old_done                   |
	rw_intr                         |
	scsi_io_completion              |
	__scsi_end_request              |
	scsi_queue_next_request         |
	scsi_request_fn                 |
	scsi_dispatch_cmd               |
	<NEXT INTERRUPT>    >-----------+

I still was not able to get to the base of the stack. I believe you
are crossing many 16K blocks of memory, and die when the next
timer interrupt comes in.

Note that there is a path from scsi_dispatch_cmd that eventually calls
ccio_map_sg, i.e. I believe scsi_dispatch_cmd had already called
ccio_map_sg (indirectly) before the interupt came in. Since the interrupt
always comes in at the exact same instruction in scsi_dispatch_cmd,
it probably is happening at some point where the driver reenables
interrupts.

So, it looks like the printk in ccio_map_sg is causing the isr to take
long enough that the previous scsi command completes and the card
interrupts before the isr returns. This shouldn't happen. I talked
to Richard Hirst, and he said a later version of the sym53c8xx driver
processes things differently (using scsi_done instead of scsi_old_done)
so that this shouldn't happen. However, I believe it shouldn't be
happening anyway, because we should be preventing the isr from being
re-entered in the general irq handling code.

The bad news is that since this problem is being "caused" by the printk,
it probably does not explain your original bug (hopefully the scsi isr
normally takes much less time to complete than the actual scsi request
does!).  However, if this interrupt loop is fixed, you would then be able
to use printk to help debug the real problem.

I can't remember if your original problem crashed the system or just
caused data corruption. If the machine stays up, a debugging workaround
might be to store data in an internal array instead of using printk.
You could then dump this array after the problem occured. One possible
hack to dump the array would be to add code to dump it via the proc fs
code that already exists in the ccio_dma code.

John
