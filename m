From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [PARISC] hp_sdc: fix request_irq()/free_irq() parameters
Date: Sat, 17 Feb 2007 15:55:24 -0500
Message-ID: <11717457252335-git-send-email-kyle__40985.6824241162$1416624294$gmane$org@parisc-linux.org>
References: <11717457251848-git-send-email-kyle@parisc-linux.org> <11717457251606-git-send-email-kyle@parisc-linux.org> <11717457253477-git-send-email-kyle@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org,
 akpm@osdl.org,
 Helge Deller <deller@gmx.de>,
 Kyle McMartin <kyle@parisc-linux.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Return-Path: <kyle@athena.road.mcmartin.ca>
In-Reply-To: <11717457253477-git-send-email-kyle@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>

From: Helge Deller <deller@gmx.de>

With this fix it's possible to load and unload the hp_sdc module multiple times.
Before the first loading of the module requested the irq lines, but never was able to free them again.
This, a second loading of the module failed, because the irq was still occupied.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
---
 drivers/input/serio/hp_sdc.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 9907ad3..211ff44 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -818,12 +818,12 @@ static int __init hp_sdc_init(void)
 #endif	
 
 	errstr = "IRQ not available for";
-        if(request_irq(hp_sdc.irq, &hp_sdc_isr, 0, "HP SDC",
-		       (void *) hp_sdc.base_io)) goto err1;
+	if (request_irq(hp_sdc.irq, &hp_sdc_isr, 0, "HP SDC", &hp_sdc))
+		goto err1;
 
 	errstr = "NMI not available for";
-	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, 0, "HP SDC NMI", 
-			(void *) hp_sdc.base_io)) goto err2;
+	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, 0, "HP SDC NMI", &hp_sdc))
+		goto err2;
 
 	printk(KERN_INFO PREFIX "HP SDC at 0x%p, IRQ %d (NMI IRQ %d)\n", 
 	       (void *)hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
@@ -855,7 +855,7 @@ static int __init hp_sdc_init(void)
 	hp_sdc.dev_err = 0;
 	return 0;
  err2:
-	free_irq(hp_sdc.irq, NULL);
+	free_irq(hp_sdc.irq, &hp_sdc);
  err1:
 	release_region(hp_sdc.data_io, 2);
  err0:
@@ -899,8 +899,8 @@ static void hp_sdc_exit(void)
 	/* Wait until we know this has been processed by the i8042 */
 	hp_sdc_spin_ibf();
 
-	free_irq(hp_sdc.nmi, NULL);
-	free_irq(hp_sdc.irq, NULL);
+	free_irq(hp_sdc.nmi, &hp_sdc);
+	free_irq(hp_sdc.irq, &hp_sdc);
 	write_unlock_irq(&hp_sdc.lock);
 
 	del_timer(&hp_sdc.kicker);
-- 
1.4.4.4
