Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41ED74851
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Apr 2004 18:20:29 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3I0KRa13024 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Apr 2004 20:20:27 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 17 Apr 2004 19:20:26 -0500
Message-Id: <1082247627.1969.3.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Another cache flush & fork/exec speedup
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This one still has problems.  It's self hosting, but it falls over under
heavy stress (with segfaults that seem to be related to COW).

So, treat it with caution.

The benchmarks show that the fork/exec time has basically been cut in
half in this incarnation.

My next task will be to instrument the kernel page flushing like the
user one has been done.

After this it's the hard tasks:

1. Alter the page table layout to recover an extra flag for separate I/D
cache flushing
2. work out a scheme for doing last man out flushes of congruently
mapped shared pages.

James

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1792  -> 1.1796 
#	         mm/fremap.c	1.16    -> 1.18   
#	include/asm-parisc/cache.h	1.6     -> 1.7    
#	arch/parisc/kernel/pacache.S	1.5     -> 1.6    
#	include/asm-parisc/page.h	1.5     -> 1.8    
#	arch/parisc/kernel/entry.S	1.14    -> 1.17   
#	arch/parisc/kernel/cache.c	1.12    -> 1.14   
#	         mm/memory.c	1.154   -> 1.156  
#	include/asm-parisc/tlb.h	1.1     -> 1.2    
#	arch/parisc/kernel/sys_parisc.c	1.17    -> 1.18   
#	include/asm-parisc/pgtable.h	1.16    -> 1.17   
#	include/asm-parisc/cacheflush.h	1.9     -> 1.12   
#	arch/parisc/kernel/signal.c	1.14    -> 1.15   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 04/04/14	jejb@raven.il.steeleye.com	1.1790.1.1
# ICI
# --------------------------------------------
# 04/04/14	jejb@raven.il.steeleye.com	1.1793
# hand
# --------------------------------------------
# 04/04/15	jejb@raven.il.steeleye.com	1.1794
# First draft of working stingy cache flushing
# --------------------------------------------
# 04/04/16	jejb@raven.il.steeleye.com	1.1795
# More clean ups
# --------------------------------------------
# 04/04/16	jejb@raven.il.steeleye.com	1.1796
# Fix flushing
# 
# - eliminate flush_icache_page()
# - make copy_user_page do correct flushing
# --------------------------------------------
#
diff -Nru a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
--- a/arch/parisc/kernel/cache.c	Sat Apr 17 19:16:12 2004
+++ b/arch/parisc/kernel/cache.c	Sat Apr 17 19:16:12 2004
@@ -230,6 +230,7 @@
 void __flush_dcache_page(struct page *page)
 {
 	struct list_head *l;
+	pte_t *pte;
 
 	flush_kernel_dcache_page(page_address(page));
 
@@ -260,9 +261,10 @@
 		 * have to find a congruent address with an existing
 		 * translation */
 
-		if (!translation_exists(mpnt, addr))
+		if (!(pte = translation_exists(mpnt, addr)))
 			continue;
 
+		pte_clear_flush(pte);
 		__flush_cache_page(mpnt, addr);
 
 		/* If we find an address to flush, that will also
@@ -293,15 +295,205 @@
 		/* This is just for speed.  If the page translation isn't
 		 * there there's no point exciting the nadtlb handler into
 		 * a nullification frenzy */
-		if(!translation_exists(mpnt, addr))
+		if(!(pte = translation_exists(mpnt, addr)))
 			continue;
 
+		pte_clear_flush(pte);
 		__flush_cache_page(mpnt, addr);
 
 		return;
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
+			if (vma->vm_flags & VM_EXEC)
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
+		if(pages[count] & ICACHE_FLUSH_FLAG) {
+			flush_user_icache_page(addr);
+			pitlb_user(addr);
+		}
+		pdtlb_user(addr);
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
+#if 1
+	static int flushed = 0;
+
+	if(unlikely(!flushed)) {
+		printk("flush_cache_mm: INIT FLUSH ALL\n");
+		flushed = 1;
+		flush_cache_all();
+		return;
+	}
+#endif
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
+			if(!pte_flush(*pte))
+				continue;
+
+			/* FIXME: Here we could also skip over any
+			 * shared mapping page (i.e. equivalently
+			 * aliased) with at least one other user */
+			pte_clear_flush(pte);
+			flush_user_dcache_page(start);
+			if (vma->vm_flags & VM_EXEC) {
+				flush_user_icache_page(start);
+				pitlb_user(start);
+			}
+			pdtlb_user(start);
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
diff -Nru a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
--- a/arch/parisc/kernel/entry.S	Sat Apr 17 19:16:12 2004
+++ b/arch/parisc/kernel/entry.S	Sat Apr 17 19:16:12 2004
@@ -49,7 +49,6 @@
 	.level 2.0
 #endif
 
-	.import         pa_dbit_lock,data
 
 	/* space_to_prot macro creates a prot id from a space id */
 
@@ -1017,6 +1016,10 @@
 	or		t1,pte,t0	/* t0 has R bit set */
 	and,*<>         t1,pte,%r0      /* test and nullify if already set */
 	std             t0,0(ptp)       /* write back pte */
+	ldi		_PAGE_FLUSH,t1
+	or		t1,t0,t0
+	and,*<>		t1,pte,%r0
+	std		t0,0(ptp)
 
 	space_to_prot   spc prot        /* create prot id from space */
 	depd            pte,8,7,prot    /* add in prot bits from pte */
@@ -1093,7 +1096,7 @@
 	shladd           t0,3,ptp,ptp
 	ldi		_PAGE_ACCESSED,t1
 	ldd              0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,nadtlb_check_flush_20w
+	bb,>=,n          pte,_PAGE_PRESENT_BIT,nadtlb_emulate
 
 	space_to_prot   spc prot        /* create prot id from space */
 	depd            pte,8,7,prot    /* add in prot bits from pte */
@@ -1112,23 +1115,6 @@
 	rfir
 	nop
 
-nadtlb_check_flush_20w:
-	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
-
-	/* Insert a "flush only" translation */
-
-	depdi,z         7,7,3,prot
-	depdi           1,10,1,prot
-
-	/* Get rid of prot bits and convert to page addr for idtlbt */
-
-	depdi		0,63,12,pte
-	extrd,u         pte,56,52,pte
-	idtlbt          pte,prot
-
-	rfir
-	nop
-
 #else
 
 dtlb_miss_11:
@@ -1514,6 +1500,10 @@
 	or		t1,pte,t0	/* t0 has R bit set */
 	and,*<>         t1,pte,%r0      /* test and nullify if already set */
 	std             t0,0(ptp)       /* write back pte */
+	ldi		_PAGE_FLUSH,t1
+	or		t1,t0,t0
+	and,*<>		t1,pte,%r0
+	std		t0,0(ptp)
 
 	space_to_prot   spc prot        /* create prot id from space */
 	depd            pte,8,7,prot    /* add in prot bits from pte */
diff -Nru a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
--- a/arch/parisc/kernel/pacache.S	Sat Apr 17 19:16:12 2004
+++ b/arch/parisc/kernel/pacache.S	Sat Apr 17 19:16:12 2004
@@ -308,6 +308,24 @@
 

 1:
+#ifdef __LP64__
+	ldd 0(%r25),%r19
+	ldd 8(%r25),%r20
+	ldd 16(%r25),%r21
+	ldd 24(%r25),%r22
+	std %r19,0(%r26)
+	std %r20,8(%r26)
+	std %r21,16(%r26)
+	std %r22,24(%r26)
+	ldd 32(%r25),%r19
+	ldd 40(%r25),%r20
+	ldd 48(%r25),%r21
+	ldd 56(%r25),%r22
+	std %r19,32(%r26)
+	std %r20,40(%r26)
+	std %r21,48(%r26)
+	std %r22,56(%r26)
+#else
 	ldw 0(%r25),%r19
 	ldw 4(%r25),%r20
 	ldw 8(%r25),%r21
@@ -340,6 +358,7 @@
 	stw %r20,52(%r26)
 	stw %r21,56(%r26)
 	stw %r22,60(%r26)
+#endif
 	ldo 64(%r26),%r26
 	ADDIB>  -1,%r1,1b
 	ldo 64(%r25),%r25
@@ -375,7 +394,6 @@
  *          %r23 physical page (shifted for tlb insert) of "from" translation
  */
 
-#if 0
 
 	/*
 	 * We can't do this since copy_user_page is used to bring in
@@ -390,9 +408,9 @@
 	 * lobby for such a change.
 	 */
 
-	.export copy_user_page_asm,code
+	.export copy_user_page_vaddr_asm,code
 
-copy_user_page_asm:
+copy_user_page_vaddr_asm:
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -436,6 +454,24 @@
 

 1:
+#ifdef __LP64__
+	ldd 0(%r29),%r19
+	ldd 8(%r29),%r20
+	ldd 16(%r29),%r21
+	ldd 24(%r29),%r22
+	std %r19,0(%r28)
+	std %r20,8(%r28)
+	std %r21,16(%r28)
+	std %r22,24(%r28)
+	ldd 32(%r29),%r19
+	ldd 40(%r29),%r20
+	ldd 48(%r29),%r21
+	ldd 56(%r29),%r22
+	std %r19,32(%r28)
+	std %r20,40(%r28)
+	std %r21,48(%r28)
+	std %r22,56(%r28)
+#else
 	ldw 0(%r29),%r19
 	ldw 4(%r29),%r20
 	ldw 8(%r29),%r21
@@ -468,6 +504,7 @@
 	stw %r20,52(%r28)
 	stw %r21,56(%r28)
 	stw %r22,60(%r28)
+#endif
 	ldo 64(%r28),%r28
 	ADDIB>  -1,%r1,1b
 	ldo 64(%r29),%r29
@@ -477,7 +514,6 @@
 	.exit
 
 	.procend
-#endif
 
 	.export clear_user_page_asm,code
 
@@ -506,6 +542,16 @@
 	ldi 64,%r1
 
 1:
+#ifdef __LP64__
+	std %r0,0(%r28)
+	std %r0,8(%r28)
+	std %r0,16(%r28)
+	std %r0,24(%r28)
+	std %r0,32(%r28)
+	std %r0,40(%r28)
+	std %r0,48(%r28)
+	std %r0,56(%r28)
+#else
 	stw %r0,0(%r28)
 	stw %r0,4(%r28)
 	stw %r0,8(%r28)
@@ -522,6 +568,7 @@
 	stw %r0,52(%r28)
 	stw %r0,56(%r28)
 	stw %r0,60(%r28)
+#endif
 	ADDIB>  -1,%r1,1b
 	ldo 64(%r28),%r28
 
diff -Nru a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
--- a/arch/parisc/kernel/signal.c	Sat Apr 17 19:16:12 2004
+++ b/arch/parisc/kernel/signal.c	Sat Apr 17 19:16:12 2004
@@ -375,10 +375,9 @@
 	}
 #endif
 
