From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [PATCH] parisc: add tty driver to PDC console
Date: Mon, 14 Jun 2010 19:24:41 +0200
Message-ID: <20100614192441.245da011@zombie>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/VRBeZmNKgI2oDLfo3pBW1Rk"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_/VRBeZmNKgI2oDLfo3pBW1Rk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



This patch adds a tty driver to the PDC console. It allows the use
of ports not supported by linux as a console (e.g. serial port on
C3600). The tty driver will not register the ttyB device if PDC console
driver has been unregistered. This happens when the early printk
console is disabled as it has not been selected as the primary console.

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>
--MP_/VRBeZmNKgI2oDLfo3pBW1Rk
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=pdc-console-tty-driver.diff

diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index 1ff366c..b838ef3 100644
--- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -12,6 +12,7 @@
  *    Copyright (C) 2001 Helge Deller <deller at parisc-linux.org>
  *    Copyright (C) 2001 Thomas Bogendoerfer <tsbogend at parisc-linux.org>
  *    Copyright (C) 2002 Randolph Chung <tausq with parisc-linux.org>
+ *    Copyright (C) 2010 Guy Martin <gmsoft at tuxicoman.be>
  *
  *
  *    This program is free software; you can redistribute it and/or modify
@@ -31,12 +32,11 @@
 
 /*
  *  The PDC console is a simple console, which can be used for debugging 
- *  boot related problems on HP PA-RISC machines.
+ *  boot related problems on HP PA-RISC machines. It is also useful when no
+ *  other console works.
  *
  *  This code uses the ROM (=PDC) based functions to read and write characters
  *  from and to PDC's boot path.
- *  Since all character read from that path must be polled, this code never
- *  can or will be a fully functional linux console.
  */
 
 /* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems. 
@@ -53,6 +53,7 @@
 #include <asm/pdc.h>		/* for iodc_call() proto and friends */
 
 static DEFINE_SPINLOCK(pdc_console_lock);
+static struct console pdc_cons;
 
 static void pdc_console_write(struct console *co, const char *s, unsigned count)
 {
@@ -85,12 +86,138 @@ static int pdc_console_setup(struct console *co, char *options)
 
 #if defined(CONFIG_PDC_CONSOLE)
 #include <linux/vt_kern.h>
+#include <linux/tty_flip.h>
+
+#define PDC_CONS_POLL_DELAY (30 * HZ / 1000)
+
+static struct timer_list pdc_console_timer;
+
+extern struct console * console_drivers;
+
+static int pdc_console_tty_open(struct tty_struct *tty, struct file *filp)
+{
+
+	mod_timer(&pdc_console_timer, jiffies + PDC_CONS_POLL_DELAY);
+
+	return 0;
+}
+
+static void pdc_console_tty_close(struct tty_struct *tty, struct file *filp)
+{
+	if (!tty->count)
+		del_timer(&pdc_console_timer);
+}
+
+static int pdc_console_tty_write(struct tty_struct *tty, const unsigned char *buf, int count)
+{
+	pdc_console_write(NULL, buf, count);
+	return count;
+}
+
+static int pdc_console_tty_write_room(struct tty_struct *tty)
+{
+	return 32768; /* no limit, no buffer used */
+}
+
+static int pdc_console_tty_chars_in_buffer(struct tty_struct *tty)
+{
+	return 0; /* no buffer */
+}
+
+static struct tty_driver *pdc_console_tty_driver;
+
+static const struct tty_operations pdc_console_tty_ops = {
+	.open = pdc_console_tty_open,
+	.close = pdc_console_tty_close,
+	.write = pdc_console_tty_write,
+	.write_room = pdc_console_tty_write_room,
+	.chars_in_buffer = pdc_console_tty_chars_in_buffer,
+};
+
+static void pdc_console_poll(unsigned long unused)
+{
+
+	int data, count = 0;
+
+	struct tty_struct *tty = pdc_console_tty_driver->ttys[0];
+
+	if (!tty)
+		return;
+
+	while (1) {
+		data = pdc_console_poll_key(NULL);
+		if (data == -1)
+			break;
+		tty_insert_flip_char(tty, data & 0xFF, TTY_NORMAL);
+		count ++;
+	}
+
+	if (count)
+		tty_flip_buffer_push(tty);
+
+	if (tty->count && (pdc_cons.flags & CON_ENABLED))
+		mod_timer(&pdc_console_timer, jiffies + PDC_CONS_POLL_DELAY);
+}
+
+static int __init pdc_console_tty_driver_init(void)
+{
+
+	int err;
+	struct tty_driver *drv;
+
+	/* Check if the console driver is still registered.
+	 * It is unregistered if the pdc console was not selected as the
+	 * primary console. */
+
+	struct console *tmp = console_drivers;
+
+	for (tmp = console_drivers; tmp; tmp = tmp->next)
+		if (tmp == &pdc_cons)
+			break;
+	
+	if (!tmp) {
+		printk(KERN_INFO "PDC console driver not registered anymore, not creating %s\n", pdc_cons.name);
+		return -ENODEV;
+	}
+
+	printk(KERN_INFO "The PDC console driver is still registered, removing CON_BOOT flag\n");
+	pdc_cons.flags &= ~CON_BOOT;
+
+	drv = alloc_tty_driver(1);
+
+	if (!drv)
+		return -ENOMEM;
+	
+	drv->driver_name = "pdc_cons";
+	drv->name = "ttyB";
+	drv->major = MUX_MAJOR;
+	drv->minor_start = 0;
+	drv->type = TTY_DRIVER_TYPE_SYSTEM;
+	drv->init_termios = tty_std_termios;
+	drv->flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_RESET_TERMIOS;
+	tty_set_operations(drv, &pdc_console_tty_ops);
+
+	err = tty_register_driver(drv);
+	if (err) {
+		printk(KERN_ERR "Unable to register the PDC console TTY driver\n");
+		return err;
+	}
+
+	pdc_console_tty_driver = drv;
+
+	/* No need to initialize the pdc_console_timer if tty isn't allocated */
+	init_timer(&pdc_console_timer);
+	pdc_console_timer.function = pdc_console_poll;
+
+	return 0;
+}
+
+module_init(pdc_console_tty_driver_init);
 
 static struct tty_driver * pdc_console_device (struct console *c, int *index)
 {
-	extern struct tty_driver console_driver;
-	*index = c->index ? c->index-1 : fg_console;
-	return &console_driver;
+	*index = c->index;
+	return pdc_console_tty_driver;
 }
 #else
 #define pdc_console_device NULL
@@ -101,7 +228,7 @@ static struct console pdc_cons = {
 	.write =	pdc_console_write,
 	.device =	pdc_console_device,
 	.setup =	pdc_console_setup,
-	.flags =	CON_BOOT | CON_PRINTBUFFER | CON_ENABLED,
+	.flags =	CON_BOOT | CON_PRINTBUFFER,
 	.index =	-1,
 };
 

--MP_/VRBeZmNKgI2oDLfo3pBW1Rk--
