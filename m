From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] [RFT] Remove {,un}mask_irq()
Date: Mon, 6 Dec 2004 04:10:14 +0000
Message-ID: <20041206041014.GL15450@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


mask_irq/unmask_irq are no longer part of the kernel API.  The only place
we were calling it can be replaced by disable_irq/enable_irq, I think.
Boots fine on my c3600, but it needs testing on lasi/wax/dino machines.

Index: arch/parisc/kernel/irq.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/irq.c,v
retrieving revision 1.17
diff -u -p -r1.17 irq.c
--- arch/parisc/kernel/irq.c	5 Dec 2004 23:38:02 -0000	1.17
+++ arch/parisc/kernel/irq.c	6 Dec 2004 04:02:53 -0000
@@ -85,22 +85,6 @@ static void enable_cpu_irq(void *unused,
         on_each_cpu(cpu_set_eiem, (void *) cpu_eiem, 1, 1);
 }
 
-/* mask and disable are the same at the CPU level
-** Difference is enable clears pending interrupts
-*/
-#define mask_cpu_irq	disable_cpu_irq
-
-static inline void unmask_cpu_irq(void *unused, int irq)
-{
-	unsigned long eirr_bit = EIEM_MASK(irq);
-	cpu_eiem |= eirr_bit;
-	/* NOTE: sending an IPI will cause do_cpu_irq_mask() to
-	** handle *any* unmasked pending interrupts.
-	** ie We don't need to check for pending interrupts here.
-	*/
-        on_each_cpu(cpu_set_eiem, (void *) cpu_eiem, 1, 1);
-}
-
 /*
  * XXX cpu_irq_actions[] will become 2 dimensional for per CPU EIR support.
  * correspond changes needed in:
@@ -126,8 +110,6 @@ struct irq_region cpu0_irq_region = {
 	.ops	= {
 			.disable_irq	= disable_cpu_irq,
 			.enable_irq	= enable_cpu_irq,
-			.mask_irq	= unmask_cpu_irq,
-			.unmask_irq	= unmask_cpu_irq
 	},
 	.data	= {
 			.dev		= &cpu_data[0],
@@ -145,36 +127,10 @@ struct irq_region *irq_region[NR_IRQ_REG
 
 /*
 ** Generic interfaces that device drivers can use:
-**    mask_irq()	block IRQ
-**    unmask_irq()	re-enable IRQ and trigger if IRQ is pending
 **    disable_irq()	block IRQ
 **    enable_irq()	clear pending and re-enable IRQ
 */
 
-void mask_irq(int irq)
-{
-	struct irq_region *region;
-
-	DBG_IRQ(irq, ("mask_irq(%d) %d+%d eiem 0x%lx\n", irq,
-				IRQ_REGION(irq), IRQ_OFFSET(irq), cpu_eiem));
-	irq = irq_canonicalize(irq);
-	region = irq_region[IRQ_REGION(irq)];
-	if (region->ops.mask_irq)
-		region->ops.mask_irq(region->data.dev, IRQ_OFFSET(irq));
-}
-
-void unmask_irq(int irq)
-{
-	struct irq_region *region;
-
-	DBG_IRQ(irq, ("unmask_irq(%d) %d+%d eiem 0x%lx\n", irq,
-				IRQ_REGION(irq), IRQ_OFFSET(irq), cpu_eiem));
-	irq = irq_canonicalize(irq);
-	region = irq_region[IRQ_REGION(irq)];
-	if (region->ops.unmask_irq)
-		region->ops.unmask_irq(region->data.dev, IRQ_OFFSET(irq));
-}
-
 void disable_irq(int irq)
 {
 	struct irq_region *region;
@@ -495,9 +451,9 @@ void do_irq_mask(unsigned long mask, str
 		mask &= ~bit;	/* clear bit in mask - can exit loop sooner */
 		irq_num = region->data.irqbase + irq;
 
-		mask_irq(irq_num);
+		disable_irq(irq_num);
 		do_irq(&region->action[irq], irq_num, regs);
-		unmask_irq(irq_num);
+		enable_irq(irq_num);
 	}
 }
 
@@ -549,11 +505,6 @@ struct irq_region *alloc_irq_region( int
 			IRQ_PER_REGION, name, count));
 	    count = IRQ_PER_REGION;
 	}
