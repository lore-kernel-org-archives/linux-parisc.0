Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 695B7482C
	for <parisc-linux@parisc-linux.org>; Sat, 17 Nov 2001 00:49:14 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id wzjajaaa for parisc-linux@parisc-linux.org; Sat, 17 Nov 2001 00:44:13 -0700
Date: Fri, 16 Nov 2001 23:48:59 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011116234859.U391@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] more on pci mmio swapping
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

The story so far...

1. pci is mostly little-endian
2. most of the other linux big-endian architectures define the 16-bit/32-bit 
read/write operations to do cpu_to_le byte swapping
3. parisc (and s390) do not currently do this

I've looked at the part in the Dino ERS again that willy pointed out. As
far as I can tell it's not talking about byte swapping but more about
address invariance. In fact the ERS specifically says that if the host
is running in BE mode, the driver is responsible for byte swapping.

I've looked at a sample of pci drivers that we are using for parisc
right now. In the case of the sym53c8xx driver, there is hppa specific
code to do cpu_to_le translation before doing writes.

So, given these things, I'm inclined to say that our current
implementation is not correct. Grant concurs, though it'd be great to
have folks like Alan (Cox) confirm this :)

The attached patch is my proposed changes. I've tested it on a c3000
with tulip/sym53c8xx and it works. I've done some digging into other
common drivers to see if anything else will break. So far I haven't come
up with anything, but Grant thinks acenic may break....

with this patch, the usb controller on suckyio is being detected
correctly (at least more correctly than before), though it's still 
not quite working yet.

comments on this are most welcome. I hope to check this in some time
next week.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^


Index: arch/parisc/lib/io.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/lib/io.c,v
retrieving revision 1.6
diff -u -r1.6 io.c
--- arch/parisc/lib/io.c	2001/11/07 23:51:31	1.6
+++ arch/parisc/lib/io.c	2001/11/15 08:00:31
@@ -24,7 +24,7 @@
 		count--;
 	}
 	while (count > 3) {
-		writel(*(u32 *)src, dest);
+		__raw_writel(*(u32 *)src, dest);
 		(unsigned long) src += 4;
 		dest += 4;
 		count -= 4;
@@ -68,14 +68,14 @@
 	}
 
 	if (src & 2) {
-		*(u16 *)dest = readw(src);
+		*(u16 *)dest = __raw_readw(src);
 		((u16 *)src)++;
 		((u16 *)dest)++;
 		count-=2;
 	}
 
 	while (count > 3) {
-		*(u32 *)dest = readl(src);
+		*(u32 *)dest = __raw_readl(src);
 		dest += 4;
 		src += 4;
 		count -= 4;
@@ -83,7 +83,7 @@
 
  shortcopy:
 	while (count > 1) {
-		*(u16 *)dest = readw(src);
+		*(u16 *)dest = __raw_readw(src);
 		((u16 *)src)++;
 		((u16 *)dest)++;
 		count-=2;
@@ -109,7 +109,7 @@
 		count--;
 	}
 	while (count > 3) {
-		writel(fill32, dest);
+		__raw_writel(fill32, dest);
 		dest += 4;
 		count -= 4;
 	}
Index: drivers/scsi/sym53c8xx_defs.h
===================================================================
RCS file: /var/cvs/linux/drivers/scsi/sym53c8xx_defs.h,v
retrieving revision 1.11
diff -u -r1.11 sym53c8xx_defs.h
--- drivers/scsi/sym53c8xx_defs.h	2001/08/01 15:26:34	1.11
+++ drivers/scsi/sym53c8xx_defs.h	2001/11/15 08:00:35
@@ -406,11 +406,11 @@
 #define	readb_raw	readb
 #define	writeb_raw	writeb
 
-#if defined(__hppa__) && !defined(SCSI_NCR_BIG_ENDIAN)
-#define	readw_l2b(a)	le16_to_cpu(readw(a))
-#define	readl_l2b(a)	le32_to_cpu(readl(a))
-#define	writew_b2l(v,a)	writew(cpu_to_le16(v),a)
-#define	writel_b2l(v,a)	writel(cpu_to_le32(v),a)
+#if defined(SCSI_NCR_BIG_ENDIAN)
+#define	readw_l2b	__raw_readw
+#define	readl_l2b	__raw_readl
+#define	writew_b2l	__raw_writew
+#define	writel_b2l	__raw_writel
 #else	/* Other bid-endian */
 #define	readw_l2b	readw
 #define	readl_l2b	readl
Index: include/asm-parisc/io.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/io.h,v
retrieving revision 1.25
diff -u -r1.25 io.h
--- include/asm-parisc/io.h	2001/11/03 23:06:00	1.25
+++ include/asm-parisc/io.h	2001/11/15 08:00:36
@@ -147,11 +147,11 @@
 #define writel(b,addr) (*(volatile unsigned int *) (addr) = (b))
 #else /* !USE_HPPA_IOREMAP */
 #define readb(addr) __raw_readb((unsigned long)addr)
-#define readw(addr) __raw_readw((unsigned long)addr)
-#define readl(addr) __raw_readl((unsigned long)addr)
+#define readw(addr) le16_to_cpu(__raw_readw((unsigned long)addr))
+#define readl(addr) le32_to_cpu(__raw_readl((unsigned long)addr))
 #define writeb(b,addr) __raw_writeb(b,(unsigned long)addr)
-#define writew(b,addr) __raw_writew(b,(unsigned long)addr)
-#define writel(b,addr) __raw_writel(b,(unsigned long)addr)
+#define writew(b,addr) __raw_writew(cpu_to_le16(b),(unsigned long)addr)
+#define writel(b,addr) __raw_writel(cpu_to_le32(b),(unsigned long)addr)
 #endif /* !USE_HPPA_IOREMAP */
 
 extern void memcpy_fromio(void *dest, unsigned long src, int count);
