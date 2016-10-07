From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Increase KERNEL_INITIAL_SIZE for 32-bit SMP kernels
Date: Fri, 7 Oct 2016 18:19:55 +0200
Message-ID: <20161007161948.GA9496@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Increase the initial kernel default page mapping size for SMP kernels to 32MB
and add a runtime check which panics early if the kernel is bigger than the
initial mapping size.

This fixes boot crashes of 32bit SMP kernels. Due to the introduction of huge
page support in kernel 4.4 and it's required initial kernel layout in memory, a
32bit SMP kernel usually got bigger (in layout, not size) than 16MB.

Cc: stable@vger.kernel.org #4.4+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 291cee2..e44bdb9 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -83,7 +83,7 @@ static inline void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
 	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, (unsigned long)pgd_val(e))
 
 /* This is the size of the initially mapped kernel memory */
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) || defined(CONFIG_SMP)
 #define KERNEL_INITIAL_ORDER	25	/* 1<<25 = 32MB */
 #else
 #define KERNEL_INITIAL_ORDER	24	/* 1<<24 = 16MB */
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index f7ea626..81d6f63 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -38,6 +38,7 @@
 #include <linux/export.h>
 
 #include <asm/processor.h>
+#include <asm/sections.h>
 #include <asm/pdc.h>
 #include <asm/led.h>
 #include <asm/machdep.h>	/* for pa7300lc_init() proto */
@@ -140,6 +141,13 @@ void __init setup_arch(char **cmdline_p)
 #endif
 	printk(KERN_CONT ".\n");
 
+	/*
+	 * Check if initial kernel page mappings are sufficient.
+	 * panic early if not, else we may access kernel functions
+	 * and variables which can't be reached.
+	 */
+	if (__pa((unsigned long) &_end) >= KERNEL_INITIAL_SIZE)
+		panic("KERNEL_INITIAL_ORDER too small!");
 
 	pdc_console_init();
 
