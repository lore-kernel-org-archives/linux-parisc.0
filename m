Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 041B54841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Nov 2003 09:31:49 -0700 (MST)
Message-ID: <3FCA1B75.9020600@tiscali.be>
Date: Sun, 30 Nov 2003 16:31:49 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] spinlock 2.4 re-organise a la 2.6 [was: [RFC]
 rewrite kernel spinlock code to work better with gcc]
References: <20031126070714.GN975@tausq.org> <3FC93D47.5020501@tiscali.be> <20031130033705.GA24965@colo.lackof.org>
In-Reply-To: <20031130033705.GA24965@colo.lackof.org>
Content-Type: multipart/mixed;
 boundary="------------050202040002070308050009"
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

This is a multi-part message in MIME format.
--------------050202040002070308050009
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Grant Grundler wrote:
> On Sun, Nov 30, 2003 at 12:43:51AM +0000, Joel Soete wrote:
> ...
> 
>>+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/atomic.h	2003-11-30 01:23:57.000000000 +0100
>>@@ -1,7 +1,6 @@
>> #ifndef _ASM_PARISC_ATOMIC_H_
>> #define _ASM_PARISC_ATOMIC_H_
>> 
>>-#include <linux/config.h>
>> #include <asm/system.h>
> 
> 
> Joel,
> This is wrong - atomic.h uses CONFIG_SMP and thus is
> required to include config.h.
> 
No, i think it is right but I forgot to embrace spinlock_t declaration 
with "#ifdef CONFIG_SMP ...#endif" in system.h. Done in the new attched 
patch (tested and run fine on c100 (32bit up) with kernel up and smp)
My bad in previous test: forgot make distclean ; make mrproper (to be sure).

