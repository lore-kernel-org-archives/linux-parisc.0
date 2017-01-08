From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Enhance detection if cr16 clocksources are
 synchronous
Date: Sun, 8 Jan 2017 11:01:11 +0100
Message-ID: <20170108100111.GA5340@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The cr16 clocks of the CPUs are usually not synchron.  Nevertheless, it seems
that each socket (with two cores) of a C8000 workstation is fed by the same
clock source, which makes the cr16 clocks of each socket syncron. Let's try to
detect such situations and mark the cr16 clocksource and the sched_clock stable
on single-socket and single-core machines.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index a3661ee..ea4e6ae 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -103,6 +103,8 @@ struct cpuinfo_parisc {
 	unsigned long bh_count;     /* number of times bh was invoked */
 	unsigned long fp_rev;
 	unsigned long fp_model;
+	unsigned long cpu_num;      /* CPU number from PAT firmware */
+	unsigned long cpu_loc;      /* CPU location from PAT firmware */
 	unsigned int state;
 	struct parisc_device *dev;
 	unsigned long loops_per_jiffy;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 85de47f..b1f33d7 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -94,7 +94,7 @@ static int processor_probe(struct parisc_device *dev)
 	unsigned long txn_addr;
 	unsigned long cpuid;
 	struct cpuinfo_parisc *p;
-	struct pdc_pat_cpu_num cpu_info __maybe_unused;
+	struct pdc_pat_cpu_num cpu_info = { };
 
 #ifdef CONFIG_SMP
 	if (num_online_cpus() >= nr_cpu_ids) {
@@ -180,6 +180,8 @@ static int processor_probe(struct parisc_device *dev)
 	p->hpa = dev->hpa.start;	/* save CPU hpa */
 	p->cpuid = cpuid;	/* save CPU id */
 	p->txn_addr = txn_addr;	/* save CPU IRQ address */
+	p->cpu_num = cpu_info.cpu_num;
+	p->cpu_loc = cpu_info.cpu_loc;
 #ifdef CONFIG_SMP
 	/*
 	** FIXME: review if any other initialization is clobbered
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 1e22f98..3138de7 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -242,14 +242,30 @@ void __init time_init(void)
 static int __init init_cr16_clocksource(void)
 {
 	/*
-	 * The cr16 interval timers are not syncronized across CPUs, so mark
-	 * them unstable and lower rating on SMP systems.
+	 * The cr16 interval timers are not syncronized across CPUs on
+	 * different sockets, so mark them unstable and lower rating on
+	 * multi-socket SMP systems.
 	 */
 	if (num_online_cpus() > 1) {
-		clocksource_cr16.flags = CLOCK_SOURCE_UNSTABLE;
-		clocksource_cr16.rating = 0;
+		int cpu;
+		unsigned long cpu0_loc;
+		cpu0_loc = per_cpu(cpu_data, 0).cpu_loc;
+
+		for_each_online_cpu(cpu) {
+			if (cpu0_loc &&
+			    cpu0_loc == per_cpu(cpu_data, cpu).cpu_loc)
+				continue;
+
+			clocksource_cr16.flags = CLOCK_SOURCE_UNSTABLE;
+			clocksource_cr16.rating = 0;
+			break;
+		}
 	}
 
+	/* mark sched_clock stable if cr16 clocks are in sync */
+	if (clocksource_cr16.flags == CLOCK_SOURCE_IS_CONTINUOUS)
+		set_sched_clock_stable();
+
 	/* register at clocksource framework */
 	clocksource_register_hz(&clocksource_cr16,
 		100 * PAGE0->mem_10msec);
