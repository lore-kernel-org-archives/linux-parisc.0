From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Fix /proc/iomem
Date: Sun, 14 Oct 2007 08:48:27 -0600
Message-ID: <20071014144826.GF29934__2018.07328635386$1416624644$gmane$org@parisc-linux.org>
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


commit 5d04e33a34814d0cc3029f4b1ba0e62829cb4610
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Sun Oct 14 10:13:31 2007 -0400

    parisc: Fix infinite loop in /proc/iomem
    
    pcibios_link_hba_resources() could corrupt the resource tree by inserting
    resources in the wrong place.  Fix this by calling pci_claim_resource()
    for PCI-PCI bridges.  Delete pcibios_link_hba_resources as we shouldn't
    need it any more.  Also get rid of lba_claim_dev_resources() and just
    call pci_claim_resource() directly.
    
    Signed-off-by: Matthew Wilcox <willy@linux.intel.com>

diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 563df00..8263d49 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -194,31 +194,6 @@ void __init pcibios_init_bus(struct pci_bus *bus)
 	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, bridge_ctl);
 }
 
-
-/* KLUGE: Link the child and parent resources - generic PCI didn't */
-static void
-pcibios_link_hba_resources( struct resource *hba_res, struct resource *r)
-{
-	if (!r->parent) {
-		printk(KERN_EMERG "PCI: resource not parented! [%p-%p]\n",
-				(void*) r->start, (void*) r->end);
-		r->parent = hba_res;
-
-		/* reverse link is harder *sigh*  */
-		if (r->parent->child) {
-			if (r->parent->sibling) {
-				struct resource *next = r->parent->sibling;
-				while (next->sibling)
-					 next = next->sibling;
-				next->sibling = r;
-			} else {
-				r->parent->sibling = r;
-			}
-		} else
-			r->parent->child = r;
-	}
-}
-
 /* called by drivers/pci/setup-bus.c:pci_setup_bridge().  */
 void __devinit pcibios_resource_to_bus(struct pci_dev *dev,
 		struct pci_bus_region *region, struct resource *res)
@@ -245,13 +220,6 @@ void __devinit pcibios_resource_to_bus(struct pci_dev *dev,
 	DBG_RES("pcibios_resource_to_bus(%02x %s [%lx,%lx])\n",
 		bus->number, res->flags & IORESOURCE_IO ? "IO" : "MEM",
 		region->start, region->end);
-
-	/* KLUGE ALERT
-	** if this resource isn't linked to a "parent", then it seems
-	** to be a child of the HBA - lets link it in.
-	*/
-	pcibios_link_hba_resources(&hba->io_space, bus->resource[0]);
-	pcibios_link_hba_resources(&hba->lmmio_space, bus->resource[1]);
 }
 
 void pcibios_bus_to_resource(struct pci_dev *dev, struct resource *res,
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 5b86ee5..5eace9e 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -557,44 +557,6 @@ lba_bios_init(void)
 #ifdef CONFIG_64BIT
 
 /*
-** Determine if a device is already configured.
-** If so, reserve it resources.
-**
-** Read PCI cfg command register and see if I/O or MMIO is enabled.
-** PAT has to enable the devices it's using.
-**
-** Note: resources are fixed up before we try to claim them.
-*/
-static void
-lba_claim_dev_resources(struct pci_dev *dev)
-{
-	u16 cmd;
-	int i, srch_flags;
-
-	(void) pci_read_config_word(dev, PCI_COMMAND, &cmd);
-
-	srch_flags  = (cmd & PCI_COMMAND_IO) ? IORESOURCE_IO : 0;
-	if (cmd & PCI_COMMAND_MEMORY)
-		srch_flags |= IORESOURCE_MEM;
-
-	if (!srch_flags)
-		return;
-
-	for (i = 0; i <= PCI_ROM_RESOURCE; i++) {
-		if (dev->resource[i].flags & srch_flags) {
-			pci_claim_resource(dev, i);
-			DBG("   claimed %s %d [%lx,%lx]/%lx\n",
-				pci_name(dev), i,
-				dev->resource[i].start,
-				dev->resource[i].end,
-				dev->resource[i].flags
-				);
-		}
-	}
-}
-
-
-/*
  * truncate_pat_collision:  Deal with overlaps or outright collisions
  *			between PAT PDC reported ranges.
  *
@@ -653,7 +615,6 @@ truncate_pat_collision(struct resource *root, struct resource *new)
 }
 
 #else
-#define lba_claim_dev_resources(dev) do { } while (0)
 #define truncate_pat_collision(r,n)  (0)
 #endif
 
@@ -684,8 +645,12 @@ lba_fixup_bus(struct pci_bus *bus)
 	** pci_alloc_primary_bus() mangles this.
 	*/
 	if (bus->self) {
+		int i;
 		/* PCI-PCI Bridge */
 		pci_read_bridge_bases(bus);
+		for (i = PCI_BRIDGE_RESOURCES; i < PCI_NUM_RESOURCES; i++) {
+			pci_claim_resource(bus->self, i);
+		}
 	} else {
 		/* Host-PCI Bridge */
 		int err, i;
@@ -803,6 +768,9 @@ lba_fixup_bus(struct pci_bus *bus)
 				DBG("lba_fixup_bus() WTF? 0x%lx [%lx/%lx] XXX",
 					res->flags, res->start, res->end);
 			}
+			if ((i != PCI_ROM_RESOURCE) ||
+			    (res->flags & IORESOURCE_ROM_ENABLE))
+				pci_claim_resource(dev, i);
 		}
 
 #ifdef FBB_SUPPORT
@@ -814,11 +782,6 @@ lba_fixup_bus(struct pci_bus *bus)
 		bus->bridge_ctl &= ~(status & PCI_STATUS_FAST_BACK);
 #endif
 
-		if (is_pdc_pat()) {
-			/* Claim resources for PDC's devices */
-			lba_claim_dev_resources(dev);
-		}
