Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1B634841
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Dec 2003 08:14:39 -0700 (MST)
Date: Mon, 1 Dec 2003 16:14:35 +0100
Message-ID: <3FB265EC0000B651@ocpmta3.freegates.net>
In-Reply-To: <20031126070714.GN975@tausq.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] [RFC] rewrite kernel spinlock code to work better with gcc
To: "Randolph Chung" <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Randolph,

(Just in case it would help) I backport your patch in 2.4 (just because the
only system on which I can test it is a b2k on which 2.6 doesn't boot yet)
and build a smp 64bit kernel which boot and run fine (rebuild another kernel)
on this b2k:)

Joel

ps: I don't yet investigate Dave idea :(

>-- Original Message --
>From: Randolph Chung <randolph@tausq.org>
>To: parisc-linux@lists.parisc-linux.org
>Reply-To: Randolph Chung <randolph@tausq.org>
>Date: Tue, 25 Nov 2003 23:07:14 -0800
>Subject: [parisc-linux] [RFC] rewrite kernel spinlock code to work better
>with gcc
>
>
>This has been discussed in bits and pieces several times on the list,
let me summarize:

- On at least some PA processors, addresses passed to ldcw() must be
16-byte aligned
- gcc doesn't guarantee alignment of automatic variables even if the
str
>cture is marked with aligned(16). In gcc-3.0.x, this worked most of
the time because stack alignment was set to 128 bits, but this caused
various problems so the change was reverted in later revisions of gcc.

In glibc, Carlos and Dave implemented 
>auto-aligning" locks by using an
array of 4 ints and doing ldcw on the 16-byte aligned word inside that
array. This makes the code work all the time irregardless of how it is
placed in memory. Here's a patch that implements similar locking
mechanis
>s for the kernel. It compiles, but as SMP still doesn't boot
on 2.6, i haven't really tried to run it. 

there is some concern this will make structures bigger, but at least 
in some situations this actually makes them smaller. e.g.
if you have:

>
struct { int x; spinlock_t lock; };

with the current scheme (using the aligned(16) attribute) the structure
is 32 bytes. with the new scheme it is only 20 bytes. actually i don't
think there are any cases where it will make any structures bigger 
>
than they are now..... 

Any comments?

Index: include/asm-parisc/spinlock.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/spinlock.h,v
retrieving revision 1.1
diff -u -p -r
>.1 spinlock.h
--- include/asm-parisc/spinlock.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/spinlock.h	26 Nov 2003 07:00:12 -0000
@@ -4,35 +4,42 @@
 #include <asm/system.h>
 
 /* Note that PA-RISC has to use `1' to mean unlocked and `0'
>to mean locked
- * since it only has load-and-zero.
+ * since it only has load-and-zero. Moreover, at least on some PA processors,
+ * the semaphore address has to be 16-byte aligned.
  */
 
 #undef SPIN_LOCK_UNLOCKED
-#define SPIN_LOCK_UNLOCKED
>(spinlock_t) { 1 }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) { { 1, 1, 1, 1 } }
 
-#define spin_lock_init(x)	do { (x)->lock = 1; } while(0)
+#define spin_lock_init(x)	do { *(x) = SPIN_LOCK_UNLOCKED; } while(0)
 
-#define spin_is_locked(x) ((x)->lo
>k == 0)
-
-#define spin_unlock_wait(x)	do { barrier(); } while(((volatile spinlock_t
*)(x))->lock == 0)
-
-#if 1
-#define _raw_spin_lock(x) do { \
-	while (__ldcw (&(x)->lock) == 0) \
-		while (((x)->lock) == 0) ; } while (0)
-
-#else
-#defin
> _raw_spin_lock(x) \
-	do { while(__ldcw(&(x)->lock) == 0); } while(0)
-#endif
+static inline int spin_is_locked(spinlock_t *x)
+{
+	volatile unsigned int *a = __ldcw_align(x);
+	return *a == 0;
+}
+
+#define spin_unlock_wait(x)	do { barrier()
> } while(spin_is_locked(x))
+
+static inline void _raw_spin_lock(spinlock_t *x)
+{
+	volatile unsigned int *a = __ldcw_align(x);
+	while (__ldcw(a) == 0)
+		while (*a == 0);
+}
+
+static inline void _raw_spin_unlock(spinlock_t *x)
+{
+	volat
>le unsigned int *a = __ldcw_align(x);
+	*a = 1;
+}
+
+static inline int _raw_spin_trylock(spinlock_t *x)
+{
+	volatile unsigned int *a = __ldcw_align(x);
+	return __ldcw(a) != 0;
+}
 	
