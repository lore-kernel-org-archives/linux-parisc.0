From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 7/8] parisc: Prepare show_interrupts for
	GENERIC_HARDIRQS_NO_DEPRECATED
Date: Sun, 06 Feb 2011 20:46:05 -0000
Message-ID: <20110206204511.022956572@linutronix.de>
References: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

chip moves to irq_data

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/parisc/kernel/irq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-next/arch/parisc/kernel/irq.c
===================================================================
--- linux-next.orig/arch/parisc/kernel/irq.c
+++ linux-next/arch/parisc/kernel/irq.c
@@ -188,7 +188,7 @@ int show_interrupts(struct seq_file *p, 
 		seq_printf(p, "%10u ", kstat_irqs(i));
 #endif
 
-		seq_printf(p, " %14s", irq_desc[i].chip->name);
+		seq_printf(p, " %14s", irq_desc[i].irq_data.chip->name);
 #ifndef PARISC_IRQ_CR16_COUNTS
 		seq_printf(p, "  %s", action->name);
 


