Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA31198
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 02:39:55 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 19 Dec 2000 09:42:52 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 148JIJ-0004dE-00
	for parisc-linux@thepuffingroup.com; Tue, 19 Dec 2000 09:42:51 +0000
Date: Tue, 19 Dec 2000 09:42:51 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001219094251.A17217@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] SuckyIO support
List-ID: <linux-parisc.vger.kernel.org>


Wow, this is a really sucky chip :-)

OK, here's a first stab at some support for it.  Could someone with a
B/C/J `thousand' class machine please give it a try, and let me see the
relevant portions of their bootlog?

Obviously, this code only tries to set up the IRQ for the IDE driver
and doesn't attempt to address any of the other broken things this chip
requires, but it's architecturally in the right place.

It'd be really handy if I could get access to one of that class of machine
with remote console & remote rebooting facilities, but i should be near
a machine of that type in a couple of months anyway...

diff -u linux-cvs/drivers/pci/quirks.c linux-mine/drivers/pci/quirks.c
--- linux-cvs/drivers/pci/quirks.c	Fri Nov 10 21:43:18 2000
+++ linux-mine/drivers/pci/quirks.c	Tue Dec 19 09:27:28 2000
@@ -234,6 +234,25 @@
 	pci_read_config_word(dev, PCI_DEVICE_ID, &dev->device);
 }
 
+static void __init quirk_ns_87560(struct pci_dev *dev)
+{
+	switch (dev->device)
+	{
+		case PCI_DEVICE_ID_NS_87415:
+			break;
+		case PCI_DEVICE_ID_NS_87560_LIO:
+			{
+				struct pci_dev *ide_dev;
+				char irq;
+				ide_dev = pci_dev_b(dev->bus_list.prev);
+				pci_read_config_byte(dev, 0x6B, &irq);
+				ide_dev->irq = irq & 0xf;
+				printk("Assigned IRQ %d to IDE\n", ide_dev->irq);
+			}
+			break;
+	}
+}
+
 /*
  *  The main table of quirks.
  */
@@ -269,6 +288,7 @@
 	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_AL,	PCI_DEVICE_ID_AL_M7101,		quirk_ali7101_acpi },
  	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82371SB_2,	quirk_piix3_usb },
 	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82371AB_2,	quirk_piix3_usb },
+	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_NS,	PCI_ANY_ID,	quirk_ns_87560 },
 	{ 0 }
 };
 

-- 
Revolutions do not require corporate support.
