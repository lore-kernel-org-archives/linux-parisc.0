Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id 20467482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Mar 2001 22:38:59 -0700 (MST)
Received: from rbrad by beavis.ybsoft.com with local (Exim 3.20 #1 (Debian))
	id 14gwlf-0004i2-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Mar 2001 15:44:19 -0700
Date: Sat, 24 Mar 2001 15:44:19 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010324154419.A18097@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: Ryan Bradetich <rbrad@beavis.ybsoft.com>
Subject: [parisc-linux] Additional PDC cleanups
List-ID: <linux-parisc.vger.kernel.org>

Here is a patch that makes the real*_calls in firmware.c static.  This works with
the defconfig for but will not work when the STI console is enabled.  I am posting
the patch here for review, and also suggestions on how to organize the STI calls
so we can encapsulate the real*_calls in firmware.c


The problem with the STI code is this #define in the drivers/video/sti/sticore.h

#define STI_CALL(func, flags, inptr, outptr, glob_cfg) \
	({	 						\
		real32_call( func, (unsigned long)STI_PTR(flags), \
				    STI_PTR(inptr), STI_PTR(outptr), \
				    glob_cfg); \
	})


My first thoughts were to make the STI_CALL function look like this:

#define STI_CALL(func, flags, inptr, outptr, glob_cfg) \
	({	 						\
		pdc_sti_call( func, (unsigned long)STI_PTR(flags), \
				    STI_PTR(inptr), STI_PTR(outptr), \
				    glob_cfg); \
	})

and define the pdc_sti_call in firmware.c.  Anyone have a different
approach that would make more sense? 


Thanks,

- Ryan


===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/firmware.c,v
retrieving revision 1.25
diff -u -p -r1.25 firmware.c
--- firmware.c	2001/03/22 06:46:32	1.25
+++ firmware.c	2001/03/24 22:17:36
@@ -334,6 +334,82 @@ int pdc_mem_mem_table(void *r_addr, void
 }
 #endif
 
+/* FIXME: Is this pdc used?  I could not find type reference to ftc_bitmap
+ * so I guessed at unsigned long.  Someone who knows what this does, can fix 
+ * it later. :)
+ */
+int pdc_do_firm_test_reset(unsigned long ftc_bitmap)
+{
+	return mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_FIRM_TEST_RESET,
+			    PDC_FIRM_TEST_MAGIC, ftc_bitmap);
+}
+
+int pdc_do_reset()
+{
+	return mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET);
+}
+
+/*
+ * pdc_putc:
+ * Console character print using IODC.
+ *
+ * Note that only these special chars are architected for console IODC io:
+ * BEL, BS, CR, and LF. Others are passed through.
+ * Since the HP console requires CR+LF to perform a 'newline', we translate
+ * "\n" to "\r\n".
+ */
+
+void pdc_iodc_putc(unsigned char c)
+{
+	/* XXX Should we spinlock posx usage */
+	static int posx;	/* for simple TAB-Simulation... */
+	static int __attribute__((aligned(8)))   iodc_retbuf[32];
+	static char __attribute__((aligned(64))) iodc_dbuf[4096];
+	unsigned int n;
+
+	switch (c) {
+	case '\n':
+		iodc_dbuf[0] = '\r'; 
+		iodc_dbuf[1] = '\n';
+               	n = 2;
+               	posx = 0;
+		break;
+	case '\t':
+		pdc_putc(' ');
+		while (posx & 7) 	/* expand TAB */
+			pdc_putc(' ');
+		return;		/* return since IODC can't handle this */
+	case '\b':
+		posx-=2;		/* BS */
+	default:
+		iodc_dbuf[0] = c;
+		n = 1;
+		posx++;
+		break;
+	}
+
+	real32_call(PAGE0->mem_cons.iodc_io,
+		    (unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
+		    PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
+		    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), n, 0);
+}
+
+int pdc_iodc_getc(unsigned char *c)
+{
+	unsigned long flags;
+	static int __attribute__((aligned(8)))   iodc_retbuf[32];
+	static char __attribute__((aligned(64))) iodc_dbuf[4096];
+	
+	save_flags(flags);
+	cli();
+	real32_call(PAGE0->mem_kbd.iodc_io,
+		    (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
+		    PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
+		    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
+	restore_flags(flags);
+	c = *iodc_dbuf;	/* save the character directly to ch */
+	return *iodc_retbuf == 0;
+}
 
 static spinlock_t pdc_lock = SPIN_LOCK_UNLOCKED;
 
@@ -364,7 +440,7 @@ struct narrow_stack {
 	/* in reality, there's nearly 8k of stack after this */
 };
 
-long real32_call(unsigned long fn, ...)
+static long real32_call(unsigned long fn, ...)
 {
 	va_list args;
 	unsigned long r, flags;
@@ -421,7 +497,7 @@ struct wide_stack {
 	/* in reality, there's nearly 8k of stack after this */
 };
 
-long real64_call(unsigned long fn, ...)
+static long real64_call(unsigned long fn, ...)
 {
 	va_list args;
 	unsigned long r, flags;
Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.24
diff -u -p -r1.24 pdc_cons.c
--- pdc_cons.c	2001/03/08 13:30:33	1.24
+++ pdc_cons.c	2001/03/24 22:17:36
@@ -11,89 +11,23 @@
 #include <asm/system.h>
 #include <asm/pdc.h>	/* for iodc_call() proto and friends */
 
-static int __attribute__((aligned(8)))   iodc_retbuf[32];
-static char __attribute__((aligned(64))) iodc_dbuf[4096];
-
-/*
- * pdc_putc:
- * Console character print using IODC.
- *
- * Note that only these special chars are architected for console IODC io:
- * BEL, BS, CR, and LF. Others are passed through.
- * Since the HP console requires CR+LF to perform a 'newline', we translate
- * "\n" to "\r\n".
- */
-
-static int posx;	/* for simple TAB-Simulation... */
-
-/* XXX Should we spinlock posx usage */
-
-void pdc_putc(unsigned char c)
-{
-	unsigned int n;
-
-	switch (c) {
-	case '\n':
-		iodc_dbuf[0] = '\r'; 
-		iodc_dbuf[1] = '\n';
-               	n = 2;
-               	posx = 0;
-		break;
-	case '\t':
-		pdc_putc(' ');
-		while (posx & 7) 	/* expand TAB */
-			pdc_putc(' ');
-		return;		/* return since IODC can't handle this */
-	case '\b':
-		posx-=2;		/* BS */
-	default:
-		iodc_dbuf[0] = c;
-		n = 1;
-		posx++;
-		break;
-	}
-	{
-		real32_call(PAGE0->mem_cons.iodc_io,
-			(unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
-			PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
-			__pa(iodc_retbuf), 0, __pa(iodc_dbuf), n, 0);
-	}
-}
-
 static void pdc_console_write(struct console *co, const char *s, unsigned count)
 {
 	while(count--)
-		pdc_putc(*s++);
+		pdc_iodc_putc(*s++);
 }
 
-int pdc_console_wait_key(struct console *co)
+unsigned char pdc_console_wait_key(struct console *co)
 {
-	int ch = 'X';
-	int status;
+	unsigned char ch = 'X';
 
 	/* Bail if no console input device. */
 	if (!PAGE0->mem_kbd.iodc_io)
 		return 0;
 	
 	/* wait for a keyboard (rs232)-input */
-	do {
-		unsigned long flags;
-
-		save_flags(flags);
-		cli();
-		status = real32_call(PAGE0->mem_kbd.iodc_io,
-			(unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
-			PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
-			__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
-		restore_flags(flags);
-		ch = *iodc_dbuf;	/* save the character directly to ch */
-	} while (*iodc_retbuf == 0);	/* wait for a key */
+	while(pdc_iodc_getc(&ch));
 	return ch;
-}
-
-int pdc_getc(void)
-{
-	return pdc_console_wait_key(NULL);
 }
 
 static int pdc_console_setup(struct console *co, char *options)
Index: arch/parisc/kernel/process.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/process.c,v
retrieving revision 1.34
diff -u -p -r1.34 process.c
--- process.c	2001/02/23 07:02:01	1.34
+++ process.c	2001/03/24 22:17:36
@@ -113,15 +113,12 @@ void machine_restart(char *cmd)
 		** memory self tests. (Not implemented yet)
 		*/
 		if (ftc_bitmap) {
-			mem_pdc_call( PDC_BROADCAST_RESET,
-				PDC_DO_FIRM_TEST_RESET, PDC_FIRM_TEST_MAGIC,
-				ftc_bitmap);
+			pdc_do_firm_test_reset(ftc_bitmap);
 		}
 #endif
 
 		/* "Normal" system reset */
-		(void) mem_pdc_call(PDC_BROADCAST_RESET, PDC_DO_RESET,
-			0L, 0L, 0L);
+		pdc_do_reset();
 
 		/* Nope...box should reset with just CMD_RESET now */
 		gsc_writel(CMD_RESET, COMMAND_GLOBAL);
Index: include/asm-parisc/pdc.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/pdc.h,v
retrieving revision 1.28
diff -u -p -r1.28 pdc.h
--- pdc.h	2001/03/22 16:24:19	1.28
+++ pdc.h	2001/03/24 22:17:38
@@ -600,8 +600,8 @@ struct zeropage {
 #ifndef __ASSEMBLY__
 extern void pdc_console_init(void);
 /* pdc_get/put are NOT SMP safe - use at your own risk! */
-extern int  pdc_getc(void);		/* wait for char */
-extern void pdc_putc(unsigned char);	/* print char */
+extern int  pdc_iodc_getc(unsigned char *); /* wait for char */
+extern void pdc_iodc_putc(unsigned char);   /* print char */
 
 extern void setup_pdc(void);            /* in inventory.c */
 
@@ -639,6 +639,9 @@ int pdc_pci_irt(void *r_addr, void *hpa,
 int pdc_tod_read(struct pdc_tod *tod);
 int pdc_tod_set(unsigned long sec, unsigned long usec);
 
+int pdc_do_firm_test_reset(unsigned long ftc_bitmap);
+int pdc_do_reset(void);
+
 #ifdef __LP64__
 int pdc_mem_mem_table(void *r_addr, void *tbl, unsigned long entries);
 #endif
@@ -646,6 +649,10 @@ int pdc_mem_mem_table(void *r_addr, void
 /* on all currently-supported platforms, IODC I/O calls are always
  * 32-bit calls, and MEM_PDC calls are always the same width as the OS.
  * This means Cxxx boxes can't run wide kernels right now. -PB
+ *
+ * CONFIG_PDC_NARROW has been added to allow 64-bit kernels to run on
+ * systems with 32-bit MEM_PDC calls. This will allow wide kernels to
+ * run on Cxxx boxes now. -RB
  *
  * Note that some PAT boxes may have 64-bit IODC I/O...
  */
