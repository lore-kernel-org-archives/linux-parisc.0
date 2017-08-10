From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc/random: Add machine specific randomness
Date: Thu, 10 Aug 2017 19:20:47 +0200
Message-ID: <20170810172047.GA3119@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add some machine-specific information like values of cr16 cycle counter,
machine-specific software ID and machine model to the random generator.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 0ab3277..6b6fe8d 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -30,6 +30,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
+#include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/cpu.h>
 #include <asm/param.h>
@@ -237,28 +238,45 @@ static int processor_probe(struct parisc_device *dev)
  */
 void __init collect_boot_cpu_data(void)
 {
+	unsigned long cr16_seed;
+
 	memset(&boot_cpu_data, 0, sizeof(boot_cpu_data));
 
+	cr16_seed = get_cycles();
+	add_device_randomness(&cr16_seed, sizeof(cr16_seed));
+
 	boot_cpu_data.cpu_hz = 100 * PAGE0->mem_10msec; /* Hz of this PARISC */
 
 	/* get CPU-Model Information... */
 #define p ((unsigned long *)&boot_cpu_data.pdc.model)
-	if (pdc_model_info(&boot_cpu_data.pdc.model) == PDC_OK)
+	if (pdc_model_info(&boot_cpu_data.pdc.model) == PDC_OK) {
 		printk(KERN_INFO 
 			"model %08lx %08lx %08lx %08lx %08lx %08lx %08lx %08lx %08lx\n",
 			p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8]);
+
+		add_device_randomness(&boot_cpu_data.pdc.model,
+			sizeof(boot_cpu_data.pdc.model));
+	}
 #undef p
 
-	if (pdc_model_versions(&boot_cpu_data.pdc.versions, 0) == PDC_OK)
+	if (pdc_model_versions(&boot_cpu_data.pdc.versions, 0) == PDC_OK) {
 		printk(KERN_INFO "vers  %08lx\n", 
 			boot_cpu_data.pdc.versions);
 
-	if (pdc_model_cpuid(&boot_cpu_data.pdc.cpuid) == PDC_OK)
+		add_device_randomness(&boot_cpu_data.pdc.versions,
+			sizeof(boot_cpu_data.pdc.versions));
+	}
+
+	if (pdc_model_cpuid(&boot_cpu_data.pdc.cpuid) == PDC_OK) {
 		printk(KERN_INFO "CPUID vers %ld rev %ld (0x%08lx)\n",
 			(boot_cpu_data.pdc.cpuid >> 5) & 127,
 			boot_cpu_data.pdc.cpuid & 31,
 			boot_cpu_data.pdc.cpuid);
 
+		add_device_randomness(&boot_cpu_data.pdc.cpuid,
+			sizeof(boot_cpu_data.pdc.cpuid));
+	}
+
 	if (pdc_model_capabilities(&boot_cpu_data.pdc.capabilities) == PDC_OK)
 		printk(KERN_INFO "capabilities 0x%lx\n",
 			boot_cpu_data.pdc.capabilities);
