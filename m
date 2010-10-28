From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] parisc: fix compile failure with kmap_atomic changes
Date: Thu, 28 Oct 2010 10:14:41 -0500
Message-ID: <1288278881.3043.31.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Peter Zijlstra <peterz@infradead.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This commit:

commit 3e4d3af501cccdc8a8cca41bdbe57d54ad7e7e73
Author: Peter Zijlstra <a.p.zijlstra@chello.nl>
Date:   Tue Oct 26 14:21:51 2010 -0700

    mm: stack based kmap_atomic()

overlooked the fact that parisc uses kmap as a coherence mechanism, so
even though we have no highmem, we do need to supply our own versions of
kmap (and atomic).  This patch converts the parisc kmap to the form
which is needed to keep it compiling (it's a simple prototype and name
change).

Signed-off-by: James Bottomley <James.Bottomley@suse.de>
Acked-by: Kyle McMartin <kyle@redhat.com>

---

Linus, could you apply this directly?  Kyle already has the parisc tree
in progress and peterz (whom I thought would push this) is currently
over the Atlantic.

Thanks,

James



diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index dba11ae..f388a85 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -126,20 +126,20 @@ static inline void *kmap(struct page *page)
 
 #define kunmap(page)			kunmap_parisc(page_address(page))
 
-static inline void *kmap_atomic(struct page *page, enum km_type idx)
+static inline void *__kmap_atomic(struct page *page)
 {
 	pagefault_disable();
 	return page_address(page);
 }
 
-static inline void kunmap_atomic_notypecheck(void *addr, enum km_type idx)
+static inline void __kunmap_atomic(void *addr)
 {
 	kunmap_parisc(addr);
 	pagefault_enable();
 }
 
-#define kmap_atomic_prot(page, idx, prot)	kmap_atomic(page, idx)
-#define kmap_atomic_pfn(pfn, idx)	kmap_atomic(pfn_to_page(pfn), (idx))
+#define kmap_atomic_prot(page, prot)	kmap_atomic(page)
+#define kmap_atomic_pfn(pfn)	kmap_atomic(pfn_to_page(pfn))
 #define kmap_atomic_to_page(ptr)	virt_to_page(ptr)
 #endif
 


--
To unsubscribe from this list: send the line "unsubscribe linux-arch" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


