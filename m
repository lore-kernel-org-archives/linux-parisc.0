Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id E41544A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Mar 2001 21:55:30 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA07214;
	Wed, 21 Mar 2001 15:53:19 +1100
Date: Wed, 21 Mar 2001 15:53:19 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: randolph@tausq.org, "Paul J.Y. Lahaie" <plahaie@linuxcare.com>,
	Richard Hirst <rhirst@linuxcare.com>,
	Jane Vinet <jvinet@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0103211157130.25567-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103211547370.25567-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: c++ problem
List-ID: <linux-parisc.vger.kernel.org>

A cure!

	* sysdeps/hppa/dl-machine.h (RTLD_START): Set up dp with DT_PLTGOT
	value from application so that constructors in non-PIC libs work.

Alan Modra
-- 
Linuxcare

Index: sysdeps/hppa/dl-machine.h
===================================================================
RCS file: /home/cvs/parisc/glibc/sysdeps/hppa/dl-machine.h,v
retrieving revision 1.39
diff -u -p -r1.39 dl-machine.h
--- dl-machine.h	2000/12/13 20:12:42	1.39
+++ dl-machine.h	2001/03/21 04:36:15
@@ -255,7 +255,17 @@ elf_machine_runtime_setup (struct link_m
    The C function `_dl_start' is the real entry point;
    its return value is the user program's entry point.  */
 
-#define RTLD_START asm ("\
+#define RTLD_START \
+/* Set up dp for any static lib constructors that may be called. */	\
+static struct link_map * set_dp (struct link_map *map)		\
+{								\
+  register Elf32_Addr dp asm ("%r27");				\
+  dp = D_PTR (map, l_info[DT_PLTGOT]);				\
+  asm volatile ("" : : "r" (dp));				\
+  return map;							\
+}								\
+								\
+asm ("\
 	.text
 	.globl _start
 	.type _start,@function
@@ -331,7 +341,6 @@ _start:
 	bl	_dl_start,%rp
 	ldo	-4(%r24),%r26
 
-	/* FALLTHRU */
 	.globl _dl_start_user
 	.type _dl_start_user,@function
 _dl_start_user:
@@ -359,10 +368,14 @@ _dl_start_user:
 	stw	%r24,-44(%sp)
 
 .Lnofix:
-	/* Call _dl_init(_dl_loaded, argc, argv, envp). */
 	addil	LT'_dl_loaded,%r19
 	ldw	RT'_dl_loaded(%r1),%r26
+	bl	set_dp, %r2
 	ldw	0(%r26),%r26
+
+	/* Call _dl_init(_dl_loaded, argc, argv, envp). */
+	copy	%r28,%r26
+
 	/* envp = argv + argc + 1 */
 	sh2add	%r25,%r24,%r23
 	bl	_dl_init,%r2
@@ -389,7 +402,9 @@ __dl_fini_plabel:
 	stw	%r19,4(%r23)
 	ldw	4(%r3),%r19	/* load the object's gp */
 	bv	%r0(%r2)
-	depi	2,31,2,%r23	/* delay slot */");
+	depi	2,31,2,%r23	/* delay slot */
+");
+
 
 /* This code gets called via the .plt stub, and is used in
    dl-runtime.c to call the `fixup' function and then redirect to the
