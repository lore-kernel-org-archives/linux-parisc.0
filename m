From: kyle@mcmartin.ca (Kyle McMartin)
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Sat, 28 Aug 2004 18:15:25 -0400
Message-ID: <20040828221524.GT2414@mcmartin.ca>
References: <20040827163701.GA2414@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040827163701.GA2414@mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Once more unto the brink,

Commitable?

Index: arch/parisc/lib/locks.c
===================================================================
RCS file: /var/cvs/linux-2.4/arch/parisc/lib/locks.c,v
retrieving revision 1.1
diff -u -r1.1 locks.c
--- arch/parisc/lib/locks.c	16 Nov 2002 07:28:08 -0000	1.1
+++ arch/parisc/lib/locks.c	28 Aug 2004 18:55:59 -0000
@@ -24,6 +24,8 @@
 {
 	int cpu = smp_processor_id();
 	unsigned int stuck = INIT_STUCK;
+
+	mb();
 	while (!__spin_trylock(lock)) {
 		while ((unsigned volatile long)lock->lock == 0) {
 			if (!--stuck) {
@@ -39,19 +41,23 @@
 	}
 	lock->owner_pc = (unsigned long)__builtin_return_address(0);
 	lock->owner_cpu = cpu;
+	mb();
 }
 
 int spin_trylock(spinlock_t *lock)
 {
+	mb();
 	if (!__spin_trylock(lock))
 		return 0;
 	lock->owner_cpu = smp_processor_id(); 
 	lock->owner_pc = (unsigned long)__builtin_return_address(0);
+	mb();
 	return 1;
 }
 
 void spin_unlock(spinlock_t *lp)
 {
+	mb();
   	if ( lp->lock )
 		printk("spin_unlock(%p): no lock cpu %d curr PC %p %s/%d\n",
 		       lp, smp_processor_id(), __builtin_return_address(0),
@@ -63,6 +69,7 @@
 	lp->owner_pc = lp->owner_cpu = 0;
 	wmb();
 	lp->lock = 1;
+	mb();
 }
 
 #endif
Index: include/asm-parisc/atomic.h
===================================================================
RCS file: /var/cvs/linux-2.4/include/asm-parisc/atomic.h,v
retrieving revision 1.10
diff -u -r1.10 atomic.h
--- include/asm-parisc/atomic.h	13 Sep 2002 21:43:37 -0000	1.10
+++ include/asm-parisc/atomic.h	28 Aug 2004 18:56:09 -0000
@@ -30,8 +30,11 @@
  *
  * XXX REVISIT these could be renamed and moved to spinlock_t.h as well
  */
-#define SPIN_LOCK(x)	do { while(__ldcw(&(x)->lock) == 0); } while(0)
-#define SPIN_UNLOCK(x)  do { (x)->lock = 1; } while(0)
+#define SPIN_LOCK(x) do { while(__ldcw(&(x)->lock) == 0); } while(0)
+#define SPIN_UNLOCK(x) do {  \
+                         __asm__ __volatile__ ("stw,ma %1,0(%0)" \
+                         : : "r" (&(x)->lock), "r" (0) : "memory"); \
+                       } while (0)
 
 #else	/* CONFIG_SMP */
 
Index: include/asm-parisc/spinlock_t.h
===================================================================
RCS file: /var/cvs/linux-2.4/include/asm-parisc/spinlock_t.h,v
retrieving revision 1.5
diff -u -r1.5 spinlock_t.h
--- include/asm-parisc/spinlock_t.h	7 May 2003 17:20:29 -0000	1.5
+++ include/asm-parisc/spinlock_t.h	28 Aug 2004 18:56:09 -0000
@@ -6,29 +6,12 @@
  * Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
  * since it only has load-and-zero.
  */
-#ifdef CONFIG_PA20
-/* 
-> From: "Jim Hull" <jim.hull of hp.com>
-> Delivery-date: Wed, 29 Jan 2003 13:57:05 -0500
-> I've attached a summary of the change, but basically, for PA 2.0, as
-> long as the ",CO" (coherent operation) completer is specified, then the
-> 16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
-> they only require "natural" alignment (4-byte for ldcw, 8-byte for
-> ldcd).
-*/
-
 #define __ldcw(a) ({ \
 	unsigned __ret; \
-	__asm__ __volatile__("ldcw,co 0(%1),%0" : "=r" (__ret) : "r" (a)); \
+	__asm__ __volatile__("ldcw,ma 0(%1),%0" \
+                             : "=r" (__ret) : "r" (a) : "memory"); \
 	__ret; \
 })
-#else
-#define __ldcw(a) ({ \
-	unsigned __ret; \
-	__asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
-	__ret; \
-})
-#endif
 
 /*
  * Your basic SMP spinlocks, allowing only a single CPU anywhere
@@ -68,15 +51,17 @@
  * Writing this with asm also ensures that the unlock doesn't
  * get reordered
  */
-#define spin_unlock(x) \
-	__asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (&(x)->lock) : "memory" )
+#define spin_unlock(x) do { __asm__ __volatile__ ("stw,ma  %%sp,0(%0)" \
+                                    : : "r" (&(x)->lock) : "memory" ); \
+                       } while(0)
 
-#define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
+#define spin_unlock_wait(x) do { barrier(); } \
+                            while(((volatile spinlock_t *)(x))->lock == 0)
 
-#define spin_lock(x) do { \
+#define spin_lock(x) do {                \
 	while (__ldcw (&(x)->lock) == 0) \
 		while ((x)->lock == 0) ; \
-} while (0)
+        } while (0)
 
 #else
 
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
