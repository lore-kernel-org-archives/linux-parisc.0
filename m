From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] initialise the unwinder really early
Date: Thu, 04 Sep 2008 11:34:41 -0500
Message-ID: <1220546081.3276.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The stack traces from the recent boot panic showed that the unwinder
wasn't working correctly.  Debugging by tausq revealed that it wasn't
set up yet, so fix this by calling it first from setup_arch().

James

---

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 39e7c5a..0391631 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -44,6 +44,7 @@
 #include <asm/pdc_chassis.h>
 #include <asm/io.h>
 #include <asm/setup.h>
+#include <asm/unwind.h>
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
 
@@ -123,6 +124,7 @@ void __init setup_arch(char **cmdline_p)
 #ifdef CONFIG_64BIT
 	extern int parisc_narrow_firmware;
 #endif
+	unwind_init();
 
 	init_per_cpu(smp_processor_id());	/* Set Modes & Enable FP */
 
diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 701b2d2..6773c58 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -170,7 +170,7 @@ void unwind_table_remove(struct unwind_table *table)
 }
 
 /* Called from setup_arch to import the kernel unwind info */
-static int unwind_init(void)
+int unwind_init(void)
 {
 	long start, stop;
 	register unsigned long gp __asm__ ("r27");
@@ -417,5 +417,3 @@ int unwind_to_user(struct unwind_frame_info *info)
 
 	return ret;
 }
