Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 959F84A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 18:20:39 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14V1H4-0005cL-00; Tue, 20 Feb 2001 01:07:26 +0000
Date: Tue, 20 Feb 2001 01:07:26 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: 5116@telia.com, Grant Grundler <grundler@cup.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?)
Message-ID: <20010220010726.S899@parcelfarce.linux.theplanet.co.uk>
References: <200102190026.QAA15382@milano.cup.hp.com> <200102192341.AAA04190@zaphod.halden.lillfab.se> <20010220002636.R899@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010220002636.R899@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Tue, Feb 20, 2001 at 12:26:36AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 20, 2001 at 12:26:36AM +0000, Matthew Wilcox wrote:
> I suspect we want to add IRQ_INPROGRESS to our interrupt handlers.

Now I've looked at it, and noticed the comment:
 * (mostly architecture independent, will move to kernel/irq.c in 2.5.)

I'm pretty certain I need to sit down, grok the differences between it &
our irq.c and make sure our irq.c fits into this scheme.  It might be
worth doing anyway, cos I don't think I'm getting all the interrupts
I should be on SMP.  Eg, the serial console isn't working for input.
I need to track this down properly though...

-- 
Revolutions do not require corporate support.
