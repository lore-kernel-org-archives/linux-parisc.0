Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 646AD4860
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  3 Apr 2004 19:38:12 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i342cBa18085 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 3 Apr 2004 21:38:11 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 03 Apr 2004 21:38:06 -0500
Message-Id: <1081046287.2046.460.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Eliminating our full cache flush on fork/exec
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

For those of you interested in the problem, this patch is for playing
with: it's not actually faster, it's merely demonstrating that we can
get away with flushing only the untouched page set of a user process.

There are still several potential problems:

1. Moving the flush_kernel_dcache_page() in update_mmu_cache() is
clearly an indication of something wrong.

2. The kernel isn't equivalently mapped (physaddr doesn't equal
virtaddr) so we have potential cache aliasing issues in the tlb miss
code (not sure if we can get away with this; the dreaded appendix F
implies there's no congruence modulus for equivalent mapping).

And I'm seeing periodic segfaults which are probably due to stale cache
line problems.

As far as the patch goes, the essential problem with flush_cache_mmu()
is that we may need to flush a non-current mmu.  The way the tlb miss
code works makes this rather difficult (since we only get pgd pointers
for the kernel and the current user process) so I fixed it by loading up
the space and control registers with the non-current process for the
flush and then resetting them afterwards.  It's a particularly hacky
trick, but we could also use it to fix the non-current flush_cache_page
problem which is currently killing ptrace (and gdb) performance.

James

===== arch/parisc/kernel/cache.c 1.7 vs edited =====
--- 1.7/arch/parisc/kernel/cache.c	Wed Dec 17 23:48:38 2003
+++ edited/arch/parisc/kernel/cache.c	Sat Apr  3 20:24:33 2004
@@ -71,9 +71,9 @@
 	if (VALID_PAGE(page) && page->mapping &&
 	    test_bit(PG_dcache_dirty, &page->flags)) {
 
-		flush_kernel_dcache_page(page_address(page));
 		clear_bit(PG_dcache_dirty, &page->flags);
 	}
+	flush_kernel_dcache_page(page_address(page));
 }
 
 void
@@ -293,6 +293,185 @@
 	}
 }
 EXPORT_SYMBOL(__flush_dcache_page);
+
+/* set to max pages to flush before a full flush.  Zero means no limit */
+#define MAX_FLUSH_PAGES 0
+#undef	DEBUG_PAGE_FLUSHING
+
+#ifdef DEBUG_PAGE_FLUSHING
+#define DBG(a...)	printk(a)
+#else
+#define DBG(...)
+#endif
+
+#if (MAX_FLUSH_PAGES != 0)
+
+/* we get to use the bottom 12 bits of the addr for flags since the
+ * address must be page aligned */
+#define ICACHE_FLUSH_FLAG	0x1
+
+void flush_cache_mm(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+	unsigned long count = 0, actual_count = 0;
+	unsigned long sr3 = mfsp(3), cr25 = mfctl(25);
+	unsigned long *pages;
+
+	preempt_disable();
+	if(mm != current->active_mm) {
+		DBG("flush_tlb_mm: current MM is not active ");
+		/* FIXME: awful hack: move the process the mm belongs
+		 * to temporarily to being the active one.  This only
+		 * works because we can never get back into user
+		 * context from here. */
+		mtctl(__pa(mm->pgd), 25);
+		mtsp(mm->context, 3);
+	}
+
+	pages = kmalloc(MAX_FLUSH_PAGES * sizeof(unsigned long), GFP_ATOMIC);
+	if(!pages) {
+		printk(KERN_ERR "flush_tlb_mm: allocation failed: full flush\n");
+		goto full_flush;
+	}
+
+	for (vma = mm->mmap; vma != NULL; vma = vma->vm_next) {
+		unsigned long start;
+
+		pmd_t *pmd;
+		pgd_t *pgd;
+		pte_t *pte;
+
+		count += (vma->vm_end - vma->vm_start)/PAGE_SIZE;
+
+		for (start = vma->vm_start; start < vma->vm_end;
+		     start += PAGE_SIZE) {
+			pgd = pgd_offset(mm, start);
+
+			if (pgd_none(*pgd)) {
+				start = (start & PGDIR_MASK) + PGDIR_SIZE - PAGE_SIZE;
+				continue;
+			}
+
+			pmd = pmd_offset(pgd, start);
+			if (pmd_none(*pmd)) {
+				start = (start & PMD_MASK) + PMD_SIZE - PAGE_SIZE;
+				continue;
+			}
+			pte = pte_offset_map(pmd, start);
+			if(pte_val(*pte)==0 || !pte_present(*pte))
+				continue;
+
+			/* FIXME: Here we could also skip over any
+			 * shared mapping page (i.e. equivalently
+			 * aliased) with at least one other user */
+			
+			pages[actual_count] = start;
+		 
+			if (vma->vm_flags && VM_EXEC)
+				pages[actual_count] |= ICACHE_FLUSH_FLAG;
+			if(++actual_count >= MAX_FLUSH_PAGES)
+				goto full_flush_free;
+
+		}
+	}
+			
+	DBG("FLUSHED %lu (actual %lu)\n", count, actual_count);
+	for(count = 0; count < actual_count; count++) {
+		unsigned long addr = pages[count] & PAGE_MASK;
+		flush_user_dcache_page(addr);
+		if(pages[count] & ICACHE_FLUSH_FLAG)
+			flush_user_icache_page(addr);
+	}
+ out_free:
+	kfree(pages);
+ out:
+	mtsp(sr3, 3);
+	mtctl(cr25, 25);
+	preempt_enable();
+	return;
+
+ full_flush_free:
+	DBG("flush_cache_mm: over max pages %ld (count %ld), flushing everything\n", actual_count, count);
+	flush_cache_all();
+	goto out_free;
+
+ full_flush:
+	flush_cache_all();
+	goto out;
+}
+
+#else
+
+void flush_cache_mm(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+	unsigned long count = 0, actual_count = 0;
+	unsigned long sr3 = mfsp(3), cr25 = mfctl(25);
+	static int flushed = 0;
+
+	if(unlikely(!flushed)) {
+		printk("flush_cache_mm: INIT FLUSH ALL\n");
+		flushed = 1;
+		flush_cache_all();
+		return;
+	}
+
+	preempt_disable();
+	if(mm != current->active_mm) {
+		DBG("flush_tlb_mm: current MM is not active ");
+		/* FIXME: awful hack: move the process the mm belongs
+		 * to temporarily to being the active one.  This only
+		 * works because we can never get back into user
+		 * context from here. */
+		mtctl(__pa(mm->pgd), 25);
+		mtsp(mm->context, 3);
+	}
+
+	for (vma = mm->mmap; vma != NULL; vma = vma->vm_next) {
+		unsigned long start;
+
+		pmd_t *pmd;
+		pgd_t *pgd;
+		pte_t *pte;
+
+		count += (vma->vm_end - vma->vm_start)/PAGE_SIZE;
+
+		for (start = vma->vm_start; start < vma->vm_end;
+		     start += PAGE_SIZE) {
+			pgd = pgd_offset(mm, start);
+
+			if (pgd_none(*pgd)) {
+				start = (start & PGDIR_MASK) + PGDIR_SIZE - PAGE_SIZE;
+				continue;
+			}
+
+			pmd = pmd_offset(pgd, start);
+			if (pmd_none(*pmd)) {
+				start = (start & PMD_MASK) + PMD_SIZE - PAGE_SIZE;
+				continue;
+			}
+			pte = pte_offset_map(pmd, start);
+			if(pte_val(*pte)==0 || !pte_present(*pte))
+				continue;
+
+			/* FIXME: Here we could also skip over any
+			 * shared mapping page (i.e. equivalently
+			 * aliased) with at least one other user */
+			
+			flush_user_dcache_page(start);
+			if (vma->vm_flags && VM_EXEC)
+				flush_user_icache_page(start);
+			actual_count++;
+		}
+	}
+	mtsp(sr3, 3);
+	mtctl(cr25, 25);
+	preempt_enable();
+	DBG("FLUSHED %lu (actual %lu)\n", count, actual_count);
+}
+#endif
+
+EXPORT_SYMBOL(flush_cache_mm);
 
 /* Defined in arch/parisc/kernel/pacache.S */
 EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
