From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] [PATCH] flush our cache through tmpalias space
Date: Wed, 21 Jun 2006 16:25:22 -0500
Message-ID: <1150925123.8456.56.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

One of the current disadvantages parisc has is that we have to walk the
inode mapping list to do a flush_dcache_page(), which means we get
entangled in locking.  The reason we do this is because a VIPT cache
can't be flushed without a mapping, so we have to find one to use

The intent of this patch is to instead flush through the tmpalias space
on the correct congruence boundary which would dispense with the need
for finding a mapping at all.  However, in the current incarnation we
still walk the mappings to check that all the usermappings are, indeed,
on the correct congruence boundary.  Unfortunately, as you'll see if you
try it out, not all are ... which is a bit of a problem.

James

? arch/parisc/kernel/test.c
? arch/parisc/kernel/test.o.nonvolatile
Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.28
diff -u -r1.28 cache.c
--- arch/parisc/kernel/cache.c	17 Dec 2005 17:21:16 -0000	1.28
+++ arch/parisc/kernel/cache.c	1 Jan 2006 17:26:25 -0000
@@ -267,9 +267,8 @@
 	struct address_space *mapping = page_mapping(page);
 	struct vm_area_struct *mpnt;
 	struct prio_tree_iter iter;
-	unsigned long offset;
-	unsigned long addr;
 	pgoff_t pgoff;
+	unsigned long addr = 0;
 	unsigned long pfn = page_to_pfn(page);
 
 
@@ -285,33 +284,27 @@
 
 	pgoff = page->index << (PAGE_CACHE_SHIFT - PAGE_SHIFT);
 
-	/* We have carefully arranged in arch_get_unmapped_area() that
-	 * *any* mappings of a file are always congruently mapped (whether
-	 * declared as MAP_PRIVATE or MAP_SHARED), so we only need
-	 * to flush one address here for them all to become coherent */
-
 	flush_dcache_mmap_lock(mapping);
 	vma_prio_tree_foreach(mpnt, &iter, &mapping->i_mmap, pgoff, pgoff) {
-		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
-		addr = mpnt->vm_start + offset;
+		unsigned long offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
+		if (!addr)
+			addr = mpnt->vm_start + offset;
+		if ((addr &  0x3fffff) != ((mpnt->vm_start + offset)
+					   & 0x3fffff)) {
+			printk(KERN_ERR "flush_dcache_page address aliasing mismatch: 0x%lx; 0x%lx\n", addr, mpnt->vm_start + offset);
+			flush_dcache_tmpalias_page(mpnt->vm_start + offset,
+						   pfn << PAGE_SHIFT);
+			flush_icache_tmpalias_page(mpnt->vm_start + offset,
+						   pfn << PAGE_SHIFT);
+		    }
 
-		/* Flush instructions produce non access tlb misses.
-		 * On PA, we nullify these instructions rather than
-		 * taking a page fault if the pte doesn't exist.
-		 * This is just for speed.  If the page translation
-		 * isn't there, there's no point exciting the
-		 * nadtlb handler into a nullification frenzy.
-		 *
-		 * Make sure we really have this page: the private
-		 * mappings may cover this area but have COW'd this
-		 * particular page.
-		 */
-  		if (translation_exists(mpnt, addr, pfn)) {
-			__flush_cache_page(mpnt, addr);
-			break;
-		}
 	}
 	flush_dcache_mmap_unlock(mapping);
+	/* All VM areas in user space start on our cache congruence
+	 * boundary, so we don't need to know where any of them start,
+	 * we simply flush the offset */
+	flush_dcache_tmpalias_page(addr, pfn << PAGE_SHIFT);
+	flush_icache_tmpalias_page(addr, pfn << PAGE_SHIFT);
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
@@ -360,3 +353,43 @@
 
 	printk("Setting cache flush threshold to %x (%d CPUs online)\n", parisc_cache_flush_threshold, num_online_cpus());
 }
