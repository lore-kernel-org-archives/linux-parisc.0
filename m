From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Replace NR_CPUS in parisc code
Date: Tue, 30 Dec 2008 23:12:10 +0100
Message-ID: <495A9CBA.4010003@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc: Replace most arrays sized by NR_CPUS with percpu variables.

Signed-off-by: Helge Deller <deller@gmx.de>

 include/asm/processor.h |    4 +-
 kernel/irq.c            |    9 +++---
 kernel/perf.c           |    4 +-
 kernel/processor.c      |   68 ++++++++++++++++++++++++------------------------
 kernel/setup.c          |    6 ++--
 kernel/smp.c            |   24 +++++++++-------
 kernel/time.c           |    4 +-
 kernel/topology.c       |    4 +-
 8 files changed, 64 insertions(+), 59 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 3c9d348..9d64df8 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -17,6 +17,7 @@
 #include <asm/ptrace.h>
 #include <asm/types.h>
 #include <asm/system.h>
+#include <asm/percpu.h>
 #endif /* __ASSEMBLY__ */
 
 #define KERNEL_STACK_SIZE 	(4*PAGE_SIZE)
@@ -109,8 +110,7 @@ struct cpuinfo_parisc {
 };
 
 extern struct system_cpuinfo_parisc boot_cpu_data;
-extern struct cpuinfo_parisc cpu_data[NR_CPUS];
-#define current_cpu_data cpu_data[smp_processor_id()]
+DECLARE_PER_CPU(struct cpuinfo_parisc, cpu_data);
 
 #define CPU_HVERSION ((boot_cpu_data.hversion >> 4) & 0x0FFF)
 
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 23ef950..3ee6b33 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -298,7 +298,7 @@ unsigned long txn_affinity_addr(unsigned int irq, int cpu)
 	irq_desc[irq].affinity = cpumask_of_cpu(cpu);
 #endif
 
-	return cpu_data[cpu].txn_addr;
+	return per_cpu(cpu_data, cpu).txn_addr;
 }
 
 
@@ -309,8 +309,9 @@ unsigned long txn_alloc_addr(unsigned int virt_irq)
 	next_cpu++; /* assign to "next" CPU we want this bugger on */
 
 	/* validate entry */
-	while ((next_cpu < NR_CPUS) && (!cpu_data[next_cpu].txn_addr || 
-		!cpu_online(next_cpu)))
+	while ((next_cpu < NR_CPUS) &&
+		(!per_cpu(cpu_data, next_cpu).txn_addr ||
+		 !cpu_online(next_cpu)))
 		next_cpu++;
 
 	if (next_cpu >= NR_CPUS) 
@@ -359,7 +360,7 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 		printk(KERN_DEBUG "redirecting irq %d from CPU %d to %d\n",
 		       irq, smp_processor_id(), cpu);
 		gsc_writel(irq + CPU_IRQ_BASE,
-			   cpu_data[cpu].hpa);
+			   per_cpu(cpu_data, cpu).hpa);
 		goto set_out;
 	}
 #endif
diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index f696f57..75099ef 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -541,9 +541,9 @@ static int __init perf_init(void)
 	spin_lock_init(&perf_lock);
 
 	/* TODO: this only lets us access the first cpu.. what to do for SMP? */
-	cpu_device = cpu_data[0].dev;
+	cpu_device = per_cpu(cpu_data, 0).dev;
 	printk("Performance monitoring counters enabled for %s\n",
-		cpu_data[0].dev->name);
+		per_cpu(cpu_data, 0).dev->name);
 
 	return 0;
 }
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 370086f..ecb6093 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -3,7 +3,7 @@
  *    Initial setup-routines for HP 9000 based hardware.
  *
  *    Copyright (C) 1991, 1992, 1995  Linus Torvalds
- *    Modifications for PA-RISC (C) 1999 Helge Deller <deller@gmx.de>
+ *    Modifications for PA-RISC (C) 1999-2008 Helge Deller <deller@gmx.de>
  *    Modifications copyright 1999 SuSE GmbH (Philipp Rumpf)
  *    Modifications copyright 2000 Martin K. Petersen <mkp@mkp.net>
  *    Modifications copyright 2000 Philipp Rumpf <prumpf@tux.org>
