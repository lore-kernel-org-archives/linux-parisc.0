Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A0AD484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  6 Dec 2003 21:07:28 -0700 (MST)
Date: Sat, 6 Dec 2003 20:10:18 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031207041018.GN20133@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [patch] Get superio serial to work with 2.6
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This patch is needed to get serial console to work on SuckyIO based
systems on 2.6. It was mostly done by Grant (and willy, I think)

Unfortunately it requires disabling some bits of code in inventory. What
do you guys think?

Can someone try this on a suckyio system that has USB running?

randolph


Index: arch/parisc/kernel/inventory.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/inventory.c,v
retrieving revision 1.2
diff -u -p -r1.2 inventory.c
--- arch/parisc/kernel/inventory.c	14 Sep 2003 06:37:40 -0000	1.2
+++ arch/parisc/kernel/inventory.c	7 Dec 2003 03:58:22 -0000
@@ -532,7 +532,12 @@ static void __init system_map_inventory(
 	 * Otherwise the machine might crash during iommu setup.
 	 */
 	pdc_io_reset();
-	pdc_io_reset_devices();
+
+	/*
+	 * Unfortunately if we reset devices here, serial console
+	 * stops working :-(
+	 */
+	/* pdc_io_reset_devices(); */
 #endif
 
 	for (i = 0; status != PDC_BAD_PROC && status != PDC_NE_MOD; i++) {
Index: drivers/parisc/superio.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/superio.c,v
retrieving revision 1.3
diff -u -p -r1.3 superio.c
--- drivers/parisc/superio.c	28 Sep 2003 21:04:34 -0000	1.3
+++ drivers/parisc/superio.c	7 Dec 2003 03:58:22 -0000
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
@@ -387,11 +389,27 @@ int superio_fixup_irq(struct pci_dev *pc
 	return(sio_dev.irq_region->data.irqbase + local_irq);
 }
 
+static struct uart_port serial[] = {
+	{
+		.iotype		= UPIO_PORT,
+		.line		= 0,
+		.type		= PORT_16550A,
+		.uartclk	= 115200*16,
+		.fifosize	= 16,
+	},
+	{
+		.iotype		= UPIO_PORT,
+		.line		= 1,
+		.type		= PORT_16550A,
+		.uartclk	= 115200*16,
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
@@ -400,47 +418,15 @@ superio_serial_init(void)
 	if (!sio_dev.iosapic_irq_enabled)
 		superio_init(&sio_dev);
 
-	serial = kmalloc(2 * sizeof (struct serial_struct), GFP_KERNEL);
-
-	if (!serial) {
-		printk(KERN_WARNING "SuperIO: Could not get memory for serial struct.\n");
-		return;
-	}
-
-	memset(serial, 0, 2 * sizeof (struct serial_struct));
-
-	serial->type = PORT_16550A;
-	serial->line = 0;
-	serial->port = sio_dev.sp1_base;
-	serial->port_high = 0;
-	serial->irq = sio_dev.irq_region->data.irqbase + SP1_IRQ;
-	serial->io_type = SERIAL_IO_PORT;
-	serial->flags = 0;
-	serial->xmit_fifo_size = 16;
-	serial->custom_divisor = 0;
-	serial->baud_base = 115200;
+	serial[0].iobase = sio_dev.sp1_base;
+	retval = early_serial_setup(&serial[0]);
 
-	retval = register_serial(serial);
-	if (retval < 0) {
+	if (retval < 0)
 		printk(KERN_WARNING "SuperIO: Register Serial #0 failed.\n");
-		kfree (serial);
-		return;
-	}
-
-	serial++;
 
-	serial->type = PORT_16550A;
-	serial->line = 1;
-	serial->port = sio_dev.sp2_base;
-	serial->port_high = 0;
-	serial->irq = sio_dev.irq_region->data.irqbase + SP2_IRQ;
-	serial->io_type = SERIAL_IO_PORT;
-	serial->flags = 0;
-	serial->xmit_fifo_size = 16;
-	serial->custom_divisor = 0;
-	serial->baud_base = 115200;
+	serial[1].iobase = sio_dev.sp2_base;
+	retval = early_serial_setup(&serial[1]);
 
-	retval = register_serial(serial);
 	if (retval < 0)
 		printk(KERN_WARNING "SuperIO: Register Serial #1 failed.\n");
 #endif /* CONFIG_SERIAL_8250 */
@@ -543,5 +529,5 @@ static void __exit superio_exit(void)
  *
  * FIXME: does this break the superio console?
  */
-late_initcall(superio_modinit);
+module_init(superio_modinit);
 module_exit(superio_exit);
