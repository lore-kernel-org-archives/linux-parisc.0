Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA31619
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 02:12:21 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 23 Dec 2000 09:15:22 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149klt-0004ci-00; Sat, 23 Dec 2000 09:15:21 +0000
Date: Sat, 23 Dec 2000 09:15:21 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support
Message-ID: <20001223091521.A17346@parcelfarce.linux.theplanet.co.uk>
References: <20001219094251.A17217@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001219094251.A17217@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Tue, Dec 19, 2000 at 09:42:51AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Dec 19, 2000 at 09:42:51AM +0000, Matthew Wilcox wrote:
> 
> Wow, this is a really sucky chip :-)
> 
> OK, here's a first stab at some support for it.  Could someone with a
> B/C/J `thousand' class machine please give it a try, and let me see the
> relevant portions of their bootlog?

See if this is a better quirk.

Index: drivers/pci/quirks.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/pci/quirks.c,v
retrieving revision 1.6
diff -u -p -r1.6 quirks.c
--- quirks.c	2000/11/10 21:43:18	1.6
+++ quirks.c	2000/12/23 09:10:55
@@ -234,6 +234,32 @@ static void __init quirk_vt82c598_id(str
 	pci_read_config_word(dev, PCI_DEVICE_ID, &dev->device);
 }
 
+static void __init quirk_ns_87560(struct pci_dev *dev)
+{
+	static int count = 0; /* So we don't lose if they reuse their IDs. */
+	switch (dev->device)
+	{
+		case PCI_DEVICE_ID_NS_87415:
+		case PCI_DEVICE_ID_NS_87560_LIO:
+			count++;
+			break;
+		case PCI_DEVICE_ID_NS_87560_USB:
+			if (count != 2) {
+				count = 0;
+				break;
+			}
+			{
+				struct pci_dev *old_dev;
+				old_dev = pci_dev_b(dev->bus_list.prev);
+				old_dev->irq = dev->irq;
+				old_dev = pci_dev_b(old_dev->bus_list.prev);
+				old_dev->irq = dev->irq;
+				printk("Assigned IRQ %d to SuckyIO\n", dev->irq);
+			}
+			break;
+	}
+}
+
 /*
  *  The main table of quirks.
  */
@@ -269,6 +295,7 @@ static struct pci_fixup pci_fixups[] __i
 	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_AL,	PCI_DEVICE_ID_AL_M7101,		quirk_ali7101_acpi },
  	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82371SB_2,	quirk_piix3_usb },
 	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82371AB_2,	quirk_piix3_usb },
+	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_NS,	PCI_ANY_ID,	quirk_ns_87560 },
 	{ 0 }
 };
 

-- 
Revolutions do not require corporate support.
