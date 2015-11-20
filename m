From: Helge Deller <deller@gmx.de>
Subject: [PATCH 6/9] parisc: Increase initial kernel mapping to 32MB on 64bit kernel
Date: Fri, 20 Nov 2015 22:38:39 +0100
Message-ID: <1448055522-11594-7-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

For the 64bit kernel the initially 16 MB kernel memory might become too
small if you build a kernel with many modules built-in and with kernel
text and data areas mapped on huge pages.

This patch increases the initial mapping to 32MB for 64bit kernels and
keeps 16MB for 32bit kernels.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/pgtable.h | 6 +++++-
 arch/parisc/kernel/head.S         | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 638317a..d8534f9 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -83,7 +83,11 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, (unsigned long)pgd_val(e))
 
 /* This is the size of the initially mapped kernel memory */
-#define KERNEL_INITIAL_ORDER	24	/* 0 to 1<<24 = 16MB */
+#ifdef CONFIG_64BIT
+#define KERNEL_INITIAL_ORDER	25	/* 1<<25 = 32MB */
+#else
+#define KERNEL_INITIAL_ORDER	24	/* 1<<24 = 16MB */
+#endif
 #define KERNEL_INITIAL_SIZE	(1 << KERNEL_INITIAL_ORDER)
 
 #if CONFIG_PGTABLE_LEVELS == 3
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index e7d6452..75aa0db 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -69,7 +69,7 @@ $bss_loop:
 	stw,ma          %arg2,4(%r1)
 	stw,ma          %arg3,4(%r1)
 
-	/* Initialize startup VM. Just map first 8/16 MB of memory */
+	/* Initialize startup VM. Just map first 16/32 MB of memory */
 	load32		PA(swapper_pg_dir),%r4
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
@@ -107,7 +107,7 @@ $bss_loop:
 	/* Now initialize the PTEs themselves.  We use RWX for
 	 * everything ... it will get remapped correctly later */
 	ldo		0+_PAGE_KERNEL_RWX(%r0),%r3 /* Hardwired 0 phys addr start */
-	ldi		(1<<(KERNEL_INITIAL_ORDER-PAGE_SHIFT)),%r11 /* PFN count */
+	load32		(1<<(KERNEL_INITIAL_ORDER-PAGE_SHIFT)),%r11 /* PFN count */
 	load32		PA(pg0),%r1
 
 $pgt_fill_loop:
-- 
2.1.0

