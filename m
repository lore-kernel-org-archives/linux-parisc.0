Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA14240
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 22:03:13 -0700
Date: Thu, 9 Dec 1999 05:50:39 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] txn_alloc_irq() change
Message-Id: <19991209055039.E21512@mathe.stud.uni-erlangen.de>
References: <19991206193447.B21512@mathe.stud.uni-erlangen.de> <199912090024.QAA03214@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912090024.QAA03214@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > The original plan was to hide txn_alloc_irq (which I still think is a bad
> > name as no-one is going to remember it) in bus-specific wrappers --
> > gsc_alloc_irq is one, though the Dino driver does not use it currently.
> 
> For munging the return values on specific busses, I agree. By that,
> I mean gsc_alloc_irq() is a useful interface for GSC devices which
> program their EIM register. This service is NOT bus specific.

Yes, it is.  Whether you can even reach the CPU's EIR register from a
certain bus is bus-specific.  Which EIR you want to use if you have the
choice is bus-specific.  The address of the EIR, if you can reach
it, is bus-specific (as you have a TLB between your system bus and the
I/O bus(ses) on most PA2.0 systems, right ?).  The length of the data
word you can send is bus-specific (5 bits for GSC, 6 bits for 64-bit
PA busses).

> I'm open for suggestions on the name.

If you want to export txn_alloc_irq to PCI drivers, ask the guys who will
actually have to use it - i.e. the driver authors for devices you want to
use transaction interrupts and the PCI maintainers for architectures that
support transaction interrupts (IA64 and PA-RISC ?).

If you want to keep the function parisc-specific and not exported to drivers
(just to the bus-specific wrappers), it could be called "cca1a78e0" without
anyone getting too upset about it.

> > So this doesn't even affect "well-written" drivers.
> This is wrong. Symbios SCSI, ATM, and Gigabit Ethernet Drivers could
> all *directly* use this service. All of those devices are capable of
> mastering a "Message Signalled Interrupt" instead of yanking an IRQ line.

And why would the driver be concerned with it ?  I am not sure how PCI
TBIs work, but the way I would hope it works is the PCI bus initialization
code assigns address/data pairs to those devices that support TBIs and
puts the corresponding irq into the pci_dev structure.  That way, we're
down to one line of code that calls txn_alloc_irq.

For those PCI devices that don't use the standard configuration mechanism
to do TBIs, if they should turn out to be worth it, you would have to do
stuff in the actual device driver, but I don't think there are many devices
to which this applies.

> It's a chicken and egg problem though: since no service exists for them
> on PC's, the drivers aren't written to use it. With IA64 and PA-risc

If you need to let the driver know which mechanism is used at the hardware
level to deliver interrupts, that's a flaw of the PCI spec (and would make
TBIs a lot less usable than IRQ line PCI interrupts). 

> > Changing txn_alloc_irq isn't exactly high-priority as all systems that
> > use <= 31 interrupt-generating devices (which I guess are the systems
> > we're currently working with) should work just fine right now.
> 
> Your priorities don't match mine. I'm getting paid to work on stuff
> which only runs under PA2.0.

The public Linux/PA-RISC tree is PA1.1 only right now, and I dare say we
don't care about systems with more than 31 IRQ-generating devices.

I don't know about the IA64 tree and any non-public Linux/PA-RISC trees,
but it was my impression those have their own mailing-lists and changes
to them need not be discussed here.

> The current interface only works for a subset of all parisc platforms.

Yeah, the subset with <= 31 devices.

> > txn_alloc_{addr,data} are confusing names as those functions don't actually
> > allocate anything.
> 
> They don't currently allocate anything but future implementations could.

How ?

All the allocation is handled in txn_alloc_irq - it returns a virtual irq
that can be resolved to an address/data pair lateron.  If we want to allocate
data (eg the eim bit index right now), it's done in txn_alloc_irq.  If we
want to allocate addresses (eg the future txn_alloc_irq returning the right
CPU's EIR), we do it in txn_alloc_irq.

> The IRQ is a *virtual* IRQ (prumpf knows that; I don't have to tell him).
> The address and data associated with that IRQ can be any CPU and any EIR
> bit for a given CPU.
> 
> Secondly, the names match with txn_alloc_irq() and that makes it easier
> to remember. I'm open to changing the names for all three functions.

Actually, what you should think about is merging the three functions -
virtual irq, transaction address and transaction data don't make sense on
their own, so you almost always end up doing

	tmp1 = txn_alloc_irq(...);
	tmp2 = txn_alloc_addr(irq);
	tmp3 = txn_alloc_data(irq);

which seems unnecessarily verbose.

	Philipp Rumpf