+
+/* These two are in pacache.S */
+extern void flush_alias_page(unsigned long paddr, unsigned long vaddr);
+extern void flush_alias_i_page(unsigned long paddr, unsigned long vaddr);
+
+extern void flush_dcache_tmpalias_page(unsigned long vaddr,
+				       unsigned long paddr)
+{
+	flush_alias_page(paddr, vaddr);
+}
+EXPORT_SYMBOL(flush_dcache_tmpalias_page);
+
+extern void flush_dcache_tmpalias_page_as_page(unsigned long vaddr,
+					       struct page *page)
+{
+	flush_alias_page(page_to_pfn(page)<<PAGE_SHIFT, vaddr);
+}
+EXPORT_SYMBOL(flush_dcache_tmpalias_page_as_page);
+
+extern void flush_icache_tmpalias_page(unsigned long vaddr,
+				       unsigned long paddr)
+{
+	flush_alias_i_page(paddr, vaddr);
+}
+EXPORT_SYMBOL(flush_icache_tmpalias_page);
+
+extern void flush_icache_tmpalias_page_as_page(unsigned long vaddr,
+					       struct page *page)
+{
+	flush_alias_i_page(page_to_pfn(page)<<PAGE_SHIFT, vaddr);
+}
+EXPORT_SYMBOL(flush_icache_tmpalias_page_as_page);
+
+void flush_icache_page(struct vm_area_struct *vma, struct page *page,
+		       unsigned long vaddr)
+{
+	flush_alias_i_page(page_to_pfn(page)<<PAGE_SHIFT, vaddr);
+}
+EXPORT_SYMBOL(flush_icache_page);
+
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.33
diff -u -r1.33 entry.S
--- arch/parisc/kernel/entry.S	19 Oct 2005 19:36:52 -0000	1.33
+++ arch/parisc/kernel/entry.S	1 Jan 2006 17:26:27 -0000
@@ -619,21 +619,21 @@
 	DEPI		0,31,23,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	ldi		(_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),\prot
-	depd,z		\prot,8,7,\prot
 	/*
 	 * OK, it is in the temp alias region, check whether "from" or "to".
 	 * Check "subtle" note in pacache.S re: r23/r26.
 	 */
 #ifdef CONFIG_64BIT
+	depd,z		\prot,8,7,\prot
 	extrd,u,*=	\va,41,1,%r0
 #else
+	depw,z		\prot,8,7,\prot
 	extrw,u,=	\va,9,1,%r0
 #endif
 	or,COND(tr)	%r23,%r0,\pte
 	or		%r26,%r0,\pte
 	.endm 
 
-
 	/*
 	 * Align fault_vector_20 on 4K boundary so that both
 	 * fault_vector_11 and fault_vector_20 are on the
@@ -1268,7 +1268,7 @@
 	nop
 
 nadtlb_check_flush_20w:
-	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
+	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_check_alias_20w
 
 	/* Insert a "flush only" translation */
 
@@ -1284,6 +1284,13 @@
 	rfir
 	nop
 
+nadtlb_check_alias_20w:	
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
+
+	idtlbt          pte,prot
+
+	rfir
+	nop
 #else
 
 dtlb_miss_11:
@@ -1310,27 +1317,15 @@
 
 dtlb_check_alias_11:
 
-	/* Check to see if fault is in the temporary alias region */
-
-	cmpib,<>,n      0,spc,dtlb_fault /* forward */
-	ldil            L%(TMPALIAS_MAP_START),t0
-	copy            va,t1
-	depwi           0,31,23,t1
-	cmpb,<>,n       t0,t1,dtlb_fault /* forward */
-	ldi             (_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),prot
-	depw,z          prot,8,7,prot
+	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault
 
-	/*
-	 * OK, it is in the temp alias region, check whether "from" or "to".
-	 * Check "subtle" note in pacache.S re: r23/r26.
-	 */
+	mfsp		%sr1,t0
+	mtsp		spc,%sr1
 
-	extrw,u,=       va,9,1,r0
-	or,tr           %r23,%r0,pte    /* If "from" use "from" page */
-	or              %r26,%r0,pte    /* else "to", use "to" page  */
+	idtlba          pte,(%sr1,va)
+	idtlbp          prot,(%sr1,va)
 
-	idtlba          pte,(va)
-	idtlbp          prot,(va)
+	mstp		t0,%sr1		/* Restore sr1 */
 
 	rfir
 	nop
@@ -1427,7 +1422,7 @@
 	nop
 
 nadtlb_check_flush_20:
-	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
+	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_check_alias_20
 
 	/* Insert a "flush only" translation */
 
@@ -1442,6 +1437,16 @@
 
 	rfir
 	nop
+
+	
+nadtlb_check_alias_20:
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
+
+	idtlbt          pte,prot
+
+	rfir
+	nop
+
 #endif
 
 nadtlb_emulate:
@@ -1528,7 +1533,7 @@
 	get_pgd		spc,ptp
 	space_check	spc,t0,itlb_fault
 
-	L3_ptep		ptp,pte,t0,va,itlb_fault
+	L3_ptep		ptp,pte,t0,va,itlb_check_alias_20w
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1539,6 +1544,14 @@
 	rfir
 	nop
 
