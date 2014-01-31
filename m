From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix cache-flushing
Date: Fri, 31 Jan 2014 21:33:17 +0100
Message-ID: <20140131203317.GA1222@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This commit:
f8dae00684d678afa13041ef170cecfd1297ed40: parisc: Ensure full cache coherency for kmap/kunmap 
caused negative caching side-effects, e.g. hanging processes with expect and
too many inequivalent alias messages from flush_dcache_page() on Debian 5 systems. 

This patch now partly reverts it and has been in production use on our debian buildd
makeservers since a week without any major problems.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: John David Anglin <dave.anglin@bell.net>
Cc: stable@vger.kernel.org # v3.9+

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 2f9b751..de65f66 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -132,7 +132,6 @@ void mark_rodata_ro(void);
 static inline void *kmap(struct page *page)
 {
 	might_sleep();
-	flush_dcache_page(page);
 	return page_address(page);
 }
 
@@ -144,7 +143,6 @@ static inline void kunmap(struct page *page)
 static inline void *kmap_atomic(struct page *page)
 {
 	pagefault_disable();
-	flush_dcache_page(page);
 	return page_address(page);
 }
 
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index c53fc63..637fe03 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -29,7 +29,8 @@ struct page;
 void clear_page_asm(void *page);
 void copy_page_asm(void *to, void *from);
 #define clear_user_page(vto, vaddr, page) clear_page_asm(vto)
-#define copy_user_page(vto, vfrom, vaddr, page) copy_page_asm(vto, vfrom)
+void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
+			struct page *pg);
 
 /* #define CONFIG_PARISC_TMPALIAS */
 
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index a725455..ac87a40 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -388,6 +388,20 @@ void flush_kernel_dcache_page_addr(void *addr)
 }
 EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 
+void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
+	struct page *pg)
+{
+       /* Copy using kernel mapping.  No coherency is needed (all in
+	  kunmap) for the `to' page.  However, the `from' page needs to
+	  be flushed through a mapping equivalent to the user mapping
+	  before it can be accessed through the kernel mapping. */
+	preempt_disable();
+	flush_dcache_page_asm(__pa(vfrom), vaddr);
+	preempt_enable();
+	copy_page_asm(vto, vfrom);
+}
+EXPORT_SYMBOL(copy_user_page);
+
 void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 {
 	unsigned long flags;
