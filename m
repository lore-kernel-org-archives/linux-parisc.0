Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4EFC8482D
	for <parisc-linux@parisc-linux.org>; Mon, 18 Jun 2001 13:06:37 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15C4M7-0007Xz-00
	for parisc-linux@parisc-linux.org; Mon, 18 Jun 2001 20:06:35 +0100
Date: Mon, 18 Jun 2001 20:06:35 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010618200635.P10186@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] fbcon diff
List-ID: <linux-parisc.vger.kernel.org>

IMO, fbcon.h should look more like this:

Index: include/video/fbcon.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/video/fbcon.h,v
retrieving revision 1.7
diff -u -p -r1.7 fbcon.h
--- fbcon.h	2001/06/17 22:27:04	1.7
+++ fbcon.h	2001/06/18 19:05:09
@@ -205,19 +205,6 @@ extern int set_all_vcs(int fbidx, struct
 #define fb_writel sbus_writel
 #define fb_memset sbus_memset_io
 
-#elif defined(__hppa__) && !(USE_HPPA_IOREMAP)
-
-/* When we switch to ioremap() usage the following defines will
- * be removed and we'll use the arch-independend generic 
- * functions below instead. */
-#define fb_readb gsc_readb
-#define fb_readw gsc_readw
-#define fb_readl gsc_readl
-#define fb_writeb gsc_writeb
-#define fb_writew gsc_writew
-#define fb_writel gsc_writel
-#define fb_memset gsc_memset_io
-	
 #elif defined(__i386__) || defined(__alpha__)
 
 #define fb_readb __raw_readb
@@ -230,13 +217,13 @@ extern int set_all_vcs(int fbidx, struct
 
 #else
 
-#define fb_readb(addr) (*(volatile u8 *) (addr))
-#define fb_readw(addr) (*(volatile u16 *) (addr))
-#define fb_readl(addr) (*(volatile u32 *) (addr))
-#define fb_writeb(b,addr) (*(volatile u8 *) (addr) = (b))
-#define fb_writew(b,addr) (*(volatile u16 *) (addr) = (b))
-#define fb_writel(b,addr) (*(volatile u32 *) (addr) = (b))
-#define fb_memset memset
+#define fb_readb(addr) readb(addr)
+#define fb_readw(addr) readw(addr) 
+#define fb_readl(addr) readl(addr) 
+#define fb_writeb(b,addr) writeb(b,addr) 
+#define fb_writew(b,addr) writew(b,addr) 
+#define fb_writel(b,addr) writel(b,addr) 
+#define fb_memset(addr, c, len) memset_io((unsigned long)addr, c, len)
 
 #endif
 

-- 
Revolutions do not require corporate support.
