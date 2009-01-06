From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: BUG_ON() cleanup
Date: Tue, 06 Jan 2009 12:57:01 +0100
Message-ID: <4963470D.1030101@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

- convert a few "if (xx) BUG();" to BUG_ON(xx)
- remove a few printk()s, as we get a backtrace with BUG_ON() anyway

Signed-off-by: Helge Deller <deller@gmx.de>

 kernel/cache.c   |    5 +----
 kernel/pci-dma.c |   22 ++++++----------------
 mm/init.c        |    6 ++----
 3 files changed, 9 insertions(+), 24 deletions(-)


diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 5259d8c..837530e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -551,10 +551,7 @@ void flush_cache_range(struct vm_area_struct *vma,
 {
 	int sr3;
 
-	if (!vma->vm_mm->context) {
-		BUG();
-		return;
-	}
+	BUG_ON(!vma->vm_mm->context);
 
 	sr3 = mfsp(3);
 	if (vma->vm_mm->context == sr3) {
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index ccd61b9..7fae3a8 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -447,10 +447,7 @@ static void pa11_dma_free_consistent (struct device *dev, size_t size, void *vad
 
 static dma_addr_t pa11_dma_map_single(struct device *dev, void *addr, size_t size, enum dma_data_direction direction)
 {
-	if (direction == DMA_NONE) {
-		printk(KERN_ERR "pa11_dma_map_single(PCI_DMA_NONE) called by %p\n", __builtin_return_address(0));
-		BUG();
-	}
+	BUG_ON(direction == DMA_NONE);
 
 	flush_kernel_dcache_range((unsigned long) addr, size);
 	return virt_to_phys(addr);
@@ -458,10 +455,7 @@ static dma_addr_t pa11_dma_map_single(struct device *dev, void *addr, size_t siz
 
 static void pa11_dma_unmap_single(struct device *dev, dma_addr_t dma_handle, size_t size, enum dma_data_direction direction)
 {
-	if (direction == DMA_NONE) {
-		printk(KERN_ERR "pa11_dma_unmap_single(PCI_DMA_NONE) called by %p\n", __builtin_return_address(0));
-		BUG();
-	}
+	BUG_ON(direction == DMA_NONE);
 
 	if (direction == DMA_TO_DEVICE)
 	    return;
@@ -480,8 +474,7 @@ static int pa11_dma_map_sg(struct device *dev, struct scatterlist *sglist, int n
 {
 	int i;
 
-	if (direction == DMA_NONE)
-	    BUG();
+	BUG_ON(direction == DMA_NONE);
 
 	for (i = 0; i < nents; i++, sglist++ ) {
 		unsigned long vaddr = sg_virt_addr(sglist);
@@ -496,8 +489,7 @@ static void pa11_dma_unmap_sg(struct device *dev, struct scatterlist *sglist, in
 {
 	int i;
 
-	if (direction == DMA_NONE)
-	    BUG();
+	BUG_ON(direction == DMA_NONE);
 
 	if (direction == DMA_TO_DEVICE)
 	    return;
@@ -511,16 +503,14 @@ static void pa11_dma_unmap_sg(struct device *dev, struct scatterlist *sglist, in
 
 static void pa11_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle, unsigned long offset, size_t size, enum dma_data_direction direction)
 {
-	if (direction == DMA_NONE)
-	    BUG();
+	BUG_ON(direction == DMA_NONE);
 
 	flush_kernel_dcache_range((unsigned long) phys_to_virt(dma_handle) + offset, size);
 }
 
 static void pa11_dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle, unsigned long offset, size_t size, enum dma_data_direction direction)
 {
-	if (direction == DMA_NONE)
-	    BUG();
+	BUG_ON(direction == DMA_NONE);
 
 	flush_kernel_dcache_range((unsigned long) phys_to_virt(dma_handle) + offset, size);
 }
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 7c155c2..9d704d9 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -304,10 +304,8 @@ static void __init setup_bootmem(void)
 	 */
 	max_low_pfn = max_pfn;
 
-	if ((bootmap_pfn - bootmap_start_pfn) != bootmap_pages) {
-		printk(KERN_WARNING "WARNING! bootmap sizing is messed up!\n");
-		BUG();
-	}
+	/* bootmap sizing messed up? */
+	BUG_ON((bootmap_pfn - bootmap_start_pfn) != bootmap_pages);
 
 	/* reserve PAGE0 pdc memory, kernel text/data/bss & bootmap */
 
