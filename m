From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 2/2] parisc: Convert irq namespace
Date: Fri, 25 Mar 2011 13:40:16 -0000
Message-ID: <20110325133952.979442989@linutronix.de>
References: <20110325133845.830304772@linutronix.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Convert to the new function names. Scripted with coccinelle.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/irq.c |   12 ++++++------
 drivers/parisc/eisa.c    |    2 +-
 drivers/parisc/gsc.c     |    4 ++--
 drivers/parisc/superio.c |    3 ++-
 4 files changed, 11 insertions(+), 10 deletions(-)

Index: linux-2.6-tip/arch/parisc/kernel/irq.c
===================================================================
--- linux-2.6-tip.orig/arch/parisc/kernel/irq.c
+++ linux-2.6-tip/arch/parisc/kernel/irq.c
@@ -235,13 +235,13 @@ int cpu_claim_irq(unsigned int irq, stru
 {
 	if (irq_desc[irq].action)
 		return -EBUSY;
-	if (get_irq_chip(irq) != &cpu_interrupt_type)
+	if (irq_get_chip(irq) != &cpu_interrupt_type)
 		return -EBUSY;
 
 	/* for iosapic interrupts */
 	if (type) {
-		set_irq_chip_and_handler(irq, type, handle_percpu_irq);
-		set_irq_chip_data(irq, data);
+		irq_set_chip_and_handler(irq, type, handle_percpu_irq);
+		irq_set_chip_data(irq, data);
 		__cpu_unmask_irq(irq);
 	}
 	return 0;
@@ -393,14 +393,14 @@ static void claim_cpu_irqs(void)
 {
 	int i;
 	for (i = CPU_IRQ_BASE; i <= CPU_IRQ_MAX; i++) {
-		set_irq_chip_and_handler(i, &cpu_interrupt_type,
+		irq_set_chip_and_handler(i, &cpu_interrupt_type,
 					 handle_percpu_irq);
 	}
 
-	set_irq_handler(TIMER_IRQ, handle_percpu_irq);
+	irq_set_handler(TIMER_IRQ, handle_percpu_irq);
 	setup_irq(TIMER_IRQ, &timer_action);
 #ifdef CONFIG_SMP
-	set_irq_handler(IPI_IRQ, handle_percpu_irq);
+	irq_set_handler(IPI_IRQ, handle_percpu_irq);
 	setup_irq(IPI_IRQ, &ipi_action);
 #endif
 }
Index: linux-2.6-tip/drivers/parisc/eisa.c
===================================================================
--- linux-2.6-tip.orig/drivers/parisc/eisa.c
+++ linux-2.6-tip/drivers/parisc/eisa.c
@@ -340,7 +340,7 @@ static int __init eisa_probe(struct pari
 	/* Reserve IRQ2 */
 	setup_irq(2, &irq2_action);
 	for (i = 0; i < 16; i++) {
-		set_irq_chip_and_handler(i, &eisa_interrupt_type,
+		irq_set_chip_and_handler(i, &eisa_interrupt_type,
 					 handle_simple_irq);
 	}
 	
Index: linux-2.6-tip/drivers/parisc/gsc.c
===================================================================
--- linux-2.6-tip.orig/drivers/parisc/gsc.c
+++ linux-2.6-tip/drivers/parisc/gsc.c
@@ -152,8 +152,8 @@ int gsc_assign_irq(struct irq_chip *type
 	if (irq > GSC_IRQ_MAX)
 		return NO_IRQ;
 
-	set_irq_chip_and_handler(irq, type, handle_simple_irq);
-	set_irq_chip_data(irq, data);
+	irq_set_chip_and_handler(irq, type, handle_simple_irq);
+	irq_set_chip_data(irq, data);
 
 	return irq++;
 }
Index: linux-2.6-tip/drivers/parisc/superio.c
===================================================================
--- linux-2.6-tip.orig/drivers/parisc/superio.c
+++ linux-2.6-tip/drivers/parisc/superio.c
@@ -355,7 +355,8 @@ int superio_fixup_irq(struct pci_dev *pc
 #endif
 
 	for (i = 0; i < 16; i++) {
-		set_irq_chip_and_handler(i, &superio_interrupt_type, handle_simple_irq);
+		irq_set_chip_and_handler(i, &superio_interrupt_type,
+					 handle_simple_irq);
 	}
 
 	/*


