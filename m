From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Mon, 19 Apr 2010 12:26:54 -0400
Message-ID: <20100419162653.GA106@hiauly1.hia.nrc.ca>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="6TrnltStXW4iwmi0"
Cc: linux-parisc@vger.kernel.org, gniibe@fsij.org,
	carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100413115501.307040@gmx.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Helge,

On Tue, 13 Apr 2010, Helge Deller wrote:

> Still crashes.

Can you you try the patch below?  The change to cacheflush.h is the same
as before.

I have lightly tested the attached change on rp3440 with SMP 2.6.33.2
kernel.  It got through a GCC build at -j8, which is something of a
record.  However, I did see one issue this morning in the ada testsuite:

malloc: ../bash/make_cmd.c:100: assertion botched
malloc: block on free list clobbered
Aborting.../home/dave/gnu/gcc/gcc/gcc/testsuite/ada/acats/run_all.sh: line 67: 29176 Aborted                 (core dumped) ls ${i}.adb >> ${i}.lst 2> /dev/null

I have seen this before.

The change reworks all code that manipulates ptes to use the pa_dbit_lock
to ensure that we don't lose state information during updates.  I also
added code to purge the tlb associated with the pte as it wasn't obvious
to me how for example the write protect bit got set in the tlb.

Someone had clearly tried to fix the dirty bit handling in the past,
but the change was incomplete.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pte.d.2"

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 7a73b61..ab87176 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -2,6 +2,7 @@
 #define _PARISC_CACHEFLUSH_H
 
 #include <linux/mm.h>
+#include <linux/uaccess.h>
 
 /* The usual comment is "Caches aren't brain-dead on the <architecture>".
  * Unfortunately, that doesn't apply to PA-RISC. */
@@ -113,11 +114,20 @@ static inline void *kmap(struct page *page)
 
 #define kunmap(page)			kunmap_parisc(page_address(page))
 
-#define kmap_atomic(page, idx)		page_address(page)
+static inline void *kmap_atomic(struct page *page, enum km_type idx)
+{
+	pagefault_disable();
+	return page_address(page);
+}
 
-#define kunmap_atomic(addr, idx)	kunmap_parisc(addr)
+static inline void kunmap_atomic(void *addr, enum km_type idx)
+{
+	kunmap_parisc(addr);
+	pagefault_enable();
+}
 
-#define kmap_atomic_pfn(pfn, idx)	page_address(pfn_to_page(pfn))
+#define kmap_atomic_prot(page, idx, prot)	kmap_atomic(page, idx)
+#define kmap_atomic_pfn(pfn, idx)	kmap_atomic(pfn_to_page(pfn), (idx))
 #define kmap_atomic_to_page(ptr)	virt_to_page(ptr)
 #endif
 
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a27d2e2..6a221af 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -38,7 +38,8 @@
         do{                                                     \
                 *(pteptr) = (pteval);                           \
         } while(0)
-#define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
+#define set_pte_at(mm,addr,ptep,pteval)				\
+	do { set_pte(ptep,pteval); purge_tlb_page(mm, addr); } while(0) 
 
 #endif /* !__ASSEMBLY__ */
 
@@ -410,6 +411,8 @@ extern void paging_init (void);
 
 #define PG_dcache_dirty         PG_arch_1
 
+extern void flush_cache_page(struct vm_area_struct *, unsigned long, unsigned long);
+extern void purge_tlb_page(struct mm_struct *, unsigned long);
 extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t);
 
 /* Encode and de-code a swap entry */
@@ -423,22 +426,39 @@ extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+extern spinlock_t pa_dbit_lock;
+
+static inline void pte_update_lock (void)
 {
 #ifdef CONFIG_SMP
-	if (!pte_young(*ptep))
-		return 0;
-	return test_and_clear_bit(xlate_pabit(_PAGE_ACCESSED_BIT), &pte_val(*ptep));
-#else
-	pte_t pte = *ptep;
-	if (!pte_young(pte))
-		return 0;
-	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
-	return 1;
+	preempt_disable();
+	spin_lock(&pa_dbit_lock);
+#endif
+}
+static inline void pte_update_unlock (void)
+{
+#ifdef CONFIG_SMP
+	spin_unlock(&pa_dbit_lock);
+	preempt_enable();
 #endif
 }
 
