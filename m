From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] [PATCH] Remove irq_region_ops
Date: Thu, 30 Dec 2004 18:45:20 +0000
Message-ID: <20041230184520.GA18080@parcelfarce.linux.theplanet.co.uk>
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


This patch switches us to use the generic hw_interrupt_type instead
of irq_region_ops.  We don't use much of it yet; in particular these
ops are still per-region instead of per-interrupt, but this is only the
first step.

Using hw_interrupt_type requires us to pass only one parameter to the
enable and disable ops instead of the current two.  So much of the
code in the disable_irq() and enable_irq() functions needed to move
to the callees that needed the additional argument.

Also, we can only use one name for each interrupt type, so we can't say
"This is a Lasi interrupt, that is a Wax interrupt".  They're all "GSC
ASIC" now.  I also renamed some of the 'busdev' stuff.  All devices are
on a bus; it's not an informative name.

I deleted some checking code that is now obvious couldn't've been tripped.

Some of the includes changed a bit to reflect i386 more closely, and
__syscall_count and __ksoftirqd_task are gone from irq_cpustat_t on most
other arches.

Tested on a 725, mostly with Lasi-based devices.  It'd be nice if someone
tested this on an IOSAPIC-based machine (eg a500/b2000/n4000/j7000/c8000)
I'd like to commit this soon and move onto step 2.

Index: arch/parisc/kernel/irq.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/irq.c,v
retrieving revision 1.18
diff -u -p -r1.18 irq.c
--- arch/parisc/kernel/irq.c	6 Dec 2004 14:35:23 -0000	1.18
+++ arch/parisc/kernel/irq.c	30 Dec 2004 18:18:38 -0000
@@ -68,7 +68,7 @@ static void cpu_set_eiem(void *info)
 	set_eiem((unsigned long) info);
 }
 
-static inline void disable_cpu_irq(void *unused, int irq)
+static inline void disable_cpu_irq(unsigned int irq)
 {
 	unsigned long eirr_bit = EIEM_MASK(irq);
 
@@ -76,7 +76,7 @@ static inline void disable_cpu_irq(void 
         on_each_cpu(cpu_set_eiem, (void *) cpu_eiem, 1, 1);
 }
 
-static void enable_cpu_irq(void *unused, int irq)
+static void enable_cpu_irq(unsigned int irq)
 {
 	unsigned long eirr_bit = EIEM_MASK(irq);
 
@@ -105,16 +105,17 @@ struct irqaction cpu_irq_actions[IRQ_PER
 #endif
 };
 
+static struct hw_interrupt_type cpu_interrupt_type = {
+	.typename	= "CPU",
+	.disable	= disable_cpu_irq,
+	.enable		= enable_cpu_irq,
+};
 
 struct irq_region cpu0_irq_region = {
-	.ops	= {
-			.disable_irq	= disable_cpu_irq,
-			.enable_irq	= enable_cpu_irq,
-	},
+	.type	= &cpu_interrupt_type,
 	.data	= {
-			.dev		= &cpu_data[0],
-			.name		= "PARISC-CPU",
-			.irqbase 	= IRQ_FROM_REGION(CPU_IRQ_REGION),
+		.dev		= &cpu_data[0],
+		.irqbase 	= IRQ_FROM_REGION(CPU_IRQ_REGION),
 	},
 	.action	= cpu_irq_actions,
 };
@@ -139,8 +140,8 @@ void disable_irq(int irq)
 				IRQ_REGION(irq), IRQ_OFFSET(irq), cpu_eiem));
 	irq = irq_canonicalize(irq);
 	region = irq_region[IRQ_REGION(irq)];
-	if (region->ops.disable_irq)
-		region->ops.disable_irq(region->data.dev, IRQ_OFFSET(irq));
+	if (region->type->disable)
+		region->type->disable(irq);
 	else
 		BUG();
 }
@@ -155,8 +156,8 @@ void enable_irq(int irq)
 	irq = irq_canonicalize(irq);
 	region = irq_region[IRQ_REGION(irq)];
 
-	if (region->ops.enable_irq)
-		region->ops.enable_irq(region->data.dev, IRQ_OFFSET(irq));
+	if (region->type->enable)
+		region->type->enable(irq);
 	else
 		BUG();
 }
