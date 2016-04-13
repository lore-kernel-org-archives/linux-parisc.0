From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix ftrace function and function_graph tracers
Date: Wed, 13 Apr 2016 22:58:42 +0200
Message-ID: <20160413205842.GA20568@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Guy Martin <gmsoft@tuxicoman.be>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix the FTRACE function tracers for 32- and 64-bit kernel.
Reimplement some coding in assembly and utilize some optimizations, e.g.
put mcount() and ftrace_stub() into one L1 cacheline.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 14f655c..86167bf 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -4,8 +4,8 @@ config PARISC
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select HAVE_IDE
 	select HAVE_OPROFILE
-	select HAVE_FUNCTION_TRACER if 64BIT
-	select HAVE_FUNCTION_GRAPH_TRACER if 64BIT
+	select HAVE_FUNCTION_TRACER
+	select HAVE_FUNCTION_GRAPH_TRACER
 	select ARCH_WANT_FRAME_POINTERS
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index bc989e5..68b7cbd 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -2,9 +2,13 @@ menu "Kernel hacking"
 
 source "lib/Kconfig.debug"
 
+config TRACE_IRQFLAGS_SUPPORT
+	def_bool y
+
 config DEBUG_RODATA
        bool "Write protect kernel read-only data structures"
        depends on DEBUG_KERNEL
+       default y
        help
          Mark the kernel read-only data as write-protected in the pagetables,
          in order to catch accidental (and incorrect) writes to such const
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 965a099..75cb451 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -62,9 +62,7 @@ cflags-y	+= -mdisable-fpregs
 
 # Without this, "ld -r" results in .text sections that are too big
 # (> 0x40000) for branches to reach stubs.
-ifndef CONFIG_FUNCTION_TRACER
-  cflags-y	+= -ffunction-sections
-endif
+cflags-y	+= -ffunction-sections
 
 # Use long jumps instead of long branches (needed if your linker fails to
 # link a too big vmlinux executable). Not enabled for building modules.
diff --git a/arch/parisc/include/asm/ftrace.h b/arch/parisc/include/asm/ftrace.h
index 544ed8e..e635c83 100644
--- a/arch/parisc/include/asm/ftrace.h
+++ b/arch/parisc/include/asm/ftrace.h
@@ -5,16 +5,6 @@
 extern void mcount(void);
 
 /*
- * Stack of return addresses for functions of a thread.
- * Used in struct thread_info
- */
-struct ftrace_ret_stack {
-	unsigned long ret;
-	unsigned long func;
-	unsigned long long calltime;
-};
-
-/*
  * Primary handler of a function return.
  * It relays on ftrace_return_to_handler.
  * Defined in entry.S
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index ff87b46..69a1118 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -15,11 +15,7 @@ ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
 CFLAGS_REMOVE_ftrace.o = -pg
 CFLAGS_REMOVE_cache.o = -pg
-CFLAGS_REMOVE_irq.o = -pg
-CFLAGS_REMOVE_pacache.o = -pg
 CFLAGS_REMOVE_perf.o = -pg
-CFLAGS_REMOVE_traps.o = -pg
-CFLAGS_REMOVE_unaligned.o = -pg
 CFLAGS_REMOVE_unwind.o = -pg
 endif
 
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 623496c..39127d3 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1970,43 +1970,98 @@ pt_regs_ok:
 	b	intr_restore
 	copy	%r25,%r16
 
-	.import schedule,code
 syscall_do_resched:
-	BL	schedule,%r2
+	load32	syscall_check_resched,%r2 /* if resched, we start over again */
+	load32	schedule,%r19
+	bv	%r0(%r19)		/* jumps to schedule() */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #else
 	nop
 #endif
-	b	syscall_check_resched	/* if resched, we start over again */
-	nop
 ENDPROC(syscall_exit)
 
 
 #ifdef CONFIG_FUNCTION_TRACER
+
 	.import ftrace_function_trampoline,code
-ENTRY(_mcount)
-	copy	%r3, %arg2
+	.align L1_CACHE_BYTES
+	.globl mcount
+	.type  mcount, @function
+ENTRY(mcount)
+_mcount:
+	.export _mcount,data
+	.proc
+	.callinfo caller,frame=0
+	.entry
+	/*
+	 * The 64bit mcount() function pointer needs 4 dwords, of which the
+	 * first two are free.  We optimize it here and put 2 instructions for
+	 * calling mcount(), and 2 instructions for ftrace_stub().  That way we
+	 * have all on one L1 cacheline.
+	 */
 	b	ftrace_function_trampoline
