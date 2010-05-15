From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sat, 15 May 2010 17:02:52 -0400
Message-ID: <20100515210251.GA16614@hiauly1.hia.nrc.ca>
References: <20100511212628.59FFD505C@hiauly1.hia.nrc.ca> <4BE9CEF6.7010203@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BE9CEF6.7010203@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 11 May 2010, Helge Deller wrote:

> On 05/11/2010 11:26 PM, John David Anglin wrote:
> >> On 05/10/2010 09:20 PM, Helge Deller wrote:
> >>> On 05/10/2010 04:56 PM, John David Anglin wrote:
> >>>> Yes, just after sending, I noticed gcc testsuite and minifail were
> >>>> broken on gsyprf11.  [...]
> >>>>
> >>>> The attached works better on gsyprf11.  I haven't tested it on anything
> >>>> else.
> >>
> >> Hi Dave,
> >>
> >> I still can see segfaults of the minifail_dave.cpp program.

I haven't seen any abnormal segfaults with the attached change on
my rp3440 and gsyprf11.  Need to flush in pte_wrprotect for minifail,
and to flush in copy_user_page to fix occasional segfaults in sh.
The flushes in kmap/kunmap weren't sufficient.

Still experimenting to see if number of flushes can be reduced, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="diff-20100514.d"

diff --git a/arch/parisc/hpux/wrappers.S b/arch/parisc/hpux/wrappers.S
index 58c53c8..bdcea33 100644
--- a/arch/parisc/hpux/wrappers.S
+++ b/arch/parisc/hpux/wrappers.S
@@ -88,7 +88,7 @@ ENTRY(hpux_fork_wrapper)
 
 	STREG	%r2,-20(%r30)
 	ldo	64(%r30),%r30
-	STREG	%r2,PT_GR19(%r1)	;! save for child
+	STREG	%r2,PT_SYSCALL_RP(%r1)	;! save for child
 	STREG	%r30,PT_GR21(%r1)	;! save for child
 
 	LDREG	PT_GR30(%r1),%r25
@@ -132,7 +132,7 @@ ENTRY(hpux_child_return)
 	bl,n	schedule_tail, %r2
 #endif
 
-	LDREG	TASK_PT_GR19-TASK_SZ_ALGN-128(%r30),%r2
+	LDREG	TASK_PT_SYSCALL_RP-TASK_SZ_ALGN-128(%r30),%r2
 	b fork_return
 	copy %r0,%r28
 ENDPROC(hpux_child_return)
diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 716634d..ad7df44 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -24,29 +24,46 @@
  * Hash function to index into a different SPINLOCK.
  * Since "a" is usually an address, use one spinlock per cacheline.
  */
-#  define ATOMIC_HASH_SIZE 4
-#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
+#  define ATOMIC_HASH_SIZE (4096/L1_CACHE_BYTES)  /* 4 */
+#  define ATOMIC_HASH(a)      (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
+#  define ATOMIC_USER_HASH(a) (&(__atomic_user_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
 
 extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;
+extern arch_spinlock_t __atomic_user_hash[ATOMIC_HASH_SIZE] __lock_aligned;
 
 /* Can't use raw_spin_lock_irq because of #include problems, so
  * this is the substitute */
-#define _atomic_spin_lock_irqsave(l,f) do {	\
-	arch_spinlock_t *s = ATOMIC_HASH(l);		\
+#define _atomic_spin_lock_irqsave_template(l,f,hash_func) do {	\
+	arch_spinlock_t *s = hash_func;		\
 	local_irq_save(f);			\
 	arch_spin_lock(s);			\
 } while(0)
 
-#define _atomic_spin_unlock_irqrestore(l,f) do {	\
-	arch_spinlock_t *s = ATOMIC_HASH(l);			\
+#define _atomic_spin_unlock_irqrestore_template(l,f,hash_func) do {	\
+	arch_spinlock_t *s = hash_func;			\
 	arch_spin_unlock(s);				\
 	local_irq_restore(f);				\
 } while(0)
 
+/* kernel memory locks */
+#define _atomic_spin_lock_irqsave(l,f)	\
+	_atomic_spin_lock_irqsave_template(l,f,ATOMIC_HASH(l))
+
+#define _atomic_spin_unlock_irqrestore(l,f)	\
+	_atomic_spin_unlock_irqrestore_template(l,f,ATOMIC_HASH(l))
+
+/* userspace memory locks */
+#define _atomic_spin_lock_irqsave_user(l,f)	\
+	_atomic_spin_lock_irqsave_template(l,f,ATOMIC_USER_HASH(l))
+
+#define _atomic_spin_unlock_irqrestore_user(l,f)	\
+	_atomic_spin_unlock_irqrestore_template(l,f,ATOMIC_USER_HASH(l))
 
 #else
 #  define _atomic_spin_lock_irqsave(l,f) do { local_irq_save(f); } while (0)
 #  define _atomic_spin_unlock_irqrestore(l,f) do { local_irq_restore(f); } while (0)
+#  define _atomic_spin_lock_irqsave_user(l,f) _atomic_spin_lock_irqsave(l,f)
+#  define _atomic_spin_unlock_irqrestore_user(l,f) _atomic_spin_unlock_irqrestore(l,f)
 #endif
 
 /* This should get optimized out since it's never called.
diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 7a73b61..b90c895 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -2,6 +2,7 @@
 #define _PARISC_CACHEFLUSH_H
 
 #include <linux/mm.h>
+#include <linux/uaccess.h>
 
 /* The usual comment is "Caches aren't brain-dead on the <architecture>".
  * Unfortunately, that doesn't apply to PA-RISC. */
