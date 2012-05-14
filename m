From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 13 May 2012 21:10:58 -0400
Message-ID: <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
References: <4FA9975C.5060708@bergerie> <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl> <4FAEE943.2030203@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-2-20889562"
Cc: Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FAEE943.2030203@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-2-20889562
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi Helge,

I had a successful bot of 3.4.0-rc7+ this evening.

I updated my running kernel patch to 3.4.  The futex patch is removed  
and Srivatsa S. Bhat's
patch added.

Attached are patch and dmesg log.

Regards,
Dave

On 12-May-12, at 6:50 PM, Helge Deller wrote:

> I have my machines now up and running again.
>
> I tested upstream version (bcc62fb) and got on all my machines the  
> same bug (same Kernel binary started on all):
>
> Backtrace:
> [<1021dc3c>] mpage_readpages+0xf0/0x16c
> [<10257e88>] ext3_readpages+0x28/0x38
> [<101acb90>] __do_page_cache_readahead+0x1e0/0x27c
> [<101acc5c>] ra_submit+0x30/0x40
> [<101acee0>] ondemand_readahead+0xd0/0x26c
>
> or
>
> Backtrace:
> [<1021dc3c>] mpage_readpages+0xf0/0x16c
> [<10257e88>] ext3_readpages+0x28/0x38
> [<101acb90>] __do_page_cache_readahead+0x1e0/0x27c
> [<101acc5c>] ra_submit+0x30/0x40
> [<101acee0>] ondemand_readahead+0xd0/0x26c
> [<101ad1a8>] page_cache_sync_readahead+0x44/0x74
> [<101a38e4>] generic_file_aio_read+0x400/0x764
> [<101e243c>] do_sync_read+0xd4/0x130
> [<101e32f4>] vfs_read+0xac/0x158
> [<101ea47c>] kernel_read+0x40/0x5c
> [<101ea58c>] prepare_binprm+0xf4/0x130
> [<101eae3c>] do_execve+0x2b8/0x3a4
> [<1012199c>] sys_execve+0x64/0x94
> [<10104084>] __execve+0x20/0x34
> [<10136374>] vprintk+0x1e8/0x488
> [<101a83e8>] __free_pages+0x54/0x64
>
>
> all logs attached for the 715/64, B160L and C3000 machines.
>
> I'll test tomorrow your patch (but will try to update my binutils/ 
> gcc prior to that).



--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-2-20889562
Content-Disposition: attachment; filename="linux-3.4-rc7-20120513.d.4"
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="linux-3.4-rc7-20120513.d.4"
Content-Transfer-Encoding: 7bit

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
index 9f21ab0..79f694f 100644
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
 
diff --git a/arch/parisc/include/asm/mmzone.h b/arch/parisc/include/asm/mmzone.h
index e67eb9c..31835b9 100644
--- a/arch/parisc/include/asm/mmzone.h
+++ b/arch/parisc/include/asm/mmzone.h
@@ -1,9 +1,10 @@
 #ifndef _PARISC_MMZONE_H
 #define _PARISC_MMZONE_H
 
+#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
+
 #ifdef CONFIG_DISCONTIGMEM
 
-#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
 extern int npmem_ranges;
 
 struct node_map_data {
@@ -60,7 +61,5 @@ static inline int pfn_valid(int pfn)
 	return 0;
 }
 
-#else /* !CONFIG_DISCONTIGMEM */
-#define MAX_PHYSMEM_RANGES 	1 
 #endif
 #endif /* _PARISC_MMZONE_H */
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 4e0e7db..d9812d8 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -21,15 +21,27 @@
 #include <asm/types.h>
 #include <asm/cache.h>
 
-#define clear_page(page)	memset((void *)(page), 0, PAGE_SIZE)
-#define copy_page(to,from)      copy_user_page_asm((void *)(to), (void *)(from))
+#define clear_page(page)	clear_page_asm((void *)(page))
+#define copy_page(to,from)	copy_page_asm((void *)(to), (void *)(from))
 
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
index ee99f23..563724d 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -12,11 +12,10 @@
 
 #include <linux/bitops.h>
 #include <linux/spinlock.h>
+#include <linux/mm_types.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
 
-struct vm_area_struct;
-
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
  * memory.  For the return value to be meaningful, ADDR must be >=
@@ -40,7 +39,14 @@ struct vm_area_struct;
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
 
