From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Tue, 8 Feb 2011 12:15:33 -0500
Message-ID: <20110208171532.GA286@hiauly1.hia.nrc.ca>
References: <1295549658.3014.19.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1295549658.3014.19.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 20 Jan 2011, James Bottomley wrote:

> On parisc, we never implemented invalidate_kernel_vmap_range() because
> it was unnecessary for the xfs use case.  However, we do need to
> implement an invalidate for the opposite use case (which occurred in a
> recent NFS change) where the user wants to read through the vmap range
> and write via the kernel address.  There's an additional complexity to
> this in that if the page has no userspace mappings, it might have dirty
> cache lines in the kernel (indicated by the PG_dcache_dirty bit).  In
> order to get full coherency, we need to flush these pages through the
> kernel mapping before invalidating the vmap range.

The attached patch greatly improves SMP stability on my rp3440.  I
have now done several full GCC builds with make -j4 without any random
segmentation faults.  This is with the parisc next-for branch, built
with gcc version 4.5.3 20110101 (prerelease) and binutils 2.21.51.20110108.

The change includes James' invalidate_kernel_vmap_range patch which
as of last night, doesn't seem to be in linux-next..

Notes:

1) Changed spin_lock_irq to spin_lock in flush_dcache_mmap_lock because
   the former causes a problem with timer interrupts.
2) Changed update_mmu_cache to return immediately if the PFN is not valid.
   In testing, I found there was always a mapping, so this test was
   eliminated.  I also changed to using test_and_clear_bit as on arm.
3) Added a higher level lock to flush_dcache_page as I found in testing
   that the user mappings appeared to change while the code iterated
   over the user mappings.  Updated comment to better reflect the
   current status WRT inequivalent aliases.  Only updated old_addr
   for shared mappings.  This was simply to suppress the number of
   "INEQUIVALENT" messages.  As noted previously, too many causes the
   console getty process to stop working.  I think it may be possible
   to further optimize this loop.
4) Changed arch_get_unmapped_area to enforce alignment of shared
   MAP_FIXED regions as on arm.

Signed-off-by: John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index dc9286a..d5f1631 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -35,6 +35,13 @@ void flush_cache_all_local(void);
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
@@ -48,6 +55,16 @@ static inline void flush_kernel_vmap_range(void *vaddr, int size)
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
@@ -57,9 +74,9 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 extern void flush_dcache_page(struct page *page);
 
 #define flush_dcache_mmap_lock(mapping) \
-	spin_lock_irq(&(mapping)->tree_lock)
+	spin_lock(&(mapping)->tree_lock)
 #define flush_dcache_mmap_unlock(mapping) \
-	spin_unlock_irq(&(mapping)->tree_lock)
+	spin_unlock(&(mapping)->tree_lock)
 
 #define flush_icache_page(vma,page)	do { 		\
 	flush_kernel_dcache_page(page);			\
@@ -99,13 +116,6 @@ flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vma
 		flush_dcache_page_asm(page_to_phys(page), vmaddr);
 }
 
-#define ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
-void flush_kernel_dcache_page_addr(void *addr);
-static inline void flush_kernel_dcache_page(struct page *page)
-{
-	flush_kernel_dcache_page_addr(page_address(page));
-}
-
 #ifdef CONFIG_DEBUG_RODATA
 void mark_rodata_ro(void);
 #endif
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 3f11331..fa92dcb 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -75,14 +75,16 @@ EXPORT_SYMBOL(flush_cache_all_local);
 void
 update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
 {
-	struct page *page = pte_page(*ptep);
+        unsigned long pfn = pte_pfn(*ptep);
+        struct page *page;
 
-	if (pfn_valid(page_to_pfn(page)) && page_mapping(page) &&
-	    test_bit(PG_dcache_dirty, &page->flags)) {
+        if (!pfn_valid(pfn))
+                return;
 
-		flush_kernel_dcache_page(page);
-		clear_bit(PG_dcache_dirty, &page->flags);
-	} else if (parisc_requires_coherency())
+        page = pfn_to_page(pfn);
+
+        if (test_and_clear_bit(PG_dcache_dirty, &page->flags)
+	    || parisc_requires_coherency())
 		flush_kernel_dcache_page(page);
 }
 
@@ -295,10 +297,17 @@ void flush_dcache_page(struct page *page)
 	pgoff = page->index << (PAGE_CACHE_SHIFT - PAGE_SHIFT);
 
 	/* We have carefully arranged in arch_get_unmapped_area() that
-	 * *any* mappings of a file are always congruently mapped (whether
-	 * declared as MAP_PRIVATE or MAP_SHARED), so we only need
-	 * to flush one address here for them all to become coherent */
-
+	 * all shared mappings of a file are congruently mapped, so we
+	 * only need to flush one address here for them all to become
+	 * coherent.  However, non shared fixed mappings of executables
+	 * are not congruently mapped on the boundary page between text
+	 * and data.  Further, the data segment sometimes occurs before
+	 * the text segment.  While it is unlikely that a dirty cache
+	 * line would result from accesses through the text mapping,
+	 * it is possible that this could occur since binutils doesn't
+	 * ensure that the data segment starts on a page boundary.  */
+
+	spin_lock(&mapping->i_mmap_lock);
 	flush_dcache_mmap_lock(mapping);
 	vma_prio_tree_foreach(mpnt, &iter, &mapping->i_mmap, pgoff, pgoff) {
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
@@ -307,11 +316,13 @@ void flush_dcache_page(struct page *page)
 		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
 			if (old_addr)
-				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
-			old_addr = addr;
+				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *) mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
+			if (mpnt->vm_flags & VM_SHARED)
+				old_addr = addr;
 		}
 	}
 	flush_dcache_mmap_unlock(mapping);
+	spin_unlock(&mapping->i_mmap_lock);
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
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
 
