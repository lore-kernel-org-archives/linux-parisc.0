Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA11204
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 11:04:24 -0600
Message-Id: <199906281703.KAA03194@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Dino and Lasi 
In-reply-to: Your message of "Mon, 28 Jun 1999 01:26:46 PDT."
             <37770796.C70E0C65@thepuffingroup.com>
Date: Mon, 28 Jun 1999 10:03:14 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> 
> Okay, I've committed some small changes to dino and lasi that can easily
> be backed out.
> 
> some questions:
> 
> - what IRQ are we going to run LASI on?  Is that something we just pick
> and hard code?

Isn't LASI a PA (ie GSC bus) device?
If so, it can use any EIRR bit/HPA pair supported by the PA processor code.
It needs to register an ISR with PA interrupt code and get the EIRR/HPA
pair (commonly called EIM value).

Same is true for Dino.

> - I changed lasi.c and dino.c to only use readl() and writel(), and not
> readb and writew, etc.  Was this a mistake?

For Dino, I think so. On a reads, it shouldn't matter unless the
reads have side effects (eg. clears the byte register). On writes
too many byte enables will be set.

BTW, I assume you are talking about PCI MMIO/Port/Cfg space accessor
functions.

> - We really really need the IRQ bottom halfs setup.  Any takers?

What do you mean "bottom half"?
dino_isr() to map DINO EIM registers to PCI IRQ lines (and thus
PCI device ISRs)?

grant

Grant Grundler
+1.408.447.7253
