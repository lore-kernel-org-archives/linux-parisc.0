Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA11018
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 11:59:54 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37839773.AE65FE8E@thepuffingroup.com>
Date: Wed, 07 Jul 1999 14:07:47 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Whee! Dino is recognized.
References: <199907071733.KAA10387@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Alex deVries wrote:

> > Dino device driver, by Alan Cox and Alex deVries
> > dino0: version 3.1 at 0xFF000000, IRQ 0, 1.
> 
> Did you plan on using both IAR0 and IAR1?
> 
> You don't need to. It doesn't help on single processor systems
> and only adds complexity in the IRQ management.
>

Oh, that wasn't quite clear in the dino docs.  I'll just ignore IAR1
then.

> 
> The PCI bus walk and IRQ management is pretty straight forward.
> At least if one has done it once before. :^)

The kernel already has generic PCI bus walking code, so this shouldn't
be too difficult
to sort out.  Philipp's doing very well with the interruption stuff, we
just need interrupts to work to be able to link them in.

But we can walk the bus without interrupts, so that's what I'm doing
next.

> Don't forget about U2/Uturn DMA services on C/J-class.
> It can probably be ignored for now.

It will be ignored for now because:
- I don't have a C or J class
- I've never heard of U2/Uturn before :)

> >
> > There's some initial code to handle multiple dinos, and it may in fact
> > work, but I really haven't tried (and can't until I have one of those
> > GSC ethernet cards that Thomas and Philipp have).
> 
> Notes:
> 1) The "card-mode" Dino's report different IODC data.
>    See description of IODC_DATA_0 register in the ERS.
>    The GSC 100BT cards using DEC 100BT LAN chip are "card-mode".

Yeah, I have detection for card mode. 

> 
> 2) Firmware will NOT touch card-mode Dino devices. ie Dino and PCI devices
>    below it must be programmed by the OS from scratch. Due to all the
>    platform variations where card-mode Dino are supported, HP-UX does
>    NOT map PCI MMIO space into processor I/O address space.

That makes sense, and once you know if it's a card mode Dino, then you
can decide if you need to setup the entire device from scratch.

Exactly what setup is required here?  I know on the second page into
Chapter 5 of the Dino docs they describe an example setup.

> 2) On J-class, the second GSCtoPCI IODC data is reported incorrectly
>    by firmware. I forgot what it reports but recall we had to kludge
>    the test in HP-UX.
> > What other HPs have Dino onboard?
> All A, B, C, and J class workstations.
> And the "industrial" rack mount 743 family.
> C and J have two built-in (aka Bridge-Mode) GSCtoPCI bus converters.
> J-class is "SMP" (2 processors).

Ah, excellent.

What HPs have Lasi?

> hope this helps,

It definitely does... thanks!

- alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
