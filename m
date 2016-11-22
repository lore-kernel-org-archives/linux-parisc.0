From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Switch to GENERIC_SCHED_CLOCK implementation
Date: Tue, 22 Nov 2016 18:08:30 +0100
Message-ID: <20161122170830.GA4045@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Drop the open-coded sched_clock() function and replace it by the provided
GENERIC_SCHED_CLOCK implementation.  We have seen quite some hung tasks in the
past, which seem to be fixed by this patch.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 71c4a3a..05c8980 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -34,7 +34,8 @@ config PARISC
 	select HAVE_ARCH_HASH
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
-	select HAVE_UNSTABLE_SCHED_CLOCK if (SMP || !64BIT)
+	select GENERIC_SCHED_CLOCK
+	select HAVE_UNSTABLE_SCHED_CLOCK if SMP
 	select ARCH_NO_COHERENT_DMA_MMAP
 	select CPU_NO_EFFICIENT_FFS
 
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 9b63b87..325f30d 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/rtc.h>
 #include <linux/sched.h>
+#include <linux/sched_clock.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/string.h>
@@ -39,18 +40,6 @@
 
 static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
 
-#ifndef CONFIG_64BIT
-/*
- * The processor-internal cycle counter (Control Register 16) is used as time
- * source for the sched_clock() function.  This register is 64bit wide on a
- * 64-bit kernel and 32bit on a 32-bit kernel. Since sched_clock() always
- * requires a 64bit counter we emulate on the 32-bit kernel the higher 32bits
- * with a per-cpu variable which we increase every time the counter
- * wraps-around (which happens every ~4 secounds).
- */
-static DEFINE_PER_CPU(unsigned long, cr16_high_32_bits);
-#endif
-
 /*
  * We keep time on PA-RISC Linux by using the Interval Timer which is
  * a pair of registers; one is read-only and one is write-only; both
@@ -121,12 +110,6 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 	 */
 	mtctl(next_tick, 16);
 
-#if !defined(CONFIG_64BIT)
-	/* check for overflow on a 32bit kernel (every ~4 seconds). */
-	if (unlikely(next_tick < now))
-		this_cpu_inc(cr16_high_32_bits);
-#endif
-
 	/* Skip one clocktick on purpose if we missed next_tick.
 	 * The new CR16 must be "later" than current CR16 otherwise
 	 * itimer would not fire until CR16 wrapped - e.g 4 seconds
@@ -208,7 +191,7 @@ EXPORT_SYMBOL(profile_pc);
 
 /* clock source code */
 
-static cycle_t read_cr16(struct clocksource *cs)
+static cycle_t notrace read_cr16(struct clocksource *cs)
 {
 	return get_cycles();
 }
@@ -287,26 +270,9 @@ void read_persistent_clock(struct timespec *ts)
 }
 
 
-/*
- * sched_clock() framework
- */
-
-static u32 cyc2ns_mul __read_mostly;
-static u32 cyc2ns_shift __read_mostly;
-
-u64 sched_clock(void)
+static u64 notrace read_cr16_sched_clock(void)
 {
-	u64 now;
-
-	/* Get current cycle counter (Control Register 16). */
-#ifdef CONFIG_64BIT
-	now = mfctl(16);
-#else
-	now = mfctl(16) + (((u64) this_cpu_read(cr16_high_32_bits)) << 32);
-#endif
-
-	/* return the value in ns (cycles_2_ns) */
-	return mul_u64_u32_shr(now, cyc2ns_mul, cyc2ns_shift);
+	return get_cycles();
 }
 
 
@@ -316,17 +282,16 @@ u64 sched_clock(void)
 
 void __init time_init(void)
 {
-	unsigned long current_cr16_khz;
+	unsigned long cr16_hz;
 
-	current_cr16_khz = PAGE0->mem_10msec/10;  /* kHz */
 	clocktick = (100 * PAGE0->mem_10msec) / HZ;
-
-	/* calculate mult/shift values for cr16 */
-	clocks_calc_mult_shift(&cyc2ns_mul, &cyc2ns_shift, current_cr16_khz,
-				NSEC_PER_MSEC, 0);
