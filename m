Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3899A482A
	for <parisc-linux@parisc-linux.org>; Thu, 11 Oct 2001 15:10:03 -0600 (MDT)
Message-Id: <200110112106.PAA30379@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA changes broke SuckyIO 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Thu, 11 Oct 2001 06:46:08 BST." <20011011064608.A25868@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 11 Oct 2001 15:06:18 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> The recent changes (-pa46 or so) which I made to support EISA have
> broken SuckyIO-based boxes -- everything from the B1000 to J7000.
> This will get fixed tomorrow.

I tried to fix this modifying suckyio support to work with
something other tha zero-based IOport space. serial and parallel
ports worked. IDE was causing data page faults at boot and I decided
I wasn't going to pursue this path any further. Here's the patch of
what I've done so far in case anyone needs to support suckyio as an
add-on card.

Matthew promised to fix the EISA support so HBA 0 isn't reserved
for all platforms. And suckyio will get zero based IO port
space again.

grant


Index: arch/parisc/kernel/superio.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/superio.c,v
retrieving revision 1.8
diff -u -p -r1.8 superio.c
--- superio.c	2001/09/06 09:44:07	1.8
+++ superio.c	2001/10/11 20:55:51
@@ -76,6 +76,25 @@ static struct superio_device sio_dev = {
 	iosapic_irq: -1
 };
 
