Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id B490549EB
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 14:49:52 -0600 (MDT)
Date: Fri, 10 Oct 2003 16:46:34 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031010204634.GH6454@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] linuxthreads for hppa (3/3)
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

3. Linuxthreads changes for HPPA.

The following are the architecture specific changes to implement linuxthreads 
on hppa. These patches have been thoroughly tested in 2.3.1 and forward ported 
to the current cvs tree. NTPL and TLS are next on the plate for HPPA. 

Cheers,
Carlos.

===
 linuxthreads/sysdeps/hppa/pspinlock.c                     |   29 ++++------
 linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h |   22 +++++--
 2 files changed, 30 insertions(+), 21 deletions(-)
===

2003-10-04  Carlos O'Donell <carlos@baldric.uwo.ca>

	* linuxthreads/sysdeps/hppa/pspinlock.c
	(__pthread_spin_lock): Use __ldcw_align and __ldcw.
	(__pthread_spin_trylock): Likewise.
	(__pthread_spin_unlock): Use __ldcw_align.
	(__pthread_spin_init): Likewise.
	* linuxthreads/sysdeps/hppa/pt-machine.h
	(THREAD_SELF): New.
	(INIT_THREAD_SELF): New.
	(__ldcw): New.
	(__ldcw_align): New.
	(__load_and_clear): New.
	(testandset): New.
	(lock_held): New.
	* linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/pthreadtypes.h: 
	New file.
	* linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/initspin.h:
	Defined changed to match struct __atomic_lock_t.

diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pspinlock.c glibc-2.3.1/linuxthreads/sysdeps/hppa/pspinlock.c
--- glibc-2.3.1.orig/linuxthreads/sysdeps/hppa/pspinlock.c	2002-08-26 18:39:51.000000000 -0400
+++ glibc-2.3.1/linuxthreads/sysdeps/hppa/pspinlock.c	2003-01-15 18:26:51.000000000 -0500
@@ -24,15 +24,12 @@
 int
 __pthread_spin_lock (pthread_spinlock_t *lock)
 {
-  unsigned int val;
+	volatile unsigned int *addr = __ldcw_align (lock);
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
+	volatile unsigned int *a = __ldcw_align (lock);
 
-  return val ? 0 : EBUSY;
+	return __ldcw (a) ? 0 : EBUSY;
 }
 weak_alias (__pthread_spin_trylock, pthread_spin_trylock)
 
@@ -54,7 +47,9 @@
 int
 __pthread_spin_unlock (pthread_spinlock_t *lock)
 {
-  *lock = 1;
+  volatile unsigned int *a = __ldcw_align (lock);
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
+  volatile unsigned int *a = __ldcw_align (lock);
+
+  *a = 1;
   return 0;
 }
 weak_alias (__pthread_spin_init, pthread_spin_init)
diff -u -p -r1.6 pt-machine.h
--- libc/linuxthreads/sysdeps/hppa/pt-machine.h	31 Jul 2003 19:15:42 -0000	1.6
+++ libc/linuxthreads/sysdeps/hppa/pt-machine.h	5 Aug 2003 19:58:59 -0000
@@ -22,41 +22,97 @@
 #ifndef _PT_MACHINE_H
 #define _PT_MACHINE_H   1
 
+#include <sys/types.h>
 #include <bits/initspin.h>
 
 #ifndef PT_EI
 # define PT_EI extern inline __attribute__ ((always_inline))
 #endif
 
-extern long int testandset (int *spinlock);
-extern int __compare_and_swap (long int *p, long int oldval, long int newval);
+extern inline long int testandset (__atomic_lock_t *spinlock);
+extern inline int __compare_and_swap (long int *p, long int oldval, long int newval);
+extern inline int lock_held (__atomic_lock_t *spinlock); 
+extern inline int __load_and_clear (__atomic_lock_t *spinlock);
 
 /* Get some notion of the current stack.  Need not be exactly the top
    of the stack, just something somewhere in the current frame.  */
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
+  volatile unsigned int __ret = (unsigned int) a;			\
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
+  volatile unsigned int *a = __ldcw_align (spinlock);
 
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
+  volatile unsigned int *a = __ldcw_align (spinlock);
+
+  return *a == 0;
+}
+		
 #endif /* pt-machine.h */
