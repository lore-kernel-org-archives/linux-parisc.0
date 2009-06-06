From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fix irq compile bugs in arch/parisc/kernel/irq.c
Date: Sat, 06 Jun 2009 23:54:28 +0200
Message-ID: <4A2AE594.9050306@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix miscompilation in arch/parisc/kernel/irq.c:
/mnt/sda4/home/cvs/parisc/git-kernel/linus-linux-2.6/arch/parisc/kernel/irq.c:123: warning: passing arg 1 of `cpumask_setall' from incompatible pointer type
/mnt/sda4/home/cvs/parisc/git-kernel/linus-linux-2.6/arch/parisc/kernel/irq.c:141: warning: passing arg 1 of `cpumask_copy' from incompatible pointer type
/mnt/sda4/home/cvs/parisc/git-kernel/linus-linux-2.6/arch/parisc/kernel/irq.c:300: warning: passing arg 1 of `cpumask_copy' from incompatible pointer type
/mnt/sda4/home/cvs/parisc/git-kernel/linus-linux-2.6/arch/parisc/kernel/irq.c:357: warning: passing arg 2 of `cpumask_copy' from incompatible pointer type

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 4ea4229..570a335 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -120,7 +120,7 @@ int cpu_check_affinity(unsigned int irq, const struct cpumask *dest)
 	if (CHECK_IRQ_PER_CPU(irq)) {
 		/* Bad linux design decision.  The mask has already
 		 * been set; we must reset it */
-		cpumask_setall(&irq_desc[irq].affinity);
+		cpumask_setall(irq_desc[irq].affinity);
 		return -EINVAL;
 	}
 
@@ -138,7 +138,7 @@ static void cpu_set_affinity_irq(unsigned int irq, const struct cpumask *dest)
 	if (cpu_dest < 0)
 		return;
 
-	cpumask_copy(&irq_desc[irq].affinity, dest);
+	cpumask_copy(irq_desc[irq].affinity, dest);
 }
 #endif
 
@@ -297,7 +297,7 @@ int txn_alloc_irq(unsigned int bits_wide)
 unsigned long txn_affinity_addr(unsigned int irq, int cpu)
 {
 #ifdef CONFIG_SMP
-	cpumask_copy(&irq_desc[irq].affinity, cpumask_of(cpu));
+	cpumask_copy(irq_desc[irq].affinity, cpumask_of(cpu));
 #endif
 
 	return per_cpu(cpu_data, cpu).txn_addr;
@@ -354,7 +354,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 	irq = eirr_to_irq(eirr_val);
 
 #ifdef CONFIG_SMP
-	cpumask_copy(&dest, &irq_desc[irq].affinity);
+	cpumask_copy(&dest, irq_desc[irq].affinity);
 	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status) &&
 	    !cpu_isset(smp_processor_id(), dest)) {
 		int cpu = first_cpu(dest);
