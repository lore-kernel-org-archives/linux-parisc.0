Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 203DE4A05
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 11:40:14 -0600 (MDT)
Message-Id: <200110101736.LAA19917@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Wed, 10 Oct 2001 15:28:07 BST." <20011010152807.C24923@parcelfarce.linux.theplanet.co.uk>
Date: Wed, 10 Oct 2001 11:36:17 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Instead of generating a PCI/EISA interrupt, generate a write of an
> allocated value to the CPU's EIRR (External Interrupt register).

Correct. That's what txn_alloc_irq() is for.
That interface needs to change slightly if someone really wants to start
using it on a broad range of platforms and busses. FWIW, this could
work on any platform which a "local SAPIC" (ie IA64).

> This way, the CPU jumps straight to the scsi chip's interrupt handler
> rather than Asp's, which then has to decode which Asp IRQ it was;
> then jump to the EISA interrupt handler, decode which EISA IRQ it was,
> finally calling the scsi interrupt handler.

excalty - this also cuts out a bunch of IO space reads (and possibly writes).

> We might need to work out some other infrastructure to handle this,
> but it's something we should look into at some point.  Clearly I need
> to get EISA interrupts working anyway :-)

I think all the needed functions are in place already.

grant
