From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Happy New Year PARISC (take 2)
Date: Tue, 28 Feb 2012 10:28:10 -0500
Message-ID: <4F4CF28A.5050407@bell.net>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl>   <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>   <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>   <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl>   <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com>   <4F031B1A.4010908@bell.net>  <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com>  <4F032C4C.10805@bell.net> <1325608972.3185.8.camel@dabdike.int.hansenpartnership.com> <4F034B6B.5020809@bell.net> <BLU0-SMTP5091B64E5E2C07CEDC0D41978C0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080602000706010809020909"
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grantgrundler@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP5091B64E5E2C07CEDC0D41978C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------080602000706010809020909
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/2012 4:45 PM, John David Anglin wrote:
> Here is take take 2.  It's against linux-stable v3.2.2.  I also have a 
> very similar
> version against v3.1.10.
>
Here is take 3.  Since take 2, I have tried mainly to explore 
performance issues.

The big difference is a new implementation of flush_cache_mm where I try to
avoid the brutal flush of the whole cache.  This drops the full GCC 
build time at
-j4 from about six hours nine minutes to three hours ten minutes on 
rp3440 (i.e.,
almost by a factor two).  Build and check time is still a bit slower 
than HP-UX.
There's probably more to tweak here.

Other changes made little difference (e.g., clear_page_asm).  I also 
explored
the affect of prefetch operations in clear_page_asm and copy_page_asm, but
the difference if any was in the noise.

Dave

-- 
John David Anglin    dave.anglin@bell.net


--------------080602000706010809020909
Content-Type: text/plain;
 name="linux-stable-3.2.7-20120226-2.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="linux-stable-3.2.7-20120226-2.txt"

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
diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index da601dd..08f85dc 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -115,7 +115,9 @@ flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vma
 {
 	if (PageAnon(page)) {
 		flush_tlb_page(vma, vmaddr);
+		preempt_disable();
 		flush_dcache_page_asm(page_to_phys(page), vmaddr);
+		preempt_enable();
 	}
 }
 
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 2388bdb..7839285 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -8,6 +8,29 @@
 #include <asm/atomic.h>
 #include <asm/errno.h>
 
+/* The following has to match the LWS code in syscall.S.  We have
+   sixteen four-word locks. */
+
+static inline void
+_futex_spin_lock_irqsave (u32 __user *uaddr, unsigned long int *flags)
+{
+	extern u32 lws_lock_start[];
+	long index = ((long)uaddr & 0xf0) >> 2;
+	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+	local_irq_save(*flags);
+	arch_spin_lock(s);
+}
+
+static inline void
+_futex_spin_unlock_irqrestore (u32 __user *uaddr, unsigned long int *flags)
+{
+	extern u32 lws_lock_start[];
+	long index = ((long)uaddr & 0xf0) >> 2;
+	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+	arch_spin_unlock(s);
+	local_irq_restore(*flags);
+}
+
 static inline int
 futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 {
@@ -26,7 +49,7 @@ futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 
 	pagefault_disable();
 
-	_atomic_spin_lock_irqsave(uaddr, flags);
+	_futex_spin_lock_irqsave(uaddr, &flags);
 
 	switch (op) {
 	case FUTEX_OP_SET:
@@ -71,7 +94,7 @@ futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 		ret = -ENOSYS;
 	}
 
-	_atomic_spin_unlock_irqrestore(uaddr, flags);
+	_futex_spin_unlock_irqrestore(uaddr, &flags);
 
 	pagefault_enable();
 
@@ -113,7 +136,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	 * address. This should scale to a couple of CPUs.
 	 */
 
-	_atomic_spin_lock_irqsave(uaddr, flags);
+	_futex_spin_lock_irqsave(uaddr, &flags);
 
 	ret = get_user(val, uaddr);
 
@@ -122,7 +145,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	*uval = val;
 
-	_atomic_spin_unlock_irqrestore(uaddr, flags);
+	_futex_spin_unlock_irqrestore(uaddr, &flags);
 
 	return ret;
 }
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index a84cc1f..a2a375d 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -21,15 +21,27 @@
 #include <asm/types.h>
 #include <asm/cache.h>
 
-#define clear_page(page)	memset((void *)(page), 0, PAGE_SIZE)
-#define copy_page(to,from)      copy_user_page_asm((void *)(to), (void *)(from))
+#define clear_page(page)	clear_page_asm((void *)(page))
+#define copy_page(to,from)      copy_page_asm((void *)(to), (void *)(from))
 
 struct page;
 
-void copy_user_page_asm(void *to, void *from);
+void clear_page_asm(void *page);
+void copy_page_asm(void *to, void *from);
+void clear_user_page(void *vto, unsigned long vaddr, struct page *pg);
 void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 			   struct page *pg);
-void clear_user_page(void *page, unsigned long vaddr, struct page *pg);
+
+// #define CONFIG_PARISC_TMPALIAS
+
+#ifdef CONFIG_PARISC_TMPALIAS
+void clear_user_highpage(struct page *page, unsigned long vaddr);
+#define clear_user_highpage clear_user_highpage
+struct vm_area_struct;
+void copy_user_highpage(struct page *to, struct page *from,
+	unsigned long vaddr, struct vm_area_struct *vma);
+#define __HAVE_ARCH_COPY_USER_HIGHPAGE
+#endif
 
 /*
  * These are used to make use of C type-checking..
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 22dadeb..891b369 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -40,7 +40,14 @@ struct vm_area_struct;
         do{                                                     \
                 *(pteptr) = (pteval);                           \
         } while(0)
-#define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
+
+extern void purge_tlb_entries(struct mm_struct *, unsigned long);
+
+#define set_pte_at(mm,addr,ptep, pteval)                        \
+        do{                                                     \
+                set_pte(ptep,pteval);                           \
+                purge_tlb_entries(mm,addr);                     \
+        } while(0)
 
 #endif /* !__ASSEMBLY__ */
 
