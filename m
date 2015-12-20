From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Initialize PCI bride cache line and default latency
Date: Sun, 20 Dec 2015 12:02:46 +0100
Message-ID: <20151220110246.GA14264@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

PCI controllers and pci-pci bridges may have not been fully initialized
regarding cache line and defaul latency.
This partly reverts commit 5f0e9b4 (parisc: Remove unused pcibios_init_bus())

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pci.h b/arch/parisc/include/asm/pci.h
index 71889ea..89c53bf 100644
--- a/arch/parisc/include/asm/pci.h
+++ b/arch/parisc/include/asm/pci.h
@@ -167,6 +167,7 @@ static inline void pcibios_register_hba(struct pci_hba_data *x)
 {
 }
 #endif
+extern void pcibios_init_bridge(struct pci_dev *);
 
 /*
  * pcibios_assign_all_busses() is used in drivers/pci/pci.c:pci_do_scan_bus()
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index c99f3dd..125c05a 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -170,6 +170,31 @@ void pcibios_set_master(struct pci_dev *dev)
 			      (0x80 << 8) | pci_cache_line_size);
 }
 
+/*
+ * pcibios_init_bridge() initializes cache line and default latency
+ * for pci controllers and pci-pci bridges
+ */
+void __init pcibios_init_bridge(struct pci_dev *dev)
+{
+	unsigned short bridge_ctl, bridge_ctl_new;
+
+	/* We deal only with pci controllers and pci-pci bridges. */
+	if (!dev || (dev->class >> 8) != PCI_CLASS_BRIDGE_PCI)
+		return;
+
+	/* PCI-PCI bridge - set the cache line and default latency
+	   (32) for primary and secondary buses. */
+	pci_write_config_byte(dev, PCI_SEC_LATENCY_TIMER, 32);
+
+	pci_read_config_word(dev, PCI_BRIDGE_CONTROL, &bridge_ctl);
+
+	bridge_ctl_new = bridge_ctl | PCI_BRIDGE_CTL_PARITY |
+		PCI_BRIDGE_CTL_SERR | PCI_BRIDGE_CTL_MASTER_ABORT;
+	dev_info(&dev->dev, "Changing bridge control from 0x%08x to 0x%08x\n",
+		bridge_ctl, bridge_ctl_new);
+
+	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, bridge_ctl_new);
+}
 
 /*
  * pcibios align resources() is called every time generic PCI code
diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index a0580af..1133b5c 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -599,8 +599,10 @@ dino_fixup_bus(struct pci_bus *bus)
 		** P2PB's only have 2 BARs, no IRQs.
 		** I'd like to just ignore them for now.
 		*/
-		if ((dev->class >> 8) == PCI_CLASS_BRIDGE_PCI)
+		if ((dev->class >> 8) == PCI_CLASS_BRIDGE_PCI)  {
+			pcibios_init_bridge(dev);
 			continue;
+		}
 
 		/* null out the ROM resource if there is one (we don't
 		 * care about an expansion rom on parisc, since it
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 42844c2..751935c 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -787,11 +787,14 @@ lba_fixup_bus(struct pci_bus *bus)
 		bus->bridge_ctl &= ~(status & PCI_STATUS_FAST_BACK);
 #endif
 
+
                 /*
 		** P2PB's have no IRQs. ignore them.
 		*/
-		if ((dev->class >> 8) == PCI_CLASS_BRIDGE_PCI)
+		if ((dev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
+			pcibios_init_bridge(dev);
 			continue;
+		}
 
 		/* Adjust INTERRUPT_LINE for this dev */
 		iosapic_fixup_irq(ldev->iosapic_obj, dev);
