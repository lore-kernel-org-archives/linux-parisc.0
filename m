Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA09664
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Sep 1999 12:44:41 -0600
Date: Fri, 3 Sep 1999 20:46:34 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: PCI-like busses
Message-ID: <19990903204634.N10698@suse.de>
References: <19990903131541.K10698@suse.de> <199909031827.LAA08791@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909031827.LAA08791@milano.cup.hp.com>; from Grant Grundler on Fri, Sep 03, 1999 at 11:27:10AM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > So:  Are there parisc boxen with more than one type of interface to PCI-like
> > busses?
> 
> B/C/D class boxen haben PCI u. EISA (u. GSC) "slots".
> Since learning EISA/ISA busses are "PCI-like", the answer is "yes".

Of course, strictly speaking we could separate between pci busses (where we
have configuration space accesses) and isa-like busses (where we don't).  I
don't see any advantage.  For port accesses, we don't have to separate.

> And if this answer is right, then I'll put back the "multi-bus type"
> support in pci.h. I don't get how EISA would use these services
> (perhaps just the IRQ stuff?) but I'll trust you on that.

Remember I still want to remove the IRQ handling out of struct pci_bus_ops.

> Yes - but I'm only aware of K/T class "form factor" (shape/size).
> These won't normally fit in the A/B/C/D class boxes which also have

The Dino-on-a-card I have in the A180C is quite long, yes.

> (Next week I'll see if I can wedge the K-class one into a workstation
> anyway)

Don't destroy any hardware ;)


	Philipp Rumpf
