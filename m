Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 753D8482B
	for <parisc-linux@parisc-linux.org>; Sun,  8 Jul 2001 19:04:11 -0600 (MDT)
Message-Id: <200107090103.TAA09348@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] I think WAX is broken 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 09 Jul 2001 00:44:02 BST." <20010709004402.Q6103@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 08 Jul 2001 19:03:20 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> `addr' is a u16.  it can't possibly be >= 0x00080000 or >= 0x00500000.

Yup - that's definitely broken.

...
> Then in arch/parisc/kernel/pci.c, we have the wonderfully obscured:

Hey! that's mine! :^P

...
> So I _think_ the right fix is to change WAX_EISA_OUT to:
> 
> #define WAX_EISA_OUT(type, size) \
> static void wax_out##type (struct pci_hba_data *hba, u16 addr, u##size d) \
> { \
> 	u32 out_addr = 0xfc000000 + ((addr & 0xfc00) >> 6) + \
> 			((addr & 0x03f8) << 9) + (addr & 0x0007) ; \
> 	gsc_write##type(d,out_addr); \
> } 

Someone needs to understand what "((addr & 0xfc00) >> 6)" does.
It looks like it overlaps with "((addr & 0x03f8) << 9)".

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
