Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA22799
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 00:17:40 -0600
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.9.3 (PHNE_18979)/8.8.5tis) with ESMTP id CAA22777
	for <parisc-linux@thepuffingroup.com>; Thu, 28 Oct 1999 02:17:57 -0400 (EDT)
Date: Wed, 27 Oct 1999 23:19:10 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199910280619.XAA05894@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] irq.h definitions and request_irq()
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
Just some nits which seemed to be not so good about our current
implementation of IRQ regions.  I'm really enthusiastic about the
current implementation in general but these are some minor problems.

In the next couple of weeks, I'll take the time to write up how
I think IRQ regions work for parisc-linux.  I think most kernel
folks can understand how IRQs work and how PA Risc is different
from x86.

Some definitions from asm-parisc/irq.h:
o NR_IRQS is defined as 1024	(total number of virtual IRQs)
o NR_IRQ_REGS is 32		(total number of IRQ regions)
o IRQ Regions are defined to have max 256 IRQ's per region.

Problem #1: NR_IRQS is used to build arrays by drivers/char/random.c
  and drivers/char/serial.c.  For parisc, those arrays will be mostly empty.
  Not a good use of memory. The problem is a combination of what I
  see as a poorly written driver (for parisc at least) and our
  implementation of IRQ regions.

Problem #2: (256 * 32) is much greater than 1024.
  If serial.c or random.c uses any virtual IRQ in region 4 or higher,
  they will index into hyperspace.  (Or as I've read recently somewhere:
  "we only rely on a well-defined subset of undefined behaviour".)

  This is a bug . We will see it on any box with more than 1 processor
  and 3 Host PCI bus adapters (chips like Dino).  My A180 has a processor,
  Lasi, and 2 Dino's. That's four regions (0-3). If I had another
  card-mode Dino instead of my add-on PCI 100BT card installed, I'd
  be toast.

Proposal for #1/#2:
  Until serial.c and random.c *are* changed, can we use the following
  definitions in asm-parisc/irq.h?

	#define IRQ_REG_SHIFT	5		/* use 6 for __LP64__ */
	#define IRQ_REG_MASK		((1<<IRQ_REG_SHIFT)-1)
	#define IRQ_FROM_REGION(reg)	((reg)<<IRQ_REG_SHIFT)
	#define IRQ_REGION(irq)		((irq)>>IRQ_REG_SHIFT)
	#define IRQ_OFFSET(irq)		((irq) & IRQ_REG_MASK)

	#define NR_IRQ_REGS	16
	#define NR_IRQS		IRQ_FROM_REGION(NR_IRQ_REGS)

[soapbox on]
I'm not happy about seeing the mechanism to encode/decode virtual
IRQ's in asm-parisc/irq.h. It's visible to and embedded in drivers.
My preference is to hide this in arch/parisc/kernel/irq.c and only
define the two constants drivers know about - NR_IRQ_REGS and NR_IRQS in
the asm/irq.h.
[soapbox off]


Problem #3:
  request_irq() doesn't automatically unmask/enable the IRQ.
  After looking at several other architectures (sparc, x386),
  it seems like request_irq() should call enable_irq().

  That's part of the reason why lasi_barked() isn't getting
  called for the serial driver. The IMR registers needs to
  have serial device's bit cleared in order to enable
  the interrupt line in lasi. "enable_irq()" should result
  in a call to lasi_enable_irq() and that will clear the bit.

  Currently, in CVS, lasi_enable_irq() doesn't exist. And that's
  another problem.  I've written one but want to try it out before
  committing code.  (My quality of code lately has stunk because I
  wasn't able to test the code. I usually can fix my own bugs pretty
  quickly since I know the type of things I typically do wrong.)

thanks,
grant
