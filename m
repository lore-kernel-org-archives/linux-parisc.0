From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH]  parisc: Fix cache routines to ignore vma's with an invalid
 pfn
Date: Tue, 23 Jul 2013 23:52:59 +0200
Message-ID: <51EEFB3B.3010107@gmx.de>
References: <BLU0-SMTP618F2A575D86195DC418DD976F0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090601060802030604010003"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP618F2A575D86195DC418DD976F0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------090601060802030604010003
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Dave,

On 07/23/2013 06:27 PM, John David Anglin wrote:
> The parisc architecture does not have a pte special bit.  As a result, special mappings are handled with the
> VM_PFNMAP and VM_MIXEDMAP flags.  VM_MIXEDMAP mappings may or may not have a "struct page"
> backing.  When pfn_valid() is false, there is no "struct page" backing.  Otherwise, they are treated as normal
> pages.
> 
> The FireGL driver uses the  VM_MIXEDMAP without a backing "struct page".  This treatment caused a panic
> due to a TLB data miss in update_mmu_cache.  This appeared to be in the code generated for page_address().
> We were in fact using a very circular bit of code to determine the physical address of the PFN in various cache
> routines.  This wasn't valid when there was no "struct page" backing.  The needed address can in fact be determined
> simply from the PFN itself without using the "struct page".
> 
> The attached patch updates update_mmu_cache(), flush_cache_mm(), flush_cache_range() and flush_cache_page()
> to check pfn_valid() and to directly compute the PFN physical and virtual addresses.

This patch gave lots of checkscript warnings.
Mostly because we now use more than 80 chars/line.

I've restructured the functions with cleaner return/continue code and submitted it into my "for-next" git tree at
https://patchwork.kernel.org/patch/2825923/mbox/

The modified patch is now here:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/commit/?h=for-next&id=606cd30e0e20806e3566d223223a6cb4e47ec9ea
and attached to this mail.
It's currently only compile-tested.

Helge


--------------090601060802030604010003
Content-Type: text/plain; charset=UTF-8;
 name="p1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="p1"

>From patchwork Tue Jul 23 16:27:52 2013
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: parisc: Fix cache routines to ignore vma's with an invalid pfn
From: John David Anglin <dave.anglin@bell.net>
X-Patchwork-Id: 2832084
Message-Id: <BLU0-SMTP618F2A575D86195DC418DD976F0@phx.gbl>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Date: Tue, 23 Jul 2013 12:27:52 -0400

The parisc architecture does not have a pte special bit. As a result,
special mappings are handled with the VM_PFNMAP and VM_MIXEDMAP flags.
VM_MIXEDMAP mappings may or may not have a "struct page" backing. When
pfn_valid() is false, there is no "struct page" backing. Otherwise, they
are treated as normal pages.

The FireGL driver uses the VM_MIXEDMAP without a backing "struct page".
This treatment caused a panic due to a TLB data miss in
update_mmu_cache. This appeared to be in the code generated for
page_address(). We were in fact using a very circular bit of code to
determine the physical address of the PFN in various cache routines.
This wasn't valid when there was no "struct page" backing.  The needed
address can in fact be determined simply from the PFN itself without
using the "struct page".

The attached patch updates update_mmu_cache(), flush_cache_mm(),
flush_cache_range() and flush_cache_page() to check pfn_valid() and to
directly compute the PFN physical and virtual addresses.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Cc: <stable@vger.kernel.org> # 3.10

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 2e65aa5..28045e7 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -71,18 +71,27 @@ flush_cache_all_local(void)
 }
 EXPORT_SYMBOL(flush_cache_all_local);
 
