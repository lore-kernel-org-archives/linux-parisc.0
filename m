Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD61349A3
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 19:40:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rUpW-0003RZ-00; Thu, 11 Oct 2001 02:40:10 +0100
Date: Thu, 11 Oct 2001 02:40:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Message-ID: <20011011024010.C13932@parcelfarce.linux.theplanet.co.uk>
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011010134526.F11105@linuxcare.com> <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 10, 2001 at 03:28:07PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 10, 2001 at 03:28:07PM +0100, Matthew Wilcox wrote:
> I haven't written that code yet.  Basically, I need to allocate a new IRQ
> region for EISA interrupts, then on receipt of Asp irq 21 read the EISA
> interrupt number from 0xfc01f000.  It seems there may be some extra gunk
> needed to handle the TI chipset, but I'll have a go at getting interrupts
> to work later today.

Turns out it's unsufferably ugly to do this right now, due to Mongoose
being a _sibling_ of Asp, not a _child_.  So I've put a nasty patch at
ftp://puffin.external.hp.com/pub/parisc/src/eisa-irq.c which works enough
that it seems to claim the IRQs; but the hp100 driver just allocates
IRQ3 and doesn't allow any kind of fixup, so I haven't actually tested it.

I have a plan to allocate Mongoose's IRQ in a nicer way, but that will
have to wait until tomorrow.  What do you think the best way would be
to fix EISA card IRQs?  I have a couple of thoughts:

 * Introduce a new EISA_IRQ_BASE macro that most architectures
   define to 0.
 * Reserve IRQ region 0 for EISA

Any better ideas?

-- 
Revolutions do not require corporate support.
