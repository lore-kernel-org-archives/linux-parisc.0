Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF20D4840
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  4 Feb 2004 00:22:26 -0700 (MST)
Date: Wed, 4 Feb 2004 01:43:59 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040204094358.GL959@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] memory mapping and sort_extable?
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

pa, 

2.6.2-rc2 doesn't boot on my c3k when running 32-bit kernel and if
CONFIG_STI_CONSOLE is not enabled. The problem seems to be that for some
reason [*] when CONFIG_STI_CONSOLE is not defined, we map all kernel
memory as r/o, so when sort_extable (in lib/extable.c) tries to
rearrange our exception tables it writes to the kernel pages and faults.

interestingly, when building a 64-bit kernel with similar config options
i don't see a fault... maybe there is something else happening there.

 From a cursory inspection, it appears that we never use to sort our
exception tables; dumping the extable from a vmlinux binary shows that
the entries are properly sorted at link time... but i haven't tried 
this on modules to see if they are also sorted. Not sure how the 
sorting is happening...  does ld do it?

Anyway, the following patch trivially removes sort_extable for parisc
and lets the kernel boot. Not yet sure if it's correct. Does anyone
know?

[*] Why do we map kernel pages as read-only? is it just to be "extra
safe"?

randolph

Index: include/asm-parisc/uaccess.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/uaccess.h,v
retrieving revision 1.12
diff -u -p -r1.12 uaccess.h
--- include/asm-parisc/uaccess.h	28 Jan 2004 05:27:46 -0000	1.12
+++ include/asm-parisc/uaccess.h	4 Feb 2004 07:16:54 -0000
@@ -66,6 +66,8 @@ struct exception_table_entry {
 	long skip;           /* pcoq skip | r9 clear flag | r8 -EFAULT flag */
 };
 
+#define ARCH_HAS_SORT_EXTABLE
+
 #define __get_user(x,ptr)                               \
 ({                                                      \
 	register long __gu_err __asm__ ("r8") = 0;      \
--- arch/parisc/mm/extable.c	2003-09-24 03:11:46.000000000 -0700
+++ arch/parisc/mm/extable.c	2004-02-03 22:58:41.000000000 -0800
@@ -0,0 +1,7 @@
+#include <asm/uaccess.h>
+
+void sort_extable(struct exception_table_entry *start,
+		  struct exception_table_entry *finish)
+{
+}
+
Index: arch/parisc/mm/Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/Makefile,v
retrieving revision 1.2
diff -u -p -r1.2 Makefile
--- arch/parisc/mm/Makefile	27 Jan 2004 18:44:34 -0000	1.2
+++ arch/parisc/mm/Makefile	4 Feb 2004 07:17:20 -0000
@@ -2,4 +2,4 @@
 # Makefile for arch/parisc/mm
 #
 
-obj-y	 := init.o fault.o ioremap.o
+obj-y	 := init.o fault.o ioremap.o extable.o

-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
