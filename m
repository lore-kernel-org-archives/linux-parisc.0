Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3A754875
	for <parisc-linux@parisc-linux.org>; Tue,  4 Nov 2003 19:31:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AHDS4-00054E-2y
	for parisc-linux@parisc-linux.org; Wed, 05 Nov 2003 02:31:20 +0000
Date: Wed, 5 Nov 2003 02:31:20 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20031105023120.GP14749@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] kill sysdata
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

We don't really need parisc_device->sysdata any more.  This patch
kill off all references to it.  Comments?

Index: drivers/parisc/dino.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/dino.c,v
retrieving revision 1.10
diff -u -p -r1.10 dino.c
--- drivers/parisc/dino.c	10 Oct 2003 16:11:03 -0000	1.10
+++ drivers/parisc/dino.c	5 Nov 2003 02:06:14 -0000
@@ -555,7 +555,7 @@ dino_fixup_bus(struct pci_bus *bus)
         struct dino_device *dino_dev = DINO_DEV(parisc_walk_tree(bus->dev));
 	int port_base = HBA_PORT_BASE(dino_dev->hba.hba_num);
 
-	DBG(KERN_WARNING "%s(0x%p) bus %d sysdata 0x%p\n",
+	DBG(KERN_WARNING "%s(0x%p) bus %d platform_data 0x%p\n",
 			__FUNCTION__, bus, bus->secondary, bus->dev->platform_data);
 
 	/* Firmware doesn't set up card-mode dino, so we have to */
Index: drivers/parisc/lba_pci.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/lba_pci.c,v
retrieving revision 1.5
diff -u -p -r1.5 lba_pci.c
--- drivers/parisc/lba_pci.c	8 Sep 2003 22:00:24 -0000	1.5
+++ drivers/parisc/lba_pci.c	5 Nov 2003 02:14:09 -0000
@@ -701,7 +701,7 @@ lba_fixup_bus(struct pci_bus *bus)
 	struct lba_device *ldev = LBA_DEV(parisc_walk_tree(bus->dev));
 	int lba_portbase = HBA_PORT_BASE(ldev->hba.hba_num);
 
-	DBG("lba_fixup_bus(0x%p) bus %d sysdata 0x%p\n",
+	DBG("lba_fixup_bus(0x%p) bus %d platform_data 0x%p\n",
 		bus, bus->secondary, bus->dev->platform_data);
 
 	/*
Index: drivers/parisc/sba_iommu.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/sba_iommu.c,v
retrieving revision 1.4
diff -u -p -r1.4 sba_iommu.c
--- drivers/parisc/sba_iommu.c	8 Sep 2003 22:00:24 -0000	1.4
+++ drivers/parisc/sba_iommu.c	5 Nov 2003 01:21:20 -0000
@@ -1989,7 +1989,7 @@ sba_driver_callback(struct parisc_device
 		return(1);
 	}
 
-	dev->sysdata = (void *) sba_dev;
+	dev->dev.driver_data = sba_dev;
 	memset(sba_dev, 0, sizeof(struct sba_device));
 
 	for(i=0; i<MAX_IOC; i++)
@@ -2042,7 +2042,7 @@ void __init sba_init(void)
  */
 void * sba_get_iommu(struct parisc_device *pci_hba)
 {
-	struct sba_device *sba = (struct sba_device *) pci_hba->parent->sysdata;
+	struct sba_device *sba = pci_hba->parent->dev.driver_data;
 	char t = pci_hba->parent->id.hw_type;
 	int iocnum = (pci_hba->hw_path >> 3);	/* rope # */
 
Index: include/asm-parisc/parisc-device.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/parisc-device.h,v
retrieving revision 1.1
diff -u -p -r1.1 parisc-device.h
--- include/asm-parisc/parisc-device.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/parisc-device.h	5 Nov 2003 01:21:38 -0000
@@ -7,7 +7,6 @@ struct parisc_device {
 	struct parisc_device *sibling;
 	struct parisc_device *child;
 	struct parisc_driver *driver;	/* Driver for this device */
-	void		*sysdata;	/* Driver instance private data */
 	char		name[80];	/* The hardware description */
 	int		irq;
 
Index: include/asm-parisc/pci.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pci.h,v
retrieving revision 1.2
diff -u -p -r1.2 pci.h
--- include/asm-parisc/pci.h	25 Sep 2003 01:07:21 -0000	1.2
+++ include/asm-parisc/pci.h	5 Nov 2003 02:14:55 -0000
@@ -42,7 +42,7 @@
 **
 ** This is the "common" or "base" data structure which HBA drivers
 ** (eg Dino or LBA) are required to place at the top of their own
-** dev->sysdata structure.  I've heard this called "C inheritance" too.
+** platform_data structure.  I've heard this called "C inheritance" too.
 **
 ** Data needed by pcibios layer belongs here.
 */

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
