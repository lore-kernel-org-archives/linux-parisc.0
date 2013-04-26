From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: increase kernel stack size to 32k
Date: Sat, 27 Apr 2013 00:30:14 +0200
Message-ID: <20130426223014.GA19671@p100.box>
References: <20130423202203.GA7287@p100.box>
 <51778ADE.4010906@gmx.de>
 <1366836075.1971.22.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1366836075.1971.22.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* James Bottomley <James.Bottomley@HansenPartnership.com>:
> On Wed, 2013-04-24 at 09:33 +0200, Helge Deller wrote:
> > On 04/23/2013 10:22 PM, Helge Deller wrote:
> > > commit e4e1e78facf7565cada909a69c7fb6415b6e7b83
> > > Author: Helge Deller <deller@gmx.de>
> > > Date:   Tue Apr 23 17:19:37 2013 +0200
> > > 
> > > parisc: increase kernel stack size to 32k
> > > 
> > > --- a/arch/parisc/include/asm/thread_info.h
> > > +++ b/arch/parisc/include/asm/thread_info.h
> > > -#define THREAD_SIZE_ORDER            2
> > > +#define THREAD_SIZE_ORDER            3	/* 32k stack */
> > 
> > I tested again, and it actually needs to be 64k stacks to not crash any longer.
> > So, the right temporary fix is:
> > 
> > > +#define THREAD_SIZE_ORDER            4	/* 64k stack */
> > 
> > Will send updated patch soon.
> 
> This is an indicator of something seriously wrong somewhere.  We've
> always had the 16k stack just because of our large frames.  In theory,
> the IRQ stack should only be the same size as the kernel stack, so if we
> have both in the same place, we should only need at max 32k ... if we're
> still seeing problems related to stack overrun, then it might be we have
> an IRQ recursion where we shouldn't have.  To be honest, I have a hard
> time explaining why our stacks should be over 8k.


You are probably right.

Below is now a first implementation to support IRQ stacks for parisc.

I booted it successfully on 32- and 64bit kernels. 
Uncommenting the WARN_ON_ONCE(1) will show that the stacks get activated.
As a nice feature we now have CONFIG_DEBUG_STACKOVERFLOW as well, which
should help us to find the problematic functions (if there are any).

I have not tested it with my testcases yet, but if people want to play,
here it is...

Helge


 Kconfig.debug             |   11 ++++++
 include/asm/irq.h         |    2 +
 include/asm/processor.h   |   17 ++++++++--
 include/asm/thread_info.h |    2 -
 kernel/entry.S            |   22 ++++++++++++
 kernel/irq.c              |   78
+++++++++++++++++++++++++++++++++++++++++++++-
 6 files changed, 128 insertions(+), 4 deletions(-)



diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index 7305ac8..ed88c37 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -12,6 +12,17 @@ config DEBUG_RODATA
          portion of the kernel code won't be covered by a TLB anymore.
          If in doubt, say "N".
 
+config DEBUG_STACKOVERFLOW
+	bool "Check for stack overflows"
+	depends on DEBUG_KERNEL
+	---help---
+	  Say Y here if you want to check the overflows of kernel, IRQ
+	  and exception stacks. This option will cause messages of the
+	  stacks in detail when free stack space drops below a certain
+	  limit.
+	  If in doubt, say "N".
+
+
 config DEBUG_STRICT_USER_COPY_CHECKS
 	bool "Strict copy size checks"
 	depends on DEBUG_KERNEL && !TRACE_BRANCH_PROFILING
diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 1073599..0417ebf 100644
--- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -10,6 +10,8 @@
 #include <linux/cpumask.h>
 #include <asm/types.h>
 
+#define __ARCH_HAS_DO_SOFTIRQ
+
 #define NO_IRQ		(-1)
 
 #ifdef CONFIG_GSC
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 09b54a5..1c126c6 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -20,8 +20,6 @@
 
 #endif /* __ASSEMBLY__ */
 
-#define KERNEL_STACK_SIZE 	(4*PAGE_SIZE)
-
 /*
  * Default implementation of macro that returns current
  * instruction pointer ("program counter").
@@ -60,6 +58,21 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef __KERNEL__
+
+/*
+ * IRQ STACK - used for irq and irq bh handler
+ */
+#define IRQ_STACK_SIZE (4096 * 4) // PAGE_SIZE
+
+union irq_stack_union {
+	unsigned long irq_stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
+};
+
+DECLARE_PER_CPU(union irq_stack_union, irq_stack_union);
+DECLARE_PER_CPU(unsigned int, irq_count);
+#endif /* __KERNEL__ */
+
 /*
  * Data detected about CPUs at boot time which is the same for all CPU's.
  * HP boxes are SMP - ie identical processors.
diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index d1fb79a..8642ea8 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -40,7 +40,7 @@ struct thread_info {
 
 /* thread information allocation */
 
