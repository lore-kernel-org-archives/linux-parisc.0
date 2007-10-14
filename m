From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Fix pcibios_bus_to_resource etc
Date: Sun, 14 Oct 2007 10:28:55 -0600
Message-ID: <20071014162855.GG29934__38120.0092532255$1416624645$gmane$org@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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


I don't quite have time to finish this off before I get on a plane, but
it mostly works, so maybe somebody else can finish it off for me.

Basically, I fix pcibios_bus_to_resource for the ioport case and then
use it in lba_fixup_bus.  It should probably be used by Dino too.

Also unconditionally export both pcibios_bus_to_resource and
pcibios_resource_to_bus.  It's a public API, and should always be
available.

I also convert PCI_BUS_ADDR to pcibios_bus_addr to avoid the icky
ifdefs to avoid warnings.

The only problem is that a few resources end up with the wrong parent on
64-bit due to lack of f-extension:

f0100000-f01fffff : PCI Bus #04
  f0100000-f01fffff : PCI Bus #02
  f4900000-f49fffff : PCI Bus #02
  f6000000-f60fffff : PCI Bus #04

These PCI busses are the ones behind PCI-PCI bridges; eg

fffffffff6000000-fffffffff67fffff : PCI03 LMMIO                                 
  fffffffff6000000-fffffffff6001fff : 0000:04:04.1                              

Shouldn't be hard to fix, I'm just out of time.

diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 8263d49..a7eab22 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -194,57 +194,51 @@ void __init pcibios_init_bus(struct pci_bus *bus)
 	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, bridge_ctl);
 }
 
