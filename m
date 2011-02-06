From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 4/8] parisc: Convert gsc irq_chip to new functions
Date: Sun, 06 Feb 2011 20:45:59 -0000
Message-ID: <20110206204510.728128167@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/parisc/gsc.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

Index: linux-next/drivers/parisc/gsc.c
===================================================================
--- linux-next.orig/drivers/parisc/gsc.c
+++ linux-next/drivers/parisc/gsc.c
@@ -105,13 +105,13 @@ int gsc_find_local_irq(unsigned int irq,
 	return NO_IRQ;
 }
 
-static void gsc_asic_mask_irq(unsigned int irq)
+static void gsc_asic_mask_irq(struct irq_data *d)
 {
-	struct gsc_asic *irq_dev = get_irq_chip_data(irq);
-	int local_irq = gsc_find_local_irq(irq, irq_dev->global_irq, 32);
+	struct gsc_asic *irq_dev = irq_data_get_irq_chip_data(d);
+	int local_irq = gsc_find_local_irq(d->irq, irq_dev->global_irq, 32);
 	u32 imr;
 
-	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __func__, irq,
+	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __func__, d->irq,
 			irq_dev->name, imr);
 
 	/* Disable the IRQ line by clearing the bit in the IMR */
@@ -120,13 +120,13 @@ static void gsc_asic_mask_irq(unsigned i
 	gsc_writel(imr, irq_dev->hpa + OFFSET_IMR);
 }
 
-static void gsc_asic_unmask_irq(unsigned int irq)
+static void gsc_asic_unmask_irq(struct irq_data *d)
 {
-	struct gsc_asic *irq_dev = get_irq_chip_data(irq);
-	int local_irq = gsc_find_local_irq(irq, irq_dev->global_irq, 32);
+	struct gsc_asic *irq_dev = irq_data_get_irq_chip_data(d);
+	int local_irq = gsc_find_local_irq(d->irq, irq_dev->global_irq, 32);
 	u32 imr;
 
-	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __func__, irq,
+	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __func__, d->irq,
 			irq_dev->name, imr);
 
 	/* Enable the IRQ line by setting the bit in the IMR */
@@ -140,9 +140,9 @@ static void gsc_asic_unmask_irq(unsigned
 }
 
 static struct irq_chip gsc_asic_interrupt_type = {
-	.name	=	"GSC-ASIC",
-	.unmask	=	gsc_asic_unmask_irq,
-	.mask	=	gsc_asic_mask_irq,
+	.name		=	"GSC-ASIC",
+	.irq_unmask	=	gsc_asic_unmask_irq,
+	.irq_mask	=	gsc_asic_mask_irq,
 };
 
 int gsc_assign_irq(struct irq_chip *type, void *data)


