Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA12010
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 17:21:29 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id E7A446E3
	for <parisc-linux@thepuffingroup.com>; Wed,  8 Dec 1999 16:23:36 -0800 (PST)
Message-Id: <199912090024.QAA03214@milano.cup.hp.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] txn_alloc_irq() change 
In-reply-to: Your message of "Mon, 06 Dec 1999 19:34:47 PST."
             <19991206193447.B21512@mathe.stud.uni-erlangen.de>
Date: Wed, 08 Dec 1999 16:24:36 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

[ I didn't respond sooner because of parisc-linux mail problems...
  thank phil! - grant ]

Philipp Rumpf wrote:
> > I was working through Message Signalled Interrupt (aka TBIs) allocation
> > and realized our current txn_alloc_irq() implementation needs to accepted
> > at least one parameter. The parameter would indicate a (one of two)
> > capability of the caller's device. Returning a negative irq indicates
> > the host can't support the device because the host doesn't have a
> > compatible resource.
> 
> The original plan was to hide txn_alloc_irq (which I still think is a bad
> name as no-one is going to remember it) in bus-specific wrappers --
> gsc_alloc_irq is one, though the Dino driver does not use it currently.

For munging the return values on specific busses, I agree. By that,
I mean gsc_alloc_irq() is a useful interface for GSC devices which
program their EIM register. This service is NOT bus specific.

I'm open for suggestions on the name.

I won't be able to modify Dino in the near future to
use the same services LASI is using. I can work on this
next month.

> So this doesn't even affect "well-written" drivers.

This is wrong. Symbios SCSI, ATM, and Gigabit Ethernet Drivers could
all *directly* use this service. All of those devices are capable of
mastering a "Message Signalled Interrupt" instead of yanking an IRQ line.
It's a chicken and egg problem though: since no service exists for them
on PC's, the drivers aren't written to use it. With IA64 and PA-risc
joining the parade, the drivers can take advantage of those features.
I'm pretty sure the "high-speed" networking folks at CERN will be
interested in this once they understand its utility.

> Changing txn_alloc_irq isn't exactly high-priority as all systems that
> use <= 31 interrupt-generating devices (which I guess are the systems
> we're currently working with) should work just fine right now.

Your priorities don't match mine. I'm getting paid to work on stuff
which only runs under PA2.0. I'm helping with PA1.1 I/O subsystem because
the vast majority of everything else is common (and it's fun too).

GSC/NIO devices implement an EIM register and can only use EIR bits 0-31.
GSC Fast/Wide/Diff SCSI (NCR c720 SCSI) driver does NOT have to use the
EIM register. Similarly, some ATM/SCSI/GigE PCI devices behind Dino
don't have to use IRQ lines. MSI support depends on the "processor",
not the bus.

The current interface only works for a subset of all parisc platforms.
I'm proposing an architectural change to support all current (and some
future) parisc platforms because I think it's the "right" thing to do.


> >         /* enable_irq() will use txn_* to program IRdT (PAT only) */
> >         vi->vi_txn_addr = txn_alloc_addr(vi->vi_txn_irq);
> >         vi->vi_txn_data = txn_alloc_data(vi->vi_txn_irq);
> 
> txn_alloc_{addr,data} are confusing names as those functions don't actually
> allocate anything.

They don't currently allocate anything but future implementations could.
The IRQ is a *virtual* IRQ (prumpf knows that; I don't have to tell him).
The address and data associated with that IRQ can be any CPU and any EIR
bit for a given CPU.

Secondly, the names match with txn_alloc_irq() and that makes it easier
to remember. I'm open to changing the names for all three functions.


> > In addition, I would like folks to tell me if we should add a second
> > parameter to indicate how "wide" the "txn_addr" can be. I had assumed
> > the width of a host processor pointer address but cards may not support
> > enough bits (ie 32-bit card won't work on system which wants 40-bit or
> > 44-bit physical addr). AFAIK PA-Risc systems have processors aliased to
> > below 4GB physical address and thus it won't be an issue for our port.
> > But other architectures do support MSI and it seems easy to avoid
> > nasty surprizes later.
> 
> This, again, depends on the bus.  For PCI, either your card supports dual
> address cycles and you can use 64 bits, or it doesn't, in which case your
> system needs to alias everything below 4 GB anyway.

That's true. But the card *also* needs to support dual address cycle
and the caller (ie device driver) will know this. For systems which
alias stuff below 4GB, we should just use those aliases. I'm concerned
about a case where the PCI bus adapter supports dual address cycle,
the card does not, no alias exists, and the processor is above 4GB.
Somewhat obscure and I hope we don't run into this. That's why I simply
ask for folks to tell me if we should support it even if it might not
get used.

Dino does not support dual address cycle.
"lba" (C3000/J5000) PCI bus adapter does.

thanks prumpf for the feedback,
grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
