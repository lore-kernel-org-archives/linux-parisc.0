Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA10532
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 10:46:51 -0700
Message-Id: <200011281749.JAA26808@milano.cup.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: Puffin Group <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Mouse driver for PS/2 
In-reply-to: Your message of "Tue, 28 Nov 2000 16:07:04 PST."
             <3A23CA18.1171E884@esiee.fr>
Date: Tue, 28 Nov 2000 09:49:26 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteau wrote:
> Hi all,
> 
> 	We appreciate if someone can explain where we can find request_irq and
> request_region in hp_psaux.c and also, what are they doing?

include/linux/sched.h:extern int request_irq(unsigned int, ...)
(Implementation is in arch/parisc/kernel/irq.c)

The request_irq() "allocates" an IRQ line for use by the device - this
program the PIC (or APIC) on x86 platforms. request_irq() is also how
an interrupt handler is associated with a specific IRQ line. Since
PA Risc CPU's don't have IRQ lines going into them, IRQ's are virtualized
and don't always represent a physical IRQ line.

Under LASI, see gsc_alloc_irq(&gsc_irq) usage in drivers/gsc/lasi.c.
lasi_find_irq() helps associate the PS/2 interrupt handler with
the correct IRQ line which is internal to lasi.


include/linux/ioport.h:#define request_region(start,n,name) ...

request_region() will reserve a range of I/O port address from the
global I/O space. request_mem_region() does the same for MMIO.
Drivers that use inb/outb (as defined in include/asm-parisc/io.h)
must use request_region(). Drivers that use gsc_readb/gsc_writeb
(as defined in include/asm-parisc/gsc.h) must use request_mem_region().

Collisions are probably occuring where a driver originally used inb/outb
and those were redefined to use gsc_readb/writeb functions. But the
driver is still using request_region().


And it doesn't help that I may have broken some of the resource mgt
with some code I committed last night. It worked on my boxes (A180/C3K)
but broke on other folks. Paul Bame helped find/fix one bug but
I shouldn't be surprised if more bugs are still out there.
I will be fixing some known resource failure problems on A500.
Please post problems on other platforms to parisc-linux list as well.

hope this helps,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
