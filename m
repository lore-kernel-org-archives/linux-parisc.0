Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA19812
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 11:11:10 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA27297
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Aug 1999 13:12:18 -0400 (EDT)
Message-Id: <199908261713.KAA12239@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c 
In-reply-to: Your message of "Thu, 26 Aug 1999 17:26:26 PDT."
             <19990826172626.K19314@suse.de>
Date: Thu, 26 Aug 1999 10:13:14 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf:
> the Dino documentations says bits 5-31 are HPA but as long as 5-10 are 0 we
> don't have to care.

FYI - All PA device addresses are 4k page aligned.
I've seen devices alias within a page but the IODC can only
report the number of 4k pages a devices uses - ergo 4K aligned.

> 
> > ie a value 0-31). The location of this register is NOT
> > defined by PA I/O architecture - or at least not well defined.
> > Is this a real problem or not?
> 
> No.  You just do
> gsc_writel(0xfffe0000 + dev->irq, dev->hpa + DEVICE_SPECIFIC_OFFSET);
> right after request_irq(dev->irq, ...);

Ok - this is another SMP issue...I'll hardcode 0xfffe0000 for now. 

Platform	Processor HPA
--------	-------------
712/80		0xfffbe000
715/100		0xfffbe000
B132L		0xfffbe000
B180L		0xfffbe000
C200+		0xfffa0000

> > Another tidbit: I know of only one device which can use "6-bit"
> > (0-63) EIRR vectors. GSC and PCI devices which are capable of mastering
> > their own interrupt transactions can also use 6-bits. 6-bits is
> > obviously only supportable running a 64-bit kernel binary.
> 
> Is it ok with you if we worry about SMP and PA2.0 boxes later ?

Absolutely. I brought this up so it doesn't have to get redesigned
by whoever feels like tackling those issues.  Note the subject line.
I'm just not into doing thing two or three times in a row.

grant

> 
> 	Philipp Rumpf

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