@@ -462,10 +468,13 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
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
index 9d18189..695f790 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -133,7 +133,7 @@ parisc_cache_init(void)
 	if (pdc_cache_info(&cache_info) < 0)
 		panic("parisc_cache_init: pdc_cache_info failed");
 
-#if 0
+#if 1
 	printk("ic_size %lx dc_size %lx it_size %lx\n",
 		cache_info.ic_size,
 		cache_info.dc_size,
@@ -267,9 +267,11 @@ static inline void
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
@@ -315,7 +317,7 @@ void flush_dcache_page(struct page *page)
 		flush_tlb_page(mpnt, addr);
 		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
+			if (old_addr && parisc_requires_coherency())
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *)mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
 			old_addr = addr;
 		}
@@ -330,17 +332,6 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_asm);
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
 
@@ -374,20 +365,9 @@ void __init parisc_setup_cache_timing(void)
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
@@ -400,11 +380,26 @@ void flush_kernel_dcache_page_addr(void *addr)
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
@@ -459,8 +454,65 @@ void flush_cache_all(void)
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
+	   rp3440, etc.  So, avoid it if the mm isn't too big.
+	   Note: This approach is faster than a range flush when the
+	   context is current, and it works even when non current.  */
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
+						__flush_cache_page(vma, addr, page_to_phys(pte_page(pte)));
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
@@ -486,20 +538,34 @@ flush_user_icache_range(unsigned long start, unsigned long end)
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
+			flush_user_dcache_range_asm(start,end);
+			if(vma->vm_flags & VM_EXEC)
+				flush_user_icache_range_asm(start,end);
+		} else {
+			unsigned long addr;
+			pgd_t *pgd = vma->vm_mm->pgd;
+
+			for (addr = start & PAGE_MASK; addr < end; addr += PAGE_SIZE) {
+				pte_t *ptep = get_ptep(pgd, addr);
+				if (ptep != NULL) {
+					pte_t pte = *ptep;
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
 
@@ -512,3 +578,81 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
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
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 0bb1d63..4dc7b79 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -31,6 +31,7 @@
 #include <linux/delay.h>
 #include <linux/bitops.h>
 #include <linux/ftrace.h>
+#include <linux/cpu.h>
 
 #include <linux/atomic.h>
 #include <asm/current.h>
@@ -295,8 +296,13 @@ smp_cpu_init(int cpunum)
 
 		printk(KERN_CRIT "CPU#%d already initialized!\n", cpunum);
 		machine_halt();
-	}  
+	}
+
+	notify_cpu_starting(cpunum);
+
+	ipi_call_lock();
 	set_cpu_online(cpunum, true);
+	ipi_call_unlock();
 
 	/* Initialise the idle task for this CPU */
 	atomic_inc(&init_mm.mm_count);
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
index 70e105d..4a24ba7 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -77,7 +77,7 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	cycles_elapsed = now - next_tick;
 
-	if ((cycles_elapsed >> 6) < cpt) {
+	if ((cycles_elapsed >> 7) < cpt) {
 		/* use "cheap" math (add/subtract) instead
 		 * of the more expensive div/mul method
 		 */
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index fa6f2b8..64a9998 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -50,8 +50,10 @@ SECTIONS
 	. = KERNEL_BINARY_TEXT_START;
 
 	_text = .;		/* Text and read-only data */
-	.text ALIGN(16) : {
+	.head ALIGN(16) : {
 		HEAD_TEXT
+	} = 0
+	.text ALIGN(16) : {
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
@@ -65,7 +67,7 @@ SECTIONS
 		*(.fixup)
 		*(.lock.text)		/* out-of-line lock text */
 		*(.gnu.warning)
-	} = 0
+	}
 	/* End of text section */
 	_etext = .;
 
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
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 6080f6b..231996a 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -574,6 +574,7 @@ out_eoi:
 void
 handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 {
+	struct irqaction *action;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	kstat_incr_irqs_this_cpu(irq, desc);
@@ -581,7 +582,9 @@ handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 	if (chip->irq_ack)
 		chip->irq_ack(&desc->irq_data);
 
-	handle_irq_event_percpu(desc, desc->action);
+	action = desc->action;
+	if (action)
+		handle_irq_event_percpu(desc, action);
 
 	if (chip->irq_eoi)
 		chip->irq_eoi(&desc->irq_data);

--Apple-Mail-2-20889562
Content-Disposition: attachment; filename="dmesg.0"
Content-Type: application/octet-stream; x-unix-mode=0640; name="dmesg.0"
Content-Transfer-Encoding: 7bit

Linux version 3.4.0-rc7+ (dave@mx3210) (gcc version 4.7.0 (GCC) ) #2 SMP Sun May 13 17:23:28 EDT 2012
unwind_init: start = 0x404c9000, end = 0x404f6f30, entries = 11763
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00008870 00000491 00000000 00000002 3e0505e7352af711 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440  
ic_size 2000000 dc_size 2000000 it_size f0
DC  base 0x0 stride 0x80 count 0x40000 loop 0x1
dc_conf = 0x1882000  alias 0 blk 1 line 4 shift 1
	wt 0 sh 0 cst 1 hv 0
IC  base 0x0 stride 0x80 count 0x40000 loop 0x1
ic_conf = 0x1882000  alias 0 blk 1 line 4 shift 1
	wt 0 sh 0 cst 1 hv 0
D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
I-TLB conf: sh 3 page 1 cst 1 aid 3 pad1 0
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
 1) Start 0x0000000100000000 End 0x000000027fdfffff Size   6142 MB
 2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
Total Memory: 10238 MB
initrd: 7f87c000-7ffee61e
initrd: reserving 3f87c000-3ffee61e (mem_max 27fe00000)
On node 0 totalpages: 262144
free_area_init_node: node 0, pgdat 405127c0, node_mem_map 419f7000
  Normal zone: 3584 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 258560 pages, LIFO batch:31
On node 1 totalpages: 1572352
free_area_init_node: node 1, pgdat 40513540, node_mem_map 140000000
  Normal zone: 21497 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 1550855 pages, LIFO batch:31
On node 2 totalpages: 786432
free_area_init_node: node 2, pgdat 405142c0, node_mem_map 4080000000
  Normal zone: 10752 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 775680 pages, LIFO batch:31
PERCPU: Embedded 10 pages/cpu @0000000042800000 s8448 r8192 d24320 u40960
pcpu-alloc: s8448 r8192 d24320 u40960 alloc=10*4096
pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07 
pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15 
pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0] 22 [0] 23 
pcpu-alloc: [0] 24 [0] 25 [0] 26 [0] 27 [0] 28 [0] 29 [0] 30 [0] 31 
SMP: bootstrap CPU ID is 0
Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2585095
Kernel command line: root=/dev/sda5 console=ttyS1 HOME=/ rootfstype=ext3 palo_kernel=2/vmlinux
PID hash table entries: 4096 (order: 3, 32768 bytes)
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Memory: 10280328k/10483712k available (3250k kernel code, 203384k reserved, 1429k data, 216k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
      .init : 0x000000004065c000 - 0x0000000040692000   ( 216 kB)
      .data : 0x000000004042c8e8 - 0x0000000040591e10   (1429 kB)
      .text : 0x0000000040100000 - 0x000000004042c8e8   (3250 kB)
Hierarchical RCU implementation.
NR_IRQS:128
Console: colour dummy device 160x64
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                 | spin |wlock |rlock |mutex | wsem | rsem |
  --------------------------------------------------------------------------
                     A-A deadlock:failed|failed|  ok  |failed|failed|failed|
                 A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
                    double unlock:failed|failed|failed|  ok  |failed|failed|
                  initialize held:failed|failed|failed|failed|failed|failed|
                 bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
  --------------------------------------------------------------------------
              recursive read-lock:             |  ok  |             |failed|
           recursive read-lock #2:             |  ok  |             |failed|
            mixed read-write-lock:             |failed|             |failed|
            mixed write-read-lock:             |failed|             |failed|
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |
         hard-safe-A + irqs-on/12:failed|failed|  ok  |
         soft-safe-A + irqs-on/12:failed|failed|  ok  |
         hard-safe-A + irqs-on/21:failed|failed|  ok  |
         soft-safe-A + irqs-on/21:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
      hard-irq lock-inversion/123:failed|failed|  ok  |
      soft-irq lock-inversion/123:failed|failed|  ok  |
      hard-irq lock-inversion/132:failed|failed|  ok  |
      soft-irq lock-inversion/132:failed|failed|  ok  |
      hard-irq lock-inversion/213:failed|failed|  ok  |
      soft-irq lock-inversion/213:failed|failed|  ok  |
      hard-irq lock-inversion/231:failed|failed|  ok  |
      soft-irq lock-inversion/231:failed|failed|  ok  |
      hard-irq lock-inversion/312:failed|failed|  ok  |
      soft-irq lock-inversion/312:failed|failed|  ok  |
      hard-irq lock-inversion/321:failed|failed|  ok  |
      soft-irq lock-inversion/321:failed|failed|  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
--------------------------------------------------------
144 out of 218 testcases failed, as expected. |
----------------------------------------------------
Calibrating delay loop... 1594.36 BogoMIPS (lpj=3188736)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 256
Brought up 1 CPUs
devtmpfs: initialized
atomic64 test passed
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Storm Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x887, 0x00004 }
2. Storm Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x887, 0x00004 }
3. Storm Peak Slow at 0xfffffffffe798000 [152] { 0, 0x0, 0x887, 0x00004 }
4. Storm Peak Slow at 0xfffffffffe799000 [153] { 0, 0x0, 0x887, 0x00004 }
5. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
8. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
9. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
10. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
11. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
12. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
13. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
14. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
Releasing cpu 1 now, hpa=fffffffffe781000
FP[1] enabled: Rev 1 Model 20
Releasing cpu 2 now, hpa=fffffffffe798000
FP[2] enabled: Rev 1 Model 20
Releasing cpu 3 now, hpa=fffffffffe799000
FP[3] enabled: Rev 1 Model 20
CPU(s): 4 x PA8800 (Mako) at 800.007300 MHz
Whole cache flush 9074766 cycles, flushing 5840896 bytes 584238 cycles
Setting cache flush threshold to 2000000 (4 CPUs online)
SBA found Pluto 2.3 at 0xfffffffffed00000
Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
LBA 0:0: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff8fffffff] (bus address [0x80000000-0x8fffffff])
pci_bus 0000:00: root bus resource [mem 0xffffff0004000000-0xffffff0fffffffff]
pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310
pci 0000:00:01.0: reg 10: [mem 0xffffffff80002000-0xffffffff80002fff]
pci 0000:00:01.0: supports D1 D2
pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.1: [1033:0035] type 00 class 0x0c0310
pci 0000:00:01.1: reg 10: [mem 0xffffffff80001000-0xffffffff80001fff]
pci 0000:00:01.1: supports D1 D2
pci 0000:00:01.1: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.2: [1033:00e0] type 00 class 0x0c0320
pci 0000:00:01.2: reg 10: [mem 0xffffffff80000000-0xffffffff800000ff]
pci 0000:00:01.2: supports D1 D2
pci 0000:00:01.2: PME# supported from D0 D1 D2 D3hot
pci 0000:00:02.0: [1095:0649] type 00 class 0x01018f
pci 0000:00:02.0: reg 10: [io  0x0d18-0x0d1f]
pci 0000:00:02.0: reg 14: [io  0x0d24-0x0d27]
pci 0000:00:02.0: reg 18: [io  0x0d10-0x0d17]
pci 0000:00:02.0: reg 1c: [io  0x0d20-0x0d23]
pci 0000:00:02.0: reg 20: [io  0x0d00-0x0d0f]
pci 0000:00:02.0: supports D1 D2
Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
LBA 0:1: PCI host bridge to bus 0000:20
pci_bus 0000:20: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
pci_bus 0000:20: root bus resource [mem 0xffffffff90000000-0xffffffff9fffffff] (bus address [0x90000000-0x9fffffff])
pci_bus 0000:20: root bus resource [mem 0xffffff1004000000-0xffffff1fffffffff]
pci 0000:20:01.0: [1000:0021] type 00 class 0x010000
pci 0000:20:01.0: reg 10: [io  0x12100-0x121ff]
pci 0000:20:01.0: reg 14: [mem 0xffffffff90015000-0xffffffff900153ff 64bit]
pci 0000:20:01.0: reg 1c: [mem 0xffffffff90012000-0xffffffff90013fff 64bit]
pci 0000:20:01.0: supports D1 D2
pci 0000:20:01.1: [1000:0021] type 00 class 0x010000
pci 0000:20:01.1: reg 10: [io  0x12000-0x120ff]
pci 0000:20:01.1: reg 14: [mem 0xffffffff90014000-0xffffffff900143ff 64bit]
pci 0000:20:01.1: reg 1c: [mem 0xffffffff90010000-0xffffffff90011fff 64bit]
pci 0000:20:01.1: supports D1 D2
pci 0000:20:02.0: [14e4:1645] type 00 class 0x020000
pci 0000:20:02.0: reg 10: [mem 0xffffffff90000000-0xffffffff9000ffff 64bit]
pci 0000:20:02.0: PME# supported from D3hot D3cold
Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
LBA 0:2: PCI host bridge to bus 0000:40
pci_bus 0000:40: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
pci_bus 0000:40: root bus resource [mem 0xffffff2004000000-0xffffff2fffffffff]
Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
LBA 0:3: PCI host bridge to bus 0000:60
pci_bus 0000:60: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
pci_bus 0000:60: root bus resource [mem 0xffffff3004000000-0xffffff3fffffffff]
Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
LBA 0:4: PCI host bridge to bus 0000:80
pci_bus 0000:80: root bus resource [io  0x40000-0x4ffff] (bus address [0x0000-0xffff])
pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffcfffffff] (bus address [0xc0000000-0xcfffffff])
pci_bus 0000:80: root bus resource [mem 0xffffff4004000000-0xffffff4fffffffff]
Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
LBA 0:6: PCI host bridge to bus 0000:c0
pci_bus 0000:c0: root bus resource [io  0x50000-0x5ffff] (bus address [0x0000-0xffff])
pci_bus 0000:c0: root bus resource [mem 0xffffffffe0000000-0xffffffffefffffff] (bus address [0xe0000000-0xefffffff])
pci_bus 0000:c0: root bus resource [mem 0xffffff6004000000-0xffffff6fffffffff]
Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
LBA: Truncating lmmio_space [fffffffff0000000/fffffffffecffffe] to [fffffffff0000000,fffffffffe77ffff]
LBA 0:7: PCI host bridge to bus 0000:e0
pci_bus 0000:e0: root bus resource [io  0x60000-0x6ffff] (bus address [0x0000-0xffff])
pci_bus 0000:e0: root bus resource [mem 0xfffffffff0000000-0xfffffffffe77ffff] (bus address [0xf0000000-0xfe77ffff])
pci_bus 0000:e0: root bus resource [mem 0xffffff7004000000-0xffffff7fffffffff]
pci 0000:e0:01.0: [103c:1290] type 00 class 0x078000
pci 0000:e0:01.0: reg 18: [mem 0xfffffffff4051000-0xfffffffff405100f]
pci 0000:e0:01.1: [103c:1048] type 00 class 0x070002
pci 0000:e0:01.1: reg 10: [mem 0xfffffffff4050000-0xfffffffff4050fff]
pci 0000:e0:01.1: reg 18: [mem 0xfffffffff4020000-0xfffffffff403ffff pref]
pci 0000:e0:02.0: [1002:5159] type 00 class 0x030000
pci 0000:e0:02.0: reg 10: [mem 0xfffffffff0000000-0xfffffffff3ffffff pref]
pci 0000:e0:02.0: reg 14: [io  0x6e000-0x6e0ff]
pci 0000:e0:02.0: reg 18: [mem 0xfffffffff4040000-0xfffffffff404ffff]
pci 0000:e0:02.0: reg 30: [mem 0xfffffffff4000000-0xfffffffff401ffff pref]
pci 0000:e0:02.0: supports D1 D2
powersw: Soft power switch support not available.
bio: create slab <bio-0> at 0
vgaarb: device added: PCI:0000:e0:02.0,decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
vgaarb: bridge control possible 0000:e0:02.0
NET: Registered protocol family 2
IP route cache hash table entries: 524288 (order: 10, 4194304 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP: reno registered
UDP hash table entries: 8192 (order: 6, 262144 bytes)
UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
NET: Registered protocol family 1
PCI: CLS 64 bytes
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 7625k freed
Performance monitoring counters enabled for Storm Peak Slow
msgmni has been set to 20093
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
start plist test
end plist test
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 73) is a 16550A
0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 73) is a 16550A
console [ttyS1] enabled, bootconsole disabled
0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 73) is a 16550A
0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 73) is a 16550A
Linux agpgart interface v0.103
brd: module loaded
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
mousedev: PS/2 mouse device common for all mice
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
TCP: cubic registered
rtc-generic rtc-generic: setting system clock to 2012-05-14 00:36:09 UTC (1336955769)
Freeing unused kernel memory: 216k freed
udevd[836]: starting version 175
SCSI subsystem initialized
tg3.c:v3.123 (March 21, 2012)
libata version 3.00 loaded.
pata_cmd64x 0000:00:02.0: Secondary port is disabled
scsi0 : pata_cmd64x
scsi1 : pata_cmd64x
ata1: PATA max UDMA/100 cmd 0xd18 ctl 0xd24 bmdma 0xd00 irq 69
ata2: DUMMY
pata_cmd64x: active 10 recovery 10 setup 3.
pata_cmd64x: active 10 recovery 10 setup 3.
ata1.00: ATAPI: DW-224E, C.0B, max UDMA/33
pata_cmd64x: active 3 recovery 1 setup 1.
ata1.00: configured for UDMA/33
scsi 0:0:0:0: CD-ROM            TEAC     DW-224E          C.0B PQ: 0 ANSI: 5
sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
cdrom: Uniform CD-ROM driver Revision: 3.20
sr 0:0:0:0: Attached scsi CD-ROM sr0
tg3 0000:20:02.0: eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI:66MHz:64-bit) MAC address 00:30:6e:4b:16:4d
tg3 0000:20:02.0: eth0: attached PHY is 5701 (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
tg3 0000:20:02.0: eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[0]
tg3 0000:20:02.0: eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 70
sym0: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi2 : sym-2.2.3
scsi 2:0:0:0: Direct-Access     FUJITSU  MAJ3364MC        HP12 PQ: 0 ANSI: 2
scsi target2:0:0: tagged command queuing enabled, command queue depth 16.
scsi target2:0:0: Beginning Domain Validation
scsi target2:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
scsi target2:0:0: Ending Domain Validation
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 71
sym1: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi3 : sym-2.2.3
scsi 3:0:2:0: Direct-Access     SEAGATE  ST318203LC       HP04 PQ: 0 ANSI: 2
scsi target3:0:2: tagged command queuing enabled, command queue depth 16.
scsi target3:0:2: Beginning Domain Validation
scsi target3:0:2: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 15)
scsi target3:0:2: Domain Validation skipping write tests
scsi target3:0:2: Ending Domain Validation
sd 2:0:0:0: [sda] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
sd 3:0:2:0: [sdb] 35566480 512-byte logical blocks: (18.2 GB/16.9 GiB)
sd 2:0:0:0: [sda] Write Protect is off
sd 2:0:0:0: [sda] Mode Sense: ab 00 10 08
sd 3:0:2:0: [sdb] Write Protect is off
sd 3:0:2:0: [sdb] Mode Sense: 9f 00 10 08
sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
sd 3:0:2:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sdb: sdb1 sdb2
 sda: sda1 sda2 sda3 < sda5 sda6 sda7 >
