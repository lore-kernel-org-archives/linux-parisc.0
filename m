Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCB384829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Oct 2002 09:37:17 -0600 (MDT)
Received: from 127.0.0.1 (localhost.esiee.fr [127.0.0.1])
	by mail.esiee.fr (Postfix) with SMTP id C245F49C9E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Oct 2002 17:37:13 +0200 (CEST)
Received: from esiee.fr (grobluk.esiee.fr [147.215.7.22])
	by mail.esiee.fr (Postfix) with ESMTP id 10B9649C9D
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Oct 2002 17:37:13 +0200 (CEST)
Message-ID: <3D9C6395.5070100@esiee.fr>
Date: Thu, 03 Oct 2002 17:34:45 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
References: <20021003153330.14DD94829@dsl2.external.hp.com>
Content-Type: multipart/mixed;
 boundary="------------050007030408050205010406"
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux varenet
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multi-part message in MIME format.
--------------050007030408050205010406
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Thibaut Varene wrote:
> CVSROOT:	/var/cvs
> Module name:	linux
> Changes by:	varenet	02/10/03 09:33:30
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: Makefile firmware.c power.c process.c 
> 	                    setup.c traps.c 
> 	arch/parisc/mm : init.c 
> 	include/asm-parisc: pdc.h 
> Added files:
> 	arch/parisc/kernel: pdc_chassis.c 
> 	include/asm-parisc: pdc_chassis.h 
> 
> Log message:
> Implemented LED Panel support (Run/Attn/Fault) for E-class and PDC_PAT boxes.
> Implemented GSP Logging facility for PDC_PAT boxes.
> 

These changes have been successfully tested so far on A500, B2600, B132 
and E35.

We don't know yet if there are other machines that features the same LED 
Panel than the E series.

HTH,

-- 
Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/

--------------050007030408050205010406
Content-Type: text/plain;
 name="pdc_chassis.6.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pdc_chassis.6.diff"

diff -Nru -x CVS linux.orig-pa20/Makefile linux/Makefile
--- linux.orig-pa20/Makefile	2002-09-24 03:00:24.000000000 +0200
+++ linux/Makefile	2002-10-02 21:12:09.000000000 +0200
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 4
 SUBLEVEL = 19
-EXTRAVERSION = -pa20
+EXTRAVERSION = -pa21
 
 KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
diff -Nru -x CVS linux.orig-pa20/arch/parisc/kernel/Makefile linux/arch/parisc/kernel/Makefile
--- linux.orig-pa20/arch/parisc/kernel/Makefile	2002-07-05 00:41:50.000000000 +0200
+++ linux/arch/parisc/kernel/Makefile	2002-10-01 15:25:10.000000000 +0200
@@ -24,7 +24,7 @@
 		pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
 		ptrace.o hardware.o inventory.o drivers.o semaphore.o \
 		signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
-		processor.o power.o
+		processor.o power.o pdc_chassis.o
 
 export-objs	:= parisc_ksyms.o superio.o keyboard.o
 
