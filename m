Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC94F482B
	for <parisc-linux@parisc-linux.org>; Fri, 15 Mar 2002 06:58:02 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16lsDZ-0000Xe-00
	for parisc-linux@parisc-linux.org; Fri, 15 Mar 2002 13:58:01 +0000
Date: Fri, 15 Mar 2002 13:58:01 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020315135801.X30538@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] STI without PCI
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

Right now, it's not possible to compile STI in without PCI.  This patch
should fix that.  Feedback appreciated.

Index: drivers/video/sti/sticore.c
===================================================================
RCS file: /var/cvs/linux/drivers/video/sti/sticore.c,v
retrieving revision 1.37
diff -u -p -r1.37 sticore.c
--- drivers/video/sti/sticore.c	2002/03/03 23:05:06	1.37
+++ drivers/video/sti/sticore.c	2002/03/15 13:56:24
@@ -918,10 +918,10 @@ static int __init sticore_pa_init(struct
 	return 0;
 }
 
-
 static int __devinit sticore_pci_init(struct pci_dev *pd,
 		const struct pci_device_id *ent)
 {
+#ifdef CONFIG_PCI
 	unsigned long fb_base, rom_base;
 	unsigned int fb_len, rom_len;
 	struct sti_struct *sti;
@@ -962,10 +962,9 @@ static int __devinit sticore_pci_init(st
 			pd->name);
 		return -ENODEV;
 	}
-
+#endif /* CONFIG_PCI */
 	return 0;
 }
-
 
 static void __devexit sticore_pci_remove(struct pci_dev *pd)
 {

-- 
Revolutions do not require corporate support.
