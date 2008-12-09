From: Kyle McMartin <kyle@infradead.org>
Subject: resource_size_t printk woes...
Date: Mon, 8 Dec 2008 22:44:31 -0500
Message-ID: <20081209034431.GE30783@bombadil.infradead.org>
References: <20081208153413.GJ9092@bombadil.infradead.org> <20081208155754.DD5184E7A@hiauly1.hia.nrc.ca> <20081208160021.GA30783@bombadil.infradead.org> <20081208160051.GB30783@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208160051.GB30783@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 08, 2008 at 11:00:51AM -0500, Kyle McMartin wrote:
>

Something like this was what I had in mind... seems to (x)compile,
haven't actually run-time tested it. Kills the warnings, at least. ;-)

Needs some more thinking before I might hit upstream with it.

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index dcc1e99..ccb7858 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1551,7 +1551,7 @@ static int __init ccio_probe(struct parisc_device *dev)
 
 	ioc->name = dev->id.hversion == U2_IOA_RUNWAY ? "U2" : "UTurn";
 
-	printk(KERN_INFO "Found %s at 0x%lx\n", ioc->name, dev->hpa.start);
+	printk(KERN_INFO "Found %s at %pZ\n", ioc->name, &(dev->hpa.start));
 
 	for (i = 0; i < ioc_count; i++) {
 		ioc_p = &(*ioc_p)->next;
diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index a28c894..0221545 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1413,8 +1413,8 @@ lba_driver_probe(struct parisc_device *dev)
 		default: version = "TR4+";
 		}
 
-		printk(KERN_INFO "Elroy version %s (0x%x) found at 0x%lx\n",
-		       version, func_class & 0xf, (long)dev->hpa.start);
+		printk(KERN_INFO "Elroy version %s (0x%x) found at %pZ\n",
+		       version, func_class & 0xf, &(dev->hpa.start));
 
 		if (func_class < 2) {
 			printk(KERN_WARNING "Can't support LBA older than "
@@ -1442,14 +1442,14 @@ lba_driver_probe(struct parisc_device *dev)
 		/* We could use one printk for both Elroy and Mercury,
                  * but for the mask for func_class.
                  */ 
-		printk(KERN_INFO "%s version TR%d.%d (0x%x) found at 0x%lx\n",
+		printk(KERN_INFO "%s version TR%d.%d (0x%x) found at %pZ\n",
 		       IS_MERCURY(dev) ? "Mercury" : "Quicksilver", major,
-		       minor, func_class, (long)dev->hpa.start);
+		       minor, func_class, &(dev->hpa.start));
 
 		cfg_ops = &mercury_cfg_ops;
 	} else {
-		printk(KERN_ERR "Unknown LBA found at 0x%lx\n",
-			(long)dev->hpa.start);
+		printk(KERN_ERR "Unknown LBA found at %pZ\n",
+			&(dev->hpa.start));
 		return -ENODEV;
 	}
 
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index bc73b96..4ad4d52 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -1938,8 +1938,8 @@ sba_driver_callback(struct parisc_device *dev)
 			global_ioc_cnt *= 2;
 	}
 
-	printk(KERN_INFO "%s found %s at 0x%llx\n",
-		MODULE_NAME, version, (unsigned long long)dev->hpa.start);
+	printk(KERN_INFO "%s found %s at %pZ\n",
+		MODULE_NAME, version, &(dev->hpa.start));
 
 	sba_dev = kzalloc(sizeof(struct sba_device), GFP_KERNEL);
 	if (!sba_dev) {
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a013bbc..342496f 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -607,6 +607,12 @@ static char *pointer(const char *fmt, char *buf, char *end, void *ptr, int field
 		return symbol_string(buf, end, ptr, field_width, precision, flags);
 	case 'R':
 		return resource_string(buf, end, ptr, field_width, precision, flags);
+	case 'Z':
+		{
+			resource_size_t rsz = *((resource_size_t *)ptr);
+			return number(buf, end, (unsigned long long)rsz, 16,
+				field_width, -1, SPECIAL | SMALL | ZEROPAD);
+		}
 	}
 	flags |= SMALL;
 	if (field_width == -1) {
