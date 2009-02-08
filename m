From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add ftrace (function and graph tracer) functionality
Date: Mon, 09 Feb 2009 00:43:36 +0100
Message-ID: <498F6E28.7060209@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch adds the ftrace debugging functionality to the parisc kernel.
It will currently only work with 64bit kernels, because the gcc options -pg
and -ffunction-sections can't be enabled at the same time and -ffunction-sections
is still needed to be able to link 32bit kernels.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index aacf11d..7fbe029 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -9,6 +9,9 @@ config PARISC
 	def_bool y
 	select HAVE_IDE
 	select HAVE_OPROFILE
+	select HAVE_FUNCTION_TRACER if 64BIT
+	select HAVE_FUNCTION_GRAPH_TRACER if 64BIT
+	select HAVE_FUNCTION_TRACE_MCOUNT_TEST if 64BIT
 	select RTC_CLASS
 	select RTC_DRV_PARISC
 	select INIT_ALL_POSSIBLE
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 0d42827..da6f669 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -56,7 +56,9 @@ cflags-y	+= -mdisable-fpregs
 
 # Without this, "ld -r" results in .text sections that are too big
 # (> 0x40000) for branches to reach stubs.
-cflags-y	+= -ffunction-sections
+ifndef CONFIG_FUNCTION_TRACER
+  cflags-y	+= -ffunction-sections
+endif
 
 # select which processor to optimise for
 cflags-$(CONFIG_PA7100)		+= -march=1.1 -mschedule=7100
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 016d3fc..8be0267 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -11,6 +11,18 @@ obj-y	     	:= cache.o pacache.o setup.o traps.o time.o irq.o \
 		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
 		   topology.o
 
+ifdef CONFIG_FUNCTION_TRACER
+# Do not profile debug and lowlevel utilities
+CFLAGS_REMOVE_ftrace.o = -pg
+CFLAGS_REMOVE_cache.o = -pg
+CFLAGS_REMOVE_irq.o = -pg
+CFLAGS_REMOVE_pacache.o = -pg
+CFLAGS_REMOVE_perf.o = -pg
+CFLAGS_REMOVE_traps.o = -pg
+CFLAGS_REMOVE_unaligned.o = -pg
+CFLAGS_REMOVE_unwind.o = -pg
+endif
+
 obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_PA11)	+= pci-dma.o
 obj-$(CONFIG_PCI)	+= pci.o
@@ -18,3 +30,5 @@ obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_64BIT)	+= binfmt_elf32.o sys_parisc32.o signal32.o
 # only supported for PCX-W/U in 64-bit mode at the moment
 obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o
+obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
+obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 0f7ff93..b2e163c 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -2176,6 +2176,33 @@ syscall_do_resched:
 ENDPROC(syscall_exit)
 
 
+#ifdef CONFIG_FUNCTION_TRACER
+	.import ftrace_function_trampoline,code
+ENTRY(_mcount)
+	copy	%r3, %arg2
+	b	ftrace_function_trampoline
+	nop
+ENDPROC(_mcount)
+
+ENTRY(return_to_handler)
+	load32	return_trampoline, %rp
+	copy	%ret0, %arg0
+	copy	%ret1, %arg1
+	b	ftrace_return_to_handler
+	nop
+return_trampoline:
+	copy	%ret0, %rp
+	copy	%r23, %ret0
+	copy	%r24, %ret1
+
+.globl ftrace_stub
+ftrace_stub:
+	bv	%r0(%rp)
+	nop
+ENDPROC(return_to_handler)
+#endif	/* CONFIG_FUNCTION_TRACER */
+
+
 get_register:
 	/*
 	 * get_register is used by the non access tlb miss handlers to
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index 0eecfbb..df65366 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -153,5 +153,10 @@ EXPORT_SYMBOL(node_data);
 EXPORT_SYMBOL(pfnnid_map);
 #endif
 
+#ifdef CONFIG_FUNCTION_TRACER
+extern void _mcount(void);
+EXPORT_SYMBOL(_mcount);
+#endif
+
 /* from pacache.S -- needed for copy_page */
 EXPORT_SYMBOL(copy_user_page_asm);
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 9995d7e..8545f2e 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -31,6 +31,7 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/bitops.h>
+#include <linux/ftrace.h>
 
 #include <asm/system.h>
 #include <asm/atomic.h>
