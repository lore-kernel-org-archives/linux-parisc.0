From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] [PATCH] make parisc interrupts nest properly
Date: Mon, 04 Sep 2006 12:32:23 -0500
Message-ID: <1157391143.3513.23.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Linux is designed so that one interrupt can be interrupted by another
(but not by itself).  The idea behind this is to help reduce latency.
Parisc interrupts have never allowed nesting.  We physically disable all
interrupts in the eiem register before entering interrupt handlers, so
even if the handler enables interrupts, nothing ever fires.

I won't apply this until we've got the timers sorted out, because it
will only complicate things (also note that the timer interrupts are
IRQF_DISABLED, so we're guaranteed not to take any interrupts in them
until local_irq_enable() is called).

James

Index: parisc-2.6/arch/parisc/kernel/irq.c
===================================================================
--- parisc-2.6.orig/arch/parisc/kernel/irq.c	2006-09-03 21:06:41.000000000 -0700
+++ parisc-2.6/arch/parisc/kernel/irq.c	2006-09-04 08:10:47.000000000 -0700
@@ -45,6 +45,17 @@
 */
 static volatile unsigned long cpu_eiem = 0;
 
+/*
+** ack bitmap ... habitually set to 1, but reset to zero
+** between ->ack() and ->end() of the interrupt to prevent
+** re-interruption of a processing interrupt.
+*/
+static volatile unsigned long global_ack_eiem = ~0UL;
+/*
+** Local bitmap, same as above but for per-cpu interrupts
+*/
+static DEFINE_PER_CPU(unsigned long, local_ack_eiem) = ~0UL;
+
 static void cpu_disable_irq(unsigned int irq)
 {
 	unsigned long eirr_bit = EIEM_MASK(irq);
@@ -62,13 +73,6 @@
 
 	cpu_eiem |= eirr_bit;
 
-	/* FIXME: while our interrupts aren't nested, we cannot reset
-	 * the eiem mask if we're already in an interrupt.  Once we
-	 * implement nested interrupts, this can go away
-	 */
-	if (!in_interrupt())
-		set_eiem(cpu_eiem);
-
 	/* This is just a simple NOP IPI.  But what it does is cause
 	 * all the other CPUs to do a set_eiem(cpu_eiem) at the end
 	 * of the interrupt handler */
@@ -84,13 +88,46 @@
 void no_ack_irq(unsigned int irq) { }
 void no_end_irq(unsigned int irq) { }
 
+void cpu_ack_irq(unsigned int irq)
+{
+	unsigned long mask = EIEM_MASK(irq);
+	int cpu = smp_processor_id();
+
+	/* Clear in EIEM so we can no longer process */
+	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status))
+		per_cpu(local_ack_eiem, cpu) &= ~mask;
+	else
+		global_ack_eiem &= ~mask;
+
+	/* disable the interrupt */
+	set_eiem(cpu_eiem & global_ack_eiem & per_cpu(local_ack_eiem, cpu));
+	/* and now ack it */
+	mtctl(mask, 23);
+}
+
+void cpu_end_irq(unsigned int irq)
+{
+	unsigned long mask = EIEM_MASK(irq);
+	int cpu = smp_processor_id();
+
+	/* set it in the eiems---it's no longer in process */
+	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status))
+		per_cpu(local_ack_eiem, cpu) |= mask;
+	else
+		global_ack_eiem |= mask;
+
+	/* enable the interrupt */
+	set_eiem(cpu_eiem & global_ack_eiem & per_cpu(local_ack_eiem, cpu));
+}
+
+
 #ifdef CONFIG_SMP
 int cpu_check_affinity(unsigned int irq, cpumask_t *dest)
 {
 	int cpu_dest;
 
 	/* timer and ipi have to always be received on all CPUs */
-	if (irq == TIMER_IRQ || irq == IPI_IRQ) {
+	if (CHECK_IRQ_PER_CPU(irq)) {
 		/* Bad linux design decision.  The mask has already
 		 * been set; we must reset it */
 		irq_desc[irq].affinity = CPU_MASK_ALL;
@@ -119,8 +156,8 @@
 	.shutdown	= cpu_disable_irq,
 	.enable		= cpu_enable_irq,
 	.disable	= cpu_disable_irq,
-	.ack		= no_ack_irq,
-	.end		= no_end_irq,
+	.ack		= cpu_ack_irq,
+	.end		= cpu_end_irq,
 #ifdef CONFIG_SMP
 	.set_affinity	= cpu_set_affinity_irq,
 #endif
@@ -298,82 +335,69 @@
 	return virt_irq - CPU_IRQ_BASE;
 }
 
+static inline int eirr_to_irq(unsigned long eirr)
+{
+#ifdef CONFIG_64BIT
+	int bit = fls64(eirr);
+#else
+	int bit = fls(eirr);
+#endif
+	return (BITS_PER_LONG - bit) + TIMER_IRQ;
+}
+
 /* ONLY called from entry.S:intr_extint() */
 void do_cpu_irq_mask(struct pt_regs *regs)
 {
 	unsigned long eirr_val;
-
-	irq_enter();
-
-	/*
-	 * Don't allow TIMER or IPI nested interrupts.
-	 * Allowing any single interrupt to nest can lead to that CPU
-	 * handling interrupts with all enabled interrupts unmasked.
-	 */
-	set_eiem(0UL);
-
-	/* 1) only process IRQs that are enabled/unmasked (cpu_eiem)
-	 * 2) We loop here on EIRR contents in order to avoid
-	 *    nested interrupts or having to take another interrupt
-	 *    when we could have just handled it right away.
-	 */
-	for (;;) {
-		unsigned long bit = (1UL << (BITS_PER_LONG - 1));
-		unsigned int irq;
-		eirr_val = mfctl(23) & cpu_eiem;
-		if (!eirr_val)
-			break;
-
-		mtctl(eirr_val, 23); /* reset bits we are going to process */
-
-		/* Work our way from MSb to LSb...same order we alloc EIRs */
-		for (irq = TIMER_IRQ; eirr_val && bit; bit>>=1, irq++) {
+	int irq, cpu = smp_processor_id();
 #ifdef CONFIG_SMP
-			cpumask_t dest = irq_desc[irq].affinity;
+	cpumask_t dest;
 #endif
-			if (!(bit & eirr_val))
-				continue;
 
-			/* clear bit in mask - can exit loop sooner */
-			eirr_val &= ~bit;
+	local_irq_disable();
+	irq_enter();
 
-#ifdef CONFIG_SMP
-			/* FIXME: because generic set affinity mucks
-			 * with the affinity before sending it to us
-			 * we can get the situation where the affinity is
-			 * wrong for our CPU type interrupts */
-			if (irq != TIMER_IRQ && irq != IPI_IRQ &&
-			    !cpu_isset(smp_processor_id(), dest)) {
-				int cpu = first_cpu(dest);
-
-				printk(KERN_DEBUG "redirecting irq %d from CPU %d to %d\n",
-				       irq, smp_processor_id(), cpu);
-				gsc_writel(irq + CPU_IRQ_BASE,
-					   cpu_data[cpu].hpa);
-				continue;
-			}
-#endif
+	eirr_val = mfctl(23) & cpu_eiem & global_ack_eiem &
+		per_cpu(local_ack_eiem, cpu);
+	if (!eirr_val)
+		goto set_out;
+	irq = eirr_to_irq(eirr_val);
 
-			__do_IRQ(irq, regs);
-		}
+#ifdef CONFIG_SMP
+	dest = irq_desc[irq].affinity;
+	if (CHECK_IRQ_PER_CPU(irq_desc[irq].status) &&
+	    !cpu_isset(smp_processor_id(), dest)) {
+		int cpu = first_cpu(dest);
+
+		printk(KERN_DEBUG "redirecting irq %d from CPU %d to %d\n",
+		       irq, smp_processor_id(), cpu);
+		gsc_writel(irq + CPU_IRQ_BASE,
+			   cpu_data[cpu].hpa);
+		goto set_out;
 	}
+#endif
+	__do_IRQ(irq, regs);
 
-	set_eiem(cpu_eiem);	/* restore original mask */
+ out:
 	irq_exit();
-}
+	return;
 
+ set_out:
+	set_eiem(cpu_eiem & global_ack_eiem & per_cpu(local_ack_eiem, cpu));
+	goto out;
+}
 
 static struct irqaction timer_action = {
 	.handler = timer_interrupt,
 	.name = "timer",
-	.flags = IRQF_DISABLED,
+	.flags = IRQF_DISABLED | IRQF_TIMER | IRQF_PERCPU,
 };
 
 #ifdef CONFIG_SMP
 static struct irqaction ipi_action = {
 	.handler = ipi_interrupt,
 	.name = "IPI",
-	.flags = IRQF_DISABLED,
+	.flags = IRQF_DISABLED | IRQF_PERCPU,
 };
 #endif
 
Index: parisc-2.6/drivers/parisc/iosapic.c
===================================================================
--- parisc-2.6.orig/drivers/parisc/iosapic.c	2006-09-03 21:06:42.000000000 -0700
+++ parisc-2.6/drivers/parisc/iosapic.c	2006-09-03 21:11:00.000000000 -0700
@@ -692,6 +692,7 @@
 	DBG(KERN_DEBUG "end_irq(%d): eoi(%p, 0x%x)\n", irq,
 			vi->eoi_addr, vi->eoi_data);
 	iosapic_eoi(vi->eoi_addr, vi->eoi_data);
+	cpu_end_irq(irq);
 }
 
 static unsigned int iosapic_startup_irq(unsigned int irq)
@@ -728,7 +729,7 @@
 	.shutdown =	iosapic_disable_irq,
 	.enable =	iosapic_enable_irq,
 	.disable =	iosapic_disable_irq,
-	.ack =		no_ack_irq,
+	.ack =		cpu_ack_irq,
 	.end =		iosapic_end_irq,
 #ifdef CONFIG_SMP
 	.set_affinity =	iosapic_set_affinity_irq,
Index: parisc-2.6/include/asm-parisc/irq.h
===================================================================
--- parisc-2.6.orig/include/asm-parisc/irq.h	2006-09-03 21:06:43.000000000 -0700
+++ parisc-2.6/include/asm-parisc/irq.h	2006-09-03 21:11:00.000000000 -0700
@@ -39,6 +39,8 @@
  */
 void no_ack_irq(unsigned int irq);
 void no_end_irq(unsigned int irq);
+void cpu_ack_irq(unsigned int irq);
+void cpi_end_irq(unsigned int irq);
 
 extern int txn_alloc_irq(unsigned int nbits);
 extern int txn_claim_irq(int);


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
