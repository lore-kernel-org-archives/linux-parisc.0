From: Helge Deller <deller@gmx.de>
Subject: [PATCH v2] serial/parisc: Ignore AUX port of DIVA on rp34xx machines
Date: Mon, 29 May 2017 22:05:45 +0200
Message-ID: <20170529200545.GA19561@p100.box>
References: <20170521211623.GA22326@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170521211623.GA22326@ls3530.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On rp34xx machines Linux detects the AUX port of the DIVA GSP card (PCI
subsystem id 0x1291) before the console port of DIVA GSP and as such the AUX
port becomes ttyS0 and the console port becomes ttyS1.
Since the palo bootloader by default sets the console output to ttyS0 if no
keyboard & monitor is attached, all Linux kernel boot messages get lost.

Avoid this problem by ignoring the AUX port. There is no external serial
port connector for AUX, so we won't miss this serial port either.

Tested on a rp3410 parisc machine.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
index 00e51a0..2ec120e 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -174,6 +174,9 @@ static int pci_hp_diva_init(struct pci_dev *dev)
 	case PCI_DEVICE_ID_HP_DIVA_HURRICANE:
 		rc = 1;
 		break;
+	case PCI_DEVICE_ID_HP_DIVA_AUX2:
+		rc = -ENODEV; /* ignore on rp34x0 machines */
+		break;
 	}
 
 	return rc;
@@ -1785,6 +1788,17 @@ static struct pci_serial_quirk pci_serial_quirks[] __refdata = {
 		.setup		= pci_hp_diva_setup,
 	},
 	/*
+	 * HP Diva Auxiliary Serial Port
+	 */
+	{
+		.vendor		= PCI_VENDOR_ID_HP,
+		.device		= PCI_DEVICE_ID_HP_DIVA_AUX,
+		.subvendor	= PCI_VENDOR_ID_HP,
+		.subdevice	= PCI_DEVICE_ID_HP_DIVA_AUX2,
+		.init		= pci_hp_diva_init,
+		.setup		= pci_default_setup,
+	},
+	/*
 	 * Intel
 	 */
 	{
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 5f6b71d..ecc88a3 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -762,6 +762,7 @@
 #define PCI_DEVICE_ID_HP_SX1000_IOC	0x127c
 #define PCI_DEVICE_ID_HP_DIVA_EVEREST	0x1282
 #define PCI_DEVICE_ID_HP_DIVA_AUX	0x1290
+#define PCI_DEVICE_ID_HP_DIVA_AUX2	0x1291
 #define PCI_DEVICE_ID_HP_DIVA_RMP3	0x1301
 #define PCI_DEVICE_ID_HP_DIVA_HURRICANE	0x132a
 #define PCI_DEVICE_ID_HP_CISSA		0x3220