sd 3:0:2:0: [sdb] Attached SCSI disk
sd 2:0:0:0: [sda] Attached SCSI disk
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda5): mounted filesystem with writeback data mode
udevd[1019]: starting version 175
udisks-part-id(1135): unaligned access to 0x00000000fafdc98e at ip=0x0000000000012b53
udisks-part-id(1135): unaligned access to 0x00000000fafdc992 at ip=0x0000000000012bc7
udisks-part-id(1135): unaligned access to 0x00000000fafdc99e at ip=0x0000000000012b53
udisks-part-id(1135): unaligned access to 0x00000000fafdc9a2 at ip=0x0000000000012bc7
udisks-part-id(1134): unaligned access to 0x00000000fb3db98e at ip=0x0000000000012b53
Adding 979928k swap on /dev/sda6.  Priority:-1 extents:1 across:979928k 
EXT3-fs (sda5): using internal journal
handle_unaligned: 179 callbacks suppressed
udisks-part-id(1617): unaligned access to 0x00000000fb6239ce at ip=0x0000000000012b53
udisks-part-id(1617): unaligned access to 0x00000000fb6239d2 at ip=0x0000000000012bc7
udisks-part-id(1617): unaligned access to 0x00000000fb6239de at ip=0x0000000000012b53
udisks-part-id(1617): unaligned access to 0x00000000fb6239e2 at ip=0x0000000000012bc7
udisks-part-id(1617): unaligned access to 0x00000000fb6239ee at ip=0x0000000000012b53
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda7): using internal journal
EXT3-fs (sda7): mounted filesystem with writeback data mode
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sdb1): using internal journal
EXT3-fs (sdb1): mounted filesystem with writeback data mode
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sdb2): using internal journal
EXT3-fs (sdb2): mounted filesystem with writeback data mode
NET: Registered protocol family 10
ADDRCONF(NETDEV_UP): eth0: link is not ready
tg3 0000:20:02.0: eth0: Link is up at 100 Mbps, full duplex
tg3 0000:20:02.0: eth0: Flow control is on for TX and on for RX
ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).

--Apple-Mail-2-20889562--
