Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from freya.yggdrasil.com (h-64-105-136-52.SNVACAID.covad.net [64.105.136.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01DA94837
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Nov 2002 06:50:40 -0700 (MST)
Date: Sat, 16 Nov 2002 05:49:41 -0800
From: "Adam J. Richter" <adam@yggdrasil.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021116054941.A3448@baldur.yggdrasil.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Subject: [parisc-linux] Patch: linux-2.5.47/drivers/parisc/ - pci_dma_supported had side effect
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	pci_dma_supported is not supposed to have any side effects,
but the parisc versions set pci_dev->dma_mask, which is not the
intended behavior.  A driver could call check pci_dma_supported for a
variety of values in any particular order without expected the dma
mask to have actually been changed.  To change the DMA mask, drivers
call pci_set_dma_mask (in drivers/pci/pci.c), which, by the way, does
call machine-specific pci_dma_supported routine to ensure that the
desired mask is acceptable.

	The following patch fixes the problem.  It also has the
benefit of eliminating some direct writing to pci_dev->dma_mask,
which is what caused me to notice this problem.

	I do not have any parisc machines or normally build parisc
kernels.  So, I have not even verified that this change compiles.

	If somebody could give these deletions a whirl and then send
them by whatever the preferred process is to get them into the
mainline kernel, I would appreciate it.  If there is more that I
should do to facilitate this, please let me know.

-- 
Adam J. Richter     __     ______________   575 Oroville Road
adam@yggdrasil.com     \ /                  Milpitas, California 95035
+1 408 309-6081         | g g d r a s i l   United States of America
                         "Free Software For The Rest Of Us."

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="parisc-supp.diff"

--- linux-2.5.47/drivers/parisc/ccio-dma.c	2002-11-10 19:28:05.000000000 -0800
+++ linux/drivers/parisc/ccio-dma.c	2002-11-16 05:23:47.000000000 -0800
@@ -603,18 +603,16 @@
 ccio_dma_supported(struct pci_dev *dev, u64 mask)
 {
 	if(dev == NULL) {
 		printk(KERN_ERR MODULE_NAME ": EISA/ISA/et al not supported\n");
 		BUG();
 		return 0;
 	}
 
-	dev->dma_mask = mask;   /* save it */
-
 	/* only support 32-bit devices (ie PCI/GSC) */
 	return (int)(mask == 0xffffffffUL);
 }
 
 /**
  * ccio_map_single - Map an address range into the IOMMU.
  * @dev: The PCI device.
  * @addr: The start address of the DMA region.
--- linux-2.5.47/drivers/parisc/ccio-rm-dma.c	2002-11-10 19:28:06.000000000 -0800
+++ linux/drivers/parisc/ccio-rm-dma.c	2002-11-16 05:23:44.000000000 -0800
@@ -69,18 +69,16 @@
 static int ccio_dma_supported( struct pci_dev *dev, u64 mask)
 {
 	if (dev == NULL) {
 		printk(KERN_ERR MODULE_NAME ": EISA/ISA/et al not supported\n");
 		BUG();
 		return(0);
 	}
 
-	dev->dma_mask = mask;   /* save it */
-
 	/* only support 32-bit devices (ie PCI/GSC) */
 	return((int) (mask >= 0xffffffffUL));
 }
 
 
 static void *ccio_alloc_consistent(struct pci_dev *dev, size_t size,
 				 dma_addr_t *handle)
 {
--- linux-2.5.47/drivers/parisc/sba_iommu.c	2002-11-10 19:28:28.000000000 -0800
+++ linux/drivers/parisc/sba_iommu.c	2002-11-16 05:23:51.000000000 -0800
@@ -806,18 +806,16 @@
 sba_dma_supported( struct pci_dev *dev, u64 mask)
 {
 	if (dev == NULL) {
 		printk(KERN_ERR MODULE_NAME ": EISA/ISA/et al not supported\n");
 		BUG();
 		return(0);
 	}
 
-	dev->dma_mask = mask;	/* save it */
-
 	/* only support 32-bit PCI devices - no DAC support (yet) */
 	return((int) (mask == 0xffffffff));
 }
 
 
 /**
  * sba_map_single - map one buffer and return IOVA for DMA
  * @dev: instance of PCI owned by the driver that's asking.

--fUYQa+Pmc3FrFX/N--
