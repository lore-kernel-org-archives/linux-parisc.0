From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: blink loadavg LEDs on Oops
Date: Tue, 06 Jan 2009 14:23:13 +0100
Message-ID: <49635B41.5060205@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

- blink loadavg LEDs only (not all LEDs) twice a second on Oops
- cancel_rearming_delayed_workqueue() is obsolete, 
  use cancel_delayed_work_sync() instead

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index f9b1266..0cb4862 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -3,7 +3,7 @@
  *
  *      (c) Copyright 2000 Red Hat Software
  *      (c) Copyright 2000 Helge Deller <hdeller@redhat.com>
- *      (c) Copyright 2001-2005 Helge Deller <deller@gmx.de>
+ *      (c) Copyright 2001-2009 Helge Deller <deller@gmx.de>
  *      (c) Copyright 2001 Randolph Chung <tausq@debian.org>
  *
  *      This program is free software; you can redistribute it and/or modify
@@ -463,9 +463,13 @@ static void led_work_func (struct work_struct *unused)
 	if (likely(led_lanrxtx))  currentleds |= led_get_net_activity();
 	if (likely(led_diskio))   currentleds |= led_get_diskio_activity();
 
-	/* blink all LEDs twice a second if we got an Oops (HPMC) */
-	if (unlikely(oops_in_progress)) 
-		currentleds = (count_HZ<=(HZ/2)) ? 0 : 0xff;
+	/* blink loadavg LEDs twice per second if we got an Oops (HPMC) */
+	if (unlikely(oops_in_progress)) {
+		if (count_HZ <= (HZ/2))
+			currentleds &= ~(LED4|LED5|LED6|LED7);
+		else
+			currentleds |= (LED4|LED5|LED6|LED7);
+	}
 
 	if (currentleds != lastleds)
 	{
@@ -511,7 +515,7 @@ static int led_halt(struct notifier_block *nb, unsigned long event, void *buf)
 	
 	/* Cancel the work item and delete the queue */
 	if (led_wq) {
-		cancel_rearming_delayed_workqueue(led_wq, &led_task);
+		cancel_delayed_work_sync(&led_task);
 		destroy_workqueue(led_wq);
 		led_wq = NULL;
 	}
@@ -630,7 +634,7 @@ int lcd_print( const char *str )
 	
 	/* temporarily disable the led work task */
 	if (led_wq)
-		cancel_rearming_delayed_workqueue(led_wq, &led_task);
+		cancel_delayed_work_sync(&led_task);
 
 	/* copy display string to buffer for procfs */
 	strlcpy(lcd_text, str, sizeof(lcd_text));
