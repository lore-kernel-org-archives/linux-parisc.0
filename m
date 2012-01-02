From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Happy New Year PARISC
Date: Mon, 2 Jan 2012 18:12:51 -0500
Message-ID: <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl> <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com> <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-5--653579163"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Grant Grundler <grantgrundler@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-5--653579163
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 2-Jan-12, at 10:12 AM, John David Anglin wrote:

> I'm going to work on the kernel patch some more today.  Hopefully,
> it will then be ready for testing on other machines.

None of this worked.  Attached patch as it stands.  Comments and  
testing appreciated.

Regards,
Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-5--653579163
Content-Disposition: attachment; filename="linux-stable-20120102.d.txt"
Content-Type: text/plain; x-unix-mode=0644;
	name="linux-stable-20120102.d.txt"
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
index a84cc1f..ea63524 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -22,14 +22,14 @@
 #include <asm/cache.h>
 
 #define clear_page(page)	memset((void *)(page), 0, PAGE_SIZE)
-#define copy_page(to,from)      copy_user_page_asm((void *)(to), (void *)(from))
+#define copy_page(to,from)      copy_page_asm((void *)(to), (void *)(from))
 
 struct page;
 
-void copy_user_page_asm(void *to, void *from);
+void copy_page_asm(void *to, void *from);
 void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 			   struct page *pg);
-void clear_user_page(void *page, unsigned long vaddr, struct page *pg);
+void clear_user_page(void *vto, unsigned long vaddr, struct page *pg);
 
 /*
  * These are used to make use of C type-checking..
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 22dadeb..ab667f8 100644
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
 
@@ -464,6 +471,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
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
index 83335f3..a6e90cf 100644
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
@@ -315,9 +315,13 @@ void flush_dcache_page(struct page *page)
 
 		flush_tlb_page(mpnt, addr);
 		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
-			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
+			if (old_addr == 0)
+				__flush_cache_page(mpnt, addr, page_to_phys(page));
+			else if (parisc_requires_coherency()) {
+				/* Big trouble -- we have a bad mapping */
+				flush_cache_all();
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *)mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
+			}
 			old_addr = addr;
 		}
 	}
@@ -331,17 +335,6 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_asm);
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
 
@@ -375,18 +368,25 @@ void __init parisc_setup_cache_timing(void)
 	printk(KERN_INFO "Setting cache flush threshold to %x (%d CPUs online)\n", parisc_cache_flush_threshold, num_online_cpus());
 }
 
-extern void purge_kernel_dcache_page(unsigned long);
-extern void clear_user_page_asm(void *page, unsigned long vaddr);
+extern void purge_kernel_dcache_page_asm(unsigned long);
+extern void clear_user_page_asm(void *, unsigned long);
+extern void copy_user_page_asm(void *, void *, unsigned long);
 
-void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
+void clear_user_page(void *vto, unsigned long vaddr, struct page *page)
 {
 	unsigned long flags;
 
-	purge_kernel_dcache_page((unsigned long)page);
+	/* The PA-RISC 2.0 Architecture book states on page F-6:
+	   "Before a write-capable translation is enabled, *all*
+	   non-equivalently-aliased translations must be removed
+	   from the page table and purged from the TLB.  (Note
+	   that the caches are not required to be flushed at this
+	   time.)"  */
+
 	purge_tlb_start(flags);
-	pdtlb_kernel(page);
+	pdtlb_kernel(vto);
 	purge_tlb_end(flags);
-	clear_user_page_asm(page, vaddr);
+	clear_user_page_asm(vto, vaddr);
 }
 EXPORT_SYMBOL(clear_user_page);
 
@@ -401,13 +401,33 @@ void flush_kernel_dcache_page_addr(void *addr)
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 
+#define COPY_USER_PAGE_VIA_KMAP 1
+
 void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