@@ -460,10 +467,13 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 #ifdef CONFIG_SMP
 	unsigned long new, old;
 
+	/* ??? This might be racy because the page table updates in
+	   entry.S don't use the same lock.  */
 	do {
 		old = pte_val(*ptep);
 		new = pte_val(pte_wrprotect(__pte (old)));
 	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
+	purge_tlb_entries(mm, addr);
 #else
 	pte_t old_pte = *ptep;
 	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index dcd5510..5df1597 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -141,6 +141,7 @@ int main(void)
 	DEFINE(TASK_PT_IAOQ0, offsetof(struct task_struct, thread.regs.iaoq[0]));
 	DEFINE(TASK_PT_IAOQ1, offsetof(struct task_struct, thread.regs.iaoq[1]));
 	DEFINE(TASK_PT_CR27, offsetof(struct task_struct, thread.regs.cr27));
+	DEFINE(TASK_PT_SYSCALL_RP, offsetof(struct task_struct, thread.regs.pad0));
 	DEFINE(TASK_PT_ORIG_R28, offsetof(struct task_struct, thread.regs.orig_r28));
 	DEFINE(TASK_PT_KSP, offsetof(struct task_struct, thread.regs.ksp));
 	DEFINE(TASK_PT_KPC, offsetof(struct task_struct, thread.regs.kpc));
@@ -230,6 +231,7 @@ int main(void)
 	DEFINE(PT_IAOQ0, offsetof(struct pt_regs, iaoq[0]));
 	DEFINE(PT_IAOQ1, offsetof(struct pt_regs, iaoq[1]));
 	DEFINE(PT_CR27, offsetof(struct pt_regs, cr27));
+	DEFINE(PT_SYSCALL_RP, offsetof(struct pt_regs, pad0));
 	DEFINE(PT_ORIG_R28, offsetof(struct pt_regs, orig_r28));
 	DEFINE(PT_KSP, offsetof(struct pt_regs, ksp));
 	DEFINE(PT_KPC, offsetof(struct pt_regs, kpc));
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 83335f3..eddeddb 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -134,7 +134,7 @@ parisc_cache_init(void)
 	if (pdc_cache_info(&cache_info) < 0)
 		panic("parisc_cache_init: pdc_cache_info failed");
 
-#if 0
+#if 1
 	printk("ic_size %lx dc_size %lx it_size %lx\n",
 		cache_info.ic_size,
 		cache_info.dc_size,
@@ -268,9 +268,11 @@ static inline void
 __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
 		   unsigned long physaddr)
 {
+	preempt_disable();
 	flush_dcache_page_asm(physaddr, vmaddr);
 	if (vma->vm_flags & VM_EXEC)
 		flush_icache_page_asm(physaddr, vmaddr);
+	preempt_enable();
 }
 
 void flush_dcache_page(struct page *page)
@@ -316,7 +318,7 @@ void flush_dcache_page(struct page *page)
 		flush_tlb_page(mpnt, addr);
 		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
+			if (old_addr && parisc_requires_coherency())
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *)mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
 			old_addr = addr;
 		}
@@ -331,17 +333,6 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_asm);
 EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);
 
-void clear_user_page_asm(void *page, unsigned long vaddr)
-{
-	unsigned long flags;
-	/* This function is implemented in assembly in pacache.S */
-	extern void __clear_user_page_asm(void *page, unsigned long vaddr);
-
-	purge_tlb_start(flags);
-	__clear_user_page_asm(page, vaddr);
-	purge_tlb_end(flags);
-}
-
 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
 int parisc_cache_flush_threshold __read_mostly = FLUSH_THRESHOLD;
 
@@ -375,20 +366,9 @@ void __init parisc_setup_cache_timing(void)
 	printk(KERN_INFO "Setting cache flush threshold to %x (%d CPUs online)\n", parisc_cache_flush_threshold, num_online_cpus());
 }
 
-extern void purge_kernel_dcache_page(unsigned long);
-extern void clear_user_page_asm(void *page, unsigned long vaddr);
-
-void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
-{
-	unsigned long flags;
-
-	purge_kernel_dcache_page((unsigned long)page);
-	purge_tlb_start(flags);
-	pdtlb_kernel(page);
-	purge_tlb_end(flags);
-	clear_user_page_asm(page, vaddr);
-}
-EXPORT_SYMBOL(clear_user_page);
+extern void purge_kernel_dcache_page_asm(unsigned long);
+extern void clear_user_page_asm(void *, unsigned long);
+extern void copy_user_page_asm(void *, void *, unsigned long);
 
 void flush_kernel_dcache_page_addr(void *addr)
 {
@@ -401,11 +381,26 @@ void flush_kernel_dcache_page_addr(void *addr)
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 
+void clear_user_page(void *vto, unsigned long vaddr, struct page *page)
+{
+	clear_page_asm(vto);
+	if (!parisc_requires_coherency())
+		flush_kernel_dcache_page_asm(vto);
+}
+EXPORT_SYMBOL(clear_user_page);
+
 void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
-		    struct page *pg)
+	struct page *pg)
 {
-	/* no coherency needed (all in kmap/kunmap) */
-	copy_user_page_asm(vto, vfrom);
+	/* Copy using kernel mapping.  No coherency is needed
+	   (all in kmap/kunmap) on machines that don't support
+	   non-equivalent aliasing.  However, the `from' page
+	   needs to be flushed before it can be accessed through
+	   the kernel mapping. */
+	preempt_disable();
+	flush_dcache_page_asm(__pa(vfrom), vaddr);
+	preempt_enable();
+	copy_page_asm(vto, vfrom);
 	if (!parisc_requires_coherency())
 		flush_kernel_dcache_page_asm(vto);
 }