@@ -205,8 +206,7 @@ int show_interrupts(struct seq_file *p, 
 #endif
 		  seq_printf(p, "%10u ", kstat_cpu(j).irqs[irq_no]);
 
-		seq_printf(p, " %14s",
-			    region->data.name ? region->data.name : "N/A");
+		seq_printf(p, " %14s", region->type->typename);
 #ifndef PARISC_IRQ_CR16_COUNTS
 		seq_printf(p, "  %s", action->name);
 
@@ -471,11 +471,10 @@ static inline int find_free_region(void)
 }
 
 
-/*****
+/**
  * alloc_irq_region - allocate/init a new IRQ region
  * @count: number of IRQs in this region.
- * @ops: function table with request/release/mask/unmask/etc.. entries.
- * @name: name of region owner for /proc/interrupts output.
+ * @type: function table with enable/disable/etc.. entries.
  * @dev: private data to associate with the new IRQ region.
  *
  * Every IRQ must become a MMIO write to the CPU's EIRR in
@@ -485,8 +484,8 @@ static inline int find_free_region(void)
  * IRQ regions virtualize IRQs (eg EISA or PCI host bus controllers)
  * for line based devices.
  */
-struct irq_region *alloc_irq_region( int count, struct irq_region_ops *ops,
-					const char *name, void *dev)
+struct irq_region *alloc_irq_region(int count, struct hw_interrupt_type *type,
+					void *dev)
 {
 	struct irq_region *region;
 	int index;
@@ -506,10 +505,9 @@ struct irq_region *alloc_irq_region( int
 	    count = IRQ_PER_REGION;
 	}
 
-	/* ditto for enable/disable */
-	if( (ops->disable_irq || ops->enable_irq) &&
-		!(ops->disable_irq && ops->enable_irq) )
-			return NULL;
+	if ((type->disable && !type->enable) ||
+	    (!type->disable && type->enable))
+		return NULL;
 
 	region = kmalloc(sizeof(*region), GFP_ATOMIC);
 	if (!region)
@@ -523,9 +521,8 @@ struct irq_region *alloc_irq_region( int
 	}
 	memset(region->action, 0, count * sizeof(*region->action));
 
-	region->ops = *ops;
+	region->type = type;
 	region->data.irqbase = IRQ_FROM_REGION(index);
-	region->data.name = name;
 	region->data.dev = dev;
 
 	irq_region[index] = region;
@@ -707,7 +704,7 @@ unsigned long probe_irq_on(void)
 		action = region->action + i;
 		if (!action->handler) {
 			region->data.status[i] |= IRQ_AUTODETECT | IRQ_WAITING;
-			region->ops.enable_irq(region->data.dev,i);
+			region->type->enable(i);
 		}
 		spin_unlock_irq(&irq_lock);
 	}
@@ -732,7 +729,7 @@ unsigned long probe_irq_on(void)
 			/* It triggered already - consider it spurious. */
 			if (!(status & IRQ_WAITING)) {
 				region->data.status[i] = status & ~IRQ_AUTODETECT;
-				region->ops.disable_irq(region->data.dev,i);
+				region->type->disable(i);
 			} else
 				if (i < BITS_PER_LONG)
 					val |= (1 << i);
@@ -792,7 +789,7 @@ int probe_irq_off(unsigned long val)
 					irq_found = i;
 				nr_irqs++;
 			}
-			region->ops.disable_irq(region->data.dev,i);
+			region->type->disable(i);
 			region->data.status[i] = status & ~IRQ_AUTODETECT;
 		}
 		spin_unlock_irq(&irq_lock);
Index: drivers/parisc/dino.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/dino.c,v
retrieving revision 1.21
diff -u -p -r1.21 dino.c
--- drivers/parisc/dino.c	6 Dec 2004 14:35:23 -0000	1.21
+++ drivers/parisc/dino.c	30 Dec 2004 18:18:40 -0000
@@ -298,30 +298,24 @@ struct pci_port_ops dino_port_ops = {
 	.outl	= dino_out32
 };
 
