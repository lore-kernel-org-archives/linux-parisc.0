From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] _STACK_GROWS_UP fixes.
Date: Sun, 12 Oct 2003 17:37:34 -0400
Message-ID: <20031012213734.GJ23999__26503.8407793783$1416622869$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
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

libc-alpha,

Fix stack grows up.
In a stack grows down scenario the stack pointer is between:

BOS <--- SP ---> h_descr

In the stack grows up scenarion we have:

h_descr,BOS <--- SP ---> STACK GUARD

TOS is not stored, and thus the stack guard start address is
used.

This fixes a regression on HPPA where a cancellation signal would
reach the child thread before the thread register had been setup.
In that situation __pthread_self_stack was called to determine
which thread was active, with the logic backwards, and no limit
in place the while loop spun until it encountered garbage that 
caused the logical expression to evaluate to true. This garbage stack 
address was fatal to the proper execution of the program.

Cheers,
Carlos

===
===

2003-10-06  Carlos O'Donell <carlos@baldric.uwo.ca>

	* pthread.c (__pthread_self_stack): _STACK_GROWS_UP case added.
	(__pthread_find_self): Likewise.
	* manager.c (thread_segment): _STACK_GROWS_UP case added.

diff -u -p -r1.131 pthread.c
--- linuxthreads/pthread.c	23 Sep 2003 04:33:01 -0000	1.131
+++ linuxthreads/pthread.c	12 Oct 2003 20:57:53 -0000
@@ -893,7 +893,11 @@ pthread_descr __pthread_find_self(void)
   /* __pthread_handles[0] is the initial thread, __pthread_handles[1] is
      the manager threads handled specially in thread_self(), so start at 2 */
   h = __pthread_handles + 2;
+# ifdef _STACK_GROWS_UP
+  while (! (sp >= (char *) h->h_descr && sp < h->h_descr->p_guardaddr)) h++;
+# else
   while (! (sp <= (char *) h->h_descr && sp >= h->h_bottom)) h++;
+# endif
   return h->h_descr;
 }
 
@@ -908,11 +912,22 @@ pthread_descr __pthread_self_stack(void)
     return manager_thread;
   h = __pthread_handles + 2;
 # ifdef USE_TLS
+#  ifdef _STACK_GROWS_UP
+  while (h->h_descr == NULL
+	 || ! (sp >= h->h_descr->p_stackaddr && 
+	       sp < h->h_descr->p_guardaddr))
+#  else
   while (h->h_descr == NULL
-	 || ! (sp <= (char *) h->h_descr->p_stackaddr && sp >= h->h_bottom))
+	 || ! (sp <= h->h_descr->p_stackaddr && 
+	       sp >= h->h_bottom))
+#  endif
     h++;
 # else
+#  ifdef _STACK_GROWS_UP
+  while (! (sp >= (char *) h->h_descr && sp < h->h_descr->p_guardaddr))
+#  else
   while (! (sp <= (char *) h->h_descr && sp >= h->h_bottom))
+#  endif
     h++;
 # endif
   return h->h_descr;
diff -u -p -r1.95 manager.c
--- linuxthreads/manager.c	12 Aug 2003 03:40:45 -0000	1.95
+++ linuxthreads/manager.c	12 Oct 2003 20:58:00 -0000
@@ -70,8 +70,13 @@ static pthread_descr manager_thread;
 #else
 static inline pthread_descr thread_segment(int seg)
 {
+# ifdef _STACK_GROWS_UP
+  return (pthread_descr)(THREAD_STACK_START_ADDRESS + (seg - 1) * STACK_SIZE)
+         + 1;
+# else
   return (pthread_descr)(THREAD_STACK_START_ADDRESS - (seg - 1) * STACK_SIZE)
          - 1;
+# endif
 }
 #endif
 
