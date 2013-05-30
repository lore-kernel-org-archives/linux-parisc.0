From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc/PCI: lba: fix: convert to pci_create_root_bus() for
 correct root bus resources
Date: Thu, 30 May 2013 16:10:33 +0200
Message-ID: <20130530141033.GA3665@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Bjorn Helgaas <bhelgaas@google.com>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This commit dc7dce280a26d069ad5a58bf3da86e5e83415c65
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Fri Oct 28 16:27:27 2011 -0600
   parisc/PCI: lba: convert to pci_create_root_bus() for correct root bus
                    resources

  Supply root bus resources to pci_create_root_bus() so they're correct
  immediately.  This fixes the problem of "early" and "header" quirks seeing
  incorrect root bus resources.

forgot to set the IORESOURCE_BUS bus flag which led to incorrect resource
assignments and a non-working stifb framebuffer on most parisc machines.

LBA 10:1: PCI host bridge to bus 0000:01
pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
pci_bus 0000:01: root bus resource [mem 0xfffffffffa000000-0xfffffffffbffffff] (bus address [0xfa000000-0xfbffffff])
pci_bus 0000:01: root bus resource [mem 0xfffffffff4800000-0xfffffffff4ffffff] (bus address [0xf4800000-0xf4ffffff])
pci_bus 0000:01: root bus resource [??? 0x00000001 flags 0x0]

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 2ef7103..29f3d7d 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1494,7 +1494,7 @@ lba_driver_probe(struct parisc_device *dev)
 
 	pci_add_resource_offset(&resources, &lba_dev->hba.io_space,
 				HBA_PORT_BASE(lba_dev->hba.hba_num));
-	if (lba_dev->hba.elmmio_space.start)
+	if (lba_dev->hba.elmmio_space.flags)
 		pci_add_resource_offset(&resources, &lba_dev->hba.elmmio_space,
 					lba_dev->hba.lmmio_space_offset);
 	if (lba_dev->hba.lmmio_space.flags)
@@ -1503,6 +1503,7 @@ lba_driver_probe(struct parisc_device *dev)
 	if (lba_dev->hba.gmmio_space.flags)
 		pci_add_resource(&resources, &lba_dev->hba.gmmio_space);
 
+	lba_dev->hba.bus_num.flags = IORESOURCE_BUS;
 	pci_add_resource(&resources, &lba_dev->hba.bus_num);
 
 	dev->dev.platform_data = lba_dev;
