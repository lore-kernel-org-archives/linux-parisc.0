Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0FA9482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 14:54:07 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16P9ck-0006vC-00; Fri, 11 Jan 2002 21:54:06 +0000
Date: Fri, 11 Jan 2002 21:54:06 +0000
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Christian Suder <csuder@cisco.com>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
Message-ID: <20020111215406.E20052@parcelfarce.linux.theplanet.co.uk>
References: <3C3F06DD.6050409@verizon.net> <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk> <3C3F0DD1.4040508@verizon.net> <4.3.2.7.2.20020111113403.03f1b330@mira-sjc5-9.cisco.com> <20020111200016.B20052@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020111200016.B20052@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Jan 11, 2002 at 08:00:16PM +0000
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Jan 11, 2002 at 08:00:16PM +0000, Matthew Wilcox wrote:
> This is a very different problem -- your machine at least finds the
> EISA adapter.  I'm interesting in debugging it though; please send a
> full dmesg to me in personal mail.

based on the information you sent, try this patch:

Index: drivers/gsc/dino.c
===================================================================
RCS file: /var/cvs/linux/drivers/gsc/dino.c,v
retrieving revision 1.51
diff -u -p -r1.51 dino.c
--- drivers/gsc/dino.c	2002/01/09 00:13:53	1.51
+++ drivers/gsc/dino.c	2002/01/11 21:37:44
@@ -466,15 +464,6 @@ dino_bios_init(void)
  * Claim an 8MB chunk of unused IO space and call the generic PCI routines
  * to set up the addresses of the devices on this bus.
  */
-#ifdef CONFIG_IOMMU_CCIO
-struct ioc;
-void ccio_extend_mmio_range(struct ioc *ioc);
-struct resource * ccio_find_parisc_resource(struct ioc *ioc);
-#else /* !CONFIG_IOMMU_CCIO */
-#define ccio_extend_mmio_range()
-#define ccio_find_parisc_resource(x) &iomem_resource
-#endif /* !CONFIG_IOMMU_CCIO */
-
 #define _8MB 0x00800000
 static void __init
 dino_card_setup(struct pci_bus *bus, unsigned long base_addr)
Index: drivers/gsc/eisa.c
===================================================================
RCS file: /var/cvs/linux/drivers/gsc/eisa.c,v
retrieving revision 1.13
diff -u -p -r1.13 eisa.c
--- drivers/gsc/eisa.c	2001/11/13 20:42:43	1.13
+++ drivers/gsc/eisa.c	2002/01/11 21:37:44
@@ -311,16 +311,22 @@ static void init_eisa_pic(void)
 static int __devinit eisa_probe(struct parisc_device *dev)
 {
 	int result;
+	struct resource *parent_resource;
+
 	char *name = is_mongoose(dev) ? "Mongoose" : "Wax";
 
 	printk(KERN_INFO "%s EISA Adapter found at 0x%08lx\n", 
 		name, dev->hpa);
-   
+
+	eisa_dev.hba.dev = dev;
+	eisa_dev.hba.iommu = ccio_get_iommu(dev);
+	parent_resource = ccio_find_parisc_resource(eisa_dev.hba.iommu);
+
 	eisa_dev.hba.lmmio_space.name = "EISA";
 	eisa_dev.hba.lmmio_space.start = (unsigned long) 0xfffffffffc000000;
 	eisa_dev.hba.lmmio_space.end = (unsigned long) 0xffffffffffbfffff;
 	eisa_dev.hba.lmmio_space.flags = IORESOURCE_MEM;
-	result = request_resource(&iomem_resource, &eisa_dev.hba.lmmio_space);
+	result = request_resource(parent_resource, &eisa_dev.hba.lmmio_space);
 	if (result < 0) {
 		printk(KERN_ERR "EISA: failed to claim EISA Bus address space!\n");
 		return result;
Index: include/asm-parisc/pci.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/pci.h,v
retrieving revision 1.39
diff -u -p -r1.39 pci.h
--- include/asm-parisc/pci.h	2002/01/07 23:51:15	1.39
+++ include/asm-parisc/pci.h	2002/01/11 21:37:46
@@ -247,11 +247,16 @@ extern inline void pcibios_register_hba(
 
 #ifdef CONFIG_IOMMU_CCIO
 struct parisc_device;
+struct ioc;
 void * ccio_get_iommu(struct parisc_device *dev);
 struct pci_dev * ccio_get_fake(struct parisc_device *dev);
+void ccio_extend_mmio_range(struct ioc *ioc);
+struct resource * ccio_find_parisc_resource(struct ioc *ioc);
 #else /* !CONFIG_IOMMU_CCIO */
-#define ccio_get_iommu(dev) (NULL)
-#define ccio_get_fake(dev) (NULL)
+#define ccio_get_iommu(dev) do { } while (0)
+#define ccio_get_fake(dev) do { } while (0)
+#define ccio_extend_mmio_range(ioc) do { } while (0)
+#define ccio_find_parisc_resource(x) &iomem_resource
 #endif /* !CONFIG_IOMMU_CCIO */
 
 #ifdef CONFIG_IOMMU_SBA

-- 
Revolutions do not require corporate support.
