Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2575A4A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Feb 2001 04:02:42 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA07909
	for <parisc-linux@puffin.external.hp.com>; Sun, 25 Feb 2001 03:57:56 -0700
Sender: delahaym@esiee.fr
Message-ID: <3A98E64E.A8A9216A@esiee.fr>
Date: Sun, 25 Feb 2001 12:02:38 +0100
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>,
	parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Unregister driver patch
References: <200102250616.WAA22623@milano.cup.hp.com>
Content-Type: multipart/mixed;
 boundary="------------6502D643E70F51A324AA0CCC"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------6502D643E70F51A324AA0CCC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Grant Grundler wrote:

> Matthieu Delahaye wrote:
> > Here is a patch which implements the unregister_driver() function.
>
> Matthieu,
> That's excellent!
>
> But no patch was attached. Please post!
>

Yes, it's not the first time! The problem was between my keyboard and my
chair ;-)
More over, I reposted it before your answer... to myself only... Sorry.
I think holidays aren't good for me.

Matthieu

>
> thanks,
> grant
>
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

--------------6502D643E70F51A324AA0CCC
Content-Type: text/plain; charset=us-ascii;
 name="unregister.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="unregister.diff"

diff -Nru linux.old/arch/parisc/kernel/drivers.c linux.new/arch/parisc/kernel/drivers.c
--- linux.old/arch/parisc/kernel/drivers.c	Sat Feb 10 18:13:25 2001
+++ linux.new/arch/parisc/kernel/drivers.c	Sat Feb 24 16:40:03 2001
@@ -57,17 +57,23 @@
 		** The list gets built in reverse order...ideally, it shouldn't
 		** matter but reality will eventually rear it's ugly head.
 		*/
+		if(driver->next) {
+			BUG();
+			printk(KERN_WARNING "Warning: %s %s was already registered. Skiping.\n", driver->name,driver->version);
+			continue; 
+		}
+		
 		driver->next = pa_drivers;
 		pa_drivers = driver;
 
 		for (i=0; i < num_devices; i++) {
 			device = &pa_devices[i];
 
-			if (device->managed)			continue;
+			if ((int)device->driver) continue;
 			if (0 == compare_spec(device, driver))	continue;
 
 			if ( (*driver->callback)(device,driver) ==0) {
-				device->managed=1;
+				device->driver=driver;
 			} else {
 				printk("Warning : device (%d, 0x%x, 0x%x, 0x%x, 0x%x) NOT claimed by %s %s\n",
 					device->hw_type,
@@ -77,6 +83,42 @@
 			}
 		}
 	}
+	
+	return 0;
+}
+
+
+
+int unregister_driver(struct pa_iodc_driver *driver)
+{
+	int i;
+	struct hp_device * device;
+	struct pa_iodc_driver * drv;
+	
+	for(;driver->check;driver++) {
+		drv=pa_drivers;
+		if(pa_drivers==driver) {
+			pa_drivers=driver->next;
+		} else {
+			while(drv!=NULL && driver!=drv->next) {
+				drv=drv->next;
+			}
+
+			if(drv==NULL) {
+				printk(KERN_WARNING "unregister_driver: %s %s wasn't registered\n", driver->name, driver->version);
+				continue;
+			} else {
+				drv->next=driver->next;
+				driver->next=NULL;
+			}
+			
+		}
+	    
+		for (i=0; i < num_devices; i++) {
+			device = &pa_devices[i];
+			if (device->driver==driver) device->driver=NULL;
+		}
+	}
 	return 0;
 }
 
@@ -127,7 +169,7 @@
 	d->sversion_rev = iodc_data[4]>>4;
 	d->opt = iodc_data[7];
 	d->hpa = (void *) hpa;
-	d->managed = 0;
+	d->driver = NULL;
 	d->reference = parisc_get_reference(d->hw_type,
 					d->hversion, d->sversion);
 
@@ -145,16 +187,16 @@
 {
 	struct pa_iodc_driver *driver = pa_drivers;
 
-	while ((0 == hp_dev->managed) && (NULL != driver)) {
+	while ((NULL == hp_dev->driver) && (NULL != driver)) {
 
 		if (compare_spec(hp_dev,driver))
-			hp_dev->managed =
-				((*driver->callback)(hp_dev,driver) == 0);
+			hp_dev->driver =
+				(((*driver->callback)(hp_dev,driver) == 0)?driver:NULL);
 
 		driver = driver->next;
 	}
 
-	return hp_dev->managed;
+	return (hp_dev->driver==driver);
 }
 
 struct hp_device *get_pa_dev(unsigned int index)
diff -Nru linux.old/include/asm-parisc/hardware.h linux.new/include/asm-parisc/hardware.h
--- linux.old/include/asm-parisc/hardware.h	Sat Feb 10 18:14:08 2001
+++ linux.new/include/asm-parisc/hardware.h	Sat Feb 24 16:43:00 2001
@@ -22,7 +22,7 @@
 	unsigned int	sversion_rev;
 	struct hp_hardware *reference;  /* This is a pointer to the
                                             reference */
-	unsigned int	managed; /* this is if the device has a driver for it */
+	struct pa_iodc_driver *driver; /* this is if the device has a driver for it */
 
 	unsigned int	num_addrs;	/* some devices have additional address ranges, */
 	unsigned long	addr[MAX_ADD_ADDRS]; /* which will be stored here */
@@ -113,6 +113,7 @@
 extern struct hp_device *get_pa_dev(unsigned int index);
 extern void print_pa_devices(char * buf);
 extern int register_driver(struct pa_iodc_driver *driver);
+extern int unregister_driver(struct pa_iodc_driver *driver);
 
 /* inventory.c: */
 extern void do_inventory(void);

--------------6502D643E70F51A324AA0CCC--
