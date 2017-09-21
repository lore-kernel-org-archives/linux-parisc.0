From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Move init_per_cpu() into init section
Date: Thu, 21 Sep 2017 21:22:27 +0200
Message-ID: <20170921192227.GA1135@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
index a5dc9066c6d8..ad9c9c3b4136 100644
--- a/arch/parisc/include/asm/smp.h
+++ b/arch/parisc/include/asm/smp.h
@@ -1,6 +1,7 @@
 #ifndef __ASM_SMP_H
 #define __ASM_SMP_H
 
+extern int init_per_cpu(int cpuid);
 
 #if defined(CONFIG_SMP)
 
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index ad7310029fe0..45cc65902fce 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -320,7 +320,7 @@ void __init collect_boot_cpu_data(void)
  *
  * o Enable CPU profiling hooks.
  */
-int init_per_cpu(int cpunum)
+int __init init_per_cpu(int cpunum)
 {
 	int ret;
 	struct pdc_coproc_cfg coproc_cfg;
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index fd751b9ae9d9..47cdba759e30 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -116,7 +116,6 @@ void __init dma_ops_init(void)
 }
 #endif
 
-extern int init_per_cpu(int cpuid);
 extern void collect_boot_cpu_data(void);
 
 void __init setup_arch(char **cmdline_p)
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 63365106ea19..30c28ab14540 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -255,12 +255,11 @@ void arch_send_call_function_single_ipi(int cpu)
 static void __init
 smp_cpu_init(int cpunum)
 {
-	extern int init_per_cpu(int);  /* arch/parisc/kernel/processor.c */
 	extern void init_IRQ(void);    /* arch/parisc/kernel/irq.c */
 	extern void start_cpu_itimer(void); /* arch/parisc/kernel/time.c */
 
 	/* Set modes and Enable floating point coprocessor */
-	(void) init_per_cpu(cpunum);
+	init_per_cpu(cpunum);
 
 	disable_sr_hashing();
 
