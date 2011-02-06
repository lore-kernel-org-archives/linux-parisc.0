From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 6/8] parisc: Convert superio irq_chip to new functions
Date: Sun, 06 Feb 2011 20:46:03 -0000
Message-ID: <20110206204510.925278920@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/parisc/superio.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

Index: linux-next/drivers/parisc/superio.c
===================================================================
--- linux-next.orig/drivers/parisc/superio.c
+++ linux-next/drivers/parisc/superio.c
@@ -286,8 +286,9 @@ superio_init(struct pci_dev *pcidev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_LIO, superio_init);
 
-static void superio_mask_irq(unsigned int irq)
+static void superio_mask_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	u8 r8;
 
 	if ((irq < 1) || (irq == 2) || (irq > 7)) {
@@ -303,8 +304,9 @@ static void superio_mask_irq(unsigned in
 	outb (r8,IC_PIC1+1);
 }
 
-static void superio_unmask_irq(unsigned int irq)
+static void superio_unmask_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	u8 r8;
 
 	if ((irq < 1) || (irq == 2) || (irq > 7)) {
@@ -320,9 +322,9 @@ static void superio_unmask_irq(unsigned 
 }
 
 static struct irq_chip superio_interrupt_type = {
-	.name	=	SUPERIO,
-	.unmask	=	superio_unmask_irq,
-	.mask	=	superio_mask_irq,
+	.name		=	SUPERIO,
+	.irq_unmask	=	superio_unmask_irq,
+	.irq_mask	=	superio_mask_irq,
 };
 
 #ifdef DEBUG_SUPERIO_INIT