Still have to test in 64bit up (no means to test in smp neither 32 or 64 
bit :( ).

If you find some interest can you ci (I would like to test Randolph 
patch on n4k just to be sure).

Thanks for help,
	Joel

--------------050202040002070308050009
Content-Type: text/plain;
 name="spinlock-parisc.bp2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="spinlock-parisc.bp2.diff"

diff -Naur linux-2.4.23-rc5-pa17/include/asm-parisc/atomic.h linux-2.4.23-rc5-pa17-bp/include/asm-parisc/atomic.h
--- linux-2.4.23-rc5-pa17/include/asm-parisc/atomic.h	2003-11-29 14:11:51.000000000 +0100
+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/atomic.h	2003-11-30 17:13:58.000000000 +0100
@@ -1,7 +1,6 @@
 #ifndef _ASM_PARISC_ATOMIC_H_
 #define _ASM_PARISC_ATOMIC_H_
 
-#include <linux/config.h>
 #include <asm/system.h>
 
 /* Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>.  */
@@ -14,7 +13,6 @@
  * have to write any serious assembly.   prumpf
  */
 #ifdef CONFIG_SMP
-#include <asm/spinlock_t.h>
 
 /* Use an array of spinlocks for our atomic_ts.
 ** Hash function to index into a different SPINLOCK.
@@ -193,4 +191,4 @@
 #define smp_mb__before_atomic_inc()	smp_mb()
 #define smp_mb__after_atomic_inc()	smp_mb()
 
-#endif
+#endif /* _ASM_PARISC_ATOMIC_H_ */
diff -Naur linux-2.4.23-rc5-pa17/include/asm-parisc/processor.h linux-2.4.23-rc5-pa17-bp/include/asm-parisc/processor.h
--- linux-2.4.23-rc5-pa17/include/asm-parisc/processor.h	2003-11-30 02:11:17.000000000 +0100
+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/processor.h	2003-11-30 02:12:04.000000000 +0100
@@ -18,9 +18,6 @@
 #include <asm/ptrace.h>
 #include <asm/types.h>
 #include <asm/system.h>
-#ifdef CONFIG_SMP
-#include <asm/spinlock_t.h>
-#endif
 #endif /* __ASSEMBLY__ */
 
 /*
diff -Naur linux-2.4.23-rc5-pa17/include/asm-parisc/spinlock.h linux-2.4.23-rc5-pa17-bp/include/asm-parisc/spinlock.h
--- linux-2.4.23-rc5-pa17/include/asm-parisc/spinlock.h	2003-11-29 14:10:38.000000000 +0100
+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/spinlock.h	2003-11-30 01:21:40.000000000 +0100
@@ -1,9 +1,55 @@
 #ifndef __ASM_SPINLOCK_H
 #define __ASM_SPINLOCK_H
 
-#include <asm/spinlock_t.h>		/* get spinlock primitives */
-#include <asm/psw.h>			/* local_* primitives need PSW_I */
-#include <asm/system_irqsave.h>		/* get local_* primitives */
+#include <asm/system.h>
+
+#ifndef CONFIG_DEBUG_SPINLOCK
+#define SPIN_LOCK_UNLOCKED_INIT { 1 }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) SPIN_LOCK_UNLOCKED_INIT
+
+/* Define 6 spinlock primitives that don't depend on anything else. */
+
+#define spin_lock_init(x)       do { (x)->lock = 1; } while(0)
+#define spin_is_locked(x)       ((x)->lock == 0)
+#define spin_trylock(x)		(__ldcw(&(x)->lock) != 0)
+ 
+/* 
+ * PA2.0 is not strongly ordered.  PA1.X is strongly ordered.
+ * ldcw enforces ordering and we need to make sure ordering is
+ * enforced on the unlock too.
+ * "stw,ma" with Zero index is an alias for "stw,o".
+ * But PA 1.x can assemble the "stw,ma" while it doesn't know about "stw,o".
+ * And PA 2.0 will generate the right insn using either form.
+ * Thanks to John David Anglin for this cute trick.
+ *
+ * Writing this with asm also ensures that the unlock doesn't
+ * get reordered
+ */
+#define spin_unlock(x) \
+	__asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (&(x)->lock) : "memory" )
+
+#define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
+
+#define spin_lock(x) do { \
+	while (__ldcw (&(x)->lock) == 0) \
+		while ((x)->lock == 0) ; \
+} while (0)
+
+#else /* ! CONFIG_DEBUG_SPINLOCK */
+
+#define SPIN_LOCK_UNLOCKED_INIT { 1, 0L, 0L }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) SPIN_LOCK_UNLOCKED_INIT
+
+/* Define 6 spinlock primitives that don't depend on anything else. */
+
+#define spin_lock_init(x)       do { (x)->lock = 1; (x)->owner_cpu = 0; (x)->owner_pc = 0; } while(0)
+#define spin_is_locked(x)       ((x)->lock == 0)
+void spin_lock(spinlock_t *lock);
+int spin_trylock(spinlock_t *lock);
+void spin_unlock(spinlock_t *lock);
+#define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
+
+#endif /* ! CONFIG_DEBUG_SPINLOCK */
 
 /*
  * Read-write spinlocks, allowing multiple readers
diff -Naur linux-2.4.23-rc5-pa17/include/asm-parisc/spinlock_t.h linux-2.4.23-rc5-pa17-bp/include/asm-parisc/spinlock_t.h
--- linux-2.4.23-rc5-pa17/include/asm-parisc/spinlock_t.h	2003-11-29 16:13:04.000000000 +0100
+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/spinlock_t.h	1970-01-01 01:00:00.000000000 +0100
@@ -1,97 +0,0 @@
-#ifndef __PARISC_SPINLOCK_T_H
-#define __PARISC_SPINLOCK_T_H
-
-/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
- *
- * Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
- * since it only has load-and-zero.
- */
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
-#define __ldcw(a) ({ \
-	unsigned __ret; \
-	__asm__ __volatile__("ldcw,co 0(%1),%0" : "=r" (__ret) : "r" (a)); \
-	__ret; \
-})
-#else
-#define __ldcw(a) ({ \
-	unsigned __ret; \
-	__asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
-	__ret; \
-})
-#endif
-
-/*
- * Your basic SMP spinlocks, allowing only a single CPU anywhere
- */
-
-typedef struct {
-#ifdef CONFIG_PA20
-	volatile unsigned int lock;
-#else
-	volatile unsigned int __attribute__((aligned(16))) lock;
-#endif
-#ifdef CONFIG_DEBUG_SPINLOCK
-	volatile unsigned long owner_pc;
-	volatile unsigned long owner_cpu;
-#endif
-} spinlock_t;
-
-#ifndef CONFIG_DEBUG_SPINLOCK
-#define SPIN_LOCK_UNLOCKED_INIT { 1 }
-#define SPIN_LOCK_UNLOCKED (spinlock_t) SPIN_LOCK_UNLOCKED_INIT
-
-/* Define 6 spinlock primitives that don't depend on anything else. */
-
-#define spin_lock_init(x)       do { (x)->lock = 1; } while(0)
-#define spin_is_locked(x)       ((x)->lock == 0)
-#define spin_trylock(x)		(__ldcw(&(x)->lock) != 0)
- 
-/* 
- * PA2.0 is not strongly ordered.  PA1.X is strongly ordered.
- * ldcw enforces ordering and we need to make sure ordering is
- * enforced on the unlock too.
- * "stw,ma" with Zero index is an alias for "stw,o".
- * But PA 1.x can assemble the "stw,ma" while it doesn't know about "stw,o".
- * And PA 2.0 will generate the right insn using either form.
- * Thanks to John David Anglin for this cute trick.
- *
- * Writing this with asm also ensures that the unlock doesn't
- * get reordered
- */
-#define spin_unlock(x) \
-	__asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (&(x)->lock) : "memory" )
-
-#define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
-
-#define spin_lock(x) do { \
-	while (__ldcw (&(x)->lock) == 0) \
-		while ((x)->lock == 0) ; \
-} while (0)
-
-#else
-
-#define SPIN_LOCK_UNLOCKED_INIT { 1, 0L, 0L }
-#define SPIN_LOCK_UNLOCKED (spinlock_t) SPIN_LOCK_UNLOCKED_INIT
-
-/* Define 6 spinlock primitives that don't depend on anything else. */
-
-#define spin_lock_init(x)       do { (x)->lock = 1; (x)->owner_cpu = 0; (x)->owner_pc = 0; } while(0)
-#define spin_is_locked(x)       ((x)->lock == 0)
-void spin_lock(spinlock_t *lock);
-int spin_trylock(spinlock_t *lock);
-void spin_unlock(spinlock_t *lock);
-#define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
-
-#endif
-
-#endif /* __PARISC_SPINLOCK_T_H */
diff -Naur linux-2.4.23-rc5-pa17/include/asm-parisc/system.h linux-2.4.23-rc5-pa17-bp/include/asm-parisc/system.h
--- linux-2.4.23-rc5-pa17/include/asm-parisc/system.h	2003-11-29 14:11:16.000000000 +0100
+++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/system.h	2003-11-30 17:12:37.000000000 +0100
@@ -5,10 +5,6 @@
 #include <asm/psw.h>
 #include <asm/system_irqsave.h>
 
