Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0DFw9a29696; Tue, 13 Jan 2004 10:58:09 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040113155603.CBCC249425A@palinux.hppa>
References: <20040113155603.CBCC249425A@palinux.hppa>
Content-Type: text/plain
Date: 13 Jan 2004 10:58:06 -0500
Message-Id: <1074009487.2113.77.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2004-01-13 at 10:56, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/01/13 08:56:03
> 
> Modified files:
> 	.              : Makefile 
> 	drivers/parisc : ccio-dma.c dino.c 
> 	include/asm-parisc: pci.h 
> 
> Log message:
> Add Dino support for extended and non-contiguous PCI windows.
> 
> The current code assumes the dino has a single 8MB window.  However,
> this isn't sufficient to support PCI video cards, which can have much
> bigger windows.
> 
> This code adds the ability to translate an arbitrary dino map (which must
> still be correctly set up by firmware) into the PCI resource table.

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1531  -> 1.1532 
#	drivers/parisc/dino.c	1.13    -> 1.14   
#	drivers/parisc/ccio-dma.c	1.15    -> 1.16   
#	include/asm-parisc/pci.h	1.10    -> 1.11   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 04/01/13	jejb@raven.il.steeleye.com	1.1532
# Add support for extended and non-contiguous dino PCI windows
# --------------------------------------------
#
diff -Nru a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
--- a/drivers/parisc/ccio-dma.c	Tue Jan 13 09:51:57 2004
+++ b/drivers/parisc/ccio-dma.c	Tue Jan 13 09:51:57 2004
@@ -1627,11 +1627,11 @@
 
 	if (!ioc) {
 		parent = &iomem_resource;
-	} else if ((ioc->mmio_region->start <= dev->hpa) &&
-			(dev->hpa < ioc->mmio_region->end)) {
+	} else if ((ioc->mmio_region->start <= res->start) &&
+			(res->end <= ioc->mmio_region->end)) {
 		parent = ioc->mmio_region;
-	} else if (((ioc->mmio_region + 1)->start <= dev->hpa) &&
-			(dev->hpa < (ioc->mmio_region + 1)->end)) {
+	} else if (((ioc->mmio_region + 1)->start <= res->start) &&
+			(res->end <= (ioc->mmio_region + 1)->end)) {
 		parent = ioc->mmio_region + 1;
 	} else {
 		return -EBUSY;
diff -Nru a/drivers/parisc/dino.c b/drivers/parisc/dino.c
--- a/drivers/parisc/dino.c	Tue Jan 13 09:51:57 2004
+++ b/drivers/parisc/dino.c	Tue Jan 13 09:51:57 2004
@@ -572,8 +572,16 @@
 	} else if(bus->parent == NULL) {
 		/* must have a dino above it, reparent the resources
 		 * into the dino window */
+		int i;
+		struct resource *res = &dino_dev->hba.lmmio_space;
+
 		bus->resource[0] = &(dino_dev->hba.io_space);
-		bus->resource[1] = &(dino_dev->hba.lmmio_space); 
+		for(i = 0; i < DINO_MAX_LMMIO_RESOURCES; i++) {
+			if(res[i].flags == 0)
+				break;
+			bus->resource[i+1] = &res[i];
+		}
+
 	} else if(bus->self) {
 		int i;
 
@@ -740,9 +748,9 @@
 static int __init
 dino_bridge_init(struct dino_device *dino_dev, const char *name)
 {
-	unsigned long io_addr, bpos;
-	int result;
-	struct resource *res;
+	unsigned long io_addr;
+	int result, i, count=0;
+	struct resource *res, *prevres = NULL;
 	/*
 	 * Decoding IO_ADDR_EN only works for Built-in Dino
 	 * since PDC has already initialized this.
@@ -754,21 +762,51 @@
 		return -ENODEV;
 	}
 
-	for (bpos = 0; (io_addr & (1 << bpos)) == 0; bpos++)
-		;
-
 	res = &dino_dev->hba.lmmio_space;
-	res->flags = IORESOURCE_MEM;
+	for (i = 0; i < 32; i++) {
+		unsigned long start, end;
+
+		if((io_addr & (1 << i)) == 0)
+			continue;
 
-	res->start = (unsigned long)(signed int)(0xf0000000 | (bpos << 23));
-	res->end = res->start + 8 * 1024 * 1024 - 1;
+		start = (unsigned long)(signed int)(0xf0000000 | (i << 23));
+		end = start + 8 * 1024 * 1024 - 1;
 
-	result = ccio_request_resource(dino_dev->hba.dev, res);
-	if (result < 0) {
-		printk(KERN_ERR "%s: failed to claim PCI Bus address space!\n", name);
-		return result;
+		DBG("DINO RANGE %d is at 0x%lx-0x%lx\n", count,
+		    start, end);
+
+		if(prevres && prevres->end + 1 == start) {
+			prevres->end = end;
+		} else {
+			if(count >= DINO_MAX_LMMIO_RESOURCES) {
+				printk(KERN_ERR "%s is out of resource windows for range %d (0x%lx-0x%lx)\n", name, count, start, end);
+				break;
+			}
+			prevres = res;
+			res->start = start;
+			res->end = end;
+			res->flags = IORESOURCE_MEM;
+			res->name = kmalloc(64, GFP_KERNEL);
+			if(res->name)
+				snprintf((char *)res->name, 64, "%s LMMIO %d",
+					 name, count);
+			res++;
+			count++;
+		}
 	}
 
+	res = &dino_dev->hba.lmmio_space;
+
+	for(i = 0; i < DINO_MAX_LMMIO_RESOURCES; i++) {
+		if(res[i].flags == 0)
+			break;
+
+		result = ccio_request_resource(dino_dev->hba.dev, &res[i]);
+		if (result < 0) {
+			printk(KERN_ERR "%s: failed to claim PCI Bus address space %d (0x%lx-0x%lx)!\n", name, i, res[i].start, res[i].end);
+			return result;
+		}
+	}
 	return 0;
 }
 
@@ -849,10 +887,8 @@
 	res = &dino_dev->hba.io_space;
 	if (dev->id.hversion == 0x680 || is_card_dino(&dev->id)) {
 		res->name = "Dino I/O Port";
-	        dino_dev->hba.lmmio_space.name = "Dino LMMIO";
 	} else {
 		res->name = "Cujo I/O Port";
-	        dino_dev->hba.lmmio_space.name = "Cujo LMMIO";
 	}
 	res->start = HBA_PORT_BASE(dino_dev->hba.hba_num);
 	res->end = res->start + (HBA_PORT_SPACE_SIZE - 1);
diff -Nru a/include/asm-parisc/pci.h b/include/asm-parisc/pci.h
--- a/include/asm-parisc/pci.h	Tue Jan 13 09:51:57 2004
+++ b/include/asm-parisc/pci.h	Tue Jan 13 09:51:57 2004
@@ -56,6 +56,11 @@
 	struct resource lmmio_space;	/* bus addresses < 4Gb */
 	struct resource elmmio_space;	/* additional bus addresses < 4Gb */
 	struct resource gmmio_space;	/* bus addresses > 4Gb */
+	/* NOTE: Dino code assumes it can use *all* of the lmmio_space,
+	 * elmmio_space and gmmio_space as a contiguous array of
+	 * resources.  This #define represents the array size */
+	#define DINO_MAX_LMMIO_RESOURCES	3
+
 	unsigned long   lmmio_space_offset;  /* CPU view - PCI view */
 	void *          iommu;          /* IOMMU this device is under */
 	/* REVISIT - spinlock to protect resources? */
