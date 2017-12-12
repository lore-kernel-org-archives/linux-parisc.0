From: Helge Deller <deller@gmx.de>
Subject: Re: Have my PA8800 back online...
Date: Tue, 12 Dec 2017 21:52:26 +0100
Message-ID: <20171212205226.GA22082@ls3530.fritz.box>
References: <cc22ee64-e9f3-aeb4-a9a0-a503f20f9634@web.de>
 <48320506-f7fa-822b-fb45-40eab1dbda02@bell.net>
 <17707adb-4f71-1d66-2a19-3cdfaff047f3@gmx.de>
 <53815372-58e8-70e2-bab4-1777e848cf5e@web.de>
 <79c110ec-2975-a827-4b9d-1351ab77779b@gmx.de>
 <d3c1e035-6486-c0b5-e87a-22d26c0c95f5@bell.net>
 <ccca0165-6c4a-97f3-2e0b-00657948c775@gmx.de>
 <897B27DE-04A1-4906-8DF2-C037393139C3@bell.net>
 <c7d0ee9d-0926-09a7-3a6d-22daf0c05a32@gmx.de>
 <c02fe6c5-9564-21ab-3012-a0a5d0509fc4@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Frank Scheiner <frank.scheiner@web.de>,
        debian-hppa@lists.debian.org
To: John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <c02fe6c5-9564-21ab-3012-a0a5d0509fc4@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* John David Anglin <dave.anglin@bell.net>:
> On 2017-12-11 9:46 AM, Helge Deller wrote:
> > Strange. The attached patch does work for me on panama up until boot.
> > Haven't tested what lspci reports afterwards...

> Yes, it also works for me applied to v4.13.16.  ttyS1 is now ttyS0.

Good.

> Haven't tried boot without console argument yet.
> lspci still sees the hidden devices which I think is good.

Agreed.

> I removed period from one of the dev_info strings.  We probably don't need
> printk's that I added.

Yes, I dropped them.
Here is an updated patch for patchwork:

_________

Hide serial AUX and ATI functions on Diva GSP card

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index a25fed52f7e9..55fb30057d5e 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1692,3 +1692,37 @@ void lba_set_iregs(struct parisc_device *lba, u32 ibase, u32 imask)
 	iounmap(base_addr);
 }
 
+
+/*
+ * The design of the Diva management card in rp34x0 machines (rp3410, rp3440)
+ * seems rushed, so that many built-in components simply don't work.
+ * The following quirks disable the serial AUX port and the built-in ATI RV100
+ * Radeon 7000 graphics card which both don't have any external connectors and
+ * thus are useless, and even worse, e.g. the AUX port occupies ttyS0 and as
+ * such makes those machines the only PARISC machines on which we can't use
+ * ttyS0 as boot console.
+ */
+static void quirk_diva_ati_card(struct pci_dev *dev)
+{
+	if (dev->subsystem_vendor != PCI_VENDOR_ID_HP ||
+	    dev->subsystem_device != 0x1292)
+		return;
+
+	dev_info(&dev->dev, "Hiding Diva built-in ATI card");
+	dev->device = 0;
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RADEON_QY,
+	quirk_diva_ati_card);
+
+static void quirk_diva_aux_disable(struct pci_dev *dev)
+{
+	if (dev->subsystem_vendor != PCI_VENDOR_ID_HP ||
+	    dev->subsystem_device != 0x1291)
+		return;
+
+	dev_info(&dev->dev, "Hiding Diva built-in AUX serial device");
+	dev->device = 0;
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_DIVA_AUX,
+	quirk_diva_aux_disable);
+
