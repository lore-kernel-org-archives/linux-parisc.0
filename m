Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA10858
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 11:34:15 -0600
Message-Id: <199907071733.KAA10387@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Whee! Dino is recognized. 
In-reply-to: Your message of "Wed, 07 Jul 1999 02:23:40 PDT."
             <3782F26C.78876DDD@thepuffingroup.com>
Date: Wed, 07 Jul 1999 10:33:11 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> I fixed up dino.c a little to setup it's HPA properly.  Understanding
> the docs took a bit of time, so this is a personal victory.

Congrats!
This is a good step forward.

A few more notes below.

> 
> Now the kernel boots up and prints:
> 
> Dino device driver, by Alan Cox and Alex deVries
> dino0: version 3.1 at 0xFF000000, IRQ 0, 1.

Did you plan on using both IAR0 and IAR1?

You don't need to. It doesn't help on single processor systems
and only adds complexity in the IRQ management.

> Now we just need to configure the PCI bus properly, connect the
> interrupts, and we should be close to being able to talk to a network.
> The A-classes have tulips hanging off the PCI bus, so that should be
> pretty simple.

The PCI bus walk and IRQ management is pretty straight forward.
At least if one has done it once before. :^)

Don't forget about U2/Uturn DMA services on C/J-class.
It can probably be ignored for now.
They help performance if the OS can determine DMA is coherent
with processor caches. Then the PCI device drivers don't need
to flush processor caches before/after DMA operations. It also
allows 32-bit PCI devices to access more than 4GB of mem directly.

> 
> There's some small changes so that the GSC irqs are handled by a pool
> handler.
> 
> People with 712s differ at this point, you'll have to muck with Lasi's
> built in ethernet port, which will be slightly difficult because you may
> interrupt the serial console in doing so.  If you use the graphics, you
> should be okay.
> 
> There's some initial code to handle multiple dinos, and it may in fact
> work, but I really haven't tried (and can't until I have one of those
> GSC ethernet cards that Thomas and Philipp have).

Notes:
1) The "card-mode" Dino's report different IODC data.
   See description of IODC_DATA_0 register in the ERS.
   The GSC 100BT cards using DEC 100BT LAN chip are "card-mode".

2) Firmware will NOT touch card-mode Dino devices. ie Dino and PCI devices
   below it must be programmed by the OS from scratch. Due to all the
   platform variations where card-mode Dino are supported, HP-UX does
   NOT map PCI MMIO space into processor I/O address space.

2) On J-class, the second GSCtoPCI IODC data is reported incorrectly
   by firmware. I forgot what it reports but recall we had to kludge
   the test in HP-UX.

> What other HPs have Dino onboard?

All A, B, C, and J class workstations.
And the "industrial" rack mount 743 family.
C and J have two built-in (aka Bridge-Mode) GSCtoPCI bus converters.
J-class is "SMP" (2 processors).

hope this helps,
grant

> 
> - Alex

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