-		    struct page *pg)
+	struct page *pg)
 {
-	/* no coherency needed (all in kmap/kunmap) */
-	copy_user_page_asm(vto, vfrom);
+#if COPY_USER_PAGE_VIA_KMAP
+	/* Copy using kernel mapping.  This has the advantage
+	   that no coherency is needed in copy_page_asm (all in
+	   kmap/kunmap).  However, the `from' page may be dirty
+	   in threaded applications and it needs to be flushed
+	   before it can be accessed through the kernel mapping. */
+	copy_page_asm(vto, vfrom);
 	if (!parisc_requires_coherency())
 		flush_kernel_dcache_page_asm(vto);
+#else
+	unsigned long flags;
+
+	/* Copy through temp-alias region.  This has the advantage
+	   that the `from' page doesn't need to be flushed.  However,
+	   the `to' page must be flushed in copy_user_page_asm since
+	   it can be used to bring in code.  */
+	purge_tlb_start(flags);
+	pdtlb_kernel(vto);
+	pdtlb_kernel(vfrom);
+	purge_tlb_end(flags);
+	copy_user_page_asm(vto, vfrom, vaddr);
+#endif
 }
 EXPORT_SYMBOL(copy_user_page);
 
@@ -487,18 +507,90 @@ flush_user_icache_range(unsigned long start, unsigned long end)
 		flush_instruction_cache();
 }
 
+/* While useful for testing, this check has too much overhead for
+   general use.  Thus, it is better to fix inequivalent mappings
+   than whack the cache.  */
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
+	/* Check that all mappings of a file are congruently mapped */
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
+/* While flushing by page is slightly less efficient, it allows detection
+   of pages without pte's and mappings with inequivalent aliases.  */
+
+#define FLUSH_CACHE_RANGE_BY_PAGE 0
 
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
+	if ((end - start) < parisc_cache_flush_threshold
+	    && vma->vm_mm->context == mfsp(3)) {
+#if FLUSH_CACHE_RANGE_BY_PAGE
+		unsigned long addr;
+		pte_t *ptep;
+		pgd_t *pgd = vma->vm_mm->pgd;
+
+		for (addr = start & PAGE_MASK; addr < end; addr += PAGE_SIZE) {
+			ptep = get_ptep(pgd, addr);
+			if (!ptep) {
+				/* ??? Why don't we have a pte?  */
+				flush_cache_all();
+				return;
+			}
+			check_page_mapping(pte_page(*ptep));
+			flush_cache_page(vma, addr, pte_pfn(*ptep));
+		}
+#else
+		flush_user_dcache_range_asm(start,end);
+		flush_user_icache_range_asm(start,end);
+#endif
 	} else {
 		flush_cache_all();
 	}
@@ -513,3 +605,23 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
 
 }
