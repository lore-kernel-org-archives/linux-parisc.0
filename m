From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] linuxthreads for hppa (1/3, Round 2)
Date: Sun, 12 Oct 2003 17:33:50 -0400
Message-ID: <20031012213350.GF23999__757.647565524344$1416622867$gmane$org@systemhalted>
References: <20031010204444.GF6454@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031010204444.GF6454@systemhalted>
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

Changes:

a. Removed _STACK_GROWS_UP changes.
b. Fixed formatting.
c. Fixed Changelog entry.
d. Added olsemaphore patch.

---

I've split linuxthreads for HPPA into 3 digestible patches:

1. Linuxthreads general changes.
2. Linuxthreads sysdep changes.
3. Linuxthreads changes for HPPA.

===

1. Linuxthreads general changes. 

Tested on i386, Alpha, and HPPA. Debian has been using this code since 2.3.1.
All of this code revolves around two central architecture issues:

a. HPPA needs an abstraction for it's atomic lock type.
b. The lock type cannot be initialized to zero.
c. HPPA's stack grows up.

NTPL and TLS are next on the plate for HPPA. Thanks for being patient.

Cheers,
Carlos

===
 linuxthreads/descr.h        |    2 
 linuxthreads/pt-machine.c   |    4 +
 linuxthreads/pthread.c      |   14 ++---
 linuxthreads/spinlock.c     |   22 ++++----
 linuxthreads/spinlock.h     |   26 +++++++---
 linuxthreads/oldsemaphore.c |    2 
 6 files changed, 43 insertions(+), 27 deletions(-)
===

2003-10-12  Carlos O'Donell <carlos@baldric.uwo.ca>

	* descr.h: Define p_spinlock as __atomic_lock_t 
	in struct pthread_atomic.
	* pt-machine.c: Define testandset to take __atomic_lock_t *spinlock.
	* pthread.c (__pthread_initialize_minimal): Use 
	__LT_INITIALIZER_NOT_ZERO instead of __LT_SPINLOCK_INIT.
	* spinlock.c: __pthread_acquire call takes 
	__atomic_lock_t *spinlock, define abandoned as __atomic_lock_t 
	in struct wait_node, use __pthread_lock_define_initialized for 
	wait_node_free_list.
	(__pthread_alt_lock): Use __LT_SPINLOCK_INIT to clear abandoned.
	(__pthread_alt_timedlock): Likewise.
	(__pthread_alt_unlock): Use lock_held.
	(__pthread_release): Call takes __atomic_lock_t *spinlock.
	(__pthread_compare_and_swap): Likewise.
	(__pthread_acquire): Likewise.
	* spinlock.h: Define lock_held, define 
	__pthread_lock_define_initialized for __LT_INITIALIZER_NOT_ZERO, 
	__pthread_compare_and_swap takes __atomic_lock_t *spinlock.
	(compare_and_swap): All versions takes __atomic_lock_t *spinlock.
	(compare_and_swap_with_release_semantics): Likewise.
	* oldsemaphore.c: sem_spinlock in struct old_sem_t is an 
	__atomic_lock_t.

diff -urN glibc-2.3.1.orig/linuxthreads/descr.h glibc-2.3.1/linuxthreads/descr.h
--- glibc-2.3.1.orig/linuxthreads/descr.h	2003-01-15 12:58:11.000000000 -0500
+++ glibc-2.3.1/linuxthreads/descr.h	2003-01-15 18:24:36.000000000 -0500
@@ -70,7 +70,7 @@
 /* Atomic counter made possible by compare_and_swap */
 struct pthread_atomic {
   long p_count;
-  int p_spinlock;
+  __atomic_lock_t p_spinlock;
 };
 
 
diff -urN glibc-2.3.1.orig/linuxthreads/pt-machine.c glibc-2.3.1/linuxthreads/pt-machine.c
--- glibc-2.3.1.orig/linuxthreads/pt-machine.c	2002-08-26 18:39:45.000000000 -0400
+++ glibc-2.3.1/linuxthreads/pt-machine.c	2003-01-15 18:24:36.000000000 -0500
@@ -19,7 +19,9 @@
 
 #define PT_EI
 
-extern long int testandset (int *spinlock);
+#include <pthread.h>
+
+extern long int testandset (__atomic_lock_t *spinlock);
 extern int __compare_and_swap (long int *p, long int oldval, long int newval);
 
 #include <pt-machine.h>
diff -u -p -r1.131 pthread.c
--- libc/linuxthreads/pthread.c	23 Sep 2003 04:33:01 -0000	1.131
+++ libc/linuxthreads/pthread.c	6 Oct 2003 14:48:18 -0000
@@ -300,9 +300,9 @@ __pthread_initialize_minimal(void)
   pthread_descr self;
 
   /* First of all init __pthread_handles[0] and [1] if needed.  */