-#define _raw_spin_unlock(x) \
-	do { (x)->lock = 1; } w
>ile(0)
-
-#define _raw_spin_trylock(x) (__ldcw(&(x)->lock) != 0)
-
-
-
 /*
  * Read-write spinlocks, allowing multiple readers
  * but only one writer.
@@ -42,7 +49,7 @@ typedef struct {
 	volatile int counter;
 } rwlock_t;
 
-#define RW_L
>CK_UNLOCKED (rwlock_t) { {1}, 0 }
+#define RW_LOCK_UNLOCKED (rwlock_t) { { { 1, 1, 1, 1 } }, 0 }
 
 #define rwlock_init(lp)	do { *(lp) = RW_LOCK_UNLOCKED; } while (0)
 
Index: include/asm-parisc/system.h
==========================================
>========================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/system.h,v
retrieving revision 1.1
diff -u -p -r1.1 system.h
--- include/asm-parisc/system.h	29 Jul 2003 17:02:04 -0000	1.1
+++ include/asm-parisc/system.h	26 Nov 2003 07:00:
>2 -0000
@@ -145,6 +145,19 @@ static inline void set_eiem(unsigned lon
 	__ret; \
 })
 
+/* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
+   and GCC only guarantees 8-byte alignment for stack locals, we can't
+   be assure
> of 16-byte alignment for atomic lock data even if we
+   specify "__attribute ((aligned(16)))" in the type declaration.  So,
+   we use a struct containing an array of four ints for the atomic lock
+   type and dynamically select the 16-byte aligne
> int from the array
+   for the semaphore.  */
+#define __PA_LDCW_ALIGNMENT 16
+#define __ldcw_align(a) ({ \
+  unsigned long __ret = (unsigned long) a;                     		\
+  __ret = (__ret + __PA_LDCW_ALIGNMENT - 1) & ~(__PA_LDCW_ALIGNMENT -
>1); \
+  (unsigned int *) __ret;                                              
\
+})
 
 #ifdef CONFIG_SMP
 /*
@@ -152,7 +165,7 @@ static inline void set_eiem(unsigned lon
  */
 
 typedef struct {
-	volatile unsigned int __attribute__((aligned
>16))) lock;
+	volatile unsigned int lock[4];
 } spinlock_t;
 #endif
Index: include/asm-parisc/atomic.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/atomic.h,v
retrieving revi
>ion 1.5
diff -u -p -r1.5 atomic.h
--- include/asm-parisc/atomic.h	22 Sep 2003 14:28:12 -0000	1.5
+++ include/asm-parisc/atomic.h	26 Nov 2003 07:00:12 -0000
@@ -24,11 +24,18 @@
 
 extern spinlock_t __atomic_hash[ATOMIC_HASH_SIZE];
 /* copied from
><asm/spinlock.h> and modified */
-#  define SPIN_LOCK(x) \
-	do { while(__ldcw(&(x)->lock) == 0); } while(0)
-	
-#  define SPIN_UNLOCK(x) \
-	do { (x)->lock = 1; } while(0)
+static inline void SPIN_LOCK(spinlock_t *x)
+{
+	volatile unsigned int
>*a = __ldcw_align(x);
+	while (__ldcw(a) == 0)
+		while (*a == 0);
+}
+
+static inline void SPIN_UNLOCK(spinlock_t *x)
+{
+	volatile unsigned int *a = __ldcw_align(x);
+	*a = 1;
+}
 #else
 #  define ATOMIC_HASH_SIZE 1
 #  define ATOMIC_HASH
>a)	(0)


randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.or
>/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
