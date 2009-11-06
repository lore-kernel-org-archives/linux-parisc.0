From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 10/16] parisc: Replace old style lock init
Date: Fri, 06 Nov 2009 22:41:51 -0000
Message-ID: <20091106223806.803538964@linutronix.de>
References: <20091106223547.784916750@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>,
	Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

SPIN_LOCK_UNLOCKED is deprecated. Init the per cpu locks at runtime
instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/smp.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

Index: linux-2.6/arch/parisc/kernel/smp.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/smp.c
+++ linux-2.6/arch/parisc/kernel/smp.c
@@ -60,8 +60,6 @@ static int smp_debug_lvl = 0;
 #define smp_debug(lvl, ...)	do { } while(0)
 #endif /* DEBUG_SMP */
 
-DEFINE_SPINLOCK(smp_lock);
-
 volatile struct task_struct *smp_init_current_idle_task;
 
 /* track which CPU is booting */
@@ -69,7 +67,7 @@ static volatile int cpu_now_booting __cp
 
 static int parisc_max_cpus __cpuinitdata = 1;
 
-DEFINE_PER_CPU(spinlock_t, ipi_lock) = SPIN_LOCK_UNLOCKED;
+static DEFINE_PER_CPU(spinlock_t, ipi_lock);
 
 enum ipi_message_type {
 	IPI_NOP=0,
@@ -438,6 +436,11 @@ void __init smp_prepare_boot_cpu(void)
 */
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		spin_lock_init(&per_cpu(ipi_lock, cpu));
+
 	init_cpu_present(cpumask_of(0));
 
 	parisc_max_cpus = max_cpus;


