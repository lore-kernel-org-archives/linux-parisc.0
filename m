Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B265482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 May 2001 09:54:56 -0600 (MDT)
Received: from esiee.fr (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 9CC8FD15AA
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 May 2001 17:54:53 +0200 (CEST)
Message-ID: <3B1668E2.3040003@esiee.fr>
Date: Thu, 31 May 2001 17:53:06 +0200
From: Clement MOYROUD <moyroudc@esiee.fr>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------070204050007050803040106"
Subject: [parisc-linux] Patch for dino serial port on B-class workstations
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------070204050007050803040106
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi all !

I have made a patch for dino. It's a bit ugly, but before going on with 
a rewrite of the dino driver, I would like to have some feedback. So 
feel free to apply it on your kernel tree and give me some remarks about it.

Thanks,

Clement
ESIEE Team
mkhppa1.esiee.fr

--------------070204050007050803040106
Content-Type: text/plain;
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

diff -Nru linux.old/drivers/gsc/dino.c linux/drivers/gsc/dino.c
--- linux.old/drivers/gsc/dino.c	Thu May 31 16:56:20 2001
+++ linux/drivers/gsc/dino.c	Thu May 31 16:55:07 2001
@@ -66,6 +66,7 @@
 #include <asm/irq.h>		/* for "gsc" irq functions */
 #include <asm/gsc.h>
 
+#include "busdevice.h"
 
 #undef DINO_DEBUG
 
@@ -542,6 +543,14 @@
 	}
 }
 
+/* Here is where the dino's serial port gets its irq on B-class workstations */
+
+static int
+dino_find_irq(struct busdevice *dino_dev, struct hp_device *dev)
+{
+	return 10;
+}
+
 static void __init
 dino_bios_init(void)
 {
@@ -804,18 +813,33 @@
 }
 
 static int __init
-dino_common_init(struct dino_device *dino_dev)
+dino_common_init(struct hp_device *d, struct dino_device *dino_dev)
 {
 	int status;
 	u32 eim;
 	struct gsc_irq gsc_irq;
 	struct resource *res;
 
+	struct busdevice *dino;
+	int ret;
+
 	pcibios_register_hba((struct pci_hba_data *) dino_dev);
 
 	pci_bios = &dino_bios_ops;   /* used by pci_scan_bus() */
 	pci_port = &dino_port_ops;
 
+
+        /* Needed for the serial port to work. Quite ugly for now */
+
+	dino = kmalloc(sizeof(struct busdevice), GFP_KERNEL);
+	if(!dino)
+		return -ENOMEM;
+	
+	dino->name = "Dino";
+	dino->hpa = d->hpa;
+	dino->find_irq = dino_find_irq;
+	
+
 	/*
 	** Note: SMP systems can make use of IRR1/IAR1 registers
 	**   But it won't buy much performance except in very
@@ -859,6 +883,20 @@
 		return(1);
 	}
 
+	/* Register busdevice for the serial port */
+
+	dino->parent_irq = gsc_irq.irq;
+	dino->eim = ((u32) gsc_irq.txn_addr) | gsc_irq.txn_data;
+
+	ret = register_busdevice(d,dino);
+	if (ret) {
+	    kfree(dino);
+	    return ret;
+	}
+
+	dino->busdev_region = dino_dev->dino_region;
+	
+
 	/*
 	** This enables DINO to generate interrupts when it sees
 	** any of it's inputs *change*. Just asserting an IRQ
@@ -945,7 +983,7 @@
 		dino_bridge_init(dino_dev);
 	}
 
-	if (dino_common_init(dino_dev))
+	if (dino_common_init(d,dino_dev))
 		return(1);
 
 	/*
diff -Nru linux.old/drivers/gsc/serial.c linux/drivers/gsc/serial.c
--- linux.old/drivers/gsc/serial.c	Thu May 31 16:56:14 2001
+++ linux/drivers/gsc/serial.c	Thu May 31 16:54:57 2001
@@ -35,6 +35,7 @@
 
 #include "busdevice.h"
 
+
 static int serial_line_nr;
 
 static int __init 
@@ -87,9 +89,12 @@
 	return 0;
 }
 
-
-static struct pa_iodc_driver serial_drivers_for[] = {
-  {HPHW_FIO, 0x05F, 0x0, 0x00081, 0x0, 0,		/* A-class 180 */
+static struct pa_iodc_driver serial_drivers_for[] = {  
+   {HPHW_FIO, 0x022, 0x0, 0x0008C, 0x0, 0,		/* B-Class 132 & 180 */
+	DRIVER_CHECK_HVERSION + DRIVER_CHECK_HVERSION_REV + 
+	DRIVER_CHECK_SVERSION + DRIVER_CHECK_HWTYPE,
+	"serial device", "B-132 L+", serial_init_chip},
+   {HPHW_FIO, 0x05F, 0x0, 0x00081, 0x0, 0,		/* A-class 180 */
 	DRIVER_CHECK_HVERSION + DRIVER_CHECK_HVERSION_REV + 
 	DRIVER_CHECK_SVERSION + DRIVER_CHECK_HWTYPE,
 	"serial device", "unknown", serial_init_chip},

--------------070204050007050803040106--
