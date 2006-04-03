From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] LBA ioremap problem
Date: Mon, 3 Apr 2006 13:13:26 -0600
Message-ID: <20060403191326.GF8315@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


I've tried to fix the problem with running out of vmalloc space on
N-class with this patch.  Unfortunately, the system hangs when trying
to access the *second* sym2 controller.  The debug shows it happily
reading and writing the ethernet controller and the first sym2
controller.  Help?

Index: drivers/parisc/lba_pci.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/lba_pci.c,v
retrieving revision 1.39
diff -u -p -r1.39 lba_pci.c
--- drivers/parisc/lba_pci.c	27 Mar 2006 19:52:14 -0000	1.39
+++ drivers/parisc/lba_pci.c	3 Apr 2006 17:55:08 -0000
@@ -199,7 +199,7 @@ struct lba_device {
 	void		*iosapic_obj;
 
 #ifdef CONFIG_64BIT
-	void __iomem *	iop_base;    /* PA_VIEW - for IO port accessor funcs */
+	unsigned long	iop_base;    /* PA_VIEW - for IO port accessor funcs */
 #endif
 
 	int		flags;       /* state/functionality enabled */
@@ -1048,8 +1048,8 @@ static struct pci_port_ops lba_astro_por
 
 
 #ifdef CONFIG_64BIT
-#define PIOP_TO_GMMIO(lba, addr) \
-	((lba)->iop_base + (((addr)&0xFFFC)<<10) + ((addr)&3))
+#define PORT_BASE(l, addr) \
+	(LBA_DEV(l)->iop_base + (((addr)&0xFFFC)<<10) + ((addr)&3))
 
 /*******************************************************
 **
@@ -1064,35 +1064,37 @@ static struct pci_port_ops lba_astro_por
 ** Then add the base and we can generate an I/O Port cycle.
 ********************************************************/
 #undef LBA_PORT_IN
-#define LBA_PORT_IN(size, mask) \
+#define LBA_PORT_IN(size, bwl) \
 static u##size lba_pat_in##size (struct pci_hba_data *l, u16 addr) \
 { \
 	u##size t; \
 	DBG_PORT("%s(0x%p, 0x%x) ->", __FUNCTION__, l, addr); \
-	t = READ_REG##size(PIOP_TO_GMMIO(LBA_DEV(l), addr)); \
+	printk("reading a " #bwl " from 0x%lx\n", PORT_BASE(l, addr)); \
+	t = gsc_read##bwl(PORT_BASE(l, addr)); \
 	DBG_PORT(" 0x%x\n", t); \
 	return (t); \
 }
 
-LBA_PORT_IN( 8, 3)
-LBA_PORT_IN(16, 2)
-LBA_PORT_IN(32, 0)
+LBA_PORT_IN( 8, b)
+LBA_PORT_IN(16, w)
+LBA_PORT_IN(32, l)
 
 
 #undef LBA_PORT_OUT
-#define LBA_PORT_OUT(size, mask) \
+#define LBA_PORT_OUT(size, bwl) \
 static void lba_pat_out##size (struct pci_hba_data *l, u16 addr, u##size val) \
 { \
-	void *where = (void *) PIOP_TO_GMMIO(LBA_DEV(l), addr); \
 	DBG_PORT("%s(0x%p, 0x%x, 0x%x)\n", __FUNCTION__, l, addr, val); \
-	WRITE_REG##size(val, where); \
+	printk("writing a " #bwl " to 0x%lx\n", PORT_BASE(l, addr)); \
+	gsc_write##bwl(val, PORT_BASE(l, addr)); \
 	/* flush the I/O down to the elroy at least */ \
+	printk("reading back from Elroy\n"); \
 	lba_t32 = READ_U32(l->base_addr + LBA_FUNC_ID); \
 }
 
-LBA_PORT_OUT( 8, 3)
-LBA_PORT_OUT(16, 2)
-LBA_PORT_OUT(32, 0)
+LBA_PORT_OUT( 8, b)
+LBA_PORT_OUT(16, w)
+LBA_PORT_OUT(32, l)
 
 
 static struct pci_port_ops lba_pat_port_ops = {
@@ -1213,7 +1215,8 @@ lba_pat_resources(struct parisc_device *
 			** Postable I/O port space is per PCI host adapter.
 			** base of 64MB PIOP region
 			*/
-			lba_dev->iop_base = ioremap_nocache(p->start, 64 * 1024 * 1024);
+			lba_dev->iop_base = p->start;
+			printk("iop_base = 0x%lx\n", lba_dev->iop_base);
 
 			sprintf(lba_dev->hba.io_name, "PCI%02lx Ports",
 					lba_dev->hba.bus_num.start);

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
