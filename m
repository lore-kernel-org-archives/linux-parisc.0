Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 285214894
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Aug 2003 15:09:48 -0600 (MDT)
Date: Mon, 18 Aug 2003 17:09:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha@sources.redhat.com
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030818210929.GJ6190@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] hppa libgcc-compat
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

libc-alpha,

Seeing Lu's post about libgcc-compat reminded me that I should submit
our version.

We have been using this patch to fix the leaked __clz_tab symbol from
libgcc. Attached is the required additions to our Makefile, Dist, and
Versions.

This patch was produced by Randolph Chung, many thanks!

Cheers,
Carlos.
---
 sysdeps/hppa/Dist            |    1
 sysdeps/hppa/Makefile        |   11 +++++
 sysdeps/hppa/Versions        |    5 ++
 sysdeps/hppa/libgcc-compat.c |   43 +++++++++++++++++++++++
 4 files changed, 60 insertions(+)
---

2003-02-25  Randolph Chung  <tausq@debian.org>

	* sysdeps/hppa/Makefile: Include compat code in build.
	* sysdeps/hppa/libgcc-compat.c: New file.
	* sysdeps/hppa/Dist: Add libgcc-compat.c
	* sysdeps/hppa/Versions [GLIBC_2.2]: Add __clz_tab.

--- glibc-2.3.1/sysdeps/hppa/Makefile.orig	2003-02-25 22:21:14.000000000 -0800
+++ glibc-2.3.1/sysdeps/hppa/Makefile	2003-02-25 22:22:01.000000000 -0800
@@ -31,3 +31,14 @@
 dl-routines += dl-symaddr dl-fptr
 rtld-routines += dl-symaddr dl-fptr
 endif
+
+ifeq ($(subdir),csu)
+ifeq (yes,$(build-shared))
+# Compatibility
+ifeq (yes,$(have-protected))
+CPPFLAGS-libgcc-compat.c = -DHAVE_DOT_HIDDEN
+endif
+sysdep_routines += libgcc-compat
+shared-only-routines += libgcc-compat
+endif
+endif
--- glibc/sysdeps/hppa/libgcc-compat.c	2003-02-25 22:19:14.000000000 -0800
+++ glibc/sysdeps/hppa/libgcc-compat.c	2003-02-25 22:19:14.000000000 -0800
@@ -0,0 +1,43 @@
+/* pre-.hidden libgcc compatibility
+   Copyright (C) 2002 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+   Contributed by Randolph Chung
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
+
+#include <stdint.h>
+#include <shlib-compat.h>
+
+#if SHLIB_COMPAT(libc, GLIBC_2_0, GLIBC_2_2_6)
+
+symbol_version (__clz_tab_internal, __clz_tab, GLIBC_2.2);
+
+typedef unsigned int UQItype  __attribute__ ((mode (QI)));
+
+const UQItype __clz_tab_internal[] =
+{
+  0,1,2,2,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
+  6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
+  7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
+  7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
+  8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,
+  8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,
+  8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,
+  8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,
+};
+
+#endif
--- glibc-2.3.1/sysdeps/hppa/Dist.orig	2003-02-26 09:02:52.000000000 -0800
+++ glibc-2.3.1/sysdeps/hppa/Dist	2003-02-26 09:04:03.000000000 -0800
@@ -1,2 +1,3 @@
+libgcc-compat.c
 dl-symaddr.c
 dl-fptr.c
--- glibc-2.3.1/sysdeps/hppa/Versions.orig	2002-02-01 13:16:41.000000000 -0800
+++ glibc-2.3.1/sysdeps/hppa/Versions	2003-02-27 13:23:03.000000000 -0800
@@ -5,3 +5,8 @@
     _dl_function_address;
   }
 }
+libc {
+  GLIBC_2.2 {
+    __clz_tab;
+  }
+}
