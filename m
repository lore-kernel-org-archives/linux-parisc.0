Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DD4D4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 17:53:18 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14V0dY-0004vN-00; Tue, 20 Feb 2001 00:26:36 +0000
Date: Tue, 20 Feb 2001 00:26:36 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: 5116@telia.com
Cc: Grant Grundler <grundler@cup.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?)
Message-ID: <20010220002636.R899@parcelfarce.linux.theplanet.co.uk>
References: <200102190026.QAA15382@milano.cup.hp.com> <200102192341.AAA04190@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102192341.AAA04190@zaphod.halden.lillfab.se>; from 5116@telia.com on Tue, Feb 20, 2001 at 12:41:32AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 20, 2001 at 12:41:32AM +0100, 5116@telia.com wrote:
> >> Well the i386 version is that disable_irq() waits until all pending
> >> interrupts on the local processor have been serviced while
> >> disable_irq_nosync() returns immediately. The parisc version of
> >> disable_irq() seems to be what disable_irq_nosync() is on the i386. 
> > 
> > Uhm. I still don't see the distinction.
> > "nosync" suggests an interaction with other CPU's?

i386 sets IRQ_INPROGRESS before it calls handle_IRQ_event and then
clears it after the interrupt handler returns.  I'm not sure whether
local interrupts are disabled at this point or not.  It might well be
an SMP issue.

I suspect we want to add IRQ_INPROGRESS to our interrupt handlers.

-- 
Revolutions do not require corporate support.