-extern spinlock_t pa_dbit_lock;
+static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+{
+	pte_t pte;
+
+	pte_update_lock();
+	pte = *ptep;
+	if (!pte_young(pte)) {
+		pte_update_unlock();
+		return 0;
+	}
+	set_pte(ptep, pte_mkold(pte));
+	pte_update_unlock();
+	purge_tlb_page(vma->vm_mm, addr);
+
+	return 1;
+}
 
 struct mm_struct;
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
@@ -446,29 +466,29 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	pte_t old_pte;
 	pte_t pte;
 
-	spin_lock(&pa_dbit_lock);
+	pte_update_lock();
 	pte = old_pte = *ptep;
 	pte_val(pte) &= ~_PAGE_PRESENT;
 	pte_val(pte) |= _PAGE_FLUSH;
-	set_pte_at(mm,addr,ptep,pte);
-	spin_unlock(&pa_dbit_lock);
+	set_pte(ptep,pte);
+	pte_update_unlock();
+	purge_tlb_page(mm, addr);
 
 	return old_pte;
 }
 
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
-#ifdef CONFIG_SMP
-	unsigned long new, old;
+	pte_t old_pte;
 
-	do {
-		old = pte_val(*ptep);
-		new = pte_val(pte_wrprotect(__pte (old)));
-	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
-#else
-	pte_t old_pte = *ptep;
-	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
-#endif
+	pte_update_lock();
+	old_pte = *ptep;
+	set_pte(ptep, pte_wrprotect(old_pte));
+	pte_update_unlock();
+
+	if (pte_present(old_pte) && pte_dirty(old_pte))
+		flush_cache_page(vma, addr, pte_pfn(*ptep));
+	purge_tlb_page(mm, addr);
 }
 
 #define pte_same(A,B)	(pte_val(A) == pte_val(B))
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index b6ed34d..cd64e38 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -577,3 +577,17 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 		__flush_cache_page(vma, vmaddr);
 
 }
+
+void purge_tlb_page(struct mm_struct *mm, unsigned long addr)
+{
+        unsigned long flags;
+
+        /* For one page, it's not worth testing the split_tlb variable */
+
+        mb();
+        mtsp(mm->context,1);
+        purge_tlb_start(flags);
+        pdtlb(addr);
+        pitlb(addr);
+        purge_tlb_end(flags);
+}
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3a44f7f..12ebb8a 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -490,19 +464,57 @@
 
 	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
 	 * don't needlessly dirty the cache line if it was already set */
-	.macro		update_ptep	ptep,pte,tmp,tmp1
+	.macro		update_ptep	ptep,pte,spc,tmp,tmp1
+#ifdef CONFIG_SMP
+	bb,<,n		\pte,_PAGE_ACCESSED_BIT,3f
+	cmpib,COND(=),n        0,\spc,2f
+	load32		PA(pa_dbit_lock),\tmp
+1:
+	LDCW		0(\tmp),\tmp1
+	cmpib,COND(=)         0,\tmp1,1b
+	nop
+	LDREG		0(\ptep),\pte
+2:
+	ldi		_PAGE_ACCESSED,\tmp1
+	or		\tmp1,\pte,\pte
+	STREG		\pte,0(\ptep)
+
+	cmpib,COND(=),n        0,\spc,3f
+	ldi             1,\tmp1
+	stw             \tmp1,0(\tmp)
+3:
+#else
 	ldi		_PAGE_ACCESSED,\tmp1
 	or		\tmp1,\pte,\tmp
 	and,COND(<>)	\tmp1,\pte,%r0
 	STREG		\tmp,0(\ptep)
