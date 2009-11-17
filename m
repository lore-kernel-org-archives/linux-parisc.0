From: James Bottomley <James.Bottomley@suse.de>
Subject: [PATCH 2/6] parisc: add mm API for DMA to vmalloc/vmap areas
Date: Tue, 17 Nov 2009 11:03:48 -0600
Message-ID: <1258477432-2513-3-git-send-email-James.Bottomley@suse.de>
References: <1258477432-2513-1-git-send-email-James.Bottomley@suse.de>
 <1258477432-2513-2-git-send-email-James.Bottomley@suse.de>
Cc: James Bottomley <James.Bottomley@suse.de>
To: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1258477432-2513-2-git-send-email-James.Bottomley@suse.de>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We already have an API to flush a kernel page along an alias
address, so use it.  The TLB purge prevents the CPU from doing
speculative moveins on the flushed address, so we don't need to
implement and invalidate.

Signed-off-by: James Bottomley <James.Bottomley@suse.de>
---
 arch/parisc/include/asm/cacheflush.h |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 7243951..2536a00 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -90,6 +90,14 @@ static inline void flush_kernel_dcache_page(struct page *page)
 {
 	flush_kernel_dcache_page_addr(page_address(page));
 }
+static inline void flush_kernel_dcache_addr(void *addr)
+{
+	flush_kernel_dcache_page_addr(addr);
+}
+static inline void invalidate_kernel_dcache_addr(void *addr)
+{
+	/* nop .. the flush prevents move in until the page is touched */
+}
 
 #ifdef CONFIG_DEBUG_RODATA
 void mark_rodata_ro(void);
-- 
1.6.3.3
