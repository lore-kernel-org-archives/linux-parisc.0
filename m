Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h83K72I15459;
	Wed, 3 Sep 2003 16:07:02 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Cc: parisc-linux-cvs@lists.parisc-linux.org
In-Reply-To: <20030903200300.8B7B7494064@palinux.hppa>
References: <20030903200300.8B7B7494064@palinux.hppa>
Content-Type: text/plain
Date: 03 Sep 2003 16:07:01 -0400
Message-Id: <1062619623.1781.31.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
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

On Wed, 2003-09-03 at 16:03, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	03/09/03 14:03:00
> 
> Modified files:
> 	.              : Makefile 
> 	drivers/parisc : ccio-dma.c dino.c 
> 
> Log message:
> Add card mode dino support for machines with a CCIO.
> 
> This is rather simplistic: basically it simply tries to expand the
> existing ccio window by the dino card mode size (currently 8MB).  This could
> easily fail if there's no room on either side.
> 
> Unfortunately, the correct fix (to reprogram the ccio to take into account
> card mode dinos before beginning bus scanning) is rather complex.
> 
> Also fixed the allocation failure case to delete the devices on the bus
> so drivers don't try attaching to them.

Index: ccio-dma.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/ccio-dma.c,v
retrieving revision 1.3
diff -u -p -r1.3 ccio-dma.c
--- ccio-dma.c	2 Sep 2003 18:42:42 -0000	1.3
+++ ccio-dma.c	3 Sep 2003 19:59:34 -0000
@@ -1534,13 +1534,74 @@ static void __init ccio_init_resources(s
 			(unsigned long)&ioc->ioc_hpa->io_io_low_hv);
 }
 
-static void expand_ioc_area(struct ioc *ioc, unsigned long size,
-		unsigned long min, unsigned long max, unsigned long align)
+static int expand_resource(struct resource *res, unsigned long size,
+			   unsigned long align)
 {
-#ifdef NASTY_HACK_FOR_K_CLASS
-	__raw_writel(0xfffff600, (unsigned long)&(ioc->ioc_hpa->io_io_high));
-	ioc->mmio_region[0].end = 0xf5ffffff;
-#endif
+	struct resource *temp_res;
+	unsigned long start = res->start;
+	unsigned long end ;
+
+	/* see if we can expand above */
+	end = (res->end + size + align - 1) & ~(align - 1);;
+	
+	temp_res = __request_region(res->parent, res->end, end - res->end,
+				    "expansion");
+	if(!temp_res) {
+		/* now try below */
+		start = ((res->start - size + align) & ~(align - 1)) - align;
+		end = res->end;
+		temp_res = __request_region(res->parent, start, size,
+					    "expansion");	
+		if(!temp_res) {
+			return -ENOMEM;
+		}
+	} 
+	release_resource(temp_res);
+	temp_res = res->parent;
+	release_resource(res);
+	res->start = start;
+	res->end = end;
+
+	/* This could be caused by some sort of race.  Basically, if
+	 * this tripped something stole the region we just reserved
+	 * and then released to check for expansion */
+	BUG_ON(request_resource(temp_res, res) != 0);
+
+	return 0;
+}
+
+static void expand_ioc_area(struct resource *parent, struct ioc *ioc,
+			    unsigned long size,	unsigned long min,
+			    unsigned long max, unsigned long align)
+{
+	if(ioc == NULL)
+		/* no IOC, so nothing to expand */
+		return;
+
+	if (expand_resource(parent, size, align) != 0) {
+		printk(KERN_ERR "Unable to expand %s window by 0x%lx\n",
+		       parent->name, size);
+		return;
+	}
+
+	/* OK, we have the memory, now expand the window */
+	if (parent == &ioc->mmio_region[0]) {
+		__raw_writel(((parent->start)>>16) | 0xffff0000,
+			     (unsigned long)&(ioc->ioc_hpa->io_io_low));
+		__raw_writel(((parent->end)>>16) | 0xffff0000,
+			     (unsigned long)&(ioc->ioc_hpa->io_io_high));
+	} else if (parent == &ioc->mmio_region[1]) {
+		__raw_writel(((parent->start)>>16) | 0xffff0000,
+			     (unsigned long)&(ioc->ioc_hpa->io_io_low_hv));
+		__raw_writel(((parent->end)>>16) | 0xffff0000,
+			     (unsigned long)&(ioc->ioc_hpa->io_io_high_hv));
+	} else {
+		/* This should be impossible.  It means
+		 * expand_ioc_area got called with a resource that
+		 * didn't belong to the ioc
+		 */
+		BUG();
+	}
 }
 
 static struct resource *ccio_get_resource(struct ioc* ioc,
@@ -1574,7 +1635,7 @@ int ccio_allocate_resource(const struct 
 			alignf_data))
 		return 0;
 
-	expand_ioc_area(ioc, size, min, max, align);
+	expand_ioc_area(parent, ioc, size, min, max, align);
 	return allocate_resource(parent, res, size, min, max, align, alignf,
 			alignf_data);
 }
Index: dino.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/dino.c,v
retrieving revision 1.3
diff -u -p -r1.3 dino.c
--- dino.c	3 Sep 2003 16:51:12 -0000	1.3
+++ dino.c	3 Sep 2003 19:59:36 -0000
@@ -480,7 +480,18 @@ dino_card_setup(struct pci_bus *bus, uns
 				(unsigned long) 0xfffffffff0000000UL | _8MB,
 				0xffffffffffffffffUL &~ _8MB, _8MB,
 				NULL, NULL) < 0) {
-		printk(KERN_WARNING "Dino: Failed to allocate memory region\n");
+		struct list_head *ln, *tmp_ln;
+
+		printk(KERN_ERR "Dino: cannot attach bus %s\n",
+		       bus->dev->bus_id);
+		/* kill the bus, we can't do anything with it */
+		list_for_each_safe(ln, tmp_ln, &bus->devices) {
+			struct pci_dev *dev = pci_dev_b(ln);
+
+			list_del(&dev->global_list);
+			list_del(&dev->bus_list);
+		}
+			
 		return;
 	}
 	bus->resource[1] = res;
@@ -526,7 +537,6 @@ dino_card_fixup(struct pci_dev *dev)
 	** The additional "-1" adjusts for skewing the IRQ<->slot.
 	*/
 	dino_cfg_read(dev->bus, dev->devfn, PCI_INTERRUPT_PIN, 1, &irq_pin); 
-	printk("DINO CONFIG READ GIVES irq_pin %d\n", irq_pin);
 	dev->irq = (irq_pin + PCI_SLOT(dev->devfn) - 1) % 4 ;
 
 	/* Shouldn't really need to do this but it's in case someone tries
