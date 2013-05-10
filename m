From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: implement irq stacks - part 2 (v2)
Date: Fri, 10 May 2013 23:24:01 +0200
Message-ID: <20130510212401.GA13982@p100.box>
References: <20130509001438.GA32043@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130509001438.GA32043@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes few build issues which were introduced with the last
irq stack patch, e.g. the combination of stack overflow check and irq
stack.

Furthermore we now do proper locking and change the irq bh handler
to use the irq stack as well.

In /proc/interrupts one now can monitor how huge the irq stack has grown
and how often it was preferred over the kernel stack.

IRQ stacks are now enabled by default just to make sure that we not
overflow the kernel stack by accident.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index cad060f..6507dab 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -245,7 +245,7 @@ config SMP
 
 config IRQSTACKS
 	bool "Use separate kernel stacks when processing interrupts"
-	default n
+	default y
 	help
 	  If you say Y here the kernel will use separate kernel stacks
 	  for handling hard and soft interrupts.  This can help avoid
diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index 12373c4..c19f713 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -11,10 +11,18 @@
 #include <linux/threads.h>
 #include <linux/irq.h>
 
+#ifdef CONFIG_IRQSTACKS
+#define __ARCH_HAS_DO_SOFTIRQ
+#endif
+
 typedef struct {
 	unsigned int __softirq_pending;
 #ifdef CONFIG_DEBUG_STACKOVERFLOW
 	unsigned int kernel_stack_usage;
+#ifdef CONFIG_IRQSTACKS
+	unsigned int irq_stack_usage;
+	unsigned int irq_stack_counter;
+#endif
 #endif
 #ifdef CONFIG_SMP
 	unsigned int irq_resched_count;
@@ -28,6 +36,7 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
 #define __ARCH_IRQ_STAT
 #define __IRQ_STAT(cpu, member) (irq_stat[cpu].member)
 #define inc_irq_stat(member)	this_cpu_inc(irq_stat.member)
+#define __inc_irq_stat(member)	__this_cpu_inc(irq_stat.member)
 #define local_softirq_pending()	this_cpu_read(irq_stat.__softirq_pending)
 
 #define __ARCH_SET_SOFTIRQ_PENDING
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 0640155..cfbc439 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -63,10 +63,13 @@
  */
 #ifdef __KERNEL__
 
+#include <linux/spinlock_types.h>
+
 #define IRQ_STACK_SIZE      (4096 << 2) /* 16k irq stack size */
 
 union irq_stack_union {
 	unsigned long stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
+	raw_spinlock_t lock;
 };
 
 DECLARE_PER_CPU(union irq_stack_union, irq_stack_union);
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index e255db0..55237a7 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -166,22 +166,32 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	seq_printf(p, "%*s: ", prec, "STK");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->kernel_stack_usage);
-	seq_printf(p, "  Kernel stack usage\n");
+	seq_puts(p, "  Kernel stack usage\n");
+# ifdef CONFIG_IRQSTACKS
+	seq_printf(p, "%*s: ", prec, "IST");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_stack_usage);
+	seq_puts(p, "  Interrupt stack usage\n");
+	seq_printf(p, "%*s: ", prec, "ISC");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_stack_counter);
+	seq_puts(p, "  Interrupt stack usage counter\n");
+# endif
 #endif
 #ifdef CONFIG_SMP
 	seq_printf(p, "%*s: ", prec, "RES");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_resched_count);
-	seq_printf(p, "  Rescheduling interrupts\n");
+	seq_puts(p, "  Rescheduling interrupts\n");
 	seq_printf(p, "%*s: ", prec, "CAL");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
-	seq_printf(p, "  Function call interrupts\n");
+	seq_puts(p, "  Function call interrupts\n");
 #endif
 	seq_printf(p, "%*s: ", prec, "TLB");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_tlb_count);
-	seq_printf(p, "  TLB shootdowns\n");
+	seq_puts(p, "  TLB shootdowns\n");
 	return 0;
 }
 
@@ -378,6 +388,7 @@ static inline void stack_overflow_check(struct pt_regs *regs)
 	unsigned long sp = regs->gr[30];
 	unsigned long stack_usage;
 	unsigned int *last_usage;
+	int cpu = smp_processor_id();
 
 	/* if sr7 != 0, we interrupted a userspace process which we do not want
 	 * to check for stack overflow. We will only check the kernel stack. */
@@ -386,7 +397,31 @@ static inline void stack_overflow_check(struct pt_regs *regs)
 
 	/* calculate kernel stack usage */
 	stack_usage = sp - stack_start;
