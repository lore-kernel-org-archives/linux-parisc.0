From: Helge Deller <deller@gmx.de>
Subject: [PATCH 09/14] parisc: Fix section mismatches in parisc core drivers
Date: Mon, 21 Aug 2017 22:22:56 +0200
Message-ID: <1503346981-28024-10-git-send-email-deller@gmx.de>
References: <1503346981-28024-1-git-send-email-deller@gmx.de>
Cc: John David Anglin <dave.anglin@bell.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1503346981-28024-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/parisc/asp.c         | 4 ++--
 drivers/parisc/ccio-dma.c    | 4 ++--
 drivers/parisc/ccio-rm-dma.c | 6 +++---
 drivers/parisc/dino.c        | 4 ++--
 drivers/parisc/eisa.c        | 4 ++--
 drivers/parisc/hppb.c        | 6 +++---
 drivers/parisc/lasi.c        | 4 ++--
 drivers/parisc/lba_pci.c     | 4 ++--
 drivers/parisc/sba_iommu.c   | 6 +++---
 drivers/parisc/superio.c     | 4 ++--
 drivers/parisc/wax.c         | 4 ++--
 11 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/parisc/asp.c b/drivers/parisc/asp.c
index 6a1ab25..7c143f0 100644
--- a/drivers/parisc/asp.c
+++ b/drivers/parisc/asp.c
@@ -118,12 +118,12 @@ static int __init asp_init_chip(struct parisc_device *dev)
 	return ret;
 }
 
-static struct parisc_device_id asp_tbl[] = {
+static struct parisc_device_id asp_tbl[] __initconst = {
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00070 },
 	{ 0, }
 };
 
