From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: tlb flush counting fix for SMP and UP
Date: Tue, 7 May 2013 23:42:47 +0200
Message-ID: <20130507214247.GA17228@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix up build error on UP and show correctly number of function call
(ipi) irqs.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index a9c0fb1..12373c4 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -19,12 +19,8 @@ typedef struct {
 #ifdef CONFIG_SMP
 	unsigned int irq_resched_count;
 	unsigned int irq_call_count;
-	/*
-	 * irq_tlb_count is double-counted in irq_call_count, so it must be
-	 * subtracted from irq_call_count when displaying irq_call_count
-	 */
-	unsigned int irq_tlb_count;
 #endif
+	unsigned int irq_tlb_count;
 } ____cacheline_aligned irq_cpustat_t;
 
 DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index 8f1a810..5273da9 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -22,6 +22,8 @@ extern spinlock_t pa_tlb_lock;
 extern void flush_tlb_all(void);
 extern void flush_tlb_all_local(void *);
 
+#define smp_flush_tlb_all()	flush_tlb_all()
+
 /*
  * flush_tlb_mm()
  *
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index a237e32..e255db0 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -175,14 +175,13 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	seq_printf(p, "  Rescheduling interrupts\n");
 	seq_printf(p, "%*s: ", prec, "CAL");
 	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count -
-					irq_stats(j)->irq_tlb_count);
+		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
 	seq_printf(p, "  Function call interrupts\n");
+#endif
 	seq_printf(p, "%*s: ", prec, "TLB");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_tlb_count);
 	seq_printf(p, "  TLB shootdowns\n");
-#endif
 	return 0;
 }
 
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 218e20b..e3614fb 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -264,17 +264,6 @@ void arch_send_call_function_single_ipi(int cpu)
 }
 
 /*
- * Flush all other CPU's tlb and then mine.  Do this with on_each_cpu()
- * as we want to ensure all TLB's flushed before proceeding.
- */
-
-void
-smp_flush_tlb_all(void)
-{
-	on_each_cpu(flush_tlb_all_local, NULL, 1);
-}