@@ -46,7 +46,7 @@
 struct system_cpuinfo_parisc boot_cpu_data __read_mostly;
 EXPORT_SYMBOL(boot_cpu_data);
 
-struct cpuinfo_parisc cpu_data[NR_CPUS] __read_mostly;
+DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
 
 extern int update_cr16_clocksource(void);	/* from time.c */
 
@@ -69,6 +69,23 @@ extern int update_cr16_clocksource(void);	/* from time.c */
 */
 
 /**
+ * init_cpu_profiler - enable/setup per cpu profiling hooks.
+ * @cpunum: The processor instance.
+ *
+ * FIXME: doesn't do much yet...
+ */
+static void __cpuinit
+init_percpu_prof(unsigned long cpunum)
+{
+	struct cpuinfo_parisc *p;
+
+	p = &per_cpu(cpu_data, cpunum);
+	p->prof_counter = 1;
+	p->prof_multiplier = 1;
+}
+
+
+/**
  * processor_probe - Determine if processor driver should claim this device.
  * @dev: The device which has been found.
  *
@@ -147,7 +164,7 @@ static int __cpuinit processor_probe(struct parisc_device *dev)
 	}
 #endif
 
-	p = &cpu_data[cpuid];
+	p = &per_cpu(cpu_data, cpuid);
 	boot_cpu_data.cpu_count++;
 
 	/* initialize counters - CPU 0 gets it_value set in time_init() */
@@ -162,12 +179,9 @@ static int __cpuinit processor_probe(struct parisc_device *dev)
 #ifdef CONFIG_SMP
 	/*
 	** FIXME: review if any other initialization is clobbered
-	**	for boot_cpu by the above memset().
+	**	  for boot_cpu by the above memset().
 	*/
-
-	/* stolen from init_percpu_prof() */
-	cpu_data[cpuid].prof_counter = 1;
-	cpu_data[cpuid].prof_multiplier = 1;
+	init_percpu_prof(cpuid);
 #endif
 
 	/*
@@ -261,19 +275,6 @@ void __init collect_boot_cpu_data(void)
 }
 
 
-/**
- * init_cpu_profiler - enable/setup per cpu profiling hooks.
- * @cpunum: The processor instance.
- *
- * FIXME: doesn't do much yet...
- */
-static inline void __init
-init_percpu_prof(int cpunum)
-{
-	cpu_data[cpunum].prof_counter = 1;
-	cpu_data[cpunum].prof_multiplier = 1;
-}
-
 
 /**
  * init_per_cpu - Handle individual processor initializations.
@@ -293,7 +294,7 @@ init_percpu_prof(int cpunum)
  *
  * o Enable CPU profiling hooks.
  */
