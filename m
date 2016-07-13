From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v6 36/46] parisc: dma-mapping: Use unsigned long for dma_attrs
Date: Wed, 13 Jul 2016 10:41:27 +0200
Message-ID: <1468399300-5399-36-git-send-email-k.kozlowski@samsung.com>
References: <1468399167-28083-1-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-1-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-2-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-3-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-4-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-5-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-6-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-7-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-8-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-9-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-10-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-11-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-12-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-13-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-14-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-15-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-16-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-17-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-18-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-19-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-20-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-21-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-22-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-23-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-24-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-25-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-26-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-27-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-28-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-29-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-30-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-31-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-32-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-33-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-34-git-send-email-k.kozlowski@samsung.com>
 <1468399300-5399-35-git-send-email-k.kozlowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, hch@infradead.org,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-reply-to: <1468399300-5399-35-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/parisc/kernel/pci-dma.c | 16 ++++++++--------
 drivers/parisc/ccio-dma.c    | 16 ++++++++--------
 drivers/parisc/sba_iommu.c   | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index a27e4928bf73..845fdd52e4c5 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -414,7 +414,7 @@ pcxl_dma_init(void)
 __initcall(pcxl_dma_init);
 
 static void *pa11_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t flag, struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t flag, unsigned long attrs)
 {
 	unsigned long vaddr;
 	unsigned long paddr;
@@ -441,7 +441,7 @@ static void *pa11_dma_alloc(struct device *dev, size_t size,
 }
 
 static void pa11_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
 	int order;
 
@@ -454,7 +454,7 @@ static void pa11_dma_free(struct device *dev, size_t size, void *vaddr,
 
 static dma_addr_t pa11_dma_map_page(struct device *dev, struct page *page,
 		unsigned long offset, size_t size,
-		enum dma_data_direction direction, struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	void *addr = page_address(page) + offset;
 	BUG_ON(direction == DMA_NONE);
@@ -465,7 +465,7 @@ static dma_addr_t pa11_dma_map_page(struct device *dev, struct page *page,
 
 static void pa11_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 		size_t size, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	BUG_ON(direction == DMA_NONE);
 
@@ -484,7 +484,7 @@ static void pa11_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 
 static int pa11_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	int i;
 	struct scatterlist *sg;
@@ -503,7 +503,7 @@ static int pa11_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 
 static void pa11_dma_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		int nents, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	int i;
 	struct scatterlist *sg;
@@ -577,7 +577,7 @@ struct dma_map_ops pcxl_dma_ops = {
 };
 
 static void *pcx_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t flag, struct dma_attrs *attrs)
+		dma_addr_t *dma_handle, gfp_t flag, unsigned long attrs)
 {
 	void *addr;
 
@@ -592,7 +592,7 @@ static void *pcx_dma_alloc(struct device *dev, size_t size,
 }
 
 static void pcx_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t iova, struct dma_attrs *attrs)
+		dma_addr_t iova, unsigned long attrs)
 {
 	free_pages((unsigned long)vaddr, get_order(size));
 	return;
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index e24b05996a1b..3ed6238f8f6e 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -790,7 +790,7 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 static dma_addr_t
 ccio_map_page(struct device *dev, struct page *page, unsigned long offset,
 		size_t size, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	return ccio_map_single(dev, page_address(page) + offset, size,
 			direction);
@@ -806,7 +806,7 @@ ccio_map_page(struct device *dev, struct page *page, unsigned long offset,
  */
 static void 
 ccio_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
-		enum dma_data_direction direction, struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
 	unsigned long flags; 
@@ -844,7 +844,7 @@ ccio_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
  */
 static void * 
 ccio_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle, gfp_t flag,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
       void *ret;
 #if 0
@@ -878,9 +878,9 @@ ccio_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle, gfp_t flag,
  */
 static void 
 ccio_free(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_handle, struct dma_attrs *attrs)
+		dma_addr_t dma_handle, unsigned long attrs)
 {
-	ccio_unmap_page(dev, dma_handle, size, 0, NULL);
+	ccio_unmap_page(dev, dma_handle, size, 0, 0);
 	free_pages((unsigned long)cpu_addr, get_order(size));
 }
 
@@ -907,7 +907,7 @@ ccio_free(struct device *dev, size_t size, void *cpu_addr,
  */
 static int
 ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents, 
-	    enum dma_data_direction direction, struct dma_attrs *attrs)
+	    enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
 	int coalesced, filled = 0;
@@ -984,7 +984,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
  */
 static void 
 ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents, 
-	      enum dma_data_direction direction, struct dma_attrs *attrs)
+	      enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
 
@@ -1004,7 +1004,7 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 		ioc->usg_pages += sg_dma_len(sglist) >> PAGE_SHIFT;
 #endif
 		ccio_unmap_page(dev, sg_dma_address(sglist),
-				  sg_dma_len(sglist), direction, NULL);
+				  sg_dma_len(sglist), direction, 0);
 		++sglist;
 	}
 
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 42ec4600b7e4..151b86b6d2e2 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -783,7 +783,7 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 static dma_addr_t
 sba_map_page(struct device *dev, struct page *page, unsigned long offset,
 		size_t size, enum dma_data_direction direction,
-		struct dma_attrs *attrs)
+		unsigned long attrs)
 {
 	return sba_map_single(dev, page_address(page) + offset, size,
 			direction);
@@ -801,7 +801,7 @@ sba_map_page(struct device *dev, struct page *page, unsigned long offset,
  */
 static void
 sba_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
-		enum dma_data_direction direction, struct dma_attrs *attrs)
+		enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
 #if DELAYED_RESOURCE_CNT > 0
@@ -876,7 +876,7 @@ sba_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
  * See Documentation/DMA-API-HOWTO.txt
  */
 static void *sba_alloc(struct device *hwdev, size_t size, dma_addr_t *dma_handle,
-		gfp_t gfp, struct dma_attrs *attrs)
+		gfp_t gfp, unsigned long attrs)
 {
 	void *ret;
 
@@ -908,9 +908,9 @@ static void *sba_alloc(struct device *hwdev, size_t size, dma_addr_t *dma_handle
  */
 static void
 sba_free(struct device *hwdev, size_t size, void *vaddr,
-		    dma_addr_t dma_handle, struct dma_attrs *attrs)
+		    dma_addr_t dma_handle, unsigned long attrs)
 {
-	sba_unmap_page(hwdev, dma_handle, size, 0, NULL);
+	sba_unmap_page(hwdev, dma_handle, size, 0, 0);
 	free_pages((unsigned long) vaddr, get_order(size));
 }
 
@@ -943,7 +943,7 @@ int dump_run_sg = 0;
  */
 static int
 sba_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
-	   enum dma_data_direction direction, struct dma_attrs *attrs)
+	   enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
 	int coalesced, filled = 0;
@@ -1026,7 +1026,7 @@ sba_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
  */
 static void 
 sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
-	     enum dma_data_direction direction, struct dma_attrs *attrs)
+	     enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
 #ifdef ASSERT_PDIR_SANITY
@@ -1051,7 +1051,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	while (sg_dma_len(sglist) && nents--) {
 
 		sba_unmap_page(dev, sg_dma_address(sglist), sg_dma_len(sglist),
-				direction, NULL);
+				direction, 0);
 #ifdef SBA_COLLECT_STATS
 		ioc->usg_pages += ((sg_dma_address(sglist) & ~IOVP_MASK) + sg_dma_len(sglist) + IOVP_SIZE - 1) >> PAGE_SHIFT;
 		ioc->usingle_calls--;	/* kluge since call is unmap_sg() */
-- 
1.9.1

