Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA18330
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 06:12:04 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 26 Aug 1999 12:13:43 -0000
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c
To: grundler@cup.hp.com (Grant Grundler)
Date: Thu, 26 Aug 1999 13:06:22 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
In-Reply-To: <199908260213.TAA11687@milano.cup.hp.com> from "Grant Grundler" at Aug 25, 99 07:13:04 pm
Content-Type: text
Message-Id: <E11JyIS-0005hE-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Alan - looks like something got dropped here. Try again?

The perils of 2am posting - add the word "different"

> I think there is going to a problem with "cookies" on PA.
> The problem is GSC devices need to program an "EIM" register.
> (For Dino, this is IAR0). The contents of the EIM register
> are a processor HPA (bits 11-31) and EIRR bit number (bits 0-4;
> ie a value 0-31). The location of this register is NOT
> defined by PA I/O architecture - or at least not well defined.
> Is this a real problem or not?

It isnt. If need be you hand out irq numbers to drivers that are
indexes into an array that gives all the real gsc/pci mappings, registers
and other goodies.

> > on the next return. BH's are not run if they are already running - they
> > are single threaded with respect to each other right now - that may change
> > to be 'with respect to self' one day.
> 
> For single CPU is doesn't matter. For SMP scalability it might.

Thats why it might change 

> SPL levels allow the system clock to always get service regardless of how
> badly an ISR behaves on the interrupt stack. SPL levels also allow

We flame people who write badly behaving irq handlers instead. 

> to guarantee the timeout is called "pretty soon". SPL levels also
> allow device drivers to service IRQs while the bottom half is active.

We service IRQs with the bottom half active. The idea is that all non
immediate processing occurs at bh layer - think of the BH system as a BSD
like kernel with only one SPL level.

Having one level reflects the realities of more machines and doesn't really
lose us anything. A typical example flow is

	user space
	[IRQ arrives]
		myether_irq
			handle ring buffer
			netif_rx(buffer)
		 	(marks the NET bh to run)
		end irq
		runs net_bh if not running, irqs are enabled
		process packets
		done
	user space


Alan
