From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 3/8] parisc: Convert eisa irq_chip to new functions
Date: Sun, 06 Feb 2011 20:45:56 -0000
Message-ID: <20110206204510.631074663@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/parisc/eisa.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

Index: linux-next/drivers/parisc/eisa.c
===================================================================
--- linux-next.orig/drivers/parisc/eisa.c
+++ linux-next/drivers/parisc/eisa.c
@@ -144,8 +144,9 @@ static unsigned int eisa_irq_level __rea
 
 
 /* called by free irq */
-static void eisa_mask_irq(unsigned int irq)
+static void eisa_mask_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	unsigned long flags;
 
 	EISA_DBG("disable irq %d\n", irq);
@@ -164,8 +165,9 @@ static void eisa_mask_irq(unsigned int i
 }
 
 /* called by request irq */
-static void eisa_unmask_irq(unsigned int irq)
+static void eisa_unmask_irq(struct irq_data *d)
 {
+	unsigned int irq = d->irq;
 	unsigned long flags;
 	EISA_DBG("enable irq %d\n", irq);
 		
@@ -183,9 +185,9 @@ static void eisa_unmask_irq(unsigned int
 }
 
 static struct irq_chip eisa_interrupt_type = {
-	.name	=	"EISA",
-	.unmask	=	eisa_unmask_irq,
-	.mask	=	eisa_mask_irq,
+	.name		=	"EISA",
+	.irq_unmask	=	eisa_unmask_irq,
+	.irq_mask	=	eisa_mask_irq,
 };
 
 static irqreturn_t eisa_irq(int wax_irq, void *intr_dev)


