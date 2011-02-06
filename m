From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 2/8] parisc: Convert dino irq_chip to new functions
Date: Sun, 06 Feb 2011 20:45:54 -0000
Message-ID: <20110206204510.522509865@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/parisc/dino.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

Index: linux-next/drivers/parisc/dino.c
===================================================================
--- linux-next.orig/drivers/parisc/dino.c
+++ linux-next/drivers/parisc/dino.c
@@ -296,25 +296,25 @@ static struct pci_port_ops dino_port_ops
 	.outl	= dino_out32
 };
 
-static void dino_mask_irq(unsigned int irq)
+static void dino_mask_irq(struct irq_data *d)
 {
-	struct dino_device *dino_dev = get_irq_chip_data(irq);
-	int local_irq = gsc_find_local_irq(irq, dino_dev->global_irq, DINO_LOCAL_IRQS);
+	struct dino_device *dino_dev = irq_data_get_irq_chip_data(d);
+	int local_irq = gsc_find_local_irq(d->irq, dino_dev->global_irq, DINO_LOCAL_IRQS);
 
-	DBG(KERN_WARNING "%s(0x%p, %d)\n", __func__, dino_dev, irq);
+	DBG(KERN_WARNING "%s(0x%p, %d)\n", __func__, dino_dev, d->irq);
 
 	/* Clear the matching bit in the IMR register */
 	dino_dev->imr &= ~(DINO_MASK_IRQ(local_irq));
 	__raw_writel(dino_dev->imr, dino_dev->hba.base_addr+DINO_IMR);
 }
 
-static void dino_unmask_irq(unsigned int irq)
+static void dino_unmask_irq(struct irq_data *d)
 {
-	struct dino_device *dino_dev = get_irq_chip_data(irq);
-	int local_irq = gsc_find_local_irq(irq, dino_dev->global_irq, DINO_LOCAL_IRQS);
+	struct dino_device *dino_dev = irq_data_get_irq_chip_data(d);
+	int local_irq = gsc_find_local_irq(d->irq, dino_dev->global_irq, DINO_LOCAL_IRQS);
 	u32 tmp;
 
-	DBG(KERN_WARNING "%s(0x%p, %d)\n", __func__, dino_dev, irq);
+	DBG(KERN_WARNING "%s(0x%p, %d)\n", __func__, dino_dev, d->irq);
 
 	/*
 	** clear pending IRQ bits
@@ -346,9 +346,9 @@ static void dino_unmask_irq(unsigned int
 }
 
 static struct irq_chip dino_interrupt_type = {
-	.name	= "GSC-PCI",
-	.unmask	= dino_unmask_irq,
-	.mask	= dino_mask_irq,
+	.name		= "GSC-PCI",
+	.irq_unmask	= dino_unmask_irq,
+	.irq_mask	= dino_mask_irq,
 };
 
 