+	copy	%r3, %arg2	/* caller original %sp */
+ftrace_stub:
+	.globl ftrace_stub
+        .type  ftrace_stub, @function
+#ifdef CONFIG_64BIT
+	bve	(%rp)
+#else
+	bv	%r0(%rp)
+#endif
 	nop
-ENDPROC(_mcount)
+#ifdef CONFIG_64BIT
+	.dword mcount
+	.dword 0 /* code in head.S puts value of global gp here */
+#endif
+	.exit
+	.procend
+ENDPROC(mcount)
 
+	.align 8
+	.globl return_to_handler
+	.type  return_to_handler, @function
 ENTRY(return_to_handler)
-	load32	return_trampoline, %rp
-	copy	%ret0, %arg0
-	copy	%ret1, %arg1
-	b	ftrace_return_to_handler
-	nop
-return_trampoline:
-	copy	%ret0, %rp
-	copy	%r23, %ret0
-	copy	%r24, %ret1
+	.proc
+	.callinfo caller,frame=FRAME_SIZE
+	.entry
+	.export parisc_return_to_handler,data
+parisc_return_to_handler:
+	copy %r3,%r1
+	STREG %r0,-RP_OFFSET(%sp)	/* store 0 as %rp */
+	copy %sp,%r3
+	STREGM %r1,FRAME_SIZE(%sp)
+	STREG %ret0,8(%r3)
+	STREG %ret1,16(%r3)
 
-.globl ftrace_stub
-ftrace_stub:
+#ifdef CONFIG_64BIT
+	loadgp
+#endif
+
+	/* call ftrace_return_to_handler(0) */
+#ifdef CONFIG_64BIT
+	ldo -16(%sp),%ret1		/* Reference param save area */
+#endif
+	BL ftrace_return_to_handler,%r2
+	ldi 0,%r26
+	copy %ret0,%rp
+
+	/* restore original return values */
+	LDREG 8(%r3),%ret0
+	LDREG 16(%r3),%ret1
+
+	/* return from function */
+#ifdef CONFIG_64BIT
+	bve	(%rp)
+#else
 	bv	%r0(%rp)
-	nop
+#endif
+	LDREGM -FRAME_SIZE(%sp),%r3
+	.exit
+	.procend
 ENDPROC(return_to_handler)
+
 #endif	/* CONFIG_FUNCTION_TRACER */
 
 #ifdef CONFIG_IRQSTACKS
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 559d400..b13f9ec 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -1,6 +1,6 @@
 /*
  * Code for tracing calls in Linux kernel.
- * Copyright (C) 2009 Helge Deller <deller@gmx.de>
+ * Copyright (C) 2009-2016 Helge Deller <deller@gmx.de>
  *
  * based on code for x86 which is:
  * Copyright (C) 2007-2008 Steven Rostedt <srostedt@redhat.com>
@@ -13,104 +13,21 @@
 #include <linux/init.h>
 #include <linux/ftrace.h>
 
+#include <asm/assembly.h>
 #include <asm/sections.h>
 #include <asm/ftrace.h>
 
 
-
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-
-/* Add a function return address to the trace stack on thread info.*/
-static int push_return_trace(unsigned long ret, unsigned long long time,
-				unsigned long func, int *depth)
-{
-	int index;
-
-	if (!current->ret_stack)
-		return -EBUSY;
-
-	/* The return trace stack is full */
-	if (current->curr_ret_stack == FTRACE_RETFUNC_DEPTH - 1) {
-		atomic_inc(&current->trace_overrun);
-		return -EBUSY;
-	}
-
-	index = ++current->curr_ret_stack;
-	barrier();
-	current->ret_stack[index].ret = ret;
-	current->ret_stack[index].func = func;
-	current->ret_stack[index].calltime = time;
-	*depth = index;
-
-	return 0;
-}
-
-/* Retrieve a function return address to the trace stack on thread info.*/
-static void pop_return_trace(struct ftrace_graph_ret *trace, unsigned long *ret)
-{
-	int index;
-
-	index = current->curr_ret_stack;
-
-	if (unlikely(index < 0)) {
-		ftrace_graph_stop();
-		WARN_ON(1);
-		/* Might as well panic, otherwise we have no where to go */
-		*ret = (unsigned long)
-			dereference_function_descriptor(&panic);
-		return;
-	}
-
-	*ret = current->ret_stack[index].ret;
-	trace->func = current->ret_stack[index].func;
-	trace->calltime = current->ret_stack[index].calltime;
-	trace->overrun = atomic_read(&current->trace_overrun);
-	trace->depth = index;
-	barrier();
-	current->curr_ret_stack--;
-
-}
-
-/*
- * Send the trace to the ring-buffer.
- * @return the original return address.
- */
-unsigned long ftrace_return_to_handler(unsigned long retval0,
-				       unsigned long retval1)
-{
-	struct ftrace_graph_ret trace;
-	unsigned long ret;
-
-	pop_return_trace(&trace, &ret);
-	trace.rettime = local_clock();
-	ftrace_graph_return(&trace);
-
-	if (unlikely(!ret)) {
-		ftrace_graph_stop();
-		WARN_ON(1);
-		/* Might as well panic. What else to do? */
-		ret = (unsigned long)
-			dereference_function_descriptor(&panic);
-	}
-
-	/* HACK: we hand over the old functions' return values
-	   in %r23 and %r24. Assembly in entry.S will take care
-	   and move those to their final registers %ret0 and %ret1 */
-	asm( "copy %0, %%r23 \n\t"
-	     "copy %1, %%r24 \n" : : "r" (retval0), "r" (retval1) );
-
-	return ret;
-}
-
 /*
  * Hook the return address and push it in the stack of return addrs
  * in current thread info.
  */