+/* Virtual address of pfn.  */
+#define pfn_va(pfn)	__va(PFN_PHYS(pfn))
+
 void
 update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
 {
-	struct page *page = pte_page(*ptep);
+	unsigned long pfn = pte_pfn(*ptep);
+	struct page *page;
 
-	if (pfn_valid(page_to_pfn(page)) && page_mapping(page) &&
-	    test_bit(PG_dcache_dirty, &page->flags)) {
+	/* We don't have pte special.  As a result, we can be called with
+	   an invalid pfn and we don't need to flush the kernel dcache page.
+	   This occurs with FireGL card in C8000.  */
+	if (!pfn_valid(pfn))
+		return;
 
-		flush_kernel_dcache_page(page);
+	page = pfn_to_page(pfn);
+	if (page_mapping(page) && test_bit(PG_dcache_dirty, &page->flags)) {
+		flush_kernel_dcache_page_addr(pfn_va(pfn));
 		clear_bit(PG_dcache_dirty, &page->flags);
 	} else if (parisc_requires_coherency())
-		flush_kernel_dcache_page(page);
+		flush_kernel_dcache_page_addr(pfn_va(pfn));
 }
 
 void
@@ -495,44 +504,42 @@ static inline pte_t *get_ptep(pgd_t *pgd, unsigned long addr)
 
 void flush_cache_mm(struct mm_struct *mm)
 {
+	struct vm_area_struct *vma;
+	pgd_t *pgd;
+
 	/* Flushing the whole cache on each cpu takes forever on
 	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
-	if (mm_total_size(mm) < parisc_cache_flush_threshold) {
-		struct vm_area_struct *vma;
-
-		if (mm->context == mfsp(3)) {
-			for (vma = mm->mmap; vma; vma = vma->vm_next) {
-				flush_user_dcache_range_asm(vma->vm_start,
-					vma->vm_end);
-				if (vma->vm_flags & VM_EXEC)
-					flush_user_icache_range_asm(
-					  vma->vm_start, vma->vm_end);
-			}
-		} else {
-			pgd_t *pgd = mm->pgd;
-
-			for (vma = mm->mmap; vma; vma = vma->vm_next) {
-				unsigned long addr;
-
-				for (addr = vma->vm_start; addr < vma->vm_end;
-				     addr += PAGE_SIZE) {
-					pte_t *ptep = get_ptep(pgd, addr);
-					if (ptep != NULL) {
-						pte_t pte = *ptep;
-						__flush_cache_page(vma, addr,
-						  page_to_phys(pte_page(pte)));
-					}
-				}
-			}
+	if (mm_total_size(mm) >= parisc_cache_flush_threshold) {
+		flush_cache_all();
+		return;
+	}
+
+	if (mm->context == mfsp(3)) {
+		for (vma = mm->mmap; vma; vma = vma->vm_next) {
+			flush_user_dcache_range_asm(vma->vm_start, vma->vm_end);
+			if ((vma->vm_flags & VM_EXEC) == 0)
+				continue;
+			flush_user_icache_range_asm(vma->vm_start, vma->vm_end);
 		}
 		return;
 	}
 
-#ifdef CONFIG_SMP
-	flush_cache_all();
-#else
-	flush_cache_all_local();
-#endif
+	pgd = mm->pgd;
+	for (vma = mm->mmap; vma; vma = vma->vm_next) {
+		unsigned long addr;
+
+		for (addr = vma->vm_start; addr < vma->vm_end;
+		     addr += PAGE_SIZE) {
+			unsigned long pfn;
+			pte_t *ptep = get_ptep(pgd, addr);
+			if (!ptep)
+				continue;
+			pfn = pte_pfn(*ptep);
+			if (!pfn_valid(pfn))
+				continue;
+			__flush_cache_page(vma, addr, PFN_PHYS(pfn));
+		}
+	}
 }
 
 void
@@ -556,33 +563,32 @@ flush_user_icache_range(unsigned long start, unsigned long end)
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
+	unsigned long addr;
+	pgd_t *pgd;
+
 	BUG_ON(!vma->vm_mm->context);
 
-	if ((end - start) < parisc_cache_flush_threshold) {
-		if (vma->vm_mm->context == mfsp(3)) {
-			flush_user_dcache_range_asm(start, end);
-			if (vma->vm_flags & VM_EXEC)
-				flush_user_icache_range_asm(start, end);
-		} else {
-			unsigned long addr;
-			pgd_t *pgd = vma->vm_mm->pgd;
-
-			for (addr = start & PAGE_MASK; addr < end;
-			     addr += PAGE_SIZE) {
-				pte_t *ptep = get_ptep(pgd, addr);
-				if (ptep != NULL) {
-					pte_t pte = *ptep;
-					flush_cache_page(vma,
-					   addr, pte_pfn(pte));
-				}
-			}
-		}
-	} else {
-#ifdef CONFIG_SMP
+	if ((end - start) >= parisc_cache_flush_threshold) {
 		flush_cache_all();
-#else
-		flush_cache_all_local();
-#endif
+		return;
+	}
+
+	if (vma->vm_mm->context == mfsp(3)) {
+		flush_user_dcache_range_asm(start, end);
+		if (vma->vm_flags & VM_EXEC)
+			flush_user_icache_range_asm(start, end);
+		return;
+	}
+
+	pgd = vma->vm_mm->pgd;
+	for (addr = start & PAGE_MASK; addr < end; addr += PAGE_SIZE) {
+		unsigned long pfn;
+		pte_t *ptep = get_ptep(pgd, addr);
+		if (!ptep)
+			continue;
+		pfn = pte_pfn(*ptep);
+		if (pfn_valid(pfn))
+			__flush_cache_page(vma, addr, PFN_PHYS(pfn));
 	}
 }
 
@@ -591,9 +597,10 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 {
 	BUG_ON(!vma->vm_mm->context);
 
-	flush_tlb_page(vma, vmaddr);
-	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
--------------090601060802030604010003--
