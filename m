From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fixes and cleanups in page cache flushing (3/4)
Date: Mon, 4 Feb 2013 00:01:47 +0100
Message-ID: <20130203230147.GC14573@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Author: John David Anglin <dave.anglin@bell.net>

flush_cache_mm, for the non current case also uses flush_dcache_page_asm
and flush_icache_page_asm which are TMPALIAS flushes.

For the non current case, the algorithm used by get_ptep is derived from the
vmalloc_to_page implementation in vmalloc.c.  It is essentially a generic page
table lookup.  The other alternative was to duplicate the lookup in entry.S.
The break point for switching to a full cache flush is somewhat arbitrary.  The
same approach is used in flush_cache_range for non current case.  In a GCC
build and check, many small programs are executed and this change provided a
significant performance enhancement, e.g. GCC build time was cut almost in half
on a rp3440 at j4.  Previously, we always flushed the entire cache.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index b89a85a..bce3b85 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -476,8 +476,66 @@ void flush_cache_all(void)
 	on_each_cpu(cacheflush_h_tmp_function, NULL, 1);
 }
 
+static inline unsigned long mm_total_size(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+	unsigned long usize = 0;
+
+	for (vma = mm->mmap; vma; vma = vma->vm_next)
+		usize += vma->vm_end - vma->vm_start;
+	return usize;
+}
+
+static inline pte_t *get_ptep(pgd_t *pgd, unsigned long addr)
+{
+	pte_t *ptep = NULL;
+
+	if (!pgd_none(*pgd)) {
+		pud_t *pud = pud_offset(pgd, addr);
+		if (!pud_none(*pud)) {
+			pmd_t *pmd = pmd_offset(pud, addr);
+			if (!pmd_none(*pmd))
+				ptep = pte_offset_map(pmd, addr);
+		}
+	}
+	return ptep;
+}
+
 void flush_cache_mm(struct mm_struct *mm)
 {
+	/* Flushing the whole cache on each cpu takes forever on
+	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
+	if (mm_total_size(mm) < parisc_cache_flush_threshold) {
+		struct vm_area_struct *vma;
+
+		if (mm->context == mfsp(3)) {
+			for (vma = mm->mmap; vma; vma = vma->vm_next) {
+				flush_user_dcache_range_asm(vma->vm_start,
+					vma->vm_end);
+				if (vma->vm_flags & VM_EXEC)
+					flush_user_icache_range_asm(
+					  vma->vm_start, vma->vm_end);
+			}
+		} else {
+			pgd_t *pgd = mm->pgd;
+
+			for (vma = mm->mmap; vma; vma = vma->vm_next) {
+				unsigned long addr;
+
+				for (addr = vma->vm_start; addr < vma->vm_end;
+				     addr += PAGE_SIZE) {
+					pte_t *ptep = get_ptep(pgd, addr);
+					if (ptep != NULL) {
+						pte_t pte = *ptep;
+						__flush_cache_page(vma, addr,
+						  page_to_phys(pte_page(pte)));
+					}
+				}
+			}
+		}
+		return;
+	}
+
 #ifdef CONFIG_SMP
 	flush_cache_all();
 #else
@@ -503,20 +561,36 @@ flush_user_icache_range(unsigned long start, unsigned long end)
 		flush_instruction_cache();
 }
 
-
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
-	int sr3;
-
 	BUG_ON(!vma->vm_mm->context);
 
-	sr3 = mfsp(3);
-	if (vma->vm_mm->context == sr3) {
-		flush_user_dcache_range(start,end);
-		flush_user_icache_range(start,end);
+	if ((end - start) < parisc_cache_flush_threshold) {
+		if (vma->vm_mm->context == mfsp(3)) {
+			flush_user_dcache_range_asm(start, end);
+			if (vma->vm_flags & VM_EXEC)
+				flush_user_icache_range_asm(start, end);
+		} else {
+			unsigned long addr;
+			pgd_t *pgd = vma->vm_mm->pgd;
+
+			for (addr = start & PAGE_MASK; addr < end;
+			     addr += PAGE_SIZE) {
+				pte_t *ptep = get_ptep(pgd, addr);
+				if (ptep != NULL) {
+					pte_t pte = *ptep;
+					flush_cache_page(vma,
+					   addr, pte_pfn(pte));
+				}
+			}
+		}
 	} else {
+#ifdef CONFIG_SMP
 		flush_cache_all();
+#else
+		flush_cache_all_local();
+#endif
 	}
 }
 
