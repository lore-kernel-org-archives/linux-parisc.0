Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21587482B
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 21:02:40 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3T32ba25578 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 23:02:37 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 28 Apr 2004 22:02:36 -0500
Message-Id: <1083207757.2094.293.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Cache flushing update
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This one is against 2.6.6-rc3-pa1 and should work on every pa system
type.

It seems safe: I can't actually find a stress test that breaks it.

The fork speedup varies between 50-60% depending on the machine you try
it on (the smallest speedup is on pa1.1 systems with small caches).

James

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1599  -> 1.1601 
#	         mm/fremap.c	1.17    -> 1.18   
#	include/asm-parisc/io.h	1.7     -> 1.8    
#	include/asm-parisc/cache.h	1.6     -> 1.8    
#	arch/parisc/kernel/pacache.S	1.5.1.1 -> 1.10   
#	include/asm-parisc/page.h	1.5.1.2 -> 1.9    
#	arch/parisc/kernel/entry.S	1.14.1.3 -> 1.19   
#	drivers/video/console/sticore.c	1.16    -> 1.17   
#	drivers/scsi/ncr53c8xx.c	1.39    -> 1.40   
#	include/asm-parisc/dma-mapping.h	1.7     -> 1.8    
#	arch/parisc/kernel/cache.c	1.12.1.4 -> 1.19   
#	         mm/memory.c	1.161   -> 1.162  
#	include/asm-parisc/tlb.h	1.1     -> 1.2    
#	arch/parisc/kernel/sys_parisc.c	1.17    -> 1.18   
#	include/asm-parisc/pgtable.h	1.16.1.1 -> 1.20   
#	arch/parisc/kernel/pci-dma.c	1.10    -> 1.11   
#	include/asm-parisc/cacheflush.h	1.9.1.2 -> 1.18   
#	arch/parisc/kernel/signal.c	1.14    -> 1.15   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 04/04/28	jejb@raven.il.steeleye.com	1.1600
# Merge akpm changes
# --------------------------------------------
# 04/04/28	jejb@raven.il.steeleye.com	1.1601
# Fix BK botched merge
# --------------------------------------------
#
diff -Nru a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
--- a/arch/parisc/kernel/cache.c	Wed Apr 28 21:24:13 2004
+++ b/arch/parisc/kernel/cache.c	Wed Apr 28 21:24:13 2004
@@ -68,12 +68,14 @@
 {
 	struct page *page = pte_page(pte);
 
-	if (VALID_PAGE(page) && page_mapping(page) &&
-	    test_bit(PG_dcache_dirty, &page->flags)) {
-
+	if (VALID_PAGE(page))
+		/* We used to check to see if the page needed flushing here.
+		 * Now this API automatically detects whether the page
+		 * needs flushing or not.  This is used to defer calls to
+		 * kernel page flushing until mmu update time.
+		 *
+		 * DO NOT REMOVE OR CONDITIONALISE THIS */
 		flush_kernel_dcache_page(page_address(page));
-		clear_bit(PG_dcache_dirty, &page->flags);
-	}
 }
 
 void
@@ -231,6 +233,7 @@
 {
 	struct address_space *mapping = page_mapping(page);
 	struct list_head *l;
+	pte_t *pte;
 
 	flush_kernel_dcache_page(page_address(page));
 
@@ -261,10 +264,11 @@
 		 * have to find a congruent address with an existing
 		 * translation */
 
-		if (!translation_exists(mpnt, addr))
+		if (!(pte = translation_exists(mpnt, addr)))
 			continue;
 
-		__flush_cache_page(mpnt, addr);
+
+		__flush_cache_page(pte, mpnt, addr);
 
 		/* If we find an address to flush, that will also
 		 * bring all the private mappings up to date (see
@@ -294,18 +298,209 @@
 		/* This is just for speed.  If the page translation isn't
 		 * there there's no point exciting the nadtlb handler into
 		 * a nullification frenzy */
-		if(!translation_exists(mpnt, addr))
+		if(!(pte = translation_exists(mpnt, addr)))
 			continue;
 
-		__flush_cache_page(mpnt, addr);
+		__flush_cache_page(pte, mpnt, addr);
 
 		return;
 	}
 }
 EXPORT_SYMBOL(__flush_dcache_page);
 
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
+			if(!pte_present(*pte))
+				continue;
+
+			if(!pte_flush(*pte))
+				continue;
+
+			/* FIXME: Here we could also skip over any
+			 * shared mapping page (i.e. equivalently
+			 * aliased) with at least one other user */
+			page_begin_flush(pte);
+			pdtlb_user(start);
+			flush_user_dcache_page(start);
+			if (vma->vm_flags & VM_EXEC) {
+				flush_user_icache_page(start);
+				pitlb_user(start);
+			}
+			page_end_flush(pte);
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
+
 /* Defined in arch/parisc/kernel/pacache.S */
 EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