diff -Nru -x CVS linux.orig-pa20/arch/parisc/kernel/firmware.c linux/arch/parisc/kernel/firmware.c
--- linux.orig-pa20/arch/parisc/kernel/firmware.c	2002-07-27 03:00:18.000000000 +0200
+++ linux/arch/parisc/kernel/firmware.c	2002-10-03 17:02:10.000000000 +0200
@@ -1,4 +1,4 @@
-/* arch/parisc/kernel/pdc.c  - safe pdc access routines
+/* arch/parisc/kernel/firmware.c  - safe pdc access routines
  *
  * Copyright 1999 SuSE GmbH Nuernberg (Philipp Rumpf, prumpf@tux.org)
  * portions Copyright 1999 The Puffin Group, (Alex deVries, David Kennedy)
@@ -177,6 +177,45 @@
 }
 
 /**
+ * pdc_pat_chassis_send_log - Sends a PDC PAT CHASSIS log message.
+ * @retval: -1 on error, 0 on success. Other value are PDC errors
+ *
+ * Must be correctly formatted or expect system crash
+ */
+#ifdef __LP64__
+int pdc_pat_chassis_send_log(unsigned long state, unsigned long data)
+{
+	if (!is_pdc_pat())
+		return -1;
+		
+	int retval = 0;
+	
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_PAT_CHASSIS_LOG, PDC_PAT_CHASSIS_WRITE_LOG, __pa(&state), __pa(&data));
+	spin_unlock_irq(&pdc_lock);
+	
+	return retval;
+}
+#endif
+
+/**
+ * pdc_chassis_disp - Updates display
+ * @retval: -1 on error, 0 on success
+ *
+ * Works on old PDC only (E class, others?)
+ */
+int pdc_chassis_disp(unsigned long disp)
+{
+	int retval = 0;
+
+	spin_lock_irq(&pdc_lock);
+	retval = mem_pdc_call(PDC_CHASSIS, PDC_CHASSIS_DISP, disp);
+	spin_unlock_irq(&pdc_lock);
+
+	return retval;
+}
+
+/**
  * pdc_coproc_cfg - To identify coprocessors attached to the processor.
  * @pdc_coproc_info: Return buffer address.
  *
diff -Nru -x CVS linux.orig-pa20/arch/parisc/kernel/pdc_chassis.c linux/arch/parisc/kernel/pdc_chassis.c
--- linux.orig-pa20/arch/parisc/kernel/pdc_chassis.c	1970-01-01 01:00:00.000000000 +0100
+++ linux/arch/parisc/kernel/pdc_chassis.c	2002-10-03 17:25:35.000000000 +0200
@@ -0,0 +1,204 @@
+/*
+ *		arch/parisc/kernel/pdc_chassis.c
+ *
+ * 		Copyright (C) 2002 Laurent Canet <canetl@esiee.fr>
+ *		Copyright (C) 2002 Thibaut Varene <varenet@esiee.fr>
+ *
+ *
+ *		This program is free software; you can redistribute it and/or modify
+ *		it under the terms of the GNU General Public License as published by
+ *		the Free Software Foundation; either version 2, or (at your option)
+ *		any later version.
+ *      
+ *		This program is distributed in the hope that it will be useful,
+ *		but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *		GNU General Public License for more details.
+ *      
+ *		You should have received a copy of the GNU General Public License
+ *		along with this program; if not, write to the Free Software
+ *		Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#undef PDC_CHASSIS_DEBUG
+#ifdef PDC_CHASSIS_DEBUG
+#define DPRINTK(fmt, args...)	printk(fmt, ## args)
+#else
+#define DPRINTK(fmt, args...)
+#endif
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/reboot.h>
+#include <linux/notifier.h>
+
+#include <asm/pdc_chassis.h>
+#include <asm/processor.h>
+
+static int pdc_chassis_old = 0;	
+
+
+/** 
+ * pdc_chassis_checkold() - Checks for old PDC_CHASSIS compatibility
+ * @pdc_chassis_old: 1 if old pdc chassis style
+ * 
+ * Currently, only E class is known to work with this
+ * Inspired by Christoph Plattner
+ */
+
+static void __init pdc_chassis_checkold(void)
+{
+	switch(CPU_HVERSION) {
+		case 0x480:		/* E25 */
+		case 0x481:		/* E35 */
+		case 0x482:		/* E45 */
+		case 0x483:		/* E55 */
+			pdc_chassis_old = 1;
+			break;
+
+		default:
+			break;
+	}
+	DPRINTK(KERN_DEBUG "pdc_chassis.c: pdc_chassis_checkold(); pdc_chassis_old = %d\n", pdc_chassis_old);
+}
+
+
+/**
+ * pdc_chassis_panic_event() - Called by the panic handler.
+ *
+ * As soon as a panic occurs, we should inform the PDC.
+ */
+
+static int pdc_chassis_panic_event(struct notifier_block *this,
+		        unsigned long event, void *ptr)
+{
+	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
+		return NOTIFY_DONE;
+}   
+
+
+static struct notifier_block pdc_chassis_panic_block = {
+	notifier_call: pdc_chassis_panic_event,
+	priority: INT_MAX,
+};
+
+
+/**
+ * parisc_reboot_event() - Called by the reboot handler.
+ *
+ * As soon as a reboot occurs, we should inform the PDC.
+ */
+
+static int pdc_chassis_reboot_event(struct notifier_block *this,
+		        unsigned long event, void *ptr)
+{
+	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
+		return NOTIFY_DONE;
+}   
+
+
+static struct notifier_block pdc_chassis_reboot_block = {
+	notifier_call: pdc_chassis_reboot_event,
+	priority: INT_MAX,
+};
+
+
+/**
+ * parisc_pdc_chassis_init() - Called at boot time.
+ */
+
+void __init parisc_pdc_chassis_init(void)
+{
+	DPRINTK(KERN_DEBUG "pdc_chassis.c: parisc_pdc_chassis_init()\n");
+
+	/* initialize panic notifier chain */
+	notifier_chain_register(&panic_notifier_list, &pdc_chassis_panic_block);
+
+	/* initialize reboot notifier chain */
+	register_reboot_notifier(&pdc_chassis_reboot_block);
+
+	/* Check for old LED Panel */
+	pdc_chassis_checkold();
+}
+
+
+/** 
+ * pdc_chassis_send_status() - Sends a predefined message to the chassis,
+ * and changes the front panel LEDs according to the new system state
+ * @retval: PDC call return value.
+ *
+ * Only machines with 64 bits PDC PAT and E-class are supported atm.
+ * 
+ * returns 0 if no error, -1 if no supported PDC is present or invalid message,
+ * else returns the appropriate PDC error code.
+ * 
+ * For a list of predefined messages, see asm-parisc/pdc_chassis.h
+ */
+
+int pdc_chassis_send_status(int message)
+{
+	/* Maybe we should do that in an other way ? */
+	int retval = 0;
+
+	DPRINTK(KERN_DEBUG "pdc_chassis.c: pdc_chassis_send_status(%d)\n", message);
+
+#ifdef __LP64__	/* pdc_pat_chassis_send_log is defined only when #ifdef __LP64__ */
+	if (is_pdc_pat()) {
+		switch(message) {
+			case PDC_CHASSIS_DIRECT_BSTART:
+				retval = pdc_pat_chassis_send_log(PDC_CHASSIS_PMSG_BSTART, PDC_CHASSIS_LSTATE_RUN_NORMAL);
+				break;
+			
+			case PDC_CHASSIS_DIRECT_BCOMPLETE:
+				retval = pdc_pat_chassis_send_log(PDC_CHASSIS_PMSG_BCOMPLETE, PDC_CHASSIS_LSTATE_RUN_NORMAL);
+				break;
+			
+			case PDC_CHASSIS_DIRECT_SHUTDOWN:
+				retval = pdc_pat_chassis_send_log(PDC_CHASSIS_PMSG_SHUTDOWN, PDC_CHASSIS_LSTATE_NONOS);
+				break;
+			
+			case PDC_CHASSIS_DIRECT_PANIC:
+				retval = pdc_pat_chassis_send_log(PDC_CHASSIS_PMSG_PANIC, PDC_CHASSIS_LSTATE_RUN_CRASHREC);
+				break;
+		
+			case PDC_CHASSIS_DIRECT_LPMC:
+				retval = pdc_pat_chassis_send_log(PDC_CHASSIS_PMSG_LPMC, PDC_CHASSIS_LSTATE_RUN_SYSINT);
+				break;
+
+			case PDC_CHASSIS_DIRECT_HPMC:
+				retval = pdc_pat_chassis_send_log(PDC_CHASSIS_PMSG_HPMC, PDC_CHASSIS_LSTATE_RUN_NCRIT);
+				break;
+
+			default:
+				retval = -1;
+		}
+	} else retval = -1;
+#else
+	if (pdc_chassis_old) {
+		switch (message) {
+			case PDC_CHASSIS_DIRECT_BSTART:
+			case PDC_CHASSIS_DIRECT_BCOMPLETE:
+				retval = pdc_chassis_disp(PDC_CHASSIS_DISP_DATA(OSTAT_RUN));
+				break;
+							
+			case PDC_CHASSIS_DIRECT_SHUTDOWN:
+				retval = pdc_chassis_disp(PDC_CHASSIS_DISP_DATA(OSTAT_SHUT));
+				break;
+			
+			case PDC_CHASSIS_DIRECT_HPMC:
+			case PDC_CHASSIS_DIRECT_PANIC:
+				retval = pdc_chassis_disp(PDC_CHASSIS_DISP_DATA(OSTAT_FLT));
+				break;
+		
+			case PDC_CHASSIS_DIRECT_LPMC:
+				retval = pdc_chassis_disp(PDC_CHASSIS_DISP_DATA(OSTAT_WARN));
+				break;
+
+			default:
+				retval = -1;
+		}
+	} else retval = -1;
+#endif
+		
+	return retval;
+}
diff -Nru -x CVS linux.orig-pa20/arch/parisc/kernel/power.c linux/arch/parisc/kernel/power.c
--- linux.orig-pa20/arch/parisc/kernel/power.c	2002-09-25 03:00:22.000000000 +0200
+++ linux/arch/parisc/kernel/power.c	2002-10-02 21:17:02.000000000 +0200
@@ -47,10 +47,10 @@
 
 #include <asm/gsc.h>
 #include <asm/pdc.h>