-	flush_user_dcache_range((unsigned long) &frame->tramp[0],
-			   (unsigned long) &frame->tramp[TRAMP_SIZE]);
-	flush_user_icache_range((unsigned long) &frame->tramp[0],
-			   (unsigned long) &frame->tramp[TRAMP_SIZE]);
+	__flush_cache_range(current->active_mm,
+			    (unsigned long) &frame->tramp[0],
+			    (unsigned long) &frame->tramp[TRAMP_SIZE]);
 
 	/* TRAMP Words 0-4, Lenght 5 = SIGRESTARTBLOCK_TRAMP
 	 * TRAMP Words 5-9, Length 4 = SIGRETURN_TRAMP
diff -Nru a/include/asm-parisc/cache.h b/include/asm-parisc/cache.h
--- a/include/asm-parisc/cache.h	Sat Apr 17 19:16:12 2004
+++ b/include/asm-parisc/cache.h	Sat Apr 17 19:16:12 2004
@@ -63,9 +63,11 @@
 extern int icache_stride;
 extern struct pdc_cache_info cache_info;
 
-#define pdtlb(addr)         asm volatile("pdtlb 0(%%sr1,%0)" : : "r" (addr));
-#define pitlb(addr)         asm volatile("pitlb 0(%%sr1,%0)" : : "r" (addr));
-#define pdtlb_kernel(addr)  asm volatile("pdtlb 0(%0)" : : "r" (addr));
+#define pdtlb(addr)         asm volatile("pdtlb 0(%%sr1,%0)" : : "r" (addr))
+#define pitlb(addr)         asm volatile("pitlb 0(%%sr1,%0)" : : "r" (addr))
+#define pdtlb_kernel(addr)  asm volatile("pdtlb 0(%0)" : : "r" (addr))
+#define pdtlb_user(addr)    asm volatile("pdtlb 0(%%sr3,%0)" : : "r" (addr))
+#define pitlb_user(addr)    asm volatile("pitlb 0(%%sr3,%0)" : : "r" (addr))
 
 #endif /* ! __ASSEMBLY__ */
 