-EXPORT_SYMBOL(flush_kernel_dcache_page);
+EXPORT_SYMBOL(__flush_kernel_dcache_page);
 EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);
diff -Nru a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
--- a/arch/parisc/kernel/entry.S	Wed Apr 28 21:24:13 2004
+++ b/arch/parisc/kernel/entry.S	Wed Apr 28 21:24:13 2004
@@ -51,7 +51,6 @@
 	.level 2.0
 #endif
 
-	.import         pa_dbit_lock,data
 
 	/* space_to_prot macro creates a prot id from a space id */
 
@@ -479,16 +478,16 @@
 	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
 	 * don't needlessly dirty the cache line if it was already set */
 	.macro		update_ptep	ptep,pte,tmp,tmp1
-	ldi		_PAGE_ACCESSED,\tmp1
+	ldi		(_PAGE_ACCESSED|_PAGE_FLUSH),\tmp1
 	or		\tmp1,\pte,\tmp
-	and,COND(<>)	\tmp1,\pte,%r0
+	andcm,COND(=)	\tmp1,\pte,%r0
 	STREG		\tmp,0(\ptep)
 	.endm
 
 	/* Set the dirty bit (and accessed bit).  No need to be
 	 * clever, this is only used from the dirty fault */
 	.macro		update_dirty	ptep,pte,tmp,tmp1
-	ldi		_PAGE_ACCESSED|_PAGE_DIRTY,\tmp
+	ldi		_PAGE_ACCESSED|_PAGE_DIRTY|_PAGE_FLUSH,\tmp
 	or		\tmp,\pte,\pte
 	STREG		\pte,0(\ptep)
 	.endm
@@ -513,9 +512,13 @@
 
 	/* PAGE_USER indicates the page can be read with user privileges,
 	 * so deposit X1|11 to PL1|PL2 (remember the upper bit of PL1
-	 * contains _PAGE_READ */
+	 * contains _PAGE_READ) */
 	extrd,u,*=      \pte,_PAGE_USER_BIT+32,1,%r0
 	depdi		7,11,3,\prot
+	/* In 2.0 we use the no cache bit exclusively for flush only
+	 * translations */
+	extrd,u,*=	\pte,_PAGE_NO_CACHE_BIT+32,1,%r0
+	depdi		1,12,1,\prot
 	/* If we're a gateway page, drop PL2 back to zero for promotion
 	 * to kernel privilege (so we can execute the page as kernel).
 	 * Any privilege promotion page always denys read and write */
@@ -1211,7 +1214,7 @@
 	get_pgd		spc,ptp
 	space_check	spc,t0,nadtlb_fault
 
-	L3_ptep		ptp,pte,t0,va,nadtlb_check_flush_20w
+	L3_ptep		ptp,pte,t0,va,nadtlb_emulate
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1222,23 +1225,6 @@
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
@@ -1295,7 +1281,7 @@
 
 	space_check	spc,t0,nadtlb_fault
 
-	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_11
+	L2_ptep		ptp,pte,t0,va,nadtlb_emulate
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1313,30 +1299,6 @@
 	rfir
 	nop
 
-nadtlb_check_flush_11:
-	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
-
-	/* Insert a "flush only" translation */
-
-	zdepi           7,7,3,prot
-	depi            1,10,1,prot
-
-	/* Get rid of prot bits and convert to page addr for idtlba */
-
-	depi		0,31,12,pte
-	extru		pte,24,25,pte
-
-	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
-	mtsp		spc,%sr1
-
-	idtlba		pte,(%sr1,va)
-	idtlbp		prot,(%sr1,va)
-
-	mtsp		t0, %sr1	/* Restore sr1 */
-
-	rfir
-	nop
-
 dtlb_miss_20:
 	space_adjust	spc,va,t0
 	get_pgd		spc,ptp