-void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
+static void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 {
 	unsigned long old;
-	unsigned long long calltime;
 	struct ftrace_graph_ent trace;
+	extern int parisc_return_to_handler;
 
 	if (unlikely(ftrace_graph_is_dead()))
 		return;
@@ -119,64 +36,47 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 		return;
 
 	old = *parent;
-	*parent = (unsigned long)
-		  dereference_function_descriptor(&return_to_handler);
 
-	if (unlikely(!__kernel_text_address(old))) {
-		ftrace_graph_stop();
-		*parent = old;
-		WARN_ON(1);
-		return;
-	}
-
-	calltime = local_clock();
+	trace.func = self_addr;
+	trace.depth = current->curr_ret_stack + 1;
 
-	if (push_return_trace(old, calltime,
-				self_addr, &trace.depth) == -EBUSY) {
-		*parent = old;
+	/* Only trace if the calling function expects to */
+	if (!ftrace_graph_entry(&trace))
 		return;
-	}
 
-	trace.func = self_addr;
+        if (ftrace_push_return_trace(old, self_addr, &trace.depth,
+			0 ) == -EBUSY)
+                return;
 
-	/* Only trace if the calling function expects to */
-	if (!ftrace_graph_entry(&trace)) {
-		current->curr_ret_stack--;
-		*parent = old;
-	}
+	/* activate parisc_return_to_handler() as return point */
+	*parent = (unsigned long) &parisc_return_to_handler;
 }
-
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
 
-
-void ftrace_function_trampoline(unsigned long parent,
+void notrace ftrace_function_trampoline(unsigned long parent,
 				unsigned long self_addr,
 				unsigned long org_sp_gr3)
 {
-	extern ftrace_func_t ftrace_trace_function;
+	extern ftrace_func_t ftrace_trace_function;  /* depends on CONFIG_DYNAMIC_FTRACE */
+	extern int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace);
 
 	if (ftrace_trace_function != ftrace_stub) {
-		ftrace_trace_function(parent, self_addr);
+		/* struct ftrace_ops *op, struct pt_regs *regs); */
+		ftrace_trace_function(parent, self_addr, NULL, NULL);
 		return;
 	}
+
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	if (ftrace_graph_entry && ftrace_graph_return) {
-		unsigned long sp;
+	if (ftrace_graph_return != (trace_func_graph_ret_t) ftrace_stub ||
+		ftrace_graph_entry != ftrace_graph_entry_stub) {
 		unsigned long *parent_rp;
 
-                asm volatile ("copy %%r30, %0" : "=r"(sp));
-		/* sanity check: is stack pointer which we got from
-		   assembler function in entry.S in a reasonable
-		   range compared to current stack pointer? */
-		if ((sp - org_sp_gr3) > 0x400)
-			return;
-
 		/* calculate pointer to %rp in stack */
-		parent_rp = (unsigned long *) org_sp_gr3 - 0x10;
+		parent_rp = (unsigned long *) (org_sp_gr3 - RP_OFFSET);
 		/* sanity check: parent_rp should hold parent */
 		if (*parent_rp != parent)
 			return;
-		
+
 		prepare_ftrace_return(parent_rp, self_addr);
 		return;
 	}
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 75aa0db..bbbe360 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -129,6 +129,15 @@ $pgt_fill_loop:
 	/* And the stack pointer too */
 	ldo             THREAD_SZ_ALGN(%r6),%sp
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_FUNCTION_TRACER)
+	.import _mcount,data
+	/* initialize mcount FPTR */
+	/* Get the global data pointer */
+	loadgp
+	load32		PA(_mcount), %r10
+	std		%dp,0x18(%r10)
+#endif
+
 #ifdef CONFIG_SMP
 	/* Set the smp rendezvous address into page zero.
 	** It would be safer to do this in init_smp_config() but