+#endif
 	.endm
 
 	/* Set the dirty bit (and accessed bit).  No need to be
 	 * clever, this is only used from the dirty fault */
-	.macro		update_dirty	ptep,pte,tmp
-	ldi		_PAGE_ACCESSED|_PAGE_DIRTY,\tmp
-	or		\tmp,\pte,\pte
+	.macro		update_dirty	ptep,pte,spc,tmp,tmp1
+#ifdef CONFIG_SMP
+	cmpib,COND(=),n        0,\spc,2f
+	load32		PA(pa_dbit_lock),\tmp
+1:
+	LDCW		0(\tmp),\tmp1
+	cmpib,COND(=)         0,\tmp1,1b
+	nop
+	LDREG		0(\ptep),\pte
+2:
+#endif
+
+	ldi		_PAGE_ACCESSED|_PAGE_DIRTY,\tmp1
+	or		\tmp1,\pte,\pte
 	STREG		\pte,0(\ptep)
+
+#ifdef CONFIG_SMP
+	cmpib,COND(=),n        0,\spc,3f
+	ldi             1,\tmp1
+	stw             \tmp1,0(\tmp)
+3:
+#endif
 	.endm
 
 	/* bitshift difference between a PFN (based on kernel's PAGE_SIZE)
@@ -1214,7 +1224,7 @@ dtlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,dtlb_check_alias_20w
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 	
@@ -1238,7 +1248,7 @@ nadtlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,nadtlb_check_flush_20w
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
@@ -1272,7 +1282,7 @@ dtlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_11
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1321,7 +1331,7 @@ nadtlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_11
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1368,7 +1378,7 @@ dtlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_20
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
@@ -1394,7 +1404,7 @@ nadtlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_20
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
@@ -1508,7 +1518,7 @@ itlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 	
@@ -1526,7 +1536,7 @@ itlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1548,7 +1558,7 @@ itlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	update_ptep	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
@@ -1570,29 +1580,11 @@ dbit_trap_20w:
 
 	L3_ptep		ptp,pte,t0,va,dbit_fault
 
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nolock_20w
-	load32		PA(pa_dbit_lock),t0
-
-dbit_spin_20w:
-	LDCW		0(t0),t1
-	cmpib,COND(=)         0,t1,dbit_spin_20w
-	nop
-
-dbit_nolock_20w:
-#endif
-	update_dirty	ptp,pte,t1
+	update_dirty	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 		
 	idtlbt          pte,prot
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_20w
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_20w:
-#endif
 
 	rfir
 	nop
@@ -1606,18 +1598,7 @@ dbit_trap_11:
 
 	L2_ptep		ptp,pte,t0,va,dbit_fault
 
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nolock_11
-	load32		PA(pa_dbit_lock),t0
-
-dbit_spin_11:
-	LDCW		0(t0),t1
-	cmpib,=         0,t1,dbit_spin_11
-	nop
-
-dbit_nolock_11:
-#endif
-	update_dirty	ptp,pte,t1
+	update_dirty	ptp,pte,spc,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1628,13 +1609,6 @@ dbit_nolock_11:
 	idtlbp		prot,(%sr1,va)
 
 	mtsp            t1, %sr1     /* Restore sr1 */
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_11
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_11:
-#endif
 
 	rfir
 	nop
@@ -1646,18 +1620,7 @@ dbit_trap_20:
 
 	L2_ptep		ptp,pte,t0,va,dbit_fault
 
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nolock_20
-	load32		PA(pa_dbit_lock),t0
-
-dbit_spin_20:
-	LDCW		0(t0),t1
-	cmpib,=         0,t1,dbit_spin_20
-	nop
-
-dbit_nolock_20:
-#endif
-	update_dirty	ptp,pte,t1
+	update_dirty	ptp,pte,spc,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
@@ -1665,14 +1628,6 @@ dbit_nolock_20:
 	
         idtlbt          pte,prot
 
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_20
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_20:
-#endif
--6TrnltStXW4iwmi0--
