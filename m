Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA954482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 11:59:11 -0600 (MDT)
Message-Id: <200104131752.LAA06197@puffin.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups 
In-Reply-To: Your message of "Fri, 13 Apr 2001 13:52:54 BST."
             <E14o34K-0002o5-00@the-village.bc.nu>
Date: Fri, 13 Apr 2001 11:52:19 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> ISA bus has MMIO, including busmastering. 

really? ok.  I thought the 8237A (DMA chip) on pc's provided the
DMA capability. I didn't think it wasn't inherent to the ISA bus.
But it's been so long (late 80's) since I've seriously mucked with
ISA devices.

ta,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
