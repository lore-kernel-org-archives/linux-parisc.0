Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA21244
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Oct 1999 15:46:53 -0600
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m11gavC-0027d2C@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Wed, 27 Oct 1999 22:47:54 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Received: (from tsbogend@localhost)
	by alpha.franken.de (8.8.7/8.8.5) id XAA02791
	for parisc-linux@thepuffingroup.com; Wed, 27 Oct 1999 23:46:59 +0200
Date: Wed, 27 Oct 1999 23:46:59 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991027234659.A2788@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] iodc console patch
List-ID: <linux-parisc.vger.kernel.org>

To get a sash prompt on my 715/33 I need the patch below. Even if this
patch isn't release quality something like that is needed to get the
iodc console going.

Because I still have some problems with the first few printed lines, I
haven't checked it into cvs. Hope it helps others as well. Ohh and changing
"console=ttyS0" to "console=tty" in boot_code/ipl_c.c is required, too.

Thomas.

Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.24
diff -u -r1.24 pdc_cons.c
--- arch/parisc/kernel/pdc_cons.c	1999/10/27 18:38:21	1.24
+++ arch/parisc/kernel/pdc_cons.c	1999/10/27 21:44:25
@@ -146,6 +146,8 @@
 	memcpy(&PAGE0->mem_kbd, &PAGE0->mem_cons, sizeof(PAGE0->mem_cons));
 
     /* register the pdc console */
+#ifndef CONFIG_IODC_CONSOLE
     register_console(&pdc_cons);
+#endif
 #endif
 }
Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/setup.c,v
retrieving revision 1.70
diff -u -r1.70 setup.c
--- arch/parisc/kernel/setup.c	1999/10/25 16:39:29	1.70
+++ arch/parisc/kernel/setup.c	1999/10/27 21:44:25
@@ -655,6 +655,12 @@
 extern asmlinkage void __init start_kernel(void);
 extern char _bss_start;	/* the very first BSS-byte, defined in head.S */
 
+#ifdef CONFIG_VT
+#ifdef CONFIG_IODC_CONSOLE
+extern void iodc_con_init(void);
+#endif
+#endif
+
 __initfunc(void start_parisc(unsigned long new_memory_start, 
 			     char *bootloader_command_line))
 {
@@ -672,6 +678,12 @@
 		}
 	}
 	pdc_console_init();
+#ifdef CONFIG_VT
+#ifdef CONFIG_IODC_CONSOLE
+	conswitchp = &prom_con;
+	iodc_con_init();
+#endif
+#endif
 
 	printk("The Kernel has started...\n");
 
@@ -726,21 +738,10 @@
 	start_kernel(); 	/* now we start our kernel ! */
 }
 
-#ifdef CONFIG_VT
-#ifdef CONFIG_IODC_CONSOLE
-extern void iodc_con_init(void);
-#endif
-#endif
 
 __initfunc(void setup_arch(char **cmdline_p,
 	unsigned long * memory_start_p, unsigned long * memory_end_p))
 {
-#ifdef CONFIG_VT
-#ifdef CONFIG_IODC_CONSOLE
-	iodc_con_init();
-#endif
-#endif
-
 	*cmdline_p = &saved_command_line[0];	// set the ptr to the command-line
 	initrd_below_start_ok = 1;
 	


-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
