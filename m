From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: [parisc-linux] Get your Matrox PCI cards out of the basement ...
Date: Thu, 3 Jun 2004 00:17:34 +0200
Message-ID: <20040602221734.GA26176@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

....I got the matroxfb driver working on my B2600 including X on top
of fbdev (the mga driver doesn't work yet). So far I just used
a very old Matrox Millenium I. Below is the necessary patch for
2.6.7-rc1.

Have fun,
Thomas.


Index: matroxfb_base.h
===================================================================
RCS file: /home/cvs/parisc/linux-2.6/drivers/video/matrox/matroxfb_base.h,v
retrieving revision 1.3
diff -u -p -r1.3 matroxfb_base.h
--- matroxfb_base.h	18 Oct 2003 00:23:18 -0000	1.3
+++ matroxfb_base.h	2 Jun 2004 21:18:34 -0000
@@ -99,7 +99,7 @@
 #endif
 #endif
 
-#if defined(__alpha__) || defined(__mc68000__)
+#if defined(__alpha__) || defined(__mc68000__) || defined(__hppa__)
 #define READx_WORKS
 #define MEMCPYTOIO_WORKS
 #else
@@ -165,27 +165,27 @@ typedef struct {
 
 #ifdef READx_WORKS
 static inline unsigned int mga_readb(vaddr_t va, unsigned int offs) {
-	return readb(va.vaddr + offs);
+	return fb_readb(va.vaddr + offs);
 }
 
 static inline unsigned int mga_readw(vaddr_t va, unsigned int offs) {
-	return readw(va.vaddr + offs);
+	return fb_readw(va.vaddr + offs);
 }
 
 static inline u_int32_t mga_readl(vaddr_t va, unsigned int offs) {
-	return readl(va.vaddr + offs);
+	return fb_readl(va.vaddr + offs);
 }
 
 static inline void mga_writeb(vaddr_t va, unsigned int offs, u_int8_t value) {
-	writeb(value, va.vaddr + offs);
+	fb_writeb(value, va.vaddr + offs);
 }
 
 static inline void mga_writew(vaddr_t va, unsigned int offs, u_int16_t value) {
-	writew(value, va.vaddr + offs);
+	fb_writew(value, va.vaddr + offs);
 }
 
 static inline void mga_writel(vaddr_t va, unsigned int offs, u_int32_t value) {
-	writel(value, va.vaddr + offs);
+	fb_writel(value, va.vaddr + offs);
 }
 #else
 static inline unsigned int mga_readb(vaddr_t va, unsigned int offs) {


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