-#define THREAD_SIZE_ORDER            2
+#define THREAD_SIZE_ORDER            2 /* keep on 2 for 16k */
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
 #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f33201b..117d516 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1997,6 +1997,28 @@ ftrace_stub:
 ENDPROC(return_to_handler)
 #endif	/* CONFIG_FUNCTION_TRACER */
 
+/* void call_on_stack(unsigned long param1, void *func, unsigned long new_stack) */
+ENTRY(call_on_stack)
+	STREG	%sp, 8(%arg2)
+	STREG	%rp, 16(%arg2)
+
+	/* HPPA calling convention for function pointers */
+#ifdef CONFIG_64BIT
+	LDREG	16(%arg1), %arg1
+	bve,l	(%arg1), %rp
+	addi    0x40, %arg2, %sp
+#else
+	addi    0x40, %arg2, %sp
+	be,l	0(%sr4,%arg1), %sr0, %r31
+	copy	%r31, %rp
+#endif
+
+	addi    -0x40, %sp, %sp
+	LDREG	16(%sp),%rp
+	bv	(%rp)
+	LDREG	8(%sp),%sp
+ENDPROC(call_on_stack)
+
 
 get_register:
 	/*
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 8094d3e..d864057 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -330,6 +330,60 @@ static inline int eirr_to_irq(unsigned long eirr)
 	return (BITS_PER_LONG - bit) + TIMER_IRQ;
 }
 
+
+int sysctl_panic_on_stackoverflow __read_mostly;
+
+/*
+ * Stack overflow check:
+ */
+static inline void stack_overflow_check(unsigned long sp, unsigned long stack_start, unsigned long stack_size)
+{
+#ifdef CONFIG_DEBUG_STACKOVERFLOW
+#define STACK_MARGIN	256
+	if (sp >= stack_start && sp < (stack_start + stack_size - STACK_MARGIN))
+		return;
+
+	WARN_ONCE(1, "do_IRQ(): %s has overflown a kernel stack (sp:%lx, irq stk bottom-top:%lx-%lx)\n",
+		current->comm, sp,
+		stack_start, stack_start + stack_size);
+
+	if (sysctl_panic_on_stackoverflow)
+		panic("low stack detected by irq handler - check messages\n");
+#endif
+}
+
+extern void call_on_stack(unsigned long param1, void *func, unsigned long new_stack); /* in entry.S */
+
+#define current_stack_pointer() ({ unsigned long sp; asm volatile ("copy %%r30, %0" : "=r"(sp)); (sp); })
+
+static void noinline execute_on_irq_stack(void *func, unsigned long param1)
+{
+	int cpu = smp_processor_id();
+	unsigned long sp, irq_stack;
+	void (*direct_call)(unsigned long param1) = func;
+
+	irq_stack = (unsigned long) &per_cpu(irq_stack_union, cpu);
+	sp = current_stack_pointer();
+
+	/*
+	 * this is where we try to switch to the IRQ stack. However, if we are
+	 * already using the IRQ stack (because we interrupted a hardirq
+	 * handler) we can't do that and just have to keep using the
+	 * current stack (which is the irq stack already after all)
+	 */
+
+	if ((sp - irq_stack) >= sizeof(union irq_stack_union)) {
+		stack_overflow_check(sp, (unsigned long)task_stack_page(current), THREAD_SIZE);
+		call_on_stack(param1, func, irq_stack);
+		// WARN_ON_ONCE(1); /* enable to check if irq stack is being used. */
+		// TODO: check if backtrace works from irq stack
+	} else {
+		stack_overflow_check(sp,  irq_stack, IRQ_STACK_SIZE);
+		direct_call(param1);
+	}
+
+}
+
 /* ONLY called from entry.S:intr_extint() */
 void do_cpu_irq_mask(struct pt_regs *regs)
 {
@@ -364,7 +418,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 		goto set_out;
 	}
 #endif
-	generic_handle_irq(irq);
+	execute_on_irq_stack(&generic_handle_irq, irq);
 
  out:
 	irq_exit();
@@ -423,3 +477,25 @@ void __init init_IRQ(void)
 
 }
 
+
+DEFINE_PER_CPU(union irq_stack_union, irq_stack_union);
+
+asmlinkage void do_softirq(void)
+{
+	__u32 pending;
+	unsigned long flags;
+
+	if (in_interrupt())
+		return;
+
+	local_irq_save(flags);
+
+	pending = local_softirq_pending();
+
+	/* Switch to interrupt stack */
+	if (pending) {
+		execute_on_irq_stack(&__do_softirq, 0);
+		WARN_ON_ONCE(softirq_count());
+	}
+	local_irq_restore(flags);
+}

