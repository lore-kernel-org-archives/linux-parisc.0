Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53830482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 May 2001 16:41:23 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 21CD0B33
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 May 2001 18:41:22 -0400 (EDT)
Received: from eeyore (helgaas@eeyore.fc.hp.com [15.1.54.199])
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) with SMTP id QAA03460
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 May 2001 16:41:21 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 22 May 2001 16:40:52 -0600
MIME-Version: 1.0
Message-Id: <01052216405201.31667@eeyore>
Subject: [parisc-linux] [PATCH] WAX EISA driver
List-ID: <linux-parisc.vger.kernel.org>

No, I'm not signing up to make WAX work, and I really don't know any 
details about it; I just noticed what appear to be some obvious bugs while 
making some PCI changes.

Attached is a completely untested patch that makes it *look* more like the 
dino and lba code.  I do not plan to check this in, because I don't have 
the time or knowledge to test it.  If you do, feel free :-)

Bjorn


Index: drivers/gsc/wax_eisa.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/gsc/wax_eisa.c,v
retrieving revision 1.3
diff -u -p -r1.3 wax_eisa.c
--- wax_eisa.c	2001/05/01 13:32:09	1.3
+++ wax_eisa.c	2001/05/22 22:04:58
@@ -41,7 +41,7 @@ static struct pa_iodc_driver wax_eisa_dr
 };
 
 #define WAX_EISA_OUT(type, size) \
-static void wax_out##type (u##size d, int addr) \
+static void wax_out##type (struct pci_hba_data *hba, u16 addr, u##size d) 
\
 { \
 	u32 out_addr; \
 	if (((addr >= 0x00080000) && (addr < 0x00100000)) || \
@@ -59,7 +59,7 @@ WAX_EISA_OUT(w,16)
 WAX_EISA_OUT(l,32)
 
 #define WAX_EISA_IN(type, size) \
-static u##size wax_in##type (int addr) \
+static u##size wax_in##type (struct pci_hba_data *hba, u16 addr) \
 { \
 	u32 out_addr; \
 	if (((addr >= 0x00080000) && (addr < 0x00100000)) || \
@@ -68,7 +68,7 @@ static u##size wax_in##type (int addr) \
 			((addr & 0x03f8) << 9) + (addr & 0x0007) ; \
 		return gsc_read##type(out_addr); \
 	} else { \
-		printk("WAX EISA Ack, cannot read from 0x%x\n",addr); \
+		printk("WAX EISA: Ack, cannot read from 0x%x\n",addr); \
 		return -1; \
 	} \
 }
@@ -123,7 +123,8 @@ wax_eisa_driver_init(struct hp_device *d
 	version = gsc_readw(d->hpa+0x7000);
 	printk(KERN_INFO "Wax EISA bus adapter version 0x%x at 
0x%p\n",version,d->hpa);
 
-	pcibios_register_hba((struct pci_hba_data *) &wax_port_ops);
+	pcibios_register_hba(HBA_DATA(&wax_eisa_hba));
+	pci_port = &wax_port_ops;
 
 #if 0
 	/* Turn off lock control */
