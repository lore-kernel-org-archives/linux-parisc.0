Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC63C482A
	for <parisc-linux@parisc-linux.org>; Thu, 11 Oct 2001 05:23:07 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7F704B00C; Thu, 11 Oct 2001 12:23:51 +0100 (BST)
Date: Thu, 11 Oct 2001 12:23:51 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011011122351.L11105@linuxcare.com>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011010134526.F11105@linuxcare.com> <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk> <20011011024010.C13932@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011011024010.C13932@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Oct 11, 2001 at 02:40:10AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 11, 2001 at 02:40:10AM +0100, Matthew Wilcox wrote:
> Turns out it's unsufferably ugly to do this right now, due to Mongoose
> being a _sibling_ of Asp, not a _child_.  So I've put a nasty patch at
> ftp://puffin.external.hp.com/pub/parisc/src/eisa-irq.c which works enough
> that it seems to claim the IRQs; but the hp100 driver just allocates
> IRQ3 and doesn't allow any kind of fixup, so I haven't actually tested it.


asp_find_irq() wants changing:

-               case 0x76:      irq = 21; break; /* Centronics */
+               case 0x76:      irq = 17; break; /* EISA BA */

and needs a default case to avoid returning random irq values.

and you probably want something like this in eisa_probe():

        eisa_dev.region->action = kmalloc(sizeof(struct irqaction) * 32, GFP_ATOMIC);
        memset(eisa_dev.region->action, 0, sizeof(struct irqaction) * 32);

I'm sure '32' is wrong, but at least you need some range checking on
irq in eisa_irq() before using it to index in to the action array.

Now I get one EISA irq immediately that request_irq(irq, eisa_irq, 0, name, NULL)
is called, at which point the above allocation hasn't yet happened ==> bang.
Incidently, eisa_irq() reports "EISA irq 167" for that event so using irq
as a simple index into action[] is probably wrong.

I don't get any further eisa_irq() calls once my scsi card gerneates an
interrupt, but for all I know I may have to poke some registers in the
card before it allows interrupts out.

Richard