-# if __LT_SPINLOCK_INIT != 0
-  __pthread_handles[0].h_lock = __LOCK_INITIALIZER;
-  __pthread_handles[1].h_lock = __LOCK_INITIALIZER;
+# ifdef __LT_INITIALIZER_NOT_ZERO
+  __pthread_handles[0].h_lock = __LOCK_ALT_INITIALIZER;
+  __pthread_handles[1].h_lock = __LOCK_ALT_INITIALIZER;
 # endif
 # ifndef SHARED
   /* Unlike in the dynamically linked case the dynamic linker has not
@@ -370,7 +370,7 @@ cannot allocate TLS data structures for 
 # endif
   /* self->p_start_args need not be initialized, it's all zero.  */
   self->p_userstack = 1;
-# if __LT_SPINLOCK_INIT != 0
+# ifdef __LT_INITIALIZER_NOT_ZERO 
   self->p_resume_count = (struct pthread_atomic) __ATOMIC_INITIALIZER;
 # endif
   self->p_alloca_cutoff = __MAX_ALLOCA_CUTOFF;
@@ -384,9 +384,9 @@ cannot allocate TLS data structures for 
 #else  /* USE_TLS */
 
   /* First of all init __pthread_handles[0] and [1].  */
-# if __LT_SPINLOCK_INIT != 0
-  __pthread_handles[0].h_lock = __LOCK_INITIALIZER;
-  __pthread_handles[1].h_lock = __LOCK_INITIALIZER;
+# ifdef __LT_INITIALIZER_NOT_ZERO
+  __pthread_handles[0].h_lock = __LOCK_ALT_INITIALIZER;
+  __pthread_handles[1].h_lock = __LOCK_ALT_INITIALIZER;
 # endif
   __pthread_handles[0].h_descr = &__pthread_initial_thread;
   __pthread_handles[1].h_descr = &__pthread_manager_thread;
diff -urN glibc-2.3.1.orig/linuxthreads/spinlock.c glibc-2.3.1/linuxthreads/spinlock.c
--- glibc-2.3.1.orig/linuxthreads/spinlock.c	2002-08-29 06:32:19.000000000 -0400
+++ glibc-2.3.1/linuxthreads/spinlock.c	2003-01-15 18:24:36.000000000 -0500
@@ -24,9 +24,9 @@
 #include "spinlock.h"
 #include "restart.h"
 
-static void __pthread_acquire(int * spinlock);
+static void __pthread_acquire(__atomic_lock_t * spinlock);
 
-static inline void __pthread_release(int * spinlock)
+static inline void __pthread_release(__atomic_lock_t * spinlock)
 {
   WRITE_MEMORY_BARRIER();
   *spinlock = __LT_SPINLOCK_INIT;
@@ -269,11 +269,11 @@
 struct wait_node {
   struct wait_node *next;	/* Next node in null terminated linked list */
   pthread_descr thr;		/* The thread waiting with this node */
-  int abandoned;		/* Atomic flag */
+  __atomic_lock_t abandoned;	/* Atomic flag */
 };
 
 static long wait_node_free_list;
-static int wait_node_free_list_spinlock;
+__pthread_lock_define_initialized(static, wait_node_free_list_spinlock);
 
 /* Allocate a new node from the head of the free list using an atomic
    operation, or else using malloc if that list is empty.  A fundamental
@@ -376,7 +376,7 @@
       if (self == NULL)
 	self = thread_self();
 
-      wait_node.abandoned = 0;
+      wait_node.abandoned = __LT_SPINLOCK_INIT;
       wait_node.next = (struct wait_node *) lock->__status;
       wait_node.thr = self;
       lock->__status = (long) &wait_node;
@@ -402,7 +402,7 @@
       wait_node.thr = self;
       newstatus = (long) &wait_node;
     }
-    wait_node.abandoned = 0;
+    wait_node.abandoned = __LT_SPINLOCK_INIT;
     wait_node.next = (struct wait_node *) oldstatus;
     /* Make sure the store in wait_node.next completes before performing
        the compare-and-swap */
@@ -451,7 +451,7 @@
       if (self == NULL)
 	self = thread_self();
 
-      p_wait_node->abandoned = 0;
+      p_wait_node->abandoned = __LT_SPINLOCK_INIT;
       p_wait_node->next = (struct wait_node *) lock->__status;
       p_wait_node->thr = self;
       lock->__status = (long) p_wait_node;
@@ -474,7 +474,7 @@
       p_wait_node->thr = self;
       newstatus = (long) p_wait_node;
     }