diff -Nru a/include/asm-parisc/cacheflush.h b/include/asm-parisc/cacheflush.h
--- a/include/asm-parisc/cacheflush.h	Sat Apr 17 19:16:12 2004
+++ b/include/asm-parisc/cacheflush.h	Sat Apr 17 19:16:12 2004
@@ -9,11 +9,7 @@
 
 /* Cache flush operations */
 
-#ifdef CONFIG_SMP
-#define flush_cache_mm(mm) flush_cache_all()
-#else
-#define flush_cache_mm(mm) flush_cache_all_local()
-#endif
+extern void flush_cache_mm(struct mm_struct *);
 
 #define flush_kernel_dcache_range(start,size) \
 	flush_kernel_dcache_range_asm((start), (start)+(size));
@@ -33,52 +29,6 @@
 #define flush_cache_vmap(start, end)		flush_cache_all()
 #define flush_cache_vunmap(start, end)		flush_cache_all()
 
-/* The following value needs to be tuned and probably scaled with the
- * cache size.
- */
-
-#define FLUSH_THRESHOLD 0x80000
-
-static inline void
-flush_user_dcache_range(unsigned long start, unsigned long end)
-{
-#ifdef CONFIG_SMP
-	flush_user_dcache_range_asm(start,end);
-#else
-	if ((end - start) < FLUSH_THRESHOLD)
-		flush_user_dcache_range_asm(start,end);
-	else
-		flush_data_cache();
-#endif
-}
-
-static inline void
-flush_user_icache_range(unsigned long start, unsigned long end)
-{
-#ifdef CONFIG_SMP
-	flush_user_icache_range_asm(start,end);
-#else
-	if ((end - start) < FLUSH_THRESHOLD)
-		flush_user_icache_range_asm(start,end);
-	else
-		flush_instruction_cache();
-#endif
-}
-
-extern void __flush_dcache_page(struct page *page);
-
-static inline void flush_dcache_page(struct page *page)
-{
-	if (page->mapping && list_empty(&page->mapping->i_mmap) &&
-			list_empty(&page->mapping->i_mmap_shared)) {
-		set_bit(PG_dcache_dirty, &page->flags);
-	} else {
-		__flush_dcache_page(page);
-	}
-}
-
-#define flush_icache_page(vma,page)	do { flush_kernel_dcache_page(page_address(page)); flush_kernel_icache_page(page_address(page)); } while (0)
-
 #define flush_icache_range(s,e)		do { flush_kernel_dcache_range_asm(s,e); flush_kernel_icache_range_asm(s,e); } while (0)
 
 #define copy_to_user_page(vma, page, vaddr, dst, src, len) \