@@ -104,21 +105,32 @@ void mark_rodata_ro(void);
 #define ARCH_HAS_KMAP
 
 void kunmap_parisc(void *addr);
+void *kmap_parisc(struct page *page);
 
 static inline void *kmap(struct page *page)
 {
 	might_sleep();
-	return page_address(page);
+	return kmap_parisc(page);
 }
 
 #define kunmap(page)			kunmap_parisc(page_address(page))
 
-#define kmap_atomic(page, idx)		page_address(page)
+static inline void *kmap_atomic(struct page *page, enum km_type idx)
+{
+	pagefault_disable();
+	return kmap_parisc(page);
+}
 
-#define kunmap_atomic(addr, idx)	kunmap_parisc(addr)
+static inline void kunmap_atomic(void *addr, enum km_type idx)
+{
+	kunmap_parisc(addr);
+	pagefault_enable();
+}
 
-#define kmap_atomic_pfn(pfn, idx)	page_address(pfn_to_page(pfn))
-#define kmap_atomic_to_page(ptr)	virt_to_page(ptr)
+#define kmap_atomic_prot(page, idx, prot)	kmap_atomic(page, idx)
+#define kmap_atomic_pfn(pfn, idx)	kmap_atomic(pfn_to_page(pfn), (idx))
+#define kmap_atomic_to_page(ptr)	virt_to_page(kmap_atomic(virt_to_page(ptr), (enum km_type) 0))
+#define kmap_flush_unused()	do {} while(0)
 #endif
 
 #endif /* _PARISC_CACHEFLUSH_H */
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 0c705c3..7bc963e 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -55,6 +55,7 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
 {
 	int err = 0;
 	int uval;
+	unsigned long flags;
 
 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
 	 * our gateway page, and causes no end of trouble...
@@ -65,10 +66,15 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
 		return -EFAULT;
 
+	_atomic_spin_lock_irqsave_user(uaddr, flags);
+
 	err = get_user(uval, uaddr);
-	if (err) return -EFAULT;
-	if (uval == oldval)
-		err = put_user(newval, uaddr);
+	if (!err)
+		if (uval == oldval)
+			err = put_user(newval, uaddr);
+
+	_atomic_spin_unlock_irqrestore_user(uaddr, flags);
+
 	if (err) return -EFAULT;
 	return uval;
 }
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a27d2e2..2c6da94 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -30,15 +30,21 @@
  */
 #define kern_addr_valid(addr)	(1)
 
+extern spinlock_t pa_pte_lock;
+extern spinlock_t pa_tlb_lock;
+
 /* Certain architectures need to do special things when PTEs
  * within a page table are directly modified.  Thus, the following
  * hook is made available.
  */
-#define set_pte(pteptr, pteval)                                 \
-        do{                                                     \
+#define set_pte(pteptr, pteval)					\
+        do {							\
+		unsigned long flags;				\
+		spin_lock_irqsave(&pa_pte_lock, flags);		\
                 *(pteptr) = (pteval);                           \
+		spin_unlock_irqrestore(&pa_pte_lock, flags);	\
         } while(0)
-#define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
+#define set_pte_at(mm,addr,ptep,pteval)	set_pte(ptep, pteval)
 
 #endif /* !__ASSEMBLY__ */
 
@@ -262,6 +268,7 @@ extern unsigned long *empty_zero_page;
 #define pte_none(x)     ((pte_val(x) == 0) || (pte_val(x) & _PAGE_FLUSH))
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
 #define pte_clear(mm,addr,xp)	do { pte_val(*(xp)) = 0; } while (0)
+#define pte_same(A,B)	(pte_val(A) == pte_val(B))
 
 #define pmd_flag(x)	(pmd_val(x) & PxD_FLAG_MASK)
 #define pmd_address(x)	((unsigned long)(pmd_val(x) &~ PxD_FLAG_MASK) << PxD_VALUE_SHIFT)
@@ -410,6 +417,7 @@ extern void paging_init (void);
 
 #define PG_dcache_dirty         PG_arch_1
 
+extern void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long pfn);
 extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t);
 
 /* Encode and de-code a swap entry */
@@ -423,56 +431,84 @@ extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+static inline void __flush_tlb_page(struct mm_struct *mm, unsigned long addr)
 {
-#ifdef CONFIG_SMP
-	if (!pte_young(*ptep))
-		return 0;
-	return test_and_clear_bit(xlate_pabit(_PAGE_ACCESSED_BIT), &pte_val(*ptep));
-#else
-	pte_t pte = *ptep;
-	if (!pte_young(pte))
-		return 0;
-	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
-	return 1;
-#endif
+	unsigned long flags;
+
+	/* For one page, it's not worth testing the split_tlb variable.  */
+	spin_lock_irqsave(&pa_tlb_lock, flags);
+	mtsp(mm->context,1);
+	pdtlb(addr);
+	pitlb(addr);
+	spin_unlock_irqrestore(&pa_tlb_lock, flags);
 }
 