+#include <asm/pdc_chassis.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/led.h>
-#include <asm/led.h>
 #include <asm/uaccess.h>
 
 
diff -Nru -x CVS linux.orig-pa20/arch/parisc/kernel/process.c linux/arch/parisc/kernel/process.c
--- linux.orig-pa20/arch/parisc/kernel/process.c	2002-06-27 23:34:44.000000000 +0200
+++ linux/arch/parisc/kernel/process.c	2002-10-02 21:18:20.000000000 +0200
@@ -27,6 +27,7 @@
 #include <linux/version.h>
 #include <linux/elf.h>
 #include <linux/personality.h>
+#include <linux/config.h>
 
 #include <asm/machdep.h>
 #include <asm/offset.h>
@@ -36,6 +37,7 @@
 #include <asm/io.h>
 #include <asm/gsc.h>
 #include <asm/processor.h>
+#include <asm/pdc_chassis.h>
 
 int hlt_counter;
 
@@ -118,6 +120,9 @@
 	/* "Normal" system reset */
 	pdc_do_reset();
 
+	/* set up a new led state on systems shipped with a LED State panel */
+	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
+	
 	/* Nope...box should reset with just CMD_RESET now */
 	gsc_writel(CMD_RESET, COMMAND_GLOBAL);
 
@@ -150,6 +155,8 @@
 	 * following call will immediately power off. */
 	pdc_soft_power_button(0);
 
+	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
+	
 	/* It seems we have no way to power the system off via
 	 * software. The user has to press the button himself. */
 
diff -Nru -x CVS linux.orig-pa20/arch/parisc/kernel/setup.c linux/arch/parisc/kernel/setup.c
--- linux.orig-pa20/arch/parisc/kernel/setup.c	2002-06-01 03:06:31.000000000 +0200
+++ linux/arch/parisc/kernel/setup.c	2002-10-02 21:18:59.000000000 +0200
@@ -41,6 +41,7 @@
 #include <asm/processor.h>
 #include <asm/pdc.h>
 #include <asm/led.h>
+#include <asm/pdc_chassis.h>
 #include <asm/machdep.h>	/* for pa7300lc_init() proto */
 
 #define COMMAND_LINE_SIZE 1024
@@ -283,6 +284,11 @@
 	parisc_init_resources();
 	do_device_inventory();                  /* probe for hardware */
 
+	parisc_pdc_chassis_init();
+
+	/* set up a new led state on systems shipped LED State panel */
+	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_BSTART);
+	
 	processor_init();
 	printk(KERN_INFO "CPU(s): %d x %s at %d.%06d MHz\n",
 			boot_cpu_data.cpu_count,
diff -Nru -x CVS linux.orig-pa20/arch/parisc/kernel/traps.c linux/arch/parisc/kernel/traps.c
--- linux.orig-pa20/arch/parisc/kernel/traps.c	2002-08-22 03:00:35.000000000 +0200
+++ linux/arch/parisc/kernel/traps.c	2002-10-02 21:19:58.000000000 +0200
@@ -34,6 +34,7 @@
 #include <asm/atomic.h>
 #include <asm/smp.h>
 #include <asm/pdc.h>
+#include <asm/pdc_chassis.h>
 
 #include "../math-emu/math-emu.h"	/* for handle_fpe() */
 
@@ -487,6 +488,10 @@
 
 	case  1:
 		/* High-priority machine check (HPMC) */
+
+		/* set up a new led state on systems shipped with a LED State panel */
+		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_HPMC);
+
 		parisc_terminate("High Priority Machine Check (HPMC)",
 				regs, code, 0);
 		/* NOT REACHED */
