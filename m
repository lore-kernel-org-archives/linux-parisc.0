Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id B27384829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Oct 2002 18:57:16 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2470 hang...getting closer 
In-Reply-To: Message from grundler@dsl2.external.hp.com (Grant Grundler)
   of "Sat, 12 Oct 2002 22:40:33 MDT." <20021013044033.88A544829@dsl2.external.hp.com>
References: <20021013044033.88A544829@dsl2.external.hp.com> 
Date: Sun, 20 Oct 2002 18:57:16 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021021005716.B27384829@dsl2.external.hp.com>
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

Grant Grundler wrote:
> I'm getting closer to figuring out why rp2470 (a500-6x) hangs at boot time.

had some ideas to think about/work on.

> Here's the sequence I see so far:
> o scsi_register_host() acquires io_request_lock (tpnt->use_new_eh_code is tru
>   e)
> o scsi_register_host() calls tpnt->detect(tpnt)
> o detect() points to sym53c8xx_detect()
> o sym53c8xx_detect() calls sym_attach() 
> o sym_attach() initializes s.timer to point at sym53c8xx_timer but
>   directly calls sym_timer() to kick off the self-arming timer.
>   timer will pop in 0.5 seconds.

sym_attach() also calls request_irq().
request_irq() *enables* the IRQ for that line.
I suspect this might unmask the timer interrupt as well.
I'll add some debug code and test this out.

And after looking at arch/parisc/kernel/irq.c, I think we have a
race condition in our cpu_irq_ops. ie the eiem value read could be
different if we take an interupt at the wrong moment. ie need to
save_flags/local_irq_disable()/restore around touching the eiem.
If someone seconds that opinion, I'll add/test that.

Lastly, use of IPI to set_eiem() on all CPUs can probably go away.
In 2.5, I was under the impression we no longer require globally
disabling of interrupts - only on the local CPU.  For both 2.4
and 2.5, parisc only needs to mask/unmask the EIEM bit on the CPU
that is the target of that IRQ, not all CPUs. ie if the IPI
is needed, it should just target the same CPU which will handle the
specific external intr.

> o other interfaces are detected/initialized.
> o timer_interrupt() calls timer_bh() and invokes sym53c8xx_timer().
> o sym53c8xx_timer() attempts to reacquire the io_request_lock.  checkmate.

grant
