From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: provide pci_mmap_page_range() for parisc
Date: Fri, 14 Jun 2013 09:05:41 +0200
Message-ID: <20130614070541.GA10443@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

pci_mmap_page_range() is needed for X11-server support on C8000 with ATI
FireGL card.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pci.h b/arch/parisc/include/asm/pci.h
index 3234f49..4651540 100644
--- a/arch/parisc/include/asm/pci.h
+++ b/arch/parisc/include/asm/pci.h
@@ -225,4 +225,9 @@ static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 	return channel ? 15 : 14;
 }
 
+#define HAVE_PCI_MMAP
+
+extern int pci_mmap_page_range(struct pci_dev *dev, struct vm_area_struct *vma,
+	enum pci_mmap_state mmap_state, int write_combine);
+
 #endif /* __ASM_PARISC_PCI_H */
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 6030905..64f2764 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -220,6 +220,33 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 }
 
 
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
  * A driver is enabling the device.  We make sure that all the appropriate
  * bits are set to allow the device to operate as the driver is expecting.
