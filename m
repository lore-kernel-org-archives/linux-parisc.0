Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13058
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 12:21:11 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 18 Jan 2001 19:24:53 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14JKg0-0000xw-00
	for parisc-linux@thepuffingroup.com; Thu, 18 Jan 2001 19:24:52 +0000
Date: Thu, 18 Jan 2001 19:24:52 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010118192452.E29531@parcelfarce.linux.theplanet.co.uk>
References: <200101181825.LAA11489@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101181825.LAA11489@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Thu, Jan 18, 2001 at 11:25:24AM -0700
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] The Art Of Locking
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 18, 2001 at 11:25:24AM -0700, Grant Grundler wrote:
> Log message:
> First cut of CONFIG_SMP support. Default is disabled and my C3k
> still boots/works that way. With CONFIG_SMP=y, hangs after kswapd
> msg. Willy tells me that's the first place semaphores are used.

I'm reviewing this code for Grant.  He's kindly allowed me to point out 
the flaws publically for the benefit of all.

First, Rusty has written an excellent document on locking in
Documentation/Docbook/kernel-locking.tmpl.  You can turn this into a
pdf with `make pdfdocs' (other formats are also available).

Here's the code grant wrote in irq.c:

spinlock_t irq_lock = SPIN_LOCK_UNLOCKED;  /* protect IRQ regions */
[...]
        for (regnr = 0; regnr < NR_IRQ_REGS; regnr++) {
           spin_lock_irqsave(&irq_lock, flags);
            region = irq_region[regnr];
           if (!region || !region->action) {
               spin_unlock_irqrestore(&irq_lock, flags);
                continue;
           }
[...]
           spin_unlock_irqrestore(&irq_lock, flags);
       }

The first thing is the use of spin_lock_irqsave.  This disables local
interrupts and takes the spinlock.  However, this code can't be called
from interrupt context, and nor can any of the other places which take
this lock.  So there's no need to disable local irqs.  We _are_ messing
with the irq tables at this point (though read-only), but that either means
that we have to do a _global_ interrupt disable (which is bad and slow)
or it was ok anyway.  Since this is read only, I assert that there's no
need to disable local irqs, so we can use the spin_lock() function
instead of spin_lock_irqsave.

Next, the lock is taken and released at each iteration.  Why not take it
outside the loop body?  Well, one reason might be to reduce latency --
if other people are sleeping on that lock, they should be given a chance.
But the other people who use this lock are free_irq and request_irq --
hardly important latency-wise sincethey're almost always called at device
driver initialisation (bootup or module load/unload).

Finally, it's not declared `static', yet it's only used within this file.

-- 
Revolutions do not require corporate support.
