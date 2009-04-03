From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] parisc: ccio-dma: fix build failure without procfs
Date: Fri, 3 Apr 2009 16:08:54 +0400
Message-ID: <20090403120854.GA29187@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix this build error when CONFIG_PROC_FS is not set:
drivers/parisc/ccio-dma.c:1574: error: 'ccio_proc_info_fops' undeclared

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/parisc/ccio-dma.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 5d610cb..0f0e0b9 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1134,7 +1134,7 @@ static const struct file_operations ccio_proc_bitmap_fops = {
 	.llseek = seq_lseek,
 	.release = single_release,
 };
-#endif
+#endif /* CONFIG_PROC_FS */
 
 /**
  * ccio_find_ioc - Find the ioc in the ioc_list
@@ -1568,14 +1568,15 @@ static int __init ccio_probe(struct parisc_device *dev)
 	/* if this fails, no I/O cards will work, so may as well bug */
 	BUG_ON(dev->dev.platform_data == NULL);
 	HBA_DATA(dev->dev.platform_data)->iommu = ioc;
-	
+
+#ifdef CONFIG_PROC_FS
 	if (ioc_count == 0) {
 		proc_create(MODULE_NAME, 0, proc_runway_root,
 			    &ccio_proc_info_fops);
 		proc_create(MODULE_NAME"-bitmap", 0, proc_runway_root,
 			    &ccio_proc_bitmap_fops);
 	}