@@ -120,7 +121,7 @@ halt_processor(void)
 }
 
 
-irqreturn_t
+irqreturn_t __irq_entry
 ipi_interrupt(int irq, void *dev_id) 
 {
 	int this_cpu = smp_processor_id();
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 9d46c43..badaad9 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -24,6 +24,7 @@
 #include <linux/profile.h>
 #include <linux/clocksource.h>
 #include <linux/platform_device.h>
+#include <linux/ftrace.h>
 
 #include <asm/uaccess.h>
 #include <asm/io.h>
@@ -53,7 +54,7 @@ static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
  * held off for an arbitrarily long period of time by interrupts being
  * disabled, so we may miss one or more ticks.
  */
-irqreturn_t timer_interrupt(int irq, void *dev_id)
+irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 {
 	unsigned long now;
 	unsigned long next_tick;
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index ba658d2..7bf122a 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -494,7 +494,7 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 	panic(msg);
 }
 
-void handle_interruption(int code, struct pt_regs *regs)
+void notrace handle_interruption(int code, struct pt_regs *regs)
 {
 	unsigned long fault_address = 0;
 	unsigned long fault_space = 0;
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 1a3b6cc..fd2cc4f 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -54,6 +54,8 @@ SECTIONS
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
+		KPROBES_TEXT
+		IRQENTRY_TEXT
 		*(.text.do_softirq)
 		*(.text.sys_exit)
 		*(.text.do_sigaltstack)
diff -up ./arch/parisc/include/asm/ftrace.h.org ./arch/parisc/include/asm/ftrace.h
--- a/arch/parisc/include/asm/ftrace.h.org	2009-02-08 23:57:16.000000000 +0100
+++ b/arch/parisc/include/asm/ftrace.h	2009-02-08 23:45:39.000000000 +0100
@@ -0,0 +1,25 @@
+#ifndef _ASM_PARISC_FTRACE_H
+#define _ASM_PARISC_FTRACE_H
+
+#ifndef __ASSEMBLY__
+extern void mcount(void);
+
+/*
+ * Stack of return addresses for functions of a thread.
+ * Used in struct thread_info
+ */
+struct ftrace_ret_stack {
+	unsigned long ret;
+	unsigned long func;
+	unsigned long long calltime;
+};
+
+/*
+ * Primary handler of a function return.
+ * It relays on ftrace_return_to_handler.
+ * Defined in entry.S
+ */
+extern void return_to_handler(void);
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_PARISC_FTRACE_H */
diff -up ./arch/parisc/kernel/ftrace.c.org ./arch/parisc/kernel/ftrace.c
--- a/arch/parisc/kernel/ftrace.c.org	2009-02-08 23:57:10.000000000 +0100
+++ b/arch/parisc/kernel/ftrace.c	2009-02-09 00:10:24.000000000 +0100
@@ -0,0 +1,185 @@
+/*
+ * Code for tracing calls in Linux kernel.
+ * Copyright (C) 2009 Helge Deller <deller@gmx.de>
+ *
+ * based on code for x86 which is:
+ * Copyright (C) 2007-2008 Steven Rostedt <srostedt@redhat.com>
+ *
+ * future possible enhancements:
+ * 	- add CONFIG_DYNAMIC_FTRACE
+ *	- add CONFIG_STACK_TRACER
+ */
+
+#include <linux/init.h>
+#include <linux/ftrace.h>
+
+#include <asm/sections.h>
+#include <asm/ftrace.h>
+
+
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+
+/* Add a function return address to the trace stack on thread info.*/
+static int push_return_trace(unsigned long ret, unsigned long long time,
+				unsigned long func, int *depth)
+{
+	int index;
+
+	if (!current->ret_stack)
+		return -EBUSY;
+
+	/* The return trace stack is full */
+	if (current->curr_ret_stack == FTRACE_RETFUNC_DEPTH - 1) {
+		atomic_inc(&current->trace_overrun);
+		return -EBUSY;
+	}
+
+	index = ++current->curr_ret_stack;
+	barrier();
+	current->ret_stack[index].ret = ret;
+	current->ret_stack[index].func = func;
+	current->ret_stack[index].calltime = time;
+	*depth = index;
+
+	return 0;
+}
+
+/* Retrieve a function return address to the trace stack on thread info.*/
+static void pop_return_trace(struct ftrace_graph_ret *trace, unsigned long *ret)
+{
+	int index;
+
+	index = current->curr_ret_stack;
+
+	if (unlikely(index < 0)) {
+		ftrace_graph_stop();
+		WARN_ON(1);
+		/* Might as well panic, otherwise we have no where to go */
+		*ret = (unsigned long)
+			dereference_function_descriptor(&panic);
+		return;
+	}
+
+	*ret = current->ret_stack[index].ret;
+	trace->func = current->ret_stack[index].func;
+	trace->calltime = current->ret_stack[index].calltime;
+	trace->overrun = atomic_read(&current->trace_overrun);
+	trace->depth = index;
+	barrier();
+	current->curr_ret_stack--;
+
+}
+
+/*
+ * Send the trace to the ring-buffer.
+ * @return the original return address.
+ */
+unsigned long ftrace_return_to_handler(unsigned long retval0,
+				       unsigned long retval1)
+{
+	struct ftrace_graph_ret trace;
+	unsigned long ret;
+
+	pop_return_trace(&trace, &ret);
+	trace.rettime = cpu_clock(raw_smp_processor_id());
+	ftrace_graph_return(&trace);
+
+	if (unlikely(!ret)) {
+		ftrace_graph_stop();
+		WARN_ON(1);
+		/* Might as well panic. What else to do? */
+		ret = (unsigned long)
+			dereference_function_descriptor(&panic);
+	}
+
+	/* HACK: we hand over the old functions' return values
+	   in %r23 and %r24. Assembly in entry.S will take care
+	   and move those to their final registers %ret0 and %ret1 */
+	asm( "copy %0, %%r23 \n\t"
+	     "copy %1, %%r24 \n" : : "r" (retval0), "r" (retval1) );
+
+	return ret;
+}
+
+/*
+ * Hook the return address and push it in the stack of return addrs
+ * in current thread info.
+ */
+void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
+{
+	unsigned long old;
+	unsigned long long calltime;
+	struct ftrace_graph_ent trace;
+
+	if (unlikely(atomic_read(&current->tracing_graph_pause)))
+		return;
+
+	old = *parent;
+	*parent = (unsigned long)
+		  dereference_function_descriptor(&return_to_handler);
+
+	if (unlikely(!__kernel_text_address(old))) {
+		ftrace_graph_stop();
+		*parent = old;
+		WARN_ON(1);
+		return;
+	}
+
+	calltime = cpu_clock(raw_smp_processor_id());
+
+	if (push_return_trace(old, calltime,
+				self_addr, &trace.depth) == -EBUSY) {
+		*parent = old;
+		return;
+	}
+
+	trace.func = self_addr;
+
+	/* Only trace if the calling function expects to */
+	if (!ftrace_graph_entry(&trace)) {
+		current->curr_ret_stack--;
+		*parent = old;
+	}
+}
+
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
+
+
+void ftrace_function_trampoline(unsigned long parent,
+				unsigned long self_addr,
+				unsigned long org_sp_gr3)
+{
+	extern ftrace_func_t ftrace_trace_function;
+
+	if (function_trace_stop)
+		return;
+
+	if (ftrace_trace_function != ftrace_stub) {
+		ftrace_trace_function(parent, self_addr);
+		return;
+	}
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+	if (ftrace_graph_entry && ftrace_graph_return) {
+		unsigned long sp;
+		unsigned long *parent_rp;
+
+                asm volatile ("copy %%r30, %0" : "=r"(sp));
+		/* sanity check: is stack pointer which we got from
+		   assembler function in entry.S in a reasonable
+		   range compared to current stack pointer? */
+		if ((sp - org_sp_gr3) > 0x400)
+			return;
+
+		/* calculate pointer to %rp in stack */
+		parent_rp = (unsigned long *) org_sp_gr3 - 0x10;
+		/* sanity check: parent_rp should hold parent */
+		if (*parent_rp != parent)
+			return;
+		
+		prepare_ftrace_return(parent_rp, self_addr);
+		return;
+	}
+#endif
+}
+

