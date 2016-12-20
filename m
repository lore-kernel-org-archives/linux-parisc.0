From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Optimize timer interrupt function
Date: Tue, 20 Dec 2016 20:51:10 +0100
Message-ID: <20161220195110.GA20229@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Restructure the timer interrupt function to better cope with missed timer irqs.
Optimize the calculation when the next interrupt should happen and skip irqs if
they would happen too shortly after exit of the irq function.

The update_process_times() call is done anyway at every timer irq, so we can
safely drop the prof_counter and prof_multiplier variables from the per_cpu
structure. 

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 2e674e1..e439630 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -93,9 +93,7 @@ struct system_cpuinfo_parisc {
 /* Per CPU data structure - ie varies per CPU.  */
 struct cpuinfo_parisc {
 	unsigned long it_value;     /* Interval Timer at last timer Intr */
-	unsigned long it_delta;     /* Interval delta (tic_10ms / HZ * 100) */
 	unsigned long irq_count;    /* number of IRQ's since boot */
-	unsigned long irq_max_cr16; /* longest time to handle a single IRQ */
 	unsigned long cpuid;        /* aka slot_number or set to NO_PROC_ID */
 	unsigned long hpa;          /* Host Physical address */
 	unsigned long txn_addr;     /* MMIO addr of EIR or id_eid */
@@ -103,8 +101,6 @@ struct cpuinfo_parisc {
 	unsigned long pending_ipi;  /* bitmap of type ipi_message_type */
 #endif
 	unsigned long bh_count;     /* number of times bh was invoked */
-	unsigned long prof_counter; /* per CPU profiling support */
-	unsigned long prof_multiplier;	/* per CPU profiling support */
 	unsigned long fp_rev;
 	unsigned long fp_model;
 	unsigned int state;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index c1c08b5..85de47f 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -78,11 +78,6 @@ DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
 static void
 init_percpu_prof(unsigned long cpunum)
 {
-	struct cpuinfo_parisc *p;
-
-	p = &per_cpu(cpu_data, cpunum);
-	p->prof_counter = 1;
-	p->prof_multiplier = 1;
 }
 
 
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 325f30d..66cbab4 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -59,10 +59,9 @@ static unsigned long clocktick __read_mostly;	/* timer cycles per tick */
  */
 irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 {
-	unsigned long now, now2;
+	unsigned long now;
 	unsigned long next_tick;
-	unsigned long cycles_elapsed, ticks_elapsed = 1;
-	unsigned long cycles_remainder;
+	unsigned long ticks_elapsed = 0;
 	unsigned int cpu = smp_processor_id();
 	struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
 
@@ -71,102 +70,49 @@ irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
 
 	profile_tick(CPU_PROFILING);
 
-	/* Initialize next_tick to the expected tick time. */
+	/* Initialize next_tick to the old expected tick time. */
 	next_tick = cpuinfo->it_value;
 
-	/* Get current cycle counter (Control Register 16). */
-	now = mfctl(16);
-
-	cycles_elapsed = now - next_tick;
-
-	if ((cycles_elapsed >> 6) < cpt) {
-		/* use "cheap" math (add/subtract) instead
-		 * of the more expensive div/mul method
-		 */
-		cycles_remainder = cycles_elapsed;
-		while (cycles_remainder > cpt) {
-			cycles_remainder -= cpt;
-			ticks_elapsed++;
-		}
-	} else {
-		/* TODO: Reduce this to one fdiv op */
-		cycles_remainder = cycles_elapsed % cpt;
-		ticks_elapsed += cycles_elapsed / cpt;
-	}
-
-	/* convert from "division remainder" to "remainder of clock tick" */
-	cycles_remainder = cpt - cycles_remainder;
-
-	/* Determine when (in CR16 cycles) next IT interrupt will fire.
-	 * We want IT to fire modulo clocktick even if we miss/skip some.
-	 * But those interrupts don't in fact get delivered that regularly.
-	 */
-	next_tick = now + cycles_remainder;
+	/* Calculate how many ticks have elapsed. */
+	do {
+		++ticks_elapsed;
+		next_tick += cpt;
+		now = mfctl(16);
+	} while (next_tick - now > cpt);
 
+	/* Store (in CR16 cycles) up to when we are accounting right now. */
 	cpuinfo->it_value = next_tick;
 
-	/* Program the IT when to deliver the next interrupt.
-	 * Only bottom 32-bits of next_tick are writable in CR16!
-	 */
-	mtctl(next_tick, 16);
+	/* Go do system house keeping. */
+	if (cpu == 0)
+		xtime_update(ticks_elapsed);
+
+	update_process_times(user_mode(get_irq_regs()));
 
-	/* Skip one clocktick on purpose if we missed next_tick.
+	/* Skip clockticks on purpose if we know we would miss those.
 	 * The new CR16 must be "later" than current CR16 otherwise
 	 * itimer would not fire until CR16 wrapped - e.g 4 seconds
 	 * later on a 1Ghz processor. We'll account for the missed
-	 * tick on the next timer interrupt.
+	 * ticks on the next timer interrupt.
+	 * We want IT to fire modulo clocktick even if we miss/skip some.
+	 * But those interrupts don't in fact get delivered that regularly.
 	 *
 	 * "next_tick - now" will always give the difference regardless
 	 * if one or the other wrapped. If "now" is "bigger" we'll end up
 	 * with a very large unsigned number.
 	 */
-	now2 = mfctl(16);
-	if (next_tick - now2 > cpt)
-		mtctl(next_tick+cpt, 16);
+	while (next_tick - mfctl(16) > cpt)
+		next_tick += cpt;
 
-#if 1
-/*
- * GGG: DEBUG code for how many cycles programming CR16 used.
- */
-	if (unlikely(now2 - now > 0x3000)) 	/* 12K cycles */
-		printk (KERN_CRIT "timer_interrupt(CPU %d): SLOW! 0x%lx cycles!"
-			" cyc %lX rem %lX "
-			" next/now %lX/%lX\n",
-			cpu, now2 - now, cycles_elapsed, cycles_remainder,
-			next_tick, now );
-#endif
-
-	/* Can we differentiate between "early CR16" (aka Scenario 1) and
-	 * "long delay" (aka Scenario 3)? I don't think so.
-	 *
-	 * Timer_interrupt will be delivered at least a few hundred cycles
-	 * after the IT fires. But it's arbitrary how much time passes
-	 * before we call it "late". I've picked one second.
-	 *
-	 * It's important NO printk's are between reading CR16 and
-	 * setting up the next value. May introduce huge variance.
-	 */
-	if (unlikely(ticks_elapsed > HZ)) {
-		/* Scenario 3: very long delay?  bad in any case */
-		printk (KERN_CRIT "timer_interrupt(CPU %d): delayed!"
-			" cycles %lX rem %lX "
-			" next/now %lX/%lX\n",
-			cpu,
-			cycles_elapsed, cycles_remainder,
-			next_tick, now );
-	}
-
-	/* Done mucking with unreliable delivery of interrupts.
-	 * Go do system house keeping.
+	/* Program the IT when to deliver the next interrupt.
+	 * Only bottom 32-bits of next_tick are writable in CR16!
+	 * Timer interrupt will be delivered at least a few hundred cycles
+	 * after the IT fires, so if we are too close (<= 500 cycles) to the
+	 * next cycle, simply skip it.
 	 */
-
-	if (!--cpuinfo->prof_counter) {
-		cpuinfo->prof_counter = cpuinfo->prof_multiplier;
-		update_process_times(user_mode(get_irq_regs()));
-	}
