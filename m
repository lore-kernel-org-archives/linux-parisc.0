Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep01-mail.bloor.is.net.cable.rogers.com (fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1875E4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 May 2003 11:28:31 -0600 (MDT)
Date: Wed, 21 May 2003 13:29:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha@sources.redhat.com
Cc: parisc-linux@lists.parisc-linux.org,
	Randolph Chung <tausq@debian.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Message-ID: <20030521172929.GB21858@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] HPPA Linuxthreads.
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

This is a cleaner HPPA linuxthreads implementation that stems from the
work that John David Anglin <dave.anglin@nrc-cnrc.gc.ca> and myself did 
to devise a self-aligning lock system that doesn't impose the 16-byte 
lock alignment restriction. Many thanks go to John for all his hard
work! 

This will also allow hppa to relax malloc alignment back to 8 (future
patches).

libc/linuxthreads/*

 sysdeps/hppa/pt-machine.h                    |   81 ++++++++++++++++++++++-----
 sysdeps/hppa/pspinlock.c                     |   29 ++++-----
 sysdeps/unix/sysv/linux/hppa/bits/initspin.h |   22 +++++--

 sysdeps/pthread/bits/libc-lock.h             |    6 +-
 sysdeps/pthread/bits/pthreadtypes.h          |    8 +-

 descr.h                                      |    2 
 pt-machine.c                                 |    4 +
 pthread.c                                    |   14 ++--
 spinlock.c                                   |   24 ++++----
 spinlock.h                                   |   26 ++++++--

 10 files changed, 148 insertions(+), 68 deletions(-)

Comments welcome. Patches tested on HPPA, i686.

c.
---

2003-05-19  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* linuxthreads/sysdeps/hppa/pt-machine.h
	(THREAD_SELF): Define.
	(INIT_THREAD_SELF): Define.
	(testandset): Use __ldcw_align.
	(lock_held): Define.
	(__ldcw): Define.
	(__ldcw_align): Define.
	(__load_and_clear): Define.
	* linuxthreads/sysdeps/hppa/pspinlock.c
	(__pthread_spin_lock): Use __ldcw_align.
	(__pthread_spin_trylock): Likewise.
	(__pthread_spin_unlock): Likewise.
	(__pthread_spin_init): Likewise.
	* linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h
	(__LT_SPINLOCK_INIT): Define.
	(__LT_SPINLOCK_ALT_INIT): Define.
	(__LOCK_INITIALIZER): Define.
	(__LOCK_ALT_INITIALIZER): Define.
	(__ATOMIC_INITIALIZER): Define.
	(__LT_INITIALIZER_NOT_ZERO): Define.

	* linuxthreads/sysdeps/pthread/bits/libc-lock.h:
	Use __LT_INITIALIZER_NOT_ZERO instead of __LT_SPINLOCK_INIT.
	* linuxthreads/sysdeps/pthread/bits/pthreadtypes.h:
	Add global default definition for __atomic_lock_t.
	(pthread_fastlock): Change __spinlock to type __atomic_lock_t.

	* linuxthreads/descr.h (pthread_atomic): change p_spinlock 
	to type __atomic_lock_t from int *.
	* linuxthreads/pt-machine.c: include pthread.h, change
	extern testandset prototype to use __atomic_lock_t * spinlock.
	* linuxthreads/pthread.c (__pthread_initialize_minimal): 
	Use __LT_INITIALIZER_NOT_ZERO.
	* linuxthreads/spinlock.c: use __pthread_lock_define_initialized
	macro to initialize wait_node_free_list_spinlock.
	(__pthread_acquire): change prototype to use 
	__atomic_lock_t * spinlock.
	(__pthread_release): Likewise.
	(__pthread_compare_and_swap): Likewise.
	(__pthread_acquire): Likewise.
	(__pthread_alt_lock): Use __LT_SPINLOCK_INIT to initialize locks.
	(__pthread_alt_timedlock): Likewise.
	* linuxthreads/spinlock.h: define default lock_held, 
	__pthread_lock_define_initialized, and modify prototypes for
	__pthread_compare_and_swap, compare_and_swap,
	compare_and_swap_with_release_semantics, compare_and_swap,
	__pthread_compare_and_swap to use __atomic_lock_t * spinlock.

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
diff -urN glibc-2.3.1.orig/linuxthreads/pthread.c glibc-2.3.1/linuxthreads/pthread.c
--- glibc-2.3.1.orig/linuxthreads/pthread.c	2003-01-15 12:58:15.000000000 -0500
+++ glibc-2.3.1/linuxthreads/pthread.c	2003-01-15 18:24:36.000000000 -0500
@@ -296,9 +296,9 @@
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
@@ -366,7 +366,7 @@
 # endif
   /* self->p_start_args need not be initialized, it's all zero.  */
   self->p_userstack = 1;
