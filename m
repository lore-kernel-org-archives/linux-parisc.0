Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9EAB482A
	for <parisc-linux@parisc-linux.org>; Wed, 18 Apr 2001 17:26:33 -0600 (MDT)
Date: Wed, 18 Apr 2001 17:26:28 -0600
To: wakkerma@debian.org
Cc: parisc-linux@parisc-linux.org
Message-ID: <20010418172628.C4217@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] strace updates
List-ID: <linux-parisc.vger.kernel.org>

This patch adds some new syscalls to the HPPA list, it's against the current
sourceforge version.  Some of the lists seem to have bugs... some examples:

linux/mips/syscallent.h:        { 2,    TF,     printargs,              "stat64"}, /* 4213 */
that is sys_stat64 in other arches, not printargs

sys_truncate64 & sys_ftruncate64 actually take 3 arguments not 2 (problem
in all architectures)

linux/mips/syscallent.h:        { 3,    0,      printargs,              "fcntl64"       }, /* 4220 */
all other arches tag this as TF, not 0.

most of the entries for sys_fcntl64 just do printargs, but it's identical
to sys_fcntl.

i can't see how to build this from the sourceforge CVS -- i run autoconf
but config.h.in is not found.  probably because it's part of .cvsignore.

Index: syscallent.h
===================================================================
RCS file: /cvsroot/strace/strace/linux/hppa/syscallent.h,v
retrieving revision 1.1
diff -u -p -r1.1 syscallent.h
--- linux/hppa/syscallent.h	2001/03/27 12:17:17	1.1
+++ linux/hppa/syscallent.h	2001/04/18 22:06:40
@@ -1,31 +1,5 @@
 /*
- * Copyright (c) 1993 Branko Lankester <branko@hacktic.nl>
- * Copyright (c) 1993, 1994, 1995 Rick Sladkey <jrs@world.std.com>
- * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. The name of the author may not be used to endorse or promote products
- *    derived from this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
- * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
- * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
- * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
- * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
- * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- *	$Id: syscallent.h,v 1.1 2001/03/27 12:17:17 wichert Exp $
+ * Copyright (c) 2001 Hewlett-Packard, Matthew Wilcox
  */
 
 	{ 5,	0,	printargs,		"SYS_0"			}, /* 0 */
@@ -117,7 +91,7 @@
 	{ 1,	0,	sys_uselib,		"uselib"		}, /* 86 */
 	{ 1,	0,	sys_swapon,		"swapon"		}, /* 87 */
 	{ 3,	0,	sys_reboot,		"reboot"		}, /* 88 */
-	{ 3,	0,	sys_readdir,		"old_readdir"		}, /* 89 */
+	{ 6,	0,	sys_mmap,		"mmap2"			}, /* 89 */
 	{ 6,	0,	sys_mmap,		"mmap"			}, /* 90 */
 	{ 2,	0,	sys_munmap,		"munmap"		}, /* 91 */
 	{ 2,	TF,	sys_truncate,		"truncate"		}, /* 92 */
@@ -129,8 +103,8 @@
 	{ 4,	TN,	sys_recv,		"recv"			}, /* 98 */
 	{ 2,	TF,	sys_statfs,		"statfs"		}, /* 99 */
 	{ 2,	0,	sys_fstatfs,		"fstatfs"		}, /* 100 */
-	{ 3,	0,	sys_ioperm,		"ioperm"		}, /* 101 */
-	{ 5,	0,	sys_socketcall,		"socketcall"		}, /* 102 */
+	{ 2,	TF,	sys_stat64,		"stat64"		}, /* 101 */
+	{ 5,	0,	printargs,		"SYS_102"		}, /* 102 */
 	{ 3,	0,	sys_syslog,		"syslog"		}, /* 103 */
 	{ 3,	0,	sys_setitimer,		"setitimer"		}, /* 104 */
 	{ 2,	0,	sys_getitimer,		"getitimer"		}, /* 105 */
@@ -140,7 +114,7 @@
 	{ 5,	TF,	sys_pwrite,		"pwrite"		}, /* 109 */
 	{ 2,	0,	sys_getcwd,		"getcwd"		}, /* 110 */
 	{ 0,	0,	sys_vhangup,		"vhangup"		}, /* 111 */
-	{ 0,	0,	sys_idle,		"idle"			}, /* 112 */
+	{ 2,	TF,	sys_fstat64,		"fstat64"		}, /* 112 */
 	{ 0,	0,	sys_vfork,		"vfork"			}, /* 113 */
 	{ 4,	TP,	sys_wait4,		"wait4"			}, /* 114 */
 	{ 1,	0,	sys_swapoff,		"swapoff"		}, /* 115 */
@@ -227,11 +201,11 @@
 
 	{ 5,	0,	printargs,		"SYS_196"		}, /* 196 */
 	{ 5,	0,	printargs,		"SYS_197"		}, /* 197 */
-	{ 5,	0,	printargs,		"SYS_198"		}, /* 198 */
-	{ 5,	0,	printargs,		"SYS_199"		}, /* 199 */
-	{ 5,	0,	printargs,		"SYS_200"		}, /* 200 */
-	{ 5,	0,	printargs,		"SYS_201"		}, /* 201 */
-	{ 5,	0,	printargs,		"SYS_202"		}, /* 202 */
+	{ 2,	TF,	sys_lstat64,		"lstat64"		}, /* 198 */
+	{ 3,	TF,	printargs,		"truncate64"		}, /* 199 */
+	{ 3,	TF,	printargs,		"ftruncate64"		}, /* 200 */
+	{ 3,	0,	printargs,		"getdents64"		}, /* 201 */
+	{ 3,	TF,	sys_fcntl,		"fcntl64"		}, /* 202 */
 	{ 5,	0,	printargs,		"SYS_203"		}, /* 203 */
 	{ 5,	0,	printargs,		"SYS_204"		}, /* 204 */
 	{ 5,	0,	printargs,		"SYS_205"		}, /* 205 */