+#if 1
+/* CONFIG_EISA support reserves HBA 0.
+** Suckyio up to now assumed it had HBA 0 (which is normally true).
+*/
+static int sio_hba_base = 0;
+static __inline__ unsigned char sio_inb(addr)
+{
+	return inb(sio_hba_base + addr);
+}
+
+static void __inline__ sio_outb(unsigned char val, unsigned int addr)
+{
+	outb(val, sio_hba_base + addr);
+}
+#else /* !CONFIG_EISA */
+#define sio_inb inb
+#define sio_outb outb
+#endif /* !CONFIG_EISA */
+
 void
 superio_inform_irq(int irq)
 {
@@ -98,9 +117,9 @@ superio_interrupt(int irq, void *devp, s
 	u8 local_irq;
 
 	/* Poll the 8259 to see if there's an interrupt. */
-	outb (OCW3_POLL,IC_PIC1+0);
+	sio_outb (OCW3_POLL,IC_PIC1+0);
 
-	results = inb(IC_PIC1+0);
+	results = sio_inb(IC_PIC1+0);
 
 	if ((results & 0x80) == 0) {
 #ifndef CONFIG_SMP
@@ -124,8 +143,8 @@ superio_interrupt(int irq, void *devp, s
 
 		/* Could be spurious. Check in service bits */
 
-		outb(OCW3_ISR,IC_PIC1+0);
-		results = inb(IC_PIC1+0);
+		sio_outb(OCW3_ISR,IC_PIC1+0);
+		results = sio_inb(IC_PIC1+0);
 		if ((results & 0x80) == 0) { /* if ISR7 not set: spurious */
 			printk(KERN_WARNING "SuperIO: spurious interrupt!\n");
 			return;
@@ -140,7 +159,7 @@ superio_interrupt(int irq, void *devp, s
 
 	/* set EOI */
 
-	outb((OCW2_SEOI|local_irq),IC_PIC1 + 0);
+	sio_outb((OCW2_SEOI|local_irq),IC_PIC1 + 0);
 	return;
 }
 
@@ -162,20 +181,29 @@ superio_init(struct superio_device *sio)
 	printk (KERN_INFO "SuperIO: Found NS87560 legacy I/O device at %s. iosapic irq = %i \n",
 		pdev->slot_name,sio->iosapic_irq);
 
+/* #ifdef CONFIG_EISA */
+#if 1
+	sio_hba_base = HBA_FIXUP_IOPORT(pdev, 0);
+#endif
+
 	/* Find our I/O devices */
-	pci_read_config_word (pdev, SIO_SP1BAR, &sio->sp1_base);
+	pci_read_config_word (pdev, SIO_SP1BAR, &word);
+	sio->sp1_base = HBA_FIXUP_IOPORT(pdev, word);
 	sio->sp1_base &= ~1;
 	printk (KERN_INFO "SuperIO: Serial port 1 at 0x%x\n", sio->sp1_base);
 
-	pci_read_config_word (pdev, SIO_SP2BAR, &sio->sp2_base);
+	pci_read_config_word (pdev, SIO_SP2BAR, &word);
+	sio->sp2_base = HBA_FIXUP_IOPORT(pdev, word);
 	sio->sp2_base &= ~1;
 	printk (KERN_INFO "SuperIO: Serial port 2 at 0x%x\n", sio->sp2_base);
 
-	pci_read_config_word (pdev, SIO_PPBAR, &sio->pp_base);
+	pci_read_config_word (pdev, SIO_PPBAR, &word);
+	sio->pp_base = HBA_FIXUP_IOPORT(pdev, word);
 	sio->pp_base &= ~1;
 	printk (KERN_INFO "SuperIO: Parallel port at 0x%x\n", sio->pp_base);
 
-	pci_read_config_word (pdev, SIO_FDCBAR, &sio->fdc_base);
+	pci_read_config_word (pdev, SIO_FDCBAR, &word);
+	sio->fdc_base = HBA_FIXUP_IOPORT(pdev, word);
 	sio->fdc_base &= ~1;
 	printk (KERN_INFO "SuperIO: Floppy controller at 0x%x\n", sio->fdc_base);
 
@@ -202,28 +230,28 @@ superio_init(struct superio_device *sio)
 		pci_write_config_byte (pdev, i, 0x0);
 
 	/* PIC1 Initialization Command Word register programming */
-	outb (0x11,IC_PIC1+0);	/* ICW1: ICW4 write req | ICW1 */
-	outb (0x00,IC_PIC1+1);	/* ICW2: N/A */
-	outb (0x04,IC_PIC1+1);	/* ICW3: Cascade */
-	outb (0x01,IC_PIC1+1);	/* ICW4: x86 mode */
+	sio_outb (0x11,IC_PIC1+0);	/* ICW1: ICW4 write req | ICW1 */
+	sio_outb (0x00,IC_PIC1+1);	/* ICW2: N/A */
+	sio_outb (0x04,IC_PIC1+1);	/* ICW3: Cascade */
+	sio_outb (0x01,IC_PIC1+1);	/* ICW4: x86 mode */
 
 	/* PIC1 Program Operational Control Words */
-	outb (0xff,IC_PIC1+1);	/* OCW1: Mask all interrupts */
-	outb (0xc2,IC_PIC1+0);  /* OCW2: priority (3-7,0-2) */
+	sio_outb (0xff,IC_PIC1+1);	/* OCW1: Mask all interrupts */
+	sio_outb (0xc2,IC_PIC1+0);  /* OCW2: priority (3-7,0-2) */
 
 	/* PIC2 Initialization Command Word register programming */
-	outb (0x11,IC_PIC2+0);	/* ICW1: ICW4 write req | ICW1 */
-	outb (0x00,IC_PIC2+1);	/* ICW2: N/A */
-	outb (0x02,IC_PIC2+1);	/* ICW3: Slave ID code */
-	outb (0x01,IC_PIC2+1);	/* ICW4: x86 mode */
+	sio_outb (0x11,IC_PIC2+0);	/* ICW1: ICW4 write req | ICW1 */
+	sio_outb (0x00,IC_PIC2+1);	/* ICW2: N/A */
+	sio_outb (0x02,IC_PIC2+1);	/* ICW3: Slave ID code */
+	sio_outb (0x01,IC_PIC2+1);	/* ICW4: x86 mode */
 		
 	/* Program Operational Control Words */
-	outb (0xff,IC_PIC1+1);	/* OCW1: Mask all interrupts */
-	outb (0x68,IC_PIC1+0);	/* OCW3: OCW3 select | ESMM | SMM */
+	sio_outb (0xff,IC_PIC1+1);	/* OCW1: Mask all interrupts */
+	sio_outb (0x68,IC_PIC1+0);	/* OCW3: OCW3 select | ESMM | SMM */
 
 	/* Write master mask reg */
 
-	outb (0xff,IC_PIC1+1);
+	sio_outb (0xff,IC_PIC1+1);
 
 	/* Set up interrupt routing */
 
@@ -262,9 +290,9 @@ superio_disable_irq(void *dev, int local
 
 	/* Mask interrupt */
 
-	r8 = inb(IC_PIC1+1);
+	r8 = sio_inb(IC_PIC1+1);
 	r8 |= (1 << local_irq);
-	outb (r8,IC_PIC1+1);
+	sio_outb (r8,IC_PIC1+1);
 }
 
 static void
@@ -289,9 +317,9 @@ superio_enable_irq(void *dev, int local_
 
 	/* Unmask interrupt */
 
-	r8 = inb(IC_PIC1+1);
+	r8 = sio_inb(IC_PIC1+1);
 	r8 &= ~(1 << local_irq);
-	outb (r8,IC_PIC1+1);
+	sio_outb (r8,IC_PIC1+1);
 }
 
 static void
Index: include/asm-parisc/pci.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/pci.h,v
retrieving revision 1.31
diff -u -p -r1.31 pci.h
--- pci.h	2001/10/10 20:10:13	1.31
+++ pci.h	2001/10/11 20:55:54
@@ -69,6 +69,8 @@ struct pci_hba_data {
 #define HBA_PORT_BASE(h)	((h) << HBA_PORT_SPACE_BITS)
 #define HBA_PORT_SPACE_SIZE	(1UL << HBA_PORT_SPACE_BITS)
 
+#define HBA_FIXUP_IOPORT(pdev, b) (HBA_PORT_BASE(HBA_DATA(pdev->sysdata)->hba_num) + b)
+
 #define PCI_PORT_HBA(a)		((a) >> HBA_PORT_SPACE_BITS)
 #define PCI_PORT_ADDR(a)	((a) & (HBA_PORT_SPACE_SIZE - 1))
 
Index: include/asm-parisc/superio.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/superio.h,v
retrieving revision 1.3
diff -u -p -r1.3 superio.h
--- superio.h	2001/07/15 20:02:07	1.3
+++ superio.h	2001/10/11 20:55:54
@@ -38,10 +38,10 @@
 #define SUPERIO_NIRQS   8
 
 struct superio_device {
-	u16 fdc_base;
-	u16 sp1_base;
-	u16 sp2_base;
-	u16 pp_base;
+	unsigned int fdc_base;
+	unsigned int sp1_base;
+	unsigned int sp2_base;
+	unsigned int pp_base;
 	int iosapic_irq;
 	int iosapic_irq_enabled;
 	struct irq_region *irq_region;
