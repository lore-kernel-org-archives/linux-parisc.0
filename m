Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74C34482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Sep 2001 23:25:33 -0600 (MDT)
Date: Sat, 1 Sep 2001 23:25:32 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010901232532.B1745@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="9amGYk9869ThD9tj"
From: rbradetich@uswest.net (Ryan Bradetich)
Subject: [parisc-linux] [PATCH] Delaying the device inventory detection time.
List-ID: <linux-parisc.vger.kernel.org>

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello parisc-linux hackers,

This is the first patch of a series that will hopefully get
the long awaited iotree into the cvs kernel repository.  The
goal of this patch was to delay the parisc device detection
until main memory had been setup. 

The current scheme relies upon a static, non-freeable array
which must be large enough to contain all the devices the
parisc box could inventory.  By delaying the parisc device
detection routines until after main memory is setup will
allow us to use kmalloc and only allocate memory for the
number of parisc devices present in the system.  Delaying
the parisc device detection routines also simplify the code
required for setting up the iotree.

This patch does not do all that yet.... this patch still
leaves the static table in place, and the detection routines.
This patch just changes the location the parisc device 
inventory is called from setup_arch() to parisc_init()
[formerly know as gsc_init].  I am posting this patch to the 
list and asking people to test it with different class 
machines, because this patch is a dependency for the rest
of the iotree stuff I'm working on.  It is also a small
enough, logical change that if problems arise, it will be
easier to debug then if it was bundled in with the rest
of the iotree.

Patch Summary:
	* Move the do_device_inventory() from setup_arch()
	  to parisc_init().
	* Renames the poorly named gsc_init function
	  to parisc_init and moves from drivers/gsc/gsc.c
	  to arch/parisc/kernel/setup.c
	* Seperates the arch/parisc/kernel/setup.c file
	  into setup routines and the processor driver.
	* Removes the register_fallback_cpu code, it should
	  now be obsolete.

Feedback, testing welcome.  I have tested this patch on the
C200+ and a 712/100.

Thanks,

- Ryan

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="inventory6.patch"

diff -u -p -r1.125 Makefile
--- Makefile	2001/08/31 06:02:18	1.125
+++ Makefile	2001/09/02 04:36:17
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 4
 SUBLEVEL = 9
-EXTRAVERSION = -pa13
+EXTRAVERSION = -pa14
 
 KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
diff -u -p -r1.36 Makefile
--- arch/parisc/kernel/Makefile	2001/07/08 12:41:52	1.36
+++ arch/parisc/kernel/Makefile	2001/09/02 04:36:17
@@ -24,7 +24,7 @@ obj-y           += cache.o pacache.o set
 		pa7300lc.o pci-dma.o syscall.o entry.o sys_parisc.o \
 		firmware.o ptrace.o hardware.o inventory.o drivers.o \
 		semaphore.o signal.o hpmc.o real2.o parisc_ksyms.o \
-		unaligned.o
+		unaligned.o processor.o
 
 export-objs	:= parisc_ksyms.o
 