-	last_usage = &per_cpu(irq_stat.kernel_stack_usage, smp_processor_id());
+#ifdef CONFIG_IRQSTACKS
+	if (likely(stack_usage <= THREAD_SIZE))
+		goto check_kernel_stack; /* found kernel stack */
+
+	/* check irq stack usage */
+	stack_start = (unsigned long) &per_cpu(irq_stack_union, cpu).stack;
+	stack_usage = sp - stack_start;
+
+	last_usage = &per_cpu(irq_stat.irq_stack_usage, cpu);
+	if (unlikely(stack_usage > *last_usage))
+		*last_usage = stack_usage;
+
+	if (likely(stack_usage < (IRQ_STACK_SIZE - STACK_MARGIN)))
+		return;
+
+	pr_emerg("stackcheck: %s will most likely overflow irq stack "
+		 "(sp:%lx, stk bottom-top:%lx-%lx)\n",
+		current->comm, sp, stack_start, stack_start + IRQ_STACK_SIZE);
+	goto panic_check;
+
+check_kernel_stack:
+#endif
+
+	/* check kernel stack usage */
+	last_usage = &per_cpu(irq_stat.kernel_stack_usage, cpu);
 
 	if (unlikely(stack_usage > *last_usage))
 		*last_usage = stack_usage;
@@ -398,31 +433,69 @@ static inline void stack_overflow_check(struct pt_regs *regs)
 		 "(sp:%lx, stk bottom-top:%lx-%lx)\n",
 		current->comm, sp, stack_start, stack_start + THREAD_SIZE);
 
+#ifdef CONFIG_IRQSTACKS
+panic_check:
+#endif
 	if (sysctl_panic_on_stackoverflow)
 		panic("low stack detected by irq handler - check messages\n");
 #endif
 }
 
 #ifdef CONFIG_IRQSTACKS
-DEFINE_PER_CPU(union irq_stack_union, irq_stack_union);
+DEFINE_PER_CPU(union irq_stack_union, irq_stack_union) = {
+		.lock = __RAW_SPIN_LOCK_UNLOCKED((irq_stack_union).lock)
+	};
 
 static void execute_on_irq_stack(void *func, unsigned long param1)
 {
-	unsigned long *irq_stack_start;
+	union irq_stack_union *union_ptr;
 	unsigned long irq_stack;
-	int cpu = smp_processor_id();
+	raw_spinlock_t *irq_stack_in_use;
 
-	irq_stack_start = &per_cpu(irq_stack_union, cpu).stack[0];
-	irq_stack = (unsigned long) irq_stack_start;
-	irq_stack = ALIGN(irq_stack, 16); /* align for stack frame usage */
+	union_ptr = &per_cpu(irq_stack_union, smp_processor_id());
+	irq_stack = (unsigned long) &union_ptr->stack;
+	irq_stack = ALIGN(irq_stack + sizeof(irq_stack_union.lock),
+			 64); /* align for stack frame usage */
 
-	BUG_ON(*irq_stack_start); /* report bug if we were called recursive. */
-	*irq_stack_start = 1;
+	/* We may be called recursive. If we are already using the irq stack,
+	 * just continue to use it. Use spinlocks to serialize
+	 * the irq stack usage.
+	 */
+	irq_stack_in_use = &union_ptr->lock;
+	if (!raw_spin_trylock(irq_stack_in_use)) {
+		void (*direct_call)(unsigned long p1) = func;
+
+		/* We are using the IRQ stack already.
+		 * Do direct call on current stack. */
+		direct_call(param1);
+		return;
+	}
 
 	/* This is where we switch to the IRQ stack. */
 	call_on_stack(param1, func, irq_stack);
 
-	*irq_stack_start = 0;
+	__inc_irq_stat(irq_stack_counter);
+
+	/* free up irq stack usage. */
+	do_raw_spin_unlock(irq_stack_in_use);
+}
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
+	if (pending)
+		execute_on_irq_stack(__do_softirq, 0);
+
+	local_irq_restore(flags);
 }
 #endif /* CONFIG_IRQSTACKS */
 
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index ce939ac..1c96564 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -1069,7 +1069,7 @@ void flush_tlb_all(void)
 {
 	int do_recycle;
 
-	inc_irq_stat(irq_tlb_count);
+	__inc_irq_stat(irq_tlb_count);
 	do_recycle = 0;
 	spin_lock(&sid_lock);
 	if (dirty_space_ids > RECYCLE_THRESHOLD) {
@@ -1090,7 +1090,7 @@ void flush_tlb_all(void)
 #else
 void flush_tlb_all(void)
 {
-	inc_irq_stat(irq_tlb_count);
+	__inc_irq_stat(irq_tlb_count);
 	spin_lock(&sid_lock);
 	flush_tlb_all_local(NULL);
 	recycle_sids();
