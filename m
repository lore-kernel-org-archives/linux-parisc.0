Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58E7A48E0
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 14:43:01 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.4d3e3a24) with ESMTP id swjzhaaa for parisc-linux@lists.parisc-linux.org; Sat, 6 Oct 2001 13:38:34 -0700
Date: Sat, 6 Oct 2001 13:42:50 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011006134250.I17735@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [patch] /proc interface for LED/LCD
List-ID: <linux-parisc.vger.kernel.org>

hi all,

the attached patch creates a /proc interface for boxes with LED/LCD
support. For example:

legolas:/home/randolph# ls -l /proc/pdc/
total 0
-rw-r--r--    1 root     root            0 Oct  6 13:35 lcd
-rw-r--r--    1 root     root            0 Oct  6 13:35 led
legolas:/home/randolph# cat /proc/pdc/led 
Heartbeat: 1
Disk IO: 1
LAN Rx/Tx: 1
legolas:/home/randolph# cat /proc/pdc/lcd 
Linux 2.4.9-pa40
legolas:/home/randolph# echo -n "debian/rules" > /proc/pdc/lcd

("debian/rules" appears on the LCD on the chassis....)

legolas:/home/randolph# cat /proc/pdc/lcd 
debian/rules
legolas:/home/randolph# echo > /proc/pdc/lcd

(Chassis reverts to original Linux version display)

legolas:/home/randolph# cat /proc/pdc/lcd 
Linux 2.4.9-pa40
legolas:/home/randolph# echo "1 1 0" > /proc/pdc/led

(invalid strings will cause an error to go to your kernel log)

legolas:/home/randolph# cat /proc/pdc/led 
Heartbeat: 1
Disk IO: 1
LAN Rx/Tx: 0

I've only tested it on a c3000 (only machine i have with led/lcd
support). Would appreciate if folks can try it on other machines and let
me know if it works :)

This also requires a small fix to arch/parisc/kernel/firmware.c which i
checked into cvs this morning.

enjoy! :)
randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^


Index: arch/parisc/kernel/led.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/led.c,v
retrieving revision 1.22
diff -u -r1.22 led.c
--- led.c	2001/08/14 16:54:52	1.22
+++ led.c	2001/10/06 20:31:47
@@ -4,6 +4,7 @@
  *      (c) Copyright 2000 Red Hat Software
  *      (c) Copyright 2000 Helge Deller <hdeller@redhat.com>
  *      (c) Copyright 2001 Helge Deller <deller@gmx.de>
+ *      (c) Copyright 2001 Randolph Chung <tausq@debian.org>
  *
  *      This program is free software; you can redistribute it and/or modify
  *      it under the terms of the GNU General Public License as published by
@@ -11,9 +12,8 @@
  *      (at your option) any later version.
  *
  * TODO:
