Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA01873
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 06:34:46 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 23 Dec 2000 13:37:48 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149orr-0003kv-00; Sat, 23 Dec 2000 13:37:47 +0000
Date: Sat, 23 Dec 2000 13:37:47 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Console
Message-ID: <20001223133747.B13472@parcelfarce.linux.theplanet.co.uk>
References: <20001221211830.C21472@parcelfarce.linux.theplanet.co.uk> <20001221212855.E21472@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001221212855.E21472@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Thu, Dec 21, 2000 at 09:28:55PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 21, 2000 at 09:28:55PM +0000, Matthew Wilcox wrote:
> I haven't tested STI console with these changes.  I don't have a
> monitor/kbd for my 712.  Someone should test this, and remove the calls
> to pdc_console_die (and remove pdc_console_die altogether).

here's a patch which does this.  please let me know how this works out
for you.


Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.22
diff -u -p -r1.22 pdc_cons.c
--- pdc_cons.c	2000/12/21 21:04:20	1.22
+++ pdc_cons.c	2000/12/23 13:10:45
@@ -66,7 +66,7 @@ static void pdc_console_write(struct con
 		pdc_putc(*s++);
 }
 
-int pdc_console_wait_key(struct console *co)
+static int pdc_console_wait_key(struct console *co)
 {
 	int ch = 'X';
 	int status;
@@ -96,11 +96,6 @@ int pdc_getc(void)
 	return pdc_console_wait_key(NULL);
 }
 
-static int pdc_console_setup(struct console *co, char *options)
-{
-	return 0;
-}
-
 static struct console pdc_cons = {
 	name:		"ttyB",
 	write:		pdc_console_write,
@@ -108,19 +103,19 @@ static struct console pdc_cons = {
 	device:		NULL, 
 	wait_key:	pdc_console_wait_key,
 	unblank:	NULL,
-	setup:		pdc_console_setup,
+	setup:		NULL,
 	flags:		CON_BOOT|CON_PRINTBUFFER|CON_ENABLED,  // |CON_CONSDEV,
 	index:		-1,
 };
 
 static int pdc_console_initialized;
 
-void pdc_console_init(void)
+void __init pdc_console_init(void)
 {
 	if (pdc_console_initialized)
 		return;
-	++pdc_console_initialized;
-	
+	pdc_console_initialized = 1;
+
 	/* If the console is duplex then copy the COUT parameters to CIN. */
 	if (PAGE0->mem_cons.cl_class == CL_DUPLEX)
 		memcpy(&PAGE0->mem_kbd, &PAGE0->mem_cons, sizeof(PAGE0->mem_cons));
@@ -130,32 +125,6 @@ void pdc_console_init(void)
 	register_console(&pdc_cons);
 }
 
-
-/* Unregister the pdc console with the printk console layer */
-void pdc_console_die(void)
-{
-	extern unsigned long log_size; /* kernel/printk.c */
-
-	printk("Switching from PDC console\n");
-	if (!pdc_console_initialized)
-		return;
-	--pdc_console_initialized;
-
-	/* Don't repeat what we've already printed */
-	log_size = 0;
-
-#ifdef CONFIG_VT_CONSOLE
-	{
-	    /* fixme (needed?): Wait for console-tasklet to finish !*/
-	    extern struct tasklet_struct console_tasklet;
-    	    tasklet_schedule(&console_tasklet);
-	}
-#endif
-
-	unregister_console(&pdc_cons);
-}
-
-
 /*
  * Used for emergencies. Currently only used if an HPMC occurs. If an
  * HPMC occurs, it is possible that the current console may not be
@@ -172,7 +141,7 @@ void pdc_console_restart(void)
 	if (pdc_console_initialized)
 		return;
 
-	while ((console = console_drivers) != (struct console *)0)
+	while ((console = console_drivers) != NULL)
 		unregister_console(console_drivers);
 
 	log_size = 0;
@@ -180,4 +149,3 @@ void pdc_console_restart(void)
 	printk("Switched to PDC console\n");
 	return;
 }
-
Index: drivers/video/sticon-bmode.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/video/sticon-bmode.c,v
retrieving revision 1.7
diff -u -p -r1.7 sticon-bmode.c
--- sticon-bmode.c	2000/12/02 21:03:48	1.7
+++ sticon-bmode.c	2000/12/23 13:11:09
@@ -861,13 +861,7 @@ static void __init sti_try_rom(unsigned 
 	sti_init_graph(sti);
 
 	//sti_inq_conf(sti);
-#if !defined(SERIAL_CONSOLE)	
-	{ 
-	    extern void pdc_console_die(void);  
-	    pdc_console_die(); 
-	}
-#endif
-		
+
 	take_over_console(&sti_con, 0, MAX_NR_CONSOLES-1, 1);
 
 	/* sti_inq_conf(sti); */
Index: drivers/video/sticon.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/video/sticon.c,v
retrieving revision 1.9
diff -u -p -r1.9 sticon.c
--- sticon.c	2000/10/16 22:21:24	1.9
+++ sticon.c	2000/12/23 13:11:09
@@ -219,7 +219,6 @@ static int __init sti_init(void)
 {
 	printk("searching for word mode STI ROMs\n");
 	if (sti_init_roms()) {
-		pdc_console_die();
 		take_over_console(&sti_con, 0, MAX_NR_CONSOLES-1, 1);
 		return 0;
 	} else
Index: drivers/video/stifb.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/video/stifb.c,v
retrieving revision 1.2
diff -u -p -r1.2 stifb.c
--- stifb.c	2000/10/16 22:21:24	1.2
+++ stifb.c	2000/12/23 13:11:09
@@ -183,7 +183,6 @@ stifb_init(void)
 	fbgen_do_set_var(&disp.var, 1, &fb_info.gen);
 	fbgen_set_disp(-1, &fb_info.gen);
 	fbgen_install_cmap(0, &fb_info.gen);
-	pdc_console_die();
 	if (register_framebuffer(&fb_info.gen.info) < 0)
 		return -EINVAL;
 

-- 
Revolutions do not require corporate support.