===== arch/parisc/kernel/pacache.S 1.4 vs edited =====
--- 1.4/arch/parisc/kernel/pacache.S	Thu Mar 11 03:05:50 2004
+++ edited/arch/parisc/kernel/pacache.S	Sat Apr  3 08:52:19 2004
@@ -574,6 +574,95 @@
 	.exit
 
 	.procend
+	
+	.export flush_user_dcache_page
+
+flush_user_dcache_page:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+	ldil    L%dcache_stride,%r1
+	ldw     R%dcache_stride(%r1),%r23
+
+#ifdef __LP64__
+	depdi,z 1,63-PAGE_SHIFT,1,%r25
+#else
+	depwi,z 1,31-PAGE_SHIFT,1,%r25
+#endif
+	add     %r26,%r25,%r25
+	sub     %r25,%r23,%r25
+
+
+1:      fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	CMPB<<  %r26,%r25,1b
+	fdc,m   %r23(%sr3,%r26)
+
+	sync
+	bv      %r0(%r2)
+	nop
+	.exit
+
+	.procend
+
+	.export flush_user_icache_page
+
+flush_user_icache_page:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+	ldil    L%dcache_stride,%r1
+	ldw     R%dcache_stride(%r1),%r23
+
+#ifdef __LP64__
+	depdi,z 1,63-PAGE_SHIFT,1,%r25
+#else
+	depwi,z 1,31-PAGE_SHIFT,1,%r25
+#endif
+	add     %r26,%r25,%r25
+	sub     %r25,%r23,%r25
+
+
+1:      fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	CMPB<<  %r26,%r25,1b
+	fic,m   %r23(%sr3,%r26)
+
+	sync
+	bv      %r0(%r2)
+	nop
+	.exit
+
+	.procend
+
 
 	.export purge_kernel_dcache_page
 
===== include/asm-parisc/cacheflush.h 1.6 vs edited =====
--- 1.6/include/asm-parisc/cacheflush.h	Thu Oct  2 02:11:59 2003
+++ edited/include/asm-parisc/cacheflush.h	Sat Apr  3 12:20:20 2004
@@ -12,7 +12,7 @@
 #ifdef CONFIG_SMP
 #define flush_cache_mm(mm) flush_cache_all()
 #else
-#define flush_cache_mm(mm) flush_cache_all_local()
+extern void flush_cache_mm(struct mm_struct *);
 #endif
 
 #define flush_kernel_dcache_range(start,size) \
===== include/asm-parisc/page.h 1.5 vs edited =====
--- 1.5/include/asm-parisc/page.h	Sat Sep 27 16:43:45 2003
+++ edited/include/asm-parisc/page.h	Sat Apr  3 19:47:09 2004
@@ -20,6 +20,8 @@
 extern void purge_kernel_dcache_page(unsigned long);
 extern void copy_user_page_asm(void *to, void *from);
 extern void clear_user_page_asm(void *page, unsigned long vaddr);
+extern void flush_user_dcache_page(unsigned long);
+extern void flush_user_icache_page(unsigned long);
 
 static inline void
 copy_user_page(void *vto, void *vfrom, unsigned long vaddr, struct page *pg)
