Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (unknown [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AB8248B5
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Mar 2004 15:48:33 -0700 (MST)
Date: Wed, 10 Mar 2004 14:48:16 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040310224816.GA23292@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ns87415 (superio) support for 2.6.x
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This patch fixes ns87415 to work on suckyio-based boxes. the devic
e reports that dma is enabled, but from the performance we get it 
looks like something is still not quite right (we only see ~3MB/s)

Patch is against 2.6.4-rc3-pa5....  tested on c3000 and c3750. 
(Thanks Max.)

Any comments on the hooks that are needed in the generic ns87415 
driver to make this work?

Also, should we enable native mode for all ide devices discovered 
and not just ns87415?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Index: arch/parisc/kernel/pci.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pci.c,v
retrieving revision 1.13
diff -u -p -r1.13 pci.c
--- a/arch/parisc/kernel/pci.c	4 Feb 2004 16:31:15 -0000	1.13
+++ b/arch/parisc/kernel/pci.c	10 Mar 2004 22:42:05 -0000
@@ -21,6 +21,7 @@
 #include <asm/io.h>
 #include <asm/system.h>
 #include <asm/cache.h>		/* for L1_CACHE_BYTES */
+#include <asm/superio.h>
 
 #define DEBUG_RESOURCES 0
 #define DEBUG_CONFIG 0
@@ -145,9 +146,13 @@ char *pcibios_setup(char *str)
 	return str;
 }
 
-
 /* Used in drivers/pci/quirks.c */
-struct pci_fixup pcibios_fixups[] = { {0} };
+struct pci_fixup pcibios_fixups[] = { 
+#ifdef CONFIG_SUPERIO
+	{ PCI_FIXUP_HEADER,	PCI_VENDOR_ID_NS,	PCI_DEVICE_ID_NS_87415,	superio_fixup_pci },
+#endif
+	{ 0 }
+};
 
 
 /*
Index: drivers/ide/pci/ns87415.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/ide/pci/ns87415.c,v
retrieving revision 1.13
diff -u -p -r1.13 ns87415.c
--- a/drivers/ide/pci/ns87415.c	28 Feb 2004 01:50:36 -0000	1.13
+++ b/drivers/ide/pci/ns87415.c	10 Mar 2004 22:42:07 -0000
@@ -24,6 +24,9 @@
 #include <linux/init.h>
 
 #include <asm/io.h>
+#ifdef CONFIG_SUPERIO
+#include <asm/superio.h>
+#endif
 
 #include "ns87415.h"
 
@@ -130,6 +133,13 @@ static int ns87415_ide_dma_check (ide_dr
 	if (drive->media != ide_disk)
 		return HWIF(drive)->ide_dma_off_quietly(drive);
 	return __ide_dma_check(drive);
+}
+
+static void __init init_iops_ns87415(ide_hwif_t *hwif)
+{
+#ifdef CONFIG_SUPERIO
+	superio_ide_init_iops(hwif);
+#endif
 }
 
 static void __init init_hwif_ns87415 (ide_hwif_t *hwif)
Index: drivers/ide/pci/ns87415.h
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/ide/pci/ns87415.h,v
retrieving revision 1.2
diff -u -p -r1.2 ns87415.h
--- a/drivers/ide/pci/ns87415.h	8 Oct 2003 20:52:23 -0000	1.2
+++ b/drivers/ide/pci/ns87415.h	10 Mar 2004 22:42:07 -0000
@@ -5,6 +5,7 @@
 #include <linux/pci.h>
 #include <linux/ide.h>
 
+static void init_iops_ns87415(ide_hwif_t *);
 static void init_hwif_ns87415(ide_hwif_t *);
 
 static ide_pci_device_t ns87415_chipsets[] __devinitdata = {
@@ -13,7 +14,7 @@ static ide_pci_device_t ns87415_chipsets
 		.device		= PCI_DEVICE_ID_NS_87415,
 		.name		= "NS87415",
 		.init_chipset	= NULL,
-		.init_iops	= NULL,
+		.init_iops	= init_iops_ns87415,
 		.init_hwif	= init_hwif_ns87415,
 		.channels	= 2,
 		.autodma	= AUTODMA,
Index: drivers/parisc/superio.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/superio.c,v
retrieving revision 1.5
diff -u -p -r1.5 superio.c
--- a/drivers/parisc/superio.c	21 Dec 2003 13:13:11 -0000	1.5
+++ b/drivers/parisc/superio.c	10 Mar 2004 22:42:07 -0000
@@ -69,11 +69,15 @@
 #include <linux/termios.h>
 #include <linux/tty.h>
 #include <linux/serial_core.h>
+#include <linux/delay.h>
+#include <linux/ide.h>
 #include <asm/io.h>
 #include <asm/hardware.h>
 #include <asm/irq.h>
 #include <asm/superio.h>
 
+#define SUPERIO_IDE_MAX_RETRIES 25
+
 static struct superio_device sio_dev;
 
 
@@ -161,7 +165,6 @@ superio_init(struct superio_device *sio)
 	printk (KERN_INFO "SuperIO: Found NS87560 Legacy I/O device at %s (IRQ %i) \n",
 		pci_name(pdev),pdev->irq);
 
-	/* Find our I/O devices */
 	pci_read_config_dword (pdev, SIO_SP1BAR, &sio->sp1_base);
 	sio->sp1_base &= ~1;
 	printk (KERN_INFO "SuperIO: Serial port 1 at 0x%x\n", sio->sp1_base);
@@ -472,6 +475,78 @@ superio_get_ide_irq(void)
 }
 
 EXPORT_SYMBOL(superio_get_ide_irq);
