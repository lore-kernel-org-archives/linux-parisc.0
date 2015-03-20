From: Matthew Wilcox <matthew.r.wilcox@intel.com>
Subject: [PATCH] parisc: Eliminate sg_virt_addr() and private scatterlist.h
Date: Fri, 20 Mar 2015 13:37:59 -0400
Message-ID: <1426873079-32288-1-git-send-email-matthew.r.wilcox@intel.com>
Cc: Matthew Wilcox <willy@linux.intel.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Matthew Wilcox <willy@linux.intel.com>

The only reason to keep parisc's private asm/scatterlist.h was that it
had the macro sg_virt_addr().  Convert all callers to use something else
(sometimes just sg->offset was enough, others should use sg_virt()), and
we can just use the asm-generic scatterlist.h instead.

Signed-off-by: Matthew Wilcox <willy@linux.intel.com>
---

I haven't even compile-tested these changes ... I do have some PA-RISC
equipment, but it hasn't been turned on in seven years.

 arch/parisc/include/asm/Kbuild        |  1 +
 arch/parisc/include/asm/cacheflush.h  |  2 +-
 arch/parisc/include/asm/scatterlist.h | 10 ----------
 arch/parisc/kernel/pci-dma.c          |  8 ++++----
 drivers/parisc/ccio-dma.c             |  6 +++---
 drivers/parisc/iommu-helpers.h        | 30 ++++++++++++++++--------------
 drivers/parisc/sba_iommu.c            |  7 +++----
 7 files changed, 28 insertions(+), 36 deletions(-)
 delete mode 100644 arch/parisc/include/asm/scatterlist.h

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index 8686237..a5f0375 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -20,6 +20,7 @@ generic-y += param.h
 generic-y += percpu.h
 generic-y += poll.h
 generic-y += preempt.h
+generic-y += scatterlist.h
 generic-y += segment.h
 generic-y += topology.h
 generic-y += trace_clock.h
diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index de65f66..873fd4a 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -44,7 +44,7 @@ static inline void flush_kernel_dcache_page(struct page *page)
 }
 
 #define flush_kernel_dcache_range(start,size) \
-	flush_kernel_dcache_range_asm((start), (start)+(size));
+	flush_kernel_dcache_range_asm((unsigned long)(start), (start)+(size));
 /* vmap range flushes and invalidates.  Architecturally, we don't need
  * the invalidate, because the CPU should refuse to speculate once an
  * area has been flushed, so invalidate is left empty */
diff --git a/arch/parisc/include/asm/scatterlist.h b/arch/parisc/include/asm/scatterlist.h
deleted file mode 100644
index 8bf1f0d..0000000
--- a/arch/parisc/include/asm/scatterlist.h
+++ /dev/null
@@ -1,10 +0,0 @@
-#ifndef _ASM_PARISC_SCATTERLIST_H
-#define _ASM_PARISC_SCATTERLIST_H
-
-#include <asm/page.h>
-#include <asm/types.h>
-#include <asm-generic/scatterlist.h>
-
-#define sg_virt_addr(sg) ((unsigned long)sg_virt(sg))
-
-#endif /* _ASM_PARISC_SCATTERLIST_H */
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index d87d1c4..f428878 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -482,7 +482,7 @@ static int pa11_dma_map_sg(struct device *dev, struct scatterlist *sglist, int n
 	BUG_ON(direction == DMA_NONE);
 
 	for (i = 0; i < nents; i++, sglist++ ) {
-		unsigned long vaddr = sg_virt_addr(sglist);
+		unsigned long vaddr = (unsigned long)sg_virt(sglist);
 		sg_dma_address(sglist) = (dma_addr_t) virt_to_phys(vaddr);
 		sg_dma_len(sglist) = sglist->length;
 		flush_kernel_dcache_range(vaddr, sglist->length);
@@ -502,7 +502,7 @@ static void pa11_dma_unmap_sg(struct device *dev, struct scatterlist *sglist, in
 	/* once we do combining we'll need to use phys_to_virt(sg_dma_address(sglist)) */
 
 	for (i = 0; i < nents; i++, sglist++ )
-		flush_kernel_dcache_range(sg_virt_addr(sglist), sglist->length);
+		flush_kernel_dcache_range(sg_virt(sglist), sglist->length);
 	return;
 }
 
@@ -527,7 +527,7 @@ static void pa11_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl
 	/* once we do combining we'll need to use phys_to_virt(sg_dma_address(sglist)) */
 
 	for (i = 0; i < nents; i++, sglist++ )
-		flush_kernel_dcache_range(sg_virt_addr(sglist), sglist->length);
+		flush_kernel_dcache_range(sg_virt(sglist), sglist->length);
 }
 
 static void pa11_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sglist, int nents, enum dma_data_direction direction)
