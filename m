Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maila.telia.com (maila.telia.com [194.22.194.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 857794A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 16:41:52 -0700 (MST)
Message-Id: <200102192341.AAA04190@zaphod.halden.lillfab.se>
Date: Tue, 20 Feb 2001 00:41:32 +0100 (CET)
From: 5116@telia.com
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int
  errupts?)
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200102190026.QAA15382@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 18 Feb, Grant Grundler wrote:
> 5116@telia.com wrote:
>> On 18 Feb, Grant Grundler wrote:
>> > That's not true. The "virtualized" bus numbers I think are confusing you.
>> > Treat the addresses as "handles" to the address space and the EISA bus
>> > support can strip off the bus number to get the real I/O Port address.
>> Yes, but ISA drivers vill expect that 0x300 is 0x300 ant not 0x20300.
> 
> What you are telling me is the ISA drivers poke around using hardcoded
> addresses they "know" about. My proposal is still useful but WAX/EISA
> needs to reserve HBA 0.
Yes, most ISA devices have a probe list which the use when they are
compiled in, and if I use modules or a kernel command line option I 
want to be able to say io=0x388 when I have set the jumppers on the card
for that address.
 
>> PCI drivers all get their port addresses from probing the bus so they
>> will 'just work'.
> 
> The physical PCI Port addresses are virtualized by the linux PCI
> "BIOS" layer. PCI Drivers don't go poking around on the bus on their own.

That's what I meant. 
> ...
>> Yes, I had some idea in this direction to, are we sure this belongs in
>> the PCI layer? It might be thought of as an IO switch above the
>> PCI/EISA/what-ever as well.
> 
> inb/outb is a "PCI-like" layer.  inb/outb happens to be implemented in
> "PCI" code (pci.h) since that worked first.  If you have an idea of
> where inb/outb switch ought to "live", I'm curious.
A fast check gives that most architectures defines inb/outb as either a
#define or inline function in asm/io.h. SH have an implementation in
arch/kernel/io.c. I think that if only support for one type of BA is
compile then we might use an inline function with a fall back to a
switch routine for the case with support for more than one BA.


>> Well the i386 version is that disable_irq() waits until all pending
>> interrupts on the local processor have been serviced while
>> disable_irq_nosync() returns immediately. The parisc version of
>> disable_irq() seems to be what disable_irq_nosync() is on the i386. 
> 
> Uhm. I still don't see the distinction.
> "nosync" suggests an interaction with other CPU's?
> 
> A CPU will *always* service IRQ's before the CPU continues with
> "regular" code.  disable_irq() guarantees no *new* interrupts
> will occur until enable_irq() is called. I don't totally understand
> the CONFIG_SMP version of that code though.

Well, yes I would expect that if you run with interrupts disabled it
may be an interrupt pending? And the sync would be there in order for
the disable event to propagate trough the interrupt controller hardware
or something similar (you may just have de-installed the interrupt
handler). 
This may or may not apply to parisc hardware, if it does not then both
versions of disable_irq() should be equal, I guess.

/Daniel

-- 
