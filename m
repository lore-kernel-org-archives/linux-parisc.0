Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA03683
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 19:03:17 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id DBA8BC0A
	for <parisc-linux@thepuffingroup.com>; Tue, 23 Jan 2001 18:07:09 -0800 (PST)
Message-Id: <200101240209.SAA20445@milano.cup.hp.com>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Tulip bug "resolution" 
In-reply-to: Your message of "Tue, 23 Jan 2001 17:22:08 PST."
             <E14LDhQ-0002Uc-00@noam.fc.hp.com>
Date: Tue, 23 Jan 2001 18:08:52 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> Some may remember I put a hack in drivers/net/tulip/interrupt.c to
> avoid a null pointer deref caused by a data structure being referenced
> before being allocated.  I've only seen this on B180 I think.
...
> Maybe this bug has magically disappeared but I bet not.

I suspect it's really fixed.
Here are some thoughts on tulip and IRQ initialization.

In tulip_open():
	o calls request_irq(... &tulip_interrupt, ...)
	o call tulip_init_ring() - sets tp->rx_buffers[].skb to null
	  before allocating them.
	  ...

If a pending IRQ is waiting in Dino, the handler will get called when
the IRQ is enabled by request_irq().  This is potentially a bug in
the Dino IRQ handling...so I looked and saw:

	/* Emulate "Level Triggered" Interrupt
	** Basically, a driver is blowing it if the IRQ line is asserted
	** while the IRQ is disabled.  But tulip.c seems to do that....
	** Give 'em a kluge award and a nice round of applause!
	**
	** The gsc_write will generate an interrupt which invokes dino_isr().
	** dino_isr() will read IPR and find nothing. But then catch this
	** when it also checks ILR.
	*/

But note that tulip.c no longer exists. Tulip has been restructured
into multiple files under drivers/net/tulip/.  The thing to do is
reproduce this problem with current bits.  If it doesn't happen, then
the initialization code in tulip *was* fixed and we should remove the
comment in drivers/gsc/dino.c as well.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
