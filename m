Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B12EA491D
	for <parisc-linux@parisc-linux.org>; Wed, 15 Oct 2003 08:10:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A9mLy-0007ym-GT
	for parisc-linux@parisc-linux.org; Wed, 15 Oct 2003 15:10:18 +0100
Date: Wed, 15 Oct 2003 15:10:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20031015141018.GD16535@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] SuckyIO still doesn't work
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This patch doesn't make suckyio serial work.  But I think it's along
the right lines.  Anybody else want to play with this, go ahead.

Without the 
+       serial8250_console_init();
line in superio.c, we get:

SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
Registering serial 0
Registering serial 1
superio_probe(0000:00:0e.2) ven 0x100b dev 0x12 sv 0x0 sd 0x0 class 0xc0310
SuperIO: probe of 0000:00:0e.2 failed with error -1
Soft power switch enabled, polling @ 0xf0400804.
Console: switching to colour frame buffer device 128x48
pty: 256 Unix98 ptys configured
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at I/O 0x3f8 (irq = 99) is a 16550A
(garbage)

With it:

SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
Registering serial 0
(garbage)

I wonder if possibly we're not unregistering the PDC console properly
so they're both trying to drive the serial port with awful consequences.

Index: arch/parisc/kernel/inventory.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/inventory.c,v
retrieving revision 1.2
diff -u -p -r1.2 inventory.c
--- arch/parisc/kernel/inventory.c	14 Sep 2003 06:37:40 -0000	1.2
+++ arch/parisc/kernel/inventory.c	15 Oct 2003 12:59:05 -0000
@@ -526,7 +526,7 @@ static void __init system_map_inventory(
 	int i;
 	long status = PDC_OK;
     
-#if defined(CONFIG_IOMMU_SBA) && defined(CONFIG_SUPERIO)
+#if defined(CONFIG_IOMMU_SBA) && defined(CONFIG_SUPERIO) && 0
 	/*
 	 * Stop the suckyio usb controller on Astro based systems.
 	 * Otherwise the machine might crash during iommu setup.
Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.4
diff -u -p -r1.4 pdc_cons.c
--- arch/parisc/kernel/pdc_cons.c	14 Oct 2003 11:33:39 -0000	1.4
+++ arch/parisc/kernel/pdc_cons.c	15 Oct 2003 01:57:05 -0000
@@ -12,7 +12,7 @@
 
 /* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems. 
  * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
-#undef EARLY_BOOTUP_DEBUG
+#define EARLY_BOOTUP_DEBUG
 
 
 #include <linux/config.h>
Index: drivers/parisc/superio.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/superio.c,v
retrieving revision 1.3
diff -u -p -r1.3 superio.c
--- drivers/parisc/superio.c	28 Sep 2003 21:04:34 -0000	1.3
+++ drivers/parisc/superio.c	15 Oct 2003 13:22:56 -0000
@@ -65,7 +65,9 @@
 #include <linux/ioport.h>
 #include <linux/parport.h>
 #include <linux/parport_pc.h>
-#include <linux/serial_reg.h>
+#include <linux/termios.h>
+#include <linux/tty.h>
+#include <linux/serial_core.h>
 #include <asm/io.h>
 #include <asm/hardware.h>
 #include <asm/irq.h>
@@ -76,7 +78,7 @@ static struct superio_device sio_dev = {
 };
 
 
-#undef DEBUG_INIT
+#define DEBUG_INIT
 
 void
 superio_inform_irq(int irq)
@@ -387,11 +389,27 @@ int superio_fixup_irq(struct pci_dev *pc
 	return(sio_dev.irq_region->data.irqbase + local_irq);
 }
 
+static struct uart_port serial[] = {
+	{
+		.iotype		= UPIO_PORT,
+		.line		= 0,
+		.type		= PORT_16550A,
+		.uartclk	= 115200,
+		.fifosize	= 16,
+	},
+	{
+		.iotype		= UPIO_PORT,
+		.line		= 1,
+		.type		= PORT_16550A,
+		.uartclk	= 115200,
+		.fifosize	= 16,
+	}
+};
+
 void __devinit
 superio_serial_init(void)
 {
 #ifdef CONFIG_SERIAL_8250
-	struct serial_struct *serial;
 	int retval;
 	
 	if (!sio_dev.irq_region)
@@ -400,47 +418,26 @@ superio_serial_init(void)
 	if (!sio_dev.iosapic_irq_enabled)
 		superio_init(&sio_dev);
 
-	serial = kmalloc(2 * sizeof (struct serial_struct), GFP_KERNEL);
-
 	if (!serial) {
 		printk(KERN_WARNING "SuperIO: Could not get memory for serial struct.\n");
 		return;
 	}
 
-	memset(serial, 0, 2 * sizeof (struct serial_struct));
-
-	serial->type = PORT_16550A;
-	serial->line = 0;
-	serial->port = sio_dev.sp1_base;
-	serial->port_high = 0;
+	serial->iobase = sio_dev.sp1_base;
 	serial->irq = sio_dev.irq_region->data.irqbase + SP1_IRQ;
-	serial->io_type = SERIAL_IO_PORT;
-	serial->flags = 0;
-	serial->xmit_fifo_size = 16;
-	serial->custom_divisor = 0;
-	serial->baud_base = 115200;
 
-	retval = register_serial(serial);
+	printk("Registering serial 0\n");
+	retval = early_serial_setup(&serial[0]);
 	if (retval < 0) {
 		printk(KERN_WARNING "SuperIO: Register Serial #0 failed.\n");
-		kfree (serial);
 		return;
 	}
+	serial8250_console_init();
 
-	serial++;
-
-	serial->type = PORT_16550A;
-	serial->line = 1;
-	serial->port = sio_dev.sp2_base;
-	serial->port_high = 0;
+	serial->iobase = sio_dev.sp2_base;
 	serial->irq = sio_dev.irq_region->data.irqbase + SP2_IRQ;
-	serial->io_type = SERIAL_IO_PORT;
-	serial->flags = 0;
-	serial->xmit_fifo_size = 16;
-	serial->custom_divisor = 0;
-	serial->baud_base = 115200;
-
-	retval = register_serial(serial);
+	printk("Registering serial 1\n");
+	retval = early_serial_setup(&serial[1]);
 	if (retval < 0)
 		printk(KERN_WARNING "SuperIO: Register Serial #1 failed.\n");
 #endif /* CONFIG_SERIAL_8250 */
@@ -504,9 +501,7 @@ static int __devinit superio_probe(struc
 #ifdef CONFIG_PARPORT_PC
 		superio_parport_init();
 #endif
-#ifdef CONFIG_SERIAL_8250
 		superio_serial_init();
-#endif
 		/* REVISIT : superio_fdc_init() ? */
 		return 0;
 	} else {
@@ -538,10 +533,5 @@ static void __exit superio_exit(void)
 	pci_unregister_driver(&superio_driver);
 }
 
-/* Make late initcall to ensure the serial and tty layers are initialised
- * before we start superio.
- *
- * FIXME: does this break the superio console?
- */
-late_initcall(superio_modinit);
+module_init(superio_modinit);
 module_exit(superio_exit);

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
