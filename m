Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 364D448A2
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 23:33:19 -0700 (MST)
Date: Sun, 14 Mar 2004 22:33:18 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040315063318.GC2384@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Spinlock patch, take 2
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Here's another version of my spinlock patch against 2.6.4. It optimizes
spinlocks used for atomic operations by putting the atomic locks into a
special section that is guaranteed to be 16-byte aligned, so no runtime
alignment is needed. Build-tested against 2.6.4. Comments?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/


Index: arch/parisc/kernel/vmlinux.lds.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/vmlinux.lds.S,v
retrieving revision 1.8
diff -u -p -r1.8 vmlinux.lds.S
--- a/arch/parisc/kernel/vmlinux.lds.S	8 Mar 2004 16:54:08 -0000	1.8
+++ b/arch/parisc/kernel/vmlinux.lds.S	15 Mar 2004 06:30:53 -0000
@@ -87,6 +87,10 @@ SECTIONS
   . = ALIGN(L1_CACHE_BYTES);
   .data.cacheline_aligned : { *(.data.cacheline_aligned) }
 
+  /* PA-RISC locks requires 16-byte alignment */
+  . = ALIGN(16);
+  .data.lock_aligned : { *(.data.lock_aligned) }
+
   _edata = .;			/* End of data section */
 
   . = ALIGN(16384); 		/* init_task */
Index: arch/parisc/lib/bitops.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/lib/bitops.c,v
retrieving revision 1.1
diff -u -p -r1.1 bitops.c
--- a/arch/parisc/lib/bitops.c	29 Jul 2003 17:00:41 -0000	1.1
+++ b/arch/parisc/lib/bitops.c	15 Mar 2004 06:30:53 -0000
@@ -13,22 +13,20 @@
 #include <asm/atomic.h>
 
 #ifdef CONFIG_SMP
-spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] = {
-	[0 ... (ATOMIC_HASH_SIZE-1)]  = SPIN_LOCK_UNLOCKED
+atomic_lock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
+	[0 ... (ATOMIC_HASH_SIZE-1)]  = (atomic_lock_t) { 1, { 0, 0, 0 } }
 };
 #endif
 
-spinlock_t __atomic_lock = SPIN_LOCK_UNLOCKED;
-
 #ifdef __LP64__
 unsigned long __xchg64(unsigned long x, unsigned long *ptr)
 {
 	unsigned long temp, flags;
 
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
 	temp = *ptr;
 	*ptr = x;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
 	return temp;
 }
 #endif
@@ -38,10 +36,10 @@ unsigned long __xchg32(int x, int *ptr)
 	unsigned long flags;
 	unsigned long temp;
 
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
 	(long) temp = (long) *ptr;	/* XXX - sign extension wanted? */
 	*ptr = x;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
 	return temp;
 }
 
@@ -51,10 +49,10 @@ unsigned long __xchg8(char x, char *ptr)
 	unsigned long flags;
 	unsigned long temp;
 
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
 	(long) temp = (long) *ptr;	/* XXX - sign extension wanted? */
 	*ptr = x;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
 	return temp;
 }
 
@@ -65,10 +63,10 @@ unsigned long __cmpxchg_u64(volatile uns
 	unsigned long flags;
 	unsigned long prev;
 
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
 	if ((prev = *ptr) == old)
 		*ptr = new;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
 	return prev;
 }
 #endif
@@ -78,9 +76,9 @@ unsigned long __cmpxchg_u32(volatile uns
 	unsigned long flags;
 	unsigned int prev;
 
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(ptr), flags);
 	if ((prev = *ptr) == old)
 		*ptr = new;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(ptr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
 	return (unsigned long)prev;
 }
Index: include/asm-parisc/atomic.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/atomic.h,v
retrieving revision 1.5
diff -u -p -r1.5 atomic.h
--- a/include/asm-parisc/atomic.h	22 Sep 2003 14:28:12 -0000	1.5
+++ b/include/asm-parisc/atomic.h	15 Mar 2004 06:30:56 -0000
@@ -15,33 +15,48 @@
  */
 
 #ifdef CONFIG_SMP
+typedef struct {
+	unsigned int lock;
+	unsigned int pad[3];
+} atomic_lock_t;
+
 /* Use an array of spinlocks for our atomic_ts.
-** Hash function to index into a different SPINLOCK.
-** Since "a" is usually an address, ">>8" makes one spinlock per 64-bytes.
-*/
+ * Hash function to index into a different SPINLOCK.
+ * Since "a" is usually an address, ">>8" makes one spinlock per 64-bytes.
+ */
 #  define ATOMIC_HASH_SIZE 4
 #  define ATOMIC_HASH(a) (&__atomic_hash[(((unsigned long) a)>>8)&(ATOMIC_HASH_SIZE-1)])
 
