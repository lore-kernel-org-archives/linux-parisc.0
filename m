From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] Disable the use of fp regs in rtld.c for HPPA
Date: Tue, 19 Nov 2002 01:07:48 -0500
Message-ID: <20021119060748.GI12451__5972.58939310468$1416621948$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bNvn4bxlrUVLu6cT"
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: libc-alpha@sources.redhat.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--bNvn4bxlrUVLu6cT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


libc-alpha,

"Fixed point math in rtld.c segfaults the loader because the ltp is not
yet setup at the point where we need to access it."
	- Randolph Chung

I agree with Randolph (after having seen it under gdb), and here is the
patch.

c.
---

2002-11-11  Randolph Chung  <tausq@debian.org>

	* sysdeps/hppa/Makefile: Disable the use of fp regs in rtld.c


--bNvn4bxlrUVLu6cT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=09-glibc23-hppa-buildhack

--- glibc/sysdeps/hppa/Makefile.orig	2002-09-11 20:19:15.000000000 -0700
+++ glibc/sysdeps/hppa/Makefile	2002-09-11 20:19:17.000000000 -0700
@@ -27,6 +27,7 @@
 endif
 
 ifeq ($(subdir),elf)
+CFLAGS-rtld.c += -mdisable-fpregs
 dl-routines += dl-symaddr dl-fptr
 rtld-routines += dl-symaddr dl-fptr
 endif

--bNvn4bxlrUVLu6cT--
