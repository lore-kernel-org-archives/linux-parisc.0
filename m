From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: parisc: flush pages through tmpalias space
Date: Wed, 22 Dec 2010 10:22:11 -0600
Message-ID: <1293034931.3019.8.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The kernel has an 8M tmpailas space (originally designed for copying
and clearing pages but now only used for clearing).  The idea is
to place zeros into the cache above a physical page rather than into
the physical page and flush the cache, because often the zeros end up
being replaced quickly anyway.

We can also use the tmpalias space for flushing a page.  The difference
here is that we have to do tmpalias processing in the non access data and
instruction traps.  The principle is the same: as long as we know the physical
address and have a virtual address congruent to the real one, the flush will
be effective.

In order to use the tmpalias space, the icache miss path has to be enhanced to
check for the alias region to make the fic instruction effective.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 arch/parisc/include/asm/cacheflush.h |    7 +-
 arch/parisc/kernel/cache.c           |  109 +++-------------
 arch/parisc/kernel/entry.S           |  194 ++++++++++++++++++++-------
 arch/parisc/kernel/pacache.S         |  245 +++++++++++++++-------------------
 4 files changed, 272 insertions(+), 283 deletions(-)

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index f388a85..dc9286a 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -26,8 +26,6 @@ void flush_user_dcache_range_asm(unsigned long, unsigned long);
 void flush_kernel_dcache_range_asm(unsigned long, unsigned long);
 void flush_kernel_dcache_page_asm(void *);
 void flush_kernel_icache_page(void *);
-void flush_user_dcache_page(unsigned long);
-void flush_user_icache_page(unsigned long);
 void flush_user_dcache_range(unsigned long, unsigned long);
 void flush_user_icache_range(unsigned long, unsigned long);
 
@@ -90,12 +88,15 @@ void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end);
 
+/* defined in pacache.S exported in cache.c used by flush_anon_page */
+void flush_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
+
 #define ARCH_HAS_FLUSH_ANON_PAGE
 static inline void
 flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
 {
 	if (PageAnon(page))
-		flush_user_dcache_page(vmaddr);
+		flush_dcache_page_asm(page_to_phys(page), vmaddr);
 }
 
 #define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index d054f3d..3f11331 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -27,12 +27,17 @@
 #include <asm/pgalloc.h>
 #include <asm/processor.h>
 #include <asm/sections.h>
+#include <asm/shmparam.h>
 
 int split_tlb __read_mostly;
 int dcache_stride __read_mostly;
 int icache_stride __read_mostly;
 EXPORT_SYMBOL(dcache_stride);
 
+void flush_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
+EXPORT_SYMBOL(flush_dcache_page_asm);
+void flush_icache_page_asm(unsigned long phys_addr, unsigned long vaddr);
+
 
 /* On some machines (e.g. ones with the Merced bus), there can be
  * only a single PxTLB broadcast at a time; this must be guaranteed
@@ -259,81 +264,13 @@ void disable_sr_hashing(void)
 		panic("SpaceID hashing is still on!\n");
 }
 
-/* Simple function to work out if we have an existing address translation
- * for a user space vma. */
-static inline int translation_exists(struct vm_area_struct *vma,
-				unsigned long addr, unsigned long pfn)
-{
-	pgd_t *pgd = pgd_offset(vma->vm_mm, addr);
-	pmd_t *pmd;
-	pte_t pte;
-
-	if(pgd_none(*pgd))
-		return 0;
-
-	pmd = pmd_offset(pgd, addr);
-	if(pmd_none(*pmd) || pmd_bad(*pmd))
-		return 0;
-
-	/* We cannot take the pte lock here: flush_cache_page is usually
-	 * called with pte lock already held.  Whereas flush_dcache_page
-	 * takes flush_dcache_mmap_lock, which is lower in the hierarchy:
-	 * the vma itself is secure, but the pte might come or go racily.
-	 */
-	pte = *pte_offset_map(pmd, addr);
-	/* But pte_unmap() does nothing on this architecture */
-
-	/* Filter out coincidental file entries and swap entries */
-	if (!(pte_val(pte) & (_PAGE_FLUSH|_PAGE_PRESENT)))
-		return 0;
-
-	return pte_pfn(pte) == pfn;
-}
-
-/* Private function to flush a page from the cache of a non-current
- * process.  cr25 contains the Page Directory of the current user
- * process; we're going to hijack both it and the user space %sr3 to
- * temporarily make the non-current process current.  We have to do
- * this because cache flushing may cause a non-access tlb miss which
- * the handlers have to fill in from the pgd of the non-current
- * process. */
 static inline void