-struct parisc_driver asp_driver = {
+struct parisc_driver asp_driver __refdata = {
 	.name =		"asp",
 	.id_table =	asp_tbl,
 	.probe =	asp_init_chip,
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 6aa1e7f..64d491e 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1241,7 +1241,7 @@ ccio_get_iotlb_size(struct parisc_device *dev)
 #endif /* 0 */
 
 /* We *can't* support JAVA (T600). Venture there at your own risk. */
-static const struct parisc_device_id ccio_tbl[] = {
+static struct parisc_device_id ccio_tbl[] __initconst = {
 	{ HPHW_IOA, HVERSION_REV_ANY_ID, U2_IOA_RUNWAY, 0xb }, /* U2 */
 	{ HPHW_IOA, HVERSION_REV_ANY_ID, UTURN_IOA_RUNWAY, 0xb }, /* UTurn */
 	{ 0, }
@@ -1249,7 +1249,7 @@ static const struct parisc_device_id ccio_tbl[] = {
 
 static int ccio_probe(struct parisc_device *dev);
 
-static struct parisc_driver ccio_driver = {
+static struct parisc_driver ccio_driver __refdata = {
 	.name =		"ccio",
 	.id_table =	ccio_tbl,
 	.probe =	ccio_probe,
diff --git a/drivers/parisc/ccio-rm-dma.c b/drivers/parisc/ccio-rm-dma.c
index 1bf9880..93cded9 100644
--- a/drivers/parisc/ccio-rm-dma.c
+++ b/drivers/parisc/ccio-rm-dma.c
@@ -163,7 +163,7 @@ static struct pci_dma_ops ccio_ops = {
 ** If so, initialize the chip and tell other partners in crime they
 ** have work to do.
 */
-static int
+static int __init
 ccio_probe(struct parisc_device *dev)
 {
 	printk(KERN_INFO "%s found %s at 0x%lx\n", MODULE_NAME,
@@ -184,13 +184,13 @@ ccio_probe(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_device_id ccio_tbl[] = {
+static struct parisc_device_id ccio_tbl[] __initconst = {
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, U2_BC_GSC, 0xc },
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, UTURN_BC_GSC, 0xc },
 	{ 0, }
 };
 
-static struct parisc_driver ccio_driver = {
+static struct parisc_driver ccio_driver __refdata = {
 	.name =		"U2/Uturn",
 	.id_table =	ccio_tbl,
 	.probe =	ccio_probe,
diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index ed92c12..87de05f 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -1022,7 +1022,7 @@ static int __init dino_probe(struct parisc_device *dev)
  * and 725 firmware misreport it as 0x08080 for no adequately explained
  * reason.
  */
-static struct parisc_device_id dino_tbl[] = {
+static struct parisc_device_id dino_tbl[] __initconst = {
 	{ HPHW_A_DMA, HVERSION_REV_ANY_ID, 0x004, 0x0009D },/* Card-mode Dino */
 	{ HPHW_A_DMA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x08080 }, /* XXX */
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, 0x680, 0xa }, /* Bridge-mode Dino */
@@ -1031,7 +1031,7 @@ static struct parisc_device_id dino_tbl[] = {
 	{ 0, }
 };
 
-static struct parisc_driver dino_driver = {
+static struct parisc_driver dino_driver __refdata = {
 	.name =		"dino",
 	.id_table =	dino_tbl,
 	.probe =	dino_probe,
diff --git a/drivers/parisc/eisa.c b/drivers/parisc/eisa.c
index 7e2f6d5..9ff434f 100644
--- a/drivers/parisc/eisa.c
+++ b/drivers/parisc/eisa.c
@@ -393,7 +393,7 @@ static int __init eisa_probe(struct parisc_device *dev)
 	return result;
 }
 
-static const struct parisc_device_id eisa_tbl[] = {
+static const struct parisc_device_id eisa_tbl[] __initconst = {
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00076 }, /* Mongoose */
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00090 }, /* Wax EISA */
 	{ 0, }
@@ -401,7 +401,7 @@ static const struct parisc_device_id eisa_tbl[] = {
 
 MODULE_DEVICE_TABLE(parisc, eisa_tbl);
 
-static struct parisc_driver eisa_driver = {
+static struct parisc_driver eisa_driver __refdata = {
 	.name =		"eisa_ba",
 	.id_table =	eisa_tbl,
 	.probe =	eisa_probe,
diff --git a/drivers/parisc/hppb.c b/drivers/parisc/hppb.c
index 898208e..55e92bb 100644
--- a/drivers/parisc/hppb.c
+++ b/drivers/parisc/hppb.c
@@ -45,7 +45,7 @@ static struct hppb_card hppb_card_head = {
  * (return 1). If so, initialize the chip and tell other partners in crime 
  * they have work to do.
  */
-static int hppb_probe(struct parisc_device *dev)
+static int __init hppb_probe(struct parisc_device *dev)
 {
 	int status;
 	struct hppb_card *card = &hppb_card_head;
@@ -81,7 +81,7 @@ static int hppb_probe(struct parisc_device *dev)
         return 0;
 }
 
-static struct parisc_device_id hppb_tbl[] = {
+static struct parisc_device_id hppb_tbl[] __initconst = {
         { HPHW_BCPORT, HVERSION_REV_ANY_ID, 0x500, 0xc }, /* E25 and K */
         { HPHW_BCPORT, 0x0, 0x501, 0xc }, /* E35 */
         { HPHW_BCPORT, 0x0, 0x502, 0xc }, /* E45 */
@@ -89,7 +89,7 @@ static struct parisc_device_id hppb_tbl[] = {
         { 0, }
 };
 
-static struct parisc_driver hppb_driver = {
+static struct parisc_driver hppb_driver __refdata = {
         .name =         "gecko_boa",
         .id_table =     hppb_tbl,
 	.probe =        hppb_probe,
diff --git a/drivers/parisc/lasi.c b/drivers/parisc/lasi.c
index e65727c..4c92254 100644
--- a/drivers/parisc/lasi.c
+++ b/drivers/parisc/lasi.c
@@ -227,12 +227,12 @@ static int __init lasi_init_chip(struct parisc_device *dev)
 	return ret;
 }
 
-static struct parisc_device_id lasi_tbl[] = {
+static struct parisc_device_id lasi_tbl[] __initdata = {
 	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00081 },
 	{ 0, }
 };
 
-struct parisc_driver lasi_driver = {
+struct parisc_driver lasi_driver __refdata = {
 	.name =		"lasi",
 	.id_table =	lasi_tbl,
 	.probe =	lasi_init_chip,
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index bc286cb..b5a3356 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1613,14 +1613,14 @@ lba_driver_probe(struct parisc_device *dev)
 	return 0;
 }
 
-static struct parisc_device_id lba_tbl[] = {
+static struct parisc_device_id lba_tbl[] __initconst = {
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, ELROY_HVERS, 0xa },
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, MERCURY_HVERS, 0xa },
 	{ HPHW_BRIDGE, HVERSION_REV_ANY_ID, QUICKSILVER_HVERS, 0xa },
 	{ 0, }
 };
 
-static struct parisc_driver lba_driver = {
+static struct parisc_driver lba_driver __refdata = {
 	.name =		MODULE_NAME,
 	.id_table =	lba_tbl,
 	.probe =	lba_driver_probe,
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 4086f79..2866542 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1905,7 +1905,7 @@ static const struct file_operations sba_proc_bitmap_fops = {
 };
 #endif /* CONFIG_PROC_FS */
 
-static struct parisc_device_id sba_tbl[] = {
+static struct parisc_device_id sba_tbl[] __initconst = {
 	{ HPHW_IOA, HVERSION_REV_ANY_ID, ASTRO_RUNWAY_PORT, 0xb },
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, IKE_MERCED_PORT, 0xc },
 	{ HPHW_BCPORT, HVERSION_REV_ANY_ID, REO_MERCED_PORT, 0xc },
@@ -1916,7 +1916,7 @@ static struct parisc_device_id sba_tbl[] = {
 
 static int sba_driver_callback(struct parisc_device *);
 
-static struct parisc_driver sba_driver = {
+static struct parisc_driver sba_driver __refdata = {
 	.name =		MODULE_NAME,
 	.id_table =	sba_tbl,
 	.probe =	sba_driver_callback,
@@ -1927,7 +1927,7 @@ static struct parisc_driver sba_driver = {
 ** If so, initialize the chip and tell other partners in crime they
 ** have work to do.
 */
-static int sba_driver_callback(struct parisc_device *dev)
+static int __init sba_driver_callback(struct parisc_device *dev)
 {
 	struct sba_device *sba_dev;
 	u32 func_class;
diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index deeaed5..8ce3457 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -482,14 +482,14 @@ superio_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	return -ENODEV;
 }
 
-static const struct pci_device_id superio_tbl[] = {
+static struct pci_device_id superio_tbl[] __initconst = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_LIO) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_USB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415) },
 	{ 0, }
 };
 
-static struct pci_driver superio_driver = {
+static struct pci_driver superio_driver __refdata = {
 	.name =         SUPERIO,
 	.id_table =     superio_tbl,
 	.probe =        superio_probe,
diff --git a/drivers/parisc/wax.c b/drivers/parisc/wax.c
index da9d5ad..636801a 100644
--- a/drivers/parisc/wax.c
+++ b/drivers/parisc/wax.c
@@ -125,14 +125,14 @@ static int __init wax_init_chip(struct parisc_device *dev)
 	return ret;
 }
 
-static struct parisc_device_id wax_tbl[] = {
+static struct parisc_device_id wax_tbl[] __initconst = {
   	{ HPHW_BA, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008e },
 	{ 0, }
 };
 
 MODULE_DEVICE_TABLE(parisc, wax_tbl);
 
-struct parisc_driver wax_driver = {
+struct parisc_driver wax_driver __refdata = {
 	.name =		"wax",
 	.id_table =	wax_tbl,
 	.probe =	wax_init_chip,
-- 
2.1.0

