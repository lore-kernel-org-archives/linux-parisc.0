From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] Fix (for real this time) fcntl64 on HPPA
Date: Tue, 19 Nov 2002 02:13:07 -0500
Message-ID: <20021119071307.GL12451__16124.8027383865$1416621949$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="s8uQA167RD2xhjBe"
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

--s8uQA167RD2xhjBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


libc-alpha,

The following changes adds a few defines so __USE_FILE_OFFSET64
works properly on hppa.

I fixed the changelog and the bug in the original patch.
Tested with samba + LFS support.

c.

 sysdeps/unix/sysv/linux/hppa/bits/fcntl.h |    6 ++++++
 sysdeps/unix/sysv/linux/hppa/fcntl.c      |    1 +
 2 files changed, 7 insertions(+)

---

2002-10-01  Randolph Chung  <tausq@debian.org>

        * sysdeps/unix/sysv/linux/hppa/fcntl.c:
        Include sysdeps/unix/sysv/linux/i386/fcntl.c
        * sysdeps/unix/sysv/linux/hppa/bits/fcntl.h:
        Change defines when using __USE_FILE_OFFSET64


--s8uQA167RD2xhjBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=08-glibc23-hppa-fcntl64

--- glibc/sysdeps/unix/sysv/linux/hppa/fcntl.c	2002-09-10 20:58:07.000000000 -0700
+++ glibc/sysdeps/unix/sysv/linux/hppa/fcntl.c	2002-09-10 20:58:07.000000000 -0700
@@ -0,0 +1 @@
+#include <sysdeps/unix/sysv/linux/i386/fcntl.c>
--- glibc/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h	2002-09-12 10:31:56.000000000 -0700
+++ glibc/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h	2002-09-12 23:43:14.000000000 -0700
@@ -63,9 +63,15 @@
 #define F_SETFD		2	/* Set file descriptor flags.  */
 #define F_GETFL		3	/* Get file status flags.  */
 #define F_SETFL		4	/* Set file status flags.  */
+#ifndef __USE_FILE_OFFSET64
 #define F_GETLK		5	/* Get record locking info.  */
 #define F_SETLK		6	/* Set record locking info (non-blocking).  */
 #define F_SETLKW	7	/* Set record locking info (blocking).  */
+#else
+#define F_GETLK		F_GETLK64  /* Get record locking info.  */
+#define F_SETLK		F_SETLK64  /* Set record locking info (non-blocking).  */
+#define F_SETLKW	F_SETLKW64 /* Set record locking info (blocking).  */
+#endif
 
 #define F_GETLK64	8	/* Get record locking info.  */
 #define F_SETLK64	9	/* Set record locking info (non-blocking).  */

--s8uQA167RD2xhjBe--
