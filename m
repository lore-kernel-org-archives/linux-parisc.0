From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix irq stack on UP and SMP
Date: Thu, 23 May 2013 23:52:50 +0200
Message-ID: <20130523215250.GA17564@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The logic to detect if the irq stack was already in use with
raw_spin_trylock() is wrong, because it will generate a "trylock failure
on UP" error message with CONFIG_SMP=n and CONFIG_DEBUG_SPINLOCK=y.

arch_spin_trylock() can't be used either since in the CONFIG_SMP=n case
no atomic protection is given and we are reentrant here.

Now we will use a mutex instead, which is safe on UP and SMP.

Counting how often the irq stack was used is pretty useless, so just
drop this piece of code.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index 4c6dd8d..241c345 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -17,13 +17,8 @@
 
 typedef struct {
 	unsigned int __softirq_pending;
-#ifdef CONFIG_DEBUG_STACKOVERFLOW
 	unsigned int kernel_stack_usage;
-#ifdef CONFIG_IRQSTACKS
 	unsigned int irq_stack_usage;
-	unsigned int irq_stack_counter;
-#endif
-#endif
 #ifdef CONFIG_SMP
 	unsigned int irq_resched_count;
 	unsigned int irq_call_count;
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index cfbc439..cc2290a 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -17,7 +17,6 @@
 #include <asm/ptrace.h>
 #include <asm/types.h>
 #include <asm/percpu.h>
-
 #endif /* __ASSEMBLY__ */
 
 /*
@@ -59,26 +58,6 @@
 #ifndef __ASSEMBLY__
 
 /*
- * IRQ STACK - used for irq handler
- */
-#ifdef __KERNEL__
-
-#include <linux/spinlock_types.h>
-
-#define IRQ_STACK_SIZE      (4096 << 2) /* 16k irq stack size */
-
-union irq_stack_union {
-	unsigned long stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
-	raw_spinlock_t lock;
-};
-
-DECLARE_PER_CPU(union irq_stack_union, irq_stack_union);
-
-void call_on_stack(unsigned long p1, void *func, unsigned long new_stack);
-
-#endif /* __KERNEL__ */
-
-/*
  * Data detected about CPUs at boot time which is the same for all CPU's.
  * HP boxes are SMP - ie identical processors.
  *
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 9c2d953..88ba8a8 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -27,7 +27,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
 #include <linux/seq_file.h>
-#include <linux/spinlock.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <asm/io.h>
 
@@ -172,10 +172,6 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_stack_usage);
 	seq_puts(p, "  Interrupt stack usage\n");
-	seq_printf(p, "%*s: ", prec, "ISC");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", irq_stats(j)->irq_stack_counter);
-	seq_puts(p, "  Interrupt stack usage counter\n");
 # endif
 #endif
 #ifdef CONFIG_SMP
@@ -384,6 +380,23 @@ static inline int eirr_to_irq(unsigned long eirr)
 	return (BITS_PER_LONG - bit) + TIMER_IRQ;
 }
 
+#ifdef CONFIG_IRQSTACKS
+/*
+ * IRQ STACK - used for irq handler
+ */
+#define IRQ_STACK_SIZE      (4096 << 2) /* 16k irq stack size */
+
+union irq_stack_union {
+	unsigned long stack[IRQ_STACK_SIZE/sizeof(unsigned long)];
+	struct mutex lock;
+};
+
+DEFINE_PER_CPU(union irq_stack_union, irq_stack_union) = {
+		.lock = __MUTEX_INITIALIZER(irq_stack_union.lock),
+	};
+#endif
+
+
 int sysctl_panic_on_stackoverflow = 1;
 
 static inline void stack_overflow_check(struct pt_regs *regs)
@@ -450,15 +463,14 @@ panic_check:
 }
 
 #ifdef CONFIG_IRQSTACKS
-DEFINE_PER_CPU(union irq_stack_union, irq_stack_union) = {
-		.lock = __RAW_SPIN_LOCK_UNLOCKED((irq_stack_union).lock)
-	};
+/* in entry.S: */
+void call_on_stack(unsigned long p1, void *func, unsigned long new_stack);
 
 static void execute_on_irq_stack(void *func, unsigned long param1)
 {
 	union irq_stack_union *union_ptr;
 	unsigned long irq_stack;
-	raw_spinlock_t *irq_stack_in_use;
+	struct mutex *irq_stack_in_use;
 
 	union_ptr = &per_cpu(irq_stack_union, smp_processor_id());
 	irq_stack = (unsigned long) &union_ptr->stack;
@@ -470,7 +482,7 @@ static void execute_on_irq_stack(void *func, unsigned long param1)
 	 * the irq stack usage.
 	 */
 	irq_stack_in_use = &union_ptr->lock;
-	if (!raw_spin_trylock(irq_stack_in_use)) {
+	if (!mutex_trylock(irq_stack_in_use)) {
 		void (*direct_call)(unsigned long p1) = func;
 
 		/* We are using the IRQ stack already.
@@ -482,10 +494,8 @@ static void execute_on_irq_stack(void *func, unsigned long param1)
 	/* This is where we switch to the IRQ stack. */
 	call_on_stack(param1, func, irq_stack);
 
-	__inc_irq_stat(irq_stack_counter);
