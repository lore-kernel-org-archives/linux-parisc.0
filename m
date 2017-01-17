From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH v1] parisc : eisa :- Remove coding style error.
Date: Tue, 17 Jan 2017 13:35:03 +0530
Message-ID: <1484640303-16456-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch removes coding style errors.
- ERROR: space prohibited before that close parenthesis ')'
- ERROR: code indent should use tabs where possible
- ERROR: space required after that ',' (ctx:VxV)
- ERROR: trailing whitespace

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/parisc/eisa.c | 104 +++++++++++++++++++++++++-------------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/parisc/eisa.c b/drivers/parisc/eisa.c
index 103095b..59edee9 100644
--- a/drivers/parisc/eisa.c
+++ b/drivers/parisc/eisa.c
@@ -14,16 +14,16 @@
  * Wax ASIC also includes a PS/2 and RS-232 controller, but those are
  * dealt with elsewhere; this file is concerned only with the EISA portions
  * of Wax.
- * 
- * 
+ *
+ *
  * HINT:
  * -----
  * To allow an ISA card to work properly in the EISA slot you need to
- * set an edge trigger level. This may be done on the palo command line 
- * by adding the kernel parameter "eisa_irq_edge=n,n2,[...]]", with 
+ * set an edge trigger level. This may be done on the palo command line
+ * by adding the kernel parameter "eisa_irq_edge=n,n2,[...]]", with
  * n and n2 as the irq levels you want to use.
- * 
- * Example: "eisa_irq_edge=10,11" allows ISA cards to operate at 
+ *
+ * Example: "eisa_irq_edge=10,11" allows ISA cards to operate at
  * irq levels 10 and 11.
  */
 
@@ -46,9 +46,9 @@
 #include <asm/eisa_eeprom.h>
 
 #if 0
-#define EISA_DBG(msg, arg... ) printk(KERN_DEBUG "eisa: " msg , ## arg )
+#define EISA_DBG(msg, arg...) printk(KERN_DEBUG "eisa: " msg, ## arg)
 #else
-#define EISA_DBG(msg, arg... )  
+#define EISA_DBG(msg, arg...)
 #endif
 
 #define SNAKES_EEPROM_BASE_ADDR 0xF0810400
@@ -108,7 +108,7 @@ void eisa_out8(unsigned char data, unsigned short port)
 
 void eisa_out16(unsigned short data, unsigned short port)
 {
-	if (EISA_bus)	
+	if (EISA_bus)
 		gsc_writew(cpu_to_le16(data), eisa_permute(port));
 }
 
@@ -135,9 +135,9 @@ void eisa_out32(unsigned int data, unsigned short port)
 static int slave_mask;
 
 /* the trig level can be set with the
- * eisa_irq_edge=n,n,n commandline parameter 
- * We should really read this from the EEPROM 
- * in the furure. 
+ * eisa_irq_edge=n,n,n commandline parameter
+ * We should really read this from the EEPROM
+ * in the furure.
  */
 /* irq 13,8,2,1,0 must be edge */
 static unsigned int eisa_irq_level __read_mostly; /* default to edge triggered */
@@ -170,7 +170,7 @@ static void eisa_unmask_irq(struct irq_data *d)
 	unsigned int irq = d->irq;
 	unsigned long flags;
 	EISA_DBG("enable irq %d\n", irq);
