Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA18680
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 09:14:56 -0600
Date: Thu, 26 Aug 1999 17:16:34 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c
Message-ID: <19990826171634.J19314@suse.de>
References: <37C432D3.C9BC0D7F@thepuffingroup.com> <199908260049.RAA11578@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199908260049.RAA11578@milano.cup.hp.com>; from Grant Grundler on Wed, Aug 25, 1999 at 05:49:54PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> linux/arch/parisc/kernel/irq.c:irq_alloc()/request_irq() seems to be
> the method to allocate EIRR bits 

alloc_irq is just a quick hack to try to avoid sharing interrupt handlers
if possible.  It returns the next unused IRQ but isn't atomic right now.

> and register ISRs with PA ext_intr
> handler. Dino will call this to initialize it's own EIM register (IAR0).
> But to program IAR0 Dino also needs the processor HPA of whatever
> processor it is supposed to interrupt.

Not exactly right.  You can just use the broadcast EIR address (which might
be GSC-specific but we don't have docs on other hardware yet).

I am not sure how GSC devices will be managed, but if we just chose to be lame
and do it like PCI, there will be a list of GSC devices and the Dino driver
just can do gsc_writel(0xfffe0000+dev->irq, dev->hpa + DINO_IAR0);

> (BTW - anyone else modifying gecko/dino.c?)

I think I am pretty synched right now.  The GSC handling is not in place yet so
perhaps you should hardwire everything until it is.

> Support for PCI 2.2 Message Signalled Interrupts requires
> a similar interface - Dino can support this if the interface
> were present and PCI drivers wanted to use it.

I have no idea what that is.  I don't think it is in the Dino docs I have either
so I am afraid I cannot say anything about it.

> o Do GBD or other psuedo drivers need to reserve EIRR bits?
>   Ie soft interrupts to reschedule work at lower SPL levels.

I don't think so.

> o PA2.0 architecture defines EIRR to be 64-bits wide.
>   irq_alloc() and request_irq() hard code 31.
>   Using a #define with "ifdef" around it for 32/64 bit
>   differences would be better. Just trying to make the
>   transition that direction easier.

Dino at least does not support 6-bit interrupt code according to our
documentation.

> o Each processor can have it's own EIRR switch table.
>   Thus, "irq_action[]" could be an an array hanging off a per processor
>   data structure. This is interesting for large configurations where
>   the 31 bits aren't enough and sharing isn't supported.

I don't want to try things before they get tested by other architectures first
unless necessary.  I don't think per-processor irq_actions are a way to go, but
we can have another look at it when it's time to.


> o EIRR bits can be shared just like IRQ lines. A wrapper gets
>   put into the irq_action[] field when sharing is required
>   (eg run out of EIRR bits to hand out). The wrapper function

Once again, not yet.  There is no way I want to know of to run out of EIRR bits
on 712, 715 or A180s, so I'd like to get us up and running on those first.

	Philipp Rumpf
