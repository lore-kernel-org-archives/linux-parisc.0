From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] parisc: Remove unused pcibios_init_bus()
Date: Tue, 01 Dec 2015 10:41:47 -0600
Message-ID: <20151201164147.18471.52359.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There are no callers of pcibios_init_bus(), so remove it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/parisc/kernel/pci.c |   18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 64f2764..c99f3dd 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -171,24 +171,6 @@ void pcibios_set_master(struct pci_dev *dev)
 }
 
 
-void __init pcibios_init_bus(struct pci_bus *bus)
-{
-	struct pci_dev *dev = bus->self;
-	unsigned short bridge_ctl;
-
-	/* We deal only with pci controllers and pci-pci bridges. */
-	if (!dev || (dev->class >> 8) != PCI_CLASS_BRIDGE_PCI)
-		return;
-
-	/* PCI-PCI bridge - set the cache line and default latency
-	   (32) for primary and secondary buses. */
-	pci_write_config_byte(dev, PCI_SEC_LATENCY_TIMER, 32);
-
-	pci_read_config_word(dev, PCI_BRIDGE_CONTROL, &bridge_ctl);
-	bridge_ctl |= PCI_BRIDGE_CTL_PARITY | PCI_BRIDGE_CTL_SERR;
-	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, bridge_ctl);
-}
