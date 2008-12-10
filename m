From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: resource_size_t printk woes...
Date: Tue, 9 Dec 2008 23:05:48 -0500 (EST)
Message-ID: <20081210040549.5E7E64EF0@hiauly1.hia.nrc.ca>
References: <20081209034431.GE30783@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081209034431.GE30783@bombadil.infradead.org> from "Kyle McMartin" at Dec 8, 2008 10:44:31 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, Dec 08, 2008 at 11:00:51AM -0500, Kyle McMartin wrote:

> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index a013bbc..342496f 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -607,6 +607,12 @@ static char *pointer(const char *fmt, char *buf, char *end, void *ptr, int field
>  		return symbol_string(buf, end, ptr, field_width, precision, flags);
>  	case 'R':
>  		return resource_string(buf, end, ptr, field_width, precision, flags);

Hmmm, what's this?  It appears this provides a model for printing just
the start value.  The size of the character array depends on the sizeof
resource_size_t.  There's also a flag dependence.

Attached below is the change that I had.  Think this includes some
additional locations to update.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff -upr a/drivers/input/keyboard/hilkbd.c b/drivers/input/keyboard/hilkbd.c
--- a/drivers/input/keyboard/hilkbd.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/input/keyboard/hilkbd.c	2008-12-07 17:10:53.000000000 -0500
@@ -314,7 +314,7 @@ static int __init
 hil_init_chip(struct parisc_device *dev)
 {
 	if (!dev->irq) {
-		printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%08lx\n", dev->hpa.start);
+		printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%p\n", (void *)dev->hpa.start);
 		return -ENODEV;
 	}
 
diff -upr a/drivers/net/lasi_82596.c b/drivers/net/lasi_82596.c
--- a/drivers/net/lasi_82596.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/net/lasi_82596.c	2008-12-07 17:13:51.000000000 -0500
@@ -160,13 +160,13 @@ lan_init_chip(struct parisc_device *dev)
 	int i;
 
 	if (!dev->irq) {
-		printk(KERN_ERR "%s: IRQ not found for i82596 at 0x%lx\n",
-			__FILE__, dev->hpa.start);
+		printk(KERN_ERR "%s: IRQ not found for i82596 at 0x%p\n",
+			__FILE__, (void *)dev->hpa.start);
 		return -ENODEV;
 	}
 
-	printk(KERN_INFO "Found i82596 at 0x%lx, IRQ %d\n", dev->hpa.start,
-			dev->irq);
+	printk(KERN_INFO "Found i82596 at 0x%p, IRQ %d\n",
+		(void *)dev->hpa.start, dev->irq);
 
 	netdevice = alloc_etherdev(sizeof(struct i596_private));
 	if (!netdevice)
diff -upr a/drivers/parisc/asp.c b/drivers/parisc/asp.c
--- a/drivers/parisc/asp.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/parisc/asp.c	2008-12-07 17:22:30.000000000 -0500
@@ -81,8 +81,8 @@ asp_init_chip(struct parisc_device *dev)
 	asp.name = (asp.version == 1) ? "Asp" : "Cutoff";
 	asp.hpa = ASP_INTERRUPT_ADDR;
 
-	printk(KERN_INFO "%s version %d at 0x%lx found.\n", 
-		asp.name, asp.version, dev->hpa.start);
+	printk(KERN_INFO "%s version %d at 0x%p found.\n", 
+		asp.name, asp.version, (void *)dev->hpa.start);
 
 	/* the IRQ ASP should use */
 	ret = -EBUSY;
diff -upr a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
--- a/drivers/parisc/ccio-dma.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/parisc/ccio-dma.c	2008-12-07 19:13:51.000000000 -0500
@@ -1399,8 +1401,8 @@ ccio_init_resource(struct resource *res,
 	 */
 	result = insert_resource(&iomem_resource, res);
 	if (result < 0) {
-		printk(KERN_ERR "%s() failed to claim CCIO bus address space (%08lx,%08lx)\n", 
-			__func__, res->start, res->end);
+		printk(KERN_ERR "%s() failed to claim CCIO bus address space (0x%p,0x%p)\n", 
+			__func__, (void *)res->start, (void *)res->end);
 	}
 }
 
@@ -1551,7 +1553,8 @@ static int __init ccio_probe(struct pari
 
 	ioc->name = dev->id.hversion == U2_IOA_RUNWAY ? "U2" : "UTurn";
 
-	printk(KERN_INFO "Found %s at 0x%lx\n", ioc->name, dev->hpa.start);
+	printk(KERN_INFO "Found %s at 0x%p\n", ioc->name,
+		(void *)dev->hpa.start);
 
 	for (i = 0; i < ioc_count; i++) {
 		ioc_p = &(*ioc_p)->next;
diff -upr a/drivers/parisc/dino.c b/drivers/parisc/dino.c
--- a/drivers/parisc/dino.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/parisc/dino.c	2008-12-07 19:31:24.000000000 -0500
@@ -819,7 +821,7 @@ dino_bridge_init(struct dino_device *din
 
 		result = ccio_request_resource(dino_dev->hba.dev, &res[i]);
 		if (result < 0) {
-			printk(KERN_ERR "%s: failed to claim PCI Bus address space %d (0x%lx-0x%lx)!\n", name, i, res[i].start, res[i].end);
+			printk(KERN_ERR "%s: failed to claim PCI Bus address space %d (0x%p-0x%p)!\n", name, i, (void *)res[i].start, (void *)res[i].end);
 			return result;
 		}
 	}
@@ -898,8 +900,9 @@ static int __init dino_common_init(struc
 	res->flags = IORESOURCE_IO; /* do not mark it busy ! */
 	if (request_resource(&ioport_resource, res) < 0) {
 		printk(KERN_ERR "%s: request I/O Port region failed "
-		       "0x%lx/%lx (hpa 0x%p)\n",
-		       name, res->start, res->end, dino_dev->hba.base_addr);
+		       "0x%p/%p (hpa 0x%p)\n",
+		       name, (void *)res->start, (void *)res->end,
+		       dino_dev->hba.base_addr);
 		return 1;
 	}
 
diff -upr a/drivers/parisc/hppb.c b/drivers/parisc/hppb.c
--- a/drivers/parisc/hppb.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/parisc/hppb.c	2008-12-07 17:19:14.000000000 -0500
@@ -62,7 +62,7 @@ static int hppb_probe(struct parisc_devi
 		}
 		card = card->next;
 	}
-        printk(KERN_INFO "Found GeckoBoa at 0x%x\n", dev->hpa.start);
+        printk(KERN_INFO "Found GeckoBoa at 0x%p\n", (void *)dev->hpa.start);
 
 	card->hpa = dev->hpa.start;
 	card->mmio_region.name = "HP-PB Bus";
@@ -73,8 +73,10 @@ static int hppb_probe(struct parisc_devi
 
 	status = ccio_request_resource(dev, &card->mmio_region);
 	if(status < 0) {
-		printk(KERN_ERR "%s: failed to claim HP-PB bus space (%08x, %08x)\n",
-			__FILE__, card->mmio_region.start, card->mmio_region.end);
+		printk(KERN_ERR "%s: failed to claim HP-PB bus space (0x%p, 0x%p)\n",
+			__FILE__,
+			(void *)card->mmio_region.start,
+			(void *)card->mmio_region.end);
 	}
 
         return 0;
diff -upr a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
--- a/drivers/parport/parport_gsc.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/parport/parport_gsc.c	2008-12-07 17:23:13.000000000 -0500
@@ -352,8 +352,8 @@ static int __devinit parport_init_chip(s
 	unsigned long port;
 
 	if (!dev->irq) {
-		printk(KERN_WARNING "IRQ not found for parallel device at 0x%lx\n",
-			dev->hpa.start);
+		printk(KERN_WARNING "IRQ not found for parallel device at 0x%p\n",
+			(void *)dev->hpa.start);
 		return -ENODEV;
 	}
 
diff -upr a/drivers/serial/8250_gsc.c b/drivers/serial/8250_gsc.c
--- a/drivers/serial/8250_gsc.c	2008-12-01 22:59:23.000000000 -0500
+++ b/drivers/serial/8250_gsc.c	2008-12-07 17:24:15.000000000 -0500
@@ -39,9 +39,9 @@ static int __init serial_init_chip(struc
 		 */
 		if (parisc_parent(dev)->id.hw_type != HPHW_IOA)
 			printk(KERN_INFO
-				"Serial: device 0x%lx not configured.\n"
+				"Serial: device 0x%p not configured.\n"
 				"Enable support for Wax, Lasi, Asp or Dino.\n",
-				dev->hpa.start);
+				(void *)dev->hpa.start);
 		return -ENODEV;
 	}
 
diff -upr a/sound/parisc/harmony.c b/sound/parisc/harmony.c
--- a/sound/parisc/harmony.c	2008-12-01 22:59:23.000000000 -0500
+++ b/sound/parisc/harmony.c	2008-12-07 17:24:55.000000000 -0500
@@ -934,8 +934,8 @@ snd_harmony_create(struct snd_card *card
 	h->irq = -1;
 	h->iobase = ioremap_nocache(padev->hpa.start, HARMONY_SIZE);
 	if (h->iobase == NULL) {
-		printk(KERN_ERR PFX "unable to remap hpa 0x%lx\n",
-		       padev->hpa.start);
+		printk(KERN_ERR PFX "unable to remap hpa 0x%p\n",
+		       (void *)padev->hpa.start);
 		err = -EBUSY;
 		goto free_and_ret;
 	}