@@ -506,6 +511,9 @@
 
 	case  5:
 		/* Low-priority machine check */
+
+		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_LPMC);
+
 		flush_all_caches();
 		cpu_lpmc(5, regs);
 		return;
@@ -578,6 +586,9 @@
 	case 17:
 		/* Non-access data TLB miss fault/Non-access data page fault */
 		/* TODO: Still need to add slow path emulation code here */
+		
+		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
+
 		fault_address = regs->ior;
 		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);
 
@@ -690,6 +701,9 @@
 			force_sig_info(SIGBUS, &si, current);
 			return;
 		}
+		
+		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
+
 		parisc_terminate("Unexpected interruption", regs, code, 0);
 		/* NOT REACHED */
 	}
@@ -718,8 +732,11 @@
 	     * The kernel should never fault on its own address space.
 	     */
 
-	    if (fault_space == 0)
-		    parisc_terminate("Kernel Fault", regs, code, fault_address);
+	    if (fault_space == 0) {
+		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
+
+		parisc_terminate("Kernel Fault", regs, code, fault_address);
+	    }
 	}
 
 #ifdef CONFIG_KWDB
diff -Nru -x CVS linux.orig-pa20/arch/parisc/mm/init.c linux/arch/parisc/mm/init.c
--- linux.orig-pa20/arch/parisc/mm/init.c	2002-05-29 17:11:36.000000000 +0200
+++ linux/arch/parisc/mm/init.c	2002-10-02 20:56:05.000000000 +0200
@@ -21,6 +21,7 @@
 
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
+#include <asm/pdc_chassis.h>
 
 mmu_gather_t mmu_gathers[NR_CPUS];
 
@@ -409,6 +410,9 @@
 	}
 
 	printk("%luk freed\n", (unsigned long)(&__init_end - &__init_begin) >> 10);
+
+	/* set up a new led state on systems shipped LED State panel */
+	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_BCOMPLETE);
 }
 
 /*
diff -Nru -x CVS linux.orig-pa20/include/asm-parisc/pdc.h linux/include/asm-parisc/pdc.h
--- linux.orig-pa20/include/asm-parisc/pdc.h	2002-09-04 03:01:13.000000000 +0200
+++ linux/include/asm-parisc/pdc.h	2002-10-03 17:17:16.000000000 +0200
@@ -476,7 +476,7 @@
 #define PDC_TYPE_SYSTEM_MAP	 1 /* 32-bit, but supports PDC_SYSTEM_MAP */
 #define PDC_TYPE_SNAKE		 2 /* Doesn't support SYSTEM_MAP */
 
-#define is_pdc_pat()    (pdc_type == PDC_TYPE_PAT)
+#define is_pdc_pat()	(pdc_type == PDC_TYPE_PAT)
 
 struct pdc_chassis_info {       /* for PDC_CHASSIS_INFO */
 	unsigned long actcnt;   /* actual number of bytes returned */
@@ -915,6 +915,7 @@
 
 int pdc_add_valid(unsigned long address);
 int pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len);
+int pdc_chassis_disp(unsigned long disp);
 int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info);
 int pdc_iodc_read(unsigned long *actcnt, unsigned long hpa, unsigned int index,
 		  void *iodc_data, unsigned int iodc_data_size);
@@ -961,6 +962,8 @@
                  unsigned long glob_cfg);
 
 #ifdef __LP64__
+int pdc_pat_chassis_send_log(unsigned long status, unsigned long data);
+
 int pdc_pat_cell_get_number(struct pdc_pat_cell_num *cell_info);
 int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsigned long mod,
 			unsigned long view_type, void *mem_addr);
