Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12663
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 10:43:05 -0600
Message-Id: <200009011646.JAA20572@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Oops in sim700.c on C360 
In-reply-to: Your message of "Fri, 01 Sep 2000 17:12:33 PDT."
             <20000901171233.C1538@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 01 Sep 2000 09:46:27 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> So I deduce that the CCIO support hasn't recognised
> your machine.  Perhaps we should initialise it to a routine which prints
> that the PCI ops haven't been initialised and halts.

It did "halt". ;^)

pci_dma_supported() is supposed to be called first by all drivers wishing
to use Dynamic DMA interfaces. I'm thinking a test in pci_dma_supported()
macro could oops nicely if hppa_dma_ops isn't set.

For "devices" which aren't claimed (eg CCIO), we need to make sure
the HVERS/SVERS values are make available to the device maintainer.
I'll poke dhd offline in this case.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
