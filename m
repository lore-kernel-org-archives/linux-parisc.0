Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA21549
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 15:41:15 -0600
Message-Id: <200005262142.OAA09514@milano.cup.hp.com>
To: mj@ucw.cz, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.rutgers.edu, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] -pre9 patch for PCI 
In-reply-to: Your message of "Fri, 26 May 2000 09:29:26 PDT."
             <200005261629.JAA08798@milano.cup.hp.com>
Date: Fri, 26 May 2000 14:42:17 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Linus,
> Here some things we (parisc port) found in the common code.
> Mostly minor stuff.


Alan Cox replied:
| You got patches for those ?

My bad.  I'm tired, had to leave to a funeral, and accidentally sent
out that e-mail prematurely when shutting down my machine.
My apologies.

I had the -pre1 diff (thanks to willy) but not the -pre9 diff.
At willy's suggestion, appended now are patches for -test1:

	drivers/pci/pci.c
	drivers/pci/pci.ids
	include/linux/pci_ids.h

include/linux/pci.h is already fixed in -test1.

apologies again,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253


diff -urN linux-2.4.0-test1/drivers/pci/pci.c linux-ggg/drivers/pci/pci.c
--- linux-2.4.0-test1/drivers/pci/pci.c	Fri Apr 28 23:05:24 2000
+++ linux-ggg/drivers/pci/pci.c	Fri May 26 14:01:34 2000
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/malloc.h>
 #include <linux/ioport.h>
+#include <linux/spinlock.h>
 #include <linux/pm.h>
 
 #include <asm/page.h>
diff -urN linux-2.4.0-test1/drivers/pci/pci.ids linux-ggg/drivers/pci/pci.ids
--- linux-2.4.0-test1/drivers/pci/pci.ids	Wed May 24 17:52:52 2000
+++ linux-ggg/drivers/pci/pci.ids	Fri May 26 14:06:06 2000
@@ -238,11 +238,12 @@
 100a  Phoenix Technologies
 100b  National Semiconductor Corporation
 	0001  DP83810
-	0002  87415
+	0002  87415/87560 IDE
+	000e  87560 Legacy I/O
 	000f  OHCI Compliant FireWire Controller
 	0011  National PCI System I/O
 	0012  USB Controller
-	d001  87410
+	d001  87410 IDE
 100c  Tseng Labs Inc
 	3202  ET4000/W32p rev A
 	3205  ET4000/W32p rev B
diff -urN linux-2.4.0-test1/include/linux/pci_ids.h linux-ggg/include/linux/pci_ids.h
--- linux-2.4.0-test1/include/linux/pci_ids.h	Wed May 24 08:29:47 2000
+++ linux-ggg/include/linux/pci_ids.h	Fri May 26 14:09:57 2000
@@ -190,6 +190,8 @@
 
 #define PCI_VENDOR_ID_NS		0x100b
 #define PCI_DEVICE_ID_NS_87415		0x0002
+#define PCI_DEVICE_ID_NS_87560_LIO      0x000e
+#define PCI_DEVICE_ID_NS_87560_USB      0x0012
 #define PCI_DEVICE_ID_NS_87410		0xd001
 
 #define PCI_VENDOR_ID_TSENG		0x100c
