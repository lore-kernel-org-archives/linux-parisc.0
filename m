Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 990C24A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 10:42:12 -0700 (MST)
Message-Id: <200102201745.JAA16411@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?) 
In-reply-to: Your message of "Tue, 20 Feb 2001 00:26:36 PST."
             <20010220002636.R899@parcelfarce.linux.theplanet.co.uk>
Date: Tue, 20 Feb 2001 09:44:55 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> i386 sets IRQ_INPROGRESS before it calls handle_IRQ_event and then
> clears it after the interrupt handler returns.  I'm not sure whether
> local interrupts are disabled at this point or not.  It might well be
> an SMP issue.
> 
> I suspect we want to add IRQ_INPROGRESS to our interrupt handlers.

I think irqs_running() serves that purpose. no?

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
