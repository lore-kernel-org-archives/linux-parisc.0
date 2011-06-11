From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] parisc, don't claim cpu irqs more than once
Date: Sat, 11 Jun 2011 14:55:24 -0400
Message-ID: <20110611185524.GA1369@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The CPU irqs (timer and IPI) are not shared and only need to be claimed
once.  A mismatch error occurs if they are claimed more than once.

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index c0b1aff..8293704 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -393,6 +393,12 @@ static struct irqaction ipi_action = {
 static void claim_cpu_irqs(void)
 {
 	int i;
+#ifdef CONFIG_SMP
+	static int irqs_claimed;
+	if (irqs_claimed)
+		return;
+	irqs_claimed = 1;
+#endif
 	for (i = CPU_IRQ_BASE; i <= CPU_IRQ_MAX; i++) {
 		irq_set_chip_and_handler(i, &cpu_interrupt_type,
 					 handle_percpu_irq);
