From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: make udelay() SMP-safe
Date: Wed, 23 Oct 2013 23:29:16 +0200
Message-ID: <20131023212916.GA1529@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Each CPU has it's own Control Register 16 (CR16) which is used as time source
for the udelay() function. But since the CR16 registers across different CPUs
are not synced, we need to recalculate the loop count if we get switched away
to ensure that we really delay as much time as requested.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/delay.h b/arch/parisc/include/asm/delay.h
index 912ee7e..08e58e6 100644
--- a/arch/parisc/include/asm/delay.h
+++ b/arch/parisc/include/asm/delay.h
@@ -1,15 +1,5 @@
-#ifndef _PARISC_DELAY_H
-#define _PARISC_DELAY_H
-
-#include <asm/special_insns.h>    /* for mfctl() */
-#include <asm/processor.h> /* for boot_cpu_data */
-
-
-/*
- * Copyright (C) 1993 Linus Torvalds
- *
- * Delay routines
- */
+#ifndef _ASM_PARISC_DELAY_H
+#define _ASM_PARISC_DELAY_H
 
 static __inline__ void __delay(unsigned long loops) {
 	asm volatile(
@@ -19,25 +9,14 @@ static __inline__ void __delay(unsigned long loops) {
 		: "=r" (loops) : "0" (loops));
 }
 
-static __inline__ void __cr16_delay(unsigned long clocks) {
-	unsigned long start;
-
-	/*
-	 * Note: Due to unsigned math, cr16 rollovers shouldn't be
-	 * a problem here. However, on 32 bit, we need to make sure
-	 * we don't pass in too big a value. The current default
-	 * value of MAX_UDELAY_MS should help prevent this.
-	 */
+extern void __udelay(unsigned long usecs);
+extern void __udelay_bad(unsigned long usecs);
 
-	start = mfctl(16);
-	while ((mfctl(16) - start) < clocks)
-	    ;
+static inline void udelay(unsigned long usecs)
+{
+	if (__builtin_constant_p(usecs) && (usecs) > 20000)
+		__udelay_bad(usecs);
+	__udelay(usecs);
 }
 
-static __inline__ void __udelay(unsigned long usecs) {
-	__cr16_delay(usecs * ((unsigned long)boot_cpu_data.cpu_hz / 1000000UL));
-}
-
-#define udelay(n) __udelay(n)
-
-#endif /* defined(_PARISC_DELAY_H) */
+#endif /* _ASM_PARISC_DELAY_H */
diff --git a/arch/parisc/lib/Makefile b/arch/parisc/lib/Makefile
index 5651536..8fa92b8 100644
--- a/arch/parisc/lib/Makefile
+++ b/arch/parisc/lib/Makefile
@@ -3,6 +3,6 @@
 #
 
 lib-y	:= lusercopy.o bitops.o checksum.o io.o memset.o fixup.o memcpy.o \
-	   ucmpdi2.o
+	   ucmpdi2.o delay.o
 
 obj-y	:= iomap.o
diff --git a/arch/parisc/lib/delay.c b/arch/parisc/lib/delay.c
new file mode 100644
index 0000000..b1fb528
--- /dev/null
+++ b/arch/parisc/lib/delay.c
@@ -0,0 +1,73 @@
+/*
+ *	Precise Delay Loops for parisc
+ *
+ *	based on code by:
+ *	Copyright (C) 1993 Linus Torvalds
+ *	Copyright (C) 1997 Martin Mares <mj@atrey.karlin.mff.cuni.cz>
+ *	Copyright (C) 2008 Jiri Hladky <hladky _dot_ jiri _at_ gmail _dot_ com>
+ *
+ *	parisc implementation:
+ *	Copyright (C) 2013 Helge Deller <deller@gmx.de>
+ */
+
+
+#include <linux/module.h>
+#include <linux/preempt.h>
+#include <linux/init.h>
+
+#include <asm/processor.h>
+#include <asm/delay.h>
+
+#include <asm/special_insns.h>    /* for mfctl() */
+#include <asm/processor.h> /* for boot_cpu_data */
+
+/* CR16 based delay: */
+static void __cr16_delay(unsigned long __loops)
+{
+	/*
+	 * Note: Due to unsigned math, cr16 rollovers shouldn't be
+	 * a problem here. However, on 32 bit, we need to make sure
+	 * we don't pass in too big a value. The current default
+	 * value of MAX_UDELAY_MS should help prevent this.
+	 */
+	u32 bclock, now, loops = __loops;
+	int cpu;
+
+	preempt_disable();
+	cpu = smp_processor_id();
+	bclock = mfctl(16);
+	for (;;) {
+		now = mfctl(16);
+		if ((now - bclock) >= loops)
+			break;
+
+		/* Allow RT tasks to run */
+		preempt_enable();
+		asm volatile("	nop\n");
+		barrier();
+		preempt_disable();
+
+		/*
+		 * It is possible that we moved to another CPU, and
+		 * since CR16's are per-cpu we need to calculate
+		 * that. The delay must guarantee that we wait "at
+		 * least" the amount of time. Being moved to another
+		 * CPU could make the wait longer but we just need to
+		 * make sure we waited long enough. Rebalance the
+		 * counter for this CPU.
+		 */
+		if (unlikely(cpu != smp_processor_id())) {
+			loops -= (now - bclock);
+			cpu = smp_processor_id();
+			bclock = mfctl(16);
+		}
+	}
+	preempt_enable();
+}
+
+
+void __udelay(unsigned long usecs)
+{
+	__cr16_delay(usecs * ((unsigned long)boot_cpu_data.cpu_hz / 1000000UL));
+}
+EXPORT_SYMBOL(__udelay);
