Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 319EE4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 11:11:53 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VGeB-0003Pd-00; Tue, 20 Feb 2001 10:32:19 -0700
Date: Tue, 20 Feb 2001 10:32:19 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: 5116@telia.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?)
Message-ID: <20010220103219.B31164@parcelfarce.linux.theplanet.co.uk>
References: <200102192341.AAA04190@zaphod.halden.lillfab.se> <200102201725.JAA16361@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102201725.JAA16361@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Feb 20, 2001 at 09:24:58AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 20, 2001 at 09:24:58AM -0800, Grant Grundler wrote:
> Well, I still don't see what nosync does on a single CPU system.

Nothing.  Look at the x86 code:

void disable_irq(unsigned int irq)
{
        disable_irq_nosync(irq);

        if (!local_irq_count(smp_processor_id())) {
                do {
                        barrier();
                } while (irq_desc[irq].status & IRQ_INPROGRESS);
        }
}

if you're in an irq on a UP machine, then local_irq_count will be >0,
so it'll do nothing.  if you're not in an irq, then IRQ_INPROGRESS
can't possibly be set.

-- 
Revolutions do not require corporate support.
