From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: C8000 problems, WIP patch
Date: Fri, 26 Nov 2010 00:36:08 +0100
Message-ID: <20101125233608.GA26896@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

I finally found some time to play with my C8000. I'm now able to use
the FireGL card with Xorg (fbdev only). Below is my current patch with
lots of ugly hacks.

Things to sort out:

1. What's the best way to get the right interrupts for the onboard
   serial interface ? My hack works for me, but I don't think this
   is acceptable.

2. Is the PCI_MMAP implementation correct ? If yes, I'd split it out
   and send it with a Signed-By. Newer Xorgs need pci_mmap...

3. Does anybody know why firmware returns wrong ranges for LBA LMMIO ?
   With the wrong ranges from PDC at least the LMMIO windows for
   the AGP bridge is too small to fit the ranges of the FireGL card.
   If my hack is acceptable, I'd also split it out and send it with
   a Signed-By.

4. IPMI code works with hacks, but I need to dig deeper to find a clean
   solution.

Patch is against 2.6.36-rc7-00124-g85a3318

Thomas.

diff --git a/arch/parisc/include/asm/pci.h b/arch/parisc/include/asm/pci.h
index 2242a5c..2c51a63 100644
--- a/arch/parisc/include/asm/pci.h
+++ b/arch/parisc/include/asm/pci.h
@@ -263,4 +263,9 @@ static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 	return channel ? 15 : 14;
 }
 
+#define HAVE_PCI_MMAP
+
+extern int pci_mmap_page_range(struct pci_dev *dev, struct vm_area_struct *vma,
+	enum pci_mmap_state mmap_state, int write_combine);
+
 #endif /* __ASM_PARISC_PCI_H */
diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index f48a640..3e4111f 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -1204,6 +1204,7 @@ static struct hp_hardware hp_hardware_list[] __devinitdata = {
 	{HPHW_FIO, 0x004, 0x00320, 0x0, "Metheus Frame Buffer"}, 
 	{HPHW_FIO, 0x004, 0x00340, 0x0, "BARCO CX4500 VME Grphx Cnsl"}, 
 	{HPHW_FIO, 0x004, 0x00360, 0x0, "Hughes TOG VME FDDI"}, 
+	{HPHW_FIO, 0x076, 0x000AD, 0x00, "Crestone Peak RS-232"},
 	{HPHW_IOA, 0x185, 0x0000B, 0x00, "Java BC Summit Port"}, 
 	{HPHW_IOA, 0x1FF, 0x0000B, 0x00, "Hitachi Ghostview Summit Port"}, 
 	{HPHW_IOA, 0x580, 0x0000B, 0x10, "U2-IOA BC Runway Port"}, 
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 9efd974..c4ff6eb 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -247,6 +247,33 @@ EXPORT_SYMBOL(pcibios_resource_to_bus);
 EXPORT_SYMBOL(pcibios_bus_to_resource);
 #endif
 
+int pci_mmap_page_range(struct pci_dev *dev, struct vm_area_struct *vma,
+			enum pci_mmap_state mmap_state, int write_combine)
+{
+	unsigned long prot;
+
+	/*
+	 * I/O space can be accessed via normal processor loads and stores on
+	 * this platform but for now we elect not to do this and portable
+	 * drivers should not do this anyway.
+	 */
+	if (mmap_state == pci_mmap_io)
+		return -EINVAL;
+
+	if (write_combine)
+		return -EINVAL;
+
+	/*
+	 * Ignore write-combine; for now only return uncached mappings.
+	 */
+	prot = pgprot_val(vma->vm_page_prot);
+	prot |= _PAGE_NO_CACHE;
+	vma->vm_page_prot = __pgprot(prot);
+
+	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+		vma->vm_end - vma->vm_start, vma->vm_page_prot);
+}
+
 /*
  * pcibios align resources() is called every time generic PCI code
  * wants to generate a new address. The process of looking for
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 7bd7c45..c168cac 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -1213,8 +1213,8 @@ static LIST_HEAD(smi_infos);
 static DEFINE_MUTEX(smi_infos_lock);
 static int smi_num; /* Used to sequence the SMIs */
 
-#define DEFAULT_REGSPACING	1
-#define DEFAULT_REGSIZE		1
+#define DEFAULT_REGSPACING	4
+#define DEFAULT_REGSIZE		4
 
 static int           si_trydefaults = 1;
 static char          *si_type[SI_MAX_PARMS];
@@ -1486,14 +1486,14 @@ static void intf_mem_outw(struct si_sm_io *io, unsigned int offset,
 
 static unsigned char intf_mem_inl(struct si_sm_io *io, unsigned int offset)
 {
-	return (readl((io->addr)+(offset * io->regspacing)) >> io->regshift)
+	return (__raw_readl((io->addr)+(offset * io->regspacing)) >> io->regshift)
 		& 0xff;
 }
 
 static void intf_mem_outl(struct si_sm_io *io, unsigned int offset,
 		     unsigned char b)
 {
-	writel(b << io->regshift, (io->addr)+(offset * io->regspacing));
+	__raw_writel(b << io->regshift, (io->addr)+(offset * io->regspacing));
 }
 
 #ifdef readq
@@ -2996,9 +2996,12 @@ static __devinitdata struct ipmi_default_vals
 	int port;
 } ipmi_defaults[] =
 {
+#if 0
 	{ .type = SI_KCS, .port = 0xca2 },
 	{ .type = SI_SMIC, .port = 0xca9 },
 	{ .type = SI_BT, .port = 0xe4 },
+#endif
+	{ .type = SI_KCS, .port = 0xfffffff0f05b0000 },
 	{ .port = 0 }
 };
 
