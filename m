Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A478482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 14:32:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15tat8-0008KA-00
	for parisc-linux@parisc-linux.org; Tue, 16 Oct 2001 21:32:34 +0100
Date: Tue, 16 Oct 2001 21:32:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011016213234.I15532@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] GSC & EISA devices and pci_alloc_consistent
List-ID: <linux-parisc.vger.kernel.org>

Looking at the 3c59x driver, it attempts to allocate host memory that
the card can access by DMA with:

        vp->rx_ring = pci_alloc_consistent(pdev, sizeof(struct boom_rx_desc) * RX_RING_SIZE
                                           + sizeof(struct boom_tx_desc) * TX_RING_SIZE,
                                           &vp->rx_ring_dma);

For EISA devices, pdev is NULL.  So pci_alloc_consistent (on EISA-capable
boxes; Astro-based boxes can ignore all this) can check for pdev being
NULL and set up the I/O Map so that the EISA bus can access this chunk
of ram.

But there's a problem.  Currently our specific drivers (lasi_82596, sim700,
et al) call pci_alloc_consistent with a NULL pci_dev.  And that causes a
different problem.  On machines with ccio (C, J, D, K, R) we need to know
which IOC the device is under (currently we assume the first... which is why
some machines HPMC early on).

I think the solution to this is to create a fake struct pci_dev that our
drivers hand to pci_alloc_consistent.  Then we have:

PCXL, L2:
	if (pci_dev == NULL) return wax_alloc_consistent();
	else kmalloc()

ccio:
	if (pci_dev == NULL) return wax_alloc_consistent();
	ioc = find_ioc(pci_dev);
	...

astro/elroy systems remain unchanged.

The only question is how/where to obtain this pci_dev, and how to give
it to the drivers which need it.

-- 
Revolutions do not require corporate support.
