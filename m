From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 4/6] parisc/PCI: Use list_for_each_entry() for bus->devices
	traversal
Date: Thu, 16 Aug 2012 17:26:36 -0600
Message-ID: <20120816232635.3662.73917.stgit@bhelgaas.mtv.corp.google.com>
References: <20120816232620.3662.90438.stgit@bhelgaas.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-parisc@vger.kernel.org
To: linux-pci@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120816232620.3662.90438.stgit@bhelgaas.mtv.corp.google.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Replace list_for_each() + pci_dev_b() with the simpler
list_for_each_entry().

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
CC: linux-parisc@vger.kernel.org
---
 drivers/parisc/dino.c    |    6 ++----
 drivers/parisc/lba_pci.c |    7 ++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index ffddc4f..4581ee0 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -477,14 +477,12 @@ dino_card_setup(struct pci_bus *bus, void __iomem *base_addr)
 	if (ccio_allocate_resource(dino_dev->hba.dev, res, _8MB,
 				F_EXTEND(0xf0000000UL) | _8MB,
 				F_EXTEND(0xffffffffUL) &~ _8MB, _8MB) < 0) {
-		struct list_head *ln, *tmp_ln;
+		struct pci_dev *dev, *tmp;
 
 		printk(KERN_ERR "Dino: cannot attach bus %s\n",
 		       dev_name(bus->bridge));
 		/* kill the bus, we can't do anything with it */
-		list_for_each_safe(ln, tmp_ln, &bus->devices) {
-			struct pci_dev *dev = pci_dev_b(ln);
-
+		list_for_each_entry_safe(dev, tmp, &bus->devices, bus_list) {
 			list_del(&dev->bus_list);
 		}
 			
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 4ce57c9..fdd63a6 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -629,7 +629,6 @@ truncate_pat_collision(struct resource *root, struct resource *new)
 static void
 lba_fixup_bus(struct pci_bus *bus)
 {
-	struct list_head *ln;
 	struct pci_dev *dev;
 #ifdef FBB_SUPPORT
 	u16 status;
@@ -711,10 +710,9 @@ lba_fixup_bus(struct pci_bus *bus)
 
 	}
 
-	list_for_each(ln, &bus->devices) {
+	list_for_each_entry(dev, &bus->devices, bus_list) {
 		int i;
 
-		dev = pci_dev_b(ln);
 		DBG("lba_fixup_bus() %s\n", pci_name(dev));
 
 		/* Virtualize Device/Bridge Resources. */
@@ -771,8 +769,7 @@ lba_fixup_bus(struct pci_bus *bus)
 	}
 
 	/* Lastly enable FBB/PERR/SERR on all devices too */
-	list_for_each(ln, &bus->devices) {
-		dev = pci_dev_b(ln);
+	list_for_each_entry(dev, &bus->devices, bus_list) {
 		(void) pci_read_config_word(dev, PCI_COMMAND, &status);
 		status |= PCI_COMMAND_PARITY | PCI_COMMAND_SERR | fbb_enable;
 		(void) pci_write_config_word(dev, PCI_COMMAND, status);

