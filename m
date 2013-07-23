From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH]  parisc: Fix cache routines to ignore vma's with an invalid pfn
Date: Tue, 23 Jul 2013 12:27:52 -0400
Message-ID: <BLU0-SMTP618F2A575D86195DC418DD976F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-53--994801766"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-53--994801766
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The parisc architecture does not have a pte special bit.  As a result,  
special mappings are handled with the
VM_PFNMAP and VM_MIXEDMAP flags.  VM_MIXEDMAP mappings may or may not  
have a "struct page"
backing.  When pfn_valid() is false, there is no "struct page"  
backing.  Otherwise, they are treated as normal
pages.

The FireGL driver uses the  VM_MIXEDMAP without a backing "struct  
page".  This treatment caused a panic
due to a TLB data miss in update_mmu_cache.  This appeared to be in  
the code generated for page_address().
We were in fact using a very circular bit of code to determine the  
physical address of the PFN in various cache
routines.  This wasn't valid when there was no "struct page" backing.   
The needed address can in fact be determined
simply from the PFN itself without using the "struct page".

The attached patch updates update_mmu_cache(), flush_cache_mm(),  
flush_cache_range() and flush_cache_page()
to check pfn_valid() and to directly compute the PFN physical and  
virtual addresses.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---



--Apple-Mail-53--994801766
Content-Disposition: attachment; filename="cache.c.d.3.txt"
Content-Type: text/plain; x-unix-mode=0644; name="cache.c.d.3.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 2e65aa5..57876fa 100644
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
@@ -518,21 +527,20 @@ void flush_cache_mm(struct mm_struct *mm)
 				     addr += PAGE_SIZE) {
 					pte_t *ptep = get_ptep(pgd, addr);
 					if (ptep != NULL) {
-						pte_t pte = *ptep;
-						__flush_cache_page(vma, addr,
-						  page_to_phys(pte_page(pte)));
+						unsigned long pfn = pte_pfn(*ptep);
+						if (pfn_valid(pfn))
+							__flush_cache_page(vma, addr, PFN_PHYS(pfn));
 					}
 				}
 			}
 		}
-		return;
-	}
-
+	} else {
 #ifdef CONFIG_SMP
-	flush_cache_all();
+		flush_cache_all();
 #else
-	flush_cache_all_local();
+		flush_cache_all_local();
 #endif
+	}
 }
 
 void
@@ -571,9 +579,9 @@ void flush_cache_range(struct vm_area_struct *vma,
 			     addr += PAGE_SIZE) {
 				pte_t *ptep = get_ptep(pgd, addr);
 				if (ptep != NULL) {
-					pte_t pte = *ptep;
-					flush_cache_page(vma,
-					   addr, pte_pfn(pte));
+					unsigned long pfn = pte_pfn(*ptep);
+					if (pfn_valid(pfn))
+						__flush_cache_page(vma, addr, PFN_PHYS(pfn));
 				}
 			}
 		}
@@ -591,9 +599,10 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 {
 	BUG_ON(!vma->vm_mm->context);
 
-	flush_tlb_page(vma, vmaddr);
-	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
--Apple-Mail-53--994801766--
