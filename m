Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A4EE482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Nov 2001 00:35:43 -0700 (MST)
Message-ID: <3BF99676.2A291CDD@gmx.at>
Date: Tue, 20 Nov 2001 00:32:06 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: marteaut@esiee.fr, grundler@puffin.external.hp.com
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Re: E55 status - THE DRIVER !
Content-Type: multipart/mixed;
 boundary="------------F2284F98E058B5E182FDCE75"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multi-part message in MIME format.
--------------F2284F98E058B5E182FDCE75
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I had forgotten to add the "THE DRIVER" to the subject, so you may
oversee
the driver's code, sent as attachment in my pre-last mail.

To be sure, here the attachments again !


---- original mail ----

Hallo Thomas,
hallo Grant,

finally the CVS was working again.

I have no login for your CVS so I will send the `cvs diff -u' and the
newly
added file `drivers/char/pdc_drv.c'.

Some notes here:

* In my console drivers (serial and PDC) I always added code, that the
machine
can be resetted via `^\' (Ctrl-\) for development (especially for
machines 
without reset button as the E55 server). I removed this code for sending
the
CVS diffs.

* There is no CONFIG_ stuff for the PDC console, the console is
initialised
        in `arch/kernel/pdc_cons.c' (EARLY_BOOTUP_DEBUG) and the tty
driver
        has a __init constructor routine.

  ATTENTION: It is very important to have the init code in the
pdc_cons.c
        executed before the ttyBn driver is used, otherwise the first
access
        to the PDC driver (echo hallo > /dev/ttyB0) leads to a blocking
        machine ....

  The driver can also be used on machines running true serial console,
        by `echo hallo > /dev/ttyB0'. But the mix on the serial console
        of ttyS0 driver and ttyB0 driver is not recommended !!

* The driver as console is only tested on the server E55 (model
9000/856)
        and the HP apollo 700 series (9000/720/50), in both cases the
        machine was configured to use the serial line.
        Further I tested the kernel on a 712/60 machine, having PDC
console
        on STI device. Here the PDC console is used correctly, but then
        the console switches to the colored frame buffer (and the text
is
        completly BLUE (!) and is overwriting the poor TUX !
        I think here is a bug in the console handling not staying on the
        configured device (has nothing to do with my stuff) or it is a
        feature ti have full STI support if it possible ... 
        But /dev/ttyB0 is never used together with an STI able machine
.. :-)

* I added the `CP:' to my modules or `XXX CP:' if there is something to
do ...

* As I cannot checkin, I have no way to give change logs, so I will do
here
a short list:

- pdc_drv.c: Added file, PDC console tty driver for linux, /dev/ttyBn, 
        n=0 (only)

- pdc_cons.c: Added keyboard polling routine, added an function entry to
get
        an device entry for the console driver to "connet" the pdc_cons 
        driver to the PDC tty driver

- pdc.h: Added prototypes used for console and LEDs

- firmware.c: Added reading access to the PDC console (was former used
for 
        waiting on a keypress), readded the pdc_chassis_disp () (was
removed 
        in the meantime, but at the current state I use it for the E55
LEDs).

- led.c: Added a "trial" version of a LED controlling. Only RUN and
ATTENTION
        LED is supported. RUN/ATTENTION stated derived from state of the 
        HEART-BEAT LED (flashing->RUN, off->ATTENTION), and so the LEDs
are 
        also accessable via PROC-FS. The LED activation of my routines
is
        derived from the model name (hard coded 9000/856) for my tests.
        How to deal with this in the future ?

- major.h: Added free major 30 (character device) for PDC console
(ttyBn).

- drivers/char/Makefile: pdc_drv.o added (per hack) to arch PARISC
dependent code.

The code builds warning-free.

Again to test:

1. Compile and have a look that the pdc_drv.o is included in
drivers/char/Makefile
2. dev entry /dev/ttyB0 c 30 0
3. /etc/inittab, have a login at ttyB0
4. Added the `ttyB0' device to /etc/securetty, if you want login as
`root' on the
        console
