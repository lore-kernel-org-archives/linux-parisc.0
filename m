From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add LATENCYTOP_SUPPORT and CONFIG_STACKTRACE_SUPPORT
Date: Fri, 06 Feb 2009 21:50:39 +0100
Message-ID: <498CA29F.10907@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index aacf11d..4866e2f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -75,6 +75,9 @@ config GENERIC_HARDIRQS
 config GENERIC_IRQ_PROBE
 	def_bool y
 
+config HAVE_LATENCYTOP_SUPPORT
+        def_bool y
+
 config IRQ_PER_CPU
 	bool
 	default y
@@ -83,6 +86,9 @@ config IRQ_PER_CPU
 config PM
 	bool
 
+config STACKTRACE_SUPPORT
+	def_bool y
+
 config ISA_DMA_API
 	bool
 
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 016d3fc..a7ba8cd 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -16,5 +16,6 @@ obj-$(CONFIG_PA11)	+= pci-dma.o
 obj-$(CONFIG_PCI)	+= pci.o
 obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_64BIT)	+= binfmt_elf32.o sys_parisc32.o signal32.o
+obj-$(CONFIG_STACKTRACE)+= stacktrace.o
 # only supported for PCX-W/U in 64-bit mode at the moment
 obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o
diff -up ./arch/parisc/kernel/stacktrace.c.org ./arch/parisc/kernel/stacktrace.c
--- a/arch/parisc/kernel/stacktrace.c.org	2009-02-06 21:40:33.000000000 +0100
+++ b/arch/parisc/kernel/stacktrace.c	2009-02-06 21:45:16.000000000 +0100
@@ -0,0 +1,63 @@
+/*
+ * Stack trace management functions
+ *
+ *  Copyright (C) 2009 Helge Deller <deller@gmx.de>
+ *  based on arch/x86/kernel/stacktrace.c by Ingo Molnar <mingo@redhat.com>
+ *  and parisc unwind functions by Randolph Chung <tausq@debian.org>
+ *
+ *  TODO: Userspace stacktrace (CONFIG_USER_STACKTRACE_SUPPORT)
+ */
+#include <linux/module.h>
+#include <linux/stacktrace.h>
+
+#include <asm/unwind.h>
+
+static void dump_trace(struct task_struct *task, struct stack_trace *trace)
+{
+	struct unwind_frame_info info;
+
+	/* initialize unwind info */
+	if (task == current) {
+		unsigned long sp;
+		struct pt_regs r;
+HERE:
+		asm volatile ("copy %%r30, %0" : "=r"(sp));
+		memset(&r, 0, sizeof(struct pt_regs));
+		r.iaoq[0] = (unsigned long)&&HERE;
+		r.gr[2] = (unsigned long)__builtin_return_address(0);
+		r.gr[30] = sp;
+		unwind_frame_init(&info, task, &r);
+	} else {
+		unwind_frame_init_from_blocked_task(&info, task);
+	}
+
+	/* unwind stack and save entries in stack_trace struct */
+	trace->nr_entries = 0;
+	while (trace->nr_entries < trace->max_entries) {
+		if (unwind_once(&info) < 0 || info.ip == 0)
+			break;
+
+		if (__kernel_text_address(info.ip))
+			trace->entries[trace->nr_entries++] = info.ip;
+	}
+}
+
+
+/*
+ * Save stack-backtrace addresses into a stack_trace buffer.
+ */
+void save_stack_trace(struct stack_trace *trace)
+{
+	dump_trace(current, trace);
+	if (trace->nr_entries < trace->max_entries)
+		trace->entries[trace->nr_entries++] = ULONG_MAX;
+}
+EXPORT_SYMBOL_GPL(save_stack_trace);
+
+void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *trace)
+{
+	dump_trace(tsk, trace);
+	if (trace->nr_entries < trace->max_entries)
+		trace->entries[trace->nr_entries++] = ULONG_MAX;
+}
+EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
