Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69EB5482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 18:31:46 -0600 (MDT)
Message-Id: <200104040025.SAA18848@puffin.external.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] request_region() 
In-Reply-To: Your message of "Tue, 03 Apr 2001 17:41:56 BST."
             <20010403174156.U11435@parcelfarce.linux.theplanet.co.uk>
Date: Tue, 03 Apr 2001 18:25:54 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> i think sim700.c should be using ioremap / readX / writeX instead
> of raw_read.  Is the EISA scsi really only accessible via port io?

Yes.

> I would have throught that it would be memory mapped, in which case
> there's no need to have a macro to access it.

IO Port space is memory mapped but not in a linear fashion (afaik).
My understanding is the IO port space is mapped 4 bytes per MMIO page.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