@@ -88,49 +38,31 @@
 #define copy_from_user_page(vma, page, vaddr, dst, src, len) \
 	memcpy(dst, src, len)
 
-static inline void flush_cache_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
-{
-	int sr3;
-
-	if (!vma->vm_mm->context) {
-		BUG();
-		return;
-	}
-
-	sr3 = mfsp(3);
-	if (vma->vm_mm->context == sr3) {
-		flush_user_dcache_range(start,end);
-		flush_user_icache_range(start,end);
-	} else {
-		flush_cache_all();
-	}
-}
-
 /* Simple function to work out if we have an existing address translation
  * for a user space vma. */
-static inline int translation_exists(struct vm_area_struct *vma,
-				     unsigned long addr)
+static inline pte_t *__translation_exists(struct mm_struct *mm,
+					  unsigned long addr)
 {
-	pgd_t *pgd = pgd_offset(vma->vm_mm, addr);
+	pgd_t *pgd = pgd_offset(mm, addr);
 	pmd_t *pmd;
 	pte_t *pte;
 
 	if(pgd_none(*pgd))
-		return 0;
+		return NULL;
 
 	pmd = pmd_offset(pgd, addr);
 	if(pmd_none(*pmd) || pmd_bad(*pmd))
-		return 0;
+		return NULL;
 
 	pte = pte_offset_map(pmd, addr);
 
 	/* The PA flush mappings show up as pte_none, but they're
 	 * valid none the less */
 	if(pte_none(*pte) && ((pte_val(*pte) & _PAGE_FLUSH) == 0))
-		return 0;
-	return 1;
+		return NULL;
+	return pte;
 }