@@ -3021,13 +3024,13 @@ static __devinit void default_find_bmc(void)
 		info->addr_source = SI_DEFAULT;
 
 		info->si_type = ipmi_defaults[i].type;
-		info->io_setup = port_setup;
-		info->io.addr_data = ipmi_defaults[i].port;
-		info->io.addr_type = IPMI_IO_ADDR_SPACE;
+		info->io_setup = mem_setup;
+		info->io.addr_data = 0xfffffff0f05b0000; // ipmi_defaults[i].port;
+		info->io.addr_type = IPMI_MEM_ADDR_SPACE;
 
 		info->io.addr = NULL;
-		info->io.regspacing = DEFAULT_REGSPACING;
-		info->io.regsize = DEFAULT_REGSPACING;
+		info->io.regspacing = 1; // DEFAULT_REGSPACING;
+		info->io.regsize = 1; // DEFAULT_REGSPACING;
 		info->io.regshift = 0;
 
 		if (add_smi(info) == 0) {
diff --git a/drivers/net/e1000/e1000_main.c b/drivers/net/e1000/e1000_main.c
index 5cc39ed..9964a66 100644
--- a/drivers/net/e1000/e1000_main.c
+++ b/drivers/net/e1000/e1000_main.c
@@ -935,7 +935,7 @@ static int __devinit e1000_probe(struct pci_dev *pdev,
 	e1000_reset_hw(hw);
 
 	/* make sure the EEPROM is good */
-	if (e1000_validate_eeprom_checksum(hw) < 0) {
+	if (0 && e1000_validate_eeprom_checksum(hw) < 0) {
 		e_err(probe, "The EEPROM Checksum Is Not Valid\n");
 		e1000_dump_eeprom(adapter);
 		/*
diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index c768367..9e5901f 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -836,6 +836,68 @@ int iosapic_fixup_irq(void *isi_obj, struct pci_dev *pcidev)
 	return pcidev->irq;
 }
 
+static struct iosapic_info *first_isi = NULL;
+
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
+
 
 /*
 ** squirrel away the I/O Sapic Version
@@ -902,6 +964,8 @@ void *iosapic_register(unsigned long hpa)
 		vip->irqline = (unsigned char) cnt;
 		vip->iosapic = isi;
 	}
+	if (!first_isi)
+		first_isi = isi;
 	return isi;
 }
 
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 3aeb327..3d185d0 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1025,6 +1025,7 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 			unsigned long end;	/* aka finish */
 		} *p, *io;
 		struct resource *r;
+		unsigned long lba_len;
 
 		p = (void *) &(pa_pdc_cell->mod[2+i*3]);
 		io = (void *) &(io_pdc_cell->mod[2+i*3]);
@@ -1039,6 +1040,13 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 		case PAT_LMMIO:
 			/* used to fix up pre-initialized MEM BARs */
 			if (!lba_dev->hba.lmmio_space.start) {
+				lba_len = ~READ_REG32(lba_dev->hba.base_addr + LBA_LMMIO_MASK);
+				if ((p->end - p->start) != lba_len) {
+					printk(KERN_WARNING
+					       "PCI%02x LMMIO mismatch between PAT length and MASK register, fixing.\n",
+					       (int)lba_dev->hba.bus_num.start);
+					p->end = p->start + lba_len;
+				}
 				sprintf(lba_dev->hba.lmmio_name,
 						"PCI%02x LMMIO",
 						(int)lba_dev->hba.bus_num.start);
diff --git a/drivers/serial/8250_gsc.c b/drivers/serial/8250_gsc.c
index d8c0ffb..69d7a58 100644
--- a/drivers/serial/8250_gsc.c
+++ b/drivers/serial/8250_gsc.c
@@ -24,13 +24,17 @@
 
 #include "8250.h"
 
+static int num = 4;
+
+extern int iosapic_serial_irq(int);
+
 static int __init serial_init_chip(struct parisc_device *dev)
 {
 	struct uart_port port;
 	unsigned long address;
 	int err;
 
-	if (!dev->irq) {
+	if (0 && !dev->irq) {
 		/* We find some unattached serial ports by walking native
 		 * busses.  These should be silently ignored.  Otherwise,
 		 * what we have here is a missing parent device, so tell
@@ -43,6 +47,8 @@ static int __init serial_init_chip(struct parisc_device *dev)
 				(unsigned long long)dev->hpa.start);
 		return -ENODEV;
 	}
+	dev->irq = iosapic_serial_irq(num++);
+	printk("serial %d irq %d\n",num-1, dev->irq);
 
 	address = dev->hpa.start;
 	if (dev->id.sversion != 0x8d)
@@ -51,7 +57,8 @@ static int __init serial_init_chip(struct parisc_device *dev)
 	memset(&port, 0, sizeof(port));
 	port.iotype	= UPIO_MEM;
 	/* 7.272727MHz on Lasi.  Assumed the same for Dino, Wax and Timi. */
-	port.uartclk	= 7272727;
+	//port.uartclk	= 7272727;
+	port.uartclk	= 1843200;
 	port.mapbase	= address;
 	port.membase	= ioremap_nocache(address, 16);
 	port.irq	= dev->irq;
@@ -73,6 +80,7 @@ static struct parisc_device_id serial_tbl[] = {
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x00075 },
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008c },
 	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0008d },
+	{ HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x000ad },
 	{ 0 }
 };
 
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
