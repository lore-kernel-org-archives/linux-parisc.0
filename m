Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E0944839
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 May 2001 22:39:34 -0600 (MDT)
Message-Id: <200105250431.WAA08405@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic 
In-Reply-To: Your message of "Thu, 24 May 2001 15:16:14 BST."
             <20010524151614.X8736@linuxcare.com>
Date: Thu, 24 May 2001 22:31:27 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> You mean like scsi_request_fn() calling  spin_unlock_irq(&io_request_lock);
> when called at interrupt level?

spin_unlock_irq() can only twiddle the I-bit (PSW) since it's not
told which irq to save/restore state for.  But the EIEM bit in CR15
should remain masked. So I don't think this code should be a problem.

*Someone* is unmasking the CPU EIEM bit for dino_isr().
And that's a bug since only do_irq_mask() should be unmasking it
when the ISR completes. This is orthogonal to the I-bit state.

...
> I also found
> 
>       spin_lock(&lock) can also be used in your interrupt handler if your
>       device only uses one interrupt: the kernel guarantees that a interrupt
>       handler is never reentered, even if the interrupt handler runs with
>       enabled interrupts.
> 
> in <http://kt.zork.net/kernel-traffic/kt20000703_74.txt>

I read the kt summary. The wording is somewhat ambiguous.

Each device instance will typically use one interrupt.
The above statement suggests to me the driver ISR gets called serially
to handle each device instance. That's certainly not the case for
anything with IO APIC or SAPIC.

I think he meant the ISR won't get re-entered for a given instance
of a device. And the kernel does that by masking the particular IRQ
assigned to that device instance.
For some reason that doesn't appear to be working for dino.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
