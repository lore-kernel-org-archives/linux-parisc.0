Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 854E5482A
	for <parisc-linux@parisc-linux.org>; Fri, 17 Aug 2001 01:11:39 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel7.hp.com (Postfix) with ESMTP id 0D0A01F64E
	for <parisc-linux@parisc-linux.org>; Fri, 17 Aug 2001 03:10:29 -0400 (EDT)
Received: from chrysl (chrysl.fc.hp.com [15.1.54.200])
	by ldl.fc.hp.com (Postfix) with ESMTP id 8B0B24248
	for <parisc-linux@parisc-linux.org>; Fri, 17 Aug 2001 01:11:38 -0600 (MDT)
Received: from willy by chrysl with local (Exim 3.12 #1 (Debian))
	id 15Xdn8-0000kt-00
	for <parisc-linux@parisc-linux.org>; Fri, 17 Aug 2001 01:11:38 -0600
To: parisc-linux@parisc-linux.org
Message-Id: <E15Xdn8-0000kt-00@chrysl>
From: Matthew Wilcox <willy@ldl.fc.hp.com>
Date: Fri, 17 Aug 2001 01:11:38 -0600
Subject: [parisc-linux] Turn off CONFIG_PCI
List-ID: <linux-parisc.vger.kernel.org>

A number of people have been asking for the ability to turn off CONFIG_PCI,
and while I was reviewing the outstanding diff vs 2.4.9, I noticed I could
take out some of the patch if I just made some slight alterations.  Please
test this patch; it compiles for me.

Index: drivers/char/serial.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/char/serial.c,v
retrieving revision 1.25
diff -u -p -r1.25 serial.c
--- serial.c	2001/08/17 06:10:06	1.25
+++ serial.c	2001/08/17 07:06:02
@@ -414,11 +414,7 @@ static _INLINE_ unsigned int serial_in(s
 		return readb((unsigned long) info->iomem_base +
 			     (offset<<info->iomem_reg_shift));
 	default:
-#if defined(CONFIG_PCI) || defined(CONFIG_ISA)
 		return inb(info->port + offset);
-#else
-		BUG();
-#endif
 	}
 }
 
@@ -437,11 +433,7 @@ static _INLINE_ void serial_out(struct a
 			      (offset<<info->iomem_reg_shift));
 		break;
 	default:
-#if defined(CONFIG_PCI) || defined(CONFIG_ISA)
 		outb(value, info->port+offset);
-#else
-		BUG();
-#endif
 	}
 }
 
Index: include/asm-parisc/io.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/io.h,v
retrieving revision 1.22
diff -u -p -r1.22 io.h
--- io.h	2001/07/15 22:30:29	1.22
+++ io.h	2001/08/17 07:06:03
@@ -43,9 +43,6 @@
 #endif /* USE_HPPA_IOREMAP */
 
 #if defined(CONFIG_PCI) || defined(CONFIG_ISA)
-/*
- *	So we get clear link errors 
- */
 extern unsigned char inb(unsigned long addr);
 extern unsigned short inw(unsigned long addr);
 extern unsigned int inl(unsigned long addr);
@@ -53,7 +50,28 @@ extern unsigned int inl(unsigned long ad
 extern void outb(unsigned char b, unsigned long addr);
 extern void outw(unsigned short b, unsigned long addr);
 extern void outl(unsigned int b, unsigned long addr);
+#else
+static inline char inb(unsigned long addr)
+{
+	BUG();
+	return -1;
+}
 
+static inline short inw(unsigned long addr)
+{
+	BUG();
+	return -1;
+}
+
+static inline int inl(unsigned long addr)
+{
+	BUG();
+	return -1;
+}
+
+#define outb(x, y)	BUG()
+#define outw(x, y)	BUG()
+#define outl(x, y)	BUG()
 #endif
 
 extern void memcpy_fromio(void *dest, unsigned long src, int count);