@@ -1368,7 +1330,7 @@
 
 	space_check	spc,t0,nadtlb_fault
 
-	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_20
+	L2_ptep		ptp,pte,t0,va,nadtlb_emulate
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1381,22 +1343,6 @@
 	rfir
 	nop
 
-nadtlb_check_flush_20:
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
-	extrd,u         pte,56,32,pte
-	idtlbt          pte,prot
-
-	rfir
-	nop
 #endif
 
 nadtlb_emulate:
diff -Nru a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
--- a/arch/parisc/kernel/pacache.S	Wed Apr 28 21:24:13 2004
+++ b/arch/parisc/kernel/pacache.S	Wed Apr 28 21:24:13 2004
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
@@ -371,7 +390,6 @@
  *          %r23 physical page (shifted for tlb insert) of "from" translation
  */
 
-#if 0
 
 	/*
 	 * We can't do this since copy_user_page is used to bring in
@@ -386,9 +404,9 @@
 	 * lobby for such a change.
 	 */
 
-	.export copy_user_page_asm,code
+	.export copy_user_page_vaddr_asm,code
 
-copy_user_page_asm:
+copy_user_page_vaddr_asm:
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -432,6 +450,24 @@
 

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
@@ -464,6 +500,7 @@
 	stw %r20,52(%r28)
 	stw %r21,56(%r28)
 	stw %r22,60(%r28)
+#endif
 	ldo 64(%r28),%r28
 	ADDIB>  -1,%r1,1b
 	ldo 64(%r29),%r29
@@ -473,7 +510,6 @@
 	.exit
 
 	.procend
-#endif
 
 	.export clear_user_page_asm,code
 
@@ -505,6 +541,16 @@
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
@@ -521,6 +567,7 @@
 	stw %r0,52(%r28)
 	stw %r0,56(%r28)
 	stw %r0,60(%r28)
+#endif
 	ADDIB>  -1,%r1,1b
 	ldo 64(%r28),%r28
 
@@ -530,9 +577,9 @@
 
 	.procend
 
-	.export flush_kernel_dcache_page
+	.export __flush_kernel_dcache_page
 
-flush_kernel_dcache_page:
+__flush_kernel_dcache_page:
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -541,9 +588,11 @@
 	ldw     R%dcache_stride(%r1),%r23
 
 #ifdef __LP64__
-	depdi,z 1,63-PAGE_SHIFT,1,%r25
+	depdi,z 1,63-PAGE_SHIFT,1,%r25	/* PAGE_SIZE */
+	depdi	0,63,12,%r26		/* page align */
 #else
-	depwi,z 1,31-PAGE_SHIFT,1,%r25
+	depwi,z 1,31-PAGE_SHIFT,1,%r25	/* PAGE_SIZE */
+	depwi	0,31,PAGE_SHIFT,%r26	/* page align */
 #endif
 	add     %r26,%r25,%r25
 	sub     %r25,%r23,%r25
@@ -585,9 +634,11 @@
 	ldw     R%dcache_stride(%r1),%r23
 
 #ifdef __LP64__
-	depdi,z 1,63-PAGE_SHIFT,1,%r25
+	depdi,z 1,63-PAGE_SHIFT,1,%r25  /* PAGE_SIZE into %r25 */
+	depdi	0,63,12,%r26		/* page align argument */
 #else
-	depwi,z 1,31-PAGE_SHIFT,1,%r25
+	depwi,z 1,31-PAGE_SHIFT,1,%r25	/* PAGE_SIZE */
+	depwi	0,31,12,%r26		/* Page align */
 #endif
 	add     %r26,%r25,%r25
 	sub     %r25,%r23,%r25
@@ -630,8 +681,10 @@
 
 #ifdef __LP64__
 	depdi,z 1,63-PAGE_SHIFT,1,%r25
+	depdi	0,63,12,%r26
 #else
 	depwi,z 1,31-PAGE_SHIFT,1,%r25
+	depwi	0,31,12,%r26
 #endif
 	add     %r26,%r25,%r25
 	sub     %r25,%r23,%r25
diff -Nru a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
--- a/arch/parisc/kernel/pci-dma.c	Wed Apr 28 21:24:13 2004
+++ b/arch/parisc/kernel/pci-dma.c	Wed Apr 28 21:24:13 2004
@@ -362,7 +362,7 @@
 	size = 1 << (order + PAGE_SHIFT);
 	vaddr = pcxl_alloc_range(size);
 	paddr = __get_free_pages(flag, order);
