From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add CPU topology support
Date: Wed, 20 Sep 2017 21:20:18 +0200
Message-ID: <20170920192018.GA14837@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add topology support, including multi-core scheduler support on
PA8800/PA8900 CPUs and enhanced output in /proc/cpuinfo, e.g.
lscpu now reports on a single-socket, dual-core machine:

Architecture:          parisc64
CPU(s):                2
On-line CPU(s) list:   0,1
Thread(s) per core:    1
Core(s) per socket:    2
Socket(s):             1
CPU family:            PA-RISC 2.0
Model name:            PA8800 (Mako)

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index ba7b7dd..bb8ed34 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -31,6 +31,7 @@ config PARISC
 	select GENERIC_PCI_IOMAP
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select GENERIC_SMP_IDLE_THREAD
+	select GENERIC_CPU_DEVICES
 	select GENERIC_STRNCPY_FROM_USER
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_EXCEPTION_TRACE
@@ -275,6 +276,21 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config PARISC_CPU_TOPOLOGY
+	bool "Support cpu topology definition"
+	depends on SMP
+	default y
+	help
+	  Support PARISC cpu topology definition.
+
+config SCHED_MC
+	bool "Multi-core scheduler support"
+	depends on PARISC_CPU_TOPOLOGY && PA8X00
+	help
+	  Multi-core scheduler support improves the CPU scheduler's decision
+	  making when dealing with multi-core CPU chips at a cost of slightly
+	  increased overhead in some places. If unsure say N here.
+
 config IRQSTACKS
 	bool "Use separate kernel stacks when processing interrupts"
 	default y
diff --git a/arch/parisc/include/asm/topology.h b/arch/parisc/include/asm/topology.h
new file mode 100644
index 0000000..6f0750c
--- /dev/null
+++ b/arch/parisc/include/asm/topology.h
@@ -0,0 +1,36 @@
+#ifndef _ASM_PARISC_TOPOLOGY_H
+#define _ASM_PARISC_TOPOLOGY_H
+
+#ifdef CONFIG_PARISC_CPU_TOPOLOGY
+
+#include <linux/cpumask.h>
+
+struct cputopo_parisc {
+	int thread_id;
+	int core_id;
+	int socket_id;
+	cpumask_t thread_sibling;
+	cpumask_t core_sibling;
+};
+
+extern struct cputopo_parisc cpu_topology[NR_CPUS];
+
+#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
+#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
+#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
+#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
+
+void init_cpu_topology(void);
+void store_cpu_topology(unsigned int cpuid);
+const struct cpumask *cpu_coregroup_mask(int cpu);
+
+#else
+
+static inline void init_cpu_topology(void) { }
+static inline void store_cpu_topology(unsigned int cpuid) { }
+
+#endif
+
+#include <asm-generic/topology.h>
+
+#endif /* _ASM_ARM_TOPOLOGY_H */
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index c4294df..10b1b04 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -8,8 +8,7 @@ obj-y	     	:= cache.o pacache.o setup.o pdt.o traps.o time.o irq.o \
 		   pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
 		   ptrace.o hardware.o inventory.o drivers.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
-		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
-		   topology.o
+		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
@@ -29,5 +28,6 @@ obj-$(CONFIG_AUDIT)	+= audit.o
 obj64-$(CONFIG_AUDIT)	+= compat_audit.o
 # only supported for PCX-W/U in 64-bit mode at the moment
 obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o $(obj64-y)
+obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+= topology.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index a778bd3..2deadad 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -184,6 +184,9 @@ static int __init processor_probe(struct parisc_device *dev)
 	p->txn_addr = txn_addr;	/* save CPU IRQ address */
 	p->cpu_num = cpu_info.cpu_num;
 	p->cpu_loc = cpu_info.cpu_loc;
+
+	store_cpu_topology(cpuid);
+
 #ifdef CONFIG_SMP
 	/*
 	** FIXME: review if any other initialization is clobbered
@@ -388,6 +391,14 @@ show_cpuinfo (struct seq_file *m, void *v)
 				 boot_cpu_data.cpu_hz / 1000000,
 				 boot_cpu_data.cpu_hz % 1000000  );
 
+#ifdef CONFIG_PARISC_CPU_TOPOLOGY
+		seq_printf(m, "physical id\t: %d\n",
+				topology_physical_package_id(cpu));
+		seq_printf(m, "siblings\t: %d\n",
+				cpumask_weight(topology_core_cpumask(cpu)));
+		seq_printf(m, "core id\t\t: %d\n", topology_core_id(cpu));
+#endif
+
 		seq_printf(m, "capabilities\t:");
 		if (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS32)
 			seq_puts(m, " os32");
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index dee6f9d..5dec93c 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -408,6 +408,9 @@ void start_parisc(void)
 
 	cpunum = smp_processor_id();
 
+	init_cpu_topology();
+	store_cpu_topology(cpunum);
+
 	set_firmware_width_unlocked();
 
 	ret = pdc_coproc_cfg_unlocked(&coproc_cfg);
diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
index f515938..551b132 100644
--- a/arch/parisc/kernel/topology.c
+++ b/arch/parisc/kernel/topology.c
@@ -1,37 +1,140 @@
 /*
- * arch/parisc/kernel/topology.c - Populate sysfs with topology information
+ * arch/parisc/kernel/topology.c
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
+ * Copyright (C) 2017 Helge Deller <deller@gmx.de>
  *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- * NON INFRINGEMENT.  See the GNU General Public License for more
- * details.
+ * based on arch/arm/kernel/topology.c
  *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
  */
 
