From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] parisc: fix dino/gsc interrupts
Date: Thu, 02 Dec 2010 17:36:47 -0600
Message-ID: <1291333007.19250.10.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The essential problem we're currently having is that dino (and gsc) is a
cascaded CPU interrupt.  Under the old __do_IRQ() handler, our CPU
interrupts basically did an ack followed by an end.  In the new scheme,
we replaced them with level handlers which do a mask, an ack and then an
unmask (but no end).  Instead, with the renaming of end to eoi, we
actually want to call the percpu flow handlers, because they actually
have all the characteristics we want.

This patch does the conversion and gets my C360 booting again.

Signed-off-by: James Bottomley <James.Bottomley@suse.de>

---

I think we also want to convert the dino and gsc handlers to simpler
flow controllers (the mask/unmask of level is totally unnecessary for
them), but I'll do that later.

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 5024f64..48aa711 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -392,7 +392,7 @@ static void claim_cpu_irqs(void)
 	int i;
 	for (i = CPU_IRQ_BASE; i <= CPU_IRQ_MAX; i++) {
 		set_irq_chip_and_handler(i, &cpu_interrupt_type,
-			handle_level_irq);
+					 handle_percpu_irq);
 	}
 
 	set_irq_handler(TIMER_IRQ, handle_percpu_irq);