-extern spinlock_t pa_dbit_lock;
+static inline int ptep_set_access_flags(struct vm_area_struct *vma, unsigned
+ long addr, pte_t *ptep, pte_t entry, int dirty)
+{
+	int changed;
+	unsigned long flags;
+	spin_lock_irqsave(&pa_pte_lock, flags);
+	changed = !pte_same(*ptep, entry);
+	if (changed) {
+		*ptep = entry;
+	}
+	spin_unlock_irqrestore(&pa_pte_lock, flags);
+	if (changed) {
+		__flush_tlb_page(vma->vm_mm, addr);
+	}
+	return changed;
+}
+
+static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+{
+	pte_t pte;
+	unsigned long flags;
+	int r;
+
+	spin_lock_irqsave(&pa_pte_lock, flags);
+	pte = *ptep;
+	if (pte_young(pte)) {
+		*ptep = pte_mkold(pte);
+		r = 1;
+	} else {
+		r = 0;
+	}
+	spin_unlock_irqrestore(&pa_pte_lock, flags);
+
+	return r;
+}
 
 struct mm_struct;
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
-	pte_t old_pte;
-	pte_t pte;
+	pte_t pte, old_pte;
+	unsigned long flags;
 
-	spin_lock(&pa_dbit_lock);
+	spin_lock_irqsave(&pa_pte_lock, flags);
 	pte = old_pte = *ptep;
 	pte_val(pte) &= ~_PAGE_PRESENT;
 	pte_val(pte) |= _PAGE_FLUSH;
-	set_pte_at(mm,addr,ptep,pte);
-	spin_unlock(&pa_dbit_lock);
+	*ptep = pte;
+	spin_unlock_irqrestore(&pa_pte_lock, flags);
 
 	return old_pte;
 }
 
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
-#ifdef CONFIG_SMP
-	unsigned long new, old;
-
-	do {
-		old = pte_val(*ptep);
-		new = pte_val(pte_wrprotect(__pte (old)));
-	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
-#else
-	pte_t old_pte = *ptep;
-	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
-#endif
+	pte_t old_pte;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pa_pte_lock, flags);
+	old_pte = *ptep;
+	*ptep = pte_wrprotect(old_pte);
+	WARN_ON(!pte_present(old_pte) && !(pte_val(old_pte) & _PAGE_FLUSH));
+	__flush_tlb_page(mm, addr);
+	flush_cache_page(vma, addr, pte_pfn(old_pte));
+	spin_unlock_irqrestore(&pa_pte_lock, flags);
 }
 
-#define pte_same(A,B)	(pte_val(A) == pte_val(B))
-
 #endif /* !__ASSEMBLY__ */
 
 
@@ -504,6 +540,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 
 #define HAVE_ARCH_UNMAPPED_AREA
 
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/parisc/include/asm/system.h b/arch/parisc/include/asm/system.h
index d91357b..4653c77 100644
--- a/arch/parisc/include/asm/system.h
+++ b/arch/parisc/include/asm/system.h
@@ -160,7 +160,7 @@ static inline void set_eiem(unsigned long val)
    ldcd). */
 
 #define __PA_LDCW_ALIGNMENT	4
-#define __ldcw_align(a) ((volatile unsigned int *)a)
+#define __ldcw_align(a) (&(a)->slock)
 #define __LDCW	"ldcw,co"
 
 #endif /*!CONFIG_PA20*/
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index ec787b4..b2f35b2 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -137,6 +137,7 @@ int main(void)
 	DEFINE(TASK_PT_IAOQ0, offsetof(struct task_struct, thread.regs.iaoq[0]));
 	DEFINE(TASK_PT_IAOQ1, offsetof(struct task_struct, thread.regs.iaoq[1]));
 	DEFINE(TASK_PT_CR27, offsetof(struct task_struct, thread.regs.cr27));
+	DEFINE(TASK_PT_SYSCALL_RP, offsetof(struct task_struct, thread.regs.pad0));
 	DEFINE(TASK_PT_ORIG_R28, offsetof(struct task_struct, thread.regs.orig_r28));
 	DEFINE(TASK_PT_KSP, offsetof(struct task_struct, thread.regs.ksp));
 	DEFINE(TASK_PT_KPC, offsetof(struct task_struct, thread.regs.kpc));
@@ -225,6 +226,7 @@ int main(void)
 	DEFINE(PT_IAOQ0, offsetof(struct pt_regs, iaoq[0]));
 	DEFINE(PT_IAOQ1, offsetof(struct pt_regs, iaoq[1]));
 	DEFINE(PT_CR27, offsetof(struct pt_regs, cr27));
+	DEFINE(PT_SYSCALL_RP, offsetof(struct pt_regs, pad0));
 	DEFINE(PT_ORIG_R28, offsetof(struct pt_regs, orig_r28));
 	DEFINE(PT_KSP, offsetof(struct pt_regs, ksp));
 	DEFINE(PT_KPC, offsetof(struct pt_regs, kpc));
@@ -290,5 +292,11 @@ int main(void)
 	BLANK();
 	DEFINE(ASM_PDC_RESULT_SIZE, NUM_PDC_RESULT * sizeof(unsigned long));
 	BLANK();
+
+#ifdef CONFIG_SMP
+	DEFINE(ASM_ATOMIC_HASH_SIZE_SHIFT, __builtin_ffs(ATOMIC_HASH_SIZE)-1);
+	DEFINE(ASM_ATOMIC_HASH_ENTRY_SHIFT, __builtin_ffs(sizeof(__atomic_hash[0]))-1);
+#endif
+
 	return 0;
 }
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index b6ed34d..517537d 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -336,9 +336,9 @@ __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
 	}
 }
 
