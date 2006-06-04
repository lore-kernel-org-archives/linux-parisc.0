From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] User space locks -- what's wrong
Date: Sun, 4 Jun 2006 19:55:58 -0400 (EDT)
Message-ID: <200606042355.k54Ntw0R026812@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I'm about to throw the following change to the garbage heap since it
doesn't work as expected, particularly with SMP kernels.

The problem is I still see occasional libstdc++ and libjava testsuite
failures in pthread process intensive tests.  In particular, I'm getting
timeouts on tests that didn't timeout before.

The enclosed change is based on ideas presented in the paper,
"Implementing Spinlocks on the Intel Itanium Architecture and PA-RISC".

The main issue that the change tries to address is that spinning
indefinitely in user space on a UP kernel just burns cycles.  So, the
change is to spin awhile and then sleep.  This seemed to work with
the test application in the paper, but in practice it seems to cause
more test failures that just spinning, particularly on SMP kernels.
I suspect that on SMP kernels we sometimes end up with all threads
sleeping.

I've tried various sleep routines including sched_yield, and other
optimizations, but they don't seem to make a difference.  The trick
to dirty the cacheline presented in the paper didn't help performance
as measured by the Appendix F program.  I also didn't see
and difference in performance using the ",co" completer.  Possibly,
this is because I only tested on coherent PA 2.0 machines.

Thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: libstdc++-v3/config/cpu/hppa/atomicity.h
===================================================================
--- libstdc++-v3/config/cpu/hppa/atomicity.h	(revision 114341)
+++ libstdc++-v3/config/cpu/hppa/atomicity.h	(working copy)
@@ -1,6 +1,6 @@
 // Low-level functions for atomic operations: PA-RISC version  -*- C++ -*-
 
-// Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
+// Copyright (C) 2002, 2004, 2005, 2006 Free Software Foundation, Inc.
 //
 // This file is part of the GNU ISO C++ Library.  This library is free
 // software; you can redistribute it and/or modify it under the
@@ -29,7 +29,21 @@
 
 #include <bits/c++config.h>
 #include <bits/atomicity.h>
+#include <sys/time.h>
 
+// Macro to execute the only PA_RISC atomic operation (load and clear word).
+// The operand A must point to the 16-byte aligned lock word.  The result
+// is returned in V.
+#define PA_ASM_LOCK(a,v) \
+  __asm__ __volatile__ ("{ldcws|ldcw} 0(%1),%0"			\
+			: "=r" (v) : "r" (a): "memory")
+
+// Macro to reset lock using an order PA 2.0 store.  The operand A
+// must point to the lock word.  The operand V must contain the value 1.
+#define PA_ASM_UNLOCK(a,v) \
+  __asm__ __volatile__ ("{stws|stw},ma %1,0(%0)"		\
+			: : "r" (a), "r" (v) : "memory")
+
 _GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
 
   template<int _Inst>
@@ -46,6 +60,32 @@
   // linker, we explicitly instantiate the atomicity lock.
   template volatile int _Atomicity_lock<0>::_S_atomicity_lock;
 
+  // Spin and sleep until we acquire the requested lock.
+  inline static void
+  __attribute__ ((__unused__))
+  _pa_getlock (volatile int *lptr)
+  {
+    int tmp;
+    unsigned int spins;
+    struct timeval sleeptime;
+
+    while (1)
+      {
+	// The number of spins should be one on a UP system.
+	for (spins = 100; spins; spins--)
+	  {
+	    PA_ASM_LOCK (lptr, tmp);
+	    if (tmp != 0)
+	      return;
+	  }
+
+	// The sleep time choice isn't critical.
+	sleeptime.tv_sec = 0;
+	sleeptime.tv_usec = 5000;
+	select (0, 0, 0, 0, &sleeptime);
+      }
+  }
+
   int
   __attribute__ ((__unused__))
   __exchange_and_add(volatile _Atomic_word* __mem, int __val)
@@ -54,21 +94,17 @@
     int tmp;
     volatile int& lock = _Atomicity_lock<0>::_S_atomicity_lock;
     
-    __asm__ __volatile__ ("ldcw 0(%1),%0\n\t"
-			  "cmpib,<>,n 0,%0,.+20\n\t"
-			  "ldw 0(%1),%0\n\t"
-			  "cmpib,= 0,%0,.-4\n\t"
-			  "nop\n\t"
-			  "b,n .-20"
-			  : "=&r" (tmp)
-			  : "r" (&lock)
-			  : "memory");
-    
+    PA_ASM_LOCK (&lock, tmp);
+    if (tmp == 0)
+      {
+	// Didn't get lock.
+	_pa_getlock (&lock);
+      }
+
     result = *__mem;
     *__mem = result + __val;
-    /* Reset lock with PA 2.0 "ordered" store.  */
-    __asm__ __volatile__ ("stw,ma %1,0(%0)"
-			  : : "r" (&lock), "r" (tmp) : "memory");
+
+    PA_ASM_UNLOCK (&lock, tmp);
     return result;
   }
   
