From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix up devices below a PCI-PCI MegaRAID controller
 bridge
Date: Wed, 16 Aug 2017 18:53:16 +0200
Message-ID: <20170816165316.GA11396@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

A MegaRAID PCI card in my rp5470 acts as PCI-PCI bridge.
Resource allocation for PCI devices behind such a bridge is quite incomplete,
so that syslog reports those warnings:

 LBA 0:10: PCI host bridge to bus 0000:50
 pci_bus 0000:50: root bus resource [io  0x80000-0x8ffff] (bus address [0x0000-0xffff])
 pci_bus 0000:50: root bus resource [mem 0xffffffff94000000-0xffffffff95ffffff] (bus address [0x94000000-0x95ffffff])
 pci_bus 0000:50: root bus resource [bus 50-57]
 pci 0000:50:00.0: [8086:0964] type 01 class 0x060400
 pci 0000:50:00.1: [8086:1960] type 00 class 0x0e0001
 pci 0000:50:00.1: reg 0x10: [mem 0x00000000-0x003fffff pref]
 pci 0000:50:00.1: reg 0x30: [mem 0x00000000-0x00007fff pref]
 pci 0000:50:00.0: Changing bridge control from 0x00000000 to 0x00000023
 pci_bus 0000:51: busn_res: can not insert [bus 51-ff] under [bus 50-57] (conflicts with (null) [bus 50-57])
 pci 0000:50:00.0: PCI bridge to [bus 51-ff]
 pci 0000:50:00.0:   bridge window [io  0x80000-0x80fff]
 pci 0000:50:00.0:   bridge window [mem 0x00000000-0x000fffff]
 pci 0000:50:00.0:   bridge window [mem 0x00000000-0x000fffff pref]
 pci 0000:50:00.0: can't claim BAR 14 [mem 0x00000000-0x000fffff]: no compatible bridge window
 pci 0000:50:00.0: can't claim BAR 15 [mem 0x00000000-0x000fffff pref]: no compatible bridge window
 pci 0000:50:00.0: can't claim BAR 16 [??? 0x00000000 flags 0x0]: no compatible bridge window
 pci_bus 0000:51: busn_res: [bus 51-ff] end is updated to 51
 pci 0000:50:00.0: BAR 16: [??? 0x00000000 flags 0x20000000] has bogus alignment
 pci 0000:50:00.1: BAR 0: assigned [mem 0xffffffff94000000-0xffffffff943fffff pref]
 pci 0000:50:00.0: BAR 14: assigned [mem 0xffffffff94400000-0xffffffff944fffff]
 pci 0000:50:00.0: BAR 15: assigned [mem 0xffffffff94500000-0xffffffff945fffff pref]
 pci 0000:50:00.1: BAR 6: assigned [mem 0xffffffff94600000-0xffffffff94607fff pref]
 pci 0000:50:00.0: PCI bridge to [bus 51]
 pci 0000:50:00.0:   bridge window [io  0x80000-0x80fff]
 pci 0000:50:00.0:   bridge window [mem 0xffffffff94400000-0xffffffff944fffff]
 pci 0000:50:00.0:   bridge window [mem 0xffffffff94500000-0xffffffff945fffff pref]

The patch below tries to improve the resource allocation.
Output is now:

 LBA 0:10: PCI host bridge to bus 0000:50
 pci_bus 0000:50: root bus resource [io  0x80000-0x8ffff] (bus address [0x0000-0xffff])
 pci_bus 0000:50: root bus resource [mem 0xffffffff94000000-0xffffffff95ffffff] (bus address [0x94000000-0x95ffffff])
 pci_bus 0000:50: root bus resource [bus 50-57]
 pci 0000:50:00.0: Changing bridge control from 0x00000000 to 0x00000023
 pci 0000:50:00.0: PCI bridge to [bus 51-ff]
 pci 0000:50:00.1: BAR 0: assigned [mem 0xffffffff94000000-0xffffffff943fffff pref]
 pci 0000:50:00.1: BAR 6: assigned [mem 0xffffffff94400000-0xffffffff94407fff pref]
 pci 0000:50:00.0: PCI bridge to [bus 51]
 pci 0000:50:00.0:   bridge window [io  0x80000-0x80fff]

Signed-off-by: Helge Deller <deller@gmx.de>
 
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index bc286cb..4dc6df3 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -667,6 +667,42 @@ extend_lmmio_len(unsigned long start, unsigned long end, unsigned long lba_len)
 #define truncate_pat_collision(r,n)  (0)
 #endif
 
+static void pcibios_allocate_bridge_resources(struct pci_dev *dev)
+{
+	int idx;
+	struct resource *r;
+
+	for (idx = PCI_BRIDGE_RESOURCES; idx < PCI_NUM_RESOURCES; idx++) {
+		r = &dev->resource[idx];
+		if (!r->flags)
+			continue;
+		if (r->parent)	/* Already allocated */
+			continue;
+		if (!r->start || pci_claim_bridge_resource(dev, idx) < 0) {
+			/*
+			 * Something is wrong with the region.
+			 * Invalidate the resource to prevent
+			 * child resource allocations in this
+			 * range.
+			 */
+			r->start = r->end = 0;
+			r->flags = 0;
+		}
+	}
+}
+
+static void pcibios_allocate_bus_resources(struct pci_bus *bus)
+{
+	struct pci_bus *child;
+
+	/* Depth-First Search on bus tree */
+	if (bus->self)
+		pcibios_allocate_bridge_resources(bus->self);
+	list_for_each_entry(child, &bus->children, node)
+		pcibios_allocate_bus_resources(child);
+}
+
+
 /*
 ** The algorithm is generic code.
 ** But it needs to access local data structures to get the IRQ base.
@@ -693,11 +729,11 @@ lba_fixup_bus(struct pci_bus *bus)
 	** pci_alloc_primary_bus() mangles this.
 	*/
 	if (bus->parent) {
-		int i;
 		/* PCI-PCI Bridge */
 		pci_read_bridge_bases(bus);
-		for (i = PCI_BRIDGE_RESOURCES; i < PCI_NUM_RESOURCES; i++)
-			pci_claim_bridge_resource(bus->self, i);
+
+		/* check an allocate bridge resources */
+		pcibios_allocate_bus_resources(bus);
 	} else {
 		/* Host-PCI Bridge */
 		int err;