-	flush_kernel_dcache_range(paddr, size);
+	flush_kernel_dcache_range_asm(paddr, paddr + size);
 	paddr = __pa(paddr);
 	map_uncached_pages(vaddr, size, paddr);
 	*dma_handle = (dma_addr_t) paddr;
@@ -396,12 +396,13 @@
 		BUG();
 	}
 
-	flush_kernel_dcache_range((unsigned long) addr, size);
+	flush_kernel_dcache_range_asm((unsigned long) addr, (unsigned long)addr + size);
 	return virt_to_phys(addr);
 }
 
 static void pa11_dma_unmap_single(struct device *dev, dma_addr_t dma_handle, size_t size, enum dma_data_direction direction)
 {
+	unsigned long addr = (unsigned long)phys_to_virt(dma_handle);
 	if (direction == DMA_NONE) {
 		printk(KERN_ERR "pa11_dma_unmap_single(PCI_DMA_NONE) called by %p\n", __builtin_return_address(0));
 		BUG();
@@ -416,7 +417,7 @@
 	 * pci_dma_sync_single_* has been called and the buffer reused.
 	 */
 
-	flush_kernel_dcache_range((unsigned long) phys_to_virt(dma_handle), size);
+	flush_kernel_dcache_range_asm(addr, addr + size);
 	return;
 }
 
@@ -431,7 +432,7 @@
 		unsigned long vaddr = sg_virt_addr(sglist);
 		sg_dma_address(sglist) = (dma_addr_t) virt_to_phys(vaddr);
 		sg_dma_len(sglist) = sglist->length;
-		flush_kernel_dcache_range(vaddr, sglist->length);
+		flush_kernel_dcache_range_asm(vaddr, vaddr + sglist->length);
 	}
 	return nents;
 }
@@ -448,25 +449,29 @@
 
 	/* once we do combining we'll need to use phys_to_virt(sg_dma_address(sglist)) */
 
-	for (i = 0; i < nents; i++, sglist++ )
-		flush_kernel_dcache_range(sg_virt_addr(sglist), sglist->length);
+	for (i = 0; i < nents; i++, sglist++ ) {
+		unsigned long vaddr = sg_virt_addr(sglist);
+		flush_kernel_dcache_range_asm(vaddr, vaddr + sglist->length);
+	}
 	return;
 }
 
 static void pa11_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle, unsigned long offset, size_t size, enum dma_data_direction direction)
 {
+	unsigned long addr = (unsigned long)phys_to_virt(dma_handle) + offset;
 	if (direction == DMA_NONE)
 	    BUG();
 
-	flush_kernel_dcache_range((unsigned long) phys_to_virt(dma_handle) + offset, size);
+	flush_kernel_dcache_range_asm(addr, addr + size);
 }
 
 static void pa11_dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle, unsigned long offset, size_t size, enum dma_data_direction direction)
 {
+	unsigned long addr = (unsigned long)phys_to_virt(dma_handle) + offset;
 	if (direction == DMA_NONE)
 	    BUG();
 
-	flush_kernel_dcache_range((unsigned long) phys_to_virt(dma_handle) + offset, size);
+	flush_kernel_dcache_range_asm(addr, addr + size);
 }
 
 static void pa11_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sglist, int nents, enum dma_data_direction direction)
@@ -475,8 +480,10 @@
 
 	/* once we do combining we'll need to use phys_to_virt(sg_dma_address(sglist)) */
 
-	for (i = 0; i < nents; i++, sglist++ )
-		flush_kernel_dcache_range(sg_virt_addr(sglist), sglist->length);
+	for (i = 0; i < nents; i++, sglist++ ) {
+		unsigned long vaddr = sg_virt_addr(sglist);
+		flush_kernel_dcache_range_asm(vaddr, vaddr + sglist->length);
+	}
 }
 
 static void pa11_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sglist, int nents, enum dma_data_direction direction)
@@ -485,8 +492,10 @@
 
 	/* once we do combining we'll need to use phys_to_virt(sg_dma_address(sglist)) */
 
