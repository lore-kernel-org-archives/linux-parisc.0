Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7ED249F2
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 15:21:10 -0600 (MDT)
Date: Fri, 10 Oct 2003 17:17:52 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031010211752.GK6454@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] Remove 16-byte alignment for hppa
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

We no longer require malloc alignment to be 16. Our lock implementation
is flexible enough that this option is now irrelevant.

Cheers,
Carlos.
===

2003-10-10  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* sysdeps/hppa/Makefile: Remove -DMALLOC_ALIGNMENT=16.

--- glibc-2.3.1/sysdeps/hppa/Makefile	2003-01-20 23:47:12.000000000 -0500
+++ glibc-2.3.1/sysdeps/hppa/Makefile	2003-01-20 23:47:19.000000000 -0500
@@ -22,10 +22,6 @@
 # CFLAGS-.os += -ffunction-sections
 LDFLAGS-c_pic.os += -Wl,--unique=.text*
 
-ifeq ($(subdir),malloc)
-CFLAGS-malloc.c += -DMALLOC_ALIGNMENT=16
-endif
-
 ifeq ($(subdir),elf)
 CFLAGS-rtld.c += -mdisable-fpregs
 dl-routines += dl-symaddr dl-fptr