-void flush_dcache_page(struct page *page)
+static void flush_user_dcache_page_internal(struct address_space *mapping,
+					    struct page *page)
 {
-	struct address_space *mapping = page_mapping(page);
 	struct vm_area_struct *mpnt;
 	struct prio_tree_iter iter;
 	unsigned long offset;
@@ -346,14 +346,6 @@ void flush_dcache_page(struct page *page)
 	pgoff_t pgoff;
 	unsigned long pfn = page_to_pfn(page);
 
-
-	if (mapping && !mapping_mapped(mapping)) {
-		set_bit(PG_dcache_dirty, &page->flags);
-		return;
-	}
-
-	flush_kernel_dcache_page(page);
-
 	if (!mapping)
 		return;
 
@@ -387,6 +379,19 @@ void flush_dcache_page(struct page *page)
 	}
 	flush_dcache_mmap_unlock(mapping);
 }
+
+void flush_dcache_page(struct page *page)
+{
+	struct address_space *mapping = page_mapping(page);
+
+	if (mapping && !mapping_mapped(mapping)) {
+		set_bit(PG_dcache_dirty, &page->flags);
+		return;
+	}
+
+	flush_kernel_dcache_page(page);
+	flush_user_dcache_page_internal(mapping, page);
+}
 EXPORT_SYMBOL(flush_dcache_page);
 
 /* Defined in arch/parisc/kernel/pacache.S */
@@ -395,15 +400,12 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_asm);
 EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);
 
-void clear_user_page_asm(void *page, unsigned long vaddr)
+static void clear_user_page_asm(void *page, unsigned long vaddr)
 {
-	unsigned long flags;
 	/* This function is implemented in assembly in pacache.S */
 	extern void __clear_user_page_asm(void *page, unsigned long vaddr);
 
-	purge_tlb_start(flags);
 	__clear_user_page_asm(page, vaddr);
-	purge_tlb_end(flags);
 }
 
 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
@@ -440,7 +442,6 @@ void __init parisc_setup_cache_timing(void)
 }
 
 extern void purge_kernel_dcache_page(unsigned long);
-extern void clear_user_page_asm(void *page, unsigned long vaddr);
 
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
@@ -470,21 +471,10 @@ void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 {
 	/* no coherency needed (all in kmap/kunmap) */
 	copy_user_page_asm(vto, vfrom);
-	if (!parisc_requires_coherency())
-		flush_kernel_dcache_page_asm(vto);
+	flush_kernel_dcache_page_asm(vto);
 }
 EXPORT_SYMBOL(copy_user_page);
 
-#ifdef CONFIG_PA8X00
-
-void kunmap_parisc(void *addr)
-{
-	if (parisc_requires_coherency())
-		flush_kernel_dcache_page_addr(addr);
-}
-EXPORT_SYMBOL(kunmap_parisc);
-#endif
-
 void __flush_tlb_range(unsigned long sid, unsigned long start,
 		       unsigned long end)
 {
@@ -577,3 +567,25 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 		__flush_cache_page(vma, vmaddr);
 
 }
+
+void *kmap_parisc(struct page *page)
+{
+	/* this is a killer.  There's no easy way to test quickly if
+	 * this page is dirty in any userspace.  Additionally, for
+	 * kernel alterations of the page, we'd need it invalidated
+	 * here anyway, so currently flush (and invalidate)
+	 * universally */
+	flush_user_dcache_page_internal(page_mapping(page), page);
+	return page_address(page);
+}
+EXPORT_SYMBOL(kmap_parisc);
+
+void kunmap_parisc(void *addr)
+{
+	/* flush and invalidate the kernel mapping.  We need the
+	 * invalidate so we don't have stale data at this cache
+	 * location the next time the page is mapped */
+	flush_kernel_dcache_page_addr(addr);
+}
+EXPORT_SYMBOL(kunmap_parisc);
+
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3a44f7f..e1c0128 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -45,7 +45,7 @@
 	.level 2.0
 #endif
 
-	.import         pa_dbit_lock,data
+	.import         pa_pte_lock,data
 
 	/* space_to_prot macro creates a prot id from a space id */
 
@@ -364,32 +364,6 @@
 	.align		32
 	.endm
 
-	/* The following are simple 32 vs 64 bit instruction
-	 * abstractions for the macros */
-	.macro		EXTR	reg1,start,length,reg2
-#ifdef CONFIG_64BIT
-	extrd,u		\reg1,32+(\start),\length,\reg2
-#else
-	extrw,u		\reg1,\start,\length,\reg2
-#endif
-	.endm
-
-	.macro		DEP	reg1,start,length,reg2
-#ifdef CONFIG_64BIT
-	depd		\reg1,32+(\start),\length,\reg2
-#else
-	depw		\reg1,\start,\length,\reg2
-#endif
-	.endm
-
-	.macro		DEPI	val,start,length,reg
-#ifdef CONFIG_64BIT
-	depdi		\val,32+(\start),\length,\reg
-#else
-	depwi		\val,\start,\length,\reg
-#endif
-	.endm
-
 	/* In LP64, the space contains part of the upper 32 bits of the
 	 * fault.  We have to extract this and place it in the va,
 	 * zeroing the corresponding bits in the space register */
@@ -442,19 +416,19 @@
 	 */
 	.macro		L2_ptep	pmd,pte,index,va,fault
 #if PT_NLEVELS == 3
-	EXTR		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
+	extru		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
 #else