+#define translation_exists(vma, addr)	__translation_exists((vma)->vm_mm, addr)
 

 /* Private function to flush a page from the cache of a non-current
@@ -157,8 +89,11 @@
 	mtsp(vma->vm_mm->context, 3);
 
 	flush_user_dcache_page(vmaddr);
-	if(vma->vm_flags & VM_EXEC)
+	if(vma->vm_flags & VM_EXEC) {
 		flush_user_icache_page(vmaddr);
+		pitlb_user(vmaddr);
+	}
+	pdtlb_user(vmaddr);
 
 	/* put the old current process back */
 	mtsp(space, 3);
@@ -171,8 +106,11 @@
 {
 	if (likely(vma->vm_mm->context == mfsp(3))) {
 		flush_user_dcache_page(vmaddr);
-		if (vma->vm_flags & VM_EXEC)
+		if (vma->vm_flags & VM_EXEC) {
 			flush_user_icache_page(vmaddr);
+			pitlb_user(vmaddr);
+		}
+		pdtlb_user(vmaddr);
 	} else {
 		flush_user_cache_page_non_current(vma, vmaddr);
 	}
@@ -181,11 +119,115 @@
 static inline void
 flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
+	pte_t *pte = translation_exists(vma, vmaddr);
+
 	BUG_ON(!vma->vm_mm->context);
 
-	if(likely(translation_exists(vma, vmaddr)))
+	if(likely(pte && !pte_flush(*pte))) {
+		pte_clear_flush(pte);
 		__flush_cache_page(vma, vmaddr);
+	}
 
 }
