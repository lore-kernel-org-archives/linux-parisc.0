Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 454F7482E
	for <parisc-linux@parisc-linux.org>; Sun, 17 Nov 2002 09:13:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18DS2y-0003CF-00; Sun, 17 Nov 2002 16:13:20 +0000
Date: Sun, 17 Nov 2002 16:13:19 +0000
From: Matthew Wilcox <willy@debian.org>
To: Daniel Engstrom <5116@telia.com>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20021117161319.B7530@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [chris@qwirx.com: eisa_eeprom.c misc_register patch]
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

Daniel, I presume you're interested in maintaining this code?

----- Forwarded message from Chris Wilson <chris@qwirx.com> -----

Envelope-to: willy@ftp.uk.linux.org
Delivery-date: Sun, 17 Nov 2002 15:53:19 +0000
Date: Sun, 17 Nov 2002 15:53:16 +0000 (GMT)
From: Chris Wilson <chris@qwirx.com>
X-X-Sender: chris@top.qwarx.com
To: Matthew Wilcox <willy@debian.org>,
   Linux Kernel Janitors <kernel-janitor-discuss@lists.sourceforge.net>
cc: Trivial Patch Monkey <trivial@rustcorp.com.au>
Subject: eisa_eeprom.c misc_register patch

Dear Sirs,

As part of my work on the Linux Kernel Janitors project, cleaning up on 
functions which call misc_register and don't check for an error return, I 
would like to submit my patch to drivers/parisc/eisa_eeprom.c. 

This patch simply causes the function to printk() an error and return the
error code from misc_register() if it fails. I hope this is the right
thing to do. It also changes the code layout (but not function) slightly,
and flags a condition that I'm not sure about: If no address is supplied
to its initialisation function, should it really return with no error,
despite the fact that it hasn't done anything useful?

Cheers, Chris.
-- 
_ ___ __     _
 / __/ / ,__(_)_  | Chris Wilson <0000 at qwirx.com> - Cambs UK |
/ (_/ ,\/ _/ /_ \ | Security/C/C++/Java/Perl/SQL/HTML Developer |
\ _/_/_/_//_/___/ | We are GNU-free your mind-and your software |


diff -ru8 linux-2.5.47/drivers/parisc/eisa_eeprom.c linux-2.5.47-chris/drivers/parisc/eisa_eeprom.c
--- linux-2.5.47/drivers/parisc/eisa_eeprom.c	Mon Nov 11 03:28:29 2002
+++ linux-2.5.47-chris/drivers/parisc/eisa_eeprom.c	Sun Nov 17 15:42:30 2002
@@ -91,17 +91,27 @@
 {
 	EISA_EEPROM_MINOR,
 	"eisa eeprom",
 	&eisa_eeprom_fops
 };
 
 int __init eisa_eeprom_init(unsigned long addr)
 {
-	if (addr) {
-		eeprom_addr = addr;
-		misc_register(&eisa_eeprom_dev);
-		printk(KERN_INFO "EISA EEPROM at 0x%lx\n", eeprom_addr);
+	int retval;
+
+	/* XXX why return success when we haven't done anything? */
+	if (!addr)
+		return 0;
+
+	eeprom_addr = addr;
+
+	retval = misc_register(&eisa_eeprom_dev);
+	if (retval < 0) {
+		printk(KERN_ERR "EISA EEPROM: cannot register misc device.\n");
+		return retval;
 	}
+
+	printk(KERN_INFO "EISA EEPROM at 0x%lx\n", eeprom_addr);
 	return 0;
 }
 
 MODULE_LICENSE("GPL");


----- End forwarded message -----

-- 
Revolutions do not require corporate support.
