Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smallone.fc.hp.com (smallone.fc.hp.com [192.25.206.249])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F30F482B
	for <parisc-linux@parisc-linux.org>; Tue,  8 Jul 2003 11:06:31 -0600 (MDT)
Date: Tue, 8 Jul 2003 11:03:59 -0600
To: parisc-linux@parisc-linux.org
Cc: lamont@hp.com, bdale@gag.com
Message-ID: <20030708170359.GA26021@smallone.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: lamont@smallone.fc.hp.com (LaMont Jones)
Subject: [parisc-linux] byteorder.h patch
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

I guess I should have sent mail...

byteorder.h would try to use __u64 when it wasn't defined (__STRICT_ANSI__).
This is fixed in revision 1.7 of include/asm-parisc/byteorder.h.

lamont

Index: include/asm-parisc/byteorder.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/byteorder.h,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -r1.6 -r1.7
--- include/asm-parisc/byteorder.h	8 Jul 2003 02:22:59 -0000	1.6
+++ include/asm-parisc/byteorder.h	8 Jul 2003 16:50:09 -0000	1.7
@@ -48,7 +48,8 @@
 	return x;
 }
 #define __arch__swab64(x) ___arch__swab64(x)
-#else
+#define __BYTEORDER_HAS_U64__
+#elif !defined(__STRICT_ANSI__)
 static __inline__ __const__ __u64 ___arch__swab64(__u64 x)
 {
 	__u32 t1 = (__u32) x;
@@ -57,12 +58,12 @@
 	___arch__swab32(t2);
 	return (((__u64) ___arch__swab32(t1) << 32) + ((__u64) ___arch__swab32(t2)));
 }
+#define __arch__swab64(x) ___arch__swab64(x)
+#define __BYTEORDER_HAS_U64__
 #endif
 
 #define __arch__swab16(x) ___arch__swab16(x)
 #define __arch__swab32(x) ___arch__swab32(x)
-#define __arch__swab64(x) ___arch__swab64(x)
-#define __BYTEORDER_HAS_U64__
 
 #endif /* __GNUC__ */
 
