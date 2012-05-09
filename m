From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 09 May 2012 11:55:46 -0400
Message-ID: <4FAA9382.7040802@bell.net>
References: <4FA9975C.5060708@bergerie> <41786065.U2qKzXR3uX@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030502030704090705020604"
Cc: Vincent <vincent.stehle@laposte.net>, linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <41786065.U2qKzXR3uX@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------030502030704090705020604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/2012 2:53 AM, Rolf Eike Beer wrote:
> Vincent wrote:
>> Hi parisc folks,
>>
>> I have noticed that the mainline kernel won't boot any more on my
>> hp712/100, starting with v2.6.39. It panics in
>> flush_instruction_cache_local.
> See the mail thread "Boot error using 3.2.1: swapper (pid 1): Illegal
> instruction (code 8)" I started when I first hit this on my 705. But James
> doesn't care.
There is a fair chance that the patch posted here 
<http://www.spinics.net/lists/linux-parisc/msg04068.html>
would fix the boot issue.   However, I recently discovered a build issue 
on non SMP configurations.  Attached
is an updated version.   It applies against 3.3.4.

It has been tested extensively on rp3440.

clear_user_page does not use the tmpalias region.  I believe the problem 
with the current implementation
is that the TLB setup can be clobbered if __clear_user_page_asm is 
reentered.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

Dave

-- 
John David Anglin    dave.anglin@bell.net


--------------030502030704090705020604
Content-Type: text/plain; charset=windows-1252;
 name="cache-2.d.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cache-2.d.txt"

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
 
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index a84cc1f..9400a62 100644
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
index 22dadeb..100f409 100644
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
 
@@ -460,10 +466,13 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
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
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 83335f3..f31edc2 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
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
@@ -460,8 +455,65 @@ void flush_cache_all(void)
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
@@ -487,20 +539,34 @@ flush_user_icache_range(unsigned long start, unsigned long end)
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
 
@@ -513,3 +579,81 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
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
 

--------------030502030704090705020604--
