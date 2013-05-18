From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: show number of FPE and unaligned access handler
 calls in /proc/interrupts
Date: Sat, 18 May 2013 21:35:44 +0200
Message-ID: <20130518193544.GA25925@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Show number of floating point assistant and unaligned access fixup
handler in /proc/interrupts file. 

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index c19f713..4c6dd8d 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -28,6 +28,8 @@ typedef struct {
 	unsigned int irq_resched_count;
 	unsigned int irq_call_count;
 #endif
+	unsigned int irq_unaligned_count;
+	unsigned int irq_fpassist_count;
 	unsigned int irq_tlb_count;
 } ____cacheline_aligned irq_cpustat_t;
 
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 55237a7..9c2d953 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -188,6 +188,14 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
 	seq_puts(p, "  Function call interrupts\n");
 #endif
+	seq_printf(p, "%*s: ", prec, "UAH");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_unaligned_count);
+	seq_puts(p, "  Unaligned access handler traps\n");
+	seq_printf(p, "%*s: ", prec, "FPA");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_fpassist_count);
+	seq_puts(p, "  Floating point assist traps\n");
 	seq_printf(p, "%*s: ", prec, "TLB");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_tlb_count);
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index fe41a98..04e47c6 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -646,6 +646,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	case 14:
 		/* Assist Exception Trap, i.e. floating point exception. */
 		die_if_kernel("Floating point exception", regs, 0); /* quiet */
+		__inc_irq_stat(irq_fpassist_count);
 		handle_fpe(regs);
 		return;
 
diff --git a/arch/parisc/kernel/unaligned.c b/arch/parisc/kernel/unaligned.c
index 234e368..d7c0acb 100644
--- a/arch/parisc/kernel/unaligned.c
+++ b/arch/parisc/kernel/unaligned.c
@@ -27,6 +27,7 @@
 #include <linux/signal.h>
 #include <linux/ratelimit.h>
 #include <asm/uaccess.h>
+#include <asm/hardirq.h>
 
 /* #define DEBUG_UNALIGNED 1 */
 
@@ -454,6 +455,8 @@ void handle_unaligned(struct pt_regs *regs)
 	struct siginfo si;
 	register int flop=0;	/* true if this is a flop */
 
+	__inc_irq_stat(irq_unaligned_count);
+
 	/* log a message with pacing */
 	if (user_mode(regs)) {
 		if (current->thread.flags & PARISC_UAC_SIGBUS) {