+
+static inline void
+flush_icache_page(struct vm_area_struct *vma, struct page *page)
+{
+}
+
+/* The following value needs to be tuned and probably scaled with the
+ * cache size.
+ */
+
+#define FLUSH_THRESHOLD 0x80000
+
+static inline void
+__flush_cache_range(struct mm_struct *mm, unsigned long start,
+		    unsigned long end)
+{
+	unsigned long vaddr;
+	pte_t *pte;
+
+	/* small range, don't bother to flush the whole page (and
+	 * thus don't mark the page as flushed */
+	if (likely(end - start < PAGE_SIZE)) {
+		flush_user_dcache_range_asm(start,end);
+		flush_user_icache_range_asm(start,end);
+		return;
+	}
+
+	for (vaddr = start & PAGE_MASK; vaddr < end; vaddr += PAGE_SIZE) {
+		if(unlikely(!(pte = __translation_exists(mm, vaddr))))
+			continue;
+
+		if (unlikely(!pte_flush(*pte)))
+			continue;
+
+		pte_clear_flush(pte);
+		flush_user_dcache_page(vaddr);
+		flush_user_icache_page(vaddr);
+		pdtlb_user(vaddr);
+		pitlb_user(vaddr);
+	}
+}
+
+static inline void flush_cache_range(struct vm_area_struct *vma,
+				     unsigned long start, unsigned long end)
+{
+	unsigned long sr3 = mfsp(3);
+
+	BUG_ON(!vma->vm_mm->context);
+
+	if (likely(vma->vm_mm->context == sr3)) {
+		__flush_cache_range(vma->vm_mm, start, end);
+	} else {
+		unsigned long pgd = mfctl(25);
+		/* we don't mind taking interrups since they may not
+		 * do anything with user space, but we can't
+		 * be preempted here */
+		preempt_disable();
+
+		/* make us current */
+		mtctl(__pa(vma->vm_mm->pgd), 25);
+		mtsp(vma->vm_mm->context, 3);
+
+		__flush_cache_range(vma->vm_mm, start, end);
+
+		/* put the old current process back */
+		mtsp(sr3, 3);
+		mtctl(pgd, 25);
+		preempt_enable();
+
+	}
+}
+
+extern void __flush_dcache_page(struct page *page);
+
+static inline void flush_dcache_page(struct page *page)
+{
+	if (page->mapping && list_empty(&page->mapping->i_mmap) &&
+			list_empty(&page->mapping->i_mmap_shared)) {
+		set_bit(PG_dcache_dirty, &page->flags);
+	} else {
+		__flush_dcache_page(page);
+	}
+}
+
+static inline void
+copy_user_page(void *vto, void *vfrom, unsigned long vaddr, struct page *pg)
+{
+	pte_t *pte;
+	copy_user_page_asm(vto, vfrom);
+	flush_kernel_dcache_page(vto);
+	if(likely((pte = __translation_exists(current->active_mm, vaddr)) &&
+		  pte_flush(*pte))) {
+		/* no point clearing flush here, it will be set again
+		 * when the user accesses the page */
+		flush_user_dcache_page(vaddr);
+		flush_user_icache_page(vaddr);
+	}
+		
+}
+
 #endif
 
diff -Nru a/include/asm-parisc/page.h b/include/asm-parisc/page.h
--- a/include/asm-parisc/page.h	Sat Apr 17 19:16:12 2004
+++ b/include/asm-parisc/page.h	Sat Apr 17 19:16:12 2004
@@ -19,15 +19,10 @@
 
 extern void purge_kernel_dcache_page(unsigned long);
 extern void copy_user_page_asm(void *to, void *from);
+extern void copy_user_page_vaddr_asm(void *to, void *from, unsigned long vaddr);
 extern void clear_user_page_asm(void *page, unsigned long vaddr);
 
-static inline void
-copy_user_page(void *vto, void *vfrom, unsigned long vaddr, struct page *pg)
-{
-	copy_user_page_asm(vto, vfrom);
-	flush_kernel_dcache_page(vto);
-	/* XXX: ppc flushes icache too, should we? */
-}
+/* see cacheflush.h for copy_user_page */
 
 static inline void
 clear_user_page(void *page, unsigned long vaddr, struct page *pg)
diff -Nru a/include/asm-parisc/pgtable.h b/include/asm-parisc/pgtable.h
--- a/include/asm-parisc/pgtable.h	Sat Apr 17 19:16:12 2004
+++ b/include/asm-parisc/pgtable.h	Sat Apr 17 19:16:12 2004
@@ -29,15 +29,6 @@
  */
 #define kern_addr_valid(addr)	(1)
 
-/* Certain architectures need to do special things when PTEs
- * within a page table are directly modified.  Thus, the following
- * hook is made available.
- */
-#define set_pte(pteptr, pteval)                                 \
-        do{                                                     \
-                *(pteptr) = (pteval);                           \
-        } while(0)
-
 #endif /* !__ASSEMBLY__ */
 
 #define pte_ERROR(e) \
@@ -213,6 +204,15 @@
 #define __S110  PAGE_RWX
 #define __S111  PAGE_RWX
 
+/* Certain architectures need to do special things when PTEs
+ * within a page table are directly modified.  Thus, the following
+ * hook is made available.
+ */
+static inline void set_pte(pte_t *pteptr, pte_t pteval)
+{
+	*pteptr = pteval;
+}
+
 extern pgd_t swapper_pg_dir[]; /* declared in init_task.c */
 
 /* initial page tables for 0-8MB for kernel */