5. kernel line parameter with `console=ttyB0'

(ad 1): In the future (if somebody can help me) we want to have a config
item in
the kernel configuration for the PDC console. 


I attch two files:
        - linux-cvs.diff-20011119.log
                Diffs displayed by `cvs -z9 diff -u .'
        - pdc_drv.c
                The new file (simple displayed as `?
drivers/char/pdc_drv.c')
                The file has to be checked in at `drivers/char'

I hope you can use it and will add it to the mainstream kernel ...

Bye
Christoph P.






-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
--------------F2284F98E058B5E182FDCE75
Content-Type: text/plain; charset=us-ascii;
 name="linux-cvs.diff-20011119.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-cvs.diff-20011119.log"

? drivers/char/pdc_drv.c
cvs server: Diffing .
cvs server: Diffing Documentation
cvs server: Diffing Documentation/DocBook
cvs server: Diffing Documentation/arm
cvs server: Diffing Documentation/arm/SA1100
cvs server: Diffing Documentation/arm/empeg
cvs server: Diffing Documentation/arm/nwfpe
cvs server: Diffing Documentation/cdrom
cvs server: Diffing Documentation/cris
cvs server: Diffing Documentation/fb
cvs server: Diffing Documentation/filesystems
cvs server: Diffing Documentation/filesystems/devfs
cvs server: Diffing Documentation/i2c
cvs server: Diffing Documentation/i386
cvs server: Diffing Documentation/ia64
cvs server: Diffing Documentation/isdn
cvs server: Diffing Documentation/kbuild
cvs server: Diffing Documentation/m68k
cvs server: Diffing Documentation/mips
cvs server: Diffing Documentation/networking
cvs server: Diffing Documentation/parisc
cvs server: Diffing Documentation/power
cvs server: Diffing Documentation/powerpc
cvs server: Diffing Documentation/s390
cvs server: Diffing Documentation/sound
cvs server: Diffing Documentation/sparc
cvs server: Diffing Documentation/sysctl
cvs server: Diffing Documentation/telephony
cvs server: Diffing Documentation/usb
cvs server: Diffing Documentation/video4linux
cvs server: Diffing Documentation/video4linux/bttv
cvs server: Diffing Documentation/vm
cvs server: Diffing arch
cvs server: Diffing arch/alpha
cvs server: Diffing arch/alpha/boot
cvs server: Diffing arch/alpha/boot/tools
cvs server: Diffing arch/alpha/kernel
cvs server: Diffing arch/alpha/lib
cvs server: Diffing arch/alpha/math-emu
cvs server: Diffing arch/alpha/mm
cvs server: Diffing arch/arm
cvs server: Diffing arch/arm/boot
cvs server: Diffing arch/arm/boot/bootp
cvs server: Diffing arch/arm/boot/compressed
cvs server: Diffing arch/arm/def-configs
cvs server: Diffing arch/arm/kernel
cvs server: Diffing arch/arm/lib
cvs server: Diffing arch/arm/mach-anakin
cvs server: Diffing arch/arm/mach-ebsa110
cvs server: Diffing arch/arm/mach-footbridge
cvs server: Diffing arch/arm/mach-integrator
cvs server: Diffing arch/arm/mach-sa1100
cvs server: Diffing arch/arm/mach-shark
cvs server: Diffing arch/arm/mm
cvs server: Diffing arch/arm/nwfpe
cvs server: Diffing arch/arm/tools
cvs server: Diffing arch/cris
cvs server: Diffing arch/cris/boot
cvs server: Diffing arch/cris/boot/compressed
cvs server: Diffing arch/cris/boot/rescue
cvs server: Diffing arch/cris/boot/tools
cvs server: Diffing arch/cris/drivers
cvs server: Diffing arch/cris/drivers/examples
cvs server: Diffing arch/cris/drivers/lpslave
cvs server: Diffing arch/cris/kernel
cvs server: Diffing arch/cris/lib
cvs server: Diffing arch/cris/mm
cvs server: Diffing arch/i386
cvs server: Diffing arch/i386/boot
cvs server: Diffing arch/i386/boot/compressed
cvs server: Diffing arch/i386/boot/tools
cvs server: Diffing arch/i386/kernel
cvs server: Diffing arch/i386/lib
cvs server: Diffing arch/i386/math-emu
cvs server: Diffing arch/i386/mm
cvs server: Diffing arch/ia64
cvs server: Diffing arch/ia64/boot
cvs server: Diffing arch/ia64/dig
cvs server: Diffing arch/ia64/hp
cvs server: Diffing arch/ia64/ia32
cvs server: Diffing arch/ia64/kdb
cvs server: Diffing arch/ia64/kernel
cvs server: Diffing arch/ia64/lib
cvs server: Diffing arch/ia64/mm
cvs server: Diffing arch/ia64/sn
cvs server: Diffing arch/ia64/sn/fprom
cvs server: Diffing arch/ia64/sn/io
cvs server: Diffing arch/ia64/sn/sn1
cvs server: Diffing arch/ia64/sn/tools
cvs server: Diffing arch/ia64/tools
cvs server: Diffing arch/m68k
cvs server: Diffing arch/m68k/amiga
cvs server: Diffing arch/m68k/apollo
cvs server: Diffing arch/m68k/atari
cvs server: Diffing arch/m68k/bvme6000
cvs server: Diffing arch/m68k/fpsp040
cvs server: Diffing arch/m68k/hp300
cvs server: Diffing arch/m68k/ifpsp060
cvs server: Diffing arch/m68k/ifpsp060/src
cvs server: Diffing arch/m68k/kernel
cvs server: Diffing arch/m68k/lib
cvs server: Diffing arch/m68k/mac
cvs server: Diffing arch/m68k/math-emu
cvs server: Diffing arch/m68k/mm
cvs server: Diffing arch/m68k/mvme147
cvs server: Diffing arch/m68k/mvme16x
cvs server: Diffing arch/m68k/q40
cvs server: Diffing arch/m68k/sun3
cvs server: Diffing arch/m68k/sun3/prom
cvs server: Diffing arch/m68k/sun3x
cvs server: Diffing arch/m68k/tools
cvs server: Diffing arch/m68k/tools/amiga
cvs server: Diffing arch/mips
cvs server: Diffing arch/mips/algor
cvs server: Diffing arch/mips/arc
cvs server: Diffing arch/mips/baget
cvs server: Diffing arch/mips/baget/prom
cvs server: Diffing arch/mips/boot
cvs server: Diffing arch/mips/cobalt
cvs server: Diffing arch/mips/ddb5074
cvs server: Diffing arch/mips/ddb5476
cvs server: Diffing arch/mips/dec
cvs server: Diffing arch/mips/dec/boot
cvs server: Diffing arch/mips/dec/prom
cvs server: Diffing arch/mips/ite-boards
cvs server: Diffing arch/mips/ite-boards/generic
cvs server: Diffing arch/mips/ite-boards/qed-4n-s01b
cvs server: Diffing arch/mips/jazz
cvs server: Diffing arch/mips/kernel
cvs server: Diffing arch/mips/lib
cvs server: Diffing arch/mips/math-emu
cvs server: Diffing arch/mips/mips-boards
cvs server: Diffing arch/mips/mips-boards/atlas
cvs server: Diffing arch/mips/mips-boards/generic
cvs server: Diffing arch/mips/mips-boards/malta
cvs server: Diffing arch/mips/mm
cvs server: Diffing arch/mips/orion
cvs server: Diffing arch/mips/sgi
cvs server: Diffing arch/mips/sgi/kernel
cvs server: Diffing arch/mips/sni
cvs server: Diffing arch/mips/tools
cvs server: Diffing arch/mips64
cvs server: Diffing arch/mips64/arc
cvs server: Diffing arch/mips64/boot
cvs server: Diffing arch/mips64/kernel
cvs server: Diffing arch/mips64/lib
cvs server: Diffing arch/mips64/math-emu
cvs server: Diffing arch/mips64/mm
cvs server: Diffing arch/mips64/sgi-ip22
cvs server: Diffing arch/mips64/sgi-ip27
cvs server: Diffing arch/mips64/tools
cvs server: Diffing arch/parisc
cvs server: Diffing arch/parisc/boot
cvs server: Diffing arch/parisc/boot/boot_code
cvs server: Diffing arch/parisc/debian-configs
cvs server: Diffing arch/parisc/hpux
cvs server: Diffing arch/parisc/kernel
Index: arch/parisc/kernel/firmware.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/firmware.c,v
retrieving revision 1.36
diff -u -r1.36 firmware.c
--- arch/parisc/kernel/firmware.c	2001/11/13 23:25:45	1.36
+++ arch/parisc/kernel/firmware.c	2001/11/19 22:17:48
@@ -136,6 +136,15 @@
 }
 
 /**
+ * pdc_chassis_disp, used for E-series (for example E55)
+ */
+
+int pdc_chassis_disp(unsigned long disp)
+{
+        return mem_pdc_call(PDC_CHASSIS, PDC_CHASSIS_DISP, disp);
+}
+
+/**
  * pdc_chassis_info - Return chassis information.
  * @result: The return buffer.
  * @chassis_info: The memory buffer address.
@@ -681,6 +690,59 @@
                     PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
                     __pa(iodc_retbuf), 0, __pa(iodc_dbuf), n, 0);
         spin_unlock_irqrestore(&pdc_lock, flags);
+}
+
+/* write character directly without convertings */
+
+void pdc_iodc_outc(unsigned char c)
+{
+	/* fill buffer with one caracter and print it */
+        static int __attribute__((aligned(8)))   iodc_retbuf[32];
+        static char __attribute__((aligned(64))) iodc_dbuf[4096];
+	unsigned int n;
+
+	iodc_dbuf[0] = c;
+	n = 1;
+	{
+		real32_call(PAGE0->mem_cons.iodc_io,
+			(unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_COUT,
+			PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers),
+			__pa(iodc_retbuf), 0, __pa(iodc_dbuf), n, 0);
+	}
+}
+
+/* read NON-BLOCKING a character from the PDC console,
+   returns -1, if no key is present */
+
+int pdc_iodc_getc(void)
+{
+        static int __attribute__((aligned(8)))   iodc_retbuf[32];
+        static char __attribute__((aligned(64))) iodc_dbuf[4096];
+	int ch;
+	int status;
+
+	/* Bail if no console input device. */
+	if (!PAGE0->mem_kbd.iodc_io)
+		return 0;
+	
+	/* wait for a keyboard (rs232)-input */
+	do {
+		unsigned long flags;
+
+		save_flags(flags);
+		cli();
+		status = real32_call(PAGE0->mem_kbd.iodc_io,
+			(unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
+			PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers),
+			__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
+		restore_flags(flags);
+		ch = *iodc_dbuf;	/* save the character directly to ch */
+	} while (0) ;                   /* once !! */
+
+	if (*iodc_retbuf == 0)	        /* no key */
+	    ch = -1;
+	
+	return ch;
 }
 
 int pdc_sti_call(unsigned long func, unsigned long flags,
Index: arch/parisc/kernel/led.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/led.c,v
retrieving revision 1.24
diff -u -r1.24 led.c
--- arch/parisc/kernel/led.c	2001/10/22 15:45:36	1.24
+++ arch/parisc/kernel/led.c	2001/11/19 22:17:49
@@ -51,6 +51,30 @@
 static int led_lanrxtx = 1;
 static char lcd_text[32] = {0};
 
+/*****
+ * stuff for E55 and similar server with RUN/ATTENTION LED
+ */
+
+#define LED_CHASSIS_OFF            0
+#define LED_CHASSIS_FAULT          1
+#define LED_CHASSIS_TEST           2
+#define LED_CHASSIS_INIT           3
+#define LED_CHASSIS_SHUTDOWN       4
+#define LED_CHASSIS_WARNING        5
+#define LED_CHASSIS_RUN            6
+#define LED_CHASSIS_ALL_ON         7
+
+#define LED_CHASSIS_BYTE(v) ((unsigned long)((v) << 1))
+#define LED_CHASSIS_DISP_DATA(v) ((unsigned long)(LED_CHASSIS_BYTE(v) << 16))
+extern int pdc_chassis_disp (unsigned long);
+extern int pdc_model_sysmodel (char *);
+static int use_chassis_call = 0;
+static int chassis_run_mode = 0;
+
+void led_chassis_run (void);
+void led_chassis_attention (void);
+void led_chassis_init (void);
+
 #if 0
 #define DPRINTK(x)	printk x
 #else
@@ -450,13 +474,24 @@
 
 	if (led_heartbeat)
 	{
+		/* for server with RUN led, switch it on, heartbeat is active,
+		   led_chassis_run() checks itself, if a machine of this
+		   type is used */
+		led_chassis_run ();
+		
 		/* flash heartbeat-LED like a real heart (2 x short then a long delay) */
 		if (count_HZ<HEARTBEAT_LEN || 
 		    (count_HZ>=HEARTBEAT_2ND_RANGE_START && count_HZ<HEARTBEAT_2ND_RANGE_END)) 
 		    currentleds |= LED_HEARTBEAT;
 		else
 		    currentleds &= ~LED_HEARTBEAT;
+	} else {
+		/* if no heartbeat, also let light ATTENTION on some
+		   machine. led_chassis_attention() will check itself,
+		   if a machine of this type is used */
+		led_chassis_attention();
 	}
+	
 
 	/* gather network and diskio statistics and flash LEDs respectively */
 
@@ -541,7 +576,10 @@
 	else
 		if (led_func_ptr)
 			led_func_ptr(0xff); /* turn all LEDs ON */
-	
+	/* call led_chassis_attention(), routine cheks itself, if
+	   this display type is valid */
+	led_chassis_attention();
+
 	unregister_reboot_notifier(&led_notifier);
 	return NOTIFY_OK;
 }
@@ -673,6 +711,54 @@
 	return lcd_info.lcd_width;
 }
 
