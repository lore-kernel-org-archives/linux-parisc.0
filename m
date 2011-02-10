From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Thu, 10 Feb 2011 15:00:43 -0500 (EST)
Message-ID: <20110210200044.203164E01@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> from "John David Anglin" at Feb 10, 2011 12:00:32 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The usual case would be just one address to flush.  Would it be too
> much overhead to do a prescan to determine if there are inequivalent
> aliases before doing any flushes?  I think I'll try this.

Testing the following.  Dropped debug message.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 3f11331..e57c3e8 100644
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
 
@@ -276,10 +278,10 @@ __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
 void flush_dcache_page(struct page *page)
 {
 	struct address_space *mapping = page_mapping(page);
-	struct vm_area_struct *mpnt;
+	struct vm_area_struct *mpnt, *old_mpnt;
 	struct prio_tree_iter iter;
 	unsigned long offset;
-	unsigned long addr, old_addr = 0;
+	unsigned long addr, old_addr;
 	pgoff_t pgoff;
 
 	if (mapping && !mapping_mapped(mapping)) {
@@ -292,26 +294,51 @@ void flush_dcache_page(struct page *page)
 	if (!mapping)
 		return;
 
+	old_addr = 0;
+	old_mpnt = NULL;
 	pgoff = page->index << (PAGE_CACHE_SHIFT - PAGE_SHIFT);
 
 	/* We have carefully arranged in arch_get_unmapped_area() that
-	 * *any* mappings of a file are always congruently mapped (whether
-	 * declared as MAP_PRIVATE or MAP_SHARED), so we only need
-	 * to flush one address here for them all to become coherent */
+	 * all shared mappings of a file are congruently mapped, so we
+	 * only need to flush one address here for them all to become
+	 * coherent.  However, non-shared fixed mappings of executables
+	 * are not congruently mapped on the boundary page between text
+	 * and data.  Further, the data segment sometimes occurs before
+	 * the text segment.  While it is unlikely that a dirty cache
+	 * line would result from accesses through the text mapping,
+	 * it is possible that this could occur since binutils doesn't
+	 * ensure that the data segment starts on a page boundary.  */
 
 	flush_dcache_mmap_lock(mapping);
+
+	/* Scan for inequivalent aliases.  */
 	vma_prio_tree_foreach(mpnt, &iter, &mapping->i_mmap, pgoff, pgoff) {
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 
-		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
-			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
-				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
+		if (old_addr == 0) {
 			old_addr = addr;
+			old_mpnt = mpnt;
 		}
+		else if ((old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1)))
+			goto flush_inequivalent;
+	}
+	flush_dcache_mmap_unlock(mapping);
+
+	/* Handle common case where all aliases are equivalent.  */
+	if (old_addr)
+		__flush_cache_page(old_mpnt, old_addr, page_to_phys(page));
+	return;
+
+flush_inequivalent:
+	vma_prio_tree_foreach(mpnt, &iter, &mapping->i_mmap, pgoff, pgoff) {
+		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
+		addr = mpnt->vm_start + offset;
+
+		__flush_cache_page(mpnt, addr, page_to_phys(page));
 	}
 	flush_dcache_mmap_unlock(mapping);
+	return;
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
 
