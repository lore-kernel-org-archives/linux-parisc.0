From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: implement irq stacks
Date: Tue, 7 May 2013 22:25:42 +0200
Message-ID: <20130507202542.GA8144@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Default kernel stack size on parisc is 16k.  During tests we found that the
kernel stack can easily grow beyond 13k, which leaves 3k left for irq
processing.

This patch adds the possibility to activate an additional stack of 16k per CPU
which is being used during irq processing.  This implementation does not yet
uses this irq stack for the irq bh handler.

The assembler code for call_on_stack was heavily cleaned up by John
David Anglin.

CC: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index fe4afb0..cad060f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -243,6 +243,14 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config IRQSTACKS
+	bool "Use separate kernel stacks when processing interrupts"
+	default n
+	help
+	  If you say Y here the kernel will use separate kernel stacks
+	  for handling hard and soft interrupts.  This can help avoid
+	  overflowing the process kernel stacks.
+
 config HOTPLUG_CPU
 	bool
 	default y if SMP
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 09b54a5..242f06a 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -20,8 +20,6 @@
 
 #endif /* __ASSEMBLY__ */
 
-#define KERNEL_STACK_SIZE 	(4*PAGE_SIZE)
-
 /*
  * Default implementation of macro that returns current
  * instruction pointer ("program counter").
@@ -61,6 +59,23 @@
 #ifndef __ASSEMBLY__
 
 /*
+ * IRQ STACK - used for irq handler
+ */
+#ifdef __KERNEL__
+
+#define IRQ_STACK_SIZE      (4096 << 2) /* 16k irq stack size */
+
+union irq_stack_union {
+	unsigned long stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
+};
+
+DECLARE_PER_CPU(union irq_stack_union, irq_stack_union);
+
+void call_on_stack(unsigned long p1, void *func, unsigned long new_stack);
+
+#endif /* __KERNEL__ */
+
+/*
  * Data detected about CPUs at boot time which is the same for all CPU's.
  * HP boxes are SMP - ie identical processors.
  *
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3f3326d..4bb96ad 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -2010,6 +2010,47 @@ ftrace_stub:
 ENDPROC(return_to_handler)
 #endif	/* CONFIG_FUNCTION_TRACER */
 
+#ifdef CONFIG_IRQSTACKS
+/* void call_on_stack(unsigned long param1, void *func,
+		      unsigned long new_stack) */
+ENTRY(call_on_stack)
+	copy	%sp, %r1
+
+	/* Regarding the HPPA calling conventions for function pointers,
+	   we assume the PIC register is not changed across call.  For
+	   CONFIG_64BIT, the argument pointer is left to point at the
+	   argument region allocated for the call to call_on_stack. */
+# ifdef CONFIG_64BIT
+	/* Switch to new stack.  We allocate two 128 byte frames.  */
+	ldo	256(%arg2), %sp
+	/* Save previous stack pointer and return pointer in frame marker */
+	STREG	%rp, -144(%sp)
+	/* Calls always use function descriptor */
+	LDREG	16(%arg1), %arg1
+	bve,l	(%arg1), %rp
+	STREG	%r1, -136(%sp)
+	LDREG	-144(%sp), %rp
+	bve	(%rp)
+	LDREG	-136(%sp), %sp
+# else
+	/* Switch to new stack.  We allocate two 64 byte frames.  */
+	ldo	128(%arg2), %sp
+	/* Save previous stack pointer and return pointer in frame marker */
+	STREG	%r1, -68(%sp)
+	STREG	%rp, -84(%sp)
+	/* Calls use function descriptor if PLABEL bit is set */
+	bb,>=,n	%arg1, 30, 1f
+	depwi	0,31,2, %arg1
+	LDREG	0(%arg1), %arg1
+1:
+	be,l	0(%sr4,%arg1), %sr0, %r31
+	copy	%r31, %rp
+	LDREG	-84(%sp), %rp
+	bv	(%rp)
+	LDREG	-68(%sp), %sp
+# endif /* CONFIG_64BIT */
+ENDPROC(call_on_stack)
+#endif /* CONFIG_IRQSTACKS */
 
 get_register:
 	/*
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 61e51ac..810f9cf8 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -358,6 +358,29 @@ static inline void stack_overflow_check(struct pt_regs *regs)
 #endif
 }
 
+#ifdef CONFIG_IRQSTACKS
+DEFINE_PER_CPU(union irq_stack_union, irq_stack_union);
+
+static void execute_on_irq_stack(void *func, unsigned long param1)
+{
+	unsigned long *irq_stack_start;
+	unsigned long irq_stack;
+	int cpu = smp_processor_id();
+
+	irq_stack_start = &per_cpu(irq_stack_union, cpu).stack[0];
+	irq_stack = (unsigned long) irq_stack_start;
+	irq_stack = ALIGN(irq_stack, 16); /* align for stack frame usage */
+
+	BUG_ON(*irq_stack_start); /* report bug if we were called recursive. */
+	*irq_stack_start = 1;
+
+	/* This is where we switch to the IRQ stack. */
+	call_on_stack(param1, func, irq_stack);
+
+	*irq_stack_start = 0;
+}
+#endif /* CONFIG_IRQSTACKS */
+
 /* ONLY called from entry.S:intr_extint() */
 void do_cpu_irq_mask(struct pt_regs *regs)
 {
@@ -393,7 +416,12 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 	}
 #endif
 	stack_overflow_check(regs);
+
+#ifdef CONFIG_IRQSTACKS
+	execute_on_irq_stack(&generic_handle_irq, irq);
+#else
 	generic_handle_irq(irq);
+#endif /* CONFIG_IRQSTACKS */
 
  out:
 	irq_exit();
