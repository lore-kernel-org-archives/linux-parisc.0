Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.linuxcare.com (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0C434A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 08:21:26 -0700 (MST)
Received: by localhost.linuxcare.com (Postfix, from userid 501)
	id BCA8B538; Mon, 19 Feb 2001 11:49:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by localhost.linuxcare.com (Postfix) with ESMTP
	id A98A1ABAE; Mon, 19 Feb 2001 11:49:48 -0800 (PST)
Date: Mon, 19 Feb 2001 11:49:48 -0800 (PST)
From: dkennedy <dkennedy@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: 5116@telia.com, alex@linuxcare.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int
 errupts?)
In-Reply-To: <200102190026.QAA15382@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0102191120150.28002-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

*jump*   I think I'm going to jump into the middle of this one.

I'm going to add my thoughts on the lowlevel x86 stuff and hopefully that
clarifies some stuff (as opposed to add more confusion).  I don't hope to
provide any suggestions.

On Sun, 18 Feb 2001, Grant Grundler wrote:

> 5116@telia.com wrote:
> > Yes, I had some idea in this direction to, are we sure this belongs in
> > the PCI layer? It might be thought of as an IO switch above the
> > PCI/EISA/what-ever as well.
> 
> inb/outb is a "PCI-like" layer.  inb/outb happens to be implemented in
> "PCI" code (pci.h) since that worked first.  If you have an idea of
> where inb/outb switch ought to "live", I'm curious.

In the X86 architecture the IO space and the memory space are logically 
separate.  They are both accessed physically on the same bus but to
access IO space you have to execute an IO instruction.  What this does
physically is set the mem/io pin to indicate that the current bus
request is an IO request.  There are several IO instructions
including: inb, outb, inw, outw (in byte, out byte, in word, out
word).  

So, why have two separate spaces?  Some of the reasons are:
- to be different from Motorola
- to provide a mechanism to add delays for IO while still keeping
  memory fast (relatively speaking).

How does this affect us?  "Back in the day" the ISA bus (and by extension 
the EISA bus) was literally designed by taking the pins out of the X86 
chip and providing a slot mechanism to plug cards into it.  Because of 
that there is no bus controller of any kind anywhere on the bus (unlike 
PCI and all the others).  Software had to pick up the ball with respect 
to ensuring that one device driver does not clobber another.  The ISA 
bus and the other devices on the motherboard are all accessed the same.
Devices are put on the bus at a preset IO address and it is the card
installer's responsibility that there is no overlap in IO address
space and IRQ address space.  Although the ISA bus is now behind the
PCI bus and elsewhere the programming of the ISA bus still hasn't
changed (ya gotta be backward compatible you know!).

Why do we care about ISA?  Well, EISA was designed to support both ISA
and EISA cards (in the same slot) so theoretically someone could want
to put an ISA card into a PA-RISC box.  It would be nice for Linux to
support that.  So, providing virtualized inb, outb, inw, outw for
ISA/EISA is also necessary.

So, what is PCI-like and how does this affect us?  I haven't the
foggiest notion of what PCI-like is.  If someone told me what the
characteristics of PCI-like is then maybe I might be able to talk
about that.

> > Well the i386 version is that disable_irq() waits until all pending
> > interrupts on the local processor have been serviced while
> > disable_irq_nosync() returns immediately. The parisc version of
> > disable_irq() seems to be what disable_irq_nosync() is on the i386. 
> 
> Uhm. I still don't see the distinction.
> "nosync" suggests an interaction with other CPU's?
> 
> A CPU will *always* service IRQ's before the CPU continues with
> "regular" code.  disable_irq() guarantees no *new* interrupts
> will occur until enable_irq() is called. I don't totally understand
> the CONFIG_SMP version of that code though.

Traditionally, on the X86 the interrupt priority and queueing is not done 
on the processor but on an external chip.  There was only one IRQ
line.  After executing every instruction the processor would first check 
to see if interrupts are disabled.  If they aren't it would then check
the IRQ line to see if there is a pending interrupt.  If there is, it
would initiate a interrupt bus sequence to receive the interrupt
number from the external interrupt controller.  It would then dispatch
to the appropriate interrupt service routine with interrupts disabled.

Because of the above sequence disabling interrupts causes all new and
pending interrupts to be disabled.  Also, disabling a specific IRQ is
done on the external interrupt controller and disables all current and
future interrupts on that specific IRQ.

Does any of the above ramblings actually help?

Thanks.

-- 
David Kennedy, Technical Account Manager, Linuxcare, Inc.
613.562.9594 tel, 613.562.9304 fax
dkennedy@linuxcare.com, http://www.linuxcare.com/
Linuxcare.  Putting open source to work.