-flush_user_cache_page_non_current(struct vm_area_struct *vma,
-				  unsigned long vmaddr)
+__flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
+		   unsigned long physaddr)
 {
-	/* save the current process space and pgd */
-	unsigned long space = mfsp(3), pgd = mfctl(25);
-
-	/* we don't mind taking interrupts since they may not
-	 * do anything with user space, but we can't
-	 * be preempted here */
-	preempt_disable();
-
-	/* make us current */
-	mtctl(__pa(vma->vm_mm->pgd), 25);
-	mtsp(vma->vm_mm->context, 3);
-
-	flush_user_dcache_page(vmaddr);
-	if(vma->vm_flags & VM_EXEC)
-		flush_user_icache_page(vmaddr);
-
-	/* put the old current process back */
-	mtsp(space, 3);
-	mtctl(pgd, 25);
-	preempt_enable();
-}
-
-
-static inline void
-__flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
-{
-	if (likely(vma->vm_mm->context == mfsp(3))) {
-		flush_user_dcache_page(vmaddr);
-		if (vma->vm_flags & VM_EXEC)
-			flush_user_icache_page(vmaddr);
-	} else {
-		flush_user_cache_page_non_current(vma, vmaddr);
-	}
+	flush_dcache_page_asm(physaddr, vmaddr);
+	if (vma->vm_flags & VM_EXEC)
+		flush_icache_page_asm(physaddr, vmaddr);
 }
 
 void flush_dcache_page(struct page *page)
@@ -342,10 +279,8 @@ void flush_dcache_page(struct page *page)
 	struct vm_area_struct *mpnt;
 	struct prio_tree_iter iter;
 	unsigned long offset;
-	unsigned long addr;
+	unsigned long addr, old_addr = 0;
 	pgoff_t pgoff;
-	unsigned long pfn = page_to_pfn(page);
-
 
 	if (mapping && !mapping_mapped(mapping)) {
 		set_bit(PG_dcache_dirty, &page->flags);
@@ -369,20 +304,11 @@ void flush_dcache_page(struct page *page)
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 
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
+		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
+			__flush_cache_page(mpnt, addr, page_to_phys(page));
+			if (old_addr)
+				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
+			old_addr = addr;
 		}
 	}
 	flush_dcache_mmap_unlock(mapping);
@@ -573,7 +499,6 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 {
 	BUG_ON(!vma->vm_mm->context);
 
-	if (likely(translation_exists(vma, vmaddr, pfn)))
-		__flush_cache_page(vma, vmaddr);
+	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
 
 }
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 6337ade..564606d 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -225,22 +225,13 @@
 #ifndef CONFIG_64BIT
 	/*
 	 * naitlb miss interruption handler (parisc 1.1 - 32 bit)
-	 *
-	 * Note: naitlb misses will be treated
-	 * as an ordinary itlb miss for now.
-	 * However, note that naitlb misses
-	 * have the faulting address in the
-	 * IOR/ISR.
 	 */
 
 	.macro	naitlb_11 code
 
 	mfctl	%isr,spc
-	b	itlb_miss_11
+	b	naitlb_miss_11
 	mfctl 	%ior,va
-	/* FIXME: If user causes a naitlb miss, the priv level may not be in
-	 * lower bits of va, where the itlb miss handler is expecting them
-	 */
 
 	.align		32
 	.endm
@@ -248,26 +239,17 @@
 	
 	/*
 	 * naitlb miss interruption handler (parisc 2.0)
-	 *
-	 * Note: naitlb misses will be treated
-	 * as an ordinary itlb miss for now.
-	 * However, note that naitlb misses
-	 * have the faulting address in the
-	 * IOR/ISR.
 	 */
 
 	.macro	naitlb_20 code
 
 	mfctl	%isr,spc
 #ifdef CONFIG_64BIT
-	b       itlb_miss_20w
+	b       naitlb_miss_20w
 #else
-	b	itlb_miss_20
+	b	naitlb_miss_20
 #endif
 	mfctl 	%ior,va
-	/* FIXME: If user causes a naitlb miss, the priv level may not be in
-	 * lower bits of va, where the itlb miss handler is expecting them
-	 */
 
 	.align		32
 	.endm