+
+/*
+   ** HP E55 (and similar) stuff
+   **
+   ** These series has only static LED
+   **
+   ** At the moment only two will be supported
+   **    RUN
+   **    ATTENTION
+   **
+   ** These to LEDs are used disjunct
+*/
+
+void led_chassis_run (void)
+{
+	if (use_chassis_call && !chassis_run_mode) {
+		pdc_chassis_disp (LED_CHASSIS_DISP_DATA(LED_CHASSIS_RUN));
+		chassis_run_mode = 1;
+	}
+}
+
+void led_chassis_attention (void)
+{
+	if (use_chassis_call && chassis_run_mode) {
+		pdc_chassis_disp (LED_CHASSIS_DISP_DATA(LED_CHASSIS_INIT));
+		chassis_run_mode = 0;
+	}
+}
+
+void led_chassis_init (void)
+{
+#define MODBUF_LEN 32
+	char buf [MODBUF_LEN];  /* small enough to lay on stack */
+	
+	if (pdc_model_sysmodel (buf) < 0) {
+		printk (KERN_NOTICE "%s: error reading sys model\n", 
+			__FUNCTION__);
+		return;
+	}
+	
+	if (strncmp (buf, "9000/856", MODBUF_LEN) == 0)
+		use_chassis_call = 1;
+
+	/* XXX CP: Add other models ! */
+
+	chassis_run_mode = 0;
+}
+
 /*
    ** led_init()
    ** 
@@ -703,6 +789,8 @@
 	}
 
 	/* initialize the struct, so that we can check for valid return values */
+	led_chassis_init();
+
 	lcd_info.model = DISPLAY_MODEL_NONE;
 	chassis_info.actcnt = chassis_info.maxcnt = 0;
 
Index: arch/parisc/kernel/pdc_cons.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/pdc_cons.c,v
retrieving revision 1.29
diff -u -r1.29 pdc_cons.c
--- arch/parisc/kernel/pdc_cons.c	2001/11/13 23:35:01	1.29
+++ arch/parisc/kernel/pdc_cons.c	2001/11/19 22:17:49
@@ -12,9 +12,19 @@
 
 /* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems. 
  * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
-#undef EARLY_BOOTUP_DEBUG
 
+/* #undef EARLY_BOOTUP_DEBUG */
 
+/* CP 
+   activate PDC console in any case for testing the ttyB0
+
+   TODO: This must be activated if a "CONFIG_PDC_CONSOLE" is
+   configured (necessary), otherwise the EARLY_BOOTUP_DEBUG should
+   be undefined !
+*/
+#define EARLY_BOOTUP_DEBUG
+
+
 #include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/console.h>
@@ -35,16 +45,32 @@
 		pdc_iodc_putc(*s++);
 }
 
+void pdc_outc(unsigned char c)
+{
+	pdc_iodc_outc(c);
+}
+
+
+int pdc_console_poll_key(struct console *co)
+{
+	return pdc_iodc_getc();
+}
+
 static int pdc_console_setup(struct console *co, char *options)
 {
 	return 0;
 }
 