-static void
-dino_disable_irq(void *irq_dev, int irq)
+static void dino_disable_irq(unsigned int irq_handle)
 {
-	struct dino_device *dino_dev = DINO_DEV(irq_dev);
+	struct irq_region *region = irq_region[IRQ_REGION(irq_handle)];
+	struct dino_device *dino_dev = region->data.dev;
+	int irq = IRQ_OFFSET(irq_handle);
 
 	DBG(KERN_WARNING "%s(0x%p, %d)\n", __FUNCTION__, irq_dev, irq);
 
-	if (NULL == irq_dev || irq > DINO_IRQS || irq < 0) {
-		printk(KERN_WARNING "%s(0x%lx, %d) - not a dino irq?\n",
-			__FUNCTION__, (long) irq_dev, irq);
-		BUG();
-	} else {
-		/*
-		** Clear the matching bit in the IMR register
-		*/
-		dino_dev->imr &= ~(DINO_MASK_IRQ(irq));
-		gsc_writel(dino_dev->imr, dino_dev->hba.base_addr+DINO_IMR);
-	}
+	/* Clear the matching bit in the IMR register */
+	dino_dev->imr &= ~(DINO_MASK_IRQ(irq));
+	gsc_writel(dino_dev->imr, dino_dev->hba.base_addr+DINO_IMR);
 }
 
-static void
-dino_enable_irq(void *irq_dev, int irq)
+static void dino_enable_irq(unsigned int irq_handle)
 {
-	struct dino_device *dino_dev = DINO_DEV(irq_dev);
+	struct irq_region *region = irq_region[IRQ_REGION(irq_handle)];
+	struct dino_device *dino_dev = region->data.dev;
+	int irq = IRQ_OFFSET(irq_handle);
 	u32 tmp;
 
 	DBG(KERN_WARNING "%s(0x%p, %d)\n", __FUNCTION__, irq_dev, irq);
@@ -334,13 +328,6 @@ dino_enable_irq(void *irq_dev, int irq)
 	*/
 	gsc_readl(dino_dev->hba.base_addr+DINO_IPR);
 
-	if (irq > DINO_IRQS) {
-		printk(KERN_WARNING "%s(): %d not a dino irq?\n",
-				__FUNCTION__, irq);
-		BUG();
-		return;
-	}
-
 	/* set the matching bit in the IMR register */
 	dino_dev->imr |= DINO_MASK_IRQ(irq);          /* used in dino_isr() */
 	gsc_writel( dino_dev->imr, dino_dev->hba.base_addr+DINO_IMR);
@@ -363,9 +350,10 @@ dino_enable_irq(void *irq_dev, int irq)
 }
 
 
