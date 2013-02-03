From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fixes and cleanups in page cache flushing (4/4)
Date: Mon, 4 Feb 2013 00:02:49 +0100
Message-ID: <20130203230249.GD14573@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Author: John David Anglin <dave.anglin@bell.net>

CONFIG_PARISC_TMPALIAS enables clear_user_highpage and copy_user_highpage.
These are essentially alternative implementations of clear_user_page and
copy_user_page.  They don't have anything to do with x86 high pages, but they
build on the infrastructure to save a few instructions.  Read the comment in
clear_user_highpage as it is very important to the implementation.  For this
reason, there isn't any gain in using the TMPALIAS/highpage approach.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index b89a85a..703ed48 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -529,3 +595,67 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
 
 }
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
