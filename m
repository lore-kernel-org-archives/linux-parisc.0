Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id A305C4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 10:22:13 -0700 (MST)
Message-Id: <200102201725.JAA16361@milano.cup.hp.com>
To: 5116@telia.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?) 
In-reply-to: Your message of "Tue, 20 Feb 2001 00:41:32 PST."
             <200102192341.AAA04190@zaphod.halden.lillfab.se>
Date: Tue, 20 Feb 2001 09:24:58 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> Yes, most ISA devices have a probe list which the use when they are
> compiled in, and if I use modules or a kernel command line option I 
> want to be able to say io=0x388 when I have set the jumppers on the card
> for that address.

The probe list is the problem. We can fixup th command line before
the driver sees it.

> > inb/outb is a "PCI-like" layer.  inb/outb happens to be implemented in
> > "PCI" code (pci.h) since that worked first.  If you have an idea of
> > where inb/outb switch ought to "live", I'm curious.
> A fast check gives that most architectures defines inb/outb as either a
> #define or inline function in asm/io.h.

We could do the inline function routine with a switch statement
but I've concluded a "switch()" statement isn't the right choice.
I think that's a bad tradeoff: minor perf gain for major bloat.
Of course, I'd be happy to see someone prove my SWAG wrong. :^)

> SH have an implementation in
> arch/kernel/io.c. I think that if only support for one type of BA is
> compile then we might use an inline function with a fall back to a
> switch routine for the case with support for more than one BA.

The code isn't currently structured to allow only one type of bus support.
HPUX supports three different PCI bus adapters, two EISA adapters,
GSC, HPPB, and VME busses. I/O port space accesses is definitely not
in the performance path. high performance drivers use MMIO space
and avoid reading from I/O space in general.

> Well, yes I would expect that if you run with interrupts disabled it
> may be an interrupt pending?

If you want to preserve pending interrupts, use mask_irq()/unmask_irq().

> And the sync would be there in order for
> the disable event to propagate trough the interrupt controller hardware
> or something similar (you may just have de-installed the interrupt
> handler). 
> This may or may not apply to parisc hardware, if it does not then both
> versions of disable_irq() should be equal, I guess.

Well, I still don't see what nosync does on a single CPU system.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