+
+static u8 superio_ide_inb (unsigned long port);
+static unsigned long superio_ide_status[2];
+static unsigned long superio_ide_select[2];
+static unsigned long superio_ide_dma_status[2];
+
+void superio_fixup_pci(struct pci_dev *pdev)
+{
+	u8 prog;
+	u16 cmd;
+
+	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
+	cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MASTER);
+	pci_write_config_word(pdev, PCI_COMMAND, cmd);
+
+	pci_read_config_byte(pdev, PCI_CLASS_PROG, &prog);
+	pci_write_config_byte(pdev, PCI_CLASS_PROG, prog | 0x5);
+	pdev->class |= 0x5;
+
+	pci_read_config_byte(pdev, PCI_CLASS_PROG, &prog);
+
+	printk("PCI: Enabled native mode for NS87415 (pif=0x%x)\n", prog);
+}
+
+/* Because of a defect in Super I/O, all reads of the PCI DMA status 
+ * registers, IDE status register and the IDE select register need to be 
+ * retried
+ */
+static u8 superio_ide_inb (unsigned long port)
+{
+	if (port == superio_ide_status[0] ||
+	    port == superio_ide_status[1] ||
+	    port == superio_ide_select[0] ||
+	    port == superio_ide_select[1] ||
+	    port == superio_ide_dma_status[0] ||
+	    port == superio_ide_dma_status[1]) {
+		u8 tmp;
+		int retries = SUPERIO_IDE_MAX_RETRIES;
+
+		/* printk(" [ reading port 0x%x with retry ] ", port); */
+
+		do {
+			tmp = inb(port);
+		} while (tmp == 0 && retries-- > 0);
+
+		return tmp;
+	}
+
+	return inb(port);
+}
+
+void __init superio_ide_init_iops (struct hwif_s *hwif)
+{
+	u32 base, dmabase;
+	u8 tmp;
+	struct pci_dev *pdev = hwif->pci_dev;
+	u8 port = hwif->channel;
+
+	base = pci_resource_start(pdev, port * 2) & ~3;
+	dmabase = pci_resource_start(pdev, 4) & ~3;
+
+	superio_ide_status[port] = base + IDE_STATUS_OFFSET;
+	superio_ide_select[port] = base + IDE_SELECT_OFFSET;
+	superio_ide_dma_status[port] = dmabase + (!port ? 2 : 0xa);
+	
+	/* Clear error/interrupt, enable dma */
+	tmp = superio_ide_inb(superio_ide_dma_status[port]);
+	outb(tmp | 0x66, superio_ide_dma_status[port]);
+
+	/* We need to override inb to workaround a SuperIO errata */
+	hwif->INB = superio_ide_inb;
+}
 
 static int __devinit superio_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
Index: include/asm-parisc/superio.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/superio.h,v
retrieving revision 1.2
diff -u -p -r1.2 superio.h
--- a/include/asm-parisc/superio.h	21 Dec 2003 13:13:10 -0000	1.2
+++ b/include/asm-parisc/superio.h	10 Mar 2004 22:42:11 -0000
@@ -81,9 +81,13 @@ struct superio_device {
 	|| ((x)->device == PCI_DEVICE_ID_NS_87560_LIO) \
 	|| ((x)->device == PCI_DEVICE_ID_NS_87560_USB) ) )
 
+struct hwif_s;
+
 extern void superio_inform_irq(int irq);
 extern void superio_serial_init(void);		/* called by rs_init() */
 extern int superio_fixup_irq(struct pci_dev *pcidev); /* called by iosapic */
 extern int superio_get_ide_irq(void);
+extern void superio_fixup_pci(struct pci_dev *pdev);
+extern void superio_ide_init_iops (struct hwif_s *hwif);
 
 #endif /* _PARISC_SUPERIO_H */
