Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dh64.b180 (b180.mmjgroup.com [192.34.35.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8AE1A4829
	for <parisc-linux@parisc-linux.org>; Tue,  3 Dec 2002 22:06:47 -0700 (MST)
Date: Tue, 3 Dec 2002 22:06:40 -0700
To: parisc-linux@parisc-linux.org
Message-ID: <20021204050640.GA22117@b180.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: lamont@b180.mmjgroup.com (LaMont Jones)
Subject: [parisc-linux] airo.c patch for hppa
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

The patch below gets airo.c working on hppa.  Diff is vs 2.4.20 source.

The first part (chage to init_airo_card and it's callers) allows us to call
pci_enable_device like we need to.

The other part (the stuff inside #ifdef __hppa__) is a gross hack that works
around some issues between dino and the card during initialization where the
card fails to ack reads of several 2-byte aligned addresses.  With these
changes, I have a working PCI4800 in my B180.

It would, of course, be nice if at least part of this made it into the CVS
tree...

thoughts?
lamont

--- ../x/airo.c	2002-12-03 18:55:31.000000000 -0700
+++ drivers/net/wireless/airo.c	2002-12-03 21:20:32.000000000 -0700
@@ -1649,7 +1649,7 @@
 	return dev;
 }
 
-struct net_device *init_airo_card( unsigned short irq, int port, int is_pcmcia )
+struct net_device *init_airo_card( unsigned short irq, int port, int is_pcmcia , struct pci_dev *pdev )
 {
 	struct net_device *dev;
 	struct airo_info *ai;
@@ -1696,6 +1696,12 @@
 	dev->irq = irq;
 	dev->base_addr = port;
 
+	if ( !is_pcmcia && pdev ) {
+		if (pci_enable_device(pdev))
+			goto err_out_free;
+		pci_set_master(pdev);
+	}
+
 	rc = request_irq( dev->irq, airo_interrupt, SA_SHIRQ, dev->name, dev );
 	if (rc) {
 		printk(KERN_ERR "airo: register interrupt %d failed, rc %d\n", irq, rc );
@@ -2163,12 +2169,22 @@
 static u16 IN4500( struct airo_info *ai, u16 reg ) {
 	unsigned short rc;
 
+#ifdef __hppa__
+	if ((reg&3) && reg!=DATA0) {
+		unsigned int ri;
+		ri=inl(ai->dev->base_addr + (reg&~3));
+		rc=(ri>>(8*(reg&3)))&0xffff;
+	} else {
+		rc = inw( ai->dev->base_addr + reg );
+	}
+#else
 	if ( !do8bitIO )
 		rc = inw( ai->dev->base_addr + reg );
 	else {
 		rc = inb( ai->dev->base_addr + reg );
 		rc += ((int)inb( ai->dev->base_addr + reg + 1 )) << 8;
 	}
+#endif
 	return rc;
 }
 
@@ -2266,6 +2282,7 @@
 		printk(KERN_ERR "airo: Error checking for AUX port\n");
 		return ERROR;
 	}
+	
 	if (!aux_bap || rsp.status & 0xff00) {
 		ai->bap_read = fast_bap_read;
 		printk(KERN_DEBUG "airo: Doing fast bap_reads\n");
@@ -4008,7 +4025,7 @@
 {
 	struct net_device *dev;
 
-	dev = init_airo_card(pdev->irq,	pdev->resource[2].start, 0);
+	dev = init_airo_card(pdev->irq,	pdev->resource[2].start, 0, pdev);
 	if (!dev)
 		return -ENODEV;
 
@@ -4036,7 +4053,7 @@
 		printk( KERN_INFO
 			"airo:  Trying to configure ISA adapter at irq=%d io=0x%x\n",
 			irq[i], io[i] );
-		if (init_airo_card( irq[i], io[i], 0 ))
+		if (init_airo_card( irq[i], io[i], 0, 0 ))
 			have_isa_dev = 1;
 	}
 
