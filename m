From: Helge Deller <deller@gmx.de>
Subject: Re: Have my PA8800 back online...
Date: Mon, 11 Dec 2017 15:46:50 +0100
Message-ID: <c7d0ee9d-0926-09a7-3a6d-22daf0c05a32@gmx.de>
References: <2ADB5C8A-DFEB-4CA5-92BA-96E459A3575E@bell.net>
 <8314a5d6-7df7-3282-0d91-a9b414a122e0@web.de>
 <526274E4-88D8-4DF8-8F74-5B775186BBEC@bell.net>
 <cc22ee64-e9f3-aeb4-a9a0-a503f20f9634@web.de>
 <48320506-f7fa-822b-fb45-40eab1dbda02@bell.net>
 <17707adb-4f71-1d66-2a19-3cdfaff047f3@gmx.de>
 <53815372-58e8-70e2-bab4-1777e848cf5e@web.de>
 <79c110ec-2975-a827-4b9d-1351ab77779b@gmx.de>
 <d3c1e035-6486-c0b5-e87a-22d26c0c95f5@bell.net>
 <ccca0165-6c4a-97f3-2e0b-00657948c775@gmx.de>
 <897B27DE-04A1-4906-8DF2-C037393139C3@bell.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------5EA2BED1207377F8349E9EC9"
Cc: Frank Scheiner <frank.scheiner@web.de>,
        debian-hppa@lists.debian.org,
        linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <897B27DE-04A1-4906-8DF2-C037393139C3@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------5EA2BED1207377F8349E9EC9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10.12.2017 00:49, John David Anglin wrote:
> On 2017-12-09, at 4:03 PM, Helge Deller wrote:
> 
>> Can you please try attached patch which disables the serial MUX and ATI card?
>> If it works for you and if we backport it to all kernels and if we revert palo to use ttyS0 for all machines we might be good.
> 
> I hacked on the change but I couldn't get it to work.  As far as I can tell, the quirks aren't being called.
> Tried EARLY, HEADER and FINAL.  I think the ids are correct.

Strange. The attached patch does work for me on panama up until boot.
Haven't tested what lspci reports afterwards...

[    1.832294] LBA 0:7: PCI host bridge to bus 0000:e0
[    1.832497] pci_bus 0000:e0: root bus resource [io  0x60000-0x6ffff] (bus address [0x0000-0xffff])
[    1.833005] pci_bus 0000:e0: root bus resource [mem 0xfffffffff0000000-0xfffffffffe77ffff] (bus address [0xf0000000-0xfe77ffff])
[    1.840028] pci_bus 0000:e0: root bus resource [bus e0-e7]
     1.844276] subsystem_vendor = 0x103c, subsystem_device =0x1291
[    1.848022] pci 0000:e0:01.0: Hiding Diva built-in AUX serial device
     1.849136] subsystem_vendor = 0x103c, subsystem_device =0x1292
[    1.852023] pci 0000:e0:02.0: Hiding Diva built-in ATI card.
....

Helge

--------------5EA2BED1207377F8349E9EC9
Content-Type: text/plain; charset=UTF-8;
 name="p1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="p1"

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index a25fed52f7e9..dbb4158cf098 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1692,3 +1692,45 @@ void lba_set_iregs(struct parisc_device *lba, u32 ibase, u32 imask)
 	iounmap(base_addr);
 }
 
+
+/*
+ * The design of the Diva management card in rp34x0 machines (rp3410, rp3440)
+ * seems rushed, so that many built-in components simply don't work.
+ * The following quirks disable the serial AUX port and the built-in ATI RV100
+ * Radeon 7000 graphics card which both don't have any external connectors and
+ * thus are useless, and even worse, e.g. the AUX ports occupies ttyS0 and
+ * as such makes those machines the only PARISC machines on which we can't
+ * use ttyS0 as boot console.
+ */
+static void quirk_diva_ati_card(struct pci_dev *dev)
+{
+	printk("subsystem_vendor = 0x%x, subsystem_device =0x%x\n",
+		dev->subsystem_vendor, dev->subsystem_device);
+
+	/* subsystem IDs are from Diva */
+	if (dev->subsystem_vendor != PCI_VENDOR_ID_HP ||
+	    dev->subsystem_device != 0x1292)
+		return;
+
+	dev_info(&dev->dev, "Hiding Diva built-in ATI card.");
+	dev->device = 0;
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RADEON_QY,
+	quirk_diva_ati_card);
+
+static void quirk_diva_aux_disable(struct pci_dev *dev)
+{
+	printk("subsystem_vendor = 0x%x, subsystem_device =0x%x\n",
+		dev->subsystem_vendor, dev->subsystem_device);
+
+	/* subsystem IDs are from Diva */
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

--------------5EA2BED1207377F8349E9EC9--