-	for (i = 0; i < nents; i++, sglist++ )
-		flush_kernel_dcache_range(sg_virt_addr(sglist), sglist->length);
+	for (i = 0; i < nents; i++, sglist++ ) {
+		unsigned long vaddr = sg_virt_addr(sglist);
+		flush_kernel_dcache_range_asm(vaddr, vaddr + sglist->length);
+	}
 }
 
 struct hppa_dma_ops pcxl_dma_ops = {
diff -Nru a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
--- a/arch/parisc/kernel/signal.c	Wed Apr 28 21:24:13 2004
+++ b/arch/parisc/kernel/signal.c	Wed Apr 28 21:24:13 2004
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
diff -Nru a/drivers/scsi/ncr53c8xx.c b/drivers/scsi/ncr53c8xx.c
--- a/drivers/scsi/ncr53c8xx.c	Wed Apr 28 21:24:13 2004
+++ b/drivers/scsi/ncr53c8xx.c	Wed Apr 28 21:24:13 2004
@@ -8621,6 +8621,7 @@
 	tpnt->sg_tablesize	= SCSI_NCR_SG_TABLESIZE;
 	tpnt->cmd_per_lun	= SCSI_NCR_CMD_PER_LUN;
 	tpnt->use_clustering	= DISABLE_CLUSTERING;
+	tpnt->max_sectors	= 8;
 
 	if (device->differential)
 		driver_setup.diff_support = device->differential;
diff -Nru a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
--- a/drivers/video/console/sticore.c	Wed Apr 28 21:24:13 2004
+++ b/drivers/video/console/sticore.c	Wed Apr 28 21:24:13 2004
@@ -237,7 +237,7 @@
 static void sti_flush(unsigned long from, unsigned long len)
 {
 	flush_data_cache();
-	flush_kernel_dcache_range(from, len);
+	flush_kernel_dcache_range(from, from+len);
 	flush_icache_range(from, from+len);
 }
 
diff -Nru a/include/asm-parisc/cache.h b/include/asm-parisc/cache.h
--- a/include/asm-parisc/cache.h	Wed Apr 28 21:24:13 2004
+++ b/include/asm-parisc/cache.h	Wed Apr 28 21:24:13 2004
@@ -46,7 +46,7 @@
 extern void flush_kernel_icache_range_asm(unsigned long, unsigned long);
 extern void flush_user_dcache_range_asm(unsigned long, unsigned long);
 extern void flush_kernel_dcache_range_asm(unsigned long, unsigned long);
-extern void flush_kernel_dcache_page(void *);
+extern void __flush_kernel_dcache_page(void *);
 extern void flush_kernel_icache_page(void *);
 extern void disable_sr_hashing(void);   /* turns off space register hashing */
 extern void disable_sr_hashing_asm(int); /* low level support for above */
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
--- a/include/asm-parisc/cacheflush.h	Wed Apr 28 21:24:13 2004
+++ b/include/asm-parisc/cacheflush.h	Wed Apr 28 21:24:13 2004
@@ -9,14 +9,7 @@
 
 /* Cache flush operations */
 
-#ifdef CONFIG_SMP
-#define flush_cache_mm(mm) flush_cache_all()
-#else
-#define flush_cache_mm(mm) flush_cache_all_local()
-#endif
-
-#define flush_kernel_dcache_range(start,size) \
-	flush_kernel_dcache_range_asm((start), (start)+(size));
+extern void flush_cache_mm(struct mm_struct *);
 
 extern void flush_cache_all_local(void);
 
@@ -33,53 +26,6 @@
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
-	struct address_space *mapping = page_mapping(page);
-
-	if (mapping && !mapping_mapped(mapping)) {
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
@@ -89,49 +35,31 @@
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
@@ -142,7 +70,7 @@
  * the handlers have to fill in from the pgd of the non-current
  * process. */
 static inline void
-flush_user_cache_page_non_current(struct vm_area_struct *vma,
+flush_user_cache_page_non_current(pte_t *pte, struct vm_area_struct *vma,
 				  unsigned long vmaddr)
 {
 	/* save the current process space and pgd */
@@ -157,9 +85,15 @@
 	mtctl(__pa(vma->vm_mm->pgd), 25);
 	mtsp(vma->vm_mm->context, 3);
 
+	page_begin_flush(pte);
+	pdtlb_user(vmaddr);
 	flush_user_dcache_page(vmaddr);
-	if(vma->vm_flags & VM_EXEC)
+	if(vma->vm_flags & VM_EXEC) {
 		flush_user_icache_page(vmaddr);
+		pitlb_user(vmaddr);
+	}
+	page_end_flush(pte);
+	pdtlb_user(vmaddr);
 
 	/* put the old current process back */
 	mtsp(space, 3);
@@ -168,25 +102,165 @@
 }
 
 static inline void
-__flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
+__flush_cache_page(pte_t *pte, struct vm_area_struct *vma,
+		   unsigned long vmaddr)
 {
 	if (likely(vma->vm_mm->context == mfsp(3))) {
+		page_begin_flush(pte);
+		pdtlb_user(vmaddr);
 		flush_user_dcache_page(vmaddr);
-		if (vma->vm_flags & VM_EXEC)
+		if (vma->vm_flags & VM_EXEC) {
 			flush_user_icache_page(vmaddr);
+			pitlb_user(vmaddr);
+		}
+		page_end_flush(pte);
+		pdtlb_user(vmaddr);
+	} else {
+		flush_user_cache_page_non_current(pte, vma, vmaddr);
+	}
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
+		page_begin_flush(pte);
+		pdtlb_user(vaddr);
+		flush_user_dcache_page(vaddr);
+		flush_user_icache_page(vaddr);
+		page_end_flush(pte);
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
 	} else {
-		flush_user_cache_page_non_current(vma, vmaddr);
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
+	struct address_space *mapping = page_mapping(page);
+
+	if (!mapping || mapping_mapped(mapping))
+		__flush_dcache_page(page);
+}
+
+static inline void flush_kernel_dcache_page(void *vaddr)
+{
+	pte_t *pte = __translation_exists(&init_mm, (unsigned long)vaddr);
+
+	if (likely(pte && pte_flush(*pte))) {
+		page_begin_flush(pte);
+		pdtlb_kernel(vaddr);
+		__flush_kernel_dcache_page(vaddr);
+		page_end_flush(pte);
+		pdtlb_kernel(vaddr);
 	}
 }
 
 static inline void
 flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
+	pte_t *pte = translation_exists(vma, vmaddr);
+
 	BUG_ON(!vma->vm_mm->context);
 
-	if(likely(translation_exists(vma, vmaddr)))
-		__flush_cache_page(vma, vmaddr);
+	if (likely(pte && pte_flush(*pte))) {
+		__flush_cache_page(pte, vma, vmaddr);
+	}
+
+}
+
+static inline void
+flush_kernel_dcache_range(unsigned long start, unsigned long end)
+{
+	unsigned long vaddr;
+
+	/* small range, don't bother to flush the whole page (and
+	 * thus don't mark the page as flushed */
+	if (likely(end - start < PAGE_SIZE)) {
+		flush_kernel_dcache_range_asm(start,end);
+		return;
+	}
+
+	for (vaddr = start & PAGE_MASK; vaddr < end; vaddr += PAGE_SIZE)
+		flush_kernel_dcache_page((void *)vaddr);
+}
+
 
+static inline void
+flush_icache_page(struct vm_area_struct *vma, struct page *page)
+{
 }
+
+static inline void
+copy_user_page(void *vto, void *vfrom, unsigned long vaddr, struct page *pg)
+{
+	pte_t *pte;
+	copy_user_page_asm(vto, vfrom);
+	if(likely((pte = __translation_exists(current->active_mm, vaddr)) &&
+		  pte_flush(*pte))) {
+		/* no point clearing flush here, it would be set again
+		 * when the user accesses the page, likewise, don't
+		 * purge the TLB entries */
+		flush_user_dcache_page(vaddr);
+		flush_user_icache_page(vaddr);
+	}
+		
+}
+
 #endif
 
diff -Nru a/include/asm-parisc/dma-mapping.h b/include/asm-parisc/dma-mapping.h
--- a/include/asm-parisc/dma-mapping.h	Wed Apr 28 21:24:13 2004
+++ b/include/asm-parisc/dma-mapping.h	Wed Apr 28 21:24:13 2004
@@ -200,8 +200,9 @@
 dma_cache_sync(void *vaddr, size_t size,
 	       enum dma_data_direction direction)
 {
+	unsigned long start = (unsigned long)vaddr, end = start + size;
 	if(hppa_dma_ops->dma_sync_single_for_cpu)
-		flush_kernel_dcache_range((unsigned long)vaddr, size);
+		flush_kernel_dcache_range_asm(start, end);
 }
 
 static inline void *
diff -Nru a/include/asm-parisc/io.h b/include/asm-parisc/io.h
--- a/include/asm-parisc/io.h	Wed Apr 28 21:24:13 2004
+++ b/include/asm-parisc/io.h	Wed Apr 28 21:24:13 2004
@@ -298,9 +298,9 @@
 #define IO_SPACE_LIMIT 0x00ffffff
 

-#define dma_cache_inv(_start,_size)		do { flush_kernel_dcache_range(_start,_size); } while (0)
-#define dma_cache_wback(_start,_size)		do { flush_kernel_dcache_range(_start,_size); } while (0)
-#define dma_cache_wback_inv(_start,_size)	do { flush_kernel_dcache_range(_start,_size); } while (0)
+#define dma_cache_inv(_start,_size)		do { flush_kernel_dcache_range_asm(_start,(_start) + (_size)); } while (0)
+#define dma_cache_wback(_start,_size)		do { flush_kernel_dcache_range_asm(_start,(_start) + (_size)); } while (0)
+#define dma_cache_wback_inv(_start,_size)	do { flush_kernel_dcache_range_asm(_start,(_start) + (_size)); } while (0)
 
 /* PA machines have an MM I/O space from 0xf0000000-0xffffffff in 32
  * bit mode and from 0xfffffffff0000000-0xfffffffffffffff in 64 bit
diff -Nru a/include/asm-parisc/page.h b/include/asm-parisc/page.h
--- a/include/asm-parisc/page.h	Wed Apr 28 21:24:13 2004
+++ b/include/asm-parisc/page.h	Wed Apr 28 21:24:13 2004
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
--- a/include/asm-parisc/pgtable.h	Wed Apr 28 21:24:13 2004
+++ b/include/asm-parisc/pgtable.h	Wed Apr 28 21:24:13 2004
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
+#define pte_flush(x)	(pte_val(x) & _PAGE_FLUSH)
+#define pte_no_cache(x)	(pte_val(x) & _PAGE_NO_CACHE)
 
 #define pmd_none(x)	(!pmd_val(x))
 #define pmd_bad(x)	((pmd_val(x) & ~PAGE_MASK) != _PAGE_TABLE)
 #define pmd_present(x)	(pmd_val(x) & _PAGE_PRESENT)
 #define pmd_clear(xp)	do { pmd_val(*(xp)) = 0; } while (0)
 
-
-
 #ifdef __LP64__
 #define pgd_page(pgd) ((unsigned long) __va(pgd_val(pgd) & PAGE_MASK))
 
@@ -262,6 +261,23 @@
 extern inline void pgd_clear(pgd_t * pgdp)	{ }
 #endif
 
+extern inline void page_begin_flush(pte_t *pte)
+{
+	/* make the page uncacheable. We need to do this to prevent
+	 * prefetches during the flush from filling the cache.
+	 *
+	 * NOTE: the tlb entry must be purged for this to take effect
+	 * but we don't do it here because we don't know whose space */
+	pte_val(*pte) |= _PAGE_NO_CACHE;
+}
+
+extern inline void page_end_flush(pte_t *pte)
+{
+	/* Clear the flush flag and allow caching the page again.
+	 *
+	 * NOTE: tlb entry must be purged to clear the no cache flag */
+	pte_val(*pte) &= ~(_PAGE_FLUSH | _PAGE_NO_CACHE);
+}
 /*
  * The following only work if pte_present() is true.
  * Undefined behaviour if not..
@@ -282,6 +298,13 @@
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
@@ -358,10 +381,6 @@
 
 extern void paging_init (void);
 
-/* Used for deferring calls to flush_dcache_page() */
-
-#define PG_dcache_dirty         PG_arch_1
-
 struct vm_area_struct; /* forward declaration (include/linux/mm.h) */
 extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t);
 
@@ -402,23 +421,12 @@
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
--- a/include/asm-parisc/tlb.h	Wed Apr 28 21:24:13 2004
+++ b/include/asm-parisc/tlb.h	Wed Apr 28 21:24:13 2004
@@ -7,7 +7,7 @@
 } while (0)
 
 #define tlb_start_vma(tlb, vma) \
-do {	if (!(tlb)->fullmm)	\
+do {	\
 		flush_cache_range(vma, vma->vm_start, vma->vm_end); \
 } while (0)
 
