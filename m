Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA15182
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 23:57:05 -0700
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id BAA12334
	for <parisc-linux@thepuffingroup.com>; Thu, 9 Dec 1999 01:58:08 -0500 (EST)
Message-Id: <199912090700.XAA03556@milano.cup.hp.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] txn_alloc_irq() change 
In-reply-to: Your message of "Thu, 09 Dec 1999 05:50:39 PST."
             <19991209055039.E21512@mathe.stud.uni-erlangen.de>
Date: Wed, 08 Dec 1999 23:00:08 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > For munging the return values on specific busses, I agree. By that,
> > I mean gsc_alloc_irq() is a useful interface for GSC devices which
> > program their EIM register. This service is NOT bus specific.
> 
> Yes, it is.  Whether you can even reach the CPU's EIR register from a
> certain bus is bus-specific.  Which EIR you want to use if you have the
> choice is bus-specific.  The address of the EIR, if you can reach
> it, is bus-specific (as you have a TLB between your system bus and the
> I/O bus(ses) on most PA2.0 systems, right ?).  The length of the data
> word you can send is bus-specific (5 bits for GSC, 6 bits for 64-bit
> PA busses).

Philipp,
The *service* is not bus specific. The details (ie parameters) are.
Please seperate interfaces from implementations.
You claimed early on you would do that.

> > I'm open for suggestions on the name.
> 
> If you want to export txn_alloc_irq to PCI drivers, ask the guys who will
> actually have to use it - i.e. the driver authors for devices you want to
> use transaction interrupts and the PCI maintainers for architectures that
> support transaction interrupts (IA64 and PA-RISC ?).

Ok. I need to lookup and contact NCR/Symbios SCSI, ATM, and GigE
driver authors and pester them one this topic.
Won't happen until next year. I'll do it then.

If someone knows the right people to ask, please just "cc"
me in the conversion for now...

I've already spoken at length with David Mossberger (IA64) about this
and he basically doesn't care right now. He finds the topic interesting
but HP isn't funding him to do any work which mostly benefits servers.
Though txn_xxx services help PA-Risc workstations too, IA64 has some
interesting interrupt HW support which kluges around the need for MSI
on configurations with less than about 4 CPUs.  But neither David nor
I fully understand how IA64-linux supports this HW.

(I do know how HP-UX supports the same platform though.)

> If you want to keep the function parisc-specific and not exported to drivers
> (just to the bus-specific wrappers), it could be called "cca1a78e0" without
> anyone getting too upset about it.

Really?
As Alex would say: "I don't believe you".

> > > So this doesn't even affect "well-written" drivers.
> > This is wrong. Symbios SCSI, ATM, and Gigabit Ethernet Drivers could
> > all *directly* use this service. All of those devices are capable of
> > mastering a "Message Signalled Interrupt" instead of yanking an IRQ line.
> 
> And why would the driver be concerned with it?

Latency and CPU utilization. The former directly affect response times
and the latter throughput.  Using this service on PA-Risc will remove one
level of function calls from the interrupt code path on PCI subsystems.

> I am not sure how PCI
> TBIs work, but the way I would hope it works is the PCI bus initialization
> code assigns address/data pairs to those devices that support TBIs and
> puts the corresponding irq into the pci_dev structure.  That way, we're
> down to one line of code that calls txn_alloc_irq.

I know how they work.  You need to do more homework before "hoping" much.
And pci_dev structure only has room for the virtual IRQ. That may change
for PCI 2.2 but I want to support PCI 2.1 compliant devices as well.

More importantly, not all PCI devices discovered can or will want
to directly master their own interrupt transaction.  I.e. assigning
CPU/EIR bits to every serial port card is a waste of resources.

> For those PCI devices that don't use the standard configuration mechanism
> to do TBIs, if they should turn out to be worth it, you would have to do
> stuff in the actual device driver, but I don't think there are many devices
> to which this applies.

There is no "standard configuration mechanism" for TBI's.
Not until PCI 2.2 becomes more prevalent. SCSI, ATM, and GiGE
PCI devices I'm aware are only PCI 2.1 compliant today.

> 
> > It's a chicken and egg problem though: since no service exists for them
> > on PC's, the drivers aren't written to use it. With IA64 and PA-risc
> 
> If you need to let the driver know which mechanism is used at the hardware
> level to deliver interrupts, that's a flaw of the PCI spec (and would make
> TBIs a lot less usable than IRQ line PCI interrupts). 