-	EXTR		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
+	extru		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 #endif
-	DEP             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
+	dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	copy		%r0,\pte
 	ldw,s		\index(\pmd),\pmd
 	bb,>=,n		\pmd,_PxD_PRESENT_BIT,\fault
-	DEP		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
+	dep		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
 	copy		\pmd,%r9
 	SHLREG		%r9,PxD_VALUE_SHIFT,\pmd
-	EXTR		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
-	DEP		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
+	extru		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
+	dep		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd
 	LDREG		%r0(\pmd),\pte		/* pmd is now pte */
 	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
@@ -488,13 +462,44 @@
 	L2_ptep		\pgd,\pte,\index,\va,\fault
 	.endm
 
+	/* SMP lock for consistent PTE updates.  Unlocks and jumps
+	   to FAULT if the page is not present.  Note the preceeding
+	   load of the PTE can't be deleted since we can't fault holding
+	   the lock.  */ 
+	.macro		pte_lock	ptep,pte,spc,tmp,tmp1,fault
+#ifdef CONFIG_SMP
+	cmpib,COND(=),n        0,\spc,2f
+	load32		PA(pa_pte_lock),\tmp1
+1:
+	LDCW		0(\tmp1),\tmp
+	cmpib,COND(=)         0,\tmp,1b
+	nop
+	LDREG		%r0(\ptep),\pte
+	bb,<,n		\pte,_PAGE_PRESENT_BIT,2f
+	ldi             1,\tmp
+	stw             \tmp,0(\tmp1)
+	b,n		\fault
+2:
+#endif
+	.endm
+
+	.macro		pte_unlock	spc,tmp,tmp1
+#ifdef CONFIG_SMP
+	cmpib,COND(=),n        0,\spc,1f
+	ldi             1,\tmp
+	stw             \tmp,0(\tmp1)
+1:
+#endif
+	.endm
+
 	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
 	 * don't needlessly dirty the cache line if it was already set */
-	.macro		update_ptep	ptep,pte,tmp,tmp1
-	ldi		_PAGE_ACCESSED,\tmp1
-	or		\tmp1,\pte,\tmp
-	and,COND(<>)	\tmp1,\pte,%r0
-	STREG		\tmp,0(\ptep)
+	.macro		update_ptep	ptep,pte,tmp
+	bb,<,n		\pte,_PAGE_ACCESSED_BIT,1f
+	ldi		_PAGE_ACCESSED,\tmp
+	or		\tmp,\pte,\pte
+	STREG		\pte,0(\ptep)
+1:
 	.endm
 
 	/* Set the dirty bit (and accessed bit).  No need to be
@@ -605,7 +610,7 @@
 	depdi		0,31,32,\tmp
 #endif
 	copy		\va,\tmp1
-	DEPI		0,31,23,\tmp1
+	depi		0,31,23,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	ldi		(_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),\prot
 	depd,z		\prot,8,7,\prot
@@ -622,6 +627,39 @@
 	or		%r26,%r0,\pte
 	.endm 
 
+	/* Save PTE for recheck if SMP.  */
+	.macro		save_pte	pte,tmp
+#ifdef CONFIG_SMP
+	copy		\pte,\tmp
+#endif
+	.endm
+
+	/* Reload the PTE and purge the data TLB entry if the new
+	   value is different from the old one.  */
+	.macro		dtlb_recheck	ptep,old_pte,spc,va,tmp
+#ifdef CONFIG_SMP
+	LDREG		%r0(\ptep),\tmp
+	cmpb,COND(=),n	\old_pte,\tmp,1f
+	mfsp		%sr1,\tmp
+	mtsp		\spc,%sr1
+	pdtlb,l		%r0(%sr1,\va)
+	mtsp		\tmp,%sr1
+1:
+#endif
+	.endm
+
+	.macro		itlb_recheck	ptep,old_pte,spc,va,tmp
+#ifdef CONFIG_SMP
+	LDREG		%r0(\ptep),\tmp
+	cmpb,COND(=),n	\old_pte,\tmp,1f
+	mfsp		%sr1,\tmp
+	mtsp		\spc,%sr1
+	pitlb,l		%r0(%sr1,\va)
+	mtsp		\tmp,%sr1
+1:
+#endif
+	.endm
+
 
 	/*
 	 * Align fault_vector_20 on 4K boundary so that both
@@ -758,6 +796,10 @@ ENTRY(__kernel_thread)
 
 	STREG	%r22, PT_GR22(%r1)	/* save r22 (arg5) */
 	copy	%r0, %r22		/* user_tid */
+	copy	%r0, %r21		/* child_tid */
+#else
+	stw	%r0, -52(%r30)	     	/* user_tid */
+	stw	%r0, -56(%r30)	     	/* child_tid */
 #endif
 	STREG	%r26, PT_GR26(%r1)  /* Store function & argument for child */
 	STREG	%r25, PT_GR25(%r1)
@@ -765,7 +807,7 @@ ENTRY(__kernel_thread)
 	ldo	CLONE_VM(%r26), %r26   /* Force CLONE_VM since only init_mm */
 	or	%r26, %r24, %r26      /* will have kernel mappings.	 */
 	ldi	1, %r25			/* stack_start, signals kernel thread */
-	stw	%r0, -52(%r30)	     	/* user_tid */
+	ldi	0, %r23			/* child_stack_size */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
@@ -972,7 +1014,10 @@ intr_check_sig:
 	BL	do_notify_resume,%r2
 	copy	%r16, %r26			/* struct pt_regs *regs */
 
