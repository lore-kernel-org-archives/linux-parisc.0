From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [testers wanted] cleanup early console setup
Date: Fri, 11 Feb 2005 14:35:25 -0800
Message-ID: <20050211223525.GH2277@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This patch cleans up our early console hacks so that we use the
"approved" way of doing things. I've only tested this on a J6k...
looking for testers on other systems.

Especially interesting would be something that uses non-8250 consoles,
such as E/K class systems that use the serial mux console. I suspect
some changes are needed there. If you can test on such a system, and see
some problems [*], please let me know. likely we will need to move the
register_console() call from mux_probe() into a separate initcall.

[*] during startup, the console print messages should show up regularly,
and only once. symptoms of problems are if your console prints pause
for a long time, or if you start seeing each line printed twice.

randolph

Index: arch/parisc/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/Kconfig,v
retrieving revision 1.25
diff -u -p -r1.25 Kconfig
--- arch/parisc/Kconfig	4 Feb 2005 19:34:34 -0000	1.25
+++ arch/parisc/Kconfig	11 Feb 2005 22:22:59 -0000
@@ -19,6 +19,9 @@ config MMU
 config STACK_GROWSUP
 	def_bool y
 
+config EARLY_PRINTK
+	def_bool y
+
 config UID16
 	bool
 
Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.7
diff -u -p -r1.7 pdc_cons.c
--- arch/parisc/kernel/pdc_cons.c	16 Aug 2004 17:25:27 -0000	1.7
+++ arch/parisc/kernel/pdc_cons.c	11 Feb 2005 22:22:59 -0000
@@ -39,11 +39,6 @@
  *  can or will be a fully functional linux console.
  */
 
-/* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems. 
- * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
-#undef EARLY_BOOTUP_DEBUG
-
-
 #include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/console.h>
@@ -81,8 +76,11 @@ void pdc_printf(const char *fmt, ...)
 	len = vscnprintf(buf, sizeof(buf), fmt, args);
 	va_end(args);
 
-	for (i = 0; i < len; i++)
+	for (i = 0; i < len; i++) {
+		if (buf[i] == '\n')
+			pdc_iodc_outc('\r');
 		pdc_iodc_outc(buf[i]);
+	}
 }
 
 int pdc_console_poll_key(struct console *co)
@@ -112,14 +110,11 @@ static struct console pdc_cons = {
 	.write =	pdc_console_write,
 	.device =	PDC_CONSOLE_DEVICE,
 	.setup =	pdc_console_setup,
-	.flags =	CON_BOOT|CON_PRINTBUFFER|CON_ENABLED,
+	.flags =	CON_PRINTBUFFER,
 	.index =	-1,
 };
 
 static int pdc_console_initialized;
-extern unsigned long con_start;	/* kernel/printk.c */
-extern unsigned long log_end;	/* kernel/printk.c */
-
 
 static void pdc_console_init_force(void)
 {
@@ -135,14 +130,10 @@ static void pdc_console_init_force(void)
 	register_console(&pdc_cons);
 }
 
-void __init pdc_console_init(void)
+void __init 
+pdc_console_init(void)
 {
-#if defined(EARLY_BOOTUP_DEBUG) || defined(CONFIG_PDC_CONSOLE)
 	pdc_console_init_force();
-#endif
-#ifdef EARLY_BOOTUP_DEBUG
-	printk(KERN_INFO "Initialized PDC Console for debugging.\n");
-#endif
 }
 
 
@@ -155,12 +146,17 @@ void pdc_console_die(void)
 
 	printk(KERN_INFO "Switching from PDC console\n");
 
-	/* Don't repeat what we've already printed */
-	con_start = log_end;
-
 	unregister_console(&pdc_cons);
 }
 
+void __init 
+disable_early_printk(void)
+{
+#ifndef CONFIG_PDC_CONSOLE
+	pdc_console_die();
+#endif
+}
+
 
 /*
  * Used for emergencies. Currently only used if an HPMC occurs. If an
@@ -180,9 +176,6 @@ void pdc_console_restart(void)
 	while ((console = console_drivers) != NULL)
 		unregister_console(console_drivers);
 
-	/* Don't repeat what we've already printed */
-	con_start = log_end;
-	
 	/* force registering the pdc console */
 	pdc_console_init_force();
 }
Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/setup.c,v
retrieving revision 1.12
diff -u -p -r1.12 setup.c
--- arch/parisc/kernel/setup.c	31 Dec 2004 17:26:35 -0000	1.12
+++ arch/parisc/kernel/setup.c	11 Feb 2005 22:22:59 -0000
@@ -157,7 +157,8 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 #if defined(CONFIG_VT) && defined(CONFIG_DUMMY_CONSOLE)
-	conswitchp = &dummy_con;	/* we use take_over_console() later ! */
+	if (!conswitchp)
+		conswitchp = &dummy_con;	/* we use take_over_console() later ! */
 #endif
 
 }
Index: kernel/printk.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/printk.c,v
retrieving revision 1.26
diff -u -p -r1.26 printk.c
--- kernel/printk.c	12 Jan 2005 20:18:05 -0000	1.26
+++ kernel/printk.c	11 Feb 2005 22:23:04 -0000
@@ -92,8 +92,8 @@ static int log_buf_len = __LOG_BUF_LEN;
  * must be masked before subscripting
  */
 static unsigned long log_start;	/* Index into log_buf: next char to be read by syslog() */
-unsigned long con_start;	/* Index into log_buf: next char to be sent to consoles */
-unsigned long log_end;	/* Index into log_buf: most-recently-written-char + 1 */
+static unsigned long con_start;	/* Index into log_buf: next char to be sent to consoles */
+static unsigned long log_end;	/* Index into log_buf: most-recently-written-char + 1 */
 static unsigned long logged_chars; /* Number of chars produced since last read+clear operation */
 
 /*
@@ -793,11 +793,6 @@ void register_console(struct console * c
 
 	if (!(console->flags & CON_ENABLED))
 		return;