@@ -581,7 +563,24 @@
 	copy		\va,\tmp1
 	depi		0,31,23,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
-	ldi		(_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),\prot
+	mfctl		%cr19,\tmp	/* iir */
+	/* get the opcode (first six bits) into \tmp */
+	extrw,u		\tmp,5,6,\tmp
+	/*
+	 * Only setting the T bit prevents data cache movein
+	 * Setting access rights to zero prevents instruction cache movein
+	 *
+	 * Note subtlety here: _PAGE_GATEWAY, _PAGE_EXEC and _PAGE_WRITE go
+	 * to type field and _PAGE_READ goes to top bit of PL1
+	 */ 
+	ldi		(_PAGE_REFTRAP|_PAGE_READ|_PAGE_WRITE),\prot
+	/*
+	 * so if the opcode is one (i.e. this is a memory management
+	 * instruction) nullify the next load so \prot is only T.
+	 * Otherwise this is a normal data operation
+	 */ 
+	cmpiclr,=	0x01,\tmp,%r0
+	ldi		(_PAGE_DIRTY|_PAGE_READ|_PAGE_WRITE),\prot
 	depd,z		\prot,8,7,\prot
 	/*
 	 * OK, it is in the temp alias region, check whether "from" or "to".
@@ -631,11 +630,7 @@ ENTRY(fault_vector_20)
 	def		13
 	def		14
 	dtlb_20		15
-#if 0
 	naitlb_20	16
-#else
-	def             16
-#endif
 	nadtlb_20	17
 	def		18
 	def		19
@@ -678,11 +673,7 @@ ENTRY(fault_vector_11)
 	def		13
 	def		14
 	dtlb_11		15
-#if 0
 	naitlb_11	16
-#else
-	def             16
-#endif
 	nadtlb_11	17
 	def		18
 	def		19
@@ -1203,7 +1194,7 @@ nadtlb_miss_20w:
 	get_pgd		spc,ptp
 	space_check	spc,t0,nadtlb_fault
 
-	L3_ptep		ptp,pte,t0,va,nadtlb_check_flush_20w
+	L3_ptep		ptp,pte,t0,va,nadtlb_check_alias_20w
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1214,6 +1205,14 @@ nadtlb_miss_20w:
 	rfir
 	nop
 
+nadtlb_check_alias_20w:
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_check_flush_20w
+
+	idtlbt          pte,prot
+
+	rfir
+	nop
+
 nadtlb_check_flush_20w:
 	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
 
@@ -1255,25 +1254,7 @@ dtlb_miss_11:
 	nop
 
 dtlb_check_alias_11:
-
-	/* Check to see if fault is in the temporary alias region */
-
-	cmpib,<>,n      0,spc,dtlb_fault /* forward */
-	ldil            L%(TMPALIAS_MAP_START),t0
-	copy            va,t1
-	depwi           0,31,23,t1
-	cmpb,<>,n       t0,t1,dtlb_fault /* forward */
-	ldi             (_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),prot
-	depw,z          prot,8,7,prot
-
-	/*
-	 * OK, it is in the temp alias region, check whether "from" or "to".
-	 * Check "subtle" note in pacache.S re: r23/r26.
-	 */
-
-	extrw,u,=       va,9,1,r0
-	or,tr           %r23,%r0,pte    /* If "from" use "from" page */
-	or              %r26,%r0,pte    /* else "to", use "to" page  */
+	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault
 
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
@@ -1286,7 +1267,7 @@ nadtlb_miss_11:
 
 	space_check	spc,t0,nadtlb_fault
 
-	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_11
+	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_11
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1304,6 +1285,15 @@ nadtlb_miss_11:
 	rfir
 	nop
 
+nadtlb_check_alias_11:
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_check_flush_11
+
+	idtlba          pte,(va)
+	idtlbp          prot,(va)
+
+	rfir
+	nop
+
 nadtlb_check_flush_11:
 	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
 
@@ -1359,7 +1349,7 @@ nadtlb_miss_20:
 
 	space_check	spc,t0,nadtlb_fault
 
-	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_20
+	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_20
 
 	update_ptep	ptp,pte,t0,t1
 
@@ -1372,6 +1362,14 @@ nadtlb_miss_20:
 	rfir
 	nop
 
+nadtlb_check_alias_20:
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_check_flush_20
+	
+	idtlbt          pte,prot
+
+	rfir
+	nop
+
 nadtlb_check_flush_20:
 	bb,>=,n          pte,_PAGE_FLUSH_BIT,nadtlb_emulate
 
