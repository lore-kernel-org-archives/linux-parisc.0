From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [PATCH] parisc : KittyHawk LCD fix
Date: Sat, 6 Nov 2010 17:24:29 +0100
Message-ID: <20101106172429.5c3d1568@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/YnbXlHkOhX_Cqaaz2As.xc3"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/YnbXlHkOhX_Cqaaz2As.xc3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


K class aka KittyHawk don't have LED support on their LCD. Installing
HP-UX confirmed this. The current led_wq fills the LCD with black
characters each time it runs.

The patch prevents the led_wq workqueue and its proc entry to be
created for KittyHawk machines.

It also increase min_cmd_delay as currently, one character out of two
is lost when a string is sent to the LCD.

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>

--MP_/YnbXlHkOhX_Cqaaz2As.xc3
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=KittyHawk-LCD-fix.diff

--- drivers/parisc/led.c.orig	2010-11-04 16:06:04.000000000 +0100
+++ drivers/parisc/led.c	2010-11-06 16:39:44.000000000 +0100
@@ -64,6 +64,7 @@
 static unsigned int led_lanrxtx   __read_mostly = 1;
 static char lcd_text[32]          __read_mostly;
 static char lcd_text_default[32]  __read_mostly;
+static int  lcd_no_led_support    __read_mostly = 0; /* KittyHawk doesn't support LED on its LCD */
 
 
 static struct workqueue_struct *led_wq;
@@ -115,7 +116,7 @@
 	.lcd_width =		16,
 	.lcd_cmd_reg_addr =	KITTYHAWK_LCD_CMD,
 	.lcd_data_reg_addr =	KITTYHAWK_LCD_DATA,
-	.min_cmd_delay =	40,
+	.min_cmd_delay =	80,
 	.reset_cmd1 =		0x80,
 	.reset_cmd2 =		0xc0,
 };
@@ -135,6 +136,9 @@
 	/* Display the default text now */
 	if (led_type == LED_HASLCD) lcd_print( lcd_text_default );
 
+	/* KittyHawk has no LED support on its LCD */
+	if (lcd_no_led_support) return 0;
+
 	/* Create the work queue and queue the LED task */
 	led_wq = create_singlethread_workqueue("led_wq");	
 	queue_delayed_work(led_wq, &led_task, 0);
@@ -248,9 +252,13 @@
 
 	proc_pdc_root = proc_mkdir("pdc", 0);
 	if (!proc_pdc_root) return -1;
-	ent = proc_create_data("led", S_IRUGO|S_IWUSR, proc_pdc_root,
-				&led_proc_fops, (void *)LED_NOLCD); /* LED */
-	if (!ent) return -1;
+
+	if (!lcd_no_led_support)
+	{
+		ent = proc_create_data("led", S_IRUGO|S_IWUSR, proc_pdc_root,
+					&led_proc_fops, (void *)LED_NOLCD); /* LED */
+		if (!ent) return -1;
+	}
 
 	if (led_type == LED_HASLCD)
 	{
@@ -692,6 +700,7 @@
 	case 0x58B:		/* KittyHawk DC2 100 (K200) */
 		printk(KERN_INFO "%s: KittyHawk-Machine (hversion 0x%x) found, "
 				"LED detection skipped.\n", __FILE__, CPU_HVERSION);
+		lcd_no_led_support = 1;
 		goto found;	/* use the preinitialized values of lcd_info */
 	}
 

--MP_/YnbXlHkOhX_Cqaaz2As.xc3--
