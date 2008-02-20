From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] pci: remove parisc consumer of the pci global_list
Date: Wed, 20 Feb 2008 15:14:24 -0600
Message-ID: <1203542065.3109.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Greg KH <greg@kroah.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The patch  pci-remove-global-list-of-pci-devices.patch misses the parisc
dino use of this.  However, it's a simple removal job.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

---

diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 03c763c..d9c6322 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -496,7 +496,6 @@ dino_card_setup(struct pci_bus *bus, void __iomem *base_addr)
 		list_for_each_safe(ln, tmp_ln, &bus->devices) {
 			struct pci_dev *dev = pci_dev_b(ln);
 
-			list_del(&dev->global_list);
 			list_del(&dev->bus_list);
 		}
 			
