From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] drivers/parisc: fix warnings
Date: Thu, 19 Mar 2009 13:54:07 +0300
Message-ID: <20090319105407.GA3269@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

ccio-dma.c:456: warning: overflow in implicit constant conversion
ccio-dma.c:459: warning: overflow in implicit constant conversion
ccio-dma.c:1032: warning: unused variable 'j'
ccio-dma.c:1031: warning: unused variable 'max'
ccio-dma.c:1031: warning: unused variable 'min'
ccio-dma.c:1031: warning: unused variable 'avg'
ccio-dma.c:1403: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
ccio-dma.c:1403: warning: format '%08lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
ccio-dma.c:1554: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
dino.c:822: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
dino.c:822: warning: format '%lx' expects type 'long unsigned int', but argument 5 has type 'resource_size_t'
dino.c:902: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
dino.c:902: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
asp.c:84: warning: format '%lx' expects type 'long unsigned int', but argument 4 has type 'resource_size_t'
eisa.c:317: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
eisa_enumerator.c:101: warning: format '%lx' expects type 'long unsigned int', but argument 2 has type 'resource_size_t'
eisa_enumerator.c:101: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
eisa_enumerator.c:191: warning: format '%lx' expects type 'long unsigned int', but argument 2 has type 'resource_size_t'
eisa_enumerator.c:191: warning: format '%lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/parisc/asp.c             |    2 +-
 drivers/parisc/ccio-dma.c        |   16 ++++++++--------
 drivers/parisc/dino.c            |    7 +++++--
 drivers/parisc/eisa.c            |    2 +-
 drivers/parisc/eisa_enumerator.c |    4 ++--
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/parisc/asp.c b/drivers/parisc/asp.c
index 7931133..9ca2109 100644
--- a/drivers/parisc/asp.c
+++ b/drivers/parisc/asp.c
@@ -81,7 +81,7 @@ static int __init asp_init_chip(struct parisc_device *dev)
 	asp.hpa = ASP_INTERRUPT_ADDR;
 
 	printk(KERN_INFO "%s version %d at 0x%lx found.\n", 
-		asp.name, asp.version, dev->hpa.start);
+		asp.name, asp.version, (unsigned long)dev->hpa.start);
 
 	/* the IRQ ASP should use */
 	ret = -EBUSY;
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index cd4dd7e..5d610cb 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -406,8 +406,6 @@ resource_found:
 	}
 	ioc->avg_search[ioc->avg_idx++] = cr_start;
 	ioc->avg_idx &= CCIO_SEARCH_SAMPLE - 1;
