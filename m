Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13730
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 12:53:40 -0700
Message-Id: <200101181959.LAA14539@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] The Art Of Locking 
In-reply-to: Your message of "Thu, 18 Jan 2001 19:24:52 PST."
             <20010118192452.E29531@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 18 Jan 2001 11:59:14 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> I'm reviewing this code for Grant.  He's kindly allowed me to point out 
> the flaws publically for the benefit of all.

yup...overall willy pointed out some good things.
Let me correct a few nits though.

> The first thing is the use of spin_lock_irqsave.  This disables local
> interrupts and takes the spinlock.  However, this code can't be called
> from interrupt context, and nor can any of the other places which take
> this lock.  So there's no need to disable local irqs.

Agreed. I've fixed that and added a test to warn us in case request_irq()
or free_irq() are called from the interrupt context.

> Since this is read only, I assert that there's no
> need to disable local irqs, so we can use the spin_lock() function
> instead of spin_lock_irqsave.

Not quite correct. The lock is needed to protect the read-only traversing
of a linked list. We can leave local interrupts enabled though for
above reasons though.

...
> Finally, it's not declared `static', yet it's only used within this file.

It's used in:
    fs/proc/proc_misc.c:extern int get_irq_list(char *);
    fs/proc/proc_misc.c:  int len = get_irq_list(page);

Each arch has to provide this entry point.

thanks though for the other good points!
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
