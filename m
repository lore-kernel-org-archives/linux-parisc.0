Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA10056
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Sep 1999 14:46:05 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id MAA02218
	for <parisc-linux@thepuffingroup.com>; Fri, 3 Sep 1999 12:30:04 -0600 (MDT)
Message-Id: <199909031827.LAA08791@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Fri, 03 Sep 1999 13:15:41 PDT."
             <19990903131541.K10698@suse.de>
Date: Fri, 03 Sep 1999 11:27:10 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] PCI-like busses
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > Not quite - removed support for more than one type of PCI bus adapter.
> > PA platforms only support one type of PCI bus adapter at a time.
> 
> Sorry ? Alex told me the exact opposite when I asked him and I relied on that
>   .

Ok.

> So:  Are there parisc boxen with more than one type of interface to PCI-like
> busses?

B/C/D class boxen haben PCI u. EISA (u. GSC) "slots".
Since learning EISA/ISA busses are "PCI-like", the answer is "yes".
And if this answer is right, then I'll put back the "multi-bus type"
support in pci.h. I don't get how EISA would use these services
(perhaps just the IRQ stuff?) but I'll trust you on that.

> For example, can I take a Dino-on-a-card card and put it into a box
> which does not use Dino as native-to-PCI bridge ?

Yes - but I'm only aware of K/T class "form factor" (shape/size).
These won't normally fit in the A/B/C/D class boxes which also have
GSC slots. Any other HP person know if any card-mode Dino's were
made for workstations?

(Next week I'll see if I can wedge the K-class one into a workstation
anyway)

grant


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
