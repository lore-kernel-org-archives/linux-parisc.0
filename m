From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 1/8] parisc: Convert cpu irq_chip to new functions
Date: Sun, 06 Feb 2011 20:45:52 -0000
Message-ID: <20110206204510.426016434@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fixup temporarily ioasapic, which shares functions with the cpu chip.
Remove unused no_*_irq function declarations.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/parisc/include/asm/irq.h |   13 ++-------
 arch/parisc/kernel/irq.c      |   60 ++++++++++++++++++++++++------------------
 drivers/parisc/iosapic.c      |    7 ++--
 3 files changed, 43 insertions(+), 37 deletions(-)

Index: linux-next/arch/parisc/include/asm/irq.h
===================================================================
--- linux-next.orig/arch/parisc/include/asm/irq.h
+++ linux-next/arch/parisc/include/asm/irq.h
@@ -32,15 +32,10 @@ static __inline__ int irq_canonicalize(i
 }
 
 struct irq_chip;
+struct irq_data;
 
-/*
- * Some useful "we don't have to do anything here" handlers.  Should
- * probably be provided by the generic code.
- */
-void no_ack_irq(unsigned int irq);
-void no_end_irq(unsigned int irq);
-void cpu_ack_irq(unsigned int irq);
-void cpu_eoi_irq(unsigned int irq);
+void cpu_ack_irq(struct irq_data *d);
+void cpu_eoi_irq(struct irq_data *d);
 
 extern int txn_alloc_irq(unsigned int nbits);
 extern int txn_claim_irq(int);
@@ -49,7 +44,7 @@ extern unsigned long txn_alloc_addr(unsi
 extern unsigned long txn_affinity_addr(unsigned int irq, int cpu);
 
 extern int cpu_claim_irq(unsigned int irq, struct irq_chip *, void *);
-extern int cpu_check_affinity(unsigned int irq, const struct cpumask *dest);
+extern int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest);
 
 /* soft power switch support (power.c) */
 extern struct tasklet_struct power_tasklet;
Index: linux-next/arch/parisc/kernel/irq.c
===================================================================
--- linux-next.orig/arch/parisc/kernel/irq.c
+++ linux-next/arch/parisc/kernel/irq.c
@@ -52,9 +52,9 @@ static volatile unsigned long cpu_eiem =
 */
 static DEFINE_PER_CPU(unsigned long, local_ack_eiem) = ~0UL;
 
-static void cpu_mask_irq(unsigned int irq)
+static void cpu_mask_irq(struct irq_data *d)
 {
-	unsigned long eirr_bit = EIEM_MASK(irq);
+	unsigned long eirr_bit = EIEM_MASK(d->irq);
 
 	cpu_eiem &= ~eirr_bit;
 	/* Do nothing on the other CPUs.  If they get this interrupt,
@@ -63,7 +63,7 @@ static void cpu_mask_irq(unsigned int ir
 	 * then gets disabled */
 }
 
-static void cpu_unmask_irq(unsigned int irq)
+static void __cpu_unmask_irq(unsigned int irq)
 {
 	unsigned long eirr_bit = EIEM_MASK(irq);
 
@@ -75,9 +75,14 @@ static void cpu_unmask_irq(unsigned int 
 	smp_send_all_nop();
 }
 
-void cpu_ack_irq(unsigned int irq)
+static void cpu_unmask_irq(struct irq_data *d)
+{
+	__cpu_unmask_irq(d->irq);
+}
+
+void cpu_ack_irq(struct irq_data *d)
 {
-	unsigned long mask = EIEM_MASK(irq);
+	unsigned long mask = EIEM_MASK(d->irq);
 	int cpu = smp_processor_id();
 
 	/* Clear in EIEM so we can no longer process */
@@ -90,9 +95,9 @@ void cpu_ack_irq(unsigned int irq)
 	mtctl(mask, 23);
 }
 
-void cpu_eoi_irq(unsigned int irq)
+void cpu_eoi_irq(struct irq_data *d)
 {
-	unsigned long mask = EIEM_MASK(irq);
+	unsigned long mask = EIEM_MASK(d->irq);
 	int cpu = smp_processor_id();
 
 	/* set it in the eiems---it's no longer in process */
@@ -103,15 +108,16 @@ void cpu_eoi_irq(unsigned int irq)
 }
 
 #ifdef CONFIG_SMP
-int cpu_check_affinity(unsigned int irq, const struct cpumask *dest)
+int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest)
 {
 	int cpu_dest;
 
 	/* timer and ipi have to always be received on all CPUs */
 	if (CHECK_IRQ_PER_CPU(irq)) {
 		/* Bad linux design decision.  The mask has already
-		 * been set; we must reset it */
-		cpumask_setall(irq_desc[irq].affinity);
+		 * been set; we must reset it. Will fix - tglx
+		 */
+		cpumask_setall(d->affinity);
 		return -EINVAL;
 	}
 
@@ -121,33 +127,34 @@ int cpu_check_affinity(unsigned int irq,
 	return cpu_dest;
 }
 
-static int cpu_set_affinity_irq(unsigned int irq, const struct cpumask *dest)
+static int cpu_set_affinity_irq(struct irq_data *d, const struct cpumask *dest,
+				bool force))
 {
 	int cpu_dest;
 
-	cpu_dest = cpu_check_affinity(irq, dest);
+	cpu_dest = cpu_check_affinity(d->irq, dest);
 	if (cpu_dest < 0)
 		return -1;
 
-	cpumask_copy(irq_desc[irq].affinity, dest);
+	cpumask_copy(d->affinity, dest);
 
 	return 0;
 }
 #endif
 
 static struct irq_chip cpu_interrupt_type = {
-	.name		= "CPU",
-	.mask		= cpu_mask_irq,
-	.unmask		= cpu_unmask_irq,
-	.ack		= cpu_ack_irq,
-	.eoi		= cpu_eoi_irq,
+	.name			= "CPU",
+	.irq_mask		= cpu_mask_irq,
+	.irq_unmask		= cpu_unmask_irq,
+	.irq_ack		= cpu_ack_irq,
+	.irq_eoi		= cpu_eoi_irq,
 #ifdef CONFIG_SMP
-	.set_affinity	= cpu_set_affinity_irq,
+	.irq_set_affinity	= cpu_set_affinity_irq,
 #endif
 	/* XXX: Needs to be written.  We managed without it so far, but
 	 * we really ought to write it.
 	 */
-	.retrigger	= NULL,
+	.irq_retrigger	= NULL,
 };
 
 int show_interrupts(struct seq_file *p, void *v)
