Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA11948
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 12:08:27 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 28 Jun 1999 18:08:03 -0000
Subject: Re: [parisc-linux] Dino and Lasi
To: grundler@cup.hp.com (Grant Grundler)
Date: Mon, 28 Jun 1999 18:56:37 +0100 (BST)
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199906281703.KAA03194@milano.cup.hp.com> from "Grant Grundler" at Jun 28, 99 10:03:14 am
Content-Type: text
Message-Id: <E10yfe4-0005R6-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> What do you mean "bottom half"?
> dino_isr() to map DINO EIM registers to PCI IRQ lines (and thus
> PCI device ISRs)?

The Linux bottom halves are closest in 'other unixen' to the software interrupt
code run after the IRQ return.

Linux services any pending bottom halves after the irq completes but before
returning to the scheduled task/scheduler. Its used for deferring processing
from interrupt paths
