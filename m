From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix cache coherency for copy/clear_user_page operations
Date: Sun, 2 Jun 2013 12:09:35 -0400
Message-ID: <BLU0-SMTP5D57135C2483B5BA307F2979C0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-23-1040151322"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-23-1040151322
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

As noted by James E.J. Bottomley, we need to purge the kernel TLB  
entries used when copying/clearing
to user pages on PA 2.0 systems that require cache coherency.   
Otherwise, we generate inequivalent
aliases and incorrect cache operation.

The patch also disables preemption around both the TLB and cache  
flushes as it seemed the effect of the
purge might be lost.

So far with approximately two days testing, I have seen no random  
segmentation faults on 4-way rp3440.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---



--Apple-Mail-23-1040151322
Content-Disposition: attachment; filename="cache-alias.d"
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="cache-alias.d"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index f0e2784..772dc27 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -114,8 +114,8 @@ static inline void
 flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
 {
 	if (PageAnon(page)) {
-		flush_tlb_page(vma, vmaddr);
 		preempt_disable();
+		flush_tlb_page(vma, vmaddr);
 		flush_dcache_page_asm(page_to_phys(page), vmaddr);
 		preempt_enable();
 	}
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 65fb4cb..a16ede352 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -383,7 +383,7 @@ void clear_user_page(void *vto, unsigned long vaddr, struct page *page)
 {
 	clear_page_asm(vto);
 	if (!parisc_requires_coherency())
-		flush_kernel_dcache_page_asm(vto);
+		flush_kernel_dcache_page_addr(vto);
 }
 EXPORT_SYMBOL(clear_user_page);
 
@@ -397,10 +397,10 @@ void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 	   the kernel mapping. */
 	preempt_disable();
 	flush_dcache_page_asm(__pa(vfrom), vaddr);
-	preempt_enable();
 	copy_page_asm(vto, vfrom);
 	if (!parisc_requires_coherency())
-		flush_kernel_dcache_page_asm(vto);
+		flush_kernel_dcache_page_addr(vto);
+	preempt_enable();
 }
 EXPORT_SYMBOL(copy_user_page);
 
@@ -619,11 +619,11 @@ void clear_user_highpage(struct page *page, unsigned long vaddr)
 	   and the write-capable translation removed from the page
 	   table and purged from the TLB."  */
 
+	preempt_disable();
 	purge_kernel_dcache_page_asm((unsigned long)vto);
 	purge_tlb_start(flags);
 	pdtlb_kernel(vto);
 	purge_tlb_end(flags);
-	preempt_disable();
 	clear_user_page_asm(vto, vaddr);
 	preempt_enable();
 
@@ -644,12 +644,12 @@ void copy_user_highpage(struct page *to, struct page *from,
 	vfrom = kmap_atomic(from);
 	vto = kmap_atomic(to);
 
+	preempt_disable();
 	purge_kernel_dcache_page_asm((unsigned long)vto);
 	purge_tlb_start(flags);
 	pdtlb_kernel(vto);
 	pdtlb_kernel(vfrom);
 	purge_tlb_end(flags);
-	preempt_disable();
 	copy_user_page_asm(vto, vfrom, vaddr);
 	flush_dcache_page_asm(__pa(vto), vaddr);
 	preempt_enable();

--Apple-Mail-23-1040151322
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-23-1040151322--