-int __init init_per_cpu(int cpunum)
+int __cpuinit init_per_cpu(int cpunum)
 {
 	int ret;
 	struct pdc_coproc_cfg coproc_cfg;
@@ -307,8 +308,8 @@ int __init init_per_cpu(int cpunum)
 		/* FWIW, FP rev/model is a more accurate way to determine
 		** CPU type. CPU rev/model has some ambiguous cases.
 		*/
-		cpu_data[cpunum].fp_rev = coproc_cfg.revision;
-		cpu_data[cpunum].fp_model = coproc_cfg.model;
+		per_cpu(cpu_data, cpunum).fp_rev = coproc_cfg.revision;
+		per_cpu(cpu_data, cpunum).fp_model = coproc_cfg.model;
 
 		printk(KERN_INFO  "FP[%d] enabled: Rev %ld Model %ld\n",
 			cpunum, coproc_cfg.revision, coproc_cfg.model);
@@ -344,16 +345,17 @@ int __init init_per_cpu(int cpunum)
 int
 show_cpuinfo (struct seq_file *m, void *v)
 {
-	int	n;
+	unsigned long cpu;
 
-	for(n=0; n<boot_cpu_data.cpu_count; n++) {
+	for_each_online_cpu(cpu) {
+		const struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
 #ifdef CONFIG_SMP
-		if (0 == cpu_data[n].hpa)
+		if (0 == cpuinfo->hpa)
 			continue;
 #endif
-		seq_printf(m, "processor\t: %d\n"
+		seq_printf(m, "processor\t: %lu\n"
 				"cpu family\t: PA-RISC %s\n",
-				 n, boot_cpu_data.family_name);
+				 cpu, boot_cpu_data.family_name);
 
 		seq_printf(m, "cpu\t\t: %s\n",  boot_cpu_data.cpu_name );
 
@@ -365,8 +367,8 @@ show_cpuinfo (struct seq_file *m, void *v)
 		seq_printf(m, "model\t\t: %s\n"
 				"model name\t: %s\n",
 				 boot_cpu_data.pdc.sys_model_name,
-				 cpu_data[n].dev ? 
-				 cpu_data[n].dev->name : "Unknown" );
+				 cpuinfo->dev ?
+				 cpuinfo->dev->name : "Unknown");
 
 		seq_printf(m, "hversion\t: 0x%08x\n"
 			        "sversion\t: 0x%08x\n",
@@ -377,8 +379,8 @@ show_cpuinfo (struct seq_file *m, void *v)
 		show_cache_info(m);
 
 		seq_printf(m, "bogomips\t: %lu.%02lu\n",
-			     cpu_data[n].loops_per_jiffy / (500000 / HZ),
-			     (cpu_data[n].loops_per_jiffy / (5000 / HZ)) % 100);
+			     cpuinfo->loops_per_jiffy / (500000 / HZ),
+			     (cpuinfo->loops_per_jiffy / (5000 / HZ)) % 100);
 
 		seq_printf(m, "software id\t: %ld\n\n",
 				boot_cpu_data.pdc.model.sw_id);
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 7d27853..5bfd9c7 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -321,7 +321,7 @@ static int __init parisc_init(void)
 	
 	processor_init();
 	printk(KERN_INFO "CPU(s): %d x %s at %d.%06d MHz\n",
-			boot_cpu_data.cpu_count,
+			num_present_cpus(),
 			boot_cpu_data.cpu_name,
 			boot_cpu_data.cpu_hz / 1000000,
 			boot_cpu_data.cpu_hz % 1000000	);
@@ -387,8 +387,8 @@ void start_parisc(void)
 	if (ret >= 0 && coproc_cfg.ccr_functional) {
 		mtctl(coproc_cfg.ccr_functional, 10);
 
-		cpu_data[cpunum].fp_rev = coproc_cfg.revision;
-		cpu_data[cpunum].fp_model = coproc_cfg.model;
+		per_cpu(cpu_data, cpunum).fp_rev = coproc_cfg.revision;
+		per_cpu(cpu_data, cpunum).fp_model = coproc_cfg.model;
 
 		asm volatile ("fstd	%fr0,8(%sp)");
 	} else {
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index d47f397..148667e 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -56,16 +56,17 @@ static int smp_debug_lvl = 0;
 		if (lvl >= smp_debug_lvl)	\
 			printk(printargs);
 #else
-#define smp_debug(lvl, ...)
+#define smp_debug(lvl, ...)	do { } while(0)
 #endif /* DEBUG_SMP */
 
 DEFINE_SPINLOCK(smp_lock);
 
 volatile struct task_struct *smp_init_current_idle_task;
 
-static volatile int cpu_now_booting __read_mostly = 0;	/* track which CPU is booting */
+/* track which CPU is booting */
+static volatile int cpu_now_booting __cpuinitdata;
 
-static int parisc_max_cpus __read_mostly = 1;
+static int parisc_max_cpus __cpuinitdata = 1;
 
 /* online cpus are ones that we've managed to bring up completely
  * possible cpus are all valid cpu 
@@ -138,7 +139,7 @@ irqreturn_t
 ipi_interrupt(int irq, void *dev_id) 
 {
 	int this_cpu = smp_processor_id();
-	struct cpuinfo_parisc *p = &cpu_data[this_cpu];
+	struct cpuinfo_parisc *p = &per_cpu(cpu_data, this_cpu);
 	unsigned long ops;
 	unsigned long flags;
 
@@ -217,13 +218,13 @@ ipi_interrupt(int irq, void *dev_id)
 static inline void
 ipi_send(int cpu, enum ipi_message_type op)
 {
-	struct cpuinfo_parisc *p = &cpu_data[cpu];
+	struct cpuinfo_parisc *p = &per_cpu(cpu_data, cpu);
 	spinlock_t *lock = &per_cpu(ipi_lock, cpu);
 	unsigned long flags;
 
 	spin_lock_irqsave(lock, flags);
 	p->pending_ipi |= 1 << op;
-	gsc_writel(IPI_IRQ - CPU_IRQ_BASE, cpu_data[cpu].hpa);
+	gsc_writel(IPI_IRQ - CPU_IRQ_BASE, p->hpa);
 	spin_unlock_irqrestore(lock, flags);
 }
 
@@ -360,6 +357,7 @@ void __init smp_callin(void)
  */
 int __cpuinit smp_boot_one_cpu(int cpuid)
 {
+	const struct cpuinfo_parisc *p = &per_cpu(cpu_data, cpuid);
 	struct task_struct *idle;
 	long timeout;
 
@@ -391,7 +389,7 @@ int __cpuinit smp_boot_one_cpu(int cpuid)
 	smp_init_current_idle_task = idle ;
 	mb();
 
-	printk("Releasing cpu %d now, hpa=%lx\n", cpuid, cpu_data[cpuid].hpa);
+	printk(KERN_INFO "Releasing cpu %d now, hpa=%lx\n", cpuid, p->hpa);
 
 	/*
 	** This gets PDC to release the CPU from a very tight loop.
@@ -402,7 +400,7 @@ int __cpuinit smp_boot_one_cpu(int cpuid)
 	** EIR{0}). MEM_RENDEZ is valid only when it is nonzero and the 
 	** contents of memory are valid."
 	*/
-	gsc_writel(TIMER_IRQ - CPU_IRQ_BASE, cpu_data[cpuid].hpa);
+	gsc_writel(TIMER_IRQ - CPU_IRQ_BASE, p->hpa);
 	mb();
 
 	/* 
@@ -434,12 +432,12 @@ alive:
 	return 0;
 }
 
-void __devinit smp_prepare_boot_cpu(void)
+void __init smp_prepare_boot_cpu(void)
 {
-	int bootstrap_processor=cpu_data[0].cpuid;	/* CPU ID of BSP */
+	int bootstrap_processor = per_cpu(cpu_data, 0).cpuid;
 
 	/* Setup BSP mappings */
-	printk("SMP: bootstrap CPU ID is %d\n",bootstrap_processor);
+	printk(KERN_INFO "SMP: bootstrap CPU ID is %d\n", bootstrap_processor);
 
 	cpu_set(bootstrap_processor, cpu_online_map);
 	cpu_set(bootstrap_processor, cpu_present_map);
diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 4d09203..9d46c43 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -60,7 +60,7 @@ irqreturn_t timer_interrupt(int irq, void *dev_id)
 	unsigned long cycles_elapsed, ticks_elapsed;
 	unsigned long cycles_remainder;
 	unsigned int cpu = smp_processor_id();
-	struct cpuinfo_parisc *cpuinfo = &cpu_data[cpu];
+	struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
 
 	/* gcc can optimize for "read-only" case with a local clocktick */
 	unsigned long cpt = clocktick;
@@ -213,7 +213,7 @@ void __init start_cpu_itimer(void)
 
 	mtctl(next_tick, 16);		/* kick off Interval Timer (CR16) */
 
-	cpu_data[cpu].it_value = next_tick;
+	per_cpu(cpu_data, cpu).it_value = next_tick;
 }
 
 struct platform_device rtc_parisc_dev = {
diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
index d71cb01..f515938 100644
--- a/arch/parisc/kernel/topology.c
+++ b/arch/parisc/kernel/topology.c
@@ -22,14 +22,14 @@
 #include <linux/cpu.h>
 #include <linux/cache.h>
 
-static struct cpu cpu_devices[NR_CPUS] __read_mostly;
+static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
 static int __init topology_init(void)
 {
 	int num;
 
 	for_each_present_cpu(num) {
-		register_cpu(&cpu_devices[num], num);
+		register_cpu(&per_cpu(cpu_devices, num), num);
 	}
 	return 0;
 }

