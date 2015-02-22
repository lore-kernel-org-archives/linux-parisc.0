From: Joe Perches <joe@perches.com>
Subject: [PATCH 26/27] parisc: Remove use of seq_printf return value
Date: Sat, 21 Feb 2015 18:53:53 -0800
Message-ID: <6d1a41cdfcec61f6a74e5cbc067be5ee94b2ac9f.1424573328.git.joe@perches.com>
References: <cover.1424573328.git.joe@perches.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1424573328.git.joe@perches.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The seq_printf return value, because it's frequently misused,
will eventually be converted to void.

See: commit 1f33c41c03da ("seq_file: Rename seq_overflow() to
     seq_has_overflowed() and make public")

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/parisc/ccio-dma.c  | 54 ++++++++++++++---------------
 drivers/parisc/sba_iommu.c | 86 ++++++++++++++++++++++------------------------
 2 files changed, 68 insertions(+), 72 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 8b490d7..6bc1680 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1021,7 +1021,6 @@ static struct hppa_dma_ops ccio_ops = {
 #ifdef CONFIG_PROC_FS
 static int ccio_proc_info(struct seq_file *m, void *p)
 {
-	int len = 0;
 	struct ioc *ioc = ioc_list;
 
 	while (ioc != NULL) {
@@ -1031,22 +1030,22 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 		int j;
 #endif
 
-		len += seq_printf(m, "%s\n", ioc->name);
+		seq_printf(m, "%s\n", ioc->name);
 		
-		len += seq_printf(m, "Cujo 2.0 bug    : %s\n",
-				  (ioc->cujo20_bug ? "yes" : "no"));
+		seq_printf(m, "Cujo 2.0 bug    : %s\n",
+			   (ioc->cujo20_bug ? "yes" : "no"));
 		
-		len += seq_printf(m, "IO PDIR size    : %d bytes (%d entries)\n",
-			       total_pages * 8, total_pages);
+		seq_printf(m, "IO PDIR size    : %d bytes (%d entries)\n",
+			   total_pages * 8, total_pages);
 
 #ifdef CCIO_COLLECT_STATS
-		len += seq_printf(m, "IO PDIR entries : %ld free  %ld used (%d%%)\n",
-				  total_pages - ioc->used_pages, ioc->used_pages,
-				  (int)(ioc->used_pages * 100 / total_pages));
+		seq_printf(m, "IO PDIR entries : %ld free  %ld used (%d%%)\n",
+			   total_pages - ioc->used_pages, ioc->used_pages,
+			   (int)(ioc->used_pages * 100 / total_pages));
 #endif
 
-		len += seq_printf(m, "Resource bitmap : %d bytes (%d pages)\n", 
-				  ioc->res_size, total_pages);
+		seq_printf(m, "Resource bitmap : %d bytes (%d pages)\n",
+			   ioc->res_size, total_pages);
 
 #ifdef CCIO_COLLECT_STATS
 		min = max = ioc->avg_search[0];
@@ -1058,26 +1057,26 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 				min = ioc->avg_search[j];
 		}
 		avg /= CCIO_SEARCH_SAMPLE;
-		len += seq_printf(m, "  Bitmap search : %ld/%ld/%ld (min/avg/max CPU Cycles)\n",
-				  min, avg, max);
+		seq_printf(m, "  Bitmap search : %ld/%ld/%ld (min/avg/max CPU Cycles)\n",
+			   min, avg, max);
 
-		len += seq_printf(m, "pci_map_single(): %8ld calls  %8ld pages (avg %d/1000)\n",
-				  ioc->msingle_calls, ioc->msingle_pages,
-				  (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
+		seq_printf(m, "pci_map_single(): %8ld calls  %8ld pages (avg %d/1000)\n",
+			   ioc->msingle_calls, ioc->msingle_pages,
+			   (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
 
 		/* KLUGE - unmap_sg calls unmap_single for each mapped page */
 		min = ioc->usingle_calls - ioc->usg_calls;
 		max = ioc->usingle_pages - ioc->usg_pages;
-		len += seq_printf(m, "pci_unmap_single: %8ld calls  %8ld pages (avg %d/1000)\n",
-				  min, max, (int)((max * 1000)/min));
+		seq_printf(m, "pci_unmap_single: %8ld calls  %8ld pages (avg %d/1000)\n",
+			   min, max, (int)((max * 1000)/min));
  
-		len += seq_printf(m, "pci_map_sg()    : %8ld calls  %8ld pages (avg %d/1000)\n",
-				  ioc->msg_calls, ioc->msg_pages,
-				  (int)((ioc->msg_pages * 1000)/ioc->msg_calls));
+		seq_printf(m, "pci_map_sg()    : %8ld calls  %8ld pages (avg %d/1000)\n",
+			   ioc->msg_calls, ioc->msg_pages,
+			   (int)((ioc->msg_pages * 1000)/ioc->msg_calls));
 
-		len += seq_printf(m, "pci_unmap_sg()  : %8ld calls  %8ld pages (avg %d/1000)\n\n\n",
-				  ioc->usg_calls, ioc->usg_pages,
-				  (int)((ioc->usg_pages * 1000)/ioc->usg_calls));
+		seq_printf(m, "pci_unmap_sg()  : %8ld calls  %8ld pages (avg %d/1000)\n\n\n",
+			   ioc->usg_calls, ioc->usg_pages,
+			   (int)((ioc->usg_pages * 1000)/ioc->usg_calls));
 #endif	/* CCIO_COLLECT_STATS */
 
 		ioc = ioc->next;
@@ -1101,7 +1100,6 @@ static const struct file_operations ccio_proc_info_fops = {
 
 static int ccio_proc_bitmap_info(struct seq_file *m, void *p)
 {
-	int len = 0;
 	struct ioc *ioc = ioc_list;
 
 	while (ioc != NULL) {
@@ -1110,11 +1108,11 @@ static int ccio_proc_bitmap_info(struct seq_file *m, void *p)
 
 		for (j = 0; j < (ioc->res_size / sizeof(u32)); j++) {
 			if ((j & 7) == 0)
-				len += seq_puts(m, "\n   ");
-			len += seq_printf(m, "%08x", *res_ptr);
+				seq_puts(m, "\n   ");
+			seq_printf(m, "%08x", *res_ptr);
 			res_ptr++;
 		}
-		len += seq_puts(m, "\n\n");
+		seq_puts(m, "\n\n");
 		ioc = ioc->next;
 		break; /* XXX - remove me */
 	}
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 1ff1b67..f074712 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1774,37 +1774,35 @@ static int sba_proc_info(struct seq_file *m, void *p)
 #ifdef SBA_COLLECT_STATS
 	unsigned long avg = 0, min, max;
 #endif
-	int i, len = 0;
-
-	len += seq_printf(m, "%s rev %d.%d\n",
-		sba_dev->name,
-		(sba_dev->hw_rev & 0x7) + 1,
-		(sba_dev->hw_rev & 0x18) >> 3
-		);
-	len += seq_printf(m, "IO PDIR size    : %d bytes (%d entries)\n",
-		(int) ((ioc->res_size << 3) * sizeof(u64)), /* 8 bits/byte */
-		total_pages);
-
-	len += seq_printf(m, "Resource bitmap : %d bytes (%d pages)\n", 
-		ioc->res_size, ioc->res_size << 3);   /* 8 bits per byte */
-
-	len += seq_printf(m, "LMMIO_BASE/MASK/ROUTE %08x %08x %08x\n",
-		READ_REG32(sba_dev->sba_hpa + LMMIO_DIST_BASE),
-		READ_REG32(sba_dev->sba_hpa + LMMIO_DIST_MASK),
-		READ_REG32(sba_dev->sba_hpa + LMMIO_DIST_ROUTE)
-		);
+	int i;
+
+	seq_printf(m, "%s rev %d.%d\n",
+		   sba_dev->name,
+		   (sba_dev->hw_rev & 0x7) + 1,
+		   (sba_dev->hw_rev & 0x18) >> 3);
+	seq_printf(m, "IO PDIR size    : %d bytes (%d entries)\n",
+		   (int)((ioc->res_size << 3) * sizeof(u64)), /* 8 bits/byte */
+		   total_pages);
+
+	seq_printf(m, "Resource bitmap : %d bytes (%d pages)\n",
+		   ioc->res_size, ioc->res_size << 3);   /* 8 bits per byte */
+
+	seq_printf(m, "LMMIO_BASE/MASK/ROUTE %08x %08x %08x\n",
+		   READ_REG32(sba_dev->sba_hpa + LMMIO_DIST_BASE),
+		   READ_REG32(sba_dev->sba_hpa + LMMIO_DIST_MASK),
+		   READ_REG32(sba_dev->sba_hpa + LMMIO_DIST_ROUTE));
 
 	for (i=0; i<4; i++)
-		len += seq_printf(m, "DIR%d_BASE/MASK/ROUTE %08x %08x %08x\n", i,
-			READ_REG32(sba_dev->sba_hpa + LMMIO_DIRECT0_BASE  + i*0x18),
-			READ_REG32(sba_dev->sba_hpa + LMMIO_DIRECT0_MASK  + i*0x18),
-			READ_REG32(sba_dev->sba_hpa + LMMIO_DIRECT0_ROUTE + i*0x18)
-		);
+		seq_printf(m, "DIR%d_BASE/MASK/ROUTE %08x %08x %08x\n",
+			   i,
+			   READ_REG32(sba_dev->sba_hpa + LMMIO_DIRECT0_BASE  + i*0x18),
+			   READ_REG32(sba_dev->sba_hpa + LMMIO_DIRECT0_MASK  + i*0x18),
+			   READ_REG32(sba_dev->sba_hpa + LMMIO_DIRECT0_ROUTE + i*0x18));
 
 #ifdef SBA_COLLECT_STATS
-	len += seq_printf(m, "IO PDIR entries : %ld free  %ld used (%d%%)\n",
-		total_pages - ioc->used_pages, ioc->used_pages,
-		(int) (ioc->used_pages * 100 / total_pages));
+	seq_printf(m, "IO PDIR entries : %ld free  %ld used (%d%%)\n",
+		   total_pages - ioc->used_pages, ioc->used_pages,
+		   (int)(ioc->used_pages * 100 / total_pages));
 
 	min = max = ioc->avg_search[0];
 	for (i = 0; i < SBA_SEARCH_SAMPLE; i++) {
@@ -1813,26 +1811,26 @@ static int sba_proc_info(struct seq_file *m, void *p)
 		if (ioc->avg_search[i] < min) min = ioc->avg_search[i];
 	}
 	avg /= SBA_SEARCH_SAMPLE;
-	len += seq_printf(m, "  Bitmap search : %ld/%ld/%ld (min/avg/max CPU Cycles)\n",
-		min, avg, max);
+	seq_printf(m, "  Bitmap search : %ld/%ld/%ld (min/avg/max CPU Cycles)\n",
+		   min, avg, max);
 
-	len += seq_printf(m, "pci_map_single(): %12ld calls  %12ld pages (avg %d/1000)\n",
-		ioc->msingle_calls, ioc->msingle_pages,
-		(int) ((ioc->msingle_pages * 1000)/ioc->msingle_calls));
+	seq_printf(m, "pci_map_single(): %12ld calls  %12ld pages (avg %d/1000)\n",
+		   ioc->msingle_calls, ioc->msingle_pages,
+		   (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
 
 	/* KLUGE - unmap_sg calls unmap_single for each mapped page */
 	min = ioc->usingle_calls;
 	max = ioc->usingle_pages - ioc->usg_pages;
-	len += seq_printf(m, "pci_unmap_single: %12ld calls  %12ld pages (avg %d/1000)\n",
-		min, max, (int) ((max * 1000)/min));
+	seq_printf(m, "pci_unmap_single: %12ld calls  %12ld pages (avg %d/1000)\n",
+		   min, max, (int)((max * 1000)/min));
 
-	len += seq_printf(m, "pci_map_sg()    : %12ld calls  %12ld pages (avg %d/1000)\n",
-		ioc->msg_calls, ioc->msg_pages, 
-		(int) ((ioc->msg_pages * 1000)/ioc->msg_calls));
+	seq_printf(m, "pci_map_sg()    : %12ld calls  %12ld pages (avg %d/1000)\n",
+		   ioc->msg_calls, ioc->msg_pages,
+		   (int)((ioc->msg_pages * 1000)/ioc->msg_calls));
 
-	len += seq_printf(m, "pci_unmap_sg()  : %12ld calls  %12ld pages (avg %d/1000)\n",
-		ioc->usg_calls, ioc->usg_pages,
-		(int) ((ioc->usg_pages * 1000)/ioc->usg_calls));
+	seq_printf(m, "pci_unmap_sg()  : %12ld calls  %12ld pages (avg %d/1000)\n",
+		   ioc->usg_calls, ioc->usg_pages,
+		   (int)((ioc->usg_pages * 1000)/ioc->usg_calls));
 #endif
 
 	return 0;
@@ -1858,14 +1856,14 @@ sba_proc_bitmap_info(struct seq_file *m, void *p)
 	struct sba_device *sba_dev = sba_list;
 	struct ioc *ioc = &sba_dev->ioc[0];	/* FIXME: Multi-IOC support! */
 	unsigned int *res_ptr = (unsigned int *)ioc->res_map;
-	int i, len = 0;
+	int i;
 
 	for (i = 0; i < (ioc->res_size/sizeof(unsigned int)); ++i, ++res_ptr) {
 		if ((i & 7) == 0)
-			len += seq_printf(m, "\n   ");
-		len += seq_printf(m, " %08x", *res_ptr);
+			seq_puts(m, "\n   ");
+		seq_printf(m, " %08x", *res_ptr);
 	}
-	len += seq_printf(m, "\n");
+	seq_putc(m, '\n');
 
 	return 0;
 }
-- 
2.1.2
