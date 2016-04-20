From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add native high-resolution sched_clock()
 implementation
Date: Wed, 20 Apr 2016 21:34:15 +0200
Message-ID: <20160420193415.GA3895@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add a native implementation for the sched_clock() function which utilizes the
processor-internal cycle counter (Control Register 16) as high-resolution time
source.

With this patch we now get much more fine-grained resolutions in various
in-kernel time measurements (e.g. when viewing the function tracing logs), and
probably a more accurate scheduling on SMP systems.

There are a few specific implementation details in this patch:

1. On a 32bit kernel we emulate the higher 32bits of the required 64-bit
resolution of sched_clock() by increasing a per-cpu counter at every
wrap-around of the 32bit cycle counter.

2. In a SMP system, the cycle counters of the various CPUs are not syncronized
(similiar to the TSC in a x86_64 system). To cope with this we define
HAVE_UNSTABLE_SCHED_CLOCK and let the upper layers do the adjustment work.

3. Since we need HAVE_UNSTABLE_SCHED_CLOCK, we need to provide a cmpxchg64()
function even on a 32-bit kernel.

4. A 64-bit SMP kernel which is started on a UP system will mark the
sched_clock() implementation as "stable", which means that we don't expect any
jumps in the returned counter. This is true because we then run only on one
CPU.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index bf05fc4..766da06 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -33,6 +33,7 @@ config PARISC
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_UNSTABLE_SCHED_CLOCK if (SMP || !64BIT)
 	select ARCH_NO_COHERENT_DMA_MMAP
 
 	help
diff --git a/arch/parisc/include/asm/cmpxchg.h b/arch/parisc/include/asm/cmpxchg.h
index 0a90b96..7ada309 100644
--- a/arch/parisc/include/asm/cmpxchg.h
+++ b/arch/parisc/include/asm/cmpxchg.h
@@ -52,8 +52,7 @@ extern void __cmpxchg_called_with_bad_pointer(void);
 /* __cmpxchg_u32/u64 defined in arch/parisc/lib/bitops.c */
 extern unsigned long __cmpxchg_u32(volatile unsigned int *m, unsigned int old,
 				   unsigned int new_);
-extern unsigned long __cmpxchg_u64(volatile unsigned long *ptr,
-				   unsigned long old, unsigned long new_);
+extern u64 __cmpxchg_u64(volatile u64 *ptr, u64 old, u64 new_);
 
 /* don't worry...optimizer will get rid of most of this */
 static inline unsigned long
