Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA16892
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Aug 1999 20:52:01 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 26 Aug 1999 02:53:41 -0000
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c
To: grundler@cup.hp.com (Grant Grundler)
Date: Thu, 26 Aug 1999 02:16:27 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199908260049.RAA11578@milano.cup.hp.com> from "Grant Grundler" at Aug 25, 99 05:49:54 pm
Content-Type: text
Message-Id: <E11Jo9U-0005JL-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> (BTW - anyone else modifying gecko/dino.c?)

Not just at the moment

> o Do GBD or other psuedo drivers need to reserve EIRR bits?
>   Ie soft interrupts to reschedule work at lower SPL levels.

Linux has no notion of SPL levels at all. The model is

Hardware interrupt. These live in a unified space described by a cookie.
We map the cookie to the irq number on a PC but that is optional. Drivers
only know about irqs as a cookie.

Bottom half handlers. We invoke these on the path out of an irq before
returning to the normal scheduled universe. mark_bh() sets a bh to be run
on the next return. BH's are not run if they are already running - they
are single threaded with respect to each other right now - that may change
to be 'with respect to self' one day.

Interrupts may occur during a bh, we normally dont allow interrupts during
an IRQ handler on the same CPU. 

> o Each processor can have it's own EIRR switch table.
>   Thus, "irq_action[]" could be an an array hanging off a per processor
>   data structure. This is interesting for large configurations where
>   the 31 bits aren't enough and sharing isn't supported.

Ok
