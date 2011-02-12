From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Sat, 12 Feb 2011 11:18:46 -0500
Message-ID: <20110212161846.GA24076@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: James.Bottomley@HansenPartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110210200044.203164E01@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 10 Feb 2011, John David Anglin wrote:

> > The usual case would be just one address to flush.  Would it be too
> > much overhead to do a prescan to determine if there are inequivalent
> > aliases before doing any flushes?  I think I'll try this.
> 
> Testing the following.  Dropped debug message.

Although I didn't see any slow timer messages, I still had a number of
GCC testsuite timeouts.  I didn't see these timeouts with interrupts
disabled.  So, I plan to see if read write locks can be used without
disabling interrupts.

In any case, I believe it is useful to proceed with the parts of the
change where there is agreement.  Note that the change to update_mmu_cache
is more than a optimization when parisc_requires_coherency is true as
the code no longer flushes when the pfn is not valid.

As noted, I'm seeing much improved stability on my rp3440 with this change.

Signed-off-by: John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

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
 
