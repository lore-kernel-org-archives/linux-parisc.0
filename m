From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: QEMU host idle sleep support
Date: Fri, 5 Jan 2018 21:55:38 +0100
Message-ID: <20180105205538.GA25474@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Henderson <rth@twiddle.net>
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add QEMU host idle sleep support when running under QEMU with SeaBIOS
PDC Firmware.

Like ppc64 we use "or" assembler instructions (which translate to nops
on real hardware) to indicate that qemu shall idle sleep.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <rth@twiddle.net>
CC: stable@vger.kernel.org # v4.9+

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 30f92391a93e..cad3e8661cd6 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -39,6 +39,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/fs.h>
+#include <linux/cpu.h>
 #include <linux/module.h>
 #include <linux/personality.h>
 #include <linux/ptrace.h>
@@ -184,6 +185,44 @@ int dump_task_fpu (struct task_struct *tsk, elf_fpregset_t *r)
 }
 
 /*
+ * Idle thread support
+ *
+ * Detect when running on QEMU with SeaBIOS PDC Firmware and let
+ * QEMU idle the host too.
+ */
+
+int running_on_qemu __read_mostly;
+
+void __cpuidle arch_cpu_idle_dead(void)
+{
+	/* nop on real hardware, qemu will offline CPU. */
+	asm volatile("or %%r31,%%r31,%%r31\n":::);
+}
+
+void __cpuidle arch_cpu_idle(void)
+{
+	local_irq_enable();
+
+	/* nop on real hardware, qemu will idle sleep. */
+	asm volatile("or %%r10,%%r10,%%r10\n":::);
+}
+
+static int __init parisc_idle_init(void)
+{
+	const char *marker;
+
+	/* check QEMU/SeaBIOS marker in PAGE0 */
+	marker = (char *) &PAGE0->pad0;
+	running_on_qemu = (memcmp(marker, "SeaBIOS", 8) == 0);
+
+	if (!running_on_qemu)
+		cpu_idle_poll_ctrl(1);
+
+	return 0;
+}
+arch_initcall(parisc_idle_init);
+
+/*
  * Copy architecture-specific thread state
  */
 int
