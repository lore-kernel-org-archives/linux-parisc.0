From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Align locks for LWS syscalls to L1 cache size
Date: Mon, 7 Sep 2015 22:51:50 +0200
Message-ID: <20150907205150.GA4347@ls3530.box>
References: <20150902193840.GA4499@ls3530.box>
 <BLU437-SMTP56D79424A5305ECD3DC75F97690@phx.gbl>
 <20150902202911.GA5164@ls3530.box>
 <55EB632E.9090009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <55EB632E.9090009@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Helge Deller <deller@gmx.de>:
> On 02.09.2015 22:29, Helge Deller wrote:
> > parisc: Align locks for LWS syscalls to L1 cache size (v2)
> > 
> > Align the locks for the Light-weight-syscall (LWS) which are used
> > for atomic userspace operations (e.g. gcc atomic builtins) on L1 cache
> > boundaries. This should speed up LWS calls on PA20 systems.
> > 
> > Reported-by: John David Anglin <dave.anglin@bell.net>
> > Signed-off-by: Helge Deller <deller@gmx.de>

Updated patch (v2):
- using 64 LWS locks (instead of 16)
- LWS lock index is calculated by offset of u32 type, because futexes
  operate on u32 types (before based on 16 bytes)
- LWS locks aligned to 16byte on UP and to L1 cache size on SMP (to
  avoid different threads/processes locking each other on futexes at
  different addresses

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index 47f11c7..bb3d952 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -22,6 +22,21 @@
 #define L1_CACHE_SHIFT 5
 #endif
 
+
+/* Number of Light-weight-syscall (LWS) spinlocks */
+#define LWS_NUM_LOCK_BITS	6
+#define LWS_NUM_LOCKS		(1 << LWS_NUM_LOCK_BITS)
+
+/* Number of bits for alignment of LWS locks.
+ * Needs to be at least 4 (=16 bytes) for safe operation of LDCW.  For SMP
+ * align locks on L1 cache size. */
+#ifdef CONFIG_SMP
+# define LWS_LOCK_ALIGN_BITS	L1_CACHE_SHIFT
+#else
+# define LWS_LOCK_ALIGN_BITS	4
+#endif
+
+
 #ifndef __ASSEMBLY__
 
 #define SMP_CACHE_BYTES L1_CACHE_BYTES
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 49df148..b79e469 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -7,16 +7,23 @@
 #include <linux/uaccess.h>
 #include <asm/atomic.h>
 #include <asm/errno.h>
+#include <asm/cache.h>
 
-/* The following has to match the LWS code in syscall.S.  We have
-   sixteen four-word locks. */
+/* The following has to match the LWS code in syscall.S. */
+static inline arch_spinlock_t *
+_lws_spinlockptr(u32 __user *uaddr)
+{
+	extern u8 lws_lock_start[]; /* in arch/parisc/kernel/syscall.S */
+	/* futexes operates on int values */
+	long index = (((unsigned long)uaddr >> 2) & (LWS_NUM_LOCKS-1));
+	index <<= LWS_LOCK_ALIGN_BITS;	/* multiply by alignment of the locks */
+	return (arch_spinlock_t *) &lws_lock_start[index];
+}
 
 static inline void
 _futex_spin_lock_irqsave(u32 __user *uaddr, unsigned long int *flags)
 {
-	extern u32 lws_lock_start[];
-	long index = ((long)uaddr & 0xf0) >> 2;
-	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+	arch_spinlock_t *s = _lws_spinlockptr(uaddr);
 	local_irq_save(*flags);
 	arch_spin_lock(s);
 }
@@ -24,9 +31,7 @@ _futex_spin_lock_irqsave(u32 __user *uaddr, unsigned long int *flags)
 static inline void
 _futex_spin_unlock_irqrestore(u32 __user *uaddr, unsigned long int *flags)
 {
-	extern u32 lws_lock_start[];
-	long index = ((long)uaddr & 0xf0) >> 2;
-	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+	arch_spinlock_t *s = _lws_spinlockptr(uaddr);
 	arch_spin_unlock(s);
 	local_irq_restore(*flags);
 }
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 7ef22e3..fb0dd94 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -557,13 +557,11 @@ lws_compare_and_swap:
 	ldil	L%lws_lock_start, %r20
 	ldo	R%lws_lock_start(%r20), %r28
 
-	/* Extract four bits from r26 and hash lock (Bits 4-7) */
-	extru  %r26, 27, 4, %r20
+	/* Extract lws lock entry from r26 */
+	extru  %r26, (31-2), LWS_NUM_LOCK_BITS, %r20
 
-	/* Find lock to use, the hash is either one of 0 to
-	   15, multiplied by 16 (keep it 16-byte aligned)
-	   and add to the lock table offset. */
-	shlw	%r20, 4, %r20
+	/* Find hash lock to use */
+	shlw	%r20, LWS_LOCK_ALIGN_BITS, %r20
 	add	%r20, %r28, %r20
 
 # if ENABLE_LWS_DEBUG
@@ -747,13 +745,11 @@ cas2_lock_start:
 	ldil	L%lws_lock_start, %r20
 	ldo	R%lws_lock_start(%r20), %r28
 
-	/* Extract four bits from r26 and hash lock (Bits 4-7) */
-	extru  %r26, 27, 4, %r20
+	/* Extract lws lock entry from r26 */
+	extru  %r26, (31-2), LWS_NUM_LOCK_BITS, %r20
 
-	/* Find lock to use, the hash is either one of 0 to
-	   15, multiplied by 16 (keep it 16-byte aligned)
-	   and add to the lock table offset. */
-	shlw	%r20, 4, %r20
+	/* Find hash lock to use */
+	shlw	%r20, LWS_LOCK_ALIGN_BITS, %r20
 	add	%r20, %r28, %r20
 
 	rsm	PSW_SM_I, %r0			/* Disable interrupts */
@@ -930,12 +926,10 @@ END(sys_call_table64)
 	.align	L1_CACHE_BYTES
 ENTRY(lws_lock_start)
 	/* lws locks */
-	.rept 16
-	/* Keep locks aligned at 16-bytes */
+	.rept LWS_NUM_LOCKS
+	/* Keep locks at least 16-byte aligned */
 	.word 1
-	.word 0 
-	.word 0
-	.word 0
+	.align (1 << LWS_LOCK_ALIGN_BITS)
 	.endr
 END(lws_lock_start)
 	.previous
