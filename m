Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA16657
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Aug 1999 20:11:05 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id WAA14142
	for <parisc-linux@thepuffingroup.com>; Wed, 25 Aug 1999 22:12:13 -0400 (EDT)
Message-Id: <199908260213.TAA11687@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c 
In-reply-to: Your message of "Thu, 26 Aug 1999 02:16:27 PDT."
             <E11Jo9U-0005JL-00@the-village.bc.nu>
Date: Wed, 25 Aug 1999 19:13:04 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
...
> > o Do GBD or other psuedo drivers need to reserve EIRR bits?
> >   Ie soft interrupts to reschedule work at lower SPL levels.
> 
> Linux has no notion of SPL levels at all. The model is
> 

Alan - looks like something got dropped here. Try again?


> Hardware interrupt. These live in a unified space described by a cookie.
> We map the cookie to the irq number on a PC but that is optional. Drivers
> only know about irqs as a cookie.

I think there is going to a problem with "cookies" on PA.
The problem is GSC devices need to program an "EIM" register.
(For Dino, this is IAR0). The contents of the EIM register
are a processor HPA (bits 11-31) and EIRR bit number (bits 0-4;
ie a value 0-31). The location of this register is NOT
defined by PA I/O architecture - or at least not well defined.
Is this a real problem or not?

Another tidbit: I know of only one device which can use "6-bit"
(0-63) EIRR vectors. GSC and PCI devices which are capable of mastering
their own interrupt transactions can also use 6-bits. 6-bits is
obviously only supportable running a 64-bit kernel binary.


> Bottom half handlers. We invoke these on the path out of an irq before
> returning to the normal scheduled universe. mark_bh() sets a bh to be run
> on the next return. BH's are not run if they are already running - they
> are single threaded with respect to each other right now - that may change
> to be 'with respect to self' one day.

For single CPU is doesn't matter. For SMP scalability it might.

> Interrupts may occur during a bh, we normally dont allow interrupts during
> an IRQ handler on the same CPU. 

SPL levels allow the system clock to always get service regardless of how
badly an ISR behaves on the interrupt stack. SPL levels also allow
the clock to "reschedule" work at a lower priority on the interrupt stack
to guarantee the timeout is called "pretty soon". SPL levels also
allow device drivers to service IRQs while the bottom half is active.
Allowing this nesting of SPL levels permits scheduling on the interrupt
stack. Any particular reason for not allowing this?
(eg abuse by driver writers)

thanks,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