--- /dev/null	Tue May  5 14:32:27 1998
+++ arch/parisc/kernel/processor.c	Sat Sep  1 22:36:18 2001
@@ -0,0 +1,335 @@
+/*    $Id: setup.c,v 1.8 2000/02/02 04:42:38 prumpf Exp $
+ *
+ *    Initial setup-routines for HP 9000 based hardware.
+ *
+ *    Copyright (C) 1991, 1992, 1995  Linus Torvalds
+ *    Modifications for PA-RISC (C) 1999 Helge Deller <deller@gmx.de>
+ *    Modifications copyright 1999 SuSE GmbH (Philipp Rumpf)
+ *    Modifications copyright 2000 Martin K. Petersen <mkp@mkp.net>
+ *    Modifications copyright 2000 Philipp Rumpf <prumpf@tux.org>
+ *    Modifications copyright 2001 Ryan Bradetich <rbradetich@uswest.net>
+ *
+ *    Initial PA-RISC Version: 04-23-1999 by Helge Deller
+ *
+ *    This program is free software; you can redistribute it and/or modify
+ *    it under the terms of the GNU General Public License as published by
+ *    the Free Software Foundation; either version 2, or (at your option)
+ *    any later version.
+ *
+ *    This program is distributed in the hope that it will be useful,
+ *    but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *    GNU General Public License for more details.
+ *
+ *    You should have received a copy of the GNU General Public License
+ *    along with this program; if not, write to the Free Software
+ *    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ */
+#include <linux/config.h>
+#include <linux/slab.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#define PCI_DEBUG
+#include <linux/pci.h>
+#undef PCI_DEBUG
+
+#include <asm/cache.h>
+#include <asm/hardware.h>	/* for register_parisc_driver() stuff */
+#include <asm/processor.h>
+#include <asm/page.h>
+#include <asm/pdc.h>
+#include <asm/irq.h>		/* for struct irq_region */
+
+struct system_cpuinfo_parisc boot_cpu_data;
+struct cpuinfo_parisc cpu_data[NR_CPUS];
+
+/*
+**  	PARISC CPU driver - claim "device" and initialize CPU data structures.
+**
+** Consolidate per CPU initialization into (mostly) one module.
+** Monarch CPU will initialize boot_cpu_data which shouldn't
+** change once the system has booted.
+**
+** The callback *should* do per-instance initialization of
+** everything including the monarch. "Per CPU" init code in
+** setup.c:start_parisc() has migrated here and start_parisc()
+** will call register_parisc_driver(&cpu_driver) before calling do_inventory().
+**
+** The goal of consolidating CPU initialization into one place is
+** to make sure all CPU's get initialized the same way.
+** The code path not shared is how PDC hands control of the CPU to the OS.
+** The initialization of OS data structures is the same (done below).
+*/
+
+/**
+ * processor_probe - Determine if processor driver should claim this device.
+ * @dev: The device which has been found.
+ *
+ * Determine if processor driver should claim this chip (return 0) or not 
+ * (return 1).  If so, initialize the chip and tell other partners in crime 
+ * they have work to do.
+ */
+static int __init processor_probe(struct parisc_device *dev)
+{
+	unsigned long txn_addr;
+	unsigned long cpuid;
+	struct cpuinfo_parisc *p;
+
+#ifndef CONFIG_SMP
+	if (boot_cpu_data.cpu_count > 0) {
+		printk(KERN_INFO "CONFIG_SMP=n  ignoring additional CPUs\n");
+		return(1);
+	}
+#endif
+
+#ifdef __LP64__
+	if (is_pdc_pat()) {
+		ulong status;
+		unsigned long bytecnt;
+	        pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
+		struct pdc_pat_cpu_num cpu_info;
+
+		status = pdc_pat_cell_module(&bytecnt, dev->pcell_loc,
+			dev->mod_index, PA_VIEW, &pa_pdc_cell);
+
+		ASSERT(PDC_RET_OK == status);
+
+		/* verify it's the same as what do_pat_inventory() found */
+		ASSERT(dev->mod_info == pa_pdc_cell.mod_info);
+		ASSERT(dev->pmod_loc == pa_pdc_cell.mod_location);
+		ASSERT(dev->mod_path == pa_pdc_cell.mod_path);
+
+		txn_addr = pa_pdc_cell.mod[0];   /* id_eid for IO sapic */
+
+		/* get the cpu number */
+		status = pdc_pat_cpu_get_number(&cpu_info, dev->hpa);
+
+		ASSERT(PDC_RET_OK == status);
+
+		if(cpu_info.cpu_num >= NR_CPUS) {
+			printk(KERN_WARNING "IGNORING CPU at 0x%x,"
+				" cpu_slot_id > NR_CPUS"
+				" (%ld > %d)\n",
+				dev->hpa, cpu_info.cpu_num, NR_CPUS);
+			/* Ignore CPU since it will only crash */
+			boot_cpu_data.cpu_count--;
+			return(1);
+		} else {
+			cpuid = cpu_info.cpu_num;
+		}
+	} else
+#endif
+	{
+		txn_addr = dev->hpa;	/* for legacy PDC */
+
+		/* logical CPU ID and update global counter */
+		cpuid = boot_cpu_data.cpu_count;
+	}
+
+	p = &cpu_data[cpuid];
+	boot_cpu_data.cpu_count++;
+
+	/* initialize counters */
+	memset(p, 0, sizeof(struct cpuinfo_parisc));
+
+	p->dev = dev;		/* Save IODC data in case we need it */
+	p->hpa = dev->hpa;	/* save CPU hpa */
+	p->cpuid = cpuid;	/* save CPU id */
+	p->txn_addr = txn_addr;	/* save CPU hpa */
+
+	/*
+	** CONFIG_SMP: init_smp_config() will attempt to get CPU's into
+	** OS control. RENDEZVOUS is the default state - see mem_set above.
+	**	p->state = STATE_RENDEZVOUS;
+	*/
+
+	/*
+	** itimer and ipi IRQ handlers are statically initialized in
+	** arch/parisc/kernel/irq.c. ie Don't need to register them.
+	*/
+	p->region = irq_region[IRQ_FROM_REGION(CPU_IRQ_REGION)];
+
+	return 0;
+}
+
+/**
+ * collect_boot_cpu_data - Fill the boot_cpu_data structure.
+ *
+ * This function collects and stores the generic processor information
+ * in the boot_cpu_data structure.
+ */
+void __init collect_boot_cpu_data(void)
+{
+	memset(&boot_cpu_data,0,sizeof(boot_cpu_data));
+
+	boot_cpu_data.cpu_hz = 100 * PAGE0->mem_10msec; /* Hz of this PARISC */
+
+	/* get CPU-Model Information... */
+#define p ((unsigned long *)&boot_cpu_data.pdc.model)
+	if(pdc_model_info(&boot_cpu_data.pdc.model)==0)
+		printk(KERN_INFO 
+			"model	%08lx %08lx %08lx %08lx %08lx %08lx %08lx %08lx %08lx\n",
+			p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
+#undef p
+
+	if(pdc_model_versions(&boot_cpu_data.pdc.versions, 0)==0)
+		printk(KERN_INFO "vers\t%08lx\n", 
+			boot_cpu_data.pdc.versions);
+
+	if(pdc_model_cpuid(&boot_cpu_data.pdc.cpuid)==0)
+		printk(KERN_INFO "cpuid\t%08lx\n",
+			boot_cpu_data.pdc.cpuid);
+
+	printk(KERN_INFO "CPUID\tvers %ld rev %ld\n",
+		(boot_cpu_data.pdc.cpuid >> 5) & 127,
+		boot_cpu_data.pdc.cpuid & 31);
+
+	if (pdc_model_sysmodel(boot_cpu_data.pdc.sys_model_name)==0)
+		printk(KERN_INFO "model\t%s\n",
+			boot_cpu_data.pdc.sys_model_name);
+
+	boot_cpu_data.hversion =  boot_cpu_data.pdc.model.hversion;
+	boot_cpu_data.sversion =  boot_cpu_data.pdc.model.sversion;
+
+	boot_cpu_data.cpu_type =
+			parisc_get_cpu_type(boot_cpu_data.hversion);
+
+	boot_cpu_data.cpu_name = cpu_name_version[boot_cpu_data.cpu_type][0];
+	boot_cpu_data.family_name = cpu_name_version[boot_cpu_data.cpu_type][1];
+}
+
+/*
+** Set width/Enable FP coprocessor
+**
+** REVISIT: this could be done in the "code 22" trap handler.
+** (frowands idea - that way we know which processes need FP
+** registers saved on the interrupt stack.)
+**
+** NEWS FLASH: wide kernels need FP coprocessor enabled to handle
+** formatted printing of %lx for example (double divides I think)
+*/
+
+/**
+ * init_per_cpu - Handle individual processor initializations.
+ * @cpuid: The processor instance.
+ *
+ * This function handles any initialization that needs to be done
+ * on each indiviual processor in the system.
+ */
+int __init init_per_cpu(int cpuid)
+{
+	int ret;
+	struct pdc_coproc_cfg coproc_cfg;
+
+	ret = pdc_coproc_cfg(&coproc_cfg);
+
+	if(ret >= 0 && coproc_cfg.ccr_functional) {
+		mtctl(coproc_cfg.ccr_functional, 10);  /* 10 == Coprocessor Control Reg */
+
+		/* FWIW, FP rev/model is a more accurate way to determine
+		** CPU type. CPU rev/model has some ambiguous cases.
+		*/
+		cpu_data[cpuid].fp_rev = coproc_cfg.revision;
+		cpu_data[cpuid].fp_model = coproc_cfg.model;
+
+		printk(KERN_INFO  "FP[%d] enabled: Rev %ld Model %ld\n",
+			cpuid, coproc_cfg.revision, coproc_cfg.model);
+
+		/*
+		** store status register to stack (hopefully aligned)
+		** and clear the T-bit.
+		*/
+		asm volatile ("fstd    %fr0,8(%sp)");
+
+	} else {
+		printk(KERN_WARNING  "WARNING: No FP CoProcessor?!"
+			" (coproc_cfg.ccr_functional == 0x%lx, expected 0xc0)\n"
+#ifdef __LP64__
+			"Halting Machine - FP required\n"
+#endif
+			, coproc_cfg.ccr_functional);
+#ifdef __LP64__
+		mdelay(100);	/* previous chars get pushed to console */
+		panic("FP CoProc not reported");
+#endif
+	}
+
+	/* FUTURE: Enable Performance Monitor : ccr bit 0x20 */
+
+	return ret;
+}
+
+#ifdef CONFIG_PROC_FS
+/**
+ * get_cpuinfo - Display the processor information for use by procfs.
+ * @buffer: The buffer to hold the processor information.
+ *
+ * This is the callback function for the /proc/cpuinfo  entry in procfs.
+ */
+int get_cpuinfo(char *buffer)
+{
+	char	*p = buffer;
+	int	n;
+
+	for(n=0; n<boot_cpu_data.cpu_count; n++) {
+#ifdef CONFIG_SMP
+		if (0 == cpu_data[n].hpa)
+			continue;
+#ifdef ENTRY_SYS_CPUS
+#error iCOD support wants to show CPU state here
+#endif
+#endif
+		p += sprintf(p, "processor\t: %d\n"
+				"cpu family\t: PA-RISC %s\n",
+				 n, boot_cpu_data.family_name);
+
+		p += sprintf(p, "cpu\t\t: %s\n",  boot_cpu_data.cpu_name );
+
+		/* cpu MHz */
+		p += sprintf(p, "cpu MHz\t\t: %d.%06d\n",
+				 boot_cpu_data.cpu_hz / 1000000,
+				 boot_cpu_data.cpu_hz % 1000000  );
+
+		p += sprintf(p, "model\t\t: %s\n"
+				"model name\t: %s\n",
+				 boot_cpu_data.pdc.sys_model_name,
+				 cpu_data[n].dev ? 
+				 cpu_data[n].dev->name : "Unknown" );
+
+		p += sprintf(p, "hversion\t: 0x%08x\n"
+			        "sversion\t: 0x%08x\n",
+				 boot_cpu_data.hversion,
+				 boot_cpu_data.sversion );
+
+		p += get_cache_info(p);
+		/* print cachesize info ? */
+		p += sprintf(p, "bogomips\t: %lu.%02lu\n",
+			     loops_per_jiffy / (500000 / HZ),
+			     (loops_per_jiffy / (5000 / HZ)) % 100);
+	}
+	return p - buffer;
+}
+#endif
+
+static struct parisc_device_id processor_tbl[] = {
+	{ HPHW_NPROC, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, SVERSION_ANY_ID },
+	{ 0, }
+};
+
+static struct parisc_driver cpu_driver = {
+	name:		"CPU",
+	id_table:	processor_tbl,
+	probe:		processor_probe
+};
+
+/**
+ * processor_init - Processor initalization procedure.
+ *
+ * Register this driver.
+ */
+void __init processor_init(void)
+{
+	register_parisc_driver(&cpu_driver);
+}
--- arch/parisc/kernel/setup.c	2001/08/28 08:08:35	1.89
+++ arch/parisc/kernelsetup.c	2001/09/02 04:36:18
@@ -7,6 +7,7 @@
  *    Modifications copyright 1999 SuSE GmbH (Philipp Rumpf)
  *    Modifications copyright 2000 Martin K. Petersen <mkp@mkp.net>
  *    Modifications copyright 2000 Philipp Rumpf <prumpf@tux.org>
+ *    Modifications copyright 2001 Ryan Bradetich <rbradetich@uswest.net>
  *
  *    Initial PA-RISC Version: 04-23-1999 by Helge Deller
  *
@@ -27,50 +28,28 @@
  */
 
 #include <linux/config.h>
-#include <linux/errno.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/ptrace.h>
-#include <linux/sched.h>
-#include <linux/stddef.h>
-#include <linux/unistd.h>
-#include <linux/user.h>
-#include <linux/tty.h>
-#include <linux/fs.h>
-#include <linux/kdev_t.h>
-#include <linux/major.h>
-#include <linux/string.h>
 #include <linux/blk.h>          /* for initrd_start and initrd_end */
 #include <linux/init.h>
-#include <linux/interrupt.h>
 #include <linux/console.h>
-#include <linux/bootmem.h>
-#include <linux/delay.h>
+#define PCI_DEBUG
 #include <linux/pci.h>
-#include <linux/threads.h>
+#undef PCI_DEBUG
+#include <linux/proc_fs.h>
 
-#include <asm/cache.h>
-#include <asm/hardware.h>	/* for register_parisc_driver() stuff */
 #include <asm/processor.h>
-#include <asm/page.h>
 #include <asm/pdc.h>
 #include <asm/led.h>
-#include <asm/system.h>
 #include <asm/machdep.h>	/* for pa7300lc_init() proto */
 
-#include <asm/irq.h>		/* for struct irq_region */
-
-#include <linux/proc_fs.h>
-
 #define COMMAND_LINE_SIZE 1024
 char	saved_command_line[COMMAND_LINE_SIZE];
 char	command_line[COMMAND_LINE_SIZE];
 
-struct system_cpuinfo_parisc boot_cpu_data;
-struct cpuinfo_parisc cpu_data[NR_CPUS];
+/* Intended for ccio/sba/cpu statistics under /proc/bus/{runway|gsc} */
+struct proc_dir_entry * proc_runway_root = NULL;
+struct proc_dir_entry * proc_gsc_root = NULL;
 
-static long fallback_cpu_hpa[] __initdata = { 0xfffa0000L, 0xfffbe000L, 0x0 };
 
 /* This has to go somewhere in architecture specific code. */
 
@@ -93,225 +72,6 @@ int EISA_bus;
 ** The code path not shared is how PDC hands control of the CPU to the OS.
 ** The initialization of OS data structures is the same (done below).
 */
-#undef ASSERT
-#define ASSERT(expr) \
-	if(!(expr)) { \
-		printk( "\n" __FILE__ ":%d: Assertion " #expr " failed!\n",__LINE__); \
-		panic(#expr); \
-	}
-
-
-static int __init
-cpu_driver_callback(struct parisc_device *dev)
-{
-	unsigned long txn_addr;
-	unsigned long cpuid;
-	struct cpuinfo_parisc *p;
-
-#ifndef CONFIG_SMP
-	if (boot_cpu_data.cpu_count > 0) {
-		printk(KERN_INFO "CONFIG_SMP=n  ignoring additional CPUs\n");
-		return(1);
-	}
-#endif
-
-#ifdef __LP64__
-	if (is_pdc_pat()) {
-		ulong status;
-		unsigned long bytecnt;
-	        pdc_pat_cell_mod_maddr_block_t pa_pdc_cell;
-		struct pdc_pat_cpu_num cpu_info;
-
-		status = pdc_pat_cell_module(&bytecnt, dev->pcell_loc,
-			dev->mod_index, PA_VIEW, &pa_pdc_cell);
-
-		ASSERT(PDC_RET_OK == status);
-
-		/* verify it's the same as what do_pat_inventory() found */
-		ASSERT(dev->mod_info == pa_pdc_cell.mod_info);
-		ASSERT(dev->pmod_loc == pa_pdc_cell.mod_location);
-		ASSERT(dev->mod_path == pa_pdc_cell.mod_path);
-
-		txn_addr = pa_pdc_cell.mod[0];   /* id_eid for IO sapic */
-
-		/* get the cpu number */
-		status = pdc_pat_cpu_get_number(&cpu_info, dev->hpa);
-
-		ASSERT(PDC_RET_OK == status);
-
-		if(cpu_info.cpu_num >= NR_CPUS) {
-			printk(KERN_WARNING "IGNORING CPU at 0x%x,"
-				" cpu_slot_id > NR_CPUS"
-				" (%ld > %d)\n",
-				dev->hpa, cpu_info.cpu_num, NR_CPUS);
-			/* Ignore CPU since it will only crash */
-			boot_cpu_data.cpu_count--;
-			return(1);
-		} else {
-			cpuid = cpu_info.cpu_num;
-		}
-	} else
-#endif
-	{
-		txn_addr = dev->hpa;	/* for legacy PDC */
-
-		/* logical CPU ID and update global counter */
-		cpuid = boot_cpu_data.cpu_count;
-	}
-
-	p = &cpu_data[cpuid];
-	boot_cpu_data.cpu_count++;
-
-	/* initialize counters */
-	memset(p, 0, sizeof(struct cpuinfo_parisc));
-
-	p->dev = dev;		/* Save IODC data in case we need it */
-	p->hpa = dev->hpa;	/* save CPU hpa */
-	p->cpuid = cpuid;	/* save CPU id */
-	p->txn_addr = txn_addr;	/* save CPU hpa */
-
-	/*
-	** CONFIG_SMP: init_smp_config() will attempt to get CPU's into
-	** OS control. RENDEZVOUS is the default state - see mem_set above.
-	**	p->state = STATE_RENDEZVOUS;
-	*/
-
-	/*
-	** itimer and ipi IRQ handlers are statically initialized in
-	** arch/parisc/kernel/irq.c. ie Don't need to register them.
-	*/
-	p->region = irq_region[IRQ_FROM_REGION(CPU_IRQ_REGION)];
-
-	return 0;
-}
-
-
-/* Some versions of IODC don't list the CPU, and since we don't walk
- * the bus yet, we have to probe for processors at well known hpa
- * addresses.
- */
-
-void __init register_fallback_cpu (void)
-{
-	int i = 0;
-
-	printk(KERN_INFO "No CPUs reported by firmware - probing...\n");
-
-	while (fallback_cpu_hpa[i]) {
-		struct parisc_device *dev = alloc_pa_dev(fallback_cpu_hpa[i]);
-		/* Um, where do we free this? */
-
-		if (dev && (HPHW_NPROC == dev->id.hw_type)) {
-			printk(KERN_INFO "Found CPU at %lx\n", fallback_cpu_hpa[i]);
-			register_pa_dev(dev);
-			return;
-		}
-
-		i++;
-	}
-
-	panic ("Don't know where this CPU lives.  System halted.\n");
-	return;
-}
-
-
-/*
- * Get CPU information and store it in the boot_cpu_data structure.  */
-void __init collect_boot_cpu_data(void)
-{
-	memset(&boot_cpu_data,0,sizeof(boot_cpu_data));
-
-	boot_cpu_data.cpu_hz = 100 * PAGE0->mem_10msec; /* Hz of this PARISC */
-
-	/* get CPU-Model Information... */
-#define p ((unsigned long *)&boot_cpu_data.pdc.model)
-	if(pdc_model_info(&boot_cpu_data.pdc.model)==0)
-		printk(KERN_INFO 
-			"model	%08lx %08lx %08lx %08lx %08lx %08lx %08lx %08lx %08lx\n",
-			p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
-#undef p
-
-	if(pdc_model_versions(&boot_cpu_data.pdc.versions, 0)==0)
-		printk(KERN_INFO "vers\t%08lx\n", 
-			boot_cpu_data.pdc.versions);
-
-	if(pdc_model_cpuid(&boot_cpu_data.pdc.cpuid)==0)
-		printk(KERN_INFO "cpuid\t%08lx\n",
-			boot_cpu_data.pdc.cpuid);
-
-	printk(KERN_INFO "CPUID\tvers %ld rev %ld\n",
-		(boot_cpu_data.pdc.cpuid >> 5) & 127,
-		boot_cpu_data.pdc.cpuid & 31);
-
-	if (pdc_model_sysmodel(boot_cpu_data.pdc.sys_model_name)==0)
-		printk(KERN_INFO "model\t%s\n",
-			boot_cpu_data.pdc.sys_model_name);
-
-	boot_cpu_data.hversion =  boot_cpu_data.pdc.model.hversion;
-	boot_cpu_data.sversion =  boot_cpu_data.pdc.model.sversion;
-
-	boot_cpu_data.cpu_type =
-			parisc_get_cpu_type(boot_cpu_data.hversion);
-
-	boot_cpu_data.cpu_name = cpu_name_version[boot_cpu_data.cpu_type][0];
-	boot_cpu_data.family_name = cpu_name_version[boot_cpu_data.cpu_type][1];
-}
-
-/*
-** Set width/Enable FP coprocessor
-**
-** REVISIT: this could be done in the "code 22" trap handler.
-** (frowands idea - that way we know which processes need FP
-** registers saved on the interrupt stack.)
-**
-** NEWS FLASH: wide kernels need FP coprocessor enabled to handle
-** formatted printing of %lx for example (double divides I think)
-*/
-static int __init
-init_per_cpu(int cpuid)
-{
-	int ret;
-	struct pdc_coproc_cfg coproc_cfg;
-
-	ret = pdc_coproc_cfg(&coproc_cfg);
-
-	if(ret >= 0 && coproc_cfg.ccr_functional) {
-		mtctl(coproc_cfg.ccr_functional, 10);  /* 10 == Coprocessor Control Reg */
-
-		/* FWIW, FP rev/model is a more accurate way to determine
-		** CPU type. CPU rev/model has some ambiguous cases.
-		*/
-		cpu_data[cpuid].fp_rev = coproc_cfg.revision;
-		cpu_data[cpuid].fp_model = coproc_cfg.model;
-
-		printk(KERN_INFO  "FP[%d] enabled: Rev %ld Model %ld\n",
-			cpuid, coproc_cfg.revision, coproc_cfg.model);
-
-		/*
-		** store status register to stack (hopefully aligned)
-		** and clear the T-bit.
-		*/
-		asm volatile ("fstd    %fr0,8(%sp)");
-
-	} else {
-		printk(KERN_WARNING  "WARNING: No FP CoProcessor?!"
-			" (coproc_cfg.ccr_functional == 0x%lx, expected 0xc0)\n"
-#ifdef __LP64__
-			"Halting Machine - FP required\n"
-#endif
-			, coproc_cfg.ccr_functional);
-#ifdef __LP64__
-		mdelay(100);	/* previous chars get pushed to console */
-		panic("FP CoProc not reported");
-#endif
-	}
-
-	/* FUTURE: Enable Performance Monitor : ccr bit 0x20 */
-
-	return(ret);
-}
-
-
 void __init setup_cmdline(char **cmdline_p)
 {
 	extern unsigned int boot_args[];
@@ -363,18 +123,9 @@ void __init dma_ops_init(void)
 	}
 }
 
+extern int init_per_cpu(int cpuid);
+extern void collect_boot_cpu_data(void);
 
-static struct parisc_device_id cpu_tbl[] = {
-	{ HPHW_NPROC, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, SVERSION_ANY_ID },
-	{ 0, }
-};
-
-static struct parisc_driver cpu_driver = {
-	name:		"CPU",
-	id_table:	cpu_tbl,
-	probe:		cpu_driver_callback
-};
-
 void __init setup_arch(char **cmdline_p)
 {
 	init_per_cpu(smp_processor_id());	/* Set Modes & Enable FP */
@@ -403,16 +154,6 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	dma_ops_init();
-	do_device_inventory();                  /* probe for hardware */
-	register_parisc_driver(&cpu_driver);	/* claim all the CPUs */
-	if (boot_cpu_data.cpu_count == 0)
-	    register_fallback_cpu();
-
-	printk(KERN_INFO "CPU(s): %d x %s at %d.%06d MHz\n",
-			boot_cpu_data.cpu_count,
-			boot_cpu_data.cpu_name,
-			boot_cpu_data.cpu_hz / 1000000,
-			boot_cpu_data.cpu_hz % 1000000	);
 
 #ifdef CONFIG_VT
 # if defined(CONFIG_STI_CONSOLE) || defined(CONFIG_DUMMY_CONSOLE)
@@ -422,52 +163,77 @@ void __init setup_arch(char **cmdline_p)
 
 }
 
-#ifdef CONFIG_PROC_FS
-/*
- *	Get CPU information for use by procfs.
- */
-
-int get_cpuinfo(char *buffer)
+static void parisc_proc_mkdir(void)
 {
-	char	*p = buffer;
-	int	n;
-
-	for(n=0; n<boot_cpu_data.cpu_count; n++) {
-#ifdef CONFIG_SMP
-		if (0 == cpu_data[n].hpa)
-			continue;
-#ifdef ENTRY_SYS_CPUS
-#error iCOD support wants to show CPU state here
-#endif
-#endif
-		p += sprintf(p, "processor\t: %d\n"
-				"cpu family\t: PA-RISC %s\n",
-				 n, boot_cpu_data.family_name);
-
-		p += sprintf(p, "cpu\t\t: %s\n",  boot_cpu_data.cpu_name );
-
-		/* cpu MHz */
-		p += sprintf(p, "cpu MHz\t\t: %d.%06d\n",
-				 boot_cpu_data.cpu_hz / 1000000,
-				 boot_cpu_data.cpu_hz % 1000000  );
-
-		p += sprintf(p, "model\t\t: %s\n"
-				"model name\t: %s\n",
-				 boot_cpu_data.pdc.sys_model_name,
-				 cpu_data[n].dev ? 
-				 cpu_data[n].dev->name : "Unknown" );
-
-		p += sprintf(p, "hversion\t: 0x%08x\n"
-			        "sversion\t: 0x%08x\n",
-				 boot_cpu_data.hversion,
-				 boot_cpu_data.sversion );
-
-		p += get_cache_info(p);
-		/* print cachesize info ? */
-		p += sprintf(p, "bogomips\t: %lu.%02lu\n",
-			     loops_per_jiffy / (500000 / HZ),
-			     (loops_per_jiffy / (5000 / HZ)) % 100);
+	/*
+	** Can't call proc_mkdir() until after proc_root_init() has been
+	** called by start_kernel(). In other words, this code can't
+	** live in arch/.../setup.c because start_parisc() calls
+	** start_kernel().
+	*/
+	switch (boot_cpu_data.cpu_type) {
+	case pcxl:
+	case pcxl2:
+		if (NULL == proc_gsc_root)
+		{
+			proc_gsc_root = proc_mkdir("bus/gsc", 0);
+		}
+		break;
+        case pcxt_:
+        case pcxu:
+        case pcxu_:
+        case pcxw:
+        case pcxw_:
+                if (NULL == proc_runway_root)
+                {
+                        proc_runway_root = proc_mkdir("bus/runway", 0);
+                }
+                break;
 	}
-	return p - buffer;
 }
+
+extern void busdevices_init(void);
+extern void processor_init(void);
+extern void ccio_init(void);
+extern void dino_init(void);
+extern void iosapic_init(void);
+extern void lba_init(void);
+extern void sba_init(void);
+
+void __init parisc_init(void)
+{
+	parisc_proc_mkdir();
+	do_device_inventory();                  /* probe for hardware */
+
+	processor_init();
+	printk(KERN_INFO "CPU(s): %d x %s at %d.%06d MHz\n",
+			boot_cpu_data.cpu_count,
+			boot_cpu_data.cpu_name,
+			boot_cpu_data.cpu_hz / 1000000,
+			boot_cpu_data.cpu_hz % 1000000	);
+
+#if defined(CONFIG_IOSAPIC)
+	iosapic_init();
+#endif
+	/* These are in a non-obvious order, will fix when we have an iotree */
+#if defined(CONFIG_PCI_LBA)
+	lba_init();
+#endif
+#if defined(CONFIG_IOMMU_SBA)
+	sba_init();
+#endif
+#if defined(CONFIG_IOMMU_CCIO)
+	ccio_init();
 #endif
+#if defined(CONFIG_GSC_DINO)
+	dino_init();
+#endif
+
+#ifdef CONFIG_GSC_LASI
+	busdevices_init();
+#endif
+
+#ifdef CONFIG_CHASSIS_LCD_LED
+	register_led_regions();	/* register LED port info in procfs */
+#endif
+}
--- drivers/gsc/gsc.c	2001/08/31 06:02:17	1.25
+++ drivers/gsc/gsc.c	2001/09/02 04:36:18
@@ -24,10 +24,6 @@
 #include <asm/irq.h>
 #include <asm/processor.h>	/* for boot_cpu_data */
 
-/* Intended for ccio/sba/cpu statistics under /proc/bus/{runway|gsc} */
-struct proc_dir_entry * proc_runway_root = NULL;
-struct proc_dir_entry * proc_gsc_root = NULL;
-
 u8 _gsc_readb(void *addr)
 {
 	long flags;
@@ -157,75 +153,4 @@ int gsc_claim_irq(struct gsc_irq *i, int
 	i->irq = irq;
 
 	return irq;
-}
-
-static void parisc_proc_mkdir(void)
-{
-	/*
-	** Can't call proc_mkdir() until after proc_root_init() has been
-	** called by start_kernel(). In other words, this code can't
-	** live in arch/.../setup.c because start_parisc() calls
-	** start_kernel().
-	*/
-	switch (boot_cpu_data.cpu_type) {
-	case pcxl:
-	case pcxl2:
-		if (NULL == proc_gsc_root)
-		{
-			proc_gsc_root = proc_mkdir("bus/gsc", 0);
-		}
-		break;
-        case pcxt_:
-        case pcxu:
-        case pcxu_:
-        case pcxw:
-        case pcxw_:
-                if (NULL == proc_runway_root)
-                {
-                        proc_runway_root = proc_mkdir("bus/runway", 0);
-                }
-                break;
-	}
-}
-
-extern void busdevices_init(void);
-extern void ccio_init(void);
-extern void dino_init(void);
-extern void iosapic_init(void);
-extern void lba_init(void);
-extern void sba_init(void);
-
-void __init gsc_init(void)
-{
-	/* FIXME: Much of the code here needs to move to somewhere more
-	 * appropriate.  But it isn't clear where to have pre-pci post-mm
-	 * initialisation hooks.
-	 */
-
-	parisc_proc_mkdir();
-
-#if defined(CONFIG_IOSAPIC)
-	iosapic_init();
-#endif
-	/* These are in a non-obvious order, will fix when we have an iotree */
-#if defined(CONFIG_PCI_LBA)
-	lba_init();
-#endif
-#if defined(CONFIG_IOMMU_SBA)
-	sba_init();
-#endif
-#if defined(CONFIG_IOMMU_CCIO)
-	ccio_init();
-#endif
-#if defined(CONFIG_GSC_DINO)
-	dino_init();
-#endif
-
-#ifdef CONFIG_GSC_LASI
-	busdevices_init();
-#endif
-
-#ifdef CONFIG_CHASSIS_LCD_LED
-	register_led_regions();	/* register LED port info in procfs */
-#endif
 }
--- init/main.c	2001/08/01 15:27:29	1.33
+++ init/main.c	2001/09/02 04:36:20
@@ -112,7 +112,7 @@ extern void ipc_init(void);
 #endif
 
 #ifdef CONFIG_PARISC
-extern void gsc_init(void);
+extern void parisc_init(void);
 #endif
 
 /*
@@ -681,7 +681,7 @@ static void __init do_basic_setup(void)
 #endif
 
 #ifdef CONFIG_PARISC
-	gsc_init();
+	parisc_init();
 #endif
 #ifdef CONFIG_PCI
 	pci_init();

--9amGYk9869ThD9tj--