-    p_wait_node->abandoned = 0;
+    p_wait_node->abandoned = __LT_SPINLOCK_INIT;
     p_wait_node->next = (struct wait_node *) oldstatus;
     /* Make sure the store in wait_node.next completes before performing
        the compare-and-swap */
@@ -574,7 +574,7 @@
     while (p_node != (struct wait_node *) 1) {
       int prio;
 
-      if (p_node->abandoned) {
+      if (lock_held(&p_node->abandoned)) {
 	/* Remove abandoned node. */
 #if defined TEST_FOR_COMPARE_AND_SWAP
 	if (!__pthread_has_cas)
@@ -662,7 +662,7 @@
 #if !defined HAS_COMPARE_AND_SWAP || defined TEST_FOR_COMPARE_AND_SWAP
 
 int __pthread_compare_and_swap(long * ptr, long oldval, long newval,
-                               int * spinlock)
+                               __atomic_lock_t * spinlock)
 {
   int res;
 
@@ -699,7 +699,7 @@
    - When nanosleep() returns, we try again, doing MAX_SPIN_COUNT
      sched_yield(), then sleeping again if needed. */
 
-static void __pthread_acquire(int * spinlock)
+static void __pthread_acquire(__atomic_lock_t * spinlock)	
 {
   int cnt = 0;
   struct timespec tm;
diff -urN glibc-2.3.1.orig/linuxthreads/spinlock.h glibc-2.3.1/linuxthreads/spinlock.h
--- glibc-2.3.1.orig/linuxthreads/spinlock.h	2001-05-24 19:36:35.000000000 -0400
+++ glibc-2.3.1/linuxthreads/spinlock.h	2003-01-15 18:24:36.000000000 -0500
@@ -33,14 +33,28 @@
 #endif
 #endif
 
+/* Define lock_held for all arches that don't need a modified copy. */
+#ifndef __LT_INITIALIZER_NOT_ZERO
+# define lock_held(p) *(p)
+#endif
+
+/* Initliazers for possibly complex structures */
+#ifdef __LT_INITIALIZER_NOT_ZERO
+# define __pthread_lock_define_initialized(CLASS,NAME) \
+	CLASS __atomic_lock_t NAME = __LT_SPINLOCK_ALT_INIT
+#else
+# define __pthread_lock_define_initialized(CLASS,NAME) \
+	CLASS __atomic_lock_t NAME
+#endif
+
 #if defined(TEST_FOR_COMPARE_AND_SWAP)
 
 extern int __pthread_has_cas;
 extern int __pthread_compare_and_swap(long * ptr, long oldval, long newval,
-                                      int * spinlock);
+                                      __atomic_lock_t * spinlock);
 
 static inline int compare_and_swap(long * ptr, long oldval, long newval,
-                                   int * spinlock)
+                                   __atomic_lock_t * spinlock)
 {
   if (__builtin_expect (__pthread_has_cas, 1))
     return __compare_and_swap(ptr, oldval, newval);
@@ -58,7 +72,7 @@
 
 static inline int
 compare_and_swap_with_release_semantics (long * ptr, long oldval,
-					 long newval, int * spinlock)
+					 long newval, __atomic_lock_t * spinlock)
 {
   return __compare_and_swap_with_release_semantics (ptr, oldval,
 						    newval);
@@ -67,7 +81,7 @@
 #endif
 
 static inline int compare_and_swap(long * ptr, long oldval, long newval,
-                                   int * spinlock)
+                                   __atomic_lock_t * spinlock)
 {
   return __compare_and_swap(ptr, oldval, newval);
 }
@@ -75,10 +89,10 @@
 #else
 
 extern int __pthread_compare_and_swap(long * ptr, long oldval, long newval,
-                                      int * spinlock);
+                                      __atomic_lock_t * spinlock);
 
 static inline int compare_and_swap(long * ptr, long oldval, long newval,
-                                   int * spinlock)
+                                   __atomic_lock_t * spinlock)
 {
   return __pthread_compare_and_swap(ptr, oldval, newval, spinlock);
 }
--- libc/linuxthreads/oldsemaphore.c	25 May 2001 07:38:39 -0000	1.11
+++ libc/linuxthreads/oldsemaphore.c	21 Apr 2003 23:53:24 -0000
@@ -31,7 +31,7 @@
 
 typedef struct {
     long int sem_status;
-    int sem_spinlock;
+    __atomic_lock_t sem_spinlock;
 } old_sem_t;
 
 extern int __old_sem_init (old_sem_t *__sem, int __pshared, unsigned int __value);
