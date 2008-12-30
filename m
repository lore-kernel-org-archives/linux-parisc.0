From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: trivial fixes
Date: Tue, 30 Dec 2008 23:11:31 +0100
Message-ID: <495A9C93.7040605@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

trivial fixes:
- use KERN_WARNING for printk()
- use BUG_ON() instead of "if (xx) BUG();"

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 23ef950..3ee6b33 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -421,5 +422,5 @@ void __init init_IRQ(void)
 
 void ack_bad_irq(unsigned int irq)
 {
-	printk("unexpected IRQ %d\n", irq);
+	printk(KERN_WARNING "unexpected IRQ %d\n", irq);
 }
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index d47f397..148667e 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -239,10 +240,7 @@ send_IPI_mask(cpumask_t mask, enum ipi_message_type op)
 static inline void
 send_IPI_single(int dest_cpu, enum ipi_message_type op)
 {
-	if (dest_cpu == NO_PROC_ID) {
-		BUG();
-		return;
-	}
+	BUG_ON(dest_cpu == NO_PROC_ID);
 
 	ipi_send(dest_cpu, op);
 }
@@ -324,8 +322,7 @@ smp_cpu_init(int cpunum)
 	/* Initialise the idle task for this CPU */
 	atomic_inc(&init_mm.mm_count);
 	current->active_mm = &init_mm;
-	if(current->mm)
-		BUG();
+	BUG_ON(current->mm);
 	enter_lazy_tlb(&init_mm, current);
 
 	init_IRQ();   /* make sure no IRQs are enabled or pending */