@@ -79,20 +115,17 @@
     int tmp;
     volatile int& lock = _Atomicity_lock<0>::_S_atomicity_lock;
     
-    __asm__ __volatile__ ("ldcw 0(%1),%0\n\t"
-			  "cmpib,<>,n 0,%0,.+20\n\t"
-			  "ldw 0(%1),%0\n\t"
-			  "cmpib,= 0,%0,.-4\n\t"
-			  "nop\n\t"
-			  "b,n .-20"
-			  : "=&r" (tmp)
-			  : "r" (&lock)
-			  : "memory");
-    
+    PA_ASM_LOCK (&lock, tmp);
+    if (tmp == 0)
+      {
+	// Didn't get lock.
+	_pa_getlock (&lock);
+	tmp = 1;
+      }
+
     *__mem += __val;
-    /* Reset lock with PA 2.0 "ordered" store.  */
-    __asm__ __volatile__ ("stw,ma %1,0(%0)"
-			  : : "r" (&lock), "r" (tmp) : "memory");
+
+    PA_ASM_UNLOCK (&lock, tmp);
   }
 
 _GLIBCXX_END_NAMESPACE
Index: libjava/sysdep/pa/locks.h
===================================================================
--- libjava/sysdep/pa/locks.h	(revision 114341)
+++ libjava/sysdep/pa/locks.h	(working copy)
@@ -1,6 +1,6 @@
 // locks.h - Thread synchronization primitives. PA-RISC implementation.
 
-/* Copyright (C) 2002, 2005  Free Software Foundation
+/* Copyright (C) 2002, 2005, 2006  Free Software Foundation
 
    This file is part of libgcj.
 
@@ -11,6 +11,8 @@
 #ifndef __SYSDEP_LOCKS_H__
 #define __SYSDEP_LOCKS_H__
 
+#include <sys/time.h>
+
 // Integer type big enough for object address.
 typedef size_t obj_addr_t;
 
@@ -28,6 +30,45 @@
 // linker, we explicitly instantiate the atomicity lock.
 template volatile int _pa_jv_cas_lock<0>::_S_pa_jv_cas_lock;
 
+// Macro to execute the only PA_RISC atomic operation (load and clear word).
+// The operand A must point to the 16-byte aligned lock word.  The result
+// is returned in V.
+#define PA_ASM_LOCK(a,v) \
+  __asm__ __volatile__ ("{ldcws|ldcw} 0(%1),%0"			\
+                        : "=r" (v) : "r" (a): "memory")
+
+// Macro to reset lock using an order PA 2.0 store.  The operand A
+// must point to the lock word.  The operand V must contain the value 1.
+#define PA_ASM_UNLOCK(a,v) \
+  __asm__ __volatile__ ("{stws|stw},ma %1,0(%0)"		\
+                        : : "r" (a), "r" (v) : "memory")
+
+// Spin and sleep until we acquire the requested lock.
+inline static void
+__attribute__ ((__unused__))
+_pa_getlock (volatile int *lptr)
+{
+  int tmp;
+  unsigned int spins;
+  struct timeval sleeptime;
+
+  while (1)
+    {
+      // The number of spins should be one on a UP system.
+      for (spins = 100; spins; spins--)
+	{
+	  PA_ASM_LOCK (lptr, tmp);
+	  if (tmp != 0)
+	    return;
+	}
+
+      // The sleep time choice isn't critical.
+      sleeptime.tv_sec = 0;
+      sleeptime.tv_usec = 5000;
+      select (0, 0, 0, 0, &sleeptime);
+    }
+}
+
 // Atomically replace *addr by new_val if it was initially equal to old_val.
 // Return true if the comparison is successful.
 // Assumed to have acquire semantics, i.e. later memory operations
@@ -44,15 +85,13 @@
   int tmp;
   volatile int& lock = _pa_jv_cas_lock<0>::_S_pa_jv_cas_lock;
 
-  __asm__ __volatile__ ("ldcw 0(%1),%0\n\t"
-			"cmpib,<>,n 0,%0,.+20\n\t"
-			"ldw 0(%1),%0\n\t"
-			"cmpib,= 0,%0,.-4\n\t"
-			"nop\n\t"
-			"b,n .-20"
-			: "=&r" (tmp)
-			: "r" (&lock)
-			: "memory");
+  PA_ASM_LOCK (&lock, tmp);
+  if (tmp == 0)
+    {
+      // Didn't get lock.
+      _pa_getlock (&lock);
+      tmp = 1;
+    }
 
   if (*addr != old_val)
     result = false;
@@ -62,10 +101,7 @@
       result = true;
     }
 
-  /* Reset lock with PA 2.0 "ordered" store.  */
-  __asm__ __volatile__ ("stw,ma %1,0(%0)"
-			: : "r" (&lock), "r" (tmp) : "memory");