-#include <linux/init.h>
-#include <linux/smp.h>
-#include <linux/cpu.h>
-#include <linux/cache.h>
+#include <linux/percpu.h>
+#include <linux/sched.h>
+#include <linux/sched/topology.h>
 
-static DEFINE_PER_CPU(struct cpu, cpu_devices);
+#include <asm/topology.h>
 
-static int __init topology_init(void)
+ /*
+  * cpu topology table
+  */
+struct cputopo_parisc cpu_topology[NR_CPUS];
+EXPORT_SYMBOL_GPL(cpu_topology);
+
+const struct cpumask *cpu_coregroup_mask(int cpu)
+{
+	return &cpu_topology[cpu].core_sibling;
+}
+
+static void update_siblings_masks(unsigned int cpuid)
 {
-	int num;
+	struct cputopo_parisc *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+	int cpu;
+
+	/* update core and thread sibling masks */
+	for_each_possible_cpu(cpu) {
+		cpu_topo = &cpu_topology[cpu];
+
+		if (cpuid_topo->socket_id != cpu_topo->socket_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->core_id != cpu_topo->core_id)
+			continue;
 
-	for_each_present_cpu(num) {
-		register_cpu(&per_cpu(cpu_devices, num), num);
+		cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
 	}
-	return 0;
+	smp_wmb();
 }
 
-subsys_initcall(topology_init);
+/*
+ * store_cpu_topology is called at boot when only one cpu is running
+ * and with the mutex cpu_hotplug.lock locked, when several cpus have booted,
+ * which prevents simultaneous write access to cpu_topology array
+ */
+void store_cpu_topology(unsigned int cpuid)
+{
+	struct cputopo_parisc *cpuid_topo = &cpu_topology[cpuid];
+	struct cpuinfo_parisc *p;
+
+	/* If the cpu topology has been already set, just return */
+	if (cpuid_topo->core_id != -1)
+		return;
+
+	/* create cpu topology mapping */
+	cpuid_topo->thread_id = -1;
+	cpuid_topo->core_id = 0;
+
+	if (cpuid == 0) {
+		cpuid_topo->socket_id = 0; // -1;
+	} else {
+		unsigned long cpu;
+		int max_socket = 0;
+
+		p = &per_cpu(cpu_data, cpuid);
+		for_each_possible_cpu(cpu) {
+			const struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
+
+			if (cpu == cpuid)
+				continue;
+
+			if (cpuinfo->cpu_loc == p->cpu_loc) {
+				cpuid_topo->core_id   = cpu_topology[cpu].core_id + 1;
+				cpuid_topo->socket_id = cpu_topology[cpu].socket_id;
+				continue;
+			}
+
+			if (cpuid_topo->socket_id == -1)
+				max_socket = max(max_socket, cpuid_topo->socket_id);
+		}
+
+		if (cpuid_topo->socket_id == -1)
+			cpuid_topo->socket_id = max_socket + 1;
+	}
+
+	update_siblings_masks(cpuid);
+
+	pr_info("CPU%u: thread %d, cpu %d, socket %d\n",
+		cpuid, cpu_topology[cpuid].thread_id,
+		cpu_topology[cpuid].core_id,
+		cpu_topology[cpuid].socket_id);
+}
+
+static struct sched_domain_topology_level parisc_topology[] = {
+#ifdef CONFIG_SCHED_MC
+	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
+#endif
+
+	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
+	{ NULL, },
+};
+
+/*
+ * init_cpu_topology is called at boot when only one cpu is running
+ * which prevent simultaneous write access to cpu_topology array
+ */
+void __init init_cpu_topology(void)
+{
+	unsigned int cpu;
+
+	/* init core mask and capacity */
+	for_each_possible_cpu(cpu) {
+		struct cputopo_parisc *cpu_topo = &(cpu_topology[cpu]);
+
+		cpu_topo->thread_id = -1;
+		cpu_topo->core_id =  -1;
+		cpu_topo->socket_id = -1;
+		cpumask_clear(&cpu_topo->core_sibling);
+		cpumask_clear(&cpu_topo->thread_sibling);
+	}
+	smp_wmb();
+
+	/* Set scheduler topology descriptor */
+	set_sched_topology(parisc_topology);
+}
