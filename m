Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A3994A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 11:17:40 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VGwS-0003jK-00; Tue, 20 Feb 2001 10:51:12 -0700
Date: Tue, 20 Feb 2001 10:51:12 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?)
Message-ID: <20010220105112.C31164@parcelfarce.linux.theplanet.co.uk>
References: <20010220002636.R899@parcelfarce.linux.theplanet.co.uk> <200102201745.JAA16411@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102201745.JAA16411@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Feb 20, 2001 at 09:44:55AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 20, 2001 at 09:44:55AM -0800, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > i386 sets IRQ_INPROGRESS before it calls handle_IRQ_event and then
> > clears it after the interrupt handler returns.  I'm not sure whether
> > local interrupts are disabled at this point or not.  It might well be
> > an SMP issue.
> > 
> > I suspect we want to add IRQ_INPROGRESS to our interrupt handlers.
> 
> I think irqs_running() serves that purpose. no?

No.  irqs_running() tells us whether any irqs are in progress.  You have
to grab the global_irq_lock before you call it.  IRQ_INPROGRESS tells us
whether we're in the middle of servicing this particular interrupt.

-- 
Revolutions do not require corporate support.