@@ -233,14 +240,14 @@ int cpu_claim_irq(unsigned int irq, stru
 {
 	if (irq_desc[irq].action)
 		return -EBUSY;
-	if (irq_desc[irq].chip != &cpu_interrupt_type)
+	if (get_irq_chip(irq) != &cpu_interrupt_type)
 		return -EBUSY;
 
 	/* for iosapic interrupts */
 	if (type) {
 		set_irq_chip_and_handler(irq, type, handle_percpu_irq);
 		set_irq_chip_data(irq, data);
-		cpu_unmask_irq(irq);
+		__cpu_unmask_irq(irq);
 	}
 	return 0;
 }
@@ -289,7 +296,8 @@ int txn_alloc_irq(unsigned int bits_wide
 unsigned long txn_affinity_addr(unsigned int irq, int cpu)
 {
 #ifdef CONFIG_SMP
-	cpumask_copy(irq_desc[irq].affinity, cpumask_of(cpu));
+	struct irq_data *d = get_irq_data(irq);
+	cpumask_copy(d->affinity, cpumask_of(cpu));
 #endif
 
 	return per_cpu(cpu_data, cpu).txn_addr;
@@ -333,6 +341,7 @@ void do_cpu_irq_mask(struct pt_regs *reg
 	unsigned long eirr_val;
 	int irq, cpu = smp_processor_id();
 #ifdef CONFIG_SMP
+	struct irq_desc *desc;
 	cpumask_t dest;
 #endif
 
@@ -346,8 +355,9 @@ void do_cpu_irq_mask(struct pt_regs *reg
 	irq = eirr_to_irq(eirr_val);
 
 #ifdef CONFIG_SMP
-	cpumask_copy(&dest, irq_desc[irq].affinity);
-	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status) &&
+	desc = irq_to_desc(irq);
+	cpumask_copy(&dest, desc->irq_data.affinity);
+	if (CHECK_IRQ_PER_CPU(desc->status) &&
 	    !cpu_isset(smp_processor_id(), dest)) {
 		int cpu = first_cpu(dest);
 
Index: linux-next/drivers/parisc/iosapic.c
===================================================================
--- linux-next.orig/drivers/parisc/iosapic.c
+++ linux-next/drivers/parisc/iosapic.c
@@ -676,7 +676,7 @@ static void iosapic_eoi_irq(unsigned int
 	struct vector_info *vi = get_irq_chip_data(irq);
 
 	iosapic_eoi(vi->eoi_addr, vi->eoi_data);
-	cpu_eoi_irq(irq);
+	cpu_eoi_irq(&irq_desc[irq].irq_data);
 }
 
 #ifdef CONFIG_SMP
@@ -688,7 +688,8 @@ static int iosapic_set_affinity_irq(unsi
 	unsigned long flags;
 	int dest_cpu;
 
-	dest_cpu = cpu_check_affinity(irq, dest);
+	/* Temporary  irq_desc hack */
+	dest_cpu = cpu_check_affinity(&irq_desc[irq].irq_data, dest);
 	if (dest_cpu < 0)
 		return -1;
 
@@ -711,7 +712,7 @@ static struct irq_chip iosapic_interrupt
 	.name	=	"IO-SAPIC-level",
 	.unmask	=	iosapic_unmask_irq,
 	.mask	=	iosapic_mask_irq,
-	.ack	=	cpu_ack_irq,
+	.irq_ack	=	cpu_ack_irq,
 	.eoi	=	iosapic_eoi_irq,
 #ifdef CONFIG_SMP
 	.set_affinity =	iosapic_set_affinity_irq,


