From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] stop the buffer bouncing
Date: Mon, 15 Nov 2004 23:37:33 -0700
Message-ID: <20041116063733.GA27633@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
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

James,
I think I found the reason parisc is bouncing buffers on the a500
when it shouldn't (iommu is present):

include/asm/pci.h defines:
#define PCI_DMA_BUS_IS_PHYS     (1)

and drivers/scsi/scsi_lib.c uses it like this:
        if (PCI_DMA_BUS_IS_PHYS && host_dev && host_dev->dma_mask)
                return *host_dev->dma_mask;

Which means anything > ~0U will get bounced.
Sym2 driver uses a 32-bit DMA mask.
And we established this a500 has RAM above :
model 9000/800/A500-6X
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 Mb
 1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 Mb

If someone else can review/test and/or commit, that would be great.
Otherwise I can commit this tomorrow. (Assuming CVS is still alive and well)

Patch below is partially inspired by include/asm-ia64/pci.h.
Though it might be better to define/declare parisc_bus_is_phys
elsewhere if EISA support also eventually needs it.

Ah, almost forgot the good news: a500 is still running multiple
instances of wipe (14 or 15, I forgot). Check riot's console
the morning...

Log Message:
	Fix the PCI_DMA_BUS_IS_PHYS so parisc-linux never bounces buffers
	on systems with an IOMMU.

Signed-of-by: Grant Grundler <grundler@parisc-linux.org>

thanks,
grant


Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/setup.c,v
retrieving revision 1.9
diff -u -p -r1.9 setup.c
--- arch/parisc/kernel/setup.c	12 Oct 2004 01:07:00 -0000	1.9
+++ arch/parisc/kernel/setup.c	16 Nov 2004 06:08:02 -0000
@@ -53,6 +53,10 @@ struct proc_dir_entry * proc_runway_root
 struct proc_dir_entry * proc_gsc_root = NULL;
 struct proc_dir_entry * proc_mckinley_root = NULL;
 
+#ifndef CONFIG_PA20
+int parisc_bus_is_phys = TRUE;	/* Assume no IOMMU is present */
+EXPORT_SYMBOL(parisc_bus_is_phys);
+#endif
 
 void __init setup_cmdline(char **cmdline_p)
 {
Index: drivers/parisc/ccio-dma.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/ccio-dma.c,v
retrieving revision 1.16
diff -u -p -r1.16 ccio-dma.c
--- drivers/parisc/ccio-dma.c	26 Oct 2004 19:52:46 -0000	1.16
+++ drivers/parisc/ccio-dma.c	16 Nov 2004 06:08:03 -0000
@@ -1560,6 +1560,10 @@ static int ccio_probe(struct parisc_devi
 	parisc_vmerge_boundary = IOVP_SIZE;
 	parisc_vmerge_max_size = BITS_PER_LONG * IOVP_SIZE;
 	ioc_count++;
+
+#ifndef CONFIG_PA20
+	parisc_bus_is_phys = FALSE;
+#endif
 	return 0;
 }
 
Index: drivers/parisc/sba_iommu.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/sba_iommu.c,v
retrieving revision 1.21
diff -u -p -r1.21 sba_iommu.c
--- drivers/parisc/sba_iommu.c	9 Nov 2004 20:28:33 -0000	1.21
+++ drivers/parisc/sba_iommu.c	16 Nov 2004 06:08:03 -0000
@@ -2114,6 +2116,10 @@ sba_driver_callback(struct parisc_device
 	parisc_vmerge_boundary = IOVP_SIZE;
 	parisc_vmerge_max_size = IOVP_SIZE * BITS_PER_LONG;
 
+#ifndef CONFIG_PA20
+	parisc_bus_is_phys = FALSE;
+#endif
+
 	return 0;
 }
 
Index: include/asm-parisc/pci.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pci.h,v
retrieving revision 1.12
diff -u -p -r1.12 pci.h
--- include/asm-parisc/pci.h	3 Nov 2004 00:57:50 -0000	1.12
+++ include/asm-parisc/pci.h	16 Nov 2004 06:08:04 -0000
@@ -106,11 +106,22 @@ static __inline__  int pci_is_lmmio(stru
 struct pci_bus;
 struct pci_dev;
 
-/* The PCI address space does equal the physical memory
- * address space.  The networking and block device layers use
- * this boolean for bounce buffer decisions.
+#ifdef CONFIG_PA20
+/* All PA-2.0 machines have an IOMMU. */
+#define PCI_DMA_BUS_IS_PHYS     (0)
+#else
+/* _some_ PA1.1 boxes have an IOMMU (pa7200)...but we can run these bits on
+ * a PA-2.0 box in narrow mode as well. *sigh* 
+ * FIXME: WAX EISA controller mangles DMA addressing too.
+ */
+
+/* Set to TRUE if PCI address space equals the physical memory address space.
+ * The networking and block device layers use this boolean for bounce buffer
+ * decisions.
  */
-#define PCI_DMA_BUS_IS_PHYS     (1)
+extern unsigned int parisc_bus_is_phys;
+#define PCI_DMA_BUS_IS_PHYS     (parisc_bus_is_phys)
+#endif
 
 /*
 ** Most PCI devices (eg Tulip, NCR720) also export the same registers
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