-extern spinlock_t __atomic_hash[ATOMIC_HASH_SIZE];
-/* copied from <asm/spinlock.h> and modified */
-#  define SPIN_LOCK(x) \
-	do { while(__ldcw(&(x)->lock) == 0); } while(0)
-	
-#  define SPIN_UNLOCK(x) \
-	do { (x)->lock = 1; } while(0)
+extern atomic_lock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;
+
+static inline void atomic_spin_lock(atomic_lock_t *a)
+{
+	while (__ldcw(&a->lock) == 0)
+		while (a->lock == 0);
+}
+
+static inline void atomic_spin_unlock(atomic_lock_t *a)
+{
+	a->lock = 1;
+}
+
 #else
 #  define ATOMIC_HASH_SIZE 1
 #  define ATOMIC_HASH(a)	(0)
-
-/* copied from <linux/spinlock.h> and modified */
-#  define SPIN_LOCK(x) (void)(x)
-	
-#  define SPIN_UNLOCK(x) do { } while(0)
+#  define atomic_spin_lock(x) (void)(x)
+#  define atomic_spin_unlock(x) do { } while(0)
 #endif
 
 /* copied from <linux/spinlock.h> and modified */
-#define SPIN_LOCK_IRQSAVE(lock, flags)		do { local_irq_save(flags);       SPIN_LOCK(lock); } while (0)
-#define SPIN_UNLOCK_IRQRESTORE(lock, flags)	do { SPIN_UNLOCK(lock);  local_irq_restore(flags); } while (0)
+#define atomic_spin_lock_irqsave(lock, flags)	do { 	\
+	local_irq_save(flags);				\
+	atomic_spin_lock(lock); 			\
+} while (0)
+
+#define atomic_spin_unlock_irqrestore(lock, flags) do {	\
+	atomic_spin_unlock(lock);			\
+	local_irq_restore(flags);			\
+} while (0)
 
 /* Note that we need not lock read accesses - aligned word writes/reads
  * are atomic, so a reader never sees unconsistent values.
@@ -137,22 +152,22 @@ static __inline__ int __atomic_add_retur
 {
 	int ret;
 	unsigned long flags;
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(v), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(v), flags);
 
 	ret = (v->counter += i);
 
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(v), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(v), flags);
 	return ret;
 }
 
 static __inline__ void atomic_set(atomic_t *v, int i) 
 {
 	unsigned long flags;
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(v), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(v), flags);
 
 	v->counter = i;
 
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(v), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(v), flags);
 }
 
 static __inline__ int atomic_read(const atomic_t *v)
Index: include/asm-parisc/bitops.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/bitops.h,v
retrieving revision 1.7
diff -u -p -r1.7 bitops.h
--- a/include/asm-parisc/bitops.h	11 Sep 2003 18:29:02 -0000	1.7
+++ b/include/asm-parisc/bitops.h	15 Mar 2004 06:30:56 -0000
@@ -38,9 +38,9 @@ static __inline__ void set_bit(int nr, v
 
 	addr += (nr >> SHIFT_PER_LONG);
 	mask = 1L << CHOP_SHIFTCOUNT(nr);
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(addr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(addr), flags);
 	*addr |= mask;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(addr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 }
 
 static __inline__ void __set_bit(int nr, void * address)
@@ -61,9 +61,9 @@ static __inline__ void clear_bit(int nr,
 
 	addr += (nr >> SHIFT_PER_LONG);
 	mask = 1L << CHOP_SHIFTCOUNT(nr);
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(addr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(addr), flags);
 	*addr &= ~mask;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(addr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 }
 
 static __inline__ void __clear_bit(unsigned long nr, volatile void * address)
@@ -84,9 +84,9 @@ static __inline__ void change_bit(int nr
 
 	addr += (nr >> SHIFT_PER_LONG);
 	mask = 1L << CHOP_SHIFTCOUNT(nr);
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(addr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(addr), flags);
 	*addr ^= mask;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(addr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 }
 
 static __inline__ void __change_bit(int nr, void * address)
@@ -108,10 +108,10 @@ static __inline__ int test_and_set_bit(i
 
 	addr += (nr >> SHIFT_PER_LONG);
 	mask = 1L << CHOP_SHIFTCOUNT(nr);
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(addr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(addr), flags);
 	oldbit = (*addr & mask) ? 1 : 0;
 	*addr |= mask;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(addr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 
 	return oldbit;
 }
@@ -139,10 +139,10 @@ static __inline__ int test_and_clear_bit
 
 	addr += (nr >> SHIFT_PER_LONG);
 	mask = 1L << CHOP_SHIFTCOUNT(nr);
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(addr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(addr), flags);
 	oldbit = (*addr & mask) ? 1 : 0;
 	*addr &= ~mask;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(addr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 
 	return oldbit;
 }
@@ -170,10 +170,10 @@ static __inline__ int test_and_change_bi
 
 	addr += (nr >> SHIFT_PER_LONG);
 	mask = 1L << CHOP_SHIFTCOUNT(nr);
-	SPIN_LOCK_IRQSAVE(ATOMIC_HASH(addr), flags);
+	atomic_spin_lock_irqsave(ATOMIC_HASH(addr), flags);
 	oldbit = (*addr & mask) ? 1 : 0;
 	*addr ^= mask;
-	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(addr), flags);
+	atomic_spin_unlock_irqrestore(ATOMIC_HASH(addr), flags);
 
 	return oldbit;
 }
Index: include/asm-parisc/spinlock.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/spinlock.h,v
retrieving revision 1.1
diff -u -p -r1.1 spinlock.h
--- a/include/asm-parisc/spinlock.h	29 Jul 2003 17:02:04 -0000	1.1
+++ b/include/asm-parisc/spinlock.h	15 Mar 2004 06:30:56 -0000
@@ -4,35 +4,42 @@
 #include <asm/system.h>
 
 /* Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
- * since it only has load-and-zero.
+ * since it only has load-and-zero. Moreover, at least on some PA processors,
+ * the semaphore address has to be 16-byte aligned.
  */
 
 #undef SPIN_LOCK_UNLOCKED
