Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smallone.fc.hp.com (smallone.fc.hp.com [192.25.206.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6991B484B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Aug 2003 10:25:35 -0600 (MDT)
Date: Fri, 1 Aug 2003 10:22:55 -0600
To: parisc-linux@lists.parisc-linux.org
Cc: lamont@hp.com
Message-ID: <20030801162255.GA28998@smallone.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: lamont@smallone.fc.hp.com (LaMont Jones)
Subject: [parisc-linux] __arch__swab24()
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

The following patch implements __arch__swab24() optimally for hppa.

It also has the side effect of making some other things happier. :-)

Any comments before I commit it to 2.4 and 2.5?

lamont

Index: include/asm-parisc/byteorder.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/byteorder.h,v
retrieving revision 1.7
diff -u -r1.7 byteorder.h
--- include/asm-parisc/byteorder.h	8 Jul 2003 16:50:09 -0000	1.7
+++ include/asm-parisc/byteorder.h	1 Aug 2003 16:25:00 -0000
@@ -14,6 +14,17 @@
 	return x;
 }
 
+static __inline__ __const__ __u32 ___arch__swab24(__u32 x)
+{
+	unsigned int temp;
+	__asm__("shd %0, %0, 8, %1\n\t"		/* shift xabcxabc -> cxab */
+		"dep %1, 15, 8, %1\n\t"		/* deposit cxab -> cbab */
+		"shd %r0, %1, 8, %0"		/* shift 0000cbab -> 0cba */
+		: "=r" (x), "=&r" (temp)
+		: "0" (x));
+	return x;
+}
+
 static __inline__ __const__ __u32 ___arch__swab32(__u32 x)
 {
 	unsigned int temp;
@@ -63,6 +74,7 @@
 #endif
 
 #define __arch__swab16(x) ___arch__swab16(x)
+#define __arch__swab24(x) ___arch__swab24(x)
 #define __arch__swab32(x) ___arch__swab32(x)
 
 #endif /* __GNUC__ */