-	b,n	intr_check_sig
+	mfctl   %cr30,%r16		/* Reload */
+	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
+	b	intr_check_sig
+	ldo	TASK_REGS(%r16),%r16
 
 intr_restore:
 	copy            %r16,%r29
@@ -997,13 +1042,6 @@ intr_restore:
 
 	rfi
 	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
 
 #ifndef CONFIG_PREEMPT
 # define intr_do_preempt	intr_restore
@@ -1026,14 +1064,12 @@ intr_do_resched:
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	ldil	L%intr_check_sig, %r2
-#ifndef CONFIG_64BIT
-	b	schedule
-#else
-	load32	schedule, %r20
-	bv	%r0(%r20)
-#endif
-	ldo	R%intr_check_sig(%r2), %r2
+	BL	schedule,%r2
+	nop
+	mfctl   %cr30,%r16		/* Reload */
+	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
+	b	intr_check_sig
+	ldo	TASK_REGS(%r16),%r16
 
 	/* preempt the current task on returning to kernel
 	 * mode from an interrupt, iff need_resched is set,
@@ -1214,11 +1250,14 @@ dtlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,dtlb_check_alias_20w
 
-	update_ptep	ptp,pte,t0,t1
+	pte_lock	ptp,pte,spc,t0,t1,dtlb_check_alias_20w
+	update_ptep	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
-	
 	idtlbt          pte,prot
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1238,11 +1277,10 @@ nadtlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,nadtlb_check_flush_20w
 
-	update_ptep	ptp,pte,t0,t1
-
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
-
 	idtlbt          pte,prot
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1272,8 +1310,11 @@ dtlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_11
 
-	update_ptep	ptp,pte,t0,t1
+	pte_lock	ptp,pte,spc,t0,t1,dtlb_check_alias_11
+	update_ptep	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb_11	spc,pte,prot
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
@@ -1283,6 +1324,7 @@ dtlb_miss_11:
 	idtlbp		prot,(%sr1,va)
 
 	mtsp		t0, %sr1	/* Restore sr1 */
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1321,11 +1363,9 @@ nadtlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_11
 
-	update_ptep	ptp,pte,t0,t1
-
+	save_pte	pte,t1
 	make_insert_tlb_11	spc,pte,prot
 
-
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
 
@@ -1333,6 +1373,7 @@ nadtlb_miss_11:
 	idtlbp		prot,(%sr1,va)
 
 	mtsp		t0, %sr1	/* Restore sr1 */
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1368,13 +1409,17 @@ dtlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_20
 
-	update_ptep	ptp,pte,t0,t1
+	pte_lock	ptp,pte,spc,t0,t1,dtlb_check_alias_20
+	update_ptep	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t0
 
 	idtlbt          pte,prot
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1394,13 +1439,13 @@ nadtlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_20
 
-	update_ptep	ptp,pte,t0,t1
-
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t0
 	
         idtlbt          pte,prot
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1508,11 +1553,14 @@ itlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	pte_lock	ptp,pte,spc,t0,t1,itlb_fault
+	update_ptep	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
-	
 	iitlbt          pte,prot
+	itlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1526,8 +1574,11 @@ itlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	pte_lock	ptp,pte,spc,t0,t1,itlb_fault
+	update_ptep	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb_11	spc,pte,prot
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
@@ -1537,6 +1588,7 @@ itlb_miss_11:
 	iitlbp		prot,(%sr1,va)
 
 	mtsp		t0, %sr1	/* Restore sr1 */
+	itlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1548,13 +1600,17 @@ itlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	pte_lock	ptp,pte,spc,t0,t1,itlb_fault
+	update_ptep	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t0	
 
 	iitlbt          pte,prot
+	itlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1570,29 +1626,14 @@ dbit_trap_20w:
 
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
+	pte_lock	ptp,pte,spc,t0,t1,dbit_fault
+	update_dirty	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
-		
 	idtlbt          pte,prot
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_20w
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_20w:
-#endif
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1606,35 +1647,21 @@ dbit_trap_11:
 
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
+	pte_lock	ptp,pte,spc,t0,t1,dbit_fault
+	update_dirty	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb_11	spc,pte,prot
 
-	mfsp            %sr1,t1  /* Save sr1 so we can use it in tlb inserts */
+	mfsp            %sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
 
 	idtlba		pte,(%sr1,va)
 	idtlbp		prot,(%sr1,va)
 
-	mtsp            t1, %sr1     /* Restore sr1 */
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_11
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_11:
-#endif
+	mtsp            t0, %sr1     /* Restore sr1 */
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1646,32 +1673,17 @@ dbit_trap_20:
 
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
+	pte_lock	ptp,pte,spc,t0,t1,dbit_fault
+	update_dirty	ptp,pte,t0
+	pte_unlock	spc,t0,t1
 
+	save_pte	pte,t1
 	make_insert_tlb	spc,pte,prot
 
-	f_extend	pte,t1
+	f_extend	pte,t0
 	
         idtlbt          pte,prot
-
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_20
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_20:
-#endif
+	dtlb_recheck	ptp,t1,spc,va,t0
 
 	rfir
 	nop
@@ -1772,9 +1784,9 @@ ENTRY(sys_fork_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	/* These are call-clobbered registers and therefore
-	   also syscall-clobbered (we hope). */
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 
 	LDREG	PT_GR30(%r1),%r25
@@ -1804,7 +1816,7 @@ ENTRY(child_return)
 	nop
 
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30), %r1
-	LDREG	TASK_PT_GR19(%r1),%r2
+	LDREG	TASK_PT_SYSCALL_RP(%r1),%r2
 	b	wrapper_exit
 	copy	%r0,%r28
 ENDPROC(child_return)
