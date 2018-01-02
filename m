From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show unhashed HPA of Dino chip
Date: Tue, 2 Jan 2018 20:45:42 +0100
Message-ID: <20180102194542.GA27739@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fixes: ad67b74d2469d9b8 ("printk: hash addresses printed with %p")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 0b3fb99d9b89..7390fb8ca9d1 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -303,7 +303,7 @@ static void dino_mask_irq(struct irq_data *d)
 	struct dino_device *dino_dev = irq_data_get_irq_chip_data(d);
 	int local_irq = gsc_find_local_irq(d->irq, dino_dev->global_irq, DINO_LOCAL_IRQS);
 
-	DBG(KERN_WARNING "%s(0x%p, %d)\n", __func__, dino_dev, d->irq);
+	DBG(KERN_WARNING "%s(0x%px, %d)\n", __func__, dino_dev, d->irq);
 
 	/* Clear the matching bit in the IMR register */
 	dino_dev->imr &= ~(DINO_MASK_IRQ(local_irq));
@@ -316,7 +316,7 @@ static void dino_unmask_irq(struct irq_data *d)
 	int local_irq = gsc_find_local_irq(d->irq, dino_dev->global_irq, DINO_LOCAL_IRQS);
 	u32 tmp;
 
-	DBG(KERN_WARNING "%s(0x%p, %d)\n", __func__, dino_dev, d->irq);
+	DBG(KERN_WARNING "%s(0x%px, %d)\n", __func__, dino_dev, d->irq);
 
 	/*
 	** clear pending IRQ bits
@@ -396,7 +396,7 @@ static irqreturn_t dino_isr(int irq, void *intr_dev)
 	if (mask) {
 		if (--ilr_loop > 0)
 			goto ilr_again;
-		printk(KERN_ERR "Dino 0x%p: stuck interrupt %d\n", 
+		printk(KERN_ERR "Dino 0x%px: stuck interrupt %d\n",
 		       dino_dev->hba.base_addr, mask);
 		return IRQ_NONE;
 	}
@@ -553,7 +553,7 @@ dino_fixup_bus(struct pci_bus *bus)
         struct pci_dev *dev;
         struct dino_device *dino_dev = DINO_DEV(parisc_walk_tree(bus->bridge));
 
-	DBG(KERN_WARNING "%s(0x%p) bus %d platform_data 0x%p\n",
+	DBG(KERN_WARNING "%s(0x%px) bus %d platform_data 0x%px\n",
 	    __func__, bus, bus->busn_res.start,
 	    bus->bridge->platform_data);
 
@@ -854,7 +854,7 @@ static int __init dino_common_init(struct parisc_device *dev,
 	res->flags = IORESOURCE_IO; /* do not mark it busy ! */
 	if (request_resource(&ioport_resource, res) < 0) {
 		printk(KERN_ERR "%s: request I/O Port region failed "
-		       "0x%lx/%lx (hpa 0x%p)\n",
+		       "0x%lx/%lx (hpa 0x%px)\n",
 		       name, (unsigned long)res->start, (unsigned long)res->end,
 		       dino_dev->hba.base_addr);
 		return 1;