@@ -460,8 +455,64 @@ void flush_cache_all(void)
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
+        if (!pgd_none(*pgd)) {
+                pud_t *pud = pud_offset(pgd, addr);
+                if (!pud_none(*pud)) {
+                        pmd_t *pmd = pmd_offset(pud, addr);
+                        if (!pmd_none(*pmd)) {
+                                ptep = pte_offset_map(pmd, addr);
+                        }
+                }
+        }
+	return ptep;
+}
+
 void flush_cache_mm(struct mm_struct *mm)
 {
+	/* Flushing the whole cache on each cpu takes forever on
+	   rp3440, etc.  So, avoid it if mm isn't too big.  */
+	if (mm_total_size(mm) < parisc_cache_flush_threshold) {
+		struct vm_area_struct *vma;
+
+		if (mm->context == mfsp(3)) {
+			for (vma = mm->mmap; vma; vma = vma->vm_next) {
+				flush_user_dcache_range_asm(vma->vm_start, vma->vm_end);
+				if(vma->vm_flags & VM_EXEC)
+					flush_user_icache_range_asm(vma->vm_start, vma->vm_end);
+			}
+		} else {
+			pgd_t *pgd = mm->pgd;
+
+			for (vma = mm->mmap; vma; vma = vma->vm_next) {
+				unsigned long addr;
+
+				for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
+					pte_t *ptep = get_ptep(pgd, addr);
+					if (ptep != NULL) {
+						pte_t pte = *ptep;
+						if (pte_present(pte))
+							__flush_cache_page(vma, addr, page_to_phys(pte_page(pte)));
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
@@ -487,20 +538,71 @@ flush_user_icache_range(unsigned long start, unsigned long end)
 		flush_instruction_cache();
 }
 
+/* While useful for testing, this check has too much overhead for
+   general use.  */
+#define DEBUG_PAGE_MAPPING 0
+
+static inline void check_page_mapping(struct page *page)
+{
+#if DEBUG_PAGE_MAPPING
+	struct address_space *mapping = page_mapping(page);
+	struct vm_area_struct *mpnt;
+	struct prio_tree_iter iter;
+	unsigned long offset;
+	unsigned long addr, old_addr = 0;
+	pgoff_t pgoff;
+
+	if (!mapping || !mapping_mapped(mapping))
+		return;
+
+	pgoff = page->index << (PAGE_CACHE_SHIFT - PAGE_SHIFT);
+
+	/* Check that all mappings are congruently mapped */
+
+	flush_dcache_mmap_lock(mapping);
+	vma_prio_tree_foreach(mpnt, &iter, &mapping->i_mmap, pgoff, pgoff) {
+		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
+		addr = mpnt->vm_start + offset;
+		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
+			if (old_addr) {
+				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *)mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
+			}
+			old_addr = addr;
+		}
+	}
+	flush_dcache_mmap_unlock(mapping);
+#endif
+}
 
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
+			flush_user_dcache_range_asm(start,end);
+			if(vma->vm_flags & VM_EXEC)
+				flush_user_icache_range_asm(start,end);
+		} else {
+			unsigned long addr;
+			pgd_t *pgd = vma->vm_mm->pgd;
+
+			for (addr = start & PAGE_MASK; addr < end; addr += PAGE_SIZE) {
+				pte_t *ptep = get_ptep(pgd, addr);
+				if (ptep) {
+					pte_t pte = *ptep;
+					check_page_mapping(pte_page(pte));
+					flush_cache_page(vma, addr, pte_pfn(pte));
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
 
@@ -513,3 +615,81 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
 
 }
+
+void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
+{
+	unsigned long flags;
+
+	/* Note: purge_tlb_entries can be called at startup with
+	   no context.  */
+
+	mtsp(mm->context,1);
+	purge_tlb_start(flags);
+	pdtlb(addr);
+	pitlb(addr);
+	purge_tlb_end(flags);
+}
+
+#ifdef CONFIG_PARISC_TMPALIAS
+
+void clear_user_highpage(struct page *page, unsigned long vaddr)
+{
+	void *vto;
+	unsigned long flags;
+
+	/* Clear using TMPALIAS region.  The page doesn't need to
+	   be flushed but the kernel mapping needs to be purged.  */
+
+	vto = kmap_atomic(page, KM_USER0);
+
+	/* The PA-RISC 2.0 Architecture book states on page F-6:
+	   "Before a write-capable translation is enabled, *all*
+	   non-equivalently-aliased translations must be removed
+	   from the page table and purged from the TLB.  (Note
+	   that the caches are not required to be flushed at this
+	   time.)  Before any non-equivalent aliased translation
+	   is re-enabled, the virtual address range for the writeable
+	   page (the entire page) must be flushed from the cache,
+	   and the write-capable translation removed from the page
+	   table and purged from the TLB."  */
+
+	purge_kernel_dcache_page_asm((unsigned long)vto);
+	purge_tlb_start(flags);
+	pdtlb_kernel(vto);
+	purge_tlb_end(flags);
+	preempt_disable();
+	clear_user_page_asm(vto, vaddr);
+	preempt_enable();
+
+	pagefault_enable();		/* kunmap_atomic(addr, KM_USER0); */
+}
+
+void copy_user_highpage(struct page *to, struct page *from,
+	unsigned long vaddr, struct vm_area_struct *vma)
+{
+	void *vfrom, *vto;
+	unsigned long flags;
+
+	/* Copy using TMPALIAS region.  This has the advantage
+	   that the `from' page doesn't need to be flushed.  However,
+	   the `to' page must be flushed in copy_user_page_asm since
+	   it can be used to bring in executable code.  */
+
+	vfrom = kmap_atomic(from, KM_USER0);
+	vto = kmap_atomic(to, KM_USER1);
+
+	purge_kernel_dcache_page_asm((unsigned long)vto);
+	purge_tlb_start(flags);
+	pdtlb_kernel(vto);
+	pdtlb_kernel(vfrom);
+	purge_tlb_end(flags);
+	preempt_disable();
+	copy_user_page_asm(vto, vfrom, vaddr);
+	flush_dcache_page_asm(__pa(vto), vaddr);
+	preempt_enable();
+
+	pagefault_enable();		/* kunmap_atomic(addr, KM_USER1); */
+	pagefault_enable();		/* kunmap_atomic(addr, KM_USER0); */
+}
+
+#endif /* CONFIG_PARISC_TMPALIAS */
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 6f05944..3caa199 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -483,7 +483,7 @@
 	 * B <-> _PAGE_DMB (memory break)
 	 *
 	 * Then incredible subtlety: The access rights are
-	 * _PAGE_GATEWAY _PAGE_EXEC _PAGE_READ
+	 * _PAGE_GATEWAY, _PAGE_EXEC and _PAGE_WRITE
 	 * See 3-14 of the parisc 2.0 manual
 	 *
 	 * Finally, _PAGE_READ goes in the top bit of PL1 (so we
@@ -493,7 +493,7 @@
 
 	/* PAGE_USER indicates the page can be read with user privileges,
 	 * so deposit X1|11 to PL1|PL2 (remember the upper bit of PL1
-	 * contains _PAGE_READ */
+	 * contains _PAGE_READ) */
 	extrd,u,*=      \pte,_PAGE_USER_BIT+32,1,%r0
 	depdi		7,11,3,\prot
 	/* If we're a gateway page, drop PL2 back to zero for promotion
@@ -1777,9 +1777,9 @@ ENTRY(sys_fork_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	/* These are call-clobbered registers and therefore
-	   also syscall-clobbered (we hope). */
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)	/* save for child */
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 
 	LDREG	PT_GR30(%r1),%r25
@@ -1809,7 +1809,7 @@ ENTRY(child_return)
 	nop
 
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30), %r1
-	LDREG	TASK_PT_GR19(%r1),%r2
+	LDREG	TASK_PT_SYSCALL_RP(%r1),%r2
 	b	wrapper_exit
 	copy	%r0,%r28
 ENDPROC(child_return)
@@ -1828,8 +1828,9 @@ ENTRY(sys_clone_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	/* WARNING - Clobbers r19 and r21, userspace must save these! */
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)	/* save for child */
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 	BL	sys_clone,%r2
 	copy	%r1,%r24
@@ -1852,7 +1853,7 @@ ENTRY(sys_vfork_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)	/* save for child */
 	STREG	%r30,PT_GR21(%r1)
 
 	BL	sys_vfork,%r2
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index c0b1aff..8094d3e 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -379,14 +379,14 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 static struct irqaction timer_action = {
 	.handler = timer_interrupt,
 	.name = "timer",
-	.flags = IRQF_DISABLED | IRQF_TIMER | IRQF_PERCPU | IRQF_IRQPOLL,
+	.flags = IRQF_TIMER | IRQF_PERCPU | IRQF_IRQPOLL,
 };
 
 #ifdef CONFIG_SMP
 static struct irqaction ipi_action = {
 	.handler = ipi_interrupt,
 	.name = "IPI",
-	.flags = IRQF_DISABLED | IRQF_PERCPU,
+	.flags = IRQF_PERCPU,
 };
 #endif
 
@@ -410,11 +410,13 @@ void __init init_IRQ(void)
 {
 	local_irq_disable();	/* PARANOID - should already be disabled */
 	mtctl(~0UL, 23);	/* EIRR : clear all pending external intr */
-	claim_cpu_irqs();
 #ifdef CONFIG_SMP
-	if (!cpu_eiem)
+	if (!cpu_eiem) {
+		claim_cpu_irqs();
 		cpu_eiem = EIEM_MASK(IPI_IRQ) | EIEM_MASK(TIMER_IRQ);
+	}
 #else
+	claim_cpu_irqs();
 	cpu_eiem = EIEM_MASK(TIMER_IRQ);
 #endif
         set_eiem(cpu_eiem);	/* EIEM : enable all external intr */
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 93ff3d9..9a29e34 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -199,7 +199,6 @@ ENTRY(flush_instruction_cache_local)
 	.callinfo NO_CALLS
 	.entry
 
-	mtsp		%r0, %sr1
 	load32		cache_info, %r1
 
 	/* Flush Instruction Cache */
@@ -208,20 +207,46 @@ ENTRY(flush_instruction_cache_local)
 	LDREG		ICACHE_STRIDE(%r1), %arg1
 	LDREG		ICACHE_COUNT(%r1), %arg2
 	LDREG		ICACHE_LOOP(%r1), %arg3
-	rsm             PSW_SM_I, %r22		/* No mmgt ops during loop*/
+	rsm		PSW_SM_I, %r22		/* No mmgt ops during loop*/
 	addib,COND(=)		-1, %arg3, fioneloop	/* Preadjust and test */
 	movb,<,n	%arg3, %r31, fisync	/* If loop < 0, do sync */
 
 fimanyloop:					/* Loop if LOOP >= 2 */
 	addib,COND(>)		-1, %r31, fimanyloop	/* Adjusted inner loop decr */
-	fice            %r0(%sr1, %arg0)
-	fice,m		%arg1(%sr1, %arg0)	/* Last fice and addr adjust */
+	fice            %r0(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)	/* Last fice and addr adjust */
 	movb,tr		%arg3, %r31, fimanyloop	/* Re-init inner loop count */
 	addib,COND(<=),n	-1, %arg2, fisync	/* Outer loop decr */
 
 fioneloop:					/* Loop if LOOP = 1 */
-	addib,COND(>)		-1, %arg2, fioneloop	/* Outer loop count decr */
-	fice,m		%arg1(%sr1, %arg0)	/* Fice for one loop */
+	/* Some implementations may flush with a single fice instruction */
+	cmpib,COND(>>=),n	15, %arg2, fioneloop2
+
+fioneloop1:
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	fice,m		%arg1(%sr2, %arg0)
+	addib,COND(>)	-16, %arg2, fioneloop1
+	fice,m		%arg1(%sr2, %arg0)
+
+	/* Check if done */
+	cmpb,COND(=),n	%arg2, %r0, fisync	/* Predict branch taken */
+
+fioneloop2:
+	addib,COND(>)	-1, %arg2, fioneloop2	/* Outer loop count decr */
+	fice,m		%arg1(%sr2, %arg0)	/* Fice for one loop */
 
 fisync:
 	sync
@@ -240,8 +265,7 @@ ENTRY(flush_data_cache_local)
 	.callinfo NO_CALLS
 	.entry
 
-	mtsp		%r0, %sr1
-	load32 		cache_info, %r1
+	load32		cache_info, %r1
 
 	/* Flush Data Cache */
 
@@ -249,20 +273,46 @@ ENTRY(flush_data_cache_local)
 	LDREG		DCACHE_STRIDE(%r1), %arg1
 	LDREG		DCACHE_COUNT(%r1), %arg2
 	LDREG		DCACHE_LOOP(%r1), %arg3
-	rsm		PSW_SM_I, %r22
+	rsm		PSW_SM_I, %r22		/* No mmgt ops during loop*/
 	addib,COND(=)		-1, %arg3, fdoneloop	/* Preadjust and test */
 	movb,<,n	%arg3, %r31, fdsync	/* If loop < 0, do sync */
 
 fdmanyloop:					/* Loop if LOOP >= 2 */
 	addib,COND(>)		-1, %r31, fdmanyloop	/* Adjusted inner loop decr */
-	fdce		%r0(%sr1, %arg0)
-	fdce,m		%arg1(%sr1, %arg0)	/* Last fdce and addr adjust */
+	fdce		%r0(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)	/* Last fdce and addr adjust */
 	movb,tr		%arg3, %r31, fdmanyloop	/* Re-init inner loop count */
 	addib,COND(<=),n	-1, %arg2, fdsync	/* Outer loop decr */
 
 fdoneloop:					/* Loop if LOOP = 1 */
-	addib,COND(>)		-1, %arg2, fdoneloop	/* Outer loop count decr */
-	fdce,m		%arg1(%sr1, %arg0)	/* Fdce for one loop */
+	/* Some implementations may flush with a single fdce instruction */
+	cmpib,COND(>>=),n	15, %arg2, fdoneloop2
+
+fdoneloop1:
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	fdce,m		%arg1(%sr2, %arg0)
+	addib,COND(>)	-16, %arg2, fdoneloop1
+	fdce,m		%arg1(%sr2, %arg0)
+
+	/* Check if done */
+	cmpb,COND(=),n	%arg2, %r0, fdsync	/* Predict branch taken */
+
+fdoneloop2:
+	addib,COND(>)	-1, %arg2, fdoneloop2	/* Outer loop count decr */
+	fdce,m		%arg1(%sr2, %arg0)	/* Fdce for one loop */
 
 fdsync:
 	syncdma
@@ -277,7 +327,104 @@ ENDPROC(flush_data_cache_local)
 
 	.align	16
 
-ENTRY(copy_user_page_asm)
+/* Macros to serialize TLB purge operations on SMP.  */
+
+	.macro	tlb_lock	la,flags,tmp
+#ifdef CONFIG_SMP
+	ldil		L%pa_tlb_lock,%r1
+	ldo		R%pa_tlb_lock(%r1),\la
+	rsm		PSW_SM_I,\flags
+1:	LDCW		0(\la),\tmp
+	cmpib,<>,n	0,\tmp,3f
+2:	ldw		0(\la),\tmp
+	cmpb,<>		%r0,\tmp,1b
+	nop
+	b,n		2b
+3:
+#endif
+	.endm
+
+	.macro	tlb_unlock	la,flags,tmp
+#ifdef CONFIG_SMP
+	ldi		1,\tmp
+	stw		\tmp,0(\la)
+	mtsm		\flags
+#endif
+	.endm
+
+/* Clear page using kernel mapping.  */
+
+ENTRY(clear_page_asm)
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+#ifdef CONFIG_64BIT
+
+	/* Unroll the loop.  */
+	ldi		(PAGE_SIZE / 128), %r1
+
+1:
+	std		%r0, 0(%r26)
+	std		%r0, 8(%r26)
+	std		%r0, 16(%r26)
+	std		%r0, 24(%r26)
+	std		%r0, 32(%r26)
+	std		%r0, 40(%r26)
+	std		%r0, 48(%r26)
+	std		%r0, 56(%r26)
+	std		%r0, 64(%r26)
+	std		%r0, 72(%r26)
+	std		%r0, 80(%r26)
+	std		%r0, 88(%r26)
+	std		%r0, 96(%r26)
+	std		%r0, 104(%r26)
+	std		%r0, 112(%r26)
+	std		%r0, 120(%r26)
+
+	/* Note reverse branch hint for addib is taken.  */
+	addib,COND(>),n	-1, %r1, 1b
+	ldo		128(%r26), %r26
+
+#else
+
+	/*
+	 * Note that until (if) we start saving the full 64-bit register
+	 * values on interrupt, we can't use std on a 32 bit kernel.
+	 */
+	ldi		(PAGE_SIZE / 64), %r1
+
+1:
+	stw		%r0, 0(%r26)
+	stw		%r0, 4(%r26)
+	stw		%r0, 8(%r26)
+	stw		%r0, 12(%r26)
+	stw		%r0, 16(%r26)
+	stw		%r0, 20(%r26)
+	stw		%r0, 24(%r26)
+	stw		%r0, 28(%r26)
+	stw		%r0, 32(%r26)
+	stw		%r0, 36(%r26)
+	stw		%r0, 40(%r26)
+	stw		%r0, 44(%r26)
+	stw		%r0, 48(%r26)
+	stw		%r0, 52(%r26)
+	stw		%r0, 56(%r26)
+	stw		%r0, 60(%r26)
+
+	addib,COND(>),n	-1, %r1, 1b
+	ldo		64(%r26), %r26
+#endif
+	bv		%r0(%r2)
+	nop
+	.exit
+
+	.procend
+ENDPROC(clear_page_asm)
+
+/* Copy page using kernel mapping.  */
+
+ENTRY(copy_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -285,18 +432,14 @@ ENTRY(copy_user_page_asm)
 #ifdef CONFIG_64BIT
 	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
 	 * Unroll the loop by hand and arrange insn appropriately.
-	 * GCC probably can do this just as well.
+	 * Prefetch doesn't improve performance on rp3440.
+	 * GCC probably can do this just as well...
 	 */
 
-	ldd		0(%r25), %r19
 	ldi		(PAGE_SIZE / 128), %r1
 
-	ldw		64(%r25), %r0		/* prefetch 1 cacheline ahead */
-	ldw		128(%r25), %r0		/* prefetch 2 */
-
-1:	ldd		8(%r25), %r20
-	ldw		192(%r25), %r0		/* prefetch 3 */
-	ldw		256(%r25), %r0		/* prefetch 4 */
+1:	ldd		0(%r25), %r19
+	ldd		8(%r25), %r20
 
 	ldd		16(%r25), %r21
 	ldd		24(%r25), %r22
@@ -330,20 +473,16 @@ ENTRY(copy_user_page_asm)
 
 	ldd		112(%r25), %r21
 	ldd		120(%r25), %r22
+	ldo		128(%r25), %r25
 	std		%r19, 96(%r26)
 	std		%r20, 104(%r26)
 
-	ldo		128(%r25), %r25
 	std		%r21, 112(%r26)
 	std		%r22, 120(%r26)
-	ldo		128(%r26), %r26
 
-	/* conditional branches nullify on forward taken branch, and on
-	 * non-taken backward branch. Note that .+4 is a backwards branch.
-	 * The ldd should only get executed if the branch is taken.
-	 */
-	addib,COND(>),n	-1, %r1, 1b		/* bundle 10 */
-	ldd		0(%r25), %r19		/* start next loads */
+	/* Note reverse branch hint for addib is taken.  */
+	addib,COND(>),n	-1, %r1, 1b
+	ldo		128(%r26), %r26
 
 #else
 
@@ -399,7 +538,7 @@ ENTRY(copy_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(copy_user_page_asm)
+ENDPROC(copy_page_asm)
 
 /*
  * NOTE: Code in clear_user_page has a hard coded dependency on the
@@ -422,8 +561,6 @@ ENDPROC(copy_user_page_asm)
  *          %r23 physical page (shifted for tlb insert) of "from" translation
  */
 
-#if 0
-
 	/*
 	 * We can't do this since copy_user_page is used to bring in
 	 * file data that might have instructions. Since the data would
@@ -435,6 +572,7 @@ ENDPROC(copy_user_page_asm)
 	 * use it if more information is passed into copy_user_page().
 	 * Have to do some measurements to see if it is worthwhile to
 	 * lobby for such a change.
+	 *
 	 */
 
 ENTRY(copy_user_page_asm)
@@ -442,16 +580,21 @@ ENTRY(copy_user_page_asm)
 	.callinfo NO_CALLS
 	.entry
 
+	/* Convert virtual `to' and `from' addresses to physical addresses.
+	   Move `from' physical address to non shadowed register.  */
 	ldil		L%(__PAGE_OFFSET), %r1
 	sub		%r26, %r1, %r26
-	sub		%r25, %r1, %r23		/* move physical addr into non shadowed reg */
+	sub		%r25, %r1, %r23
 
 	ldil		L%(TMPALIAS_MAP_START), %r28
 	/* FIXME for different page sizes != 4k */
 #ifdef CONFIG_64BIT
-	extrd,u		%r26,56,32, %r26		/* convert phys addr to tlb insert format */
-	extrd,u		%r23,56,32, %r23		/* convert phys addr to tlb insert format */
-	depd		%r24,63,22, %r28		/* Form aliased virtual address 'to' */
+#if (TMPALIAS_MAP_START >= 0x80000000)
+	depdi		0, 31,32, %r28		/* clear any sign extension */
+#endif
+	extrd,u		%r26,56,32, %r26	/* convert phys addr to tlb insert format */
+	extrd,u		%r23,56,32, %r23	/* convert phys addr to tlb insert format */
+	depd		%r24,63,22, %r28	/* Form aliased virtual address 'to' */
 	depdi		0, 63,12, %r28		/* Clear any offset bits */
 	copy		%r28, %r29
 	depdi		1, 41,1, %r29		/* Form aliased virtual address 'from' */
@@ -466,10 +609,76 @@ ENTRY(copy_user_page_asm)
 
 	/* Purge any old translations */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+	pdtlb,l		0(%r29)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
 	pdtlb		0(%r29)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
-	ldi		64, %r1
+#ifdef CONFIG_64BIT
+	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
+	 * Unroll the loop by hand and arrange insn appropriately.
+	 * GCC probably can do this just as well.
+	 */
+
+	ldd		0(%r29), %r19
+	ldi		(PAGE_SIZE / 128), %r1
+
+1:	ldd		8(%r29), %r20
+
+	ldd		16(%r29), %r21
+	ldd		24(%r29), %r22
+	std		%r19, 0(%r28)
+	std		%r20, 8(%r28)
+
+	ldd		32(%r29), %r19
+	ldd		40(%r29), %r20
+	std		%r21, 16(%r28)
+	std		%r22, 24(%r28)
+
+	ldd		48(%r29), %r21
+	ldd		56(%r29), %r22
+	std		%r19, 32(%r28)
+	std		%r20, 40(%r28)
+
+	ldd		64(%r29), %r19
+	ldd		72(%r29), %r20
+	std		%r21, 48(%r28)
+	std		%r22, 56(%r28)
+
+	ldd		80(%r29), %r21
+	ldd		88(%r29), %r22
+	std		%r19, 64(%r28)
+	std		%r20, 72(%r28)
+
+	ldd		 96(%r29), %r19
+	ldd		104(%r29), %r20
+	std		%r21, 80(%r28)
+	std		%r22, 88(%r28)
+
+	ldd		112(%r29), %r21
+	ldd		120(%r29), %r22
+	std		%r19, 96(%r28)
+	std		%r20, 104(%r28)
+
+	ldo		128(%r29), %r29
+	std		%r21, 112(%r28)
+	std		%r22, 120(%r28)
+	ldo		128(%r28), %r28
+
+	/* conditional branches nullify on forward taken branch, and on
+	 * non-taken backward branch. Note that .+4 is a backwards branch.
+	 * The ldd should only get executed if the branch is taken.
+	 */
+	addib,COND(>),n	-1, %r1, 1b		/* bundle 10 */
+	ldd		0(%r29), %r19		/* start next loads */
+
+#else
+	ldi		(PAGE_SIZE / 64), %r1
 
 	/*
 	 * This loop is optimized for PCXL/PCXL2 ldw/ldw and stw/stw
@@ -480,9 +689,7 @@ ENTRY(copy_user_page_asm)
 	 * use ldd/std on a 32 bit kernel.
 	 */
 
-
-1:
-	ldw		0(%r29), %r19
+1:	ldw		0(%r29), %r19
 	ldw		4(%r29), %r20
 	ldw		8(%r29), %r21
 	ldw		12(%r29), %r22
@@ -515,8 +722,10 @@ ENTRY(copy_user_page_asm)
 	stw		%r21, 56(%r28)
 	stw		%r22, 60(%r28)
 	ldo		64(%r28), %r28
+
 	addib,COND(>)		-1, %r1,1b
 	ldo		64(%r29), %r29
+#endif
 
 	bv		%r0(%r2)
 	nop
@@ -524,9 +733,8 @@ ENTRY(copy_user_page_asm)
 
 	.procend
 ENDPROC(copy_user_page_asm)
-#endif
 
-ENTRY(__clear_user_page_asm)
+ENTRY(clear_user_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -550,7 +758,13 @@ ENTRY(__clear_user_page_asm)
 
 	/* Purge any old translation */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
 #ifdef CONFIG_64BIT
 	ldi		(PAGE_SIZE / 128), %r1
@@ -580,8 +794,7 @@ ENTRY(__clear_user_page_asm)
 #else	/* ! CONFIG_64BIT */
 	ldi		(PAGE_SIZE / 64), %r1
 
-1:
-	stw		%r0, 0(%r28)
+1:	stw		%r0, 0(%r28)
 	stw		%r0, 4(%r28)
 	stw		%r0, 8(%r28)
 	stw		%r0, 12(%r28)
@@ -606,7 +819,7 @@ ENTRY(__clear_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(__clear_user_page_asm)
+ENDPROC(clear_user_page_asm)
 
 ENTRY(flush_dcache_page_asm)
 	.proc
@@ -630,7 +843,13 @@ ENTRY(flush_dcache_page_asm)
 
 	/* Purge any old translation */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
 	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), %r1
@@ -663,8 +882,17 @@ ENTRY(flush_dcache_page_asm)
 	fdc,m		%r1(%r28)
 
 	sync
+
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r25)
+#else
+	tlb_lock	%r20,%r21,%r22
+	pdtlb		0(%r25)
+	tlb_unlock	%r20,%r21,%r22
+#endif
+
 	bv		%r0(%r2)
-	pdtlb		(%r25)
+	nop
 	.exit
 
 	.procend
@@ -692,7 +920,13 @@ ENTRY(flush_icache_page_asm)
 
 	/* Purge any old translation */
 
+#ifdef CONFIG_PA20
+	pitlb,l		%r0(%sr0,%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pitlb		(%sr0,%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
 	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r1
@@ -725,8 +959,17 @@ ENTRY(flush_icache_page_asm)
 	fic,m		%r1(%r28)
 
 	sync
-	bv		%r0(%r2)
+
+#ifdef CONFIG_PA20
+	pitlb,l		%r0(%sr0,%r25)
+#else
+	tlb_lock	%r20,%r21,%r22
 	pitlb		(%sr0,%r25)
+	tlb_unlock	%r20,%r21,%r22
+#endif
+
+	bv		%r0(%r2)
+	nop
 	.exit
 
 	.procend
@@ -775,7 +1018,7 @@ ENTRY(flush_kernel_dcache_page_asm)
 	.procend
 ENDPROC(flush_kernel_dcache_page_asm)
 
-ENTRY(purge_kernel_dcache_page)
+ENTRY(purge_kernel_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -815,7 +1058,7 @@ ENTRY(purge_kernel_dcache_page)
 	.exit
 
 	.procend
-ENDPROC(purge_kernel_dcache_page)
+ENDPROC(purge_kernel_dcache_page_asm)
 
 ENTRY(flush_user_dcache_range_asm)
 	.proc
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index a7bb757..25835d8 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -158,5 +158,6 @@ extern void _mcount(void);
 EXPORT_SYMBOL(_mcount);
 #endif
 
-/* from pacache.S -- needed for copy_page */
-EXPORT_SYMBOL(copy_user_page_asm);
+/* from pacache.S -- needed for clear/copy_page */
+EXPORT_SYMBOL(clear_page_asm);
+EXPORT_SYMBOL(copy_page_asm);
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 12c1ed3..5dd1059 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -314,7 +314,7 @@ setup_rt_frame(int sig, struct k_sigaction *ka, siginfo_t *info,
 #if DEBUG_SIG
 	/* Assert that we're flushing in the correct space... */
 	{
-		int sid;
+		unsigned long sid;
 		asm ("mfsp %%sr3,%0" : "=r" (sid));
 		DBG(1,"setup_rt_frame: Flushing 64 bytes at space %#x offset %p\n",
 		       sid, frame->tramp);
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index c9b9322..f0cb56e 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -92,11 +92,12 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	if (len > TASK_SIZE)
 		return -ENOMEM;
-	/* Might want to check for cache aliasing issues for MAP_FIXED case
-	 * like ARM or MIPS ??? --BenH.
-	 */
-	if (flags & MAP_FIXED)
+	if (flags & MAP_FIXED) {
+		if ((flags & MAP_SHARED) &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
 		return addr;
+	}
 	if (!addr)
 		addr = TASK_UNMAPPED_BASE;
 
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 45b7389..53a1c69 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -76,7 +76,7 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	cycles_elapsed = now - next_tick;
 
-	if ((cycles_elapsed >> 6) < cpt) {
+	if ((cycles_elapsed >> 7) < cpt) {
 		/* use "cheap" math (add/subtract) instead
 		 * of the more expensive div/mul method
 		 */
diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index 8f470c9..4b22b27 100644
--- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -458,12 +458,15 @@ void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned long maxlen)
 	return NULL;
 }
 
+#ifdef CONFIG_PCI
 void pci_iounmap(struct pci_dev *dev, void __iomem * addr)
 {
 	if (!INDIRECT_ADDR(addr)) {
 		iounmap(addr);
 	}
 }
+EXPORT_SYMBOL(pci_iounmap);
+#endif
 
 EXPORT_SYMBOL(ioread8);
 EXPORT_SYMBOL(ioread16);
@@ -484,4 +487,3 @@ EXPORT_SYMBOL(iowrite32_rep);
 EXPORT_SYMBOL(ioport_map);
 EXPORT_SYMBOL(ioport_unmap);
 EXPORT_SYMBOL(pci_iomap);
-EXPORT_SYMBOL(pci_iounmap);
diff --git a/arch/parisc/math-emu/cnv_float.h b/arch/parisc/math-emu/cnv_float.h
index 9071e09..37299c7 100644
--- a/arch/parisc/math-emu/cnv_float.h
+++ b/arch/parisc/math-emu/cnv_float.h
@@ -347,16 +347,15 @@
     Sgl_isinexact_to_fix(sgl_value,exponent)
 
 #define Duint_from_sgl_mantissa(sgl_value,exponent,dresultA,dresultB)	\
-  {Sall(sgl_value) <<= SGL_EXP_LENGTH;  /*  left-justify  */		\
+  {unsigned int val = Sall(sgl_value) << SGL_EXP_LENGTH;		\
     if (exponent <= 31) {						\
     	Dintp1(dresultA) = 0;						\
-    	Dintp2(dresultB) = (unsigned)Sall(sgl_value) >> (31 - exponent); \
+    	Dintp2(dresultB) = val >> (31 - exponent);			\
     }									\
     else {								\
-    	Dintp1(dresultA) = Sall(sgl_value) >> (63 - exponent);		\
-    	Dintp2(dresultB) = Sall(sgl_value) << (exponent - 31);		\
+    	Dintp1(dresultA) = val >> (63 - exponent);			\
+    	Dintp2(dresultB) = exponent <= 62 ? val << (exponent - 31) : 0;	\
     }									\
-    Sall(sgl_value) >>= SGL_EXP_LENGTH;  /* return to original */	\
   }
 
 #define Duint_setzero(dresultA,dresultB) 	\
diff --git a/drivers/parisc/iommu-helpers.h b/drivers/parisc/iommu-helpers.h
index a9c46cc..8c33491 100644
--- a/drivers/parisc/iommu-helpers.h
+++ b/drivers/parisc/iommu-helpers.h
@@ -1,3 +1,5 @@
+#include <linux/prefetch.h>
+
 /**
  * iommu_fill_pdir - Insert coalesced scatter/gather chunks into the I/O Pdir.
  * @ioc: The I/O Controller.
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index f7c543a..d69738a 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -549,6 +549,7 @@ out_eoi:
 void
 handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 {
+	struct irqaction *action;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	kstat_incr_irqs_this_cpu(irq, desc);
@@ -556,7 +557,9 @@ handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 	if (chip->irq_ack)
 		chip->irq_ack(&desc->irq_data);
 
-	handle_irq_event_percpu(desc, desc->action);
+	action = desc->action;
+	if (action)
+		handle_irq_event_percpu(desc, action);
 
 	if (chip->irq_eoi)
 		chip->irq_eoi(&desc->irq_data);

--------------080602000706010809020909--
