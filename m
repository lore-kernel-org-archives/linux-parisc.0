Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66A514879
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Dec 2003 14:54:37 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBALsZa24297; Wed, 10 Dec 2003 16:54:35 -0500
Subject: Re: [parisc-linux] proposed changes to dino.c
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20031210045429.GA18782@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
Content-Type: text/plain
Date: 10 Dec 2003 16:54:24 -0500
Message-Id: <1071093265.1730.27.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2003-12-09 at 23:54, Grant Grundler wrote:
> James and I talked about this offline. Issue was card-mode dino
> and the PCI yenta bridge were colliding on the bus numbering.
> The card-mode Dino bus numbering was assuming no PCI-PCI bridges
> for *all* the host bridges, not just the card-mode bridges.
> I expect a combination of 4-port tulip and card-mode dinoe would
> have exposed this problem too.

OK, the attached actually correctly configures and works with both the
cardbus bridge and the four port.  In order to get the four port
working, I've actually added bridge configuration code now, so the
cardbus dino with bridges should also actually work (although I didn't
remove the check on them).

Let me know how this works.

James

===== drivers/parisc/dino.c 1.9 vs edited =====
--- 1.9/drivers/parisc/dino.c	Fri Oct 10 05:11:03 2003
+++ edited/drivers/parisc/dino.c	Wed Dec 10 15:50:42 2003
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
@@ -504,8 +511,6 @@
 	DBG("DINO GSC WRITE i=%d, start=%lx, dino addr = %lx\n",
 	    i, res->start, base_addr + DINO_IO_ADDR_EN);
 	gsc_writel(1 << i, base_addr + DINO_IO_ADDR_EN);
-
-	pci_bus_assign_resources(bus);
 }
 
 static void __init
@@ -546,6 +551,9 @@
 	dino_cfg_write(dev->bus, dev->devfn, PCI_INTERRUPT_LINE, 1, dev->irq); 
 }
 
+/* The alignment contraints for PCI bridges under dino */
+#define DINO_BRIDGE_ALIGN 0x100000
+
 
 static void __init
 dino_fixup_bus(struct pci_bus *bus)
@@ -559,13 +567,48 @@
 			__FUNCTION__, bus, bus->secondary, bus->dev->platform_data);
 
 	/* Firmware doesn't set up card-mode dino, so we have to */
-	if (is_card_dino(&dino_dev->hba.dev->id))
+	if (is_card_dino(&dino_dev->hba.dev->id)) {
 		dino_card_setup(bus, dino_dev->hba.base_addr);
+	} else if(bus->parent == NULL) {
+		/* must have a dino above it, reparent the resources
+		 * into the dino window */
+		bus->resource[0] = &(dino_dev->hba.io_space);
+		bus->resource[1] = &(dino_dev->hba.lmmio_space); 
+	} else if(bus->self) {
+		int i;
 
-	/* If this is a PCI-PCI Bridge, read the window registers etc */
-	if (bus->self)
 		pci_read_bridge_bases(bus);
 
+
+		for(i = 0; i < PCI_NUM_RESOURCES; i++) {
+			if((bus->self->resource[i].flags & (IORESOURCE_IO | IORESOURCE_MEM)) == 0)
+				continue;
+			
+			if(bus->self->resource[i].flags & IORESOURCE_MEM) {
+				/* There's a quirk to alignment of
+				 * bridge memory resources: the start
+				 * is the alignment and start-end is
+				 * the size.  However, firmware will
+				 * have assigned start and end, so we
+				 * need to take this into account */
+				bus->self->resource[i].end = bus->self->resource[i].end - bus->self->resource[i].start + DINO_BRIDGE_ALIGN;
+				bus->self->resource[i].start = DINO_BRIDGE_ALIGN;
+				
+			}
+					
+			DBG("DEBUG %s assigning %d [0x%lx,0x%lx]\n",
+			    bus->self->dev.bus_id, i,
+			    bus->self->resource[i].start,
+			    bus->self->resource[i].end);
+			pci_assign_resource(bus->self, i);
+			DBG("DEBUG %s after assign %d [0x%lx,0x%lx]\n",
+			    bus->self->dev.bus_id, i,
+			    bus->self->resource[i].start,
+			    bus->self->resource[i].end);
+		}
+	}
+
+
 	list_for_each(ln, &bus->devices) {
 		int i;
 
@@ -595,9 +638,39 @@
 			}
 #endif
 		}
+		/* null out the ROM resource if there is one (we don't
+		 * care about an expansion rom on parisc, since it
+		 * usually contains (x86) bios code) */
+		dev->resource[PCI_ROM_RESOURCE].flags = 0;
+		dev->resource[PCI_ROM_RESOURCE].start = 0;
+		dev->resource[PCI_ROM_RESOURCE].end = 0;
+				
+		if(dev->irq == 255) {
+
+#ifdef DINO_FIX_UNASSIGNED_INTERRUPTS
+
+			/* This code tries to assign an unassigned
+			 * interrupt.  Leave it disabled unless you
+			 * *really* know what you're doing since the
+			 * pin<->interrupt line mapping varies by bus
+			 * and machine */
+
+			u32 irq_pin;
+			
+			dino_cfg_read(dev->bus, dev->devfn, PCI_INTERRUPT_PIN, 1, &irq_pin);
+			dev->irq = (irq_pin + PCI_SLOT(dev->devfn) - 1) % 4 ;
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
 
@@ -826,6 +899,7 @@
 	const int name_len = 32;
 	char *name;
 	int is_cujo = 0;
+	struct pci_bus *bus;
 
 	name = kmalloc(name_len, GFP_KERNEL);
 	if(name)
@@ -911,9 +985,20 @@
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
+		pci_bus_assign_resources(bus);
+	} else {
+		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (probably duplicate bus number %d)\n", dev->dev.bus_id, dino_current_bus);
+		/* increment the bus number in case of duplicates */
+		dino_current_bus++;
+	}
+	dino_dev->hba.hba_bus = bus;
 	return 0;
 }
 
