From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: call set_irq_regs() after disabling local irqs
Date: Wed, 9 Oct 2013 23:54:13 +0200
Message-ID: <20131009215413.GA30163@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 2e6443b..c439c05 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -529,8 +529,8 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 	cpumask_t dest;
 #endif
 
-	old_regs = set_irq_regs(regs);
 	local_irq_disable();
+	old_regs = set_irq_regs(regs);
 	irq_enter();
 
 	eirr_val = mfctl(23) & cpu_eiem & per_cpu(local_ack_eiem, cpu);
