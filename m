From: Stoyan Gaydarov <stoyboyker@gmail.com>
Subject: [PATCH 17/25] [parisc] BUG to BUG_ON changes
Date: Tue, 10 Mar 2009 00:10:42 -0500
Message-ID: <1236661850-8237-18-git-send-email-stoyboyker@gmail.com>
References: <1236661850-8237-1-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-2-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-3-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-4-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-5-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-6-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-7-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-8-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-9-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-10-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-11-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-12-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-13-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-14-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-15-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-16-git-send-email-stoyboyker@gmail.com>
 <1236661850-8237-17-git-send-email-stoyboyker@gmail.com>
Cc: Stoyan Gaydarov <stoyboyker@gmail.com>, kyle@mcmartin.ca,
	matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1236661850-8237-17-git-send-email-stoyboyker@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Stoyan Gaydarov <stoyboyker@gmail.com>
---
 arch/parisc/kernel/pci-dma.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index df47895..2587563 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -480,8 +480,7 @@ static int pa11_dma_map_sg(struct device *dev, struct scatterlist *sglist, int n
 {
 	int i;
 
-	if (direction == DMA_NONE)
-	    BUG();
+	BUG_ON(direction == DMA_NONE);
 
 	for (i = 0; i < nents; i++, sglist++ ) {
 		unsigned long vaddr = sg_virt_addr(sglist);
@@ -496,8 +495,7 @@ static void pa11_dma_unmap_sg(struct device *dev, struct scatterlist *sglist, in
 {
 	int i;
 
-	if (direction == DMA_NONE)
-	    BUG();
+	BUG_ON(direction == DMA_NONE);
 
 	if (direction == DMA_TO_DEVICE)
 	    return;
@@ -511,16 +509,14 @@ static void pa11_dma_unmap_sg(struct device *dev, struct scatterlist *sglist, in
 
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
-- 
1.6.1.3

