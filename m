Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA22336
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 17:54:52 -0700
Message-Id: <200101020059.QAA26152@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ZONE_DMA 
In-reply-to: Your message of "Mon, 01 Jan 2001 18:09:53 PST."
             <E14D9PA-00017j-00@the-village.bc.nu>
Date: Mon, 01 Jan 2001 16:59:31 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> Some Alpha's probably can but we don't support that. The pci side API
> pci_alloc_consistent does

Nit: I think pci_dma_supported() is the interface meant here.

Documentation/DMA-mapping.txt has a good example here on how
pci_dma_supported() supports cripppled PCI devices.

Right now, SBA code (and CCIO too I think) only permit devices
that say they support 32-bit addressing. sba_dma_supported()
code needs to be revisited for two reasons:
o the number of bits the IO MMU actually uses is typically alot less
  - depends on the size of the I/O Pdir. Ie it could support the
  crippled PCI device pretty easily.
o Elroy HW supports 64-bit PCI addressing (Dual Address cycle).

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