+
+void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
+{
+	unsigned long flags;
+
+	/* The PA-RISC 2.0 Architecture book states on page F-7:
+	   "Before any non-equivalent aliased translation is re-enabled,
+	    the virtual address range for the writeable page (the entire
+	    page) must be flushed from the cache, and the write-capable
+	    translation removed from the page table and purged from the
+	    TLB."  set_pte_at is used to setup COW pages, so the TLB
+	    must be purged.  Note: purge_tlb_entries can be called at
+	    startup with no context.  */
+
+	mtsp(mm->context,1);
+	purge_tlb_start(flags);
+	pdtlb(addr);
+	pitlb(addr);
+	purge_tlb_end(flags);
+}
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
index c0b1aff..0299d63 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
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
index 93ff3d9..5188abd 100644
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
@@ -277,7 +327,34 @@ ENDPROC(flush_data_cache_local)
 
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
+/* Copy page using kernel mapping.  */
+
+ENTRY(copy_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -399,7 +476,7 @@ ENTRY(copy_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(copy_user_page_asm)
+ENDPROC(copy_page_asm)
 
 /*
  * NOTE: Code in clear_user_page has a hard coded dependency on the
@@ -422,8 +499,6 @@ ENDPROC(copy_user_page_asm)
  *          %r23 physical page (shifted for tlb insert) of "from" translation
  */
 
-#if 0
-
 	/*
 	 * We can't do this since copy_user_page is used to bring in
 	 * file data that might have instructions. Since the data would
@@ -435,6 +510,11 @@ ENDPROC(copy_user_page_asm)
 	 * use it if more information is passed into copy_user_page().
 	 * Have to do some measurements to see if it is worthwhile to
 	 * lobby for such a change.
+	 *
+	 * JDA: Added code to flush the data cache, so this function
+	 * now works.  Even with this additional overhead, it may make
+	 * sense to use this function because it should handle dirty
+	 * `from' pages.
 	 */
 
 ENTRY(copy_user_page_asm)
@@ -466,9 +546,83 @@ ENTRY(copy_user_page_asm)
 
 	/* Purge any old translations */
 
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
 	pdtlb		0(%r29)
+	tlb_unlock	%r20,%r21,%r22
+
+	ldil		L%dcache_stride, %r23
+	ldw		R%dcache_stride(%r23), %r23
+
+#ifdef CONFIG_64BIT
+	/* PA8x00 CPUs can consume 2 loads or 1 store per cycle.
+	 * Unroll the loop by hand and arrange insn appropriately.
+	 * GCC probably can do this just as well.
+	 */
+
+	ldd		0(%r29), %r19
+	ldi		(PAGE_SIZE / 128), %r1
+
+	ldw		64(%r29), %r0		/* prefetch 1 cacheline ahead */
+	ldw		128(%r29), %r0		/* prefetch 2 */
+
+1:	ldd		8(%r29), %r20
+	ldw		192(%r29), %r0		/* prefetch 3 */
+	ldw		256(%r29), %r0		/* prefetch 4 */
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
+
+	/* Flush lines.  */
+	ldo		128(%r28), %r24
+	fdc,m		%r23(%r28)
+2:	cmpb,COND(<<),n	%r28,%r24,2b
+	fdc,m		%r23(%r28)
 
+	/* conditional branches nullify on forward taken branch, and on
+	 * non-taken backward branch. Note that .+4 is a backwards branch.
+	 * The ldd should only get executed if the branch is taken.
+	 */
+	addib,COND(>),n	-1, %r1, 1b		/* bundle 10 */
+	ldd		0(%r29), %r19		/* start next loads */
+
+#else
 	ldi		64, %r1
 
 	/*
@@ -480,9 +634,7 @@ ENTRY(copy_user_page_asm)
 	 * use ldd/std on a 32 bit kernel.
 	 */
 
-
-1:
-	ldw		0(%r29), %r19
+1:	ldw		0(%r29), %r19
 	ldw		4(%r29), %r20
 	ldw		8(%r29), %r21
 	ldw		12(%r29), %r22
@@ -514,19 +666,26 @@ ENTRY(copy_user_page_asm)
 	stw		%r20, 52(%r28)
 	stw		%r21, 56(%r28)
 	stw		%r22, 60(%r28)
-	ldo		64(%r28), %r28
+
+	/* Flush lines.  */
+	ldo		64(%r28), %r24
+	fdc,m		%r23(%r28)
+2:	cmpb,COND(<<),n	%r28,%r24,2b
+	fdc,m		%r23(%r28)
+
 	addib,COND(>)		-1, %r1,1b
 	ldo		64(%r29), %r29
+#endif
 
+	sync
 	bv		%r0(%r2)
 	nop
 	.exit
 
 	.procend
 ENDPROC(copy_user_page_asm)
-#endif
 
-ENTRY(__clear_user_page_asm)
+ENTRY(clear_user_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -550,7 +709,9 @@ ENTRY(__clear_user_page_asm)
 
 	/* Purge any old translation */
 
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
+	tlb_unlock	%r20,%r21,%r22
 
 #ifdef CONFIG_64BIT
 	ldi		(PAGE_SIZE / 128), %r1
@@ -580,8 +741,7 @@ ENTRY(__clear_user_page_asm)
 #else	/* ! CONFIG_64BIT */
 	ldi		(PAGE_SIZE / 64), %r1
 
-1:
-	stw		%r0, 0(%r28)
+1:	stw		%r0, 0(%r28)
 	stw		%r0, 4(%r28)
 	stw		%r0, 8(%r28)
 	stw		%r0, 12(%r28)
@@ -606,7 +766,7 @@ ENTRY(__clear_user_page_asm)
 	.exit
 
 	.procend
-ENDPROC(__clear_user_page_asm)
+ENDPROC(clear_user_page_asm)
 
 ENTRY(flush_dcache_page_asm)
 	.proc
@@ -630,7 +790,9 @@ ENTRY(flush_dcache_page_asm)
 
 	/* Purge any old translation */
 
+	tlb_lock	%r20,%r21,%r22
 	pdtlb		0(%r28)
+	tlb_unlock	%r20,%r21,%r22
 
 	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), %r1
@@ -663,8 +825,11 @@ ENTRY(flush_dcache_page_asm)
 	fdc,m		%r1(%r28)
 
 	sync
+	tlb_lock	%r20,%r21,%r22
+	pdtlb		0(%r25)
+	tlb_unlock	%r20,%r21,%r22
 	bv		%r0(%r2)
-	pdtlb		(%r25)
+	nop
 	.exit
 
 	.procend
@@ -692,7 +857,9 @@ ENTRY(flush_icache_page_asm)
 
 	/* Purge any old translation */
 
+	tlb_lock	%r20,%r21,%r22
 	pitlb		(%sr0,%r28)
+	tlb_unlock	%r20,%r21,%r22
 
 	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r1
@@ -725,8 +892,11 @@ ENTRY(flush_icache_page_asm)
 	fic,m		%r1(%r28)
 
 	sync
-	bv		%r0(%r2)
+	tlb_lock	%r20,%r21,%r22
 	pitlb		(%sr0,%r25)
+	tlb_unlock	%r20,%r21,%r22
+	bv		%r0(%r2)
+	nop
 	.exit
 
 	.procend
@@ -775,7 +945,7 @@ ENTRY(flush_kernel_dcache_page_asm)
 	.procend
 ENDPROC(flush_kernel_dcache_page_asm)
 
-ENTRY(purge_kernel_dcache_page)
+ENTRY(purge_kernel_dcache_page_asm)
 	.proc
 	.callinfo NO_CALLS
 	.entry
@@ -815,7 +985,7 @@ ENTRY(purge_kernel_dcache_page)
 	.exit
 
 	.procend
-ENDPROC(purge_kernel_dcache_page)
+ENDPROC(purge_kernel_dcache_page_asm)
 
 ENTRY(flush_user_dcache_range_asm)
 	.proc
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index a7bb757..546c51d 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -159,4 +159,4 @@ EXPORT_SYMBOL(_mcount);
 #endif
 
 /* from pacache.S -- needed for copy_page */
-EXPORT_SYMBOL(copy_user_page_asm);
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
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index dc5114b..1d6d390 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -531,6 +531,7 @@ out_eoi:
 void
 handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 {
+	struct irqaction *action;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	kstat_incr_irqs_this_cpu(irq, desc);
@@ -538,7 +539,9 @@ handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 	if (chip->irq_ack)
 		chip->irq_ack(&desc->irq_data);
 
-	handle_irq_event_percpu(desc, desc->action);
+	action = desc->action;
+	if (action)
+		handle_irq_event_percpu(desc, action);
 
 	if (chip->irq_eoi)
 		chip->irq_eoi(&desc->irq_data);

--Apple-Mail-5--653579163--
