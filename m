Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA07384
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Dec 1999 06:51:38 -0700
Date: Sat, 11 Dec 1999 14:33:11 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] txn_alloc_irq() change
Message-Id: <19991211143311.B17836@mathe.stud.uni-erlangen.de>
References: <19991209055039.E21512@mathe.stud.uni-erlangen.de> <199912090700.XAA03556@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912090700.XAA03556@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Philipp,
> The *service* is not bus specific. The details (ie parameters) are.

Yes, I was wrong about that.  It really is not bus specific.

> Please seperate interfaces from implementations.
> You claimed early on you would do that.

And I don't see how having the interface be per-bus (to sort the details
out) and the implementation (for now) be trivial would violate that.

> Ok. I need to lookup and contact NCR/Symbios SCSI, ATM, and GigE
> driver authors and pester them one this topic.

Just as a matter of interest, which GigE chip are you talking about ?
I looked at the Alteon docs and that chip (which is the only one I
saw used in a parisc box so far) seems not to support TBIs (with the
standard firmware).  If you end up using non-standard firmware anyway,
it is quite likely you can support standard PCI 2.2 TBIs (if they are
defined).  Furthermore the typical interrupt load is quite low with
the current Linux driver.

For the SCSI chips I am pretty sure the interrupt load won't be worth
big hacks.

> > If you want to keep the function parisc-specific and not exported to drivers
> > (just to the bus-specific wrappers), it could be called "cca1a78e0" without
> > anyone getting too upset about it.
> 
> Really?
> As Alex would say: "I don't believe you".

