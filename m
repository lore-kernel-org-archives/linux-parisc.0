From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] parisc: DMA API: return error instead of BUG_ON for dma
 ops on non dma devs
Date: Wed, 5 Jul 2017 11:57:56 -0700
Message-ID: <20170705185756.GA18087@infradead.org>
References: <20170703084920.142A9508094@solo.franken.de>
 <83ff44f5-8989-c806-bef3-29fb9c909bee@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <83ff44f5-8989-c806-bef3-29fb9c909bee@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I've got a tree pending that removes DMA_ERROR_CODE, and it's been
in linux-next for a while.

While this won't compile-time conflict with this patch and will
basically revert the effect.

Can you please test the patch below and send it to Linus ASAP so that
I can send the pull request for the dma-mapping tree?

---
>From 85942d54e2f0ad5f4b4e074ce2e271be17b31274 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 4 Jul 2017 19:55:06 -0700
Subject: parisc: ->mapping_error

DMA_ERROR_CODE already went away in linux-next, but parisc unfortunately
added a new instance of it without any review as far as I can tell.

Move the two iommu drivers to report errors through ->mapping_error.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/parisc/include/asm/dma-mapping.h |  2 --
 drivers/parisc/ccio-dma.c             | 10 +++++++++-
 drivers/parisc/sba_iommu.c            | 10 +++++++++-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/include/asm/dma-mapping.h b/arch/parisc/include/asm/dma-mapping.h
index 9a2a8956a695..2b16282add69 100644
--- a/arch/parisc/include/asm/dma-mapping.h
+++ b/arch/parisc/include/asm/dma-mapping.h
@@ -20,8 +20,6 @@
 ** flush/purge and allocate "regular" cacheable pages for everything.
 */
 
-#define DMA_ERROR_CODE	(~(dma_addr_t)0)
-
 #ifdef CONFIG_PA11
 extern const struct dma_map_ops pcxl_dma_ops;
 extern const struct dma_map_ops pcx_dma_ops;
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 56c93f096de9..6aa1e7f6672f 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -110,6 +110,8 @@
 #define CMD_TLB_DIRECT_WRITE 35         /* IO_COMMAND for I/O TLB Writes     */
 #define CMD_TLB_PURGE        33         /* IO_COMMAND to Purge I/O TLB entry */
 
+#define CCIO_MAPPING_ERROR    (~(dma_addr_t)0)
+
 struct ioa_registers {
         /* Runway Supervisory Set */
         int32_t    unused1[12];
@@ -742,7 +744,7 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 	BUG_ON(!dev);
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return DMA_ERROR_CODE;
+		return CCIO_MAPPING_ERROR;
 
 	BUG_ON(size <= 0);
 
@@ -1023,6 +1025,11 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	DBG_RUN_SG("%s() DONE (nents %d)\n", __func__, nents);
 }
 
+static int ccio_mapping_error(struct device *dev, dma_addr_t dma_addr)
+{
+	return dma_addr == CCIO_MAPPING_ERROR;
+}
+
 static const struct dma_map_ops ccio_ops = {
 	.dma_supported =	ccio_dma_supported,
 	.alloc =		ccio_alloc,
@@ -1031,6 +1038,7 @@ static const struct dma_map_ops ccio_ops = {
 	.unmap_page =		ccio_unmap_page,
 	.map_sg = 		ccio_map_sg,
 	.unmap_sg = 		ccio_unmap_sg,
+	.mapping_error =	ccio_mapping_error,
 };
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 87ad5fd6a7a2..4086f79d58d5 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -93,6 +93,8 @@
 
 #define DEFAULT_DMA_HINT_REG	0
 
+#define SBA_MAPPING_ERROR    (~(dma_addr_t)0)
+
 struct sba_device *sba_list;
 EXPORT_SYMBOL_GPL(sba_list);
 
@@ -725,7 +727,7 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 
 	ioc = GET_IOC(dev);
 	if (!ioc)
-		return DMA_ERROR_CODE;
+		return SBA_MAPPING_ERROR;
 
 	/* save offset bits */
 	offset = ((dma_addr_t) (long) addr) & ~IOVP_MASK;
@@ -1083,6 +1085,11 @@ sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 }
 
+static int sba_mapping_error(struct device *dev, dma_addr_t dma_addr)
+{
+	return dma_addr == SBA_MAPPING_ERROR;
+}
+
 static const struct dma_map_ops sba_ops = {
 	.dma_supported =	sba_dma_supported,
 	.alloc =		sba_alloc,
@@ -1091,6 +1098,7 @@ static const struct dma_map_ops sba_ops = {
 	.unmap_page =		sba_unmap_page,
 	.map_sg =		sba_map_sg,
 	.unmap_sg =		sba_unmap_sg,
+	.mapping_error =	sba_mapping_error,
 };
 
 
-- 
2.11.0

