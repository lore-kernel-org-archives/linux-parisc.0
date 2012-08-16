From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 3/6] parisc/PCI: Enable PERR/SERR on all devices
Date: Thu, 16 Aug 2012 17:26:30 -0600
Message-ID: <20120816232630.3662.57336.stgit@bhelgaas.mtv.corp.google.com>
References: <20120816232620.3662.90438.stgit@bhelgaas.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-parisc@vger.kernel.org
To: linux-pci@vger.kernel.org
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20120816232620.3662.90438.stgit@bhelgaas.mtv.corp.google.com>
List-ID: <linux-pci.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Previously, we enabled PERR & SERR for the first device on the bus, but
left other devices alone.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
CC: linux-parisc@vger.kernel.org
---
 drivers/parisc/lba_pci.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 4f9cf24..4ce57c9 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -630,6 +630,7 @@ static void
 lba_fixup_bus(struct pci_bus *bus)
 {
 	struct list_head *ln;
+	struct pci_dev *dev;
 #ifdef FBB_SUPPORT
 	u16 status;
 #endif
@@ -712,8 +713,8 @@ lba_fixup_bus(struct pci_bus *bus)
 
 	list_for_each(ln, &bus->devices) {
 		int i;
-		struct pci_dev *dev = pci_dev_b(ln);
 
+		dev = pci_dev_b(ln);
 		DBG("lba_fixup_bus() %s\n", pci_name(dev));
 
 		/* Virtualize Device/Bridge Resources. */
@@ -771,6 +772,7 @@ lba_fixup_bus(struct pci_bus *bus)
 
 	/* Lastly enable FBB/PERR/SERR on all devices too */
 	list_for_each(ln, &bus->devices) {
+		dev = pci_dev_b(ln);
 		(void) pci_read_config_word(dev, PCI_COMMAND, &status);
 		status |= PCI_COMMAND_PARITY | PCI_COMMAND_SERR | fbb_enable;
 		(void) pci_write_config_word(dev, PCI_COMMAND, status);
