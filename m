From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 1/2] parisc: Convert the final irq bits
Date: Fri, 25 Mar 2011 13:40:15 -0000
Message-ID: <20110325133952.877111800@linutronix.de>
References: <20110325133845.830304772@linutronix.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

1) As promised in the comment, the core does not copy cpumask anymore
   when the arch code returns -EINVAL

2) Get the per cpu information from irq_data

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/irq.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

Index: linux-2.6-tip/arch/parisc/kernel/irq.c
===================================================================
--- linux-2.6-tip.orig/arch/parisc/kernel/irq.c
+++ linux-2.6-tip/arch/parisc/kernel/irq.c
@@ -113,13 +113,8 @@ int cpu_check_affinity(struct irq_data *
 	int cpu_dest;
 
 	/* timer and ipi have to always be received on all CPUs */
-	if (CHECK_IRQ_PER_CPU(irq_to_desc(d->irq)->status)) {
-		/* Bad linux design decision.  The mask has already
-		 * been set; we must reset it. Will fix - tglx
-		 */
-		cpumask_setall(d->affinity);
+	if (irqd_is_per_cpu(d))
 		return -EINVAL;
-	}
 
 	/* whatever mask they set, we just allow one CPU */
 	cpu_dest = first_cpu(*dest);
@@ -357,7 +352,7 @@ void do_cpu_irq_mask(struct pt_regs *reg
 #ifdef CONFIG_SMP
 	desc = irq_to_desc(irq);
 	cpumask_copy(&dest, desc->irq_data.affinity);
-	if (CHECK_IRQ_PER_CPU(desc->status) &&
+	if (irqd_is_per_cpu(&desc->irq_data) &&
 	    !cpu_isset(smp_processor_id(), dest)) {
 		int cpu = first_cpu(dest);
 


