Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0C334838
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 23:07:31 -0700 (MST)
Date: Tue, 19 Nov 2002 01:07:11 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha@sources.redhat.com
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20021119060711.GG12451@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="V2AZ19bMCakBLong"
Subject: [parisc-linux] [PATCH] Set minimum kernel and unwined_find_fde for HPPA
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

--V2AZ19bMCakBLong
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


libc-alpha,

The following patch bumps up the minimum kernel required for hppa, and
thus forces the build environment to have the most recent unaligned 
handler fixes.

Due to our old C++ binaries and libraries we will definately require
libc_cv_gcc_unwind_find_fde=yes in our configure.

c.

---

2002-11-11  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* sysdeps/unix/sysv/linux/configure.in:
	Make 2.4.19 minimum linux kernel for hppa, and add unwind symbols
	from gcc-3.0 era for backwards compatibility.
	* sysdeps/unix/sysv/linux/configure: Regenerate.



--V2AZ19bMCakBLong
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=02-glibc23-hppa-min-kern-unwind-fde

--- glibc-2.3.1.orig/sysdeps/unix/sysv/linux/configure.in	2002-10-25 21:06:29.000000000 -0400
+++ glibc-2.3.1/sysdeps/unix/sysv/linux/configure.in	2002-11-17 22:09:57.000000000 -0500
@@ -64,7 +64,8 @@
     arch_minimum_kernel=2.4.0
     ;;
   hppa*)
-    arch_minimum_kernel=2.3.99
+    libc_cv_gcc_unwind_find_fde=yes  
+    arch_minimum_kernel=2.4.19
     ;;
   m68k*)
     arch_minimum_kernel=2.0.10
--- glibc-2.3.1.orig/sysdeps/unix/sysv/linux/configure	2002-10-25 21:06:29.000000000 -0400
+++ glibc-2.3.1/sysdeps/unix/sysv/linux/configure	2002-11-17 22:10:17.000000000 -0500
@@ -101,7 +101,8 @@
     arch_minimum_kernel=2.4.0
     ;;
   hppa*)
-    arch_minimum_kernel=2.3.99
+    libc_cv_gcc_unwind_find_fde=yes  
+    arch_minimum_kernel=2.4.19
     ;;
   m68k*)
     arch_minimum_kernel=2.0.10

--V2AZ19bMCakBLong--