-		
+
 	spin_lock_irqsave(&eisa_irq_lock, flags);
         if (irq & 8) {
 		slave_mask &= ~(1 << (irq&7));
@@ -194,7 +194,7 @@ static irqreturn_t eisa_irq(int wax_irq, void *intr_dev)
 {
 	int irq = gsc_readb(0xfc01f000); /* EISA supports 16 irqs */
 	unsigned long flags;
-        
+
 	spin_lock_irqsave(&eisa_irq_lock, flags);
 	/* read IRR command */
 	eisa_out8(0x0a, 0x20);
@@ -202,31 +202,31 @@ static irqreturn_t eisa_irq(int wax_irq, void *intr_dev)
 
 	EISA_DBG("irq IAR %02x 8259-1 irr %02x 8259-2 irr %02x\n",
 		   irq, eisa_in8(0x20), eisa_in8(0xa0));
-   
+
 	/* read ISR command */
 	eisa_out8(0x0a, 0x20);
 	eisa_out8(0x0a, 0xa0);
 	EISA_DBG("irq 8259-1 isr %02x imr %02x 8259-2 isr %02x imr %02x\n",
 		 eisa_in8(0x20), eisa_in8(0x21), eisa_in8(0xa0), eisa_in8(0xa1));
-	
+
 	irq &= 0xf;
-	
+
 	/* mask irq and write eoi */
 	if (irq & 8) {
 		slave_mask |= (1 << (irq&7));
 		eisa_out8(slave_mask, 0xa1);
 		eisa_out8(0x60 | (irq&7),0xa0);/* 'Specific EOI' to slave */
-		eisa_out8(0x62,0x20);	/* 'Specific EOI' to master-IRQ2 */
-		
+		eisa_out8(0x62, 0x20);	/* 'Specific EOI' to master-IRQ2 */
+
 	} else {
 		master_mask |= (1 << (irq&7));
 		eisa_out8(master_mask, 0x21);
-		eisa_out8(0x60|irq,0x20);	/* 'Specific EOI' to master */
+		eisa_out8(0x60|irq, 0x20);	/* 'Specific EOI' to master */
 	}
 	spin_unlock_irqrestore(&eisa_irq_lock, flags);
 
 	generic_handle_irq(irq);
-   
+
 	spin_lock_irqsave(&eisa_irq_lock, flags);
 	/* unmask */
         if (irq & 8) {
@@ -254,44 +254,44 @@ static irqreturn_t dummy_irq2_handler(int _, void *dev)
 static void init_eisa_pic(void)
 {
 	unsigned long flags;
-	
+
 	spin_lock_irqsave(&eisa_irq_lock, flags);
 
 	eisa_out8(0xff, 0x21); /* mask during init */
 	eisa_out8(0xff, 0xa1); /* mask during init */
-	
+
 	/* master pic */
-	eisa_out8(0x11,0x20); /* ICW1 */   
-	eisa_out8(0x00,0x21); /* ICW2 */   
-	eisa_out8(0x04,0x21); /* ICW3 */   
-	eisa_out8(0x01,0x21); /* ICW4 */   
-	eisa_out8(0x40,0x20); /* OCW2 */   
-	
+	eisa_out8(0x11, 0x20); /* ICW1 */
+	eisa_out8(0x00, 0x21); /* ICW2 */
+	eisa_out8(0x04, 0x21); /* ICW3 */
+	eisa_out8(0x01, 0x21); /* ICW4 */
+	eisa_out8(0x40, 0x20); /* OCW2 */
+
 	/* slave pic */
-	eisa_out8(0x11,0xa0); /* ICW1 */   
-	eisa_out8(0x08,0xa1); /* ICW2 */   
-        eisa_out8(0x02,0xa1); /* ICW3 */   
-	eisa_out8(0x01,0xa1); /* ICW4 */   
-	eisa_out8(0x40,0xa0); /* OCW2 */   
-        
+	eisa_out8(0x11, 0xa0); /* ICW1 */
+	eisa_out8(0x08, 0xa1); /* ICW2 */
+	eisa_out8(0x02, 0xa1); /* ICW3 */
+	eisa_out8(0x01, 0xa1); /* ICW4 */
+	eisa_out8(0x40, 0xa0); /* OCW2 */
+
 	udelay(100);
-	
-	slave_mask = 0xff; 
-	master_mask = 0xfb; 
+
+	slave_mask = 0xff;
+	master_mask = 0xfb;
 	eisa_out8(slave_mask, 0xa1); /* OCW1 */
 	eisa_out8(master_mask, 0x21); /* OCW1 */
-	
+
 	/* setup trig level */
 	EISA_DBG("EISA edge/level %04x\n", eisa_irq_level);
-	
+
 	eisa_out8(eisa_irq_level&0xff, 0x4d0); /* Set all irq's to edge  */
-	eisa_out8((eisa_irq_level >> 8) & 0xff, 0x4d1); 
-	
+	eisa_out8((eisa_irq_level >> 8) & 0xff, 0x4d1);
+
 	EISA_DBG("pic0 mask %02x\n", eisa_in8(0x21));
 	EISA_DBG("pic1 mask %02x\n", eisa_in8(0xa1));
 	EISA_DBG("pic0 edge/level %02x\n", eisa_in8(0x4d0));
 	EISA_DBG("pic1 edge/level %02x\n", eisa_in8(0x4d1));
-	
+
 	spin_unlock_irqrestore(&eisa_irq_lock, flags);
 }
 
@@ -305,7 +305,7 @@ static int __init eisa_probe(struct parisc_device *dev)
 
 	char *name = is_mongoose(dev) ? "Mongoose" : "Wax";
 
-	printk(KERN_INFO "%s EISA Adapter found at 0x%08lx\n", 
+	printk(KERN_INFO "%s EISA Adapter found at 0x%08lx\n",
 		name, (unsigned long)dev->hpa.start);
 
 	eisa_dev.hba.dev = dev;
@@ -336,14 +336,14 @@ static int __init eisa_probe(struct parisc_device *dev)
 		printk(KERN_ERR "EISA: request_irq failed!\n");
 		return result;
 	}
-	
+
 	/* Reserve IRQ2 */
 	setup_irq(2, &irq2_action);
 	for (i = 0; i < 16; i++) {
 		irq_set_chip_and_handler(i, &eisa_interrupt_type,
 					 handle_simple_irq);
 	}
-	
+
 	EISA_bus = 1;
 
 	if (dev->num_addrs) {
@@ -375,7 +375,7 @@ static int __init eisa_probe(struct parisc_device *dev)
 			return -1;
 		}
 	}
-	
+
 	return 0;
 }
 
@@ -404,7 +404,7 @@ void eisa_make_irq_level(int num)
 {
 	if (eisa_irq_configured& (1<<num)) {
 		printk(KERN_WARNING
-		       "IRQ %d polarity configured twice (last to level)\n", 
+		       "IRQ %d polarity configured twice (last to level)\n",
 		       num);
 	}
 	eisa_irq_level |= (1<<num); /* set the corresponding bit */
@@ -414,7 +414,7 @@ void eisa_make_irq_level(int num)
 void eisa_make_irq_edge(int num)
 {
 	if (eisa_irq_configured& (1<<num)) {
-		printk(KERN_WARNING 
+		printk(KERN_WARNING
 		       "IRQ %d polarity configured twice (last to edge)\n",
 		       num);
 	}
@@ -430,18 +430,18 @@ static int __init eisa_irq_setup(char *str)
 	EISA_DBG("IRQ setup\n");
 	while (cur != NULL) {
 		char *pe;
-		
+
 		val = (int) simple_strtoul(cur, &pe, 0);
 		if (val > 15 || val < 0) {
 			printk(KERN_ERR "eisa: EISA irq value are 0-15\n");
 			continue;
 		}
-		if (val == 2) { 
+		if (val == 2) {
 			val = 9;
 		}
 		eisa_make_irq_edge(val); /* clear the corresponding bit */
 		EISA_DBG("setting IRQ %d to edge-triggered mode\n", val);
-		
+
 		if ((cur = strchr(cur, ','))) {
 			cur++;
 		} else {
-- 
1.9.1
