Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id EFA13482B
	for <parisc-linux@parisc-linux.org>; Mon, 20 Jan 2003 00:37:14 -0700 (MST)
Date: Sun, 19 Jan 2003 23:27:00 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030120072659.GB8487@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] RFC on superio serial patch
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

The attached patch uses a slightly different mechanism to address the
circular dependency between SuperIO PCI init and serial init.
this is not particularly clean, but hopefully it will be more 
acceptable for submission upstream. Any comments?


Index: drivers/parisc/superio.c
===================================================================
RCS file: /var/cvs/linux-2.5/drivers/parisc/superio.c,v
retrieving revision 1.7
diff -u -p -r1.7 superio.c
--- drivers/parisc/superio.c	17 Dec 2002 19:53:29 -0000	1.7
+++ drivers/parisc/superio.c	20 Jan 2003 07:33:54 -0000
@@ -391,7 +391,7 @@ void __devinit
 superio_serial_init(void)
 {
 #ifdef CONFIG_SERIAL_8250
-	struct serial_struct *serial;
+	struct serial_struct serial;
 	int retval;
 	
 	if (!sio_dev.irq_region)
@@ -400,47 +400,39 @@ superio_serial_init(void)
 	if (!sio_dev.iosapic_irq_enabled)
 		superio_init(&sio_dev);
 
-	serial = kmalloc(2 * sizeof (struct serial_struct), GFP_KERNEL);
+	memset(&serial, 0, sizeof (struct serial_struct));
 
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
+	serial.type = PORT_16550A;
+	serial.line = 0;
+	serial.port = sio_dev.sp1_base;
+	serial.port_high = 0;
+	serial.irq = sio_dev.irq_region->data.irqbase + SP1_IRQ;
+	serial.io_type = SERIAL_IO_PORT;
+	serial.flags = 0;
+	serial.xmit_fifo_size = 16;
+	serial.custom_divisor = 0;
+	serial.baud_base = 115200;
 
-	retval = register_serial(serial);
+	retval = register_serial(&serial);
 	if (retval < 0) {
 		printk(KERN_WARNING "SuperIO: Register Serial #0 failed.\n");
-		kfree (serial);
 		return;
 	}
 
-	serial++;
+	memset(&serial, 0, sizeof (struct serial_struct));
 
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
+	serial.type = PORT_16550A;
+	serial.line = 1;
+	serial.port = sio_dev.sp2_base;
+	serial.port_high = 0;
+	serial.irq = sio_dev.irq_region->data.irqbase + SP2_IRQ;
+	serial.io_type = SERIAL_IO_PORT;
+	serial.flags = 0;
+	serial.xmit_fifo_size = 16;
+	serial.custom_divisor = 0;
+	serial.baud_base = 115200;
 
-	retval = register_serial(serial);
+	retval = register_serial(&serial);
 	if (retval < 0)
 		printk(KERN_WARNING "SuperIO: Register Serial #1 failed.\n");
 #endif /* CONFIG_SERIAL_8250 */
@@ -504,9 +496,6 @@ static int __devinit superio_probe(struc
 #ifdef CONFIG_PARPORT_PC
 		superio_parport_init();
 #endif
-#ifdef CONFIG_SERIAL_8250
-		superio_serial_init();
-#endif
 		/* REVISIT : superio_fdc_init() ? */
 		return 0;
 	} else {
@@ -530,11 +519,6 @@ static struct pci_driver superio_driver 
 
 static int __init superio_modinit(void)
 {
-#ifdef CONFIG_SERIAL_8250
-	extern int serial8250_init(void);
-	serial8250_init();
-#endif
-
 	return pci_module_init(&superio_driver);
 }
 
Index: drivers/serial/8250.c
===================================================================
RCS file: /var/cvs/linux-2.5/drivers/serial/8250.c,v
retrieving revision 1.9
diff -u -p -r1.9 8250.c
--- drivers/serial/8250.c	11 Jan 2003 23:05:10 -0000	1.9
+++ drivers/serial/8250.c	20 Jan 2003 07:33:56 -0000
@@ -2032,12 +2032,9 @@ void serial8250_get_irq_map(unsigned int
 	}
 }
 
-int __init serial8250_init(void)
+static int __init serial8250_init(void)
 {
 	int ret, i;
-/* GROSS HACK for now -PB */
-static int beenhere = 0;
-if (beenhere++) return 1;
 
 	printk(KERN_INFO "Serial: 8250/16550 driver $Revision: 1.90 $ "
 		"IRQ sharing %sabled\n", share_irqs ? "en" : "dis");
Index: drivers/serial/Makefile
===================================================================
RCS file: /var/cvs/linux-2.5/drivers/serial/Makefile,v
retrieving revision 1.9
diff -u -p -r1.9 Makefile
--- drivers/serial/Makefile	24 Dec 2002 22:43:16 -0000	1.9
+++ drivers/serial/Makefile	20 Jan 2003 07:33:56 -0000
@@ -29,3 +29,4 @@ obj-$(CONFIG_SERIAL_68328) += 68328seria
 obj-$(CONFIG_SERIAL_68360) += 68360serial.o
 obj-$(CONFIG_SERIAL_COLDFIRE) += mcfserial.o
 obj-$(CONFIG_V850E_NB85E_UART) += nb85e_uart.o
+obj-$(CONFIG_PARISC) += parisc.o

--- /dev/null	2002-08-24 10:36:34.000000000 -0700
+++ drivers/serial/parisc.c	2003-01-19 23:33:34.000000000 -0800
@@ -0,0 +1,36 @@
+/*
+ *  serial hooks for parisc-based serial drivers
+ *
+ *  Copyright (C) 2003 Randolph Chung <tausq@debian.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * Right now this is here just for SuperIO based serial devices
+ * used on some parisc workstations. In the future it may also be
+ * used to implement other parisc-specific serial behavior.
+ */
+#include <linux/config.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <asm/superio.h>
+
+static int __init parisc_serial_init(void)
+{
+#ifdef CONFIG_SUPERIO
+	/* The serial function on SuperIO is part of the LIO function;
+	 * as such, superio cannot be written as a generic serial driver.
+	 * The PCI portion of SuperIO is initialized first by 
+	 * drivers/parisc/superio.c. Only after the core serial 
+	 * functionalities are initialized, this driver is called to 
+	 * actually register the serial device with the generic 8250 
+	 * serial driver.
+	 */
+	superio_serial_init();
+#endif
+}
+
+module_init(parisc_serial_init);
+

-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