-/* called by drivers/pci/setup-bus.c:pci_setup_bridge().  */
-void __devinit pcibios_resource_to_bus(struct pci_dev *dev,
+/*
+ * Convert from global view of resources to bus-local view.  For port
+ * addresses, this means masking off the upper bits.  For mmio addresses,
+ * it can be more complex -- see include/asm/pci.h
+ */
+void pcibios_resource_to_bus(struct pci_dev *dev,
 		struct pci_bus_region *region, struct resource *res)
 {
-	struct pci_bus *bus = dev->bus;
-	struct pci_hba_data *hba = HBA_DATA(bus->bridge->platform_data);
-
 	if (res->flags & IORESOURCE_IO) {
-		/*
-		** I/O space may see busnumbers here. Something
-		** in the form of 0xbbxxxx where bb is the bus num
-		** and xxxx is the I/O port space address.
-		** Remaining address translation are done in the
-		** PCI Host adapter specific code - ie dino_out8.
-		*/
 		region->start = PCI_PORT_ADDR(res->start);
-		region->end   = PCI_PORT_ADDR(res->end);
+		region->end = PCI_PORT_ADDR(res->end);
 	} else if (res->flags & IORESOURCE_MEM) {
-		/* Convert MMIO addr to PCI addr (undo global virtualization) */
-		region->start = PCI_BUS_ADDR(hba, res->start);
-		region->end   = PCI_BUS_ADDR(hba, res->end);
+		struct pci_hba_data *hba =
+			HBA_DATA(dev->bus->bridge->platform_data);
+
+		region->start = pcibios_bus_addr(hba, res->start);
+		region->end = pcibios_bus_addr(hba, res->end);
 	}
 
 	DBG_RES("pcibios_resource_to_bus(%02x %s [%lx,%lx])\n",
-		bus->number, res->flags & IORESOURCE_IO ? "IO" : "MEM",
+		dev->bus->number, res->flags & IORESOURCE_IO ? "IO" : "MEM",
 		region->start, region->end);
 }
+EXPORT_SYMBOL(pcibios_resource_to_bus);
 
+/*
+ * Convert from bus-local view of resources to global view.  For port
+ * addresses, this means adding a bus number in bits 24-17.  For mmio
+ * addresses, it can be more complex -- see include/asm/pci.h
+ */
 void pcibios_bus_to_resource(struct pci_dev *dev, struct resource *res,
 			      struct pci_bus_region *region)
 {
-#ifdef CONFIG_64BIT
-	struct pci_bus *bus = dev->bus;
-	struct pci_hba_data *hba = HBA_DATA(bus->bridge->platform_data);
-#endif
+	struct pci_hba_data *hba = HBA_DATA(dev->bus->bridge->platform_data);
 
-	if (res->flags & IORESOURCE_MEM) {
+	if (res->flags & IORESOURCE_IO) {
+		int portbase = HBA_PORT_BASE(hba->hba_num);
+		res->start = portbase | region->start;
+		res->end = portbase | region->end;
+	} else if (res->flags & IORESOURCE_MEM) {
 		res->start = PCI_HOST_ADDR(hba, region->start);
 		res->end = PCI_HOST_ADDR(hba, region->end);
 	}
-
-	if (res->flags & IORESOURCE_IO) {
-		res->start = region->start;
-		res->end = region->end;
-	}
 }
-
-#ifdef CONFIG_HOTPLUG
-EXPORT_SYMBOL(pcibios_resource_to_bus);
 EXPORT_SYMBOL(pcibios_bus_to_resource);
-#endif
 
 /*
  * pcibios align resources() is called every time generic PCI code
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 5eace9e..d0128b9 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -743,31 +743,16 @@ lba_fixup_bus(struct pci_bus *bus)
 		/* Virtualize Device/Bridge Resources. */
 		for (i = 0; i < PCI_BRIDGE_RESOURCES; i++) {
 			struct resource *res = &dev->resource[i];
+			struct pci_bus_region region;
 
 			/* If resource not allocated - skip it */
-			if (!res->start)
+			if (!res->flags)
 				continue;
 
-			if (res->flags & IORESOURCE_IO) {
-				DBG("lba_fixup_bus() I/O Ports [%lx/%lx] -> ",
-					res->start, res->end);
-				res->start |= lba_portbase;
-				res->end   |= lba_portbase;
-				DBG("[%lx/%lx]\n", res->start, res->end);
-			} else if (res->flags & IORESOURCE_MEM) {
-				/*
-				** Convert PCI (IO_VIEW) addresses to
-				** processor (PA_VIEW) addresses
-				 */
-				DBG("lba_fixup_bus() MMIO [%lx/%lx] -> ",
-					res->start, res->end);
-				res->start = PCI_HOST_ADDR(HBA_DATA(ldev), res->start);
-				res->end   = PCI_HOST_ADDR(HBA_DATA(ldev), res->end);
-				DBG("[%lx/%lx]\n", res->start, res->end);
-			} else {
-				DBG("lba_fixup_bus() WTF? 0x%lx [%lx/%lx] XXX",
-					res->flags, res->start, res->end);
-			}
+			region.start = res->start;
+			region.end = res->end;
+			pcibios_bus_to_resource(dev, res, &region);
+
 			if ((i != PCI_ROM_RESOURCE) ||
 			    (res->flags & IORESOURCE_ROM_ENABLE))
 				pci_claim_resource(dev, i);
diff --git a/include/asm-parisc/pci.h b/include/asm-parisc/pci.h
index 61fbd57..7b5da00 100644
--- a/include/asm-parisc/pci.h
+++ b/include/asm-parisc/pci.h
@@ -100,16 +100,27 @@ static __inline__  int pci_is_lmmio(struct pci_hba_data *hba, unsigned long a)
 **	(1) PA_VIEW - IO_VIEW = lmmio_offset for both LMMIO and ELMMIO
 **	(2) PA_VIEW == IO_VIEW for GMMIO
 */
-#define PCI_BUS_ADDR(hba,a)	(PCI_IS_LMMIO(hba,a)	\
-		?  ((a) - hba->lmmio_space_offset)	/* mangle LMMIO */ \
-		: (a))					/* GMMIO */
+
+static inline unsigned long pcibios_bus_addr(struct pci_hba_data *hba,
+							unsigned long addr)
+{
+	if (PCI_IS_LMMIO(hba, addr))
+		return addr - hba->lmmio_space_offset;
+	return addr;
+}
+
 #define PCI_HOST_ADDR(hba,a)	(((a) & PCI_F_EXTEND) == 0 \
 		? (a) + hba->lmmio_space_offset \
 		: (a))
 
 #else	/* !CONFIG_64BIT */
 
-#define PCI_BUS_ADDR(hba,a)	(a)
+static inline unsigned long pcibios_bus_addr(struct pci_hba_data *hba,
+							unsigned long addr)
+{
+	return addr;
+}
+
 #define PCI_HOST_ADDR(hba,a)	(a)
 #define PCI_F_EXTEND		0UL
 #define PCI_IS_LMMIO(hba,a)	(1)	/* 32-bit doesn't support GMMIO */

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