@@ -537,7 +537,7 @@ static void pa11_dma_sync_sg_for_device(struct device *dev, struct scatterlist *
 	/* once we do combining we'll need to use phys_to_virt(sg_dma_address(sglist)) */
 
 	for (i = 0; i < nents; i++, sglist++ )
-		flush_kernel_dcache_range(sg_virt_addr(sglist), sglist->length);
+		flush_kernel_dcache_range(sg_virt(sglist), sglist->length);
 }
 
 struct hppa_dma_ops pcxl_dma_ops = {
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 8b490d7..5347847 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -916,7 +916,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	/* Fast path single entry scatterlists. */
 	if (nents == 1) {
 		sg_dma_address(sglist) = ccio_map_single(dev,
-				(void *)sg_virt_addr(sglist), sglist->length,
+				sg_virt(sglist), sglist->length,
 				direction);
 		sg_dma_len(sglist) = sglist->length;
 		return 1;
@@ -983,8 +983,8 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	BUG_ON(!dev);
 	ioc = GET_IOC(dev);
 
-	DBG_RUN_SG("%s() START %d entries,  %08lx,%x\n",
-		__func__, nents, sg_virt_addr(sglist), sglist->length);
+	DBG_RUN_SG("%s() START %d entries, %p,%x\n",
+		__func__, nents, sg_virt(sglist), sglist->length);
 
 #ifdef CCIO_COLLECT_STATS
 	ioc->usg_calls++;
diff --git a/drivers/parisc/iommu-helpers.h b/drivers/parisc/iommu-helpers.h
index 8c33491..9a55002 100644
--- a/drivers/parisc/iommu-helpers.h
+++ b/drivers/parisc/iommu-helpers.h
@@ -30,9 +30,9 @@ iommu_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents,
 		unsigned long vaddr;
 		long size;
 
-		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
+		DBG_RUN_SG(" %d : %08lx/%05x %p/%05x\n", nents,
 			   (unsigned long)sg_dma_address(startsg), cnt,
-			   sg_virt_addr(startsg), startsg->length
+			   sg_virt(startsg), startsg->length
 		);
 
 
@@ -66,7 +66,7 @@ iommu_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents,
 		
 		BUG_ON(pdirp == NULL);
 		
-		vaddr = sg_virt_addr(startsg);
+		vaddr = (unsigned long)sg_virt(startsg);
 		sg_dma_len(dma_sg) += startsg->length;
 		size = startsg->length + dma_offset;
 		dma_offset = 0;
@@ -113,7 +113,7 @@ iommu_coalesce_chunks(struct ioc *ioc, struct device *dev,
 		*/
 		contig_sg = startsg;
 		dma_len = startsg->length;
-		dma_offset = sg_virt_addr(startsg) & ~IOVP_MASK;
+		dma_offset = startsg->offset;
 
 		/* PARANOID: clear entries */
 		sg_dma_address(startsg) = 0;
@@ -124,14 +124,13 @@ iommu_coalesce_chunks(struct ioc *ioc, struct device *dev,
 		** it's always looking one "ahead".
 		*/
 		while(--nents > 0) {
-			unsigned long prevstartsg_end, startsg_end;
+			unsigned long prev_end, sg_start;
 
-			prevstartsg_end = sg_virt_addr(startsg) +
-				startsg->length;
+			prev_end = (unsigned long)sg_virt(startsg) +
+							startsg->length;
 
 			startsg++;
-			startsg_end = sg_virt_addr(startsg) + 
-				startsg->length;
+			sg_start = (unsigned long)sg_virt(startsg);
 
 			/* PARANOID: clear entries */
 			sg_dma_address(startsg) = 0;
@@ -150,12 +149,15 @@ iommu_coalesce_chunks(struct ioc *ioc, struct device *dev,
 				break;
 
 			/*
-			** Next see if we can append the next chunk (i.e.
-			** it must end on one page and begin on another
-			*/
-			if (unlikely(((prevstartsg_end | sg_virt_addr(startsg)) & ~PAGE_MASK) != 0))
+			 * Next see if we can append the next chunk (i.e.
+			 * it must end on one page and begin on another, or
+			 * it must start on the same address as the previous
+			 * entry ended.
+			 */
+			if (unlikely((prev_end != sg_start) ||
+			    ((prev_end | sg_start) & ~PAGE_MASK)))
 				break;
-			
+
 			dma_len += startsg->length;
 		}
 
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 1ff1b67..e26ed2e 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -278,7 +278,7 @@ sba_dump_sg( struct ioc *ioc, struct scatterlist *startsg, int nents)
 				nents,
 				(unsigned long) sg_dma_address(startsg),
 				sg_dma_len(startsg),
-				sg_virt_addr(startsg), startsg->length);
+				sg_virt(startsg), startsg->length);
 		startsg++;
 	}
 }
@@ -945,8 +945,7 @@ sba_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 	/* Fast path single entry scatterlists. */
 	if (nents == 1) {
-		sg_dma_address(sglist) = sba_map_single(dev,
-						(void *)sg_virt_addr(sglist),
+		sg_dma_address(sglist) = sba_map_single(dev, sg_virt(sglist),
 						sglist->length, direction);
 		sg_dma_len(sglist)     = sglist->length;
 		return 1;
@@ -1025,7 +1024,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 #endif
 
 	DBG_RUN_SG("%s() START %d entries,  %p,%x\n",
-		__func__, nents, sg_virt_addr(sglist), sglist->length);
+		__func__, nents, sg_virt(sglist), sglist->length);
 
 	ioc = GET_IOC(dev);
 
-- 
2.1.4

