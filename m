From: kyle@mcmartin.ca (Kyle McMartin)
Subject: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Fri, 27 Aug 2004 12:37:02 -0400
Message-ID: <20040827163701.GA2414@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Not knowing anything about how 2.4 works, I hope this is enough,
ping me if it isn't, and I'll take another look.

	Regards,
		Kyle

arch/parisc/lib/locks.c         |    6 ++++++
include/asm-parisc/atomic.h     |   10 ++++++++--
include/asm-parisc/spinlock_t.h |   19 +++++++++++--------
3 files changed, 25 insertions(+), 10 deletions(-)


Index: arch/parisc/lib/locks.c
===================================================================
RCS file: /var/cvs/linux-2.4/arch/parisc/lib/locks.c,v
retrieving revision 1.1
diff -u -r1.1 locks.c
--- arch/parisc/lib/locks.c	16 Nov 2002 07:28:08 -0000	1.1
+++ arch/parisc/lib/locks.c	27 Aug 2004 16:12:50 -0000
@@ -22,6 +22,7 @@
 
 void spin_lock(spinlock_t *lock)
 {
+	mb();
 	int cpu = smp_processor_id();
 	unsigned int stuck = INIT_STUCK;
 	while (!__spin_trylock(lock)) {
@@ -39,19 +40,23 @@
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
@@ -63,6 +68,7 @@
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
+++ include/asm-parisc/atomic.h	27 Aug 2004 16:13:00 -0000
@@ -30,8 +30,14 @@
  *
  * XXX REVISIT these could be renamed and moved to spinlock_t.h as well
  */
-#define SPIN_LOCK(x)	do { while(__ldcw(&(x)->lock) == 0); } while(0)
-#define SPIN_UNLOCK(x)  do { (x)->lock = 1; } while(0)
+#define SPIN_LOCK(x)    mb();     \
+                        do { while(__ldcw(&(x)->lock) == 0); } \
+                        while(0); \
+                        mb()
+#define SPIN_UNLOCK(x)  mb();     \
+                        do { (x)->lock = 1; } \
+                        while(0); \
+                        mb()
 
 #else	/* CONFIG_SMP */
 
Index: include/asm-parisc/spinlock_t.h
===================================================================
RCS file: /var/cvs/linux-2.4/include/asm-parisc/spinlock_t.h,v
retrieving revision 1.5
diff -u -r1.5 spinlock_t.h
--- include/asm-parisc/spinlock_t.h	7 May 2003 17:20:29 -0000	1.5
+++ include/asm-parisc/spinlock_t.h	27 Aug 2004 16:13:00 -0000
@@ -68,15 +68,18 @@
  * Writing this with asm also ensures that the unlock doesn't
  * get reordered
  */
-#define spin_unlock(x) \
-	__asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (&(x)->lock) : "memory" )
+#define spin_unlock(x) do { mb(); \
+ 	__asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (&(x)->lock) : "memory" ); \
+        mb(); } while(0)
+
+#define spin_unlock_wait(x) mb(); \
+ do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0); \
+ mb()
 
-#define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
-
-#define spin_lock(x) do { \
+#define spin_lock(x) do { mb(); \
 	while (__ldcw (&(x)->lock) == 0) \
 		while ((x)->lock == 0) ; \
-} while (0)
+        mb(); } while (0)
 
 #else
 
@@ -85,12 +88,12 @@
 
 /* Define 6 spinlock primitives that don't depend on anything else. */
 
-#define spin_lock_init(x)       do { (x)->lock = 1; (x)->owner_cpu = 0; (x)->owner_pc = 0; } while(0)
+#define spin_lock_init(x)       mb(); do { (x)->lock = 1; (x)->owner_cpu = 0; (x)->owner_pc = 0; } while(0); mb()
 #define spin_is_locked(x)       ((x)->lock == 0)
 void spin_lock(spinlock_t *lock);
 int spin_trylock(spinlock_t *lock);
 void spin_unlock(spinlock_t *lock);
-#define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
+#define spin_unlock_wait(x)     mb(); do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0); mb()
 
 #endif
 
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