- *	- LCD functionality is mostly untested (lack of hardware :-() 
- *	- add procfs entry to (maybe partially) enable & disable LEDs
  *	- speed-up calculations with inlined assembler
+ *	- interface to write to second row of LCD from /proc
  */
 
 #include <linux/config.h>
@@ -28,6 +28,8 @@
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
 #include <linux/reboot.h>
+#include <linux/proc_fs.h>
+#include <linux/ctype.h>
 #include <asm/io.h>
 #include <asm/gsc.h>
 #include <asm/processor.h>
@@ -35,16 +37,20 @@
 #include <asm/param.h>		/* HZ */
 #include <asm/led.h>
 #include <asm/pdc.h>
+#include <asm/uaccess.h>
 
 /* The control of the LEDs and LCDs on PARISC-machines have to be done 
    completely in software. The necessary calculations are done in a tasklet
    which is scheduled at every timer interrupt and since the calculations 
    may consume relatively much CPU-time some of the calculations can be 
-   turned off with the following defines */
-#undef NO_HEARTBEAT
-#undef NO_DISKIO
-#undef NO_LAN_RXTX
+   turned off with the following variables (controlled via procfs) */
 
+static int led_type = -1;
+static int led_heartbeat = 1;
+static int led_diskio = 1;
+static int led_lanrxtx = 1;
+static char lcd_text[32] = {0};
+
 #if 0
 #define DPRINTK(x)	printk x
 #else
@@ -110,6 +116,132 @@
 /* ptr to LCD/LED-specific function */
 static void (*led_func_ptr) (unsigned char);
 
+#define LED_HASLCD 1
+#define LED_NOLCD  0
+#ifdef CONFIG_PROC_FS
+static int led_proc_read(char *page, char **start, off_t off, int count, 
+	int *eof, void *data)
+{
+	char *out = page;
+	int len;
+
+	switch ((long)data)
+	{
+	case LED_NOLCD:
+		out += sprintf(out, "Heartbeat: %d\n", led_heartbeat);
+		out += sprintf(out, "Disk IO: %d\n", led_diskio);
+		out += sprintf(out, "LAN Rx/Tx: %d\n", led_lanrxtx);
+		break;
+	case LED_HASLCD:
+		out += sprintf(out, "%s\n", lcd_text);
+		break;
+	default:
+		*eof = 1;
+		return 0;
+	}
+
+	len = out - page - off;
+	if (len < count) {
+		*eof = 1;
+		if (len <= 0) return 0;
+	} else {
+		len = count;
+	}
+	*start = page + off;
+	return len;
+}
+
+static int led_proc_write(struct file *file, const char *buf, 
+	unsigned long count, void *data)
+{
+	const char *cur = NULL;
+	char lbuf[count];
+	int d;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+
+	lcopy_from_user(lbuf, buf, count);
+	cur = lbuf;
+
+	/* skip initial spaces */
+	while (*cur && isspace(*cur))
+	{
+		cur++;
+	}
+
+	switch ((long)data)
+	{
+	case LED_NOLCD:
+		d = *cur++ - '0';
+		if (d != 0 && d != 1) goto parse_error;
+		led_heartbeat = d;
+
+		if (*cur++ != ' ') goto parse_error;
+
+		d = *cur++ - '0';
+		if (d != 0 && d != 1) goto parse_error;
+		led_diskio = d;
+
+		if (*cur++ != ' ') goto parse_error;
+
+		d = *cur++ - '0';
+		if (d != 0 && d != 1) goto parse_error;
+		led_lanrxtx = d;
+
+		break;
+	case LED_HASLCD:
+		if (*cur == 0) 
+		{
+			/* reset to default */
+			lcd_print("Linux " UTS_RELEASE);
+		}
+		else
+		{
+			lcd_print(cur);
+		}
+		break;
+	default:
+		return 0;
+	}
+	
+	return count;
+
+parse_error:
+	if ((long)data == LED_NOLCD)
+		printk(KERN_CRIT "Parse error: expect \"n n n\" (n == 0 or 1) for heartbeat,\ndisk io and lan tx/rx indicators\n");
+	return -EINVAL;
+}
+
+static int __init led_create_procfs(void)
+{
+	struct proc_dir_entry *proc_pdc_root = NULL;
+	struct proc_dir_entry *ent;
+
+	if (led_type == -1) return -1;
+
+	proc_pdc_root = proc_mkdir("pdc", 0);
+	if (!proc_pdc_root) return -1;
+	ent = create_proc_entry("led", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
+	if (!ent) return -1;
+	ent->nlink = 1;
+	ent->data = (void *)LED_NOLCD; /* LED */
+	ent->read_proc = led_proc_read;
+	ent->write_proc = led_proc_write;
+
+	if (led_type == LED_HASLCD)
+	{
+		ent = create_proc_entry("lcd", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
+		if (!ent) return -1;
+		ent->nlink = 1;
+		ent->data = (void *)LED_HASLCD; /* LCD */
+		ent->read_proc = led_proc_read;
+		ent->write_proc = led_proc_write;
+	}
+
+	return 0;
+}
+#endif
 
 /*
    ** 
@@ -208,7 +340,6 @@
    ** (analog to dev_get_info() from net/core/dev.c)
    **   
  */
-#ifndef NO_LAN_RXTX
 static unsigned long led_net_rx_counter, led_net_tx_counter;
 
 static void led_get_net_stats(int addvalue)
@@ -244,7 +375,6 @@
 	rx_total_last += rx_total;
         tx_total_last += tx_total;
 }
-#endif /* NO_LAN_RXTX */
 
 
 /*
@@ -255,7 +385,6 @@
    ** (analog to linux/fs/proc/proc_misc.c)
    **   
  */
-#ifndef NO_DISKIO
 static unsigned long led_diskio_counter;
 
 static void led_get_diskio_stats(int addvalue)
@@ -280,7 +409,6 @@
 	
 	diskio_total_last += total; 
 }
-#endif /* NO_DISKIO */
 
 
 
@@ -315,49 +443,52 @@
 	if (++count_HZ == HZ)
 	    count_HZ = 0;
 
-#ifndef NO_HEARTBEAT
-	/* flash heartbeat-LED like a real heart (2 x short then a long delay) */
-	if (count_HZ<HEARTBEAT_LEN || 
-	    (count_HZ>=HEARTBEAT_2ND_RANGE_START && count_HZ<HEARTBEAT_2ND_RANGE_END)) 
-	    currentleds |= LED_HEARTBEAT;
-	else
-	    currentleds &= ~LED_HEARTBEAT;
-#endif
+	if (led_heartbeat)
+	{
+		/* flash heartbeat-LED like a real heart (2 x short then a long delay) */
+		if (count_HZ<HEARTBEAT_LEN || 
+		    (count_HZ>=HEARTBEAT_2ND_RANGE_START && count_HZ<HEARTBEAT_2ND_RANGE_END)) 
+		    currentleds |= LED_HEARTBEAT;
+		else
+		    currentleds &= ~LED_HEARTBEAT;
+	}
 
 	/* gather network and diskio statistics and flash LEDs respectively */
 
-#ifndef NO_LAN_RXTX
-	if ((count & 31) == 0)
-	    led_get_net_stats(30);
-
-	if (led_net_rx_counter) {
-	    led_net_rx_counter--;
-	    currentleds |= LED_LAN_RCV;
-	}
-	else    
-	    currentleds &= ~LED_LAN_RCV;
-
-	if (led_net_tx_counter) {
-	    led_net_tx_counter--;
-	    currentleds |= LED_LAN_TX;
+	if (led_lanrxtx)
+	{
+		if ((count & 31) == 0)
+			led_get_net_stats(30);
+
+		if (led_net_rx_counter) {
+			led_net_rx_counter--;
+			currentleds |= LED_LAN_RCV;
+		}
+		else    
+			currentleds &= ~LED_LAN_RCV;
+
+		if (led_net_tx_counter) {
+			led_net_tx_counter--;
+			currentleds |= LED_LAN_TX;
+		}
+		else    
+			currentleds &= ~LED_LAN_TX;
+	}
+
+	if (led_diskio)
+	{
+		/* avoid to calculate diskio-stats at same irq as netio-stats ! */
+		if ((count & 31) == 15) 
+			led_get_diskio_stats(30);
+
+		if (led_diskio_counter) {
+			led_diskio_counter--;
+			currentleds |= LED_DISK_IO;
+		}
+		else    
+			currentleds &= ~LED_DISK_IO;
 	}
-	else    
-	    currentleds &= ~LED_LAN_TX;
-#endif
 
-#ifndef NO_DISKIO
-	/* avoid to calculate diskio-stats at same irq as netio-stats ! */
-	if ((count & 31) == 15) 
-	    led_get_diskio_stats(30);
-
-	if (led_diskio_counter) {
-	    led_diskio_counter--;
-	    currentleds |= LED_DISK_IO;
-	}
-	else    
-	    currentleds &= ~LED_DISK_IO;
-#endif
-
 	/* update the LCD/LEDs */
 	if (currentleds != lastleds) {
 	    led_func_ptr(currentleds);
@@ -435,12 +566,14 @@
 			LCD_CMD_REG , LCD_DATA_REG);
 		led_func_ptr = led_LCD_driver;
 		lcd_print( "Linux " UTS_RELEASE );
+		led_type = LED_HASLCD;
 		break;
 
 	case DISPLAY_MODEL_LASI:
 		LED_DATA_REG = data_reg;
 		led_func_ptr = led_LASI_driver;
 		printk(KERN_INFO "LED display at %p registered\n", LED_DATA_REG);
+		led_type = LED_NOLCD;
 		break;
 
 	case DISPLAY_MODEL_OLD_ASP:
@@ -448,6 +581,7 @@
 		led_func_ptr = led_ASP_driver;
 		printk(KERN_INFO "LED (ASP-style) display at %p registered\n", 
 		    LED_DATA_REG);
+		led_type = LED_NOLCD;
 		break;
 
 	default:
@@ -509,6 +643,9 @@
 	if (!led_func_ptr || lcd_info.model != DISPLAY_MODEL_LCD)
 	    return 0;
 	
+	/* copy display string to buffer for procfs */
+	strncpy(lcd_text, str, sizeof(lcd_text)-1);
+	
 	/* temporarily disable the led tasklet */
 	tasklet_disable(&led_tasklet);
 
@@ -619,3 +756,7 @@
 	lcd_info.model = DISPLAY_MODEL_NONE;
 	return 1;
 }
+
+#ifdef CONFIG_PROC_FS
+module_init(led_create_procfs)
+#endif
