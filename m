Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 9 Feb 2003 09:00:59 -0700
To: parisc-linux@parisc-linux.org
Message-ID: <20030209160059.GA17385@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: willy@dsl2.external.hp.com (Matthew Wilcox)
Subject: [parisc-linux] Revert sr_hashing changes
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

I've also taken the opportunity to do a little misc cleanup.
Just checking it compiles, then I'll commit.

Index: arch/parisc/kernel/processor.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/processor.c,v
retrieving revision 1.16
diff -u -p -r1.16 processor.c
--- arch/parisc/kernel/processor.c	8 Feb 2003 22:22:42 -0000	1.16
+++ arch/parisc/kernel/processor.c	9 Feb 2003 13:30:50 -0000
@@ -273,7 +273,6 @@ int __init init_per_cpu(int cpunum)
 {
 	int ret;
 	struct pdc_coproc_cfg coproc_cfg;
-	extern void disable_sr_hashing(void);	/* from cache.c */
 
 	ret = pdc_coproc_cfg(&coproc_cfg);
 
@@ -310,8 +309,6 @@ int __init init_per_cpu(int cpunum)
 
 	/* FUTURE: Enable Performance Monitor : ccr bit 0x20 */
 	init_percpu_prof(cpunum);
-
-        disable_sr_hashing();
 
 	return ret;
 }
Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/cache.c,v
retrieving revision 1.23
diff -u -p -r1.23 cache.c
--- arch/parisc/kernel/cache.c	8 Feb 2003 22:22:42 -0000	1.23
+++ arch/parisc/kernel/cache.c	9 Feb 2003 13:30:50 -0000
@@ -194,33 +194,30 @@ cache_init(void)
 
 void disable_sr_hashing(void)
 {
-    int srhash_type;
+	int srhash_type;
 
-    if (boot_cpu_data.cpu_type == pcxl2)
-	return; /* pcxl2 doesn't support space register hashing */
+	switch (boot_cpu_data.cpu_type) {
+	case pcx: /* We shouldn't get this far.  setup.c should prevent it. */
+		BUG();
+		return;
+
+	case pcxs:
+	case pcxt:
+	case pcxt_:
+		srhash_type = SRHASH_PCXST;
+		break;
+
+	case pcxl:
+		srhash_type = SRHASH_PCXL;
+		break;
+
+	case pcxl2: /* pcxl2 doesn't support space register hashing */
+		return;
+
+	default: /* Currently all PA2.0 machines use the same ins. sequence */
+		srhash_type = SRHASH_PA20;
+		break;
+	}
 
-    switch (boot_cpu_data.cpu_type) {
-
-    case pcx:
-	BUG(); /* We shouldn't get here. code in setup.c should prevent it */
-	return;
-
-    case pcxs:
-    case pcxt:
-    case pcxt_:
-	srhash_type = SRHASH_PCXST;
-	break;
-
-    case pcxl:
-	srhash_type = SRHASH_PCXL;
-	break;
-
-    default: /* Currently all PA2.0 machines use the same ins. sequence */
-	srhash_type = SRHASH_PA20;
-	break;
-    }
-
-    disable_sr_hashing_asm(srhash_type);
-
-    mb();
+	disable_sr_hashing_asm(srhash_type);
 }
Index: arch/parisc/kernel/smp.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/smp.c,v
retrieving revision 1.21
diff -u -p -r1.21 smp.c
--- arch/parisc/kernel/smp.c	8 Feb 2003 22:22:42 -0000	1.21
+++ arch/parisc/kernel/smp.c	9 Feb 2003 13:30:50 -0000
@@ -33,6 +33,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/mm.h>
 #include <linux/delay.h>
+#include <linux/reboot.h>
 
 #include <asm/system.h>
 #include <asm/atomic.h>
@@ -434,21 +435,21 @@ smp_cpu_init(int cpunum)
 	extern void init_IRQ(void);    /* arch/parisc/kernel/irq.c */
 
 	/* Set modes and Enable floating point coprocessor */
-	(void) init_per_cpu(cpunum);
+	init_per_cpu(cpunum);
 
-	/* Well, support 2.4 linux scheme as well. */
-	if (test_and_set_bit(cpunum, (unsigned long *) (&cpu_online_map)))
-	{
-		extern void machine_halt(void); /* arch/parisc.../process.c */
+	disable_sr_hashing();
+	mb();
 
+	/* Well, support 2.4 linux scheme as well. */
+	if (test_and_set_bit(cpunum, (unsigned long *) (&cpu_online_map))) {
 		printk(KERN_CRIT "CPU#%d already initialized!\n", cpunum);
 		machine_halt();
-	}  
+	}
 
 	/* Initialise the idle task for this CPU */
 	atomic_inc(&init_mm.mm_count);
 	current->active_mm = &init_mm;
-	if(current->mm)
+	if (current->mm)
 		BUG();
 	enter_lazy_tlb(&init_mm, current, cpunum);
 