@@ -1484,6 +1482,36 @@ itlb_miss_20w:
 	rfir
 	nop
 
+naitlb_miss_20w:
+
+	/*
+	 * I miss is a little different, since we allow users to fault
+	 * on the gateway page which is in the kernel address space.
+	 */
+
+	space_adjust	spc,va,t0
+	get_pgd		spc,ptp
+	space_check	spc,t0,naitlb_fault
+
+	L3_ptep		ptp,pte,t0,va,naitlb_check_alias_20w
+
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb	spc,pte,prot
+	
+	iitlbt          pte,prot
+
+	rfir
+	nop
+
+naitlb_check_alias_20w:
+	do_alias	spc,t0,t1,va,pte,prot,naitlb_fault
+
+	iitlbt		pte,prot
+
+	rfir
+	nop
+
 #else
 
 itlb_miss_11:
@@ -1508,6 +1536,38 @@ itlb_miss_11:
 	rfir
 	nop
 
+naitlb_miss_11:
+	get_pgd		spc,ptp
+
+	space_check	spc,t0,naitlb_fault
+
+	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_11
+
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb_11	spc,pte,prot
+
+	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
+	mtsp		spc,%sr1
+
+	iitlba		pte,(%sr1,va)
+	iitlbp		prot,(%sr1,va)
+
+	mtsp		t0, %sr1	/* Restore sr1 */
+
+	rfir
+	nop
+
+naitlb_check_alias_11:
+	do_alias	spc,t0,t1,va,pte,prot,itlb_fault
+
+	iitlba          pte,(%sr0, va)
+	iitlbp          prot,(%sr0, va)
+
+	rfir
+	nop
+	
+
 itlb_miss_20:
 	get_pgd		spc,ptp
 
@@ -1526,6 +1586,32 @@ itlb_miss_20:
 	rfir
 	nop
 
+naitlb_miss_20:
+	get_pgd		spc,ptp
+
+	space_check	spc,t0,naitlb_fault
+
+	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_20
+
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb	spc,pte,prot
+
+	f_extend	pte,t0	
+
+	iitlbt          pte,prot
+
+	rfir
+	nop
+
+naitlb_check_alias_20:
+	do_alias	spc,t0,t1,va,pte,prot,naitlb_fault
+	
+	iitlbt          pte,prot
+
+	rfir
+	nop
+
 #endif
 
 #ifdef CONFIG_64BIT
@@ -1662,6 +1748,10 @@ nadtlb_fault:
 	b               intr_save
 	ldi             17,%r8
 
+naitlb_fault:
+	b               intr_save
+	ldi             16,%r8
+
 dtlb_fault:
 	b               intr_save
 	ldi             15,%r8
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 09b77b2..881b287 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -608,93 +608,131 @@ ENTRY(__clear_user_page_asm)
 	.procend
 ENDPROC(__clear_user_page_asm)
 