-#define SPIN_LOCK_UNLOCKED (spinlock_t) { 1 }
+#define SPIN_LOCK_UNLOCKED (spinlock_t) { { 1, 1, 1, 1 } }
 
-#define spin_lock_init(x)	do { (x)->lock = 1; } while(0)
+#define spin_lock_init(x)	do { *(x) = SPIN_LOCK_UNLOCKED; } while(0)
 
-#define spin_is_locked(x) ((x)->lock == 0)
-
-#define spin_unlock_wait(x)	do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
-
-#if 1
-#define _raw_spin_lock(x) do { \
-	while (__ldcw (&(x)->lock) == 0) \
-		while (((x)->lock) == 0) ; } while (0)
-
-#else
-#define _raw_spin_lock(x) \
-	do { while(__ldcw(&(x)->lock) == 0); } while(0)
-#endif
+static inline int spin_is_locked(spinlock_t *x)
+{
+	volatile unsigned int *a = __ldcw_align(x);
+	return *a == 0;
+}
+
+#define spin_unlock_wait(x)	do { barrier(); } while(spin_is_locked(x))
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
+	volatile unsigned int *a = __ldcw_align(x);
+	*a = 1;
+}
+
+static inline int _raw_spin_trylock(spinlock_t *x)
+{
+	volatile unsigned int *a = __ldcw_align(x);
+	return __ldcw(a) != 0;
+}
 	
-#define _raw_spin_unlock(x) \
-	do { (x)->lock = 1; } while(0)
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
 
-#define RW_LOCK_UNLOCKED (rwlock_t) { {1}, 0 }
+#define RW_LOCK_UNLOCKED (rwlock_t) { { { 1, 1, 1, 1 } }, 0 }
 
 #define rwlock_init(lp)	do { *(lp) = RW_LOCK_UNLOCKED; } while (0)
 
Index: include/asm-parisc/system.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/system.h,v
retrieving revision 1.1
diff -u -p -r1.1 system.h
--- a/include/asm-parisc/system.h	29 Jul 2003 17:02:04 -0000	1.1
+++ b/include/asm-parisc/system.h	15 Mar 2004 06:30:57 -0000
@@ -145,6 +145,19 @@ static inline void set_eiem(unsigned lon
 	__ret; \
 })
 
+/* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
+   and GCC only guarantees 8-byte alignment for stack locals, we can't
+   be assured of 16-byte alignment for atomic lock data even if we
+   specify "__attribute ((aligned(16)))" in the type declaration.  So,
+   we use a struct containing an array of four ints for the atomic lock
+   type and dynamically select the 16-byte aligned int from the array
+   for the semaphore.  */
+#define __PA_LDCW_ALIGNMENT 16
+#define __ldcw_align(a) ({ \
+  unsigned long __ret = (unsigned long) a;                     		\
+  __ret = (__ret + __PA_LDCW_ALIGNMENT - 1) & ~(__PA_LDCW_ALIGNMENT - 1); \
+  (volatile unsigned int *) __ret;                                      \
+})
 
 #ifdef CONFIG_SMP
 /*
@@ -152,8 +165,11 @@ static inline void set_eiem(unsigned lon
  */
 
 typedef struct {
-	volatile unsigned int __attribute__((aligned(16))) lock;
+	volatile unsigned int lock[4];
 } spinlock_t;
+
+#define __lock_aligned __attribute__((__section__(".data.lock_aligned")))
+
 #endif
 
 #endif
