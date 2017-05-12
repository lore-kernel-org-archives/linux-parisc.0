From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Stop CPUs via PAT firmware before system halt or
 reboot.
Date: Fri, 12 May 2017 18:55:13 +0200
Message-ID: <20170512165513.GA23551@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave reported that he had issued a "shutdown -r" and a panic occurred during
the reboot while all CPUs were still up. After this, stall messages were output
to console after the firmware version was printed.

To avoid that issue, add functions to call PAT firmware to stop all CPUs (with
the exception of the currently running CPU) before a panic reboot or a system
halt is issued.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index 32e105f..0ef789e 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -307,6 +307,7 @@ extern int pdc_pat_cell_module(unsigned long *actcnt, unsigned long ploc, unsign
 extern int pdc_pat_cell_num_to_loc(void *, unsigned long);
 
 extern int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, unsigned long hpa);
+extern int pdc_pat_cpu_stop_cpu(unsigned long hpa, unsigned long hpa_vec);
 
 extern int pdc_pat_pd_get_addr_map(unsigned long *actual_len, void *mem_addr, unsigned long count, unsigned long offset);
 
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 9819025..3f55db6 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1308,6 +1308,31 @@ int pdc_pat_cpu_get_number(struct pdc_pat_cpu_num *cpu_info, unsigned long hpa)
 }
 
 /**
+ * pdc_pat_cpu_stop_cpu - Stop current cpu.
+ * @hpa: The Hard Physical Address of the CPU which should be informed when
+ *       current cpu has stopped.
+ * @hpa_vec: Mask of interrupts which should be signalled on CPU at @hpa.
+ *
+ * Stop the CPU in which the call is made. Flushes caches and purges TLB and
+ * places CPU in a firmware loop. If the CPU is the last in a cell, an
+ * interrupt message is sent to the CPU at @hpa.
+ */
+int pdc_pat_cpu_stop_cpu(unsigned long hpa, unsigned long hpa_vec)
+{
+	int retval;
+	unsigned long flags;
+
+	if (!hpa)
+		hpa_vec = -1UL;
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_PAT_CPU, PDC_PAT_CPU_STOP, hpa, hpa_vec);
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
+
+/**
  * pdc_pat_get_irt_size - Retrieve the number of entries in the cell's interrupt table.
  * @num_entries: The return value.
  * @cell_num: The target cell.
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 4516a5b..1615a9a 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -98,6 +98,9 @@ void machine_restart(char *cmd)
 #endif
 	/* set up a new led state on systems shipped with a LED State panel */
 	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
+
+	/* stops all CPUs but the current one */
+	smp_send_stop();
 	
 	/* "Normal" system reset */
 	pdc_do_reset();
@@ -116,6 +119,9 @@ void machine_halt(void)
 	** The LED/ChassisCodes are updated by the led_halt()
 	** function, called by the reboot notifier chain.
 	*/
+
+	/* stops all CPUs but the current one */
+	smp_send_stop();
 }
 
 void (*chassis_power_off)(void);
@@ -126,6 +132,9 @@ void (*chassis_power_off)(void);
  */
 void machine_power_off(void)
 {
+	/* stops all CPUs but the current one */
+	smp_send_stop();
+
 	/* If there is a registered power off handler, call it. */
 	if (chassis_power_off)
 		chassis_power_off();
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 6336510..afd9142 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -42,6 +42,7 @@
 #include <asm/irq.h>		/* for CPU_IRQ_REGION and friends */
 #include <asm/mmu_context.h>
 #include <asm/page.h>
+#include <asm/pdcpat.h>
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/processor.h>
@@ -112,6 +113,9 @@ halt_processor(void)
 	/* REVISIT : does PM *know* this CPU isn't available? */
 	set_cpu_online(smp_processor_id(), false);
 	local_irq_disable();
+#ifdef CONFIG_64BIT
+	pdc_pat_cpu_stop_cpu(0, -1UL);
+#endif
 	for (;;)
 		;
 }
