From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] parisc: improve vmap flush/invalidate
Date: Thu, 20 Jan 2011 12:54:18 -0600
Message-ID: <1295549658.3014.19.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On parisc, we never implemented invalidate_kernel_vmap_range() because
it was unnecessary for the xfs use case.  However, we do need to
implement an invalidate for the opposite use case (which occurred in a
recent NFS change) where the user wants to read through the vmap range
and write via the kernel address.  There's an additional complexity to
this in that if the page has no userspace mappings, it might have dirty
cache lines in the kernel (indicated by the PG_dcache_dirty bit).  In
order to get full coherency, we need to flush these pages through the
kernel mapping before invalidating the vmap range.

James

---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index f388a85..df6c56d 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -37,6 +37,13 @@ void flush_cache_all_local(void);
 void flush_cache_all(void);
 void flush_cache_mm(struct mm_struct *mm);
 
+#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
+void flush_kernel_dcache_page_addr(void *addr);
+static inline void flush_kernel_dcache_page(struct page *page)
+{
+	flush_kernel_dcache_page_addr(page_address(page));
+}
+
 #define flush_kernel_dcache_range(start,size) \
 	flush_kernel_dcache_range_asm((start), (start)+(size));
 /* vmap range flushes and invalidates.  Architecturally, we don't need
@@ -50,6 +57,16 @@ static inline void flush_kernel_vmap_range(void *vaddr, int size)
 }
 static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 {
+	unsigned long start = (unsigned long)vaddr;
+	void *cursor = vaddr;
+
+	for ( ; cursor < vaddr + size; cursor += PAGE_SIZE) {
+		struct page *page = vmalloc_to_page(cursor);
+
+		if (test_and_clear_bit(PG_dcache_dirty, &page->flags))
+			flush_kernel_dcache_page(page);
+	}
+	flush_kernel_dcache_range_asm(start, start + size);
 }
 
 #define flush_cache_vmap(start, end)		flush_cache_all()
@@ -98,13 +115,6 @@ flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vma
 		flush_user_dcache_page(vmaddr);
 }
 
-#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
-void flush_kernel_dcache_page_addr(void *addr);
-static inline void flush_kernel_dcache_page(struct page *page)
-{
-	flush_kernel_dcache_page_addr(page_address(page));
-}
