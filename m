Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93045482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 14:13:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14nQzh-0000zd-00
	for parisc-linux@parisc-linux.org; Wed, 11 Apr 2001 21:13:37 +0100
Date: Wed, 11 Apr 2001 21:13:37 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] FB cleanups
List-ID: <linux-parisc.vger.kernel.org>

I'd like someone to test these out for me -- they compile but I'm monitorless
here.

 * Turn gsc_read/write[bwl] calls into read/write[bwl]
 * Remove unused functions memcpy_tohp, memcopy_fromhp from fbcon-sti.c
 * Delete gsc_memset_io()
 * Teach <video/fbcon.h> to use memset_io instead.
 * Make <video/fbcon.h> use read/write[bwl] instead of direct accesses
   unless the architecture specifies otherwise.

Index: drivers/video/fbcon-sti.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/video/fbcon-sti.c,v
retrieving revision 1.5
diff -u -p -r1.5 fbcon-sti.c
--- fbcon-sti.c	2001/03/02 00:54:55	1.5
+++ fbcon-sti.c	2001/04/11 19:59:13
@@ -70,40 +70,14 @@ memcpy_fromhp_tohp(void *dest, void *src
 	count += 3;
 	count &= ~3; /* XXX */
 
-	while(count) {
-		count --;
-		gsc_writel(~gsc_readl(s), d);
+	while (count--) {
+		writel(~readl(s), d);
 		d += 32*4;
 		s += 32*4;
 	}
 }
 
 static void
-memcpy_tohp(void *dest, void *src, int count)
-{
-	unsigned long d = (unsigned long) dest;
-	u32 *s = (u32 *)src;
-
-	count += 3;
-	count &= ~3; /* XXX */
-
-	d = ram2log(dest);
-
-	while(count) {
-		count--;
-		gsc_writel(*s++, d);
-		d += 32*4;
-	}
-}
-
-static void
-memcopy_fromhp(void *dest, void *src, int count)
-{
-	/* FIXME */
-	printk("uhm ...\n");
-}
-
-static void
 memset_tohp(void *dest, u32 word, int count)
 {
 	unsigned long d = ram2log(dest);
@@ -111,9 +85,8 @@ memset_tohp(void *dest, u32 word, int co
 	count += 3;
 	count &= ~3;
 
-	while(count) {
-		count--;
-		gsc_writel(word, d);
+	while (count--) {
+		writel(word, d);
 		d += 32;
 	}
 }
@@ -123,7 +96,7 @@ readb_hp(void *src)
 {
 	unsigned long s = ram2log(src);
 
-	return ~gsc_readb(s);
+	return ~readb(s);
 }
 
 static void
@@ -137,7 +110,7 @@ writeb_hp(u8 b, void *dst)
 		return;
 	}
 
-	gsc_writeb(b, d);
+	writeb(b, d);
 }
 
 static void
Index: include/asm-parisc/gsc.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/gsc.h,v
retrieving revision 1.9
diff -u -p -r1.9 gsc.h
--- gsc.h	2001/03/02 00:09:47	1.9
+++ gsc.h	2001/04/11 19:59:15
@@ -32,14 +32,6 @@ extern void _gsc_writeq(u64,void *);
 #define gsc_writel(v,a)	_gsc_writel((v),(void *)(a))
 #define gsc_writeq(v,a)	_gsc_writeq((v),(void *)(a))
 
-static __inline__ void *gsc_memset_io(void *s, int c, size_t n)
-{
-	while (n--) {
-		gsc_writeb(c,s++);
-	}
-	return NULL;
-}
-
 struct gsc_dev {
 	struct gsc_bus	*bus;		/* bus this device is on */
 	struct gsc_dev	*next;		/* chain of all devices */
Index: include/video/fbcon.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/video/fbcon.h,v
retrieving revision 1.6
diff -u -p -r1.6 fbcon.h
--- fbcon.h	2001/03/02 00:16:36	1.6
+++ fbcon.h	2001/04/11 19:59:52
@@ -206,16 +206,6 @@ extern int set_all_vcs(int fbidx, struct
 #define fb_writel sbus_writel
 #define fb_memset sbus_memset_io
 
-#elif defined(__hppa__)
-
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
@@ -228,13 +218,13 @@ extern int set_all_vcs(int fbidx, struct
 
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
