Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9A0A482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 21:39:37 -0600 (MDT)
Date: Mon, 11 Aug 2003 20:42:44 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030812034244.GC21328@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] removing warnings from math-emu code
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

Would anyone mind if i committed this to cvs? (2.6 only) It
removes/hides all the warnings from the math-emu directory, since we
don't plan to fix them... 

Index: arch/parisc/math-emu/Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/math-emu/Makefile,v
retrieving revision 1.1
diff -u -p -r1.1 Makefile
--- arch/parisc/math-emu/Makefile	29 Jul 2003 17:00:42 -0000	1.1
+++ arch/parisc/math-emu/Makefile	12 Aug 2003 03:38:58 -0000
@@ -2,6 +2,11 @@
 # Makefile for the linux/parisc floating point code
 #
 
+# See arch/parisc/math-emu/README
+CFLAGS += -Wno-parentheses -Wno-implicit-function-declaration \
+	-Wno-uninitialized -Wno-strict-prototypes -Wno-return-type \
+	-Wno-implicit-int
+
 obj-y	 := frnd.o driver.o decode_exc.o fpudispatch.o denormal.o \
 		dfmpy.o sfmpy.o sfsqrt.o dfsqrt.o dfadd.o fmpyfadd.o \
 		sfadd.o dfsub.o sfsub.o fcnvfxt.o fcnvff.o fcnvxf.o \
Index: arch/parisc/math-emu/types.h
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/math-emu/types.h,v
retrieving revision 1.1
diff -u -p -r1.1 types.h
--- arch/parisc/math-emu/types.h	29 Jul 2003 17:00:42 -0000	1.1
+++ arch/parisc/math-emu/types.h	12 Aug 2003 03:38:58 -0000
@@ -20,6 +20,7 @@
  */
 
 #include <linux/kernel.h>
+#undef BUG
 #define BUG() do { \
         printk(KERN_ERR "floating-pt emulation BUG at %s:%d!\n", __FILE__, __LINE__); \
 } while (0)

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
