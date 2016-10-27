From: Helge Deller <deller@gmx.de>
Subject: [PATCH] mm, parisc: Optimize unmapped_area_topdown() allocation for
 bigger alignments
Date: Thu, 27 Oct 2016 21:56:54 +0200
Message-ID: <20161027195654.GA31972@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

(resending this patch from April 2014 to get it into patchwork)

The current implementation of unmapped_area_topdown() is very inefficient for
architectures which require an alignment bigger than PAGE_SIZE for shared
mappings. This basically affects architectures like parisc, ia64, sparc and
probably others.

When unmapped_area_topdown() is called to find a free area, the current
implementation looks for an area of size (length + align_mask). For many
architectures align_mask is 4k (=PAGE_SIZE), while others due to cache
colouring require bigger alignment masks of up to 4 MB (e.g. on parisc). In
fragmented memory situations this may lead to unmapped_area_topdown() being
unable to find even for a few bytes requested a suitable area and as such may
return out of memory.

This patch modifies the search algorithm to look for an area of the requested
size while taking the required alignment and alignment offset into account.

Tested on 32- and 64-bit parisc kernels.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/mm/mmap.c b/mm/mmap.c
index 1af87c1..f675e07 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1848,16 +1848,26 @@ unsigned long unmapped_area(struct vm_unmapped_area_info *info)
 	return gap_start;
 }
 
+/* adjust gap start address upwards to desired alignment */
+static unsigned long gap_start_round_up(unsigned long start,
+				struct vm_unmapped_area_info *info)
+{
+	if (!info->align_mask)
+		return start;
+	if ((start & info->align_mask) > info->align_offset)
+		start = ALIGN(start, info->align_mask+1) + info->align_offset;
+	else
+		start = (start & ~info->align_mask) + info->align_offset;
+	return start;
+}
+
 unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	unsigned long length, low_limit, high_limit, gap_start, gap_end;
 
-	/* Adjust search length to account for worst case alignment overhead */
-	length = info->length + info->align_mask;
-	if (length < info->length)
-		return -ENOMEM;
+	length = info->length;
 
 	/*
 	 * Adjust search limits by the desired length.
@@ -1874,8 +1884,10 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 
 	/* Check highest gap, which does not precede any rbtree node */
 	gap_start = mm->highest_vm_end;
-	if (gap_start <= high_limit)
-		goto found_highest;
+	gap_start = gap_start_round_up(gap_start, info);
+	if (gap_start <= high_limit && gap_end - gap_start >= length &&
+			gap_start < gap_end)
+		goto found;
 
 	/* Check if rbtree root looks promising */
 	if (RB_EMPTY_ROOT(&mm->mm_rb))
@@ -1887,6 +1899,7 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	while (true) {
 		/* Visit right subtree if it looks promising */
 		gap_start = vma->vm_prev ? vma->vm_prev->vm_end : 0;
+		gap_start = gap_start_round_up(gap_start, info);
 		if (gap_start <= high_limit && vma->vm_rb.rb_right) {
 			struct vm_area_struct *right =
 				rb_entry(vma->vm_rb.rb_right,
@@ -1902,7 +1915,8 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 		gap_end = vma->vm_start;
 		if (gap_end < low_limit)
 			return -ENOMEM;
-		if (gap_start <= high_limit && gap_end - gap_start >= length)
+		if (gap_start <= high_limit && gap_end - gap_start >= length &&
+				gap_start < gap_end)
 			goto found;
 
 		/* Visit left subtree if it looks promising */
@@ -1926,6 +1940,7 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 			if (prev == vma->vm_rb.rb_right) {
 				gap_start = vma->vm_prev ?
 					vma->vm_prev->vm_end : 0;
+				gap_start = gap_start_round_up(gap_start, info);
 				goto check_current;
 			}
 		}
@@ -1936,7 +1951,6 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	if (gap_end > info->high_limit)
 		gap_end = info->high_limit;
 
-found_highest:
 	/* Compute highest gap address at the desired alignment */
 	gap_end -= info->length;
 	gap_end -= (gap_end - info->align_offset) & info->align_mask;
