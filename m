From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Increase default initial kernel mapping to 32 MB
Date: Sat, 8 Oct 2016 16:16:49 +0200
Message-ID: <20161008141649.GA31592@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

For 32-bit kernels which include multiple modules built-in 16 MB initial kernel
mapping may get too small. To avoid boot problems increase the kernel mapping
to 32 MB for all 32- and 64-bit kernel configs.

Cc: stable@vger.kernel.org # 4.4+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index e44bdb9..ef32e28 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -83,11 +83,7 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, (unsigned long)pgd_val(e))
 
 /* This is the size of the initially mapped kernel memory */
-#if defined(CONFIG_64BIT) || defined(CONFIG_SMP)
 #define KERNEL_INITIAL_ORDER	25	/* 1<<25 = 32MB */
-#else
-#define KERNEL_INITIAL_ORDER	24	/* 1<<24 = 16MB */
-#endif
 #define KERNEL_INITIAL_SIZE	(1 << KERNEL_INITIAL_ORDER)
 
 #if CONFIG_PGTABLE_LEVELS == 3