@@ -230,17 +230,16 @@
 
 #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
 
-#define pte_none(x)     ((pte_val(x) == 0) || (pte_val(x) & _PAGE_FLUSH))
+#define pte_none(x)     ((pte_val(x) == 0))
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
-#define pte_clear(xp)	do { pte_val(*(xp)) = 0; } while (0)
+#define pte_clear_flush(xp)	do { pte_val(*(xp)) &= ~ _PAGE_FLUSH; } while(0)
+#define pte_flush(x)	(pte_val(x) & _PAGE_FLUSH)
 
 #define pmd_none(x)	(!pmd_val(x))
 #define pmd_bad(x)	((pmd_val(x) & ~PAGE_MASK) != _PAGE_TABLE)
 #define pmd_present(x)	(pmd_val(x) & _PAGE_PRESENT)
 #define pmd_clear(xp)	do { pmd_val(*(xp)) = 0; } while (0)
 
-
-
 #ifdef __LP64__
 #define pgd_page(pgd) ((unsigned long) __va(pgd_val(pgd) & PAGE_MASK))
 
@@ -282,6 +281,13 @@
 extern inline pte_t pte_mkyoung(pte_t pte)	{ pte_val(pte) |= _PAGE_ACCESSED; return pte; }
 extern inline pte_t pte_mkwrite(pte_t pte)	{ pte_val(pte) |= _PAGE_WRITE; return pte; }
 
+static inline void pte_clear(pte_t *xp) {
+	WARN_ON(pte_flush(*xp) && pte_user(*xp));
+	pte_val(*xp) = 0;
+}
+
+
+
 /*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
@@ -402,23 +408,12 @@
 #endif
 }
 
-#ifdef CONFIG_SMP
-extern spinlock_t pa_dbit_lock;
-#else
-static int pa_dbit_lock; /* dummy to keep the compilers happy */
-#endif
-
 static inline pte_t ptep_get_and_clear(pte_t *ptep)
 {
 	pte_t old_pte;
-	pte_t pte;
 
-	spin_lock(&pa_dbit_lock);
-	pte = old_pte = *ptep;
-	pte_val(pte) &= ~_PAGE_PRESENT;
-	pte_val(pte) |= _PAGE_FLUSH;
-	set_pte(ptep,pte);
-	spin_unlock(&pa_dbit_lock);
+	old_pte = *ptep;
+	pte_clear(ptep);
 
 	return old_pte;
 }
diff -Nru a/include/asm-parisc/tlb.h b/include/asm-parisc/tlb.h
--- a/include/asm-parisc/tlb.h	Sat Apr 17 19:16:12 2004
+++ b/include/asm-parisc/tlb.h	Sat Apr 17 19:16:12 2004
@@ -7,7 +7,7 @@
 } while (0)
 
 #define tlb_start_vma(tlb, vma) \
-do {	if (!(tlb)->fullmm)	\
+do {	\
 		flush_cache_range(vma, vma->vm_start, vma->vm_end); \
 } while (0)
 
diff -Nru a/mm/memory.c b/mm/memory.c
--- a/mm/memory.c	Sat Apr 17 19:16:12 2004
+++ b/mm/memory.c	Sat Apr 17 19:16:12 2004
@@ -1035,11 +1035,13 @@
 		int reuse = can_share_swap_page(old_page);
 		unlock_page(old_page);
 		if (reuse) {
-			flush_cache_page(vma, address);
+			//flush_cache_page(vma, address);
+			flush_dcache_page(old_page);
 			entry = maybe_mkwrite(pte_mkyoung(pte_mkdirty(pte)),
 					      vma);
 			ptep_establish(vma, address, page_table, entry);
 			update_mmu_cache(vma, address, entry);
+			//flush_kernel_dcache_page(page_address(pte_page(entry)));
 			pte_unmap(page_table);
 			spin_unlock(&mm->page_table_lock);
 			return VM_FAULT_MINOR;