-# if __LT_SPINLOCK_INIT != 0
+# ifdef __LT_INITIALIZER_NOT_ZERO 
   self->p_resume_count = (struct pthread_atomic) __ATOMIC_INITIALIZER;
 # endif
   self->p_alloca_cutoff = __MAX_ALLOCA_CUTOFF;
@@ -380,9 +380,9 @@
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
diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pspinlock.c glibc-2.3.1/linuxthreads/sysdeps/hppa/pspinlock.c
--- glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pspinlock.c	2002-08-26 18:39:51.000000000 -0400
+++ glibc-2.3.1/linuxthreads/sysdeps/hppa/pspinlock.c	2003-01-15 18:26:51.000000000 -0500
@@ -24,15 +24,12 @@
 int
 __pthread_spin_lock (pthread_spinlock_t *lock)
 {
-  unsigned int val;
+	unsigned int *addr = __ldcw_align (lock);
+	
+	while (__ldcw (addr) == 0)
+		while (*addr == 0) ;
 
-  do
-    asm volatile ("ldcw %1,%0"
-		  : "=r" (val), "=m" (*lock)
-		  : "m" (*lock));
-  while (!val);
-
-  return 0;
+	return 0;
 }
 weak_alias (__pthread_spin_lock, pthread_spin_lock)
 
@@ -40,13 +37,9 @@
 int
 __pthread_spin_trylock (pthread_spinlock_t *lock)
 {
-  unsigned int val;
-
-  asm volatile ("ldcw %1,%0"
-		: "=r" (val), "=m" (*lock)
-		: "m" (*lock));
+	unsigned int *a = __ldcw_align (lock);
 
-  return val ? 0 : EBUSY;
+	return __ldcw (a) ? 0 : EBUSY;
 }
 weak_alias (__pthread_spin_trylock, pthread_spin_trylock)
 
@@ -54,7 +47,9 @@
 int
 __pthread_spin_unlock (pthread_spinlock_t *lock)
 {
-  *lock = 1;
+  unsigned int *a = __ldcw_align (lock);
+
+  *a = 1;
   return 0;
 }
 weak_alias (__pthread_spin_unlock, pthread_spin_unlock)
@@ -66,7 +61,9 @@
   /* We can ignore the `pshared' parameter.  Since we are busy-waiting
      all processes which can access the memory location `lock' points
      to can use the spinlock.  */
-  *lock = 1;
+  unsigned int *a = __ldcw_align (lock);
+
+  *a = 1;
   return 0;
 }
 weak_alias (__pthread_spin_init, pthread_spin_init)
diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pt-machine.h glibc-2.3.1/linuxthreads/sysdeps/hppa/pt-machine.h
--- glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pt-machine.h	2002-08-26 18:39:51.000000000 -0400
+++ glibc-2.3.1/linuxthreads/sysdeps/hppa/pt-machine.h	2003-01-15 18:24:49.000000000 -0500
@@ -22,13 +22,13 @@
 #ifndef _PT_MACHINE_H
 #define _PT_MACHINE_H   1
 
+#include <sys/types.h>
 #include <bits/initspin.h>
 
 #ifndef PT_EI
 # define PT_EI extern inline
 #endif
 
