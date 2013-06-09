From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix serial ports on C8000 workstation
Date: Sun, 9 Jun 2013 23:00:21 +0200
Message-ID: <20130609210021.GA1009@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

The C8000 workstation (64 bit kernel only) has a somewhat different
serial port configuration that other models.
Thonmas Bogendoerfers sent a patch to fix this in September 2010, which
was now minimally modified by me.

Signed-off-by: Helge Deller <deller@gmx.de>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>


diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index 9e2d2e4..8722756 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -1205,6 +1205,7 @@ static struct hp_hardware hp_hardware_list[] = {
 	{HPHW_FIO, 0x004, 0x00320, 0x0, "Metheus Frame Buffer"}, 
 	{HPHW_FIO, 0x004, 0x00340, 0x0, "BARCO CX4500 VME Grphx Cnsl"}, 
 	{HPHW_FIO, 0x004, 0x00360, 0x0, "Hughes TOG VME FDDI"}, 
+	{HPHW_FIO, 0x076, 0x000AD, 0x00, "Crestone Peak RS-232"},
 	{HPHW_IOA, 0x185, 0x0000B, 0x00, "Java BC Summit Port"}, 
 	{HPHW_IOA, 0x1FF, 0x0000B, 0x00, "Hitachi Ghostview Summit Port"}, 
 	{HPHW_IOA, 0x580, 0x0000B, 0x10, "U2-IOA BC Runway Port"}, 
diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 9544cdc..e79e006 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -811,6 +811,70 @@ int iosapic_fixup_irq(void *isi_obj, struct pci_dev *pcidev)
 	return pcidev->irq;
 }
 
+static struct iosapic_info *first_isi = NULL;
+
+#ifdef CONFIG_64BIT
+int iosapic_serial_irq(int num)
+{
+	struct iosapic_info *isi = first_isi;
+	struct irt_entry *irte = NULL;  /* only used if PAT PDC */
+	struct vector_info *vi;
+	int isi_line;	/* line used by device */
+
+	/* lookup IRT entry for isi/slot/pin set */
+	irte = &irt_cell[num];
+
+	DBG_IRT("iosapic_serial_irq(): irte %p %x %x %x %x %x %x %x %x\n",
+		irte,
+		irte->entry_type,
+		irte->entry_length,
+		irte->polarity_trigger,
+		irte->src_bus_irq_devno,
+		irte->src_bus_id,
+		irte->src_seg_id,
+		irte->dest_iosapic_intin,
+		(u32) irte->dest_iosapic_addr);
+	isi_line = irte->dest_iosapic_intin;
+
+	/* get vector info for this input line */
+	vi = isi->isi_vector + isi_line;
+	DBG_IRT("iosapic_serial_irq:  line %d vi 0x%p\n", isi_line, vi);
+
+	/* If this IRQ line has already been setup, skip it */
+	if (vi->irte)
+		goto out;
+
+	vi->irte = irte;
+
+	/*
+	 * Allocate processor IRQ
+	 *
+	 * XXX/FIXME The txn_alloc_irq() code and related code should be
+	 * moved to enable_irq(). That way we only allocate processor IRQ
+	 * bits for devices that actually have drivers claiming them.
+	 * Right now we assign an IRQ to every PCI device present,
+	 * regardless of whether it's used or not.
+	 */
+	vi->txn_irq = txn_alloc_irq(8);
+
+	if (vi->txn_irq < 0)
+		panic("I/O sapic: couldn't get TXN IRQ\n");
+
+	/* enable_irq() will use txn_* to program IRdT */
+	vi->txn_addr = txn_alloc_addr(vi->txn_irq);
+	vi->txn_data = txn_alloc_data(vi->txn_irq);
+
+	vi->eoi_addr = isi->addr + IOSAPIC_REG_EOI;
+	vi->eoi_data = cpu_to_le32(vi->txn_data);
+
+	cpu_claim_irq(vi->txn_irq, &iosapic_interrupt_type, vi);
+
+ out:
+
+	return vi->txn_irq;
+}
+#endif
+
 
 /*
 ** squirrel away the I/O Sapic Version
@@ -877,6 +941,8 @@ void *iosapic_register(unsigned long hpa)
 		vip->irqline = (unsigned char) cnt;
 		vip->iosapic = isi;
 	}
+	if (!first_isi)
+		first_isi = isi;
 	return isi;
 }
 
diff --git a/drivers/tty/serial/8250/8250_gsc.c b/drivers/tty/serial/8250/8250_gsc.c
index 097dff9..bb91b47 100644
--- a/drivers/tty/serial/8250/8250_gsc.c
+++ b/drivers/tty/serial/8250/8250_gsc.c
@@ -30,6 +30,12 @@ static int __init serial_init_chip(struct parisc_device *dev)
 	unsigned long address;
 	int err;
 
+#ifdef CONFIG_64BIT
+	extern int iosapic_serial_irq(int cellnum);
+	if (!dev->irq && (dev->id.sversion == 0xad))
+		dev->irq = iosapic_serial_irq(dev->mod_index-1);
+#endif
+
 	if (!dev->irq) {
 		/* We find some unattached serial ports by walking native
 		 * busses.  These should be silently ignored.  Otherwise,
@@ -51,7 +57,8 @@ static int __init serial_init_chip(struct parisc_device *dev)
 	memset(&uart, 0, sizeof(uart));
 	uart.port.iotype	= UPIO_MEM;
 	/* 7.272727MHz on Lasi.  Assumed the same for Dino, Wax and Timi. */
-	uart.port.uartclk	= 7272727;
+	uart.port.uartclk	= (dev->id.sversion != 0xad) ?
+					7272727 : 1843200;
 	uart.port.mapbase	= address;
 	uart.port.membase	= ioremap_nocache(address, 16);
 	uart.port.irq	= dev->irq;
@@ -73,6 +80,7 @@ static struct parisc_device_id serial_tbl[] = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00075 },
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008c },
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008d },
+	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x000ad },
 	{ 0 }
 };
 
