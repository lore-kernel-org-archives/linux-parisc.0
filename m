From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove unused CONFIG_PARISC_TMPALIAS code
Date: Sat, 1 Mar 2014 17:41:22 -0500
Message-ID: <BLU0-SMTP920C45728FF02332B65D73978D0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-7-942139000"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-7-942139000
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The attached change removes the unused and experimental  
CONFIG_PARISC_TMPALIAS code.
It doesn't work and I don't believe it will ever be used.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

---


--Apple-Mail-7-942139000
Content-Disposition: attachment; filename="cache-cleanup.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="cache-cleanup.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 637fe03..60d5d17 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -32,17 +32,6 @@ void copy_page_asm(void *to, void *from);
 void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 			struct page *pg);
 
-/* #define CONFIG_PARISC_TMPALIAS */
-
-#ifdef CONFIG_PARISC_TMPALIAS
-void clear_user_highpage(struct page *page, unsigned long vaddr);
-#define clear_user_highpage clear_user_highpage
-struct vm_area_struct;
-void copy_user_highpage(struct page *to, struct page *from,
-	unsigned long vaddr, struct vm_area_struct *vma);
-#define __HAVE_ARCH_COPY_USER_HIGHPAGE
-#endif
-
 /*
  * These are used to make use of C type-checking..
  */
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index ac87a40..a6ffc77 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -581,67 +581,3 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 	}
 }
-
-#ifdef CONFIG_PARISC_TMPALIAS
-
-void clear_user_highpage(struct page *page, unsigned long vaddr)
-{
-	void *vto;
-	unsigned long flags;
-
-	/* Clear using TMPALIAS region.  The page doesn't need to
-	   be flushed but the kernel mapping needs to be purged.  */
-
-	vto = kmap_atomic(page);
-
-	/* The PA-RISC 2.0 Architecture book states on page F-6:
-	   "Before a write-capable translation is enabled, *all*
-	   non-equivalently-aliased translations must be removed
-	   from the page table and purged from the TLB.  (Note
-	   that the caches are not required to be flushed at this
-	   time.)  Before any non-equivalent aliased translation
-	   is re-enabled, the virtual address range for the writeable
-	   page (the entire page) must be flushed from the cache,
-	   and the write-capable translation removed from the page
-	   table and purged from the TLB."  */
-
-	purge_kernel_dcache_page_asm((unsigned long)vto);
-	purge_tlb_start(flags);
-	pdtlb_kernel(vto);
-	purge_tlb_end(flags);
-	preempt_disable();
-	clear_user_page_asm(vto, vaddr);
-	preempt_enable();
-
-	pagefault_enable();		/* kunmap_atomic(addr, KM_USER0); */
-}
-
-void copy_user_highpage(struct page *to, struct page *from,
-	unsigned long vaddr, struct vm_area_struct *vma)
-{
-	void *vfrom, *vto;
-	unsigned long flags;
-
-	/* Copy using TMPALIAS region.  This has the advantage
-	   that the `from' page doesn't need to be flushed.  However,
-	   the `to' page must be flushed in copy_user_page_asm since
-	   it can be used to bring in executable code.  */
-
-	vfrom = kmap_atomic(from);
-	vto = kmap_atomic(to);
-
-	purge_kernel_dcache_page_asm((unsigned long)vto);
-	purge_tlb_start(flags);
-	pdtlb_kernel(vto);
-	pdtlb_kernel(vfrom);
-	purge_tlb_end(flags);
-	preempt_disable();
-	copy_user_page_asm(vto, vfrom, vaddr);
-	flush_dcache_page_asm(__pa(vto), vaddr);
-	preempt_enable();
-
-	pagefault_enable();		/* kunmap_atomic(addr, KM_USER1); */
-	pagefault_enable();		/* kunmap_atomic(addr, KM_USER0); */
-}
--Apple-Mail-7-942139000--
