From: Colin Watson <cjwatson@canonical.com>
Subject: parisc: expose 32/64-bit capabilities in cpuinfo
Date: Fri, 30 Jan 2009 01:03:50 +0000
Message-ID: <20090130010350.GH7367@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

It'd be rather useful for debian-installer if we could get hold of
accurate firmware information on whether only 32-bit kernels are
supported, only 64-bit kernels, or both; this would allow us to present
an accurate menu of kernel packages if more than one is available,
rather than the user having to guess. This patch attempts to expose it
in cpuinfo.

I adjusted pdc_model_capabilities to cope with a potential
PDC_INVALID_ARG return as the firmware manual instructs, by assuming
32-bit only. This may be the wrong place for it.

I made up user-visible capability names by total fiat and for the moment
ignored the other bits that may appear in the capabilities word.

I have no PA-RISC machine myself to test on, and no PA experience
either, so I rather hope that somebody will kind-heartedly take this and
fix it up if needed. I ran it past Dann Frazier on IRC and he said
"looks good to me", but I think without testing.

Also, this is against the Ubuntu 2.6.28 kernel tree since that's what I
had handy and I was a bit tight on disk space to slurp down another
tree. Sorry if it's skewed in any relevant way; I'll be happy to adjust
if necessary.

Thanks in advance!

Signed-off-by: Colin Watson <cjwatson@canonical.com>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index c584b00..01e8063 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -49,6 +49,8 @@
 #define PDC_MODEL_CPU_ID	6	/* returns cpu-id (only newer machines!) */
 #define PDC_MODEL_CAPABILITIES	7	/* returns OS32/OS64-flags	*/
 /* Values for PDC_MODEL_CAPABILITIES non-equivalent virtual aliasing support */
+#define  PDC_MODEL_OS64			(1 << 0)
+#define  PDC_MODEL_OS32			(1 << 1)
 #define  PDC_MODEL_IOPDIR_FDC		(1 << 2)
 #define  PDC_MODEL_NVA_MASK		(3 << 4)
 #define  PDC_MODEL_NVA_SUPPORTED	(0 << 4)
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 03f26bd..cf118ef 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -527,7 +527,11 @@ int pdc_model_capabilities(unsigned long *capabilities)
         pdc_result[0] = 0; /* preset zero (call may not be implemented!) */
         retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_CAPABILITIES, __pa(pdc_result), 0);
         convert_to_wide(pdc_result);
-        *capabilities = pdc_result[0];
+        if (retval == PDC_OK) {
+                *capabilities = pdc_result[0];
+        } else {
+                *capabilities = PDC_MODEL_OS32;
+        }
         spin_unlock_irqrestore(&pdc_lock, flags);
 
         return retval;
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 370086f..4b54479 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -362,6 +362,13 @@ show_cpuinfo (struct seq_file *m, void *v)
 				 boot_cpu_data.cpu_hz / 1000000,
 				 boot_cpu_data.cpu_hz % 1000000  );
 
+		seq_printf(m, "capabilities\t:");
+		if (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS32)
+			seq_printf(m, " os32");
+		if (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS64)
+			seq_printf(m, " os64");
+		seq_printf(m, "\n");
+
 		seq_printf(m, "model\t\t: %s\n"
 				"model name\t: %s\n",
 				 boot_cpu_data.pdc.sys_model_name,

-- 
Colin Watson                                    [cjwatson@canonical.com]
