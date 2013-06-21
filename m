From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: more capabilities info in /proc/cpuinfo
Date: Fri, 21 Jun 2013 23:32:44 +0200
Message-ID: <20130621213244.GA19970@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index c8fb61e..4997909 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -374,7 +374,20 @@ show_cpuinfo (struct seq_file *m, void *v)
 			seq_printf(m, " os32");
 		if (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS64)
 			seq_printf(m, " os64");
-		seq_printf(m, "\n");
+		if (boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC)
+			seq_printf(m, " iopdir_fdc");
+		switch (boot_cpu_data.pdc.capabilities & PDC_MODEL_NVA_MASK) {
+			case PDC_MODEL_NVA_SUPPORTED:
+				seq_printf(m, " nva_supported");
+				break;
+			case PDC_MODEL_NVA_SLOW:
+				seq_printf(m, " nva_slow");
+				break;
+			case PDC_MODEL_NVA_UNSUPPORTED:
+				seq_printf(m, " needs_equivalent_aliasing");
+				break;
+		}
+		seq_printf(m, " (0x%02lx)\n", boot_cpu_data.pdc.capabilities);
 
 		seq_printf(m, "model\t\t: %s\n"
 				"model name\t: %s\n",
