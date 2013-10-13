From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: show backtrace for all cpus when using sysrq-l
Date: Sun, 13 Oct 2013 21:37:07 +0200
Message-ID: <20131013193707.GA15451@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Improve output when using sysrq-l command (show backtrace for all cpus).

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 1073599..99989ad 100644
--- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -49,4 +49,9 @@ extern int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest);
 /* soft power switch support (power.c) */
 extern struct tasklet_struct power_tasklet;
 
+#ifdef CONFIG_SMP
+void arch_trigger_all_cpu_backtrace(void);
+#define arch_trigger_all_cpu_backtrace arch_trigger_all_cpu_backtrace
+#endif
+
 #endif	/* _ASM_PARISC_IRQ_H */
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 2e6443b..2e66892 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -615,3 +615,44 @@ void __init init_IRQ(void)
 #endif
         set_eiem(cpu_eiem);	/* EIEM : enable all external intr */
 }
+
+
+
+/*
+ * Backtrace of all CPUs via IPI. Used when sending sysrq-l.  
+ */
+
+#ifdef arch_trigger_all_cpu_backtrace
+static DECLARE_BITMAP(backtrace_mask, NR_CPUS) __read_mostly;
+
+static void smp_call_func_backtrace(void *info)
+{
+	int cpu;
+	cpu = smp_processor_id();
+
+	if (cpumask_test_cpu(cpu, to_cpumask(backtrace_mask))) {
+		static arch_spinlock_t lock = __ARCH_SPIN_LOCK_UNLOCKED;
+
+		arch_spin_lock(&lock);
+		pr_warn("IPI backtrace for cpu %d\n", cpu);
+		/* show_regs(get_irq_regs()); */
+		show_stack(NULL, 0);
+		arch_spin_unlock(&lock);
+		cpumask_clear_cpu(cpu, to_cpumask(backtrace_mask));
+	}
+}
+
+void arch_trigger_all_cpu_backtrace(void)
+{
+	unsigned long flags;
+
+	cpumask_copy(to_cpumask(backtrace_mask), cpu_online_mask);
+
+	pr_info("sending IPI to all CPUs:\n");
+	local_irq_save(flags);
+	local_irq_enable();
+	on_each_cpu(smp_call_func_backtrace, NULL, 0);
+	local_irq_restore(flags);
+}
+#endif
+
