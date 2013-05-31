From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc/PCI: lba: fix: convert to pci_create_root_bus()
 for correct root bus resources (v2)
Date: Sat, 1 Jun 2013 00:24:58 +0200
Message-ID: <20130531222458.GA7200@p100.box>
References: <20130530141033.GA3665@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Bjorn Helgaas <bhelgaas@google.com>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130530141033.GA3665@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

changes in v2:
- updated the patch to change all .start -> .flags
- dropped setting IORESOURCE_BUS, will use Bjorns patch instead.


commit dc7dce280a
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Fri Oct 28 16:27:27 2011 -0600
   parisc/PCI: lba: convert to pci_create_root_bus() for correct root bus
                    resources

  Supply root bus resources to pci_create_root_bus() so they're correct
  immediately.  This fixes the problem of "early" and "header" quirks seeing
  incorrect root bus resources.

added tests for elmmio_space.start while it should use
elmmio_space.flags.  This for example led to incorrect resource
assignments and a non-working stifb framebuffer on most parisc machines.

LBA 10:1: PCI host bridge to bus 0000:01
pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
pci_bus 0000:01: root bus resource [mem 0xfffffffffa000000-0xfffffffffbffffff] (bus address [0xfa000000-0xfbffffff])
pci_bus 0000:01: root bus resource [mem 0xfffffffff4800000-0xfffffffff4ffffff] (bus address [0xf4800000-0xf4ffffff])
pci_bus 0000:01: root bus resource [??? 0x00000001 flags 0x0]

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 2ef7103..90c5805 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -668,7 +668,7 @@ lba_fixup_bus(struct pci_bus *bus)
 			BUG();
 		}
 
-		if (ldev->hba.elmmio_space.start) {
+		if (ldev->hba.elmmio_space.flags) {
 			err = request_resource(&iomem_resource,
 					&(ldev->hba.elmmio_space));
 			if (err < 0) {
@@ -993,7 +993,7 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 
 		case PAT_LMMIO:
 			/* used to fix up pre-initialized MEM BARs */
-			if (!lba_dev->hba.lmmio_space.start) {
+			if (!lba_dev->hba.lmmio_space.flags) {
 				sprintf(lba_dev->hba.lmmio_name,
 						"PCI%02x LMMIO",
 						(int)lba_dev->hba.bus_num.start);
@@ -1001,7 +1001,7 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 					io->start;
 				r = &lba_dev->hba.lmmio_space;
 				r->name = lba_dev->hba.lmmio_name;
-			} else if (!lba_dev->hba.elmmio_space.start) {
+			} else if (!lba_dev->hba.elmmio_space.flags) {
 				sprintf(lba_dev->hba.elmmio_name,
 						"PCI%02x ELMMIO",
 						(int)lba_dev->hba.bus_num.start);
@@ -1494,7 +1494,7 @@ lba_driver_probe(struct parisc_device *dev)
 
 	pci_add_resource_offset(&resources, &lba_dev->hba.io_space,
 				HBA_PORT_BASE(lba_dev->hba.hba_num));
-	if (lba_dev->hba.elmmio_space.start)
+	if (lba_dev->hba.elmmio_space.flags)
 		pci_add_resource_offset(&resources, &lba_dev->hba.elmmio_space,
 					lba_dev->hba.lmmio_space_offset);
 	if (lba_dev->hba.lmmio_space.flags)