-ENTRY(flush_kernel_dcache_page_asm)
+ENTRY(flush_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
 
+	ldil		L%(TMPALIAS_MAP_START), %r28
+#ifdef CONFIG_64BIT
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi		0, 31,32, %r28		/* clear any sign extension */
+	/* FIXME: page size dependend */
+#endif
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
+	pdtlb		0(%r28)
+
 	ldil		L%dcache_stride, %r1
-	ldw		R%dcache_stride(%r1), %r23
+	ldw		R%dcache_stride(%r1), %r1
 
 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
 #else
 	depwi,z		1, 31-PAGE_SHIFT,1, %r25
 #endif
-	add		%r26, %r25, %r25
-	sub		%r25, %r23, %r25
-
-
-1:      fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	fdc,m		%r23(%r26)
-	cmpb,COND(<<)		%r26, %r25,1b
-	fdc,m		%r23(%r26)
+	add		%r28, %r25, %r25
+	sub		%r25, %r1, %r25
+	
 
+1:      fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	fdc,m		%r1(%r28)
+	cmpb,COND(<<)		%r28, %r25,1b
+	fdc,m		%r1(%r28)
+	
 	sync
 	bv		%r0(%r2)
-	nop
+	pdtlb		(%r25)
 	.exit
 
 	.procend
-ENDPROC(flush_kernel_dcache_page_asm)
-	
-ENTRY(flush_user_dcache_page)
+ENDPROC(flush_dcache_page_asm)
+
+ENTRY(flush_icache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
 
-	ldil		L%dcache_stride, %r1
-	ldw		R%dcache_stride(%r1), %r23
-
+	ldil		L%(TMPALIAS_MAP_START), %r28
 #ifdef CONFIG_64BIT
-	depdi,z		1,63-PAGE_SHIFT,1, %r25
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi		0, 31,32, %r28		/* clear any sign extension */
+	/* FIXME: page size dependend */
+#endif
+	extrd,u		%r26, 56,32, %r26	/* convert phys addr to tlb insert format */
+	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
+	depdi		0, 63,12, %r28		/* Clear any offset bits */
 #else
-	depwi,z		1,31-PAGE_SHIFT,1, %r25
+	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
+	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
+	depwi		0, 31,12, %r28		/* Clear any offset bits */
 #endif
-	add		%r26, %r25, %r25
-	sub		%r25, %r23, %r25
 
+	/* Purge any old translation */
 
-1:      fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	fdc,m		%r23(%sr3, %r26)
-	cmpb,COND(<<)		%r26, %r25,1b
-	fdc,m		%r23(%sr3, %r26)
+	pitlb		(%sr0,%r28)
 
+	ldil		L%icache_stride, %r1
+	ldw		R%icache_stride(%r1), %r1
+
+#ifdef CONFIG_64BIT
+	depdi,z		1, 63-PAGE_SHIFT,1, %r25
+#else
+	depwi,z		1, 31-PAGE_SHIFT,1, %r25
+#endif
+	add		%r28, %r25, %r25
+	sub		%r25, %r1, %r25
+	
+
+1:      fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	fic,m		%r1(%r28)
+	cmpb,COND(<<)		%r28, %r25,1b
+	fic,m		%r1(%r28)
+	
 	sync
 	bv		%r0(%r2)
-	nop
+	pitlb		(%sr0,%r25)
 	.exit
 
 	.procend
-ENDPROC(flush_user_dcache_page)
+ENDPROC(flush_icache_page_asm)
 
-ENTRY(flush_user_icache_page)
+ENTRY(flush_kernel_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -711,23 +749,23 @@ ENTRY(flush_user_icache_page)
 	sub		%r25, %r23, %r25
 
 
-1:      fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
-	fic,m		%r23(%sr3, %r26)
+1:      fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
+	fdc,m		%r23(%r26)
 	cmpb,COND(<<)		%r26, %r25,1b
-	fic,m		%r23(%sr3, %r26)
+	fdc,m		%r23(%r26)
 
 	sync
 	bv		%r0(%r2)
@@ -735,8 +773,7 @@ ENTRY(flush_user_icache_page)
 	.exit
 
 	.procend
-ENDPROC(flush_user_icache_page)
-
+ENDPROC(flush_kernel_dcache_page_asm)
 
 ENTRY(purge_kernel_dcache_page)
 	.proc
@@ -780,69 +817,6 @@ ENTRY(purge_kernel_dcache_page)
 	.procend
 ENDPROC(purge_kernel_dcache_page)
 
-#if 0
-	/* Currently not used, but it still is a possible alternate
-	 * solution.
-	 */
-
-ENTRY(flush_alias_page)
-	.proc
-	.callinfo NO_CALLS
-	.entry
-
-	tophys_r1		%r26
-
-	ldil		L%(TMPALIAS_MAP_START), %r28
-#ifdef CONFIG_64BIT
-	extrd,u		%r26, 56,32, %r26	/* convert phys addr to tlb insert format */
-	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
-	depdi		0, 63,12, %r28		/* Clear any offset bits */
-#else
-	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
-	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
-	depwi		0, 31,12, %r28		/* Clear any offset bits */
-#endif
-
-	/* Purge any old translation */
-
-	pdtlb		0(%r28)
-
-	ldil		L%dcache_stride, %r1
-	ldw		R%dcache_stride(%r1), %r23
-
-#ifdef CONFIG_64BIT
-	depdi,z		1, 63-PAGE_SHIFT,1, %r29
-#else
-	depwi,z		1, 31-PAGE_SHIFT,1, %r29
-#endif
-	add		%r28, %r29, %r29
-	sub		%r29, %r23, %r29
-
-1:      fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	fdc,m		%r23(%r28)
-	cmpb,COND(<<)		%r28, %r29, 1b
-	fdc,m		%r23(%r28)
-
-	sync
-	bv		%r0(%r2)
-	nop
-	.exit
