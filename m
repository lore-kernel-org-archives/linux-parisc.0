Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA18953
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 10:05:50 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 15 Jun 1999 16:05:33 -0000
Subject: Re: [parisc-linux] Lasi/Dino/Interrupts (fwd)
To: billk@sr.hp.com (Bill Katz)
Date: Tue, 15 Jun 1999 16:58:22 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199906151530.IAA17946@meow.sr.hp.com> from "Bill Katz" at Jun 15, 99 08:30:47 am
Content-Type: text
Message-Id: <E10tvbU-0007Pv-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> The PCI firmware is rather extensive.  It walks the bus, can deal with
> PCI to PCI bridges, and assigns both address space and interrupt
> lines to every device it finds.  It leaves the imporartant information
> in the base address register and interrupt line register of the PCI devices
> it finds.

Ok. That makes life very easy for us indeed.

> The parallel port registers are definitely not in flash space, especailly
> on any system with a PA7300LC since the flash space is from Clark not
> LASI, and the parallel port is completely inside LASI.
> 
> My reading of the ERS says that the slave reset is at LASI_BASE+0x10_2000
> and parallel DMA reset is at LASI_BASE+0x10_3000.  A 4k page is assigned
> for each set of registers.  Where does it say 10300?  I'll fix the ERS.

The bottom of 12.2.2 under table 14

"The parallel port dma registers will be .."

Alan
