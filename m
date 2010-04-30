From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Patch for segfaults in minifail tests
Date: Fri, 30 Apr 2010 13:21:37 -0500
Message-ID: <1272651697.2844.39.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Helge Deller <deller@gmx.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

T-bone is keeping a web page with all the failing tests on now:

http://wiki.parisc-linux.org/TestCases

The patch below is what I've found fixes the minifail6 case, but it
doesn't seem to fully fix the minifail one (although the frequency goes
down).

It's the essential patch we need to fix up our kmapping.  Right at the
moment kmap of a page with a dirty cache line in userspace sees stale
data and kunmap of a page the kernel has modified will see likewise.

James

---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 4772777..d717e75 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -116,21 +116,22 @@ void mark_rodata_ro(void);
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
+#define kmap_atomic(page, idx)		kmap_parisc(page)
 
 #define kunmap_atomic(addr, idx)	kunmap_parisc(addr)
 
-#define kmap_atomic_pfn(pfn, idx)	page_address(pfn_to_page(pfn))
-#define kmap_atomic_to_page(ptr)	virt_to_page(ptr)
+#define kmap_atomic_pfn(pfn, idx)	kmap_parisc(pfn_to_page(pfn))
+#define kmap_atomic_to_page(ptr)	virt_to_page(kmap_parisc(virt_to_page(ptr)))
 #endif
 
 #endif /* _PARISC_CACHEFLUSH_H */
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index d054f3d..b971ed3 100644
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
@@ -475,16 +480,6 @@ void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
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
@@ -577,3 +572,25 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
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



