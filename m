From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Fri, 17 Nov 2006 13:30:42 -0700
Message-ID: <20061117203041.GD18567@parisc-linux.org>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
	<20061115122506.523bdd01.gmsoft@tuxicoman.be>
	<20061115122352.GH19143@parisc-linux.org>
	<20061115190830.f8e99725.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061115190830.f8e99725.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Nov 15, 2006 at 07:08:30PM +0100, Guy Martin wrote:
> I've put the complete dmesg and lspci output (both numerical and not) here :
> https://www.tuxicoman.be/temp/c3600-pci-debug.logs

Thanks.  Please try this patch (cribbed somewhat from jejb's patch for
Dino back in December 2003 ;-)

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index ad4a1a1..963f35c 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1406,6 +1406,14 @@ lba_hw_init(struct lba_device *d)
 	return 0;
 }
 
+/*
+ * Unfortunately, when firmware numbers busses, it doesn't take into account
+ * Cardbus bridges.  So we have to renumber the busses to suit ourselves.
+ * Elroy/Mercury don't actually know what bus number they're attached to;
+ * we use bus 0 to indicate the directly attached bus and any other bus
+ * number will be taken care of by the PCI-PCI bridge.
+ */
+static unsigned int lba_next_bus = 0;
 
 
 /*
@@ -1529,16 +1537,20 @@ lba_driver_probe(struct parisc_device *d
 		lba_legacy_resources(dev, lba_dev);
 	}
 
-	/* 
-	** Tell PCI support another PCI bus was found.
-	** Walks PCI bus for us too.
-	*/
+	if (lba_dev->hba.bus_num.start < lba_next_bus) {
+		DBG(KERN_DEBUG "Reassigning firmware bus %d as Linux bus %d\n",
+			lba_dev->hba.bus_num.start, lba_next_bus);
+		lba_dev->hba.bus_num.start = lba_next_bus;
+	}
+
 	dev->dev.platform_data = lba_dev;
 	lba_bus = lba_dev->hba.hba_bus =
 		pci_scan_bus_parented(&dev->dev, lba_dev->hba.bus_num.start,
 				cfg_ops, NULL);
-	if (lba_bus)
+	if (lba_bus) {
+		lba_next_bus = lba_bus->subordinate + 1;
 		pci_bus_add_devices(lba_bus);
+	}
 
 	/* This is in lieu of calling pci_assign_unassigned_resources() */
 	if (is_pdc_pat()) {
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
