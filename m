Received: from cosrel2.hp.com (cosrel2.hp.com [156.153.255.162])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA22652
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 10:08:07 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel2.hp.com (Postfix) with ESMTP id 1DA5E388
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 10:09:49 -0700 (MST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id JAA16103
	for parisc-linux@puffin.external.hp.com; Fri, 17 Nov 2000 09:09:04 -0800 (PST)
Date: Fri, 17 Nov 2000 09:09:04 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200011171709.JAA16103@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] pci-dma.c BUG(391/400) PATCH
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

The following patch tries to point a finger at the offender
rather than just call attention to a problem in the service.

I don't have a PCXL/L2 machine setup right now.
Could someone test commit this patch for me?

thanks,
grant

grundler <505>cvs diff arch/parisc/kernel/pci-dma.c 
Index: arch/parisc/kernel/pci-dma.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/pci-dma.c,v
retrieving revision 1.16
diff -u -p -r1.16 pci-dma.c
--- pci-dma.c   2000/11/08 06:20:27     1.16
+++ pci-dma.c   2000/11/17 17:04:22
@@ -387,8 +387,10 @@ static void pa11_dma_free_consistent (st
 
 static dma_addr_t pa11_dma_map_single(struct pci_dev *dev, void *addr, size_t size, int direction)
 {
-       if (direction == PCI_DMA_NONE)
-           BUG();
+       if (direction == PCI_DMA_NONE) {
+               printk(KERN_ERR "pa11_dma_map_single(PCI_DMA_NONE) called by %p\n", __builtin_return_address(0));
+               BUG();
+       }
 
        flush_kernel_dcache_range((unsigned long) addr, size);
        return virt_to_phys(addr);
@@ -396,8 +398,10 @@ static dma_addr_t pa11_dma_map_single(st
 
 static void pa11_dma_unmap_single(struct pci_dev *dev, dma_addr_t dma_handle, size_t size, int direction)
 {
-       if (direction == PCI_DMA_NONE)
-           BUG();
+       if (direction == PCI_DMA_NONE) {
+               printk(KERN_ERR "pa11_dma_unmap_single(PCI_DMA_NONE) called by %p\n", __builtin_return_address(0));
+               BUG();
+       }
 
        if (direction == PCI_DMA_TODEVICE)
            return;