--- libc/linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/pthreadtypes.h.orig	1969-12-31 19:00:00.000000000 -0500
+++ libc/linuxthreads/sysdeps/unix/sysv/linux/hppa/bits/pthreadtypes.h	2003-04-26 14:40:04.000000000 -0400
@@ -0,0 +1,160 @@
+/* Linuxthreads - a simple clone()-based implementation of Posix        */
+/* threads for Linux.                                                   */
+/* Copyright (C) 1996 Xavier Leroy (Xavier.Leroy@inria.fr)              */
+/*                                                                      */
+/* This program is free software; you can redistribute it and/or        */
+/* modify it under the terms of the GNU Library General Public License  */
+/* as published by the Free Software Foundation; either version 2       */
+/* of the License, or (at your option) any later version.               */
+/*                                                                      */
+/* This program is distributed in the hope that it will be useful,      */
+/* but WITHOUT ANY WARRANTY; without even the implied warranty of       */
+/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        */
+/* GNU Library General Public License for more details.                 */
+
+#if !defined _BITS_TYPES_H && !defined _PTHREAD_H
+# error "Never include <bits/pthreadtypes.h> directly; use <sys/types.h> instead."
+#endif
+
+#ifndef _BITS_PTHREADTYPES_H
+#define _BITS_PTHREADTYPES_H	1
+
+#define __need_schedparam
+#include <bits/sched.h>
+
+/* We need 128-bit alignment for the ldcw semaphore.  At most, we are
+   assured of 64-bit alignment for stack locals and malloc'd data.  Thus,
+   we use a struct with four ints for the atomic lock type.  The locking
+   code will figure out which of the four to use for the ldcw semaphore.  */
+typedef volatile struct {
+  int lock[4];
+} __attribute__ ((aligned(16))) __atomic_lock_t;
+
+/* Fast locks (not abstract because mutexes and conditions aren't abstract). */
+struct _pthread_fastlock
+{
+  long int __status;		/* "Free" or "taken" or head of waiting list */
+  __atomic_lock_t __spinlock;	/* Used by compare_and_swap emulation.  Also,
+				   adaptive SMP lock stores spin count here. */
+};
+
+#ifndef _PTHREAD_DESCR_DEFINED
+/* Thread descriptors */
+typedef struct _pthread_descr_struct *_pthread_descr;
+# define _PTHREAD_DESCR_DEFINED
+#endif
+
+
+/* Attributes for threads.  */
+typedef struct __pthread_attr_s
+{
+  int __detachstate;
+  int __schedpolicy;
+  struct __sched_param __schedparam;
+  int __inheritsched;
+  int __scope;
+  size_t __guardsize;
+  int __stackaddr_set;
+  void *__stackaddr;
+  size_t __stacksize;
+} pthread_attr_t;
+
+
+/* Conditions (not abstract because of PTHREAD_COND_INITIALIZER */
+
+#ifdef __GLIBC_HAVE_LONG_LONG
+__extension__ typedef long long __pthread_cond_align_t;
+#else
+typedef long __pthread_cond_align_t;
+#endif
+
+typedef struct
+{
+  struct _pthread_fastlock __c_lock; /* Protect against concurrent access */
+  _pthread_descr __c_waiting;        /* Threads waiting on this condition */
+  char __padding[48 - sizeof (struct _pthread_fastlock)
+		 - sizeof (_pthread_descr) - sizeof (__pthread_cond_align_t)];
+  __pthread_cond_align_t __align;
+} pthread_cond_t;
+
+
+/* Attribute for conditionally variables.  */
+typedef struct
+{
+  int __dummy;
+} pthread_condattr_t;
+
+/* Keys for thread-specific data */
+typedef unsigned int pthread_key_t;
+
+
+/* Mutexes (not abstract because of PTHREAD_MUTEX_INITIALIZER).  */
+/* (The layout is unnatural to maintain binary compatibility
+    with earlier releases of LinuxThreads.) */
+typedef struct
+{
+  int __m_reserved;               /* Reserved for future use */
+  int __m_count;                  /* Depth of recursive locking */
+  _pthread_descr __m_owner;       /* Owner thread (if recursive or errcheck) */
+  int __m_kind;                   /* Mutex kind: fast, recursive or errcheck */
+  struct _pthread_fastlock __m_lock; /* Underlying fast lock */
+} pthread_mutex_t;
+
+
+/* Attribute for mutex.  */
+typedef struct
+{
+  int __mutexkind;
+} pthread_mutexattr_t;
+
+
+/* Once-only execution */
+typedef int pthread_once_t;
+
+
+#ifdef __USE_UNIX98
+/* Read-write locks.  */
+typedef struct _pthread_rwlock_t
+{
+  struct _pthread_fastlock __rw_lock; /* Lock to guarantee mutual exclusion */
+  int __rw_readers;                   /* Number of readers */
+  _pthread_descr __rw_writer;         /* Identity of writer, or NULL if none */
+  _pthread_descr __rw_read_waiting;   /* Threads waiting for reading */
+  _pthread_descr __rw_write_waiting;  /* Threads waiting for writing */
+  int __rw_kind;                      /* Reader/Writer preference selection */
+  int __rw_pshared;                   /* Shared between processes or not */
+} pthread_rwlock_t;
+
+
+/* Attribute for read-write locks.  */
+typedef struct
+{
+  int __lockkind;
+  int __pshared;
+} pthread_rwlockattr_t;
+#endif
+
+#ifdef __USE_XOPEN2K
+/* POSIX spinlock data type.  */
+typedef __atomic_lock_t pthread_spinlock_t;
+
+/* POSIX barrier. */
+typedef struct {
+  struct _pthread_fastlock __ba_lock; /* Lock to guarantee mutual exclusion */
+  int __ba_required;                  /* Threads needed for completion */
+  int __ba_present;                   /* Threads waiting */
+  _pthread_descr __ba_waiting;        /* Queue of waiting threads */
+} pthread_barrier_t;
+
+/* barrier attribute */
+typedef struct {
+  int __pshared;
+} pthread_barrierattr_t;
+
+#endif
+
+
+/* Thread identifiers */
+typedef unsigned long int pthread_t;
+
+#endif	/* bits/pthreadtypes.h */
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
