From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] Duplicate ustat structure
Date: Sun, 16 Jul 2006 09:03:00 -0700
Message-ID: <20060716160300.GA27091@titanium.v3.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: libc-ports@sources.redhat.com,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org
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

Carlos,

This patch is needed to work around a compilation failure with ustat.c
when using kernel headers produced from the output of "make
headers_install".

The problem is that bits/ustat.h includes the definition of struct
ustat.  However, sys/types.h eventually winds up pulling in
linux/types.h which also defines struct ustat.  Since this definition
forms part of the kernel ABI, the kernel header is the correct place to
define this.

Ubuntu and Fedora are now using these headers.  Debian will be shortly.
I beleive that Gentoo either has or is about to move to them.

tks,
Jeff Bailey

2006-07-16  Jeff Bailey  <jbailey@ubuntu.com>

	* sysdeps/unix/sysv/linux/hppa/bits/ustat.h: New file.

--- /dev/null	2006-07-13 14:56:30.000000000 -0400
+++ sysdeps/unix/sysv/linux/hppa/bits/ustat.h	2006-07-16 11:42:52.000000000 -0400
@@ -0,0 +1,34 @@
+/* Copyright (C) 1997, 2002, 2006 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef _SYS_USTAT_H
+# error "Never include <bits/ustat.h> directly; use <sys/ustat.h> instead."
+#endif
+
+#include <sys/types.h>
+
+#if 0
+/* On hppa, sys/types.h pulls in linux/types.h which defines this */
+struct ustat
+  {
+    __daddr_t f_tfree;		/* Number of free blocks.  */
+    __ino_t f_tinode;		/* Number of free inodes.  */
+    char f_fname[6];
+    char f_fpack[6];
+  };
+#endif


-- 
I do not agree with a word you say, but I will defend to the death your
right to say it. 
 - Voltaire
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