-#ifdef CONFIG_SMP
-#include <asm/spinlock_t.h>
-#endif
-
 /* The program status word as bitfields.  */
 struct pa_psw {
 	unsigned int y:1;
@@ -69,7 +65,7 @@
 #define save_and_cli(x) do { save_flags(x); cli(); } while(0);
 #define save_and_sti(x) do { save_flags(x); sti(); } while(0);
 
-#else
+#else /* CONFIG_SMP */
 
 #define cli() __cli()
 #define sti() __sti()
@@ -78,7 +74,7 @@
 #define save_and_cli(x) __save_and_cli(x)
 #define save_and_sti(x) __save_and_sti(x)
 
-#endif
+#endif /* CONFIG_SMP */
 
 
 #define mfctl(reg)	({		\
@@ -147,4 +143,51 @@
 
 #define set_mb(var, value) do { var = value; mb(); } while (0)
 
+/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
+ *
+ * Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
+ * since it only has load-and-zero.
+ */
+#ifdef CONFIG_PA20
+/* 
+> From: "Jim Hull" <jim.hull of hp.com>
+> Delivery-date: Wed, 29 Jan 2003 13:57:05 -0500
+> I've attached a summary of the change, but basically, for PA 2.0, as
+> long as the ",CO" (coherent operation) completer is specified, then the
+> 16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
+> they only require "natural" alignment (4-byte for ldcw, 8-byte for
+> ldcd).
+*/
+
+#define __ldcw(a) ({ \
+	unsigned __ret; \
+	__asm__ __volatile__("ldcw,co 0(%1),%0" : "=r" (__ret) : "r" (a)); \
+	__ret; \
+})
+#else /* CONFIG_PA20 */
+#define __ldcw(a) ({ \
+	unsigned __ret; \
+	__asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
+	__ret; \
+})
+#endif /* CONFIG_PA20 */
+
+#ifdef CONFIG_SMP
+/*
+ * Your basic SMP spinlocks, allowing only a single CPU anywhere
+ */
+
+typedef struct {
+#ifdef CONFIG_PA20
+	volatile unsigned int lock;
+#else
+	volatile unsigned int __attribute__((aligned(16))) lock;
 #endif
+#ifdef CONFIG_DEBUG_SPINLOCK
+	volatile unsigned long owner_pc;
+	volatile unsigned long owner_cpu;
+#endif
+} spinlock_t;
+#endif /* CONFIG_SMP */
+
+#endif /* __PARISC_SYSTEM_H */

--------------050202040002070308050009--
