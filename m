From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: disable preemption while flushing D- or I-caches
 through TMPALIAS region
Date: Sun, 3 Feb 2013 00:41:24 +0100
Message-ID: <20130202234124.GA1188@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

It is necessary to disable preemption during cache flushes done through the
TMPALIAS region to ensure that the TLB setup is not clobbered by another flush.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 9f21ab0..79f694f 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -115,7 +115,9 @@ flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vma
 {
 	if (PageAnon(page)) {
 		flush_tlb_page(vma, vmaddr);
+		preempt_disable();
 		flush_dcache_page_asm(page_to_phys(page), vmaddr);
+		preempt_enable();
 	}
 }
 
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index b89a85a..703ed48 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -267,9 +267,11 @@ static inline void
 __flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr,
 		   unsigned long physaddr)
 {
+	preempt_disable();
 	flush_dcache_page_asm(physaddr, vmaddr);
 	if (vma->vm_flags & VM_EXEC)
 		flush_icache_page_asm(physaddr, vmaddr);
+	preempt_enable();
 }
 
 void flush_dcache_page(struct page *page)
