Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 475B7484E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 14:48:55 -0600 (MDT)
Date: Fri, 10 Oct 2003 16:45:37 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031010204537.GG6454@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] linuxthreads for hppa (2/3)
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

2. Linuxthreads sysdep changes. 

This patch represents the minor changes required in linuxthreads sysdeps to
accomodate for hppa's special lock requirements (e.g. A structure instead of
an integer).

The changes are minor and require that __LT_SPINLOCK_INIT no longer be used in
a macro comparison since it's now a structure. A different define
(__LT_INITIALIZER_NOT_ZERO) is used to indicate an architecture that does not 
initialize a lock to zero.

Cheers,
Carlos.

===
 linuxthreads/sysdeps/pthread/bits/libc-lock.h    |    6 +++---
 linuxthreads/sysdeps/pthread/bits/pthreadtypes.h |    8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)
===

2003-10-04  Carlos O'Donell <carlos@baldric.uwo.ca>

	* linuxthreads/sysdeps/pthread/bits/libc-lock.h:
	Use __LT_INITIALIZER_NOT_ZERO.
	* linuxthreads/sysdeps/pthread/bits/pthreadtypes.h:
	spinlock in struct _pthread_fastlock is __atomic_lock_t.

diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/pthread/bits/libc-lock.h glibc-2.3.1/linuxthreads/sysdeps/pthread/bits/libc-lock.h
--- glibc-2.3.1.orig/linuxthreads/sysdeps/pthread/bits/libc-lock.h	2003-01-15 12:58:35.000000000 -0500
+++ glibc-2.3.1/linuxthreads/sysdeps/pthread/bits/libc-lock.h	2003-01-15 18:24:36.000000000 -0500
@@ -71,12 +71,12 @@
    initialized locks must be set to one due to the lack of normal
    atomic operations.) */
 
-#if __LT_SPINLOCK_INIT == 0
+#ifdef __LT_INITIALIZER_NOT_ZERO
 #  define __libc_lock_define_initialized(CLASS,NAME) \
-  CLASS __libc_lock_t NAME;
+  CLASS __libc_lock_t NAME = PTHREAD_MUTEX_INITIALIZER;
 #else
 #  define __libc_lock_define_initialized(CLASS,NAME) \
-  CLASS __libc_lock_t NAME = PTHREAD_MUTEX_INITIALIZER;
+  CLASS __libc_lock_t NAME;
 #endif
 
 #define __libc_rwlock_define_initialized(CLASS,NAME) \
diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h glibc-2.3.1/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h
--- glibc-2.3.1.orig/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h	2003-01-15 12:58:35.000000000 -0500
+++ glibc-2.3.1/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h	2003-01-15 18:24:36.000000000 -0500
@@ -22,12 +22,14 @@
 #define __need_schedparam
 #include <bits/sched.h>
 
+typedef int __atomic_lock_t;
+
 /* Fast locks (not abstract because mutexes and conditions aren't abstract). */
 struct _pthread_fastlock
 {
-  long int __status;   /* "Free" or "taken" or head of waiting list */
-  int __spinlock;      /* Used by compare_and_swap emulation. Also,
-			  adaptive SMP lock stores spin count here. */
+  long int __status;		/* "Free" or "taken" or head of waiting list */
+  __atomic_lock_t __spinlock;	/* Used by compare_and_swap emulation. Also,
+				   adaptive SMP lock stores spin count here. */
 };
 
 #ifndef _PTHREAD_DESCR_DEFINED
