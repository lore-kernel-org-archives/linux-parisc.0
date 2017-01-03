From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc, parport_gsc: Fixes for printk continuation lines
Date: Tue, 3 Jan 2017 22:55:50 +0100
Message-ID: <20170103215550.GA30189@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index dd6d4cc..3858b87 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -293,7 +293,7 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 		p->irq = PARPORT_IRQ_NONE;
 	}
 	if (p->irq != PARPORT_IRQ_NONE) {
-		printk(", irq %d", p->irq);
+		pr_cont(", irq %d", p->irq);
 
 		if (p->dma == PARPORT_DMA_AUTO) {
 			p->dma = PARPORT_DMA_NONE;
@@ -303,8 +303,8 @@ struct parport *parport_gsc_probe_port(unsigned long base,
                                            is mandatory (see above) */
 		p->dma = PARPORT_DMA_NONE;
 
-	printk(" [");
-#define printmode(x) {if(p->modes&PARPORT_MODE_##x){printk("%s%s",f?",":"",#x);f++;}}
+	pr_cont(" [");
+#define printmode(x) {if(p->modes&PARPORT_MODE_##x){pr_cont("%s%s",f?",":"",#x);f++;}}
 	{
 		int f = 0;
 		printmode(PCSPP);
@@ -315,7 +315,7 @@ struct parport *parport_gsc_probe_port(unsigned long base,
 //		printmode(DMA);
 	}
 #undef printmode
-	printk("]\n");
+	pr_cont("]\n");
 
 	if (p->irq != PARPORT_IRQ_NONE) {
 		if (request_irq (p->irq, parport_irq_handler,
