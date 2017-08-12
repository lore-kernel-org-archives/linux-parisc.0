From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] parisc: pci memory bar assignment fails with 64bit kernels on dino/cujo
Date: Sat, 12 Aug 2017 23:36:47 +0200
Message-ID: <20170812214418.DB60D50835D@solo.franken.de>
To: jejb@parisc-linux.org, deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

For 64bit kernels the lmmio_space_offset of the host bridge window
isn't set correctly on systems with dino/cujo PCI host bridges.
This leads to not assigned memory bars and failing drivers, which
need to use these bars.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/parisc/dino.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 5c63b92..ed92c12 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -956,7 +956,7 @@ static int __init dino_probe(struct parisc_device *dev)
 
 	dino_dev->hba.dev = dev;
 	dino_dev->hba.base_addr = ioremap_nocache(hpa, 4096);
-	dino_dev->hba.lmmio_space_offset = 0;	/* CPU addrs == bus addrs */
+	dino_dev->hba.lmmio_space_offset = PCI_F_EXTEND;
 	spin_lock_init(&dino_dev->dinosaur_pen);
 	dino_dev->hba.iommu = ccio_get_iommu(dev);
 
-- 
2.1.4

