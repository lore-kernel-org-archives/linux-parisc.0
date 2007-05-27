From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix section mismatch in superio
	serial drivers
Date: Sun, 27 May 2007 20:38:47 +0200
Message-ID: <200705272038.47588.deller__49557.8307578855$1416624370$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This patch fixes two section mismatches in superio serial setup:
WARNING: drivers/built-in.o(.text.superio_serial_init+0x78): Section mismatch: reference to .init.text:early_serial_setup (after 'superio_serial_init')
WARNING: drivers/built-in.o(.text.superio_serial_init+0xa4): Section mismatch: reference to .init.text:early_serial_setup (after 'superio_serial_init')

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index 1fd97f7..a708c32 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -389,7 +389,7 @@ int superio_fixup_irq(struct pci_dev *pc
 	return local_irq;
 }
 
-static void __devinit superio_serial_init(void)
+static void __init superio_serial_init(void)
 {
 #ifdef CONFIG_SERIAL_8250
 	int retval;
@@ -423,7 +423,7 @@ static void __devinit superio_serial_ini
 }
 
 
-static void __devinit superio_parport_init(void)
+static void __init superio_parport_init(void)
 {
 #ifdef CONFIG_PARPORT_PC
 	if (!parport_pc_probe_port(sio_dev.pp_base,
@@ -450,7 +450,7 @@ static void superio_fixup_pci(struct pci
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415, superio_fixup_pci);
 
 
-static int __devinit
+static int __init
 superio_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	struct superio_device *sio = &sio_dev;
@@ -485,7 +485,7 @@ superio_probe(struct pci_dev *dev, const
 	return -ENODEV;
 }
 
-static struct pci_device_id superio_tbl[] = {
+static const struct pci_device_id superio_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_LIO) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_USB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415) },
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