@@ -61,7 +60,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new_, int size)
 {
 	switch (size) {
 #ifdef CONFIG_64BIT
-	case 8: return __cmpxchg_u64((unsigned long *)ptr, old, new_);
+	case 8: return __cmpxchg_u64((u64 *)ptr, old, new_);
 #endif
 	case 4: return __cmpxchg_u32((unsigned int *)ptr,
 				     (unsigned int)old, (unsigned int)new_);
@@ -86,7 +85,7 @@ static inline unsigned long __cmpxchg_local(volatile void *ptr,
 {
 	switch (size) {
 #ifdef CONFIG_64BIT
-	case 8:	return __cmpxchg_u64((unsigned long *)ptr, old, new_);
+	case 8:	return __cmpxchg_u64((u64 *)ptr, old, new_);
 #endif
 	case 4:	return __cmpxchg_u32(ptr, old, new_);
 	default:
@@ -111,4 +110,6 @@ static inline unsigned long __cmpxchg_local(volatile void *ptr,
 #define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
 #endif
 
+#define cmpxchg64(ptr, o, n) __cmpxchg_u64(ptr, o, n)
+
 #endif /* _ASM_PARISC_CMPXCHG_H_ */
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 400acac0..368ca2b 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -38,6 +34,18 @@
 
 static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
 
+#ifndef CONFIG_64BIT
+/*
+ * The processor-internal cycle counter (Control Register 16) is used as time
+ * source for the sched_clock() function.  This register is 64bit wide on a
+ * 64-bit kernel and 32bit on a 32-bit kernel. Since sched_clock() always
+ * requires a 64bit counter we emulate on the 32-bit kernel the higher 32bits
+ * with a per-cpu variable which we increase every time the counter
+ * wraps-around (which happens every ~4 secounds).
+ */
+static DEFINE_PER_CPU(unsigned long, cr16_high_32_bits);
+#endif
+
 /*
  * We keep time on PA-RISC Linux by using the Interval Timer which is
  * a pair of registers; one is read-only and one is write-only; both
@@ -108,6 +116,12 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	 */
 	mtctl(next_tick, 16);
 
+#if !defined(CONFIG_64BIT)
+	/* check for overflow on a 32bit kernel (every ~4 seconds). */
+	if (unlikely(next_tick < now))
+		this_cpu_inc(cr16_high_32_bits);
+#endif
+
 	/* Skip one clocktick on purpose if we missed next_tick.
 	 * The new CR16 must be "later" than current CR16 otherwise
 	 * itimer would not fire until CR16 wrapped - e.g 4 seconds
@@ -219,6 +233,12 @@ void __init start_cpu_itimer(void)
 	unsigned int cpu = smp_processor_id();
 	unsigned long next_tick = mfctl(16) + clocktick;
 
+#if defined(CONFIG_HAVE_UNSTABLE_SCHED_CLOCK) && defined(CONFIG_64BIT)
+	/* With multiple 64bit CPUs online, the cr16's are not syncronized. */
+	if (cpu != 0)
+		clear_sched_clock_stable();
+#endif
+
 	mtctl(next_tick, 16);		/* kick off Interval Timer (CR16) */
 
 	per_cpu(cpu_data, cpu).it_value = next_tick;
@@ -246,15 +266,52 @@ void read_persistent_clock(struct timespec *ts)
 	}
 }
 
+
+/*
+ * sched_clock() framework
+ */
+
+static u32 cyc2ns_mul __read_mostly;
+static u32 cyc2ns_shift __read_mostly;
+
+u64 sched_clock(void)
+{
+	u64 now;
+
+	/* Get current cycle counter (Control Register 16). */
+#ifdef CONFIG_64BIT
+	now = mfctl(16);
+#else
+	now = mfctl(16) + (((u64) this_cpu_read(cr16_high_32_bits)) << 32);
+#endif
+
+	/* return the value in ns (cycles_2_ns) */
+	return mul_u64_u32_shr(now, cyc2ns_mul, cyc2ns_shift);
+}
+
+
+/*
+ * timer interrupt and sched_clock() initialization
+ */
+
 void __init time_init(void)
 {
 	unsigned long current_cr16_khz;
 
+	current_cr16_khz = PAGE0->mem_10msec/10;  /* kHz */
 	clocktick = (100 * PAGE0->mem_10msec) / HZ;
 
+	/* calculate mult/shift values for cr16 */
+	clocks_calc_mult_shift(&cyc2ns_mul, &cyc2ns_shift, current_cr16_khz,
+				NSEC_PER_MSEC, 0);
+
+#if defined(CONFIG_HAVE_UNSTABLE_SCHED_CLOCK) && defined(CONFIG_64BIT)
+	/* At bootup only one 64bit CPU is online and cr16 is "stable" */
+	set_sched_clock_stable();
+#endif
+
 	start_cpu_itimer();	/* get CPU 0 started */
 
 	/* register at clocksource framework */
-	current_cr16_khz = PAGE0->mem_10msec/10;  /* kHz */
 	clocksource_register_khz(&clocksource_cr16, current_cr16_khz);
 }
diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
index 1871188..8e45b0a 100644
--- a/arch/parisc/lib/bitops.c
+++ b/arch/parisc/lib/bitops.c
@@ -55,11 +55,10 @@ unsigned long __xchg8(char x, char *ptr)
 }
 
 
-#ifdef CONFIG_64BIT
-unsigned long __cmpxchg_u64(volatile unsigned long *ptr, unsigned long old, unsigned long new)
+u64 __cmpxchg_u64(volatile u64 *ptr, u64 old, u64 new)
 {
 	unsigned long flags;
-	unsigned long prev;
+	u64 prev;
 
 	_atomic_spin_lock_irqsave(ptr, flags);
 	if ((prev = *ptr) == old)
@@ -67,7 +66,6 @@ unsigned long __cmpxchg_u64(volatile unsigned long *ptr, unsigned long old, unsi
 	_atomic_spin_unlock_irqrestore(ptr, flags);
 	return prev;
 }
-#endif
 
 unsigned long __cmpxchg_u32(volatile unsigned int *ptr, unsigned int old, unsigned int new)
 {
