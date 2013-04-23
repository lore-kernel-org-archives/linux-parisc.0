From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use spin_lock_irqsave/spin_unlock_irqrestore for PTE
 updates
Date: Wed, 24 Apr 2013 00:06:04 +0200
Message-ID: <20130423220604.GA7659@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: John David Anglin <dave.anglin@bell.net>

User applications running on SMP kernels have long suffered from instability
and random segmentation faults.  This patch improves the situation although
there is more work to be done.

One of the problems is the various routines in pgtable.h that update page table
entries use different locking mechanisms, or no lock at all (set_pte_at).  This
change modifies the routines to all use the same lock pa_dbit_lock.  This lock
is used for dirty bit updates in the interruption code. The patch also purges
the TLB entries associated with the PTE to ensure that inconsistent values are
not used after the page table entry is updated.  The UP and SMP code are now
identical.

The change also includes a minor update to the purge_tlb_entries function in
cache.c to improve its efficiency.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Cc: Helge Deller <deller@gmx.de> 


diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 7df49fa..d5ad7a6 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -16,6 +16,8 @@
 #include <asm/processor.h>
 #include <asm/cache.h>
 
+extern spinlock_t pa_dbit_lock;
+
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
  * memory.  For the return value to be meaningful, ADDR must be >=
@@ -44,8 +46,11 @@ extern void purge_tlb_entries(struct mm_struct *, unsigned long);
 
 #define set_pte_at(mm, addr, ptep, pteval)                      \
 	do {                                                    \
+		unsigned long flags;				\
+		spin_lock_irqsave(&pa_dbit_lock, flags);	\
 		set_pte(ptep, pteval);                          \
 		purge_tlb_entries(mm, addr);                    \
+		spin_unlock_irqrestore(&pa_dbit_lock, flags);	\
 	} while (0)
 
 #endif /* !__ASSEMBLY__ */
@@ -435,48 +440,46 @@ extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t *);
 
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
-#ifdef CONFIG_SMP
+	pte_t pte;
+	unsigned long flags;
+
 	if (!pte_young(*ptep))
 		return 0;
-	return test_and_clear_bit(xlate_pabit(_PAGE_ACCESSED_BIT), &pte_val(*ptep));
-#else
-	pte_t pte = *ptep;
-	if (!pte_young(pte))
+
+	spin_lock_irqsave(&pa_dbit_lock, flags);
+	pte = *ptep;
+	if (!pte_young(pte)) {
+		spin_unlock_irqrestore(&pa_dbit_lock, flags);
 		return 0;
-	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
+	}
+	set_pte(ptep, pte_mkold(pte));
+	purge_tlb_entries(vma->vm_mm, addr);
+	spin_unlock_irqrestore(&pa_dbit_lock, flags);
 	return 1;
-#endif
 }
 
-extern spinlock_t pa_dbit_lock;
-
 struct mm_struct;
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	pte_t old_pte;
+	unsigned long flags;
 
-	spin_lock(&pa_dbit_lock);
+	spin_lock_irqsave(&pa_dbit_lock, flags);
 	old_pte = *ptep;
 	pte_clear(mm,addr,ptep);
-	spin_unlock(&pa_dbit_lock);
+	purge_tlb_entries(mm, addr);
+	spin_unlock_irqrestore(&pa_dbit_lock, flags);
 
 	return old_pte;
 }
 
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
-#ifdef CONFIG_SMP
-	unsigned long new, old;
-
-	do {
-		old = pte_val(*ptep);
-		new = pte_val(pte_wrprotect(__pte (old)));
-	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
+	unsigned long flags;
+	spin_lock_irqsave(&pa_dbit_lock, flags);
+	set_pte(ptep, pte_wrprotect(*ptep));
 	purge_tlb_entries(mm, addr);
-#else
-	pte_t old_pte = *ptep;
-	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
-#endif
+	spin_unlock_irqrestore(&pa_dbit_lock, flags);
 }
 
 #define pte_same(A,B)	(pte_val(A) == pte_val(B))
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 4b12890..83ded26 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -421,14 +421,11 @@ void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 	/* Note: purge_tlb_entries can be called at startup with
 	   no context.  */
 
-	/* Disable preemption while we play with %sr1.  */
-	preempt_disable();
-	mtsp(mm->context, 1);
 	purge_tlb_start(flags);
+	mtsp(mm->context, 1);
 	pdtlb(addr);
 	pitlb(addr);
 	purge_tlb_end(flags);
-	preempt_enable();
 }
 EXPORT_SYMBOL(purge_tlb_entries);
 