diff -Nru -x CVS linux.orig-pa20/include/asm-parisc/pdc_chassis.h linux/include/asm-parisc/pdc_chassis.h
--- linux.orig-pa20/include/asm-parisc/pdc_chassis.h	1970-01-01 01:00:00.000000000 +0100
+++ linux/include/asm-parisc/pdc_chassis.h	2002-10-03 17:24:57.000000000 +0200
@@ -0,0 +1,382 @@
+/*
+ *		include/asm-parisc/pdc_chassis.h
+ *
+ *		Copyright (C) 2002 Laurent Canet <canetl@esiee.fr>
+ *		Copyright (C) 2002 Thibaut Varene <varenet@esiee.fr>
+ *
+ *
+ *      This program is free software; you can redistribute it and/or modify
+ *      it under the terms of the GNU General Public License as published by
+ *      the Free Software Foundation; either version 2, or (at your option)
+ *      any later version.
+ *      
+ *      This program is distributed in the hope that it will be useful,
+ *      but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *      GNU General Public License for more details.
+ *      
+ *      You should have received a copy of the GNU General Public License
+ *      along with this program; if not, write to the Free Software
+ *      Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ *      TODO:	- handle processor number on SMP systems (Reporting Entity ID)
+ *      	- handle message ID
+ *      	- handle timestamps
+ */
+ 
+
+#ifndef _PARISC_PDC_CHASSIS_H
+#define _PARISC_PDC_CHASSIS_H
+
+/*
+ * ----------
+ * Prototypes
+ * ----------
+ */
+
+int pdc_chassis_send_status(int message);
+void __init parisc_pdc_chassis_init(void);
+
+
+/*
+ * -----------------
+ * Direct call names
+ * -----------------
+ * They setup everything for you, the Log message and the corresponding LED state
+ */
+
+#define PDC_CHASSIS_DIRECT_BSTART	0
+#define PDC_CHASSIS_DIRECT_BCOMPLETE	1
+#define PDC_CHASSIS_DIRECT_SHUTDOWN	2
+#define PDC_CHASSIS_DIRECT_PANIC	3
+#define PDC_CHASSIS_DIRECT_HPMC		4
+#define PDC_CHASSIS_DIRECT_LPMC		5
+#define PDC_CHASSIS_DIRECT_DUMP		6	/* not yet implemented */
+#define PDC_CHASSIS_DIRECT_OOPS		7	/* not yet implemented */
+
+
+/*
+ * ------------
+ * LEDs control
+ * ------------
+ * Set the three LEDs -- Run, Attn, and Fault.
+ */
+
+/* Old PDC LED control */
+#define PDC_CHASSIS_DISP_DATA(v)	((unsigned long)(v) << 17)
+
+/* 
+ * Available PDC PAT LED states
+ */
+
+#define PDC_CHASSIS_LED_RUN_OFF		(0ULL << 4)
+#define PDC_CHASSIS_LED_RUN_FLASH	(1ULL << 4)
+#define PDC_CHASSIS_LED_RUN_ON		(2ULL << 4)
+#define PDC_CHASSIS_LED_RUN_NC		(3ULL << 4)
+#define PDC_CHASSIS_LED_ATTN_OFF	(0ULL << 6)
+#define PDC_CHASSIS_LED_ATTN_FLASH	(1ULL << 6)
+#define PDC_CHASSIS_LED_ATTN_NC		(3ULL << 6)	/* ATTN ON is invalid */
+#define PDC_CHASSIS_LED_FAULT_OFF	(0ULL << 8)
+#define PDC_CHASSIS_LED_FAULT_FLASH	(1ULL << 8)
+#define PDC_CHASSIS_LED_FAULT_ON	(2ULL << 8)
+#define PDC_CHASSIS_LED_FAULT_NC	(3ULL << 8)
+#define PDC_CHASSIS_LED_VALID		(1ULL << 10)
+
+/* 
+ * Valid PDC PAT LED states combinations
+ */
+
+/* System running normally */
+#define PDC_CHASSIS_LSTATE_RUN_NORMAL	(PDC_CHASSIS_LED_RUN_ON		| \
+					 PDC_CHASSIS_LED_ATTN_OFF	| \
+					 PDC_CHASSIS_LED_FAULT_OFF	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* System crashed and rebooted itself successfully */
+#define PDC_CHASSIS_LSTATE_RUN_CRASHREC	(PDC_CHASSIS_LED_RUN_ON		| \
+					 PDC_CHASSIS_LED_ATTN_OFF	| \
+					 PDC_CHASSIS_LED_FAULT_FLASH	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* There was a system interruption that did not take the system down */
+#define PDC_CHASSIS_LSTATE_RUN_SYSINT	(PDC_CHASSIS_LED_RUN_ON		| \
+					 PDC_CHASSIS_LED_ATTN_FLASH	| \
+					 PDC_CHASSIS_LED_FAULT_OFF	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* System running and unexpected reboot or non-critical error detected */
+#define PDC_CHASSIS_LSTATE_RUN_NCRIT	(PDC_CHASSIS_LED_RUN_ON		| \
+					 PDC_CHASSIS_LED_ATTN_FLASH	| \
+					 PDC_CHASSIS_LED_FAULT_FLASH	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Executing non-OS code */
+#define PDC_CHASSIS_LSTATE_NONOS	(PDC_CHASSIS_LED_RUN_FLASH	| \
+					 PDC_CHASSIS_LED_ATTN_OFF	| \
+					 PDC_CHASSIS_LED_FAULT_OFF	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Boot failed - Executing non-OS code */
+#define PDC_CHASSIS_LSTATE_NONOS_BFAIL	(PDC_CHASSIS_LED_RUN_FLASH	| \
+					 PDC_CHASSIS_LED_ATTN_OFF	| \
+					 PDC_CHASSIS_LED_FAULT_ON	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Unexpected reboot occured - Executing non-OS code */
+#define PDC_CHASSIS_LSTATE_NONOS_UNEXP	(PDC_CHASSIS_LED_RUN_FLASH	| \
+					 PDC_CHASSIS_LED_ATTN_OFF	| \
+					 PDC_CHASSIS_LED_FAULT_FLASH	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Executing non-OS code - Non-critical error detected */
+#define PDC_CHASSIS_LSTATE_NONOS_NCRIT	(PDC_CHASSIS_LED_RUN_FLASH	| \
+					 PDC_CHASSIS_LED_ATTN_FLASH	| \
+					 PDC_CHASSIS_LED_FAULT_OFF	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Boot failed - Executing non-OS code - Non-critical error detected */
+#define PDC_CHASSIS_LSTATE_BFAIL_NCRIT	(PDC_CHASSIS_LED_RUN_FLASH	| \
+					 PDC_CHASSIS_LED_ATTN_FLASH	| \
+					 PDC_CHASSIS_LED_FAULT_ON	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Unexpected reboot/recovering - Executing non-OS code - Non-critical error detected */
+#define PDC_CHASSIS_LSTATE_UNEXP_NCRIT	(PDC_CHASSIS_LED_RUN_FLASH	| \
+					 PDC_CHASSIS_LED_ATTN_FLASH	| \
+					 PDC_CHASSIS_LED_FAULT_FLASH	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Cannot execute PDC */
+#define PDC_CHASSIS_LSTATE_CANNOT_PDC	(PDC_CHASSIS_LED_RUN_OFF	| \
+					 PDC_CHASSIS_LED_ATTN_OFF	| \
+					 PDC_CHASSIS_LED_FAULT_OFF	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Boot failed - OS not up - PDC has detected a failure that prevents boot */
+#define PDC_CHASSIS_LSTATE_FATAL_BFAIL	(PDC_CHASSIS_LED_RUN_OFF	| \
+					 PDC_CHASSIS_LED_ATTN_OFF	| \
+					 PDC_CHASSIS_LED_FAULT_ON	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* No code running - Non-critical error detected (double fault situation) */
+#define PDC_CHASSIS_LSTATE_NOCODE_NCRIT	(PDC_CHASSIS_LED_RUN_OFF	| \
+					 PDC_CHASSIS_LED_ATTN_FLASH	| \
+					 PDC_CHASSIS_LED_FAULT_OFF	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* Boot failed - OS not up - Fatal failure detected - Non-critical error detected */
+#define PDC_CHASSIS_LSTATE_FATAL_NCRIT	(PDC_CHASSIS_LED_RUN_OFF	| \
+					 PDC_CHASSIS_LED_ATTN_FLASH	| \
+					 PDC_CHASSIS_LED_FAULT_ON	| \
+					 PDC_CHASSIS_LED_VALID		)
+/* All other states are invalid */
+
+
+/*
+ * --------------
+ * PDC Log events
+ * --------------
+ * Here follows bits needed to fill up the log event sent to PDC_CHASSIS
+ * The log message contains: Alert level, Source, Source detail,
+ * Source ID, Problem detail, Caller activity, Activity status, 
+ * Caller subactivity, Reporting entity type, Reporting entity ID,
+ * Data type, Unique message ID and EOM. 
+ */
+
+/* Alert level */
+#define PDC_CHASSIS_ALERT_FORWARD	(0ULL << 36)	/* no failure detected */
+#define PDC_CHASSIS_ALERT_SERPROC	(1ULL << 36)	/* service proc - no failure */
+#define PDC_CHASSIS_ALERT_NURGENT	(2ULL << 36)	/* non-urgent operator attn */
+#define PDC_CHASSIS_ALERT_BLOCKED	(3ULL << 36)	/* system blocked */
+#define PDC_CHASSIS_ALERT_CONF_CHG	(4ULL << 36)	/* unexpected configuration change */
+#define PDC_CHASSIS_ALERT_ENV_PB	(5ULL << 36)	/* boot possible, environmental pb */
+#define PDC_CHASSIS_ALERT_PENDING	(6ULL << 36)	/* boot possible, pending failure */
+#define PDC_CHASSIS_ALERT_PERF_IMP	(8ULL << 36)	/* boot possible, performance impaired */
+#define PDC_CHASSIS_ALERT_FUNC_IMP	(10ULL << 36)	/* boot possible, functionality impaired */
+#define PDC_CHASSIS_ALERT_SOFT_FAIL	(12ULL << 36)	/* software failure */
+#define PDC_CHASSIS_ALERT_HANG		(13ULL << 36)	/* system hang */
+#define PDC_CHASSIS_ALERT_ENV_FATAL	(14ULL << 36)	/* fatal power or environmental pb */
+#define PDC_CHASSIS_ALERT_HW_FATAL	(15ULL << 36)	/* fatal hardware problem */
+
+/* Source */
+#define PDC_CHASSIS_SRC_NONE		(0ULL << 28)	/* unknown, no source stated */
+#define PDC_CHASSIS_SRC_PROC		(1ULL << 28)	/* processor */
+/* For later use ? */
+#define PDC_CHASSIS_SRC_PROC_CACHE	(2ULL << 28)	/* processor cache*/
+#define PDC_CHASSIS_SRC_PDH		(3ULL << 28)	/* processor dependent hardware */
+#define PDC_CHASSIS_SRC_PWR		(4ULL << 28)	/* power */
+#define PDC_CHASSIS_SRC_FAB		(5ULL << 28)	/* fabric connector */
+#define PDC_CHASSIS_SRC_PLATi		(6ULL << 28)	/* platform */
+#define PDC_CHASSIS_SRC_MEM		(7ULL << 28)	/* memory */
+#define PDC_CHASSIS_SRC_IO		(8ULL << 28)	/* I/O */
+#define PDC_CHASSIS_SRC_CELL		(9ULL << 28)	/* cell */
+#define PDC_CHASSIS_SRC_PD		(10ULL << 28)	/* protected domain */
+
+/* Source detail field */
+#define PDC_CHASSIS_SRC_D_PROC		(1ULL << 24)	/* processor general */
+
+/* Source ID - platform dependent */
+#define PDC_CHASSIS_SRC_ID_UNSPEC	(0ULL << 16)
+
+/* Problem detail - problem source dependent */
+#define PDC_CHASSIS_PB_D_PROC_NONE	(0ULL << 32)	/* no problem detail */
+#define PDC_CHASSIS_PB_D_PROC_TIMEOUT	(4ULL << 32)	/* timeout */
+
+/* Caller activity */
+#define PDC_CHASSIS_CALL_ACT_HPUX_BL	(7ULL << 12)	/* Boot Loader */
+#define PDC_CHASSIS_CALL_ACT_HPUX_PD	(8ULL << 12)	/* SAL_PD activities */
+#define PDC_CHASSIS_CALL_ACT_HPUX_EVENT	(9ULL << 12)	/* SAL_EVENTS activities */
+#define PDC_CHASSIS_CALL_ACT_HPUX_IO	(10ULL << 12)	/* SAL_IO activities */
+#define PDC_CHASSIS_CALL_ACT_HPUX_PANIC	(11ULL << 12)	/* System panic */
+#define PDC_CHASSIS_CALL_ACT_HPUX_INIT	(12ULL << 12)	/* System initialization */
+#define PDC_CHASSIS_CALL_ACT_HPUX_SHUT	(13ULL << 12)	/* System shutdown */
+#define PDC_CHASSIS_CALL_ACT_HPUX_WARN	(14ULL << 12)	/* System warning */
+#define PDC_CHASSIS_CALL_ACT_HPUX_DU	(15ULL << 12)	/* Display_Activity() update */
+
+/* Activity status - implementation dependent */
+#define PDC_CHASSIS_ACT_STATUS_UNSPEC	(0ULL << 0)
+
+/* Caller subactivity - implementation dependent */
+/* FIXME: other subactivities ? */
+#define PDC_CHASSIS_CALL_SACT_UNSPEC	(0ULL << 4)	/* implementation dependent */
+
+/* Reporting entity type */
+#define PDC_CHASSIS_RET_GENERICOS	(12ULL << 52)	/* generic OSes */
+#define PDC_CHASSIS_RET_IA64_NT		(13ULL << 52)	/* IA-64 NT */
+#define PDC_CHASSIS_RET_HPUX		(14ULL << 52)	/* HP-UX */
+#define PDC_CHASSIS_RET_DIAG		(15ULL << 52)	/* offline diagnostics & utilities */
+
+/* Reporting entity ID */
+#define PDC_CHASSIS_REID_UNSPEC		(0ULL << 44)
+
+/* Data type */
+#define PDC_CHASSIS_DT_NONE		(0ULL << 59)	/* data field unused */
+/* For later use ? Do we need these ? */
+#define PDC_CHASSIS_DT_PHYS_ADDR	(1ULL << 59)	/* physical address */
+#define PDC_CHASSIS_DT_DATA_EXPECT	(2ULL << 59)	/* expected data */
+#define PDC_CHASSIS_DT_ACTUAL		(3ULL << 59)	/* actual data */
+#define PDC_CHASSIS_DT_PHYS_LOC		(4ULL << 59)	/* physical location */
+#define PDC_CHASSIS_DT_PHYS_LOC_EXT	(5ULL << 59)	/* physical location extension */
+#define PDC_CHASSIS_DT_TAG		(6ULL << 59)	/* tag */
+#define PDC_CHASSIS_DT_SYNDROME		(7ULL << 59)	/* syndrome */
+#define PDC_CHASSIS_DT_CODE_ADDR	(8ULL << 59)	/* code address */
+#define PDC_CHASSIS_DT_ASCII_MSG	(9ULL << 59)	/* ascii message */
+#define PDC_CHASSIS_DT_POST		(10ULL << 59)	/* POST code */
+#define PDC_CHASSIS_DT_TIMESTAMP	(11ULL << 59)	/* timestamp */
+#define PDC_CHASSIS_DT_DEV_STAT		(12ULL << 59)	/* device status */
+#define PDC_CHASSIS_DT_DEV_TYPE		(13ULL << 59)	/* device type */
+#define PDC_CHASSIS_DT_PB_DET		(14ULL << 59)	/* problem detail */
+#define PDC_CHASSIS_DT_ACT_LEV		(15ULL << 59)	/* activity level/timeout */
+#define PDC_CHASSIS_DT_SER_NUM		(16ULL << 59)	/* serial number */
+#define PDC_CHASSIS_DT_REV_NUM		(17ULL << 59)	/* revision number */
+#define PDC_CHASSIS_DT_INTERRUPT	(18ULL << 59)	/* interruption information */
+#define PDC_CHASSIS_DT_TEST_NUM		(19ULL << 59)	/* test number */
+#define PDC_CHASSIS_DT_STATE_CHG	(20ULL << 59)	/* major changes in system state */
+#define PDC_CHASSIS_DT_PROC_DEALLOC	(21ULL << 59)	/* processor deallocate */
+#define PDC_CHASSIS_DT_RESET		(30ULL << 59)	/* reset type and cause */
+#define PDC_CHASSIS_DT_PA_LEGACY	(31ULL << 59)	/* legacy PA hex chassis code */
+
+/* System states - part of major changes in system state data field */
+#define PDC_CHASSIS_SYSTATE_BSTART	(0ULL << 0)	/* boot start */
+#define PDC_CHASSIS_SYSTATE_BCOMP	(1ULL << 0)	/* boot complete */
+#define PDC_CHASSIS_SYSTATE_CHANGE	(2ULL << 0)	/* major change */
+#define PDC_CHASSIS_SYSTATE_LED		(3ULL << 0)	/* LED change */
+#define PDC_CHASSIS_SYSTATE_PANIC	(9ULL << 0)	/* OS Panic */
+#define PDC_CHASSIS_SYSTATE_DUMP	(10ULL << 0)	/* memory dump */
+#define PDC_CHASSIS_SYSTATE_HPMC	(11ULL << 0)	/* processing HPMC */
+#define PDC_CHASSIS_SYSTATE_HALT	(15ULL << 0)	/* system halted */
+
+/* Message ID */
+#define PDC_CHASSIS_MSG_ID		(0ULL << 40)	/* we do not handle msg IDs atm */
+
+/* EOM - separates log entries */
+#define PDC_CHASSIS_EOM_CLEAR		(0ULL << 43)
+#define PDC_CHASSIS_EOM_SET		(1ULL << 43)
+
+/*
+ * Preformated well known messages
+ */
+
+/* Boot started */
+#define PDC_CHASSIS_PMSG_BSTART		(PDC_CHASSIS_ALERT_SERPROC	| \
+					 PDC_CHASSIS_SRC_PROC		| \
+					 PDC_CHASSIS_SRC_D_PROC		| \
+					 PDC_CHASSIS_SRC_ID_UNSPEC	| \
+					 PDC_CHASSIS_PB_D_PROC_NONE	| \
+					 PDC_CHASSIS_CALL_ACT_HPUX_INIT	| \
+					 PDC_CHASSIS_ACT_STATUS_UNSPEC	| \
+					 PDC_CHASSIS_CALL_SACT_UNSPEC	| \
+					 PDC_CHASSIS_RET_HPUX		| \
+					 PDC_CHASSIS_REID_UNSPEC	| \
+					 PDC_CHASSIS_DT_STATE_CHG	| \
+					 PDC_CHASSIS_SYSTATE_BSTART	| \
+					 PDC_CHASSIS_MSG_ID		| \
+					 PDC_CHASSIS_EOM_SET		)
+
+/* Boot complete */
+#define PDC_CHASSIS_PMSG_BCOMPLETE	(PDC_CHASSIS_ALERT_SERPROC	| \
+					 PDC_CHASSIS_SRC_PROC		| \
+					 PDC_CHASSIS_SRC_D_PROC		| \
+					 PDC_CHASSIS_SRC_ID_UNSPEC	| \
+					 PDC_CHASSIS_PB_D_PROC_NONE	| \
+					 PDC_CHASSIS_CALL_ACT_HPUX_INIT	| \
+					 PDC_CHASSIS_ACT_STATUS_UNSPEC	| \
+					 PDC_CHASSIS_CALL_SACT_UNSPEC	| \
+					 PDC_CHASSIS_RET_HPUX		| \
+					 PDC_CHASSIS_REID_UNSPEC	| \
+					 PDC_CHASSIS_DT_STATE_CHG	| \
+					 PDC_CHASSIS_SYSTATE_BCOMP	| \
+					 PDC_CHASSIS_MSG_ID		| \
+					 PDC_CHASSIS_EOM_SET		)
+
+/* Shutdown */
+#define PDC_CHASSIS_PMSG_SHUTDOWN	(PDC_CHASSIS_ALERT_SERPROC	| \
+					 PDC_CHASSIS_SRC_PROC		| \
+					 PDC_CHASSIS_SRC_D_PROC		| \
+					 PDC_CHASSIS_SRC_ID_UNSPEC	| \
+					 PDC_CHASSIS_PB_D_PROC_NONE	| \
+					 PDC_CHASSIS_CALL_ACT_HPUX_SHUT	| \
+					 PDC_CHASSIS_ACT_STATUS_UNSPEC	| \
+					 PDC_CHASSIS_CALL_SACT_UNSPEC	| \
+					 PDC_CHASSIS_RET_HPUX		| \
+					 PDC_CHASSIS_REID_UNSPEC	| \
+					 PDC_CHASSIS_DT_STATE_CHG	| \
+					 PDC_CHASSIS_SYSTATE_HALT	| \
+					 PDC_CHASSIS_MSG_ID		| \
+					 PDC_CHASSIS_EOM_SET		)
+
+/* Panic */
+#define PDC_CHASSIS_PMSG_PANIC		(PDC_CHASSIS_ALERT_SOFT_FAIL	| \
+					 PDC_CHASSIS_SRC_PROC		| \
+					 PDC_CHASSIS_SRC_D_PROC		| \
+					 PDC_CHASSIS_SRC_ID_UNSPEC	| \
+					 PDC_CHASSIS_PB_D_PROC_NONE	| \
+					 PDC_CHASSIS_CALL_ACT_HPUX_PANIC| \
+					 PDC_CHASSIS_ACT_STATUS_UNSPEC	| \
+					 PDC_CHASSIS_CALL_SACT_UNSPEC	| \
+					 PDC_CHASSIS_RET_HPUX		| \
+					 PDC_CHASSIS_REID_UNSPEC	| \
+					 PDC_CHASSIS_DT_STATE_CHG	| \
+					 PDC_CHASSIS_SYSTATE_PANIC	| \
+					 PDC_CHASSIS_MSG_ID		| \
+					 PDC_CHASSIS_EOM_SET		)
+
+// FIXME: extrapolated data
+/* HPMC */
+#define PDC_CHASSIS_PMSG_HPMC		(PDC_CHASSIS_ALERT_CONF_CHG /*?*/	| \
+					 PDC_CHASSIS_SRC_PROC		| \
+					 PDC_CHASSIS_SRC_D_PROC		| \
+					 PDC_CHASSIS_SRC_ID_UNSPEC	| \
+					 PDC_CHASSIS_PB_D_PROC_NONE	| \
+					 PDC_CHASSIS_CALL_ACT_HPUX_WARN	| \
+					 PDC_CHASSIS_RET_HPUX		| \
+					 PDC_CHASSIS_DT_STATE_CHG	| \
+					 PDC_CHASSIS_SYSTATE_HPMC	| \
+					 PDC_CHASSIS_MSG_ID		| \
+					 PDC_CHASSIS_EOM_SET		)
+
+/* LPMC */
+#define PDC_CHASSIS_PMSG_LPMC		(PDC_CHASSIS_ALERT_BLOCKED /*?*/| \
+					 PDC_CHASSIS_SRC_PROC		| \
+					 PDC_CHASSIS_SRC_D_PROC		| \
+					 PDC_CHASSIS_SRC_ID_UNSPEC	| \
+					 PDC_CHASSIS_PB_D_PROC_NONE	| \
+					 PDC_CHASSIS_CALL_ACT_HPUX_WARN	| \
+					 PDC_CHASSIS_ACT_STATUS_UNSPEC	| \
+					 PDC_CHASSIS_CALL_SACT_UNSPEC	| \
+					 PDC_CHASSIS_RET_HPUX		| \
+					 PDC_CHASSIS_REID_UNSPEC	| \
+					 PDC_CHASSIS_DT_STATE_CHG	| \
+					 PDC_CHASSIS_SYSTATE_CHANGE	| \
+					 PDC_CHASSIS_MSG_ID		| \
+					 PDC_CHASSIS_EOM_SET		)
+
+#endif /* _PARISC_PDC_CHASSIS_H */
+/* vim: set ts=8 */

--------------050007030408050205010406--
