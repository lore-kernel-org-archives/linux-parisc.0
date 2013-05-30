From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: parport0: fix this legacy no-device port driver!
Date: Thu, 30 May 2013 23:06:39 +0200
Message-ID: <20130530210639.GA18683@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix the above kernel error from parport_announce_port() on 32bit GSC
machines (e.g. B160L). The parport driver requires now a pointer to the
device struct.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index a5251cb..6e3a60c 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -234,7 +234,7 @@ static int parport_PS2_supported(struct parport *pb)
 
 struct parport *parport_gsc_probe_port(unsigned long base,
 				       unsigned long base_hi, int irq,
-				       int dma, struct pci_dev *dev)
+				       int dma, struct parisc_device *padev)
 {
 	struct parport_gsc_private *priv;
 	struct parport_operations *ops;
@@ -258,7 +258,6 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 	priv->ctr_writable = 0xff;
 	priv->dma_buf = 0;
 	priv->dma_handle = 0;
-	priv->dev = dev;
 	p->base = base;
 	p->base_hi = base_hi;
 	p->irq = irq;
@@ -282,6 +281,7 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 		return NULL;
 	}
 
+	p->dev = &padev->dev;
 	p->base_hi = base_hi;
 	p->modes = tmp.modes;
 	p->size = (p->modes & PARPORT_MODE_EPP)?8:3;
@@ -373,7 +373,7 @@ static int parport_init_chip(struct parisc_device *dev)
 	}
 	
 	p = parport_gsc_probe_port(port, 0, dev->irq,
-			/* PARPORT_IRQ_NONE */ PARPORT_DMA_NONE, NULL);
+			/* PARPORT_IRQ_NONE */ PARPORT_DMA_NONE, dev);
 	if (p)
 		parport_count++;
 	dev_set_drvdata(&dev->dev, p);
diff --git a/drivers/parport/parport_gsc.h b/drivers/parport/parport_gsc.h
index fc9c37c..8122147 100644
--- a/drivers/parport/parport_gsc.h
+++ b/drivers/parport/parport_gsc.h
@@ -217,6 +217,6 @@ extern void parport_gsc_dec_use_count(void);
 extern struct parport *parport_gsc_probe_port(unsigned long base,
 						unsigned long base_hi,
 						int irq, int dma,
-						struct pci_dev *dev);
+						struct parisc_device *padev);
 
 #endif	/* __DRIVERS_PARPORT_PARPORT_GSC_H */
