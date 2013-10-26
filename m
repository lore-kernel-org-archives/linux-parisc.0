From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: do not count IPI calls twice
Date: Sun, 27 Oct 2013 00:26:20 +0200
Message-ID: <20131026222620.GA11061@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The number of IPI calls is already visible as per-cpu IPI irq counters
in/proc/cpuinfo, so let's drop this additional counting.
This partly reverts:
cd85d55 parisc: more irq statistics in /proc/interrupts

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index 241c345..9b3bd03 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -21,7 +21,6 @@ typedef struct {
 	unsigned int irq_stack_usage;
 #ifdef CONFIG_SMP
 	unsigned int irq_resched_count;
-	unsigned int irq_call_count;
 #endif
 	unsigned int irq_unaligned_count;
 	unsigned int irq_fpassist_count;
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 2e6443b..501ac8b 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -179,10 +179,6 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_resched_count);
 	seq_puts(p, "  Rescheduling interrupts\n");
-	seq_printf(p, "%*s: ", prec, "CAL");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
-	seq_puts(p, "  Function call interrupts\n");
 #endif
 	seq_printf(p, "%*s: ", prec, "UAH");
 	for_each_online_cpu(j)
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 2b96602..ceda229 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -125,11 +125,6 @@ ipi_interrupt(int irq, void *dev_id)
 	unsigned long ops;
 	unsigned long flags;
 
-	/* Count this now; we may make a call that never returns. */
-	inc_irq_stat(irq_call_count);
-
-	mb();	/* Order interrupt and bit testing. */
