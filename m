From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Increase initial kernel mapping size
Date: Sun, 9 Oct 2016 11:20:08 +0200
Message-ID: <20161009092008.GA4478@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Increase the initial kernel default page mapping size for 64-bit kernels to
64 MB and for 32-bit kernels to 32 MB.

Due to the additional support of ftrace, tracepoint and huge pages the kernel
size can exceed the sizes we used up to now.

Cc: stable@vger.kernel.org # 4.4+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index e44bdb9..c2c43f7 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -83,10 +83,10 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, (unsigned long)pgd_val(e))
 
 /* This is the size of the initially mapped kernel memory */
-#if defined(CONFIG_64BIT) || defined(CONFIG_SMP)
-#define KERNEL_INITIAL_ORDER	25	/* 1<<25 = 32MB */
+#if defined(CONFIG_64BIT)
+#define KERNEL_INITIAL_ORDER	26	/* 1<<26 = 64MB */
 #else
-#define KERNEL_INITIAL_ORDER	24	/* 1<<24 = 16MB */
+#define KERNEL_INITIAL_ORDER	25	/* 1<<25 = 32MB */
 #endif
 #define KERNEL_INITIAL_SIZE	(1 << KERNEL_INITIAL_ORDER)
 
