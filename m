Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 993714843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Dec 2003 21:37:35 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBA4bTa10330 for <parisc-linux@lists.parisc-linux.org>;
	Tue, 9 Dec 2003 23:37:29 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 09 Dec 2003 23:37:16 -0500
Message-Id: <1071031038.1977.1.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] proposed changes to dino.c
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This updates dino to configure unassigned resources (primarily so I can
get it to recognise my yenta cardbus bridge).

The side effect is that it will reorder all the resources in the dino
window.

James

===== drivers/parisc/dino.c 1.9 vs edited =====
--- 1.9/drivers/parisc/dino.c	Fri Oct 10 05:11:03 2003
+++ edited/drivers/parisc/dino.c	Tue Dec  9 22:33:18 2003
@@ -165,6 +165,13 @@
 
 #define DINO_CFG_TOK(bus,dfn,pos) ((u32) ((bus)<<16 | (dfn)<<8 | (pos)))
 
+/*
+ * keep the current highest bus count to assist in allocating busses.  This
+ * tries to keep a global bus count total so that when we discover an 
+ * entirely new bus, it can be given a unique bus number.
+ */
+static int dino_current_bus = 0;
+
 static int dino_cfg_read(struct pci_bus *bus, unsigned int devfn, int where,
 		int size, u32 *val)
 {
@@ -559,8 +566,14 @@
 			__FUNCTION__, bus, bus->secondary, bus->dev->platform_data);
 
 	/* Firmware doesn't set up card-mode dino, so we have to */
-	if (is_card_dino(&dino_dev->hba.dev->id))
+	if (is_card_dino(&dino_dev->hba.dev->id)) {
 		dino_card_setup(bus, dino_dev->hba.base_addr);
+	} else {
+		bus->resource[0] = &(dino_dev->hba.io_space);
+		bus->resource[1] = &(dino_dev->hba.lmmio_space); 
+		pci_bus_assign_resources(bus);
+		pci_enable_bridges(bus);
+	}
 
 	/* If this is a PCI-PCI Bridge, read the window registers etc */
 	if (bus->self)
@@ -595,9 +608,29 @@
 			}
 #endif
 		}
+		if(dev->irq == 255) {
+#if 0
+			/* This code tries to assign an unassigned interrupt
+			 * leave it disabled unless you know what you're doing
+			 * since the pin<->interrupt line mapping varies
+			 * by bus and machine */
+
+			u32 irq_pin;
+			
+			dino_cfg_read(dev->bus, dev->devfn, PCI_INTERRUPT_PIN, 1, &irq_pin);
+			dev->irq = (irq_pin + PCI_SLOT(dev->devfn)) % 4 ;
+			dino_cfg_write(dev->bus, dev->devfn, PCI_INTERRUPT_LINE, 1, dev->irq);
+			dev->irq += dino_dev->dino_region->data.irqbase
+			printk(KERN_WARNING "Device %s has undefined IRQ, setting to %d\n", dev->slot_name, irq_pin);
+#else
+			dev->irq = 65535;
+			printk(KERN_WARNING "Device %s has unassigned IRQ\n", dev->slot_name);	
+#endif
+		} else {
 
-		/* Adjust INT_LINE for that busses region */
-		dev->irq = dino_dev->dino_region->data.irqbase + dev->irq;
+			/* Adjust INT_LINE for that busses region */
+			dev->irq += dino_dev->dino_region->data.irqbase;
+		}
 	}
 }
 
@@ -826,6 +859,7 @@
 	const int name_len = 32;
 	char *name;
 	int is_cujo = 0;
+	struct pci_bus *bus;
 
 	name = kmalloc(name_len, GFP_KERNEL);
 	if(name)
@@ -911,9 +945,19 @@
 	** It's not used to avoid chicken/egg problems
 	** with configuration accessor functions.
 	*/
-	dino_dev->hba.hba_bus = 
-		pci_scan_bus_parented(&dev->dev, dino_dev->hba.hba_num,
-				      &dino_cfg_ops, NULL);
+	bus = pci_scan_bus_parented(&dev->dev, dino_current_bus,
+				    &dino_cfg_ops, NULL);
+	if(bus) {
+		/* This code *depends* on scanning being single threaded
+		 * if it isn't, this global bus number count will fail
+		 */
+		dino_current_bus = bus->subordinate + 1;
+	} else {
+		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (probably duplicate bus number %d)\n", dev->dev.bus_id, dino_current_bus);
+		/* increment the bus number in case of duplicates */
+		dino_current_bus++;
+	}
+	dino_dev->hba.hba_bus = bus;
 	return 0;
 }
 
