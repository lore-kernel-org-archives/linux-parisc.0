From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] prevent speculative re-read on cache flush
Date: Fri, 15 Apr 2011 12:37:22 -0500
Message-ID: <1302889043.7706.5.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

According to Appendix F, the TLB is the primary arbiter of speculation.
Thus, if a page has a TLB entry, it may be speculatively read into the
cache.  On linux, this can cause us incoherencies because if we're about
to do a disk read, we call get_user_pages() to do the flush/invalidate
in user space, but we still potentially have the user TLB entries, and
the cache could speculate the lines back into userspace (thus causing
stale data to be used).  This is fixed by purging the TLB entries before
we flush through the tmpalias space.  Now, the only way the line could
be re-speculated is if the user actually tries to touch it (which is not
allowed).

James

---

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index d18328b..da601dd 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -3,6 +3,7 @@
 
 #include <linux/mm.h>
 #include <linux/uaccess.h>
+#include <asm/tlbflush.h>
 
 /* The usual comment is "Caches aren't brain-dead on the <architecture>".
  * Unfortunately, that doesn't apply to PA-RISC. */
@@ -112,8 +113,10 @@ void flush_dcache_page_asm(unsigned long phys_addr, unsigned long vaddr);
 static inline void
 flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
 {
-	if (PageAnon(page))
+	if (PageAnon(page)) {
+		flush_tlb_page(vma, vmaddr);
 		flush_dcache_page_asm(page_to_phys(page), vmaddr);
+	}
 }
 
 #ifdef CONFIG_DEBUG_RODATA
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 3f11331..83335f3 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -304,10 +304,20 @@ void flush_dcache_page(struct page *page)
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 
+		/* The TLB is the engine of coherence on parisc: The
+		 * CPU is entitled to speculate any page with a TLB
+		 * mapping, so here we kill the mapping then flush the
+		 * page along a special flush only alias mapping.
+		 * This guarantees that the page is no-longer in the
+		 * cache for any process and nor may it be
+		 * speculatively read in (until the user or kernel
+		 * specifically accesses it, of course) */
+
+		flush_tlb_page(mpnt, addr);
 		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
 			if (old_addr)
-				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
+				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *)mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
 			old_addr = addr;
 		}
 	}
@@ -499,6 +509,7 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 {
 	BUG_ON(!vma->vm_mm->context);
 
+	flush_tlb_page(vma, vmaddr);
 	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
 
 }