-static struct irq_region_ops dino_irq_ops = {
-	.disable_irq	= dino_disable_irq,
-	.enable_irq	= dino_enable_irq, 
+static struct hw_interrupt_type dino_interrupt_type = {
+	.typename	= "Dino",
+	.disable	= dino_disable_irq,
+	.enable		= dino_enable_irq, 
 };
 
 
@@ -842,8 +830,8 @@ static int __init dino_common_init(struc
 	** Tell generic interrupt support we have 11 bits which need
 	** be checked in the interrupt handler.
 	*/
-	dino_dev->dino_region = alloc_irq_region(DINO_IRQS, &dino_irq_ops,
-						name, dino_dev);
+	dino_dev->dino_region = alloc_irq_region(DINO_IRQS,
+						&dino_interrupt_type, dino_dev);
 
 	if (NULL == dino_dev->dino_region) {
 		printk(KERN_WARNING "%s: alloc_irq_region() failed\n", name);
Index: drivers/parisc/eisa.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/eisa.c,v
retrieving revision 1.8
diff -u -p -r1.8 eisa.c
--- drivers/parisc/eisa.c	6 Dec 2004 14:35:23 -0000	1.8
+++ drivers/parisc/eisa.c	30 Dec 2004 18:18:40 -0000
@@ -29,7 +29,7 @@
 
 #include <linux/init.h>
 #include <linux/ioport.h>
-#include <linux/irq.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -142,7 +142,7 @@ static unsigned int eisa_irq_level; /* d
 
 
 /* called by free irq */
-static void eisa_disable_irq(void *irq_dev, int irq)
+static void eisa_disable_irq(unsigned int irq)
 {
 	unsigned long flags;
 
@@ -162,7 +162,7 @@ static void eisa_disable_irq(void *irq_d
 }
 
 /* called by request irq */
-static void eisa_enable_irq(void *irq_dev, int irq)
+static void eisa_enable_irq(unsigned int irq)
 {
 	unsigned long flags;
 	EISA_DBG("enable irq %d\n", irq);
@@ -182,13 +182,18 @@ static void eisa_enable_irq(void *irq_de
 
 static struct irqaction action[IRQ_PER_REGION];
 
+static struct hw_interrupt_type eisa_interrupt_type = {
+	.typename =	"EISA",
+	.disable =	eisa_disable_irq,
+	.enable =	eisa_enable_irq,
+};
+
 /* EISA needs to be fixed at IRQ region #0 (EISA_IRQ_REGION) */
 static struct irq_region eisa_irq_region = {
-	.ops	= {
-		.disable_irq = eisa_disable_irq,
-		.enable_irq = eisa_enable_irq
+	.type	= &eisa_interrupt_type,
+	.data	= {
+		.irqbase = 0
 	},
-	.data	= { .name = "EISA", .irqbase = 0 },
 	.action	= action,
 };
 
Index: drivers/parisc/gsc.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/gsc.c,v
retrieving revision 1.4
diff -u -p -r1.4 gsc.c
--- drivers/parisc/gsc.c	6 Dec 2004 14:35:23 -0000	1.4
+++ drivers/parisc/gsc.c	30 Dec 2004 18:18:40 -0000
@@ -109,30 +109,33 @@ irqreturn_t busdev_barked(int busdev_irq
 	return IRQ_HANDLED;
 }
 
-static void
-busdev_disable_irq(void *irq_dev, int irq)
+static void gsc_asic_disable_irq(unsigned int irq_handle)
 {
+	struct irq_region *region = irq_region[IRQ_REGION(irq_handle)];
+	struct busdevice *irq_dev = region->data.dev;
+	int irq = IRQ_OFFSET(irq_handle);
 	/* Disable the IRQ line by clearing the bit in the IMR */
-	u32 imr = gsc_readl(BUSDEV_DEV(irq_dev)->hpa+OFFSET_IMR);
-	imr &= ~(GSC_MASK_IRQ(irq));
+	u32 imr = gsc_readl(irq_dev->hpa + OFFSET_IMR);
+	imr &= ~GSC_MASK_IRQ(irq);
 
 	DEBPRINTK( KERN_WARNING "%s(%p, %d) %s: IMR 0x%x\n", 
 		    __FUNCTION__, irq_dev, irq, BUSDEV_DEV(irq_dev)->name, imr);
 
-	gsc_writel(imr, BUSDEV_DEV(irq_dev)->hpa+OFFSET_IMR);
+	gsc_writel(imr, irq_dev->hpa + OFFSET_IMR);
 }
 
-
-static void
-busdev_enable_irq(void *irq_dev, int irq)
+static void gsc_asic_enable_irq(unsigned int irq_handle)
 {
+	struct irq_region *region = irq_region[IRQ_REGION(irq_handle)];
+	struct busdevice *irq_dev = region->data.dev;
+	int irq = IRQ_OFFSET(irq_handle);
 	/* Enable the IRQ line by setting the bit in the IMR */
-	unsigned long addr = BUSDEV_DEV(irq_dev)->hpa + OFFSET_IMR;
+	unsigned long addr = irq_dev->hpa + OFFSET_IMR;
 	u32 imr = gsc_readl(addr);
 	imr |= GSC_MASK_IRQ(irq);
 
 	DEBPRINTK (KERN_WARNING "%s(%p, %d) %s: IMR 0x%x\n", 
-		    __FUNCTION__, irq_dev, irq, BUSDEV_DEV(irq_dev)->name, imr);
+		    __FUNCTION__, irq_dev, irq, irq_dev->name, imr);
 
 	gsc_writel(imr, addr);
 //	gsc_writel(~0L, addr);
@@ -142,9 +145,10 @@ busdev_enable_irq(void *irq_dev, int irq
 */
 }
 
-struct irq_region_ops busdev_irq_ops = {
-	.disable_irq =	busdev_disable_irq,
-	.enable_irq =	busdev_enable_irq,
+struct hw_interrupt_type gsc_asic_interrupt_type = {
+	.typename =	"GSC-ASIC",
+	.disable =	gsc_asic_disable_irq,
+	.enable =	gsc_asic_enable_irq,
 };
 
 
@@ -155,8 +159,8 @@ int gsc_common_irqsetup(struct parisc_de
 	busdev->gsc = parent;
 
 	/* the IRQs we simulate */
-	busdev->busdev_region = alloc_irq_region(32, &busdev_irq_ops,
-						 busdev->name, busdev);
+	busdev->busdev_region = alloc_irq_region(32, &gsc_asic_interrupt_type,
+						 busdev);
 	if (!busdev->busdev_region)
 		return -ENOMEM;
 
Index: drivers/parisc/iosapic.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/iosapic.c,v
retrieving revision 1.12
diff -u -p -r1.12 iosapic.c
--- drivers/parisc/iosapic.c	6 Dec 2004 14:35:23 -0000	1.12
+++ drivers/parisc/iosapic.c	30 Dec 2004 18:18:41 -0000
@@ -91,7 +91,7 @@
 ** One IRQ number represents both an IRQ line and a driver ISR.
 ** The I/O sapic driver can't manage shared IRQ lines because
 ** additional data besides the IRQ number must be passed via
-** irq_region_ops. do_irq() and request_irq() must manage
+** hw_interrupt_type. do_irq() and request_irq() must manage
 ** a sharing a bit in the mask.
 **
 ** iosapic_interrupt() replaces do_irq_mask() and calls do_irq().
@@ -768,15 +768,15 @@ iosapic_set_irt_data( struct vector_info
 }
 
 
-static void
-iosapic_disable_irq(void *irq_dev, int irq)
+static void iosapic_disable_irq(unsigned int irq_handle)
 {
 	unsigned long flags;
-	struct vector_info *vi = &(((struct vector_info *) irq_dev)[irq]);
+	struct irq_region *region = irq_region[IRQ_REGION(irq_handle)];
+	int irq = IRQ_OFFSET(irq_handle);
+	struct vector_info *isi_vector = region->data.dev;
+	struct vector_info *vi = isi_vector + irq;
 	u32 d0, d1;
 
-	BUG_ON(!vi);
-
 	spin_lock_irqsave(&iosapic_lock, flags);
 
 #ifdef REVISIT_DESIGN_ISSUE
@@ -812,10 +812,12 @@ Need more info on how Linux supports sha
 }
 
 
-static void
-iosapic_enable_irq(void *dev, int irq)
+static void iosapic_enable_irq(unsigned int irq_handle)
 {
-	struct vector_info *vi = &(((struct vector_info *) dev)[irq]);
+	struct irq_region *region = irq_region[IRQ_REGION(irq_handle)];
+	int irq = IRQ_OFFSET(irq_handle);
+	struct vector_info *isi_vector = region->data.dev;
+	struct vector_info *vi = isi_vector + irq;
 	u32 d0, d1;
 
 	/* data is initialized by fixup_irq */
@@ -856,9 +858,10 @@ printk("\n");
 }
 
 
-static struct irq_region_ops iosapic_irq_ops = {
-	.disable_irq =	iosapic_disable_irq,
-	.enable_irq =	iosapic_enable_irq,
+static struct hw_interrupt_type iosapic_interrupt_type = {
+	.typename =	"IO-SAPIC-level",
+	.disable =	iosapic_disable_irq,
+	.enable =	iosapic_enable_irq,
 };
 
 
@@ -946,8 +949,7 @@ iosapic_register(unsigned long hpa)
 	}
 
 	isi->isi_region = alloc_irq_region(isi->isi_num_vectors,
-				&iosapic_irq_ops, isi->isi_name,
-				(void *) isi->isi_vector);
+				&iosapic_interrupt_type, isi->isi_vector);
 
 	WARN_ON(isi->isi_region == NULL);
 	return ((void *) isi);
Index: drivers/parisc/superio.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/superio.c,v
retrieving revision 1.14
diff -u -p -r1.14 superio.c
--- drivers/parisc/superio.c	6 Dec 2004 14:35:23 -0000	1.14
+++ drivers/parisc/superio.c	30 Dec 2004 18:18:41 -0000
@@ -280,9 +280,9 @@ superio_init(struct superio_device *sio)
 }
 
 
-static void
-superio_disable_irq(void *dev, int local_irq)
+static void superio_disable_irq(unsigned int irq_handle)
 {
+	int local_irq = IRQ_OFFSET(irq_handle);
 	u8 r8;
 
 	if ((local_irq < 1) || (local_irq == 2) || (local_irq > 7)) {
@@ -298,9 +298,9 @@ superio_disable_irq(void *dev, int local
 	outb (r8,IC_PIC1+1);
 }
 
-static void
-superio_enable_irq(void *dev, int local_irq)
+static void superio_enable_irq(unsigned int irq_handle)
 {
+	int local_irq = IRQ_OFFSET(irq_handle);
 	u8 r8;
 
 	if ((local_irq < 1) || (local_irq == 2) || (local_irq > 7)) {
@@ -316,9 +316,10 @@ superio_enable_irq(void *dev, int local_
 }
 
 
-static struct irq_region_ops superio_irq_ops = {
-	.disable_irq =	superio_disable_irq,
-	.enable_irq =	superio_enable_irq,
+static struct hw_interrupt_type superio_interrupt_type = {
+	.typename =	"SuperIO",
+	.disable =	superio_disable_irq,
+	.enable =	superio_enable_irq,
 };
 
 #ifdef DEBUG_SUPERIO_INIT
@@ -351,8 +352,8 @@ int superio_fixup_irq(struct pci_dev *pc
 	if (!sio_dev.irq_region) {
 		/* Allocate an irq region for SuperIO devices */
 		sio_dev.irq_region = alloc_irq_region(SUPERIO_NIRQS,
-						&superio_irq_ops,
-						"SuperIO", (void *) &sio_dev);
+						&superio_interrupt_type,
+						&sio_dev);
 		if (!sio_dev.irq_region) {
 			printk(KERN_WARNING "SuperIO: alloc_irq_region failed\n");
 			return -1;
Index: include/asm-parisc/hardirq.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/hardirq.h,v
retrieving revision 1.3
diff -u -p -r1.3 hardirq.h
--- include/asm-parisc/hardirq.h	29 Nov 2004 19:56:44 -0000	1.3
+++ include/asm-parisc/hardirq.h	30 Dec 2004 18:18:43 -0000
@@ -18,11 +18,10 @@
 #include <linux/config.h>
 #include <linux/threads.h>
 #include <linux/cache.h>
+#include <linux/irq.h>
 
 typedef struct {
 	unsigned long __softirq_pending; /* set_bit is used on this */
-	unsigned int __syscall_count;
-	struct task_struct * __ksoftirqd_task;
 	unsigned long idle_timestamp;
 } ____cacheline_aligned irq_cpustat_t;
 
@@ -31,20 +30,19 @@ typedef struct {
 #define HARDIRQ_BITS	16
 
 /*
- * The hardirq mask has to be large enough to have space for potentially all IRQ sources
- * in the system nesting on a single CPU:
+ * The hardirq mask has to be large enough to have space for potentially all
+ * IRQ sources in the system nesting on a single CPU:
  */
 #if (1 << HARDIRQ_BITS) < NR_IRQS
 # error HARDIRQ_BITS is too low!
 #endif
 
-#define irq_enter()		(preempt_count() += HARDIRQ_OFFSET)
-#define irq_exit()								\
-do {										\
-		preempt_count() -= IRQ_EXIT_OFFSET;				\
-		if (!in_interrupt() && softirq_pending(smp_processor_id()))	\
-			do_softirq();						\
-		preempt_enable_no_resched();					\
+#define irq_enter()	(preempt_count() += HARDIRQ_OFFSET)
+#define irq_exit()	do {						     \
+		preempt_count() -= IRQ_EXIT_OFFSET;			     \
+		if (!in_interrupt() && softirq_pending(smp_processor_id()))  \
+			do_softirq();					     \
+		preempt_enable_no_resched();				     \
 } while (0)
 
 #endif /* _PARISC_HARDIRQ_H */
Index: include/asm-parisc/irq.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/irq.h,v
retrieving revision 1.5
diff -u -p -r1.5 irq.h
--- include/asm-parisc/irq.h	6 Dec 2004 14:35:23 -0000	1.5
+++ include/asm-parisc/irq.h	30 Dec 2004 18:18:43 -0000
@@ -11,14 +11,13 @@
 #ifndef _ASM_PARISC_IRQ_H
 #define _ASM_PARISC_IRQ_H
 
+#include <linux/string.h>
+#include <linux/config.h>
+
 #include <asm/ptrace.h>
 #include <asm/types.h>
 #include <asm/errno.h>
 
-#include <linux/string.h>
-#include <linux/interrupt.h>
-#include <linux/config.h>
-
 #define NO_IRQ	(-1)
 
 #define CPU_IRQ_REGION		1
@@ -45,22 +44,15 @@
 #define EISA_IRQ_REGION		0 /* region 0 needs to be reserved for EISA */
 #define EISA_MAX_IRQS		16 /* max. (E)ISA irq line */
 
-struct irq_region_ops {
-	void (*disable_irq)(void *dev, int irq);
-	void (* enable_irq)(void *dev, int irq);
-};
-
 struct irq_region_data {
 	void *dev;
-	const char *name;
 	int irqbase;
 	unsigned int status[IRQ_PER_REGION]; /* IRQ status */
 };
 
 struct irq_region {
-	struct irq_region_ops ops;
+	struct hw_interrupt_type *type;
 	struct irq_region_data data;
