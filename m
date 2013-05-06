From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: more irq statistics in /proc/interrupts
Date: Mon, 6 May 2013 21:20:26 +0200
Message-ID: <20130506192026.GA26582@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add framework and initial values for more fine grained statistics in
/proc/interrupts.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index 0d68184..a9c0fb1 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -1,11 +1,45 @@
 /* hardirq.h: PA-RISC hard IRQ support.
  *
  * Copyright (C) 2001 Matthew Wilcox <matthew@wil.cx>
+ * Copyright (C) 2013 Helge Deller <deller@gmx.de>
  */
 
 #ifndef _PARISC_HARDIRQ_H
 #define _PARISC_HARDIRQ_H
 
-#include <asm-generic/hardirq.h>
+#include <linux/cache.h>
+#include <linux/threads.h>
+#include <linux/irq.h>
+
+typedef struct {
+	unsigned int __softirq_pending;
+#ifdef CONFIG_DEBUG_STACKOVERFLOW
+	unsigned int kernel_stack_usage;
+#endif
+#ifdef CONFIG_SMP
+	unsigned int irq_resched_count;
+	unsigned int irq_call_count;
+	/*
+	 * irq_tlb_count is double-counted in irq_call_count, so it must be
+	 * subtracted from irq_call_count when displaying irq_call_count
+	 */
+	unsigned int irq_tlb_count;
+#endif
+} ____cacheline_aligned irq_cpustat_t;
+
+DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
+
+#define __ARCH_IRQ_STAT
+#define __IRQ_STAT(cpu, member) (irq_stat[cpu].member)
+#define inc_irq_stat(member)	this_cpu_inc(irq_stat.member)
+#define local_softirq_pending()	this_cpu_read(irq_stat.__softirq_pending)
+
+#define __ARCH_SET_SOFTIRQ_PENDING
+
+#define set_softirq_pending(x)	\
+		this_cpu_write(irq_stat.__softirq_pending, (x))
+#define or_softirq_pending(x)	this_cpu_or(irq_stat.__softirq_pending, (x))
+
+#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector %02x\n", irq)
 
 #endif /* _PARISC_HARDIRQ_H */
diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 09b54a5..8469664 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -97,7 +97,6 @@ struct cpuinfo_parisc {
 	unsigned long txn_addr;     /* MMIO addr of EIR or id_eid */
 #ifdef CONFIG_SMP
 	unsigned long pending_ipi;  /* bitmap of type ipi_message_type */
-	unsigned long ipi_count;    /* number ipi Interrupts */
 #endif
 	unsigned long bh_count;     /* number of times bh was invoked */
 	unsigned long prof_counter; /* per CPU profiling support */
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index b81a514f..14015fc 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -152,6 +152,40 @@ static struct irq_chip cpu_interrupt_type = {
 	.irq_retrigger	= NULL,
 };
 
+DEFINE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
+#define irq_stats(x)		(&per_cpu(irq_stat, x))
+
+/*
+ * /proc/interrupts printing for arch specific interrupts
+ */
+int arch_show_interrupts(struct seq_file *p, int prec)
+{
+	int j;
+
+#ifdef CONFIG_DEBUG_STACKOVERFLOW
+	seq_printf(p, "%*s: ", prec, "STK");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->kernel_stack_usage);
+	seq_printf(p, "  Kernel stack usage\n");
+#endif
+#ifdef CONFIG_SMP
+	seq_printf(p, "%*s: ", prec, "RES");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_resched_count);
+	seq_printf(p, "  Rescheduling interrupts\n");
+	seq_printf(p, "%*s: ", prec, "CAL");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count -
+					irq_stats(j)->irq_tlb_count);
+	seq_printf(p, "  Function call interrupts\n");
+	seq_printf(p, "%*s: ", prec, "TLB");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_tlb_count);
+	seq_printf(p, "  TLB shootdowns\n");
+#endif
+	return 0;
+}
+
 int show_interrupts(struct seq_file *p, void *v)
 {
 	int i = *(loff_t *) v, j;
@@ -219,6 +253,9 @@ int show_interrupts(struct seq_file *p, void *v)
 		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 
+	if (i == NR_IRQS)
+		arch_show_interrupts(p, 3);
+
 	return 0;
 }
 
@@ -340,13 +377,22 @@ static inline void stack_overflow_check(struct pt_regs *regs)
 	/* Our stack starts directly behind the thread_info struct. */
 	unsigned long stack_start = (unsigned long) current_thread_info();
 	unsigned long sp = regs->gr[30];
+	unsigned long stack_usage;
+	unsigned int *last_usage;
 
 	/* if sr7 != 0, we interrupted a userspace process which we do not want
 	 * to check for stack overflow. We will only check the kernel stack. */
 	if (regs->sr[7])
 		return;
 
-	if (likely((sp - stack_start) < (THREAD_SIZE - STACK_MARGIN)))
+	/* calculate kernel stack usage */
+	stack_usage = sp - stack_start;
+	last_usage = &per_cpu(irq_stat.kernel_stack_usage, smp_processor_id());
+
+	if (unlikely(stack_usage > *last_usage))
+		*last_usage = stack_usage;
+
+	if (likely(stack_usage < (THREAD_SIZE - STACK_MARGIN)))
 		return;
 
 	pr_emerg("stackcheck: %s will most likely overflow kernel stack "
@@ -450,3 +496,4 @@ void __init init_IRQ(void)
 #endif
         set_eiem(cpu_eiem);	/* EIEM : enable all external intr */
 }
+
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 6266730..e907744 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -127,7 +127,7 @@ ipi_interrupt(int irq, void *dev_id)
 	unsigned long flags;
 
 	/* Count this now; we may make a call that never returns. */
-	p->ipi_count++;
+	inc_irq_stat(irq_call_count);
 
 	mb();	/* Order interrupt and bit testing. */
 
@@ -155,6 +155,7 @@ ipi_interrupt(int irq, void *dev_id)
 				
 			case IPI_RESCHEDULE:
 				smp_debug(100, KERN_DEBUG "CPU%d IPI_RESCHEDULE\n", this_cpu);
+				inc_irq_stat(irq_resched_count);
 				scheduler_ipi();
 				break;
 
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 3ac462d..9fbcc22 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -1077,6 +1077,7 @@ void flush_tlb_all(void)
 {
 	int do_recycle;
 
+	inc_irq_stat(irq_tlb_count);
 	do_recycle = 0;
 	spin_lock(&sid_lock);
 	if (dirty_space_ids > RECYCLE_THRESHOLD) {
@@ -1097,6 +1098,7 @@ void flush_tlb_all(void)
 #else
 void flush_tlb_all(void)
 {
+	inc_irq_stat(irq_tlb_count);
 	spin_lock(&sid_lock);
 	flush_tlb_all_local(NULL);
 	recycle_sids();