-
-	/* if either mask *or* unmask is set, both have to be set. */
-	if((ops->mask_irq || ops->unmask_irq) &&
-		!(ops->mask_irq && ops->unmask_irq))
-			return NULL;
 
 	/* ditto for enable/disable */
 	if( (ops->disable_irq || ops->enable_irq) &&
Index: drivers/parisc/dino.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/dino.c,v
retrieving revision 1.20
diff -u -p -r1.20 dino.c
--- drivers/parisc/dino.c	29 Oct 2004 13:08:47 -0000	1.20
+++ drivers/parisc/dino.c	6 Dec 2004 04:03:03 -0000
@@ -299,7 +299,7 @@ struct pci_port_ops dino_port_ops = {
 };
 
 static void
-dino_mask_irq(void *irq_dev, int irq)
+dino_disable_irq(void *irq_dev, int irq)
 {
 	struct dino_device *dino_dev = DINO_DEV(irq_dev);
 
@@ -318,16 +318,23 @@ dino_mask_irq(void *irq_dev, int irq)
 	}
 }
 
-
 static void
-dino_unmask_irq(void *irq_dev, int irq)
+dino_enable_irq(void *irq_dev, int irq)
 {
 	struct dino_device *dino_dev = DINO_DEV(irq_dev);
 	u32 tmp;
 
 	DBG(KERN_WARNING "%s(0x%p, %d)\n", __FUNCTION__, irq_dev, irq);
 
-	if (NULL == irq_dev || irq > DINO_IRQS) {
+	/*
+	** clear pending IRQ bits
+	**
+	** This does NOT change ILR state!
+	** See comment below for ILR usage.
+	*/
+	gsc_readl(dino_dev->hba.base_addr+DINO_IPR);
+
+	if (irq > DINO_IRQS) {
 		printk(KERN_WARNING "%s(): %d not a dino irq?\n",
 				__FUNCTION__, irq);
 		BUG();
@@ -356,29 +363,9 @@ dino_unmask_irq(void *irq_dev, int irq)
 }
 
 
-
-static void
-dino_enable_irq(void *irq_dev, int irq)
-{
-	struct dino_device *dino_dev = DINO_DEV(irq_dev);
-
-	/*
-	** clear pending IRQ bits
-	**
-	** This does NOT change ILR state!
-	** See comments in dino_unmask_irq() for ILR usage.
-	*/
-	gsc_readl(dino_dev->hba.base_addr+DINO_IPR);
-
-	dino_unmask_irq(irq_dev, irq);
-}
-
-
 static struct irq_region_ops dino_irq_ops = {
-	.disable_irq	= dino_mask_irq,	/* ??? */
+	.disable_irq	= dino_disable_irq,
 	.enable_irq	= dino_enable_irq, 
-	.mask_irq	= dino_mask_irq,
-	.unmask_irq	= dino_unmask_irq
 };
 
 
Index: drivers/parisc/eisa.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/eisa.c,v
retrieving revision 1.7
diff -u -p -r1.7 eisa.c
--- drivers/parisc/eisa.c	22 Feb 2004 15:38:50 -0000	1.7
+++ drivers/parisc/eisa.c	6 Dec 2004 04:03:03 -0000
@@ -180,45 +180,14 @@ static void eisa_enable_irq(void *irq_de
 	EISA_DBG("pic1 mask %02x\n", eisa_in8(0xa1));
 }
 
-static void eisa_mask_irq(void *irq_dev, int irq)
-{
-	unsigned long flags;
-	EISA_DBG("mask irq %d\n", irq);
-	
-        /* mask irq */
-	spin_lock_irqsave(&eisa_irq_lock, flags);
-	if (irq & 8) {
-		slave_mask |= (1 << (irq&7));
-		eisa_out8(slave_mask, 0xa1);
-	} else {
-		master_mask |= (1 << (irq&7));
-		eisa_out8(master_mask, 0x21);
-	}
-	spin_unlock_irqrestore(&eisa_irq_lock, flags);
-}
-
-static void eisa_unmask_irq(void *irq_dev, int irq)
-{
-	unsigned long flags;
-	EISA_DBG("unmask irq %d\n", irq);
-        
-	/* unmask */
-	spin_lock_irqsave(&eisa_irq_lock, flags);
-	if (irq & 8) {
-		slave_mask &= ~(1 << (irq&7));
-		eisa_out8(slave_mask, 0xa1);
-	} else {
-		master_mask &= ~(1 << (irq&7));
-		eisa_out8(master_mask, 0x21);
-	}
-	spin_unlock_irqrestore(&eisa_irq_lock, flags);
-}
-
 static struct irqaction action[IRQ_PER_REGION];
 
 /* EISA needs to be fixed at IRQ region #0 (EISA_IRQ_REGION) */
 static struct irq_region eisa_irq_region = {
-	.ops	= { eisa_disable_irq, eisa_enable_irq, eisa_mask_irq, eisa_unmask_irq },
+	.ops	= {
+		.disable_irq = eisa_disable_irq,
+		.enable_irq = eisa_enable_irq
+	},
 	.data	= { .name = "EISA", .irqbase = 0 },
 	.action	= action,
 };
Index: drivers/parisc/gsc.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/gsc.c,v
retrieving revision 1.3
diff -u -p -r1.3 gsc.c
--- drivers/parisc/gsc.c	10 Mar 2004 19:24:48 -0000	1.3
+++ drivers/parisc/gsc.c	6 Dec 2004 04:03:03 -0000
@@ -139,29 +139,12 @@ busdev_enable_irq(void *irq_dev, int irq
 
 /* FIXME: read IPR to make sure the IRQ isn't already pending.
 **   If so, we need to read IRR and manually call do_irq_mask().
-**   This code should be shared with busdev_unmask_irq().
-*/
-}
-
-static void
-busdev_mask_irq(void *irq_dev, int irq)
-{
-/* FIXME: Clear the IMR bit in busdev for that IRQ */
-}
-
-static void
-busdev_unmask_irq(void *irq_dev, int irq)
-{
-/* FIXME: Read IPR. Set the IMR bit in busdev for that IRQ.
-   call do_irq_mask() if IPR is non-zero
 */
 }
 
 struct irq_region_ops busdev_irq_ops = {
 	.disable_irq =	busdev_disable_irq,
 	.enable_irq =	busdev_enable_irq,
-	.mask_irq =	busdev_mask_irq,
-	.unmask_irq =	busdev_unmask_irq
 };
 
 
Index: drivers/parisc/iosapic.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/iosapic.c,v
retrieving revision 1.11
diff -u -p -r1.11 iosapic.c
--- drivers/parisc/iosapic.c	17 Nov 2004 22:17:42 -0000	1.11
+++ drivers/parisc/iosapic.c	6 Dec 2004 04:03:05 -0000
@@ -856,25 +856,9 @@ printk("\n");
 }
 
 
-static void
-iosapic_mask_irq(void *dev, int irq)
-{
-	BUG();
-}
-
-
-static void
-iosapic_unmask_irq(void *dev, int irq)
-{
-	BUG();
-}
-
-
 static struct irq_region_ops iosapic_irq_ops = {
 	.disable_irq =	iosapic_disable_irq,
 	.enable_irq =	iosapic_enable_irq,
-	.mask_irq =	iosapic_mask_irq,
-	.unmask_irq =	iosapic_unmask_irq
 };
 
 
Index: drivers/parisc/superio.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/superio.c,v
retrieving revision 1.13
diff -u -p -r1.13 superio.c
--- drivers/parisc/superio.c	5 Dec 2004 16:50:53 -0000	1.13
+++ drivers/parisc/superio.c	6 Dec 2004 04:03:05 -0000
@@ -316,23 +316,9 @@ superio_enable_irq(void *dev, int local_
 }
 
 
-static void
-superio_mask_irq(void *dev, int local_irq)
-{
-	BUG();
-}
-
-static void
-superio_unmask_irq(void *dev, int local_irq)
-{
-	BUG();
-}
-
 static struct irq_region_ops superio_irq_ops = {
 	.disable_irq =	superio_disable_irq,
 	.enable_irq =	superio_enable_irq,
-	.mask_irq =	superio_mask_irq,
-	.unmask_irq =	superio_unmask_irq
 };
 
 #ifdef DEBUG_SUPERIO_INIT
Index: include/asm-parisc/irq.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/irq.h,v
retrieving revision 1.4
diff -u -p -r1.4 irq.h
--- include/asm-parisc/irq.h	5 Dec 2004 23:38:02 -0000	1.4
+++ include/asm-parisc/irq.h	6 Dec 2004 04:03:14 -0000
@@ -48,8 +48,6 @@
 struct irq_region_ops {
 	void (*disable_irq)(void *dev, int irq);
 	void (* enable_irq)(void *dev, int irq);
-	void (*   mask_irq)(void *dev, int irq);
-	void (* unmask_irq)(void *dev, int irq);
 };
 
 struct irq_region_data {

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
