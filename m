From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 5/8] parisc: Convert iosapic irq_chip to new functions
Date: Sun, 06 Feb 2011 20:46:01 -0000
Message-ID: <20110206204510.827438960@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/parisc/iosapic.c |   37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

Index: linux-next/drivers/parisc/iosapic.c
===================================================================
--- linux-next.orig/drivers/parisc/iosapic.c
+++ linux-next/drivers/parisc/iosapic.c
@@ -615,10 +615,10 @@ iosapic_set_irt_data( struct vector_info
 }
 
 
-static void iosapic_mask_irq(unsigned int irq)
+static void iosapic_mask_irq(struct irq_data *d)
 {
 	unsigned long flags;
-	struct vector_info *vi = get_irq_chip_data(irq);
+	struct vector_info *vi = irq_data_get_irq_chip_data(d);
 	u32 d0, d1;
 
 	spin_lock_irqsave(&iosapic_lock, flags);
@@ -628,9 +628,9 @@ static void iosapic_mask_irq(unsigned in
 	spin_unlock_irqrestore(&iosapic_lock, flags);
 }
 
-static void iosapic_unmask_irq(unsigned int irq)
+static void iosapic_unmask_irq(struct irq_data *d)
 {
-	struct vector_info *vi = get_irq_chip_data(irq);
+	struct vector_info *vi = irq_data_get_irq_chip_data(d);
 	u32 d0, d1;
 
 	/* data is initialized by fixup_irq */
@@ -666,34 +666,33 @@ printk("\n");
 	 * enables their IRQ. It can lead to "interesting" race conditions
 	 * in the driver initialization sequence.
 	 */
-	DBG(KERN_DEBUG "enable_irq(%d): eoi(%p, 0x%x)\n", irq,
+	DBG(KERN_DEBUG "enable_irq(%d): eoi(%p, 0x%x)\n", d->irq,
 			vi->eoi_addr, vi->eoi_data);
 	iosapic_eoi(vi->eoi_addr, vi->eoi_data);
 }
 
-static void iosapic_eoi_irq(unsigned int irq)
+static void iosapic_eoi_irq(struct irq_data *d)
 {
-	struct vector_info *vi = get_irq_chip_data(irq);
+	struct vector_info *vi = irq_data_get_irq_chip_data(d);
 
 	iosapic_eoi(vi->eoi_addr, vi->eoi_data);
-	cpu_eoi_irq(&irq_desc[irq].irq_data);
+	cpu_eoi_irq(d);
 }
 
 #ifdef CONFIG_SMP
-static int iosapic_set_affinity_irq(unsigned int irq,
-				     const struct cpumask *dest)
+static int iosapic_set_affinity_irq(struct irq_data *d,
+				    const struct cpumask *dest, bool force)
 {
-	struct vector_info *vi = get_irq_chip_data(irq);
+	struct vector_info *vi = irq_data_get_irq_chip_data(d);
 	u32 d0, d1, dummy_d0;
 	unsigned long flags;
 	int dest_cpu;
 
-	/* Temporary  irq_desc hack */
-	dest_cpu = cpu_check_affinity(&irq_desc[irq].irq_data, dest);
+	dest_cpu = cpu_check_affinity(d, dest);
 	if (dest_cpu < 0)
 		return -1;
 
-	cpumask_copy(irq_desc[irq].affinity, cpumask_of(dest_cpu));
+	cpumask_copy(d->affinity, cpumask_of(dest_cpu));
 	vi->txn_addr = txn_affinity_addr(irq, dest_cpu);
 
 	spin_lock_irqsave(&iosapic_lock, flags);
@@ -709,13 +708,13 @@ static int iosapic_set_affinity_irq(unsi
 #endif
 
 static struct irq_chip iosapic_interrupt_type = {
-	.name	=	"IO-SAPIC-level",
-	.unmask	=	iosapic_unmask_irq,
-	.mask	=	iosapic_mask_irq,
+	.name		=	"IO-SAPIC-level",
+	.irq_unmask	=	iosapic_unmask_irq,
+	.irq_mask	=	iosapic_mask_irq,
 	.irq_ack	=	cpu_ack_irq,
-	.eoi	=	iosapic_eoi_irq,
+	.irq_eoi	=	iosapic_eoi_irq,
 #ifdef CONFIG_SMP
-	.set_affinity =	iosapic_set_affinity_irq,
+	.irq_set_affinity =	iosapic_set_affinity_irq,
 #endif
 };
 