+static kdev_t pdc_console_device (struct console *c)
+{
+        return MKDEV(PDCCONS_MAJOR, 0);
+}
+
 static struct console pdc_cons = {
 	name:		"ttyB",
 	write:		pdc_console_write,
 	read:		NULL,
-	device:		NULL, 
+	device:		pdc_console_device, 
 	wait_key:	NULL,
 	unblank:	NULL,
 	setup:		pdc_console_setup,
cvs server: Diffing arch/parisc/lib
cvs server: Diffing arch/parisc/math-emu
cvs server: Diffing arch/parisc/mm
cvs server: Diffing arch/parisc/real
cvs server: Diffing arch/parisc/tools
cvs server: Diffing arch/parisc64
cvs server: Diffing arch/parisc64/hpux
cvs server: Diffing arch/parisc64/kernel
cvs server: Diffing arch/parisc64/lib
cvs server: Diffing arch/parisc64/mm
cvs server: Diffing arch/parisc64/real
cvs server: Diffing arch/parisc64/tools
cvs server: Diffing arch/ppc
cvs server: Diffing arch/ppc/8260_io
cvs server: Diffing arch/ppc/8xx_io
cvs server: Diffing arch/ppc/amiga
cvs server: Diffing arch/ppc/boot
cvs server: Diffing arch/ppc/boot/chrp
cvs server: Diffing arch/ppc/boot/common
cvs server: Diffing arch/ppc/boot/images
cvs server: Diffing arch/ppc/boot/include
cvs server: Diffing arch/ppc/boot/lib
cvs server: Diffing arch/ppc/boot/mbx
cvs server: Diffing arch/ppc/boot/pmac
cvs server: Diffing arch/ppc/boot/prep
cvs server: Diffing arch/ppc/boot/tree
cvs server: Diffing arch/ppc/boot/utils
cvs server: Diffing arch/ppc/chrpboot
cvs server: Diffing arch/ppc/coffboot
cvs server: Diffing arch/ppc/configs
cvs server: Diffing arch/ppc/kernel
cvs server: Diffing arch/ppc/lib
cvs server: Diffing arch/ppc/math-emu
cvs server: Diffing arch/ppc/mbxboot
cvs server: Diffing arch/ppc/mm
cvs server: Diffing arch/ppc/treeboot
cvs server: Diffing arch/ppc/xmon
cvs server: Diffing arch/s390
cvs server: Diffing arch/s390/boot
cvs server: Diffing arch/s390/kernel
cvs server: Diffing arch/s390/lib
cvs server: Diffing arch/s390/math-emu
cvs server: Diffing arch/s390/mm
cvs server: Diffing arch/s390/tools
cvs server: Diffing arch/s390/tools/dasdfmt
cvs server: Diffing arch/s390/tools/silo
cvs server: Diffing arch/s390x
cvs server: Diffing arch/s390x/boot
cvs server: Diffing arch/s390x/kernel
cvs server: Diffing arch/s390x/lib
cvs server: Diffing arch/s390x/mm
cvs server: Diffing arch/s390x/tools
cvs server: Diffing arch/s390x/tools/dasdfmt
cvs server: Diffing arch/s390x/tools/silo
cvs server: Diffing arch/sh
cvs server: Diffing arch/sh/boot
cvs server: Diffing arch/sh/boot/compressed
cvs server: Diffing arch/sh/kernel
cvs server: Diffing arch/sh/lib
cvs server: Diffing arch/sh/mm
cvs server: Diffing arch/sh/stboards
cvs server: Diffing arch/sparc
cvs server: Diffing arch/sparc/ap1000
cvs server: Diffing arch/sparc/boot
cvs server: Diffing arch/sparc/kernel
cvs server: Diffing arch/sparc/lib
cvs server: Diffing arch/sparc/math-emu
cvs server: Diffing arch/sparc/mm
cvs server: Diffing arch/sparc/prom
cvs server: Diffing arch/sparc64
cvs server: Diffing arch/sparc64/boot
cvs server: Diffing arch/sparc64/kernel
cvs server: Diffing arch/sparc64/lib
cvs server: Diffing arch/sparc64/math-emu
cvs server: Diffing arch/sparc64/mm
cvs server: Diffing arch/sparc64/prom
cvs server: Diffing arch/sparc64/solaris
cvs server: Diffing drivers
cvs server: Diffing drivers/acorn
cvs server: Diffing drivers/acorn/block
cvs server: Diffing drivers/acorn/char
cvs server: Diffing drivers/acorn/net
cvs server: Diffing drivers/acorn/scsi
cvs server: Diffing drivers/acpi
cvs server: Diffing drivers/acpi/common
cvs server: Diffing drivers/acpi/debugger
cvs server: Diffing drivers/acpi/dispatcher
cvs server: Diffing drivers/acpi/events
cvs server: Diffing drivers/acpi/executer
cvs server: Diffing drivers/acpi/hardware
cvs server: Diffing drivers/acpi/include
cvs server: Diffing drivers/acpi/include/platform
cvs server: Diffing drivers/acpi/interpreter
cvs server: Diffing drivers/acpi/namespace
cvs server: Diffing drivers/acpi/ospm
cvs server: Diffing drivers/acpi/ospm/ac_adapter
cvs server: Diffing drivers/acpi/ospm/battery
cvs server: Diffing drivers/acpi/ospm/busmgr
cvs server: Diffing drivers/acpi/ospm/button
cvs server: Diffing drivers/acpi/ospm/ec
cvs server: Diffing drivers/acpi/ospm/include
cvs server: Diffing drivers/acpi/ospm/processor
cvs server: Diffing drivers/acpi/ospm/system
cvs server: Diffing drivers/acpi/ospm/thermal
cvs server: Diffing drivers/acpi/parser
cvs server: Diffing drivers/acpi/resources
cvs server: Diffing drivers/acpi/tables
cvs server: Diffing drivers/acpi/utilities
cvs server: Diffing drivers/ap1000
cvs server: Diffing drivers/atm
cvs server: Diffing drivers/block
cvs server: Diffing drivers/block/paride
cvs server: Diffing drivers/bluetooth
cvs server: Diffing drivers/cdrom
cvs server: Diffing drivers/char
Index: drivers/char/Makefile
===================================================================
RCS file: /var/cvs/linux/drivers/char/Makefile,v
retrieving revision 1.23
diff -u -r1.23 Makefile
--- drivers/char/Makefile	2001/11/09 23:35:36	1.23
+++ drivers/char/Makefile	2001/11/19 22:17:51
@@ -64,6 +64,10 @@
 endif
 
 ifeq ($(ARCH),parisc)
+   # XXX CP: Added for all PA-RISC architecture, 
+   #         should be made configurable ...
+   obj-y += pdc_drv.o
+
    ifdef CONFIG_GSC_PS2
      KEYBD   = hp_psaux.o hp_keyb.o
    else
cvs server: Diffing drivers/char/agp
cvs server: Diffing drivers/char/drm
cvs server: Diffing drivers/char/ftape
cvs server: Diffing drivers/char/ftape/compressor
cvs server: Diffing drivers/char/ftape/lowlevel
cvs server: Diffing drivers/char/ftape/zftape
cvs server: Diffing drivers/char/ip2
cvs server: Diffing drivers/char/joystick
cvs server: Diffing drivers/char/pcmcia
cvs server: Diffing drivers/char/rio
cvs server: Diffing drivers/dio
cvs server: Diffing drivers/fc4
cvs server: Diffing drivers/gsc
cvs server: Diffing drivers/i2c
cvs server: Diffing drivers/i2o
cvs server: Diffing drivers/ide
cvs server: Diffing drivers/ieee1394
cvs server: Diffing drivers/input
cvs server: Diffing drivers/isdn
cvs server: Diffing drivers/isdn/act2000
cvs server: Diffing drivers/isdn/avmb1
cvs server: Diffing drivers/isdn/divert
cvs server: Diffing drivers/isdn/eicon
cvs server: Diffing drivers/isdn/hisax
cvs server: Diffing drivers/isdn/hysdn
cvs server: Diffing drivers/isdn/icn
cvs server: Diffing drivers/isdn/isdnloop
cvs server: Diffing drivers/isdn/pcbit
cvs server: Diffing drivers/isdn/sc
cvs server: Diffing drivers/isdn/tpam
cvs server: Diffing drivers/macintosh
cvs server: Diffing drivers/md
cvs server: Diffing drivers/media
cvs server: Diffing drivers/media/radio
cvs server: Diffing drivers/media/video
cvs server: Diffing drivers/message
cvs server: Diffing drivers/message/fusion
cvs server: Diffing drivers/message/fusion/lsi
cvs server: Diffing drivers/misc
cvs server: Diffing drivers/mtd
cvs server: Diffing drivers/mtd/chips
cvs server: Diffing drivers/mtd/devices
cvs server: Diffing drivers/mtd/maps
cvs server: Diffing drivers/mtd/nand
cvs server: Diffing drivers/net
cvs server: Diffing drivers/net/appletalk
cvs server: Diffing drivers/net/arcnet
cvs server: Diffing drivers/net/fc
cvs server: Diffing drivers/net/hamradio
cvs server: Diffing drivers/net/hamradio/soundmodem
cvs server: Diffing drivers/net/irda
cvs server: Diffing drivers/net/pcmcia
cvs server: Diffing drivers/net/sk98lin
cvs server: Diffing drivers/net/sk98lin/h
cvs server: Diffing drivers/net/skfp
cvs server: Diffing drivers/net/skfp/h
cvs server: Diffing drivers/net/tokenring
cvs server: Diffing drivers/net/tulip
cvs server: Diffing drivers/net/wan
cvs server: Diffing drivers/net/wan/lmc
cvs server: Diffing drivers/net/wireless
cvs server: Diffing drivers/nubus
cvs server: Diffing drivers/parport
cvs server: Diffing drivers/pci
cvs server: Diffing drivers/pcmcia
cvs server: Diffing drivers/pnp
cvs server: Diffing drivers/s390
cvs server: Diffing drivers/s390/block
cvs server: Diffing drivers/s390/char
cvs server: Diffing drivers/s390/misc
cvs server: Diffing drivers/s390/net
cvs server: Diffing drivers/sbus
cvs server: Diffing drivers/sbus/audio
cvs server: Diffing drivers/sbus/char
cvs server: Diffing drivers/scsi
cvs server: Diffing drivers/scsi/aic7xxx
cvs server: Diffing drivers/scsi/aic7xxx/aicasm
cvs server: Diffing drivers/scsi/aic7xxx_old
cvs server: Diffing drivers/scsi/pcmcia
cvs server: Diffing drivers/sgi
cvs server: Diffing drivers/sgi/char
cvs server: Diffing drivers/sound
cvs server: Diffing drivers/sound/cs4281
cvs server: Diffing drivers/sound/dmasound
cvs server: Diffing drivers/sound/emu10k1
cvs server: Diffing drivers/sound/lowlevel
cvs server: Diffing drivers/tc
cvs server: Diffing drivers/telephony
cvs server: Diffing drivers/usb
cvs server: Diffing drivers/usb/maps
cvs server: Diffing drivers/usb/serial
cvs server: Diffing drivers/usb/storage
cvs server: Diffing drivers/video
cvs server: Diffing drivers/video/aty
cvs server: Diffing drivers/video/matrox
cvs server: Diffing drivers/video/riva
cvs server: Diffing drivers/video/sis
cvs server: Diffing drivers/video/sti
cvs server: Diffing drivers/zorro
cvs server: Diffing fs
cvs server: Diffing fs/adfs
cvs server: Diffing fs/affs
cvs server: Diffing fs/autofs
cvs server: Diffing fs/autofs4
cvs server: Diffing fs/bfs
cvs server: Diffing fs/coda
cvs server: Diffing fs/cramfs
cvs server: Diffing fs/cramfs/inflate
cvs server: Diffing fs/devfs
cvs server: Diffing fs/devpts
cvs server: Diffing fs/efs
cvs server: Diffing fs/ext2
cvs server: Diffing fs/fat
cvs server: Diffing fs/freevxfs
cvs server: Diffing fs/hfs
cvs server: Diffing fs/hpfs
cvs server: Diffing fs/isofs
cvs server: Diffing fs/jffs
cvs server: Diffing fs/lockd
cvs server: Diffing fs/minix
cvs server: Diffing fs/msdos
cvs server: Diffing fs/ncpfs
cvs server: Diffing fs/nfs
cvs server: Diffing fs/nfsd
cvs server: Diffing fs/nls
cvs server: Diffing fs/ntfs
cvs server: Diffing fs/openpromfs
cvs server: Diffing fs/partitions
cvs server: Diffing fs/proc
cvs server: Diffing fs/qnx4
cvs server: Diffing fs/ramfs
cvs server: Diffing fs/reiserfs
cvs server: Diffing fs/romfs
cvs server: Diffing fs/smbfs
cvs server: Diffing fs/sysv
cvs server: Diffing fs/udf
cvs server: Diffing fs/ufs
cvs server: Diffing fs/umsdos
cvs server: Diffing fs/vfat
cvs server: Diffing include
cvs server: Diffing include/asm-alpha
cvs server: Diffing include/asm-arm
cvs server: Diffing include/asm-arm/arch-a5k
cvs server: Diffing include/asm-arm/arch-anakin
cvs server: Diffing include/asm-arm/arch-arc
cvs server: Diffing include/asm-arm/arch-cl7500
cvs server: Diffing include/asm-arm/arch-ebsa110
cvs server: Diffing include/asm-arm/arch-ebsa285
cvs server: Diffing include/asm-arm/arch-integrator
cvs server: Diffing include/asm-arm/arch-l7200
cvs server: Diffing include/asm-arm/arch-nexuspci
cvs server: Diffing include/asm-arm/arch-rpc
cvs server: Diffing include/asm-arm/arch-sa1100
cvs server: Diffing include/asm-arm/arch-shark
cvs server: Diffing include/asm-arm/arch-tbox
cvs server: Diffing include/asm-arm/hardware
cvs server: Diffing include/asm-arm/mach
cvs server: Diffing include/asm-arm/proc-armo
cvs server: Diffing include/asm-arm/proc-armv
cvs server: Diffing include/asm-cris
cvs server: Diffing include/asm-generic
cvs server: Diffing include/asm-i386
cvs server: Diffing include/asm-ia64
cvs server: Diffing include/asm-ia64/sn
cvs server: Diffing include/asm-ia64/sn/arc
cvs server: Diffing include/asm-ia64/sn/ksys
cvs server: Diffing include/asm-ia64/sn/pci
cvs server: Diffing include/asm-ia64/sn/sn1
cvs server: Diffing include/asm-ia64/sn/xtalk
cvs server: Diffing include/asm-m68k
cvs server: Diffing include/asm-mips
cvs server: Diffing include/asm-mips/arc
cvs server: Diffing include/asm-mips/baget
cvs server: Diffing include/asm-mips/dec
cvs server: Diffing include/asm-mips/it8172
cvs server: Diffing include/asm-mips/pmc
cvs server: Diffing include/asm-mips/sgi
cvs server: Diffing include/asm-mips64
cvs server: Diffing include/asm-mips64/arc
cvs server: Diffing include/asm-mips64/gcc
cvs server: Diffing include/asm-mips64/pci
cvs server: Diffing include/asm-mips64/sgi
cvs server: Diffing include/asm-mips64/sn
cvs server: Diffing include/asm-mips64/sn/sn0
cvs server: Diffing include/asm-mips64/xtalk
cvs server: Diffing include/asm-parisc
Index: include/asm-parisc/pdc.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/pdc.h,v
retrieving revision 1.37
diff -u -r1.37 pdc.h
--- include/asm-parisc/pdc.h	2001/11/13 22:26:51	1.37
+++ include/asm-parisc/pdc.h	2001/11/19 22:18:13
@@ -816,7 +816,9 @@
 int pdc_do_reset(void);
 int pdc_soft_power_info(unsigned long *power_reg);
 void pdc_soft_power_shutdown(void);
+int pdc_iodc_getc(void);
 void pdc_iodc_putc(unsigned char c);
+void pdc_iodc_outc(unsigned char c);
 
 int pdc_sti_call(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
cvs server: Diffing include/asm-parisc64
cvs server: Diffing include/asm-ppc
cvs server: Diffing include/asm-s390
cvs server: Diffing include/asm-s390x
cvs server: Diffing include/asm-sh
cvs server: Diffing include/asm-sparc
cvs server: Diffing include/asm-sparc/ap1000
cvs server: Diffing include/asm-sparc64
cvs server: Diffing include/linux
Index: include/linux/major.h
===================================================================
RCS file: /var/cvs/linux/include/linux/major.h,v
retrieving revision 1.10
diff -u -r1.10 major.h
--- include/linux/major.h	2001/11/09 23:37:14	1.10
+++ include/linux/major.h	2001/11/19 22:18:34
@@ -63,6 +63,7 @@
 #define ACSI_MAJOR	28
 #define AZTECH_CDROM_MAJOR 29
 #define GRAPHDEV_MAJOR	29	/* SparcLinux & Linux/68k /dev/fb */
+#define PDCCONS_MAJOR   30      /* CP: PDC console */
 #define SHMIQ_MAJOR	85	/* Linux/mips, SGI /dev/shmiq */
 #define CM206_CDROM_MAJOR 32
 #define IDE2_MAJOR	33
cvs server: Diffing include/linux/byteorder
cvs server: Diffing include/linux/isdn
cvs server: Diffing include/linux/lockd
cvs server: Diffing include/linux/mtd
cvs server: Diffing include/linux/netfilter_ipv4
cvs server: Diffing include/linux/netfilter_ipv6
cvs server: Diffing include/linux/nfsd
cvs server: Diffing include/linux/raid
cvs server: Diffing include/linux/sunrpc
cvs server: Diffing include/math-emu
cvs server: Diffing include/net
cvs server: Diffing include/net/bluetooth
cvs server: Diffing include/net/irda
cvs server: Diffing include/pcmcia
cvs server: Diffing include/scsi
cvs server: Diffing include/video
cvs server: Diffing init
cvs server: Diffing ipc
cvs server: Diffing kernel
cvs server: Diffing lib
cvs server: Diffing mm
cvs server: Diffing net
cvs server: Diffing net/802
cvs server: Diffing net/802/pseudo
cvs server: Diffing net/802/transit
cvs server: Diffing net/appletalk
cvs server: Diffing net/atm
cvs server: Diffing net/ax25
cvs server: Diffing net/bluetooth
cvs server: Diffing net/bridge
cvs server: Diffing net/core
cvs server: Diffing net/decnet
cvs server: Diffing net/econet
cvs server: Diffing net/ethernet
cvs server: Diffing net/ipv4
cvs server: Diffing net/ipv4/netfilter
cvs server: Diffing net/ipv6
cvs server: Diffing net/ipv6/netfilter
cvs server: Diffing net/ipx
cvs server: Diffing net/irda
cvs server: Diffing net/irda/compressors
cvs server: Diffing net/irda/ircomm
cvs server: Diffing net/irda/irlan
cvs server: Diffing net/irda/irnet
cvs server: Diffing net/khttpd
cvs server: Diffing net/lapb
cvs server: Diffing net/netlink
cvs server: Diffing net/netrom
cvs server: Diffing net/packet
cvs server: Diffing net/rose
cvs server: Diffing net/sched
cvs server: Diffing net/sunrpc
cvs server: Diffing net/unix
cvs server: Diffing net/wanrouter
cvs server: Diffing net/x25
cvs server: Diffing scripts
cvs server: Diffing scripts/cramfs
cvs server: Diffing scripts/ksymoops
cvs server: Diffing scripts/lxdialog
cvs server: Diffing scripts/usb

--------------F2284F98E058B5E182FDCE75
Content-Type: text/plain; charset=us-ascii;
 name="pdc_drv.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pdc_drv.c"

/*
 *  linux/drivers/char/pdc_drv.c
 *
 *  2001, Christoph Plattner
 * 
 *  Driver template was linux's serial.c
 *
 */

static char *pdc_drv_version = "0.3";
static char *pdc_drv_revdate = "2001-11-17";
#define AUTHOR "christoph.plattner@gmx.at"
#include <linux/config.h>
#include <linux/version.h>

#undef PDC_DRV_DEBUG

#undef SERIAL_PARANOIA_CHECK
#define CONFIG_SERIAL_NOPAUSE_IO
#define SERIAL_DO_RESTART

#define PDC_POLL_DELAY (30 * HZ / 1000)

/*
 * End of serial driver configuration section.
 */

#include <linux/module.h>

#include <linux/types.h>
#ifdef LOCAL_HEADERS
#include "serial_local.h"
#else
#include <linux/serial.h>
#include <linux/serialP.h>
#include <linux/serial_reg.h>
#include <asm/serial.h>
#define LOCAL_VERSTRING ""
#endif

#include <linux/errno.h>
#include <linux/signal.h>
#include <linux/sched.h>
#include <linux/timer.h>
#include <linux/interrupt.h>
#include <linux/tty.h>
#include <linux/tty_flip.h>
#include <linux/major.h>
#include <linux/string.h>
#include <linux/fcntl.h>
#include <linux/ptrace.h>
#include <linux/ioport.h>
#include <linux/mm.h>
#include <linux/slab.h>
#if (LINUX_VERSION_CODE >= 131343)
#include <linux/init.h>
#endif
#if (LINUX_VERSION_CODE >= 131336)
#include <asm/uaccess.h>
#endif
#include <linux/delay.h>

/*
 * All of the compatibilty code so we can compile serial.c against
 * older kernels is hidden in serial_compat.h
 */
#if defined(LOCAL_HEADERS) || (LINUX_VERSION_CODE < 0x020317) /* 2.3.23 */
#include "serial_compat.h"
#endif

#include <asm/system.h>
#include <asm/io.h>
#include <asm/irq.h>
#include <asm/bitops.h>

#ifdef CONFIG_GSC
#include <asm/gsc.h>
#endif

extern int pdc_console_poll_key(void *);
extern void pdc_outc(unsigned char);

#ifdef SERIAL_INLINE
#define _INLINE_ inline
#else
#define _INLINE_
#endif

static char *pdc_drv_name = "PDC driver";

static struct tty_driver pdc_drv_driver;
static int pdc_drv_refcount = 0;
static struct async_struct * pdc_drv_info;

static struct timer_list pdc_drv_timer;

/* serial subtype definitions */
#ifndef SERIAL_TYPE_NORMAL
#define SERIAL_TYPE_NORMAL	1
#define SERIAL_TYPE_CALLOUT	2
#endif

#define NR_PORTS 1
#define PDC_DUMMY_BUF 2048

static struct tty_struct *pdc_drv_table[NR_PORTS];
static struct termios *pdc_drv_termios[NR_PORTS];
static struct termios *pdc_drv_termios_locked[NR_PORTS];

/*
 * tmp_buf is used as a temporary buffer by serial_write.  We need to
 * lock it in case the copy_from_user blocks while swapping in a page,
 * and some other program tries to do a serial write at the same time.
 * Since the lock will only come under contention when the system is
 * swapping and available memory is low, it makes sense to share one
 * buffer across all the serial ports, since it significantly saves
 * memory if large numbers of serial ports are open.
 */
static unsigned char *tmp_buf;
#ifdef DECLARE_MUTEX
static DECLARE_MUTEX(tmp_buf_sem);
#else
static struct semaphore tmp_buf_sem = MUTEX;
#endif


/*
 * ------------------------------------------------------------
 * pdc_stop() and pdc_start()
 *
 * This routines are called before setting or resetting tty->stopped.
 * They enable or disable transmitter interrupts, as necessary.
 * ------------------------------------------------------------
 */
static void pdc_stop(struct tty_struct *tty)
{
}

static void pdc_start(struct tty_struct *tty)
{
}

/*
 * ----------------------------------------------------------------------
 *
 * Here starts the interrupt handling routines.  All of the following
 * subroutines are declared as inline and are folded into
 * rs_interrupt().  They were separated out for readability's sake.
 *
 * Note: rs_interrupt() is a "fast" interrupt, which means that it
 * runs with interrupts turned off.  People who may want to modify
 * rs_interrupt() should try to keep the interrupt handler as fast as
 * possible.  After you are done making modifications, it is not a bad
 * idea to do:
 * 
 * gcc -S -DKERNEL -Wall -Wstrict-prototypes -O6 -fomit-frame-pointer serial.c
 *
 * and look at the resulting assemble code in serial.s.
 *
 * 				- Ted Ts'o (tytso@mit.edu), 7-Mar-93
 * -----------------------------------------------------------------------
 */

static _INLINE_ void receive_chars(struct async_struct *info,
				 int *status, struct pt_regs * regs)
{
	struct tty_struct *tty = info->tty;
	unsigned char ch;
	int __ch;

	while (1) {
		__ch = pdc_console_poll_key (NULL);

		if (__ch == -1)   /* no character available */
		    break;

		ch = (unsigned char)((unsigned)__ch & 0x000000ffu);
		
		if (tty->flip.count >= TTY_FLIPBUF_SIZE)
			continue;

		*tty->flip.char_buf_ptr = ch;
		*tty->flip.flag_buf_ptr = 0;

		tty->flip.flag_buf_ptr++;
		tty->flip.char_buf_ptr++;
		tty->flip.count++;
	}

#if (LINUX_VERSION_CODE > 131394) /* 2.1.66 */
	tty_flip_buffer_push(tty);
#else
	queue_task_irq_off(&tty->flip.tqueue, &tq_timer);
#endif	
}

static void pdc_drv_poll (unsigned long dummy)
{
    struct async_struct * info;
    int status = 0;

    info = pdc_drv_info;
    
    if (!info || !info->tty || (pdc_drv_refcount == 0)) 
    {
	/* do nothing */
    }
    else
    {
	receive_chars(info, &status, NULL);
	info->last_active = jiffies;
    }

    mod_timer (& pdc_drv_timer, jiffies + PDC_POLL_DELAY);
}


static void pdc_put_char(struct tty_struct *tty, unsigned char ch)
{
#ifdef PDC_DRV_DEBUG
	printk (KERN_NOTICE "%s: %s: return\n");
#endif	
	pdc_outc (ch);
}

static void pdc_flush_chars(struct tty_struct *tty)
{
	/* PCD console always flushed all characters */

#ifdef PDC_DRV_DEBUG
	printk (KERN_NOTICE "%s: %s: return\n");
#endif	

	/* nothing to do */
}

static int pdc_write(struct tty_struct * tty, int from_user,
		    const unsigned char *buf, int count)
{
	char pdc_tmp_buf [PDC_DUMMY_BUF];
	char * pdc_tmp_buf_ptr;
	int len;
	int ret = 0;
				
#ifdef PDC_DRV_DEBUG
	printk (KERN_NOTICE "%s: %s: entry\n");
#endif	
	while (count) {
		if (count < PDC_DUMMY_BUF)
			len = count;
		else 
			len = PDC_DUMMY_BUF;
		
		if (from_user) {
			copy_from_user (pdc_tmp_buf, buf, len);
			pdc_tmp_buf_ptr = pdc_tmp_buf;
		}
		else
			pdc_tmp_buf_ptr = (char *) buf;
		
		while (len) {
			pdc_outc (*pdc_tmp_buf_ptr);
			buf++;
			pdc_tmp_buf_ptr++;
			ret++;
			count--;
			len--;
		}
	}
#ifdef PDC_DRV_DEBUG
	printk (KERN_NOTICE "%s: %s: return\n");
#endif	
	return ret;
}

static int pdc_write_room(struct tty_struct *tty)
{
#ifdef PDC_DRV_DEBUG
	printk (KERN_NOTICE "%s: %s: entry\n");
#endif	
	return PDC_DUMMY_BUF;
}

static int pdc_chars_in_buffer(struct tty_struct *tty)
{
#ifdef PDC_DRV_DEBUG
	printk (KERN_NOTICE "%s: %s: entry\n");
#endif	
	return 0; /* no characters in buffer, always flushed ! */
}

static void pdc_flush_buffer(struct tty_struct *tty)
{
#ifdef PDC_DRV_DEBUG
	printk (KERN_NOTICE "%s: %s: return\n");
#endif	
}

/*
 * This function is used to send a high-priority XON/XOFF character to
 * the device
 */
static void pdc_send_xchar(struct tty_struct *tty, char ch)
{
}

/*
 * ------------------------------------------------------------
 * pdc_throttle()
 * 
 * This routine is called by the upper-layer tty layer to signal that
 * incoming characters should be throttled.
 * ------------------------------------------------------------
 */
static void pdc_throttle(struct tty_struct * tty)
{
}

static void pdc_unthrottle(struct tty_struct * tty)
{
}

/*
 * ------------------------------------------------------------
 * pdc_ioctl() and friends
 * ------------------------------------------------------------
 */

static void pdc_break(struct tty_struct *tty, int break_state)
{
}


static int pdc_ioctl(struct tty_struct *tty, struct file * file,
		    unsigned int cmd, unsigned long arg)
{
	struct async_struct *info = (struct async_struct *)tty->driver_data;
	
	if ((cmd != TIOCGSERIAL) && (cmd != TIOCSSERIAL) &&
	    (cmd != TIOCSERCONFIG) && (cmd != TIOCSERGSTRUCT) &&
	    (cmd != TIOCMIWAIT) && (cmd != TIOCGICOUNT)) {
		if (tty->flags & (1 << TTY_IO_ERROR))
		    return -EIO;
	}
	
	switch (cmd) {
		case TIOCMGET:
			return 0;
		case TIOCMBIS:
		case TIOCMBIC:
		case TIOCMSET:
			return 0;
		case TIOCGSERIAL:
			return 0;
		case TIOCSSERIAL:
			return 0;
		case TIOCSERCONFIG:
			return 0;

		case TIOCSERGETLSR: /* Get line status register */
			return 0;

		case TIOCSERGSTRUCT:
			if (copy_to_user((struct async_struct *) arg,
					 info, sizeof(struct async_struct)))
				return -EFAULT;
			return 0;
				
		case TIOCMIWAIT:
			return 0;

		case TIOCGICOUNT:
			return 0;
		case TIOCSERGWILD:
		case TIOCSERSWILD:
			/* "setserial -W" is called in Debian boot */
			printk ("TIOCSER?WILD ioctl obsolete, ignored.\n");
			return 0;

		default:
			return -ENOIOCTLCMD;
		}
	return 0;
}

static void pdc_set_termios(struct tty_struct *tty, struct termios *old_termios)
{
	
#if 0	/* XXX CP, has to be checked, if there is stuff to do */
	struct async_struct *info = (struct async_struct *)tty->driver_data;
	unsigned long flags;
	unsigned int cflag = tty->termios->c_cflag;

	if (   (cflag == old_termios->c_cflag)
	    && (   RELEVANT_IFLAG(tty->termios->c_iflag) 
		== RELEVANT_IFLAG(old_termios->c_iflag)))
	  return;
#if 0
	change_speed(info, old_termios);
#endif
	/* Handle turning off CRTSCTS */
	if ((old_termios->c_cflag & CRTSCTS) &&
	    !(tty->termios->c_cflag & CRTSCTS)) {
		tty->hw_stopped = 0;
		pdc_start(tty);
	}
#endif
}

/*
 * ------------------------------------------------------------
 * pdc_close()
 * 
 * This routine is called when the serial port gets closed.  First, we
 * wait for the last remaining data to be sent.  Then, we unlink its
 * async structure from the interrupt chain if necessary, and we free
 * that IRQ if nothing is left in the chain.
 * ------------------------------------------------------------
 */
static void pdc_close(struct tty_struct *tty, struct file * filp)
{
	struct async_struct * info = (struct async_struct *)tty->driver_data;

#ifdef PDC_DEBUG_OPEN
	printk("pdc_close ttyB%d, count = %d\n", info->line, state->count);
#endif
	pdc_drv_refcount--;
	if (pdc_drv_refcount > 0)
	    return;
	
	info->flags |= ASYNC_CLOSING;

	/*
	 * Save the termios structure, since this port may have
	 * separate termios for callout and dialin.
	 */
	if (info->flags & ASYNC_NORMAL_ACTIVE)
		info->state->normal_termios = *tty->termios;
	if (info->flags & ASYNC_CALLOUT_ACTIVE)
		info->state->callout_termios = *tty->termios;

	/*
	 * At this point we stop accepting input.  To do this, we
	 * disable the receive line status interrupts, and tell the
	 * interrupt driver to stop checking the data ready bit in the
	 * line status register.
	 */

	/* XXX CP: make mask for receive !!! */

	if (tty->driver.flush_buffer)
		tty->driver.flush_buffer(tty);
	if (tty->ldisc.flush_buffer)
		tty->ldisc.flush_buffer(tty);
	tty->closing = 0;
	info->event = 0;
	info->tty = 0;
	pdc_drv_info = NULL;
	if (info->blocked_open) {
		if (info->close_delay) {
			set_current_state(TASK_INTERRUPTIBLE);
			schedule_timeout(info->close_delay);
		}
		wake_up_interruptible(&info->open_wait);
	}
	info->flags &= ~(ASYNC_NORMAL_ACTIVE|ASYNC_CALLOUT_ACTIVE|
			 ASYNC_CLOSING);
	wake_up_interruptible(&info->close_wait);
	MOD_DEC_USE_COUNT;
}

/*
 * pdc_wait_until_sent() --- wait until the transmitter is empty
 */
static void pdc_wait_until_sent(struct tty_struct *tty, int timeout)
{
	/* we always send immideate */
}

/*
 * pdc_hangup() --- called by tty_hangup() when a hangup is signaled.
 */
static void pdc_hangup(struct tty_struct *tty)
{
}

/*
 * ------------------------------------------------------------
 * pdc_open() and friends
 * ------------------------------------------------------------
 */

static int get_async_struct(int line, struct async_struct **ret_info)
{
	struct async_struct *info;
	
	info = kmalloc(sizeof(struct async_struct), GFP_KERNEL);
	if (!info) {
		return -ENOMEM;
	}
	memset(info, 0, sizeof(struct async_struct));
	init_waitqueue_head(&info->open_wait);
	init_waitqueue_head(&info->close_wait);
	init_waitqueue_head(&info->delta_msr_wait);
	info->magic = SERIAL_MAGIC;
	info->port = 0;
	info->flags = 0;
	info->io_type = 0;
	info->iomem_base = 0;
	info->iomem_reg_shift = 0;
	info->xmit_fifo_size = PDC_DUMMY_BUF;
	info->line = line;
	info->tqueue.routine = NULL;
	info->tqueue.data = info;
	info->state = NULL;
	*ret_info = info;
	return 0;
}

/*
 * This routine is called whenever a serial port is opened.  It
 * enables interrupts for a serial port, linking in its async structure into
 * the IRQ chain.   It also performs the serial-specific
 * initialization for the tty structure.
 */
static int pdc_open(struct tty_struct *tty, struct file * filp)
{
	struct async_struct	*info;
	int 			retval, line;
	unsigned long		page;
	
	MOD_INC_USE_COUNT;
	line = MINOR(tty->device) - tty->driver.minor_start;
	if ((line < 0) || (line >= NR_PORTS)) {
		MOD_DEC_USE_COUNT;
		return -ENODEV;
	}
	retval = get_async_struct(line, &info);
	if (retval) {
		MOD_DEC_USE_COUNT;
		return retval;
	}
	tty->driver_data = info;
	info->tty = tty;
	pdc_drv_info = info;
	
#ifdef PDC_DEBUG_OPEN
	printk("pdc_open %s%d, count = %d\n", tty->driver.name, info->line,
	       info->state->count);
#endif
#if (LINUX_VERSION_CODE > 0x20100)
	info->tty->low_latency = 0;
#endif

	if (!tmp_buf) {
		page = get_zeroed_page(GFP_KERNEL);
		if (!page) {
			MOD_DEC_USE_COUNT;
			return -ENOMEM;
		}
		if (tmp_buf)
			free_page(page);
		else
			tmp_buf = (unsigned char *) page;
	}

	info->session = current->session;
	info->pgrp = current->pgrp;

#ifdef PDC_DEBUG_OPEN
	printk("pdc_open ttyB%d successful...", info->line);
#endif
	pdc_drv_refcount++;
	return 0;
}

/*
 * ---------------------------------------------------------------------
 * pdc_init() and friends
 *
 * pdc_init() is called at boot-time to initialize the pdc driver.
 * ---------------------------------------------------------------------
 */

static _INLINE_ void show_pdc_drv_version(void)
{
 	printk(KERN_INFO "%s version %s%s (%s), %s\n", pdc_drv_name,
	       pdc_drv_version, LOCAL_VERSTRING, pdc_drv_revdate,
	       AUTHOR);
}

/*
 * The serial driver boot-time initialization code!
 */
static int __init pdc_drv_init(void)
{
	init_timer(&pdc_drv_timer);
	pdc_drv_timer.function = pdc_drv_poll;
	mod_timer(&pdc_drv_timer, jiffies + PDC_POLL_DELAY);

	show_pdc_drv_version();

	/* Initialize the tty_driver structure */
	
	memset(&pdc_drv_driver, 0, sizeof(struct tty_driver));
	pdc_drv_driver.magic = TTY_DRIVER_MAGIC;
#if (LINUX_VERSION_CODE > 0x20100)
	pdc_drv_driver.driver_name = "pdc_drv";
#endif
#if (LINUX_VERSION_CODE > 0x2032D && defined(CONFIG_DEVFS_FS))
	pdc_drv_driver.name = "ttb/%d";
#else
	pdc_drv_driver.name = "ttyB";
#endif
	pdc_drv_driver.major = PDCCONS_MAJOR;
	pdc_drv_driver.minor_start = 0;
	pdc_drv_driver.num = NR_PORTS;
	pdc_drv_driver.type = TTY_DRIVER_TYPE_SERIAL;
	pdc_drv_driver.subtype = SERIAL_TYPE_NORMAL;
	pdc_drv_driver.init_termios = tty_std_termios;
	pdc_drv_driver.init_termios.c_cflag =
		B9600 | CS8 | CREAD | HUPCL | CLOCAL;
	pdc_drv_driver.flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_NO_DEVFS;
	pdc_drv_driver.refcount = &pdc_drv_refcount;
	pdc_drv_driver.table = pdc_drv_table;
	pdc_drv_driver.termios = pdc_drv_termios;
	pdc_drv_driver.termios_locked = pdc_drv_termios_locked;

	pdc_drv_driver.open = pdc_open;
	pdc_drv_driver.close = pdc_close;
	pdc_drv_driver.write = pdc_write;
	pdc_drv_driver.put_char = pdc_put_char;
	pdc_drv_driver.flush_chars = pdc_flush_chars;
	pdc_drv_driver.write_room = pdc_write_room;
	pdc_drv_driver.chars_in_buffer = pdc_chars_in_buffer;
	pdc_drv_driver.flush_buffer = pdc_flush_buffer;
	pdc_drv_driver.ioctl = pdc_ioctl;
	pdc_drv_driver.throttle = pdc_throttle;
	pdc_drv_driver.unthrottle = pdc_unthrottle;
	pdc_drv_driver.set_termios = pdc_set_termios;
	pdc_drv_driver.stop = pdc_stop;
	pdc_drv_driver.start = pdc_start;
	pdc_drv_driver.hangup = pdc_hangup;
#if (LINUX_VERSION_CODE >= 131394) /* Linux 2.1.66 */
	pdc_drv_driver.break_ctl = pdc_break;
#endif
#if (LINUX_VERSION_CODE >= 131343)
	pdc_drv_driver.send_xchar = pdc_send_xchar;
	pdc_drv_driver.wait_until_sent = pdc_wait_until_sent;
	pdc_drv_driver.read_proc = NULL;
#endif
	
	if (tty_register_driver(&pdc_drv_driver))
		panic("Couldn't register pdc_drv driver\n");
	
	return 0;
}

static void __exit pdc_fini(void) 
{
	int e1;

	if ((e1 = tty_unregister_driver(&pdc_drv_driver)))
		printk("pdc_drv: failed to unregister pdc_drv driver (%d)\n",
		       e1);
}


module_init(pdc_drv_init);
module_exit(pdc_fini);
MODULE_DESCRIPTION("PDC driver");
MODULE_AUTHOR(AUTHOR);


--------------F2284F98E058B5E182FDCE75--