+itlb_check_alias_20w:
+	do_alias	spc,t0,t1,va,pte,prot,itlb_fault
+
+	iitlbt          pte,prot
+
+	rfir
+	nop
+
 #else
 
 itlb_miss_11:
@@ -1546,7 +1559,7 @@
 
 	space_check	spc,t0,itlb_fault
 
-	L2_ptep		ptp,pte,t0,va,itlb_fault
+	L2_ptep		ptp,pte,t0,va,itlb_check_alias_11
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1563,12 +1576,27 @@
 	rfir
 	nop
 
+itlb_check_alias_11:
+
+	do_alias	spc,t0,t1,va,pte,prot,itlb_fault
+
+	mfsp		%sr1,t0
+	mtsp		spc,%sr1
+
+	iitlba          pte,(%sr1,va)
+	iitlbp          prot,(%sr1,va)
+
+	mstp		t0,%sr1		/* Restore sr1 */
+
+	rfir
+	nop
+
 itlb_miss_20:
 	get_pgd		spc,ptp
 
 	space_check	spc,t0,itlb_fault
 
-	L2_ptep		ptp,pte,t0,va,itlb_fault
+	L2_ptep		ptp,pte,t0,va,itlb_check_alias_20
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1576,6 +1604,14 @@
 
 	f_extend	pte,t0	
 
+	iitlbt          pte,prot
+
+	rfir
+	nop
+	
+dtlb_check_alias_20:
+	do_alias	spc,t0,t1,va,pte,prot,itlb_fault
+	
 	iitlbt          pte,prot
 
 	rfir
Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pacache.S,v
retrieving revision 1.21
diff -u -r1.21 pacache.S
--- arch/parisc/kernel/pacache.S	6 Oct 2005 04:41:47 -0000	1.21
+++ arch/parisc/kernel/pacache.S	1 Jan 2006 17:26:27 -0000
@@ -479,8 +479,8 @@
 
 	/* Purge any old translations */
 
-	pdtlb		0(%r28)
-	pdtlb		0(%r29)
+	pdtlb,l		0(%r28)
+	pdtlb,l		0(%r29)
 
 	ldi		64, %r1
 
@@ -563,7 +563,7 @@
 
 	/* Purge any old translation */
 
-	pdtlb		0(%r28)
+	pdtlb,l		0(%r28)
 
 #ifdef CONFIG_64BIT
 	ldi		32, %r1			/* PAGE_SIZE/128 == 32 */
@@ -797,7 +797,6 @@
 
 	.procend
 
-#if 0
 	/* Currently not used, but it still is a possible alternate
 	 * solution.
 	 */
@@ -809,10 +808,11 @@
 	.callinfo NO_CALLS
 	.entry
 
-	tophys_r1		%r26
-
 	ldil		L%(TMPALIAS_MAP_START), %r28
 #ifdef CONFIG_64BIT
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi		0, 31,32, %r28		/* clear any sign extension */
+#endif
 	extrd,u		%r26, 56,32, %r26	/* convert phys addr to tlb insert format */
 	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
 	depdi		0, 63,12, %r28		/* Clear any offset bits */
@@ -824,7 +824,7 @@
 
 	/* Purge any old translation */
 
-	pdtlb		0(%r28)
+	pdtlb,l		0(%r28)
 
 	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), %r23
@@ -861,7 +861,67 @@
 	.exit
 
 	.procend
+
+	.export		flush_alias_i_page
+	
+flush_alias_i_page:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+	ldil		L%(TMPALIAS_MAP_START), %r28
+#ifdef CONFIG_64BIT
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi		0, 31,32, %r28		/* clear any sign extension */
 #endif
+	extrd,u		%r26, 56,32, %r26	/* convert phys addr to tlb insert format */
+	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depdi		0, 63,12, %r28		/* Clear any offset bits */
+#else
+	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
+	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depwi		0, 31,12, %r28		/* Clear any offset bits */
+#endif
+
+	/* Purge any old translation */
+
+	pitlb,l		0(%sr0,%r28)
+
+	ldil		L%dcache_stride, %r1
+	ldw		R%dcache_stride(%r1), %r23
+
+#ifdef CONFIG_64BIT
+	depdi,z		1, 63-PAGE_SHIFT,1, %r29
+#else
+	depwi,z		1, 31-PAGE_SHIFT,1, %r29
+#endif
+	add		%r28, %r29, %r29
+	sub		%r29, %r23, %r29
+
+1:      fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	CMPB<<		%r28, %r29, 1b
+	fic,m		%r23(%sr4,%r28)
+
+	sync
+	bv		%r0(%r2)
+	nop
+	.exit
+
+	.procend
 
 	.export flush_user_dcache_range_asm
 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
