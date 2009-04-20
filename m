From: Grant Grundler <grundler@parisc-linux.org>
Subject: [PATCH] PARISC 2.6.30-rc1 advertise PCI devs after
	"assign_resources"
Date: Sun, 19 Apr 2009 22:28:22 -0600
Message-ID: <20090420042822.GA27021@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Alex Chiang asked me why PARISC was calling pci_bus_add_devices()
and pci_bus_assign_resources() in the opposite order from everyone else.
No reason and I couldn't see any data dependency.
Patch below applies cleanly to 2.6.30-rc2.

Later, I suspected the code worked only because no drivers would be
loaded/ready until much later in the system initialization sequence.

Tested "LBA" code on J6000 (32-bit) and A500 (64-bit SMP) with 2.6.30-rc2.
Not tested with any Dino controllers.
Not tested with PCI-PCI Bridge (TBD).

Reported-by: Alex Chiang <achiang@hp.com>
Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

---
Kyle, Helge,
Including this into 2.6.31 would be fine since there is no
corresponding bug report.  I'd prefer sooner if possible but
recognize it doesn't have to. thanks!

 dino.c    |   10 +++++-----
 lba_pci.c |   10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)


diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 52ae0b1..d327c2d 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -1019,22 +1019,22 @@ static int __init dino_probe(struct parisc_device *dev)
 	** It's not used to avoid chicken/egg problems
 	** with configuration accessor functions.
 	*/
-	bus = pci_scan_bus_parented(&dev->dev, dino_current_bus,
-				    &dino_cfg_ops, NULL);
+	dino_dev->hba.hba_bus = bus = pci_scan_bus_parented(&dev->dev,
+			 dino_current_bus, &dino_cfg_ops, NULL);
+
 	if(bus) {
-		pci_bus_add_devices(bus);
 		/* This code *depends* on scanning being single threaded
 		 * if it isn't, this global bus number count will fail
 		 */
 		dino_current_bus = bus->subordinate + 1;
 		pci_bus_assign_resources(bus);
+		pci_bus_add_devices(bus);
 	} else {
-		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (probably duplicate bus number %d)\n",
+		printk(KERN_ERR "ERROR: failed to scan PCI bus on %s (duplicate bus number %d?)\n",
 		       dev_name(&dev->dev), dino_current_bus);
 		/* increment the bus number in case of duplicates */
 		dino_current_bus++;
 	}
-	dino_dev->hba.hba_bus = bus;
 	return 0;
 }
 
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 59fbbf1..f2661e1 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1509,10 +1509,6 @@ lba_driver_probe(struct parisc_device *dev)
 	lba_bus = lba_dev->hba.hba_bus =
 		pci_scan_bus_parented(&dev->dev, lba_dev->hba.bus_num.start,
 				cfg_ops, NULL);
-	if (lba_bus) {
-		lba_next_bus = lba_bus->subordinate + 1;
-		pci_bus_add_devices(lba_bus);
-	}
 
 	/* This is in lieu of calling pci_assign_unassigned_resources() */
 	if (is_pdc_pat()) {
@@ -1533,7 +1529,6 @@ lba_driver_probe(struct parisc_device *dev)
 	}
 	pci_enable_bridges(lba_bus);
 
