Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BCD44A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 17:24:01 -0700 (MST)
Message-Id: <200102190026.QAA15382@milano.cup.hp.com>
To: 5116@telia.com
Cc: alex@linuxcare.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?) 
In-reply-to: Your message of "Mon, 19 Feb 2001 00:02:09 PST."
             <200102182302.AAA30325@zaphod.halden.lillfab.se>
Date: Sun, 18 Feb 2001 16:26:47 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> On 18 Feb, Grant Grundler wrote:
> > That's not true. The "virtualized" bus numbers I think are confusing you.
> > Treat the addresses as "handles" to the address space and the EISA bus
> > support can strip off the bus number to get the real I/O Port address.
> Yes, but ISA drivers vill expect that 0x300 is 0x300 ant not 0x20300.

What you are telling me is the ISA drivers poke around using hardcoded
addresses they "know" about. My proposal is still useful but WAX/EISA
needs to reserve HBA 0.

> PCI drivers all get their port addresses from probing the bus so they
> will 'just work'.

The physical PCI Port addresses are virtualized by the linux PCI
"BIOS" layer. PCI Drivers don't go poking around on the bus on their own.

...
> Yes, I had some idea in this direction to, are we sure this belongs in
> the PCI layer? It might be thought of as an IO switch above the
> PCI/EISA/what-ever as well.

inb/outb is a "PCI-like" layer.  inb/outb happens to be implemented in
"PCI" code (pci.h) since that worked first.  If you have an idea of
where inb/outb switch ought to "live", I'm curious.

> Well the i386 version is that disable_irq() waits until all pending
> interrupts on the local processor have been serviced while
> disable_irq_nosync() returns immediately. The parisc version of
> disable_irq() seems to be what disable_irq_nosync() is on the i386. 

Uhm. I still don't see the distinction.
"nosync" suggests an interaction with other CPU's?

A CPU will *always* service IRQ's before the CPU continues with
"regular" code.  disable_irq() guarantees no *new* interrupts
will occur until enable_irq() is called. I don't totally understand
the CONFIG_SMP version of that code though.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