@@ -1823,8 +1835,9 @@ ENTRY(sys_clone_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	/* WARNING - Clobbers r19 and r21, userspace must save these! */
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 	BL	sys_clone,%r2
 	copy	%r1,%r24
@@ -1847,7 +1860,9 @@ ENTRY(sys_vfork_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 
 	BL	sys_vfork,%r2
@@ -2076,9 +2091,10 @@ syscall_restore:
 	LDREG	TASK_PT_GR31(%r1),%r31	   /* restore syscall rp */
 
 	/* NOTE: We use rsm/ssm pair to make this operation atomic */
+	LDREG   TASK_PT_GR30(%r1),%r1              /* Get user sp */
 	rsm     PSW_SM_I, %r0
-	LDREG   TASK_PT_GR30(%r1),%r30             /* restore user sp */
-	mfsp	%sr3,%r1			   /* Get users space id */
+	copy    %r1,%r30                           /* Restore user sp */
+	mfsp    %sr3,%r1                           /* Get user space id */
 	mtsp    %r1,%sr7                           /* Restore sr7 */
 	ssm     PSW_SM_I, %r0
 
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 09b77b2..4f0d975 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -277,6 +277,7 @@ ENDPROC(flush_data_cache_local)
 
 	.align	16
 
+#if 1
 ENTRY(copy_user_page_asm)
 	.proc
 	.callinfo NO_CALLS
@@ -400,6 +401,7 @@ ENTRY(copy_user_page_asm)
 
 	.procend
 ENDPROC(copy_user_page_asm)
+#endif
 
 /*
  * NOTE: Code in clear_user_page has a hard coded dependency on the
@@ -548,17 +550,33 @@ ENTRY(__clear_user_page_asm)
 	depwi		0, 31,12, %r28		/* Clear any offset bits */
 #endif
 
+#ifdef CONFIG_SMP
+	ldil		L%pa_tlb_lock, %r1
+	ldo		R%pa_tlb_lock(%r1), %r24
+	rsm		PSW_SM_I, %r22
+1:
+	LDCW		0(%r24),%r25
+	cmpib,COND(=)	0,%r25,1b
+	nop
+#endif
+
 	/* Purge any old translation */
 
 	pdtlb		0(%r28)
 
+#ifdef CONFIG_SMP
+	ldi		1,%r25
+	stw		%r25,0(%r24)
+	mtsm		%r22
+#endif
+
 #ifdef CONFIG_64BIT
 	ldi		(PAGE_SIZE / 128), %r1
 
 	/* PREFETCH (Write) has not (yet) been proven to help here */
 	/* #define	PREFETCHW_OP	ldd		256(%0), %r0 */
 
-1:	std		%r0, 0(%r28)
+2:	std		%r0, 0(%r28)
 	std		%r0, 8(%r28)
 	std		%r0, 16(%r28)
 	std		%r0, 24(%r28)
@@ -574,13 +592,13 @@ ENTRY(__clear_user_page_asm)
 	std		%r0, 104(%r28)
 	std		%r0, 112(%r28)
 	std		%r0, 120(%r28)
-	addib,COND(>)		-1, %r1, 1b
+	addib,COND(>)		-1, %r1, 2b
 	ldo		128(%r28), %r28
 
 #else	/* ! CONFIG_64BIT */
 	ldi		(PAGE_SIZE / 64), %r1
 
-1:
+2:
 	stw		%r0, 0(%r28)
 	stw		%r0, 4(%r28)
 	stw		%r0, 8(%r28)
@@ -597,7 +615,7 @@ ENTRY(__clear_user_page_asm)
 	stw		%r0, 52(%r28)
 	stw		%r0, 56(%r28)
 	stw		%r0, 60(%r28)
-	addib,COND(>)		-1, %r1, 1b
+	addib,COND(>)		-1, %r1, 2b
 	ldo		64(%r28), %r28
 #endif	/* CONFIG_64BIT */
 
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index cb71f3d..84b3239 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -128,6 +128,14 @@ void __init setup_arch(char **cmdline_p)
 	printk(KERN_INFO "The 32-bit Kernel has started...\n");
 #endif
 
+	/* Consistency check on the size and alignments of our spinlocks */
+#ifdef CONFIG_SMP
+	BUILD_BUG_ON(sizeof(arch_spinlock_t) != __PA_LDCW_ALIGNMENT);
+	BUG_ON((unsigned long)&__atomic_hash[0] & (__PA_LDCW_ALIGNMENT-1));
+	BUG_ON((unsigned long)&__atomic_hash[1] & (__PA_LDCW_ALIGNMENT-1));
+#endif
+	BUILD_BUG_ON((1<<L1_CACHE_SHIFT) != L1_CACHE_BYTES);
+
 	pdc_console_init();
 
 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index f5f9602..68e75ce 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -47,18 +47,17 @@ ENTRY(linux_gateway_page)
 	KILL_INSN
 	.endr
 
-	/* ADDRESS 0xb0 to 0xb4, lws uses 1 insns for entry */
+	/* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
 	/* Light-weight-syscall entry must always be located at 0xb0 */
 	/* WARNING: Keep this number updated with table size changes */
 #define __NR_lws_entries (2)
 
 lws_entry:
-	/* Unconditional branch to lws_start, located on the 
-	   same gateway page */
-	b,n	lws_start
+	gate	lws_start, %r0		/* increase privilege */
+	depi	3, 31, 2, %r31		/* Ensure we return into user mode. */
 
-	/* Fill from 0xb4 to 0xe0 */
-	.rept 11
+	/* Fill from 0xb8 to 0xe0 */
+	.rept 10
 	KILL_INSN
 	.endr
 
@@ -423,9 +422,6 @@ tracesys_sigexit:
 
 	*********************************************************/
 lws_start:
-	/* Gate and ensure we return to userspace */
-	gate	.+8, %r0
-	depi	3, 31, 2, %r31	/* Ensure we return to userspace */
 
 #ifdef CONFIG_64BIT
 	/* FIXME: If we are a 64-bit kernel just
@@ -442,7 +438,7 @@ lws_start:
 #endif	
 
         /* Is the lws entry number valid? */
-	comiclr,>>=	__NR_lws_entries, %r20, %r0
+	comiclr,>>	__NR_lws_entries, %r20, %r0
 	b,n	lws_exit_nosys
 
 	/* WARNING: Trashing sr2 and sr3 */
@@ -473,7 +469,7 @@ lws_exit:
 	/* now reset the lowest bit of sp if it was set */
 	xor	%r30,%r1,%r30
 #endif
-	be,n	0(%sr3, %r31)
+	be,n	0(%sr7, %r31)
 
 
 	
@@ -529,7 +525,6 @@ lws_compare_and_swap32:
 #endif
 
 lws_compare_and_swap:
-#ifdef CONFIG_SMP
 	/* Load start of lock table */
 	ldil	L%lws_lock_start, %r20
 	ldo	R%lws_lock_start(%r20), %r28
@@ -572,8 +567,6 @@ cas_wouldblock:
 	ldo	2(%r0), %r28				/* 2nd case */
 	b	lws_exit				/* Contended... */
 	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
-#endif
-/* CONFIG_SMP */
 
 	/*
 		prev = *addr;
@@ -601,13 +594,11 @@ cas_action:
 1:	ldw	0(%sr3,%r26), %r28
 	sub,<>	%r28, %r25, %r0
 2:	stw	%r24, 0(%sr3,%r26)
-#ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# if ENABLE_LWS_DEBUG
+#if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
 	stw	%r0, 4(%sr2,%r20)
-# endif
 #endif
 	/* Return to userspace, set no error */
 	b	lws_exit
@@ -615,12 +606,10 @@ cas_action:
 
 3:		
 	/* Error occured on load or store */
-#ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# if ENABLE_LWS_DEBUG
+#if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
-# endif
 #endif
 	b	lws_exit
 	ldo	-EFAULT(%r0),%r21	/* set errno */
@@ -672,7 +661,6 @@ ENTRY(sys_call_table64)
 END(sys_call_table64)
 #endif
 
-#ifdef CONFIG_SMP
 	/*
 		All light-weight-syscall atomic operations 
 		will use this set of locks 
@@ -694,8 +682,6 @@ ENTRY(lws_lock_start)
 	.endr
 END(lws_lock_start)
 	.previous
-#endif
-/* CONFIG_SMP for lws_lock_start */
 
 .end
 
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 8b58bf0..804b024 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -47,7 +47,7 @@
 			  /*  dumped to the console via printk)          */
 
 #if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
-DEFINE_SPINLOCK(pa_dbit_lock);
+DEFINE_SPINLOCK(pa_pte_lock);
 #endif
 
 static void parisc_show_stack(struct task_struct *task, unsigned long *sp,
diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
index 353963d..bae6a86 100644
--- a/arch/parisc/lib/bitops.c
+++ b/arch/parisc/lib/bitops.c
@@ -15,6 +15,9 @@
 arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
 	[0 ... (ATOMIC_HASH_SIZE-1)]  = __ARCH_SPIN_LOCK_UNLOCKED
 };
+arch_spinlock_t __atomic_user_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
+	[0 ... (ATOMIC_HASH_SIZE-1)]  = __ARCH_SPIN_LOCK_UNLOCKED
+};
 #endif
 
 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/math-emu/decode_exc.c b/arch/parisc/math-emu/decode_exc.c
index 3ca1c61..27a7492 100644
--- a/arch/parisc/math-emu/decode_exc.c
+++ b/arch/parisc/math-emu/decode_exc.c
@@ -342,6 +342,7 @@ decode_fpu(unsigned int Fpu_register[], unsigned int trap_counts[])
 		return SIGNALCODE(SIGFPE, FPE_FLTINV);
 	  case DIVISIONBYZEROEXCEPTION:
 		update_trap_counts(Fpu_register, aflags, bflags, trap_counts);
+		Clear_excp_register(exception_index);
 	  	return SIGNALCODE(SIGFPE, FPE_FLTDIV);
 	  case INEXACTEXCEPTION:
 		update_trap_counts(Fpu_register, aflags, bflags, trap_counts);
diff --git a/mm/memory.c b/mm/memory.c
index 09e4b1b..21c2916 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -616,7 +616,7 @@ copy_one_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	 * in the parent and the child
 	 */
 	if (is_cow_mapping(vm_flags)) {
-		ptep_set_wrprotect(src_mm, addr, src_pte);
+		ptep_set_wrprotect(vma, src_mm, addr, src_pte);
 		pte = pte_wrprotect(pte);
 	}
 

--tThc/1wpZn/ma/RB--
