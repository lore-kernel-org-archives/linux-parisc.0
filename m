Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACDD14829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Dec 2002 15:09:21 -0700 (MST)
Date: Sun, 8 Dec 2002 17:09:18 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha@sources.redhat.com
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20021208220918.GC32062@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="U+BazGySraz5kW0T"
Subject: [parisc-linux] [PATCH] Add SHMLBA define to shm.h (HPPA).
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

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


libc-alpha,

Kernel headers and glibc headers are mildly out of sync on HPPA, I'll
keep my eye out for further inconsistencies. This particular issue was
found while building the latest debian X packages. Odd that it didn't 
turn up before.

c.
---

2002-12-07  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* sysdeps/unix/sysv/linux/hppa/bits/shm.h: Added SHMLBA define.


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=03-glibc23-hppa-shm

--- glibc-2.3.1/sysdeps/unix/sysv/linux/hppa/bits/shm.h	2002-12-07 19:42:52.000000000 -0500
+++ glibc-2.3.1/sysdeps/unix/sysv/linux/hppa/bits/shm.h	2002-12-07 19:33:10.000000000 -0500
@@ -36,6 +36,8 @@
 #define SHM_LOCK	11		/* lock segment (root only) */
 #define SHM_UNLOCK	12		/* unlock segment (root only) */
 
+/* Segment low boundary address multiple */
+#define SHMLBA 0x00400000   /* attach addr needs to be 4 Mb aligned */
 
 /* Type to count number of attaches.  */
 typedef unsigned long int shmatt_t;

--U+BazGySraz5kW0T--