You have it backwards: the PCI device driver needs to query the
platform if it supports TXN services and then program the HW accordingly.
Drivers do this all the time to determine capabilities of devices.
If the platform doesn't support MSI, txn_alloc_irq() (with appropriate
parameters) will return an error to indicate it either can't or the
resource (virtual IRQ) isn't available.

Drivers can assume line based interrupts are supported by default
since those are architected in PCI 2.1.

PCI 2.2 only defines how the driver can communicate the devices ability
to master "Message Signalled Interrupts". It doesn't (and shouldn't) say
anything about how the OS interrupt support interacts with the device
driver.

> 
> > > Changing txn_alloc_irq isn't exactly high-priority as all systems that
> > > use <= 31 interrupt-generating devices (which I guess are the systems
> > > we're currently working with) should work just fine right now.
> > 
> > Your priorities don't match mine. I'm getting paid to work on stuff
> > which only runs under PA2.0.
> 
> The public Linux/PA-RISC tree is PA1.1 only right now, and I dare say we
> don't care about systems with more than 31 IRQ-generating devices.

Alex: Can you address this?

I can't speak for The Puffin Group. But inside HP, I, and the people
who pay my salary are very interested in PA 2.0 boxes which can have
more than 31 IRQs. Most people first ask does parisc-linux run on
<something-with-PA20>-class. So despite the official charter,
PA 2.0 is happening on/with the same tree because of interest.
C-class is the first stepping stone in that direction.

> I don't know about the IA64 tree and any non-public Linux/PA-RISC trees,
> but it was my impression those have their own mailing-lists and changes
> to them need not be discussed here.

I disgree.  This is an inclusive forum. If people want to work
on support an 827s or T600s, they are welcome to do it. It's my
choice to decline to help (and I definitely will not help). 

I don't know about the IA64 tree either. In fact, I'm legally not
allowed to look at it *because* I'm working on parisc-linux.
(kinda sucks in fact...but oh well...)

I'm not aware of any other non-public PA-Risc tree's.
I'm working on the same CVS tree as everyone else.

> > The current interface only works for a subset of all parisc platforms.
> 
> Yeah, the subset with <= 31 devices.

I'm trying to get past that limitation.
If you don't want to help, don't reply or just say you don't want to help.
I'm not offended by that.

> 
> > > txn_alloc_{addr,data} are confusing names as those functions don't actual
>   ly
> > > allocate anything.
> > 
> > They don't currently allocate anything but future implementations could.
> 
> How ?
> 
> All the allocation is handled in txn_alloc_irq - it returns a virtual irq
> that can be resolved to an address/data pair lateron.  If we want to allocate
> data (eg the eim bit index right now), it's done in txn_alloc_irq.  If we
> want to allocate addresses (eg the future txn_alloc_irq returning the right
> CPU's EIR), we do it in txn_alloc_irq.

Here's an example: Change the interface to allow the driver to call
txn_alloc_addr() to get a *different* CPU - same virtual IRQ.  And
ditto for txn_alloc_data(). Then txn_alloc_irq() would only
be used to hand out "handles" (ie Virtual IRQs).

Why would a driver want to do that? Because some outside module
is smarter, knows more about the resources available, and told the
device driver to make the request and reprogram it's HW.
My dream is to manage interrupt "load" similar to the way process
and threads are managed. In fact, the two should know about each
other and they don't.

> > The IRQ is a *virtual* IRQ (prumpf knows that; I don't have to tell him).
> > The address and data associated with that IRQ can be any CPU and any EIR
> > bit for a given CPU.
> > 
> > Secondly, the names match with txn_alloc_irq() and that makes it easier
> > to remember. I'm open to changing the names for all three functions.
> 
> Actually, what you should think about is merging the three functions -
> virtual irq, transaction address and transaction data don't make sense on
> their own, so you almost always end up doing
> 
> 	tmp1 = txn_alloc_irq(...);
> 	tmp2 = txn_alloc_addr(irq);
> 	tmp3 = txn_alloc_data(irq);
> 
> which seems unnecessarily verbose.

See above example.
IMHO, the three functions interface is more flexible and matches
the potential uses better.

thanks again,
grant

ps. I'm going to be out of the office until end of the month....bummer
the mail server was out for a bit...happy holidays and happy New Year!

> 
> 	Philipp Rumpf
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Developement Lab
+1.408.447.7253