-extern long int testandset (int *spinlock);
 extern int __compare_and_swap (long int *p, long int oldval, long int newval);
 
 /* Get some notion of the current stack.  Need not be exactly the top
@@ -36,27 +36,80 @@
 #define CURRENT_STACK_FRAME  stack_pointer
 register char * stack_pointer __asm__ ("%r30");
 
+/* Get/Set thread-specific pointer.  We have to call into the kernel to
+ * modify it, but we can read it in user mode.  */
+
+#define THREAD_SELF __get_cr27()
+
+static inline struct _pthread_descr_struct * __get_cr27(void)
+{
+	long cr27;
+	asm("mfctl %%cr27, %0" : "=r" (cr27) : );
+	return (struct _pthread_descr_struct *) cr27;
+}
+
+#define INIT_THREAD_SELF(descr, nr) __set_cr27(descr)
+
+static inline void __set_cr27(struct _pthread_descr_struct * cr27)
+{
+	asm(
+		"ble	0xe0(%%sr2, %%r0)\n\t"
+		"copy	%0, %%r26"
+	 : : "r" (cr27) : "r26" );
+}
+
+/* We want the OS to assign stack addresses.  */
+#define FLOATING_STACKS	1
+#define ARCH_STACK_MAX_SIZE	8*1024*1024
 
 /* The hppa only has one atomic read and modify memory operation,
    load and clear, so hppa spinlocks must use zero to signify that
-   someone is holding the lock.  */
+   someone is holding the lock.  The address used for the ldcw
+   semaphore must be 16-byte aligned.  */
+#define __ldcw(a) ({ \
+  unsigned int __ret;							\
+  __asm__ __volatile__("ldcw 0(%2),%0"					\
+                      : "=r" (__ret), "=m" (*(a)) : "r" (a));		\
+  __ret;								\
+})
+
+/* Because malloc only guarantees 8-byte alignment for malloc'd data,
+   and GCC only guarantees 8-byte alignment for stack locals, we can't
+   be assured of 16-byte alignment for atomic lock data even if we
+   specify "__attribute ((aligned(16)))" in the type declaration.  So,
+   we use a struct containing an array of four ints for the atomic lock
+   type and dynamically select the 16-byte aligned int from the array
+   for the semaphore.  */
+#define __PA_LDCW_ALIGNMENT 16
+#define __ldcw_align(a) ({ \
+  unsigned int __ret = (unsigned int) a;				\
+  if ((__ret & ~(__PA_LDCW_ALIGNMENT - 1)) < (unsigned int) a)		\
+    __ret = (__ret & ~(__PA_LDCW_ALIGNMENT - 1)) + __PA_LDCW_ALIGNMENT; \
+  (unsigned int *) __ret;						\
+})
 
-#define xstr(s) str(s)
-#define str(s) #s
 /* Spinlock implementation; required.  */
-PT_EI long int
-testandset (int *spinlock)
+PT_EI int
+__load_and_clear (__atomic_lock_t *spinlock)
 {
-  int ret;
+  unsigned int *a = __ldcw_align (spinlock);
 
-  __asm__ __volatile__(
-       "ldcw 0(%2),%0"
-       : "=r"(ret), "=m"(*spinlock)
-       : "r"(spinlock));
+  return __ldcw (a);
+}
 
-  return ret == 0;
+/* Emulate testandset */
+PT_EI long int
+testandset (__atomic_lock_t *spinlock)
+{
+  return (__load_and_clear(spinlock) == 0);
 }
-#undef str
-#undef xstr
 
+PT_EI int
+lock_held (__atomic_lock_t *spinlock)
+{
+  unsigned int *a = __ldcw_align (spinlock);
+
+  return *a == 0;
+}
+		
 #endif /* pt-machine.h */
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
diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h glibc-2.3.1/linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h
--- glibc-2.3.1.orig/linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h	2002-08-26 18:39:55.000000000 -0400
+++ glibc-2.3.1/linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h	2003-01-15 18:24:49.000000000 -0500
@@ -17,11 +17,23 @@
    write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
    Boston, MA 02111-1307, USA.  */
 
+/* Initialize global spinlocks without cast, generally macro wrapped */
+#define __LT_SPINLOCK_ALT_INIT { { 1, 1, 1, 1, } }
+
 /* Initial value of a spinlock.  PA-RISC only implements atomic load
    and clear so this must be non-zero. */
-#define __LT_SPINLOCK_INIT 1
+#define __LT_SPINLOCK_INIT ((__atomic_lock_t) __LT_SPINLOCK_ALT_INIT)
+
+/* Macros for lock initializers, not using the above definition.
+   The above definition is not used in the case that static initializers
+   use this value. */
+#define __LOCK_INITIALIZER { 0, __LT_SPINLOCK_ALT_INIT }
+#define __ATOMIC_INITIALIZER { 0, __LT_SPINLOCK_ALT_INIT }
+
+/* Used to initialize _pthread_fastlock's in non-static case */
+#define __LOCK_ALT_INITIALIZER ((struct _pthread_fastlock){ 0, __LT_SPINLOCK_INIT })
+
+/* Tell the rest of the code that the initializer is non-zero without
+   explaining it's internal structure */
+#define __LT_INITIALIZER_NOT_ZERO
 
-/* Macros for lock initializers, using the above definition. */
-#define __LOCK_INITIALIZER { 0, __LT_SPINLOCK_INIT }
-#define __ALT_LOCK_INITIALIZER { 0, __LT_SPINLOCK_INIT }
-#define __ATOMIC_INITIALIZER { 0, __LT_SPINLOCK_INIT }