-#endif
-#ifdef CCIO_COLLECT_STATS
 	ioc->used_pages += pages_needed;
 #endif
 	/* 
@@ -453,10 +451,10 @@ ccio_free_range(struct ioc *ioc, dma_addr_t iova, unsigned long pages_mapped)
 		unsigned long mask = ~(~0UL >> pages_mapped);
 		CCIO_FREE_MAPPINGS(ioc, res_idx, mask, 8);
 #else
-		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xff, 8);
+		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xffUL, 8);
 #endif
 	} else if(pages_mapped <= 16) {
-		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xffff, 16);
+		CCIO_FREE_MAPPINGS(ioc, res_idx, 0xffffUL, 16);
 	} else if(pages_mapped <= 32) {
 		CCIO_FREE_MAPPINGS(ioc, res_idx, ~(unsigned int)0, 32);
 #ifdef __LP64__
@@ -1028,8 +1026,10 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 
 	while (ioc != NULL) {
 		unsigned int total_pages = ioc->res_size << 3;
+#ifdef CCIO_COLLECT_STATS
 		unsigned long avg = 0, min, max;
 		int j;
+#endif
 
 		len += seq_printf(m, "%s\n", ioc->name);
 		
@@ -1060,8 +1060,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 		avg /= CCIO_SEARCH_SAMPLE;
 		len += seq_printf(m, "  Bitmap search : %ld/%ld/%ld (min/avg/max CPU Cycles)\n",
 				  min, avg, max);
-#endif
-#ifdef CCIO_COLLECT_STATS
+
 		len += seq_printf(m, "pci_map_single(): %8ld calls  %8ld pages (avg %d/1000)\n",
 				  ioc->msingle_calls, ioc->msingle_pages,
 				  (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
@@ -1400,7 +1399,7 @@ ccio_init_resource(struct resource *res, char *name, void __iomem *ioaddr)
 	result = insert_resource(&iomem_resource, res);
 	if (result < 0) {
 		printk(KERN_ERR "%s() failed to claim CCIO bus address space (%08lx,%08lx)\n", 
-			__func__, res->start, res->end);
+			__func__, (unsigned long)res->start, (unsigned long)res->end);
 	}
 }
 
@@ -1551,7 +1550,8 @@ static int __init ccio_probe(struct parisc_device *dev)
 
 	ioc->name = dev->id.hversion == U2_IOA_RUNWAY ? "U2" : "UTurn";
 
-	printk(KERN_INFO "Found %s at 0x%lx\n", ioc->name, dev->hpa.start);
+	printk(KERN_INFO "Found %s at 0x%lx\n", ioc->name,
+		(unsigned long)dev->hpa.start);
 
 	for (i = 0; i < ioc_count; i++) {
 		ioc_p = &(*ioc_p)->next;
diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index bb5a1c9..52ae0b1 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -819,7 +819,9 @@ dino_bridge_init(struct dino_device *dino_dev, const char *name)
 
 		result = ccio_request_resource(dino_dev->hba.dev, &res[i]);
 		if (result < 0) {
-			printk(KERN_ERR "%s: failed to claim PCI Bus address space %d (0x%lx-0x%lx)!\n", name, i, res[i].start, res[i].end);
+			printk(KERN_ERR "%s: failed to claim PCI Bus address "
+			       "space %d (0x%lx-0x%lx)!\n", name, i,
+			       (unsigned long)res[i].start, (unsigned long)res[i].end);
 			return result;
 		}
 	}
@@ -899,7 +901,8 @@ static int __init dino_common_init(struct parisc_device *dev,
 	if (request_resource(&ioport_resource, res) < 0) {
 		printk(KERN_ERR "%s: request I/O Port region failed "
 		       "0x%lx/%lx (hpa 0x%p)\n",
-		       name, res->start, res->end, dino_dev->hba.base_addr);
+		       name, (unsigned long)res->start, (unsigned long)res->end,
+		       dino_dev->hba.base_addr);
 		return 1;
 	}
 
diff --git a/drivers/parisc/eisa.c b/drivers/parisc/eisa.c
index 7891db5..f415fdd 100644
--- a/drivers/parisc/eisa.c
+++ b/drivers/parisc/eisa.c
@@ -314,7 +314,7 @@ static int __init eisa_probe(struct parisc_device *dev)
 	char *name = is_mongoose(dev) ? "Mongoose" : "Wax";
 
 	printk(KERN_INFO "%s EISA Adapter found at 0x%08lx\n", 
-		name, dev->hpa.start);
+		name, (unsigned long)dev->hpa.start);
 
 	eisa_dev.hba.dev = dev;
 	eisa_dev.hba.iommu = ccio_get_iommu(dev);
diff --git a/drivers/parisc/eisa_enumerator.c b/drivers/parisc/eisa_enumerator.c
index 6d8aae0..c709ecc 100644
--- a/drivers/parisc/eisa_enumerator.c
+++ b/drivers/parisc/eisa_enumerator.c
@@ -98,7 +98,7 @@ static int configure_memory(const unsigned char *buf,
 			res->start = mem_parent->start + get_24(buf+len+2);
 			res->end = res->start + get_16(buf+len+5)*1024;
 			res->flags = IORESOURCE_MEM;
-			printk("memory %lx-%lx ", res->start, res->end);
+			printk("memory %lx-%lx ", (unsigned long)res->start, (unsigned long)res->end);
 			result = request_resource(mem_parent, res);
 			if (result < 0) {
 				printk("\n" KERN_ERR "EISA Enumerator: failed to claim EISA Bus address space!\n");
@@ -188,7 +188,7 @@ static int configure_port(const unsigned char *buf, struct resource *io_parent,
 			res->start = get_16(buf+len+1);
 			res->end = get_16(buf+len+1)+(c&HPEE_PORT_SIZE_MASK)+1;
 			res->flags = IORESOURCE_IO;
-			printk("ioports %lx-%lx ", res->start, res->end);
+			printk("ioports %lx-%lx ", (unsigned long)res->start, (unsigned long)res->end);
 			result = request_resource(io_parent, res);
 			if (result < 0) {
 				printk("\n" KERN_ERR "EISA Enumerator: failed to claim EISA Bus address space!\n");