The point I wanted to make is if the function is used in three places, all
of them parisc-specific, the name can be bad and nobody cares.  If it used
in lots of drivers in drivers/*, the name should be easy to remember and
the function should be abstracted.

> > > This is wrong. Symbios SCSI, ATM, and Gigabit Ethernet Drivers could
> > > all *directly* use this service. All of those devices are capable of
> > > mastering a "Message Signalled Interrupt" instead of yanking an IRQ line.
> > 
> > And why would the driver be concerned with it?

I was under the impression you used "Message Signalled Interrupt" to refer
to a standards-compliant mechanism.  Sorry.

> > I am not sure how PCI
> > TBIs work, but the way I would hope it works is the PCI bus initialization
> > code assigns address/data pairs to those devices that support TBIs and
> > puts the corresponding irq into the pci_dev structure.  That way, we're
> > down to one line of code that calls txn_alloc_irq.
> 
> I know how they work. 

> You need to do more homework before "hoping" much.

Erm, and how exactly would you go about it ?  I don't have the PCI standard,
I am paying for downloading hardware docs, the one I did look at (Acenic)
doesn't support TBIs.

What I hoped was the PCI designers made TBIs a standard feature which would
make it usable - they didn't, so far, so we're talking about device-specific
hacks here.

> And pci_dev structure only has room for the virtual IRQ. That may change
> for PCI 2.2 but I want to support PCI 2.1 compliant devices as well.

How many are there, really, and is it really worth it for all of them ?

> More importantly, not all PCI devices discovered can or will want
> to directly master their own interrupt transaction.  I.e. assigning
> CPU/EIR bits to every serial port card is a waste of resources.

This can be worked around with modules and reconfiguration.  Anyway let's
first run out of IRQs and then look at how we can avoid it.

> > For those PCI devices that don't use the standard configuration mechanism
> > to do TBIs, if they should turn out to be worth it, you would have to do
> > stuff in the actual device driver, but I don't think there are many devices
> > to which this applies.

> There is no "standard configuration mechanism" for TBI's.
> Not until PCI 2.2 becomes more prevalent. SCSI, ATM, and GiGE
> PCI devices I'm aware are only PCI 2.1 compliant today.

So all we can do today is brute hacks.

> You have it backwards: the PCI device driver needs to query the
> platform if it supports TXN services and then program the HW accordingly.

So it really doesn't fit into any decent bus scheme.  I think an important
point about well-designed busses is resource allocation isn't handled by
the device driver but by the bus driver.  I hope PCI will allow the way
interrupts are delivered to be changed as transparently to the device
driver as right now the IRQ number is.

> PCI 2.2 only defines how the driver can communicate the devices ability
> to master "Message Signalled Interrupts". It doesn't (and shouldn't) say
> anything about how the OS interrupt support interacts with the device
> driver.

The "doesn't" part I don't know about, and we'll see whether the PCI designers
were indeed stupid enough to require the device driver to handle resource
allocation.

The "shouldn't" part I disagree with.

> > The public Linux/PA-RISC tree is PA1.1 only right now, and I dare say we

PA 2.0 in narrow mode as well.  We don't have more than 32 usable EIMs
for that case though.

> > don't care about systems with more than 31 IRQ-generating devices.
> 
> Alex: Can you address this?
> 
> I can't speak for The Puffin Group. But inside HP, I, and the people
> who pay my salary are very interested in PA 2.0 boxes which can have
> more than 31 IRQs.

We're not talking about boxes that have hardware support for > 32 IRQs.

We're talking about boxes which actually _have to use_ more than 32 EIR
bits.  For example, the A class uses 3 EIR bits in the configuration I
have here (Lasi, Dino, Interval Timer).  The 712 might use 2 or 3 (I
am not sure whether ARTIST generates IRQs).  The 715 uses 2 or 3 (I
don't know about the graphics).

According to HP's product brochure, the V2500 supports 24 PCI I/O cards,
which would leave 6 (we need one for IPIs and one for the interval timer)
EIR bits for internal devices.

Which boxes are _you_ talking about ?

> Most people first ask does parisc-linux run on
> <something-with-PA20>-class. So despite the official charter,
> PA 2.0 is happening on/with the same tree because of interest.

Note, again, that restricting ourselves to 32 EIR bits does not mean we won't
support boxes that supply 64 EIR bits in hardware.

> > I don't know about the IA64 tree and any non-public Linux/PA-RISC trees,
> > but it was my impression those have their own mailing-lists and changes
> > to them need not be discussed here.
> I disgree.  This is an inclusive forum. If people want to work
> on support an 827s or T600s, they are welcome to do it. It's my
> choice to decline to help (and I definitely will not help). 

Sure.  If people want to support an actually existing machine that needs to
use more than 31 EIR bits, they are welcome.

> > > The current interface only works for a subset of all parisc platforms.
> > Yeah, the subset with <= 31 devices.
> I'm trying to get past that limitation.

Is it a limitation ?  Are there actually machines out there which need more
than 31 EIR bits ?  Do these machines look at all like it is high-priority
to support them under linux/parisc ?

> > How ?
> > 
> > All the allocation is handled in txn_alloc_irq - it returns a virtual irq
> > that can be resolved to an address/data pair lateron.  If we want to allocate
> > data (eg the eim bit index right now), it's done in txn_alloc_irq.  If we
> > want to allocate addresses (eg the future txn_alloc_irq returning the right
> > CPU's EIR), we do it in txn_alloc_irq.
> 
> Here's an example: Change the interface to allow the driver to call
> txn_alloc_addr() to get a *different* CPU - same virtual IRQ.  And
> ditto for txn_alloc_data(). Then txn_alloc_irq() would only
> be used to hand out "handles" (ie Virtual IRQs).

That example just doesn't make sense to me.  If the driver wants to
switch to another IRQ, it has to call txn_alloc_irq() anyway - you
can't assume the implementation lets you keep a virtual IRQ (which
very well might not be virtual at all, but the actual HW IRQ) even
though you reallocate the address/data.

I still can't think of any situation in which it would make sense to
do call only one or two of the txn_alloc_* functions.

As for actually doing allocating in txn_alloc_{data,addr}, that would
require drivers to get even more complex in their initialization as
they now need to handle txn_alloc_addr failing and txn_alloc_irq
succeeding.

Is there a single case where it would make sense for an implementation
to do allocation in txn_alloc_{data,addr} ?

Also, consider the case where you want to get an IRQ on a certain CPU.
Do you want to pass the CPU number to _all_ of the txn_alloc_* functions ?

If so, why ?

> Why would a driver want to do that? Because some outside module
> is smarter, knows more about the resources available, and told the
> device driver to make the request and reprogram it's HW.

It can change its virtual irq as well, and actually has to be to be
independent of implementation details.

> > Actually, what you should think about is merging the three functions -
> > virtual irq, transaction address and transaction data don't make sense on
> > their own, so you almost always end up doing
> > 
> > 	tmp1 = txn_alloc_irq(...);
> > 	tmp2 = txn_alloc_addr(irq);
> > 	tmp3 = txn_alloc_data(irq);
> > 
> > which seems unnecessarily verbose.
> 
> See above example.

You would still need to call all functions.

> IMHO, the three functions interface is more flexible and matches

It isn't.  If you change anything about your IRQ, you have to call
all three functions again (as an implementation _might_ be like the
current implementation which doesn't have arbitrary virtual IRQ <->
physical IRQ relations).

	Philipp
