From: Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [parisc-linux] Re: [PATCH] missing exports
Date: Sat, 10 Jul 2004 18:36:30 +0200
Message-ID: <1089477389.2474.129.camel@kars.perseus.home>
References: <1067288209.3591.1.camel@kars.perseus.home>
	 <Pine.GSO.4.58.0407101107240.10242@waterleaf.sonytel.be>
	 <20040710130529.GP5889@parcelfarce.linux.theplanet.co.uk>
	 <200407101555.18830.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Matthew Wilcox <willy@debian.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux/m68k kernel mailing list <linux-m68k@lists.linux-m68k.org>,
 parisc-linux@parisc-linux.org
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200407101555.18830.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 2004-07-10 at 15:55, Helge Deller wrote:
> On Saturday 10 July 2004 15:05, Matthew Wilcox wrote:
> > On Sat, Jul 10, 2004 at 11:09:34AM +0200, Geert Uytterhoeven wrote:
> > > > worry about merging with the PARISC people later?
> > > 
> > > What about posting the patches to the Linux/m68k and Linux/PA-RISC lists?
> > 
> > That'd be great.  More shared code!
> > It's also good incentive for us to get this stuff merged upstream.
> > Helge, you said you'd take care of this... what's the current status?
> 
> Last time I tried the HIL stuff for 2.6 was still in bad shape.
> It worked unreliable and all the locking due to the timing issues still increases the generic load of the machine.

Yes, I noticed that...

It seems to be worse than 2.4 though. On my HP9000/425t the keyboard
sometimes locks up for a while and then starts reacting again. The mouse
gets detected but doesn't seem to generate any events on
/dev/input/mice.

> Our code in kernel 2.4 has similiar problems, but this I think we can live with.
> 
> Anyway, I would be happy to see any patches and merge them upstream.

OK, here they are. Nothing to fix the reliability issues though, I'm
affraid.

I needed remove the __exit marker from hp_sdc_exit() because the linker
didn't like it being called from hp_sdc_register():

drivers/built-in.o: In function `hp_sdc_register':
drivers/built-in.o(.init.text+0x396e): undefined reference to `local symbols in discarded section .exit.text'

I don't really know what that means, seems like it doesn't like calling
an __exit function from an __init function.

ChangeLog:

drivers/input/keyboard/hil_kbd.c:
	Check for KEY_RESERVED _after_ translation.

include/linux/hp_sdc.h
drivers/input/serio/hp_sdc.c
	Add support for HP9000/[34]00 series.


Kind regards,

Kars.

diff -ur /tmp/parisc/drivers/input/keyboard/hil_kbd.c /usr/src/linux-2.6-m68k-hp/drivers/input/keyboard/hil_kbd.c
--- /tmp/parisc/drivers/input/keyboard/hil_kbd.c	Sat Jul 10 15:47:52 2004
+++ /usr/src/linux-2.6-m68k-hp/drivers/input/keyboard/hil_kbd.c	Sun Jun 27 13:26:21 2004
@@ -156,9 +156,9 @@
 			key = kbd->data[cnt++];
 			up = key & HIL_KBD_SET1_UPBIT;
 			key &= (~HIL_KBD_SET1_UPBIT & 0xff);
-			key = key >> HIL_KBD_SET1_SHIFT;
+			key = hil_kbd_set1[key >> HIL_KBD_SET1_SHIFT];
 			if (key != KEY_RESERVED)
-				input_report_key(dev, hil_kbd_set1[key], !up);
+				input_report_key(dev, key, !up);
 		}
 		break;
 	case HIL_POL_CHARTYPE_SET2:
@@ -180,9 +180,9 @@
 			key = kbd->data[cnt++];
 			up = key & HIL_KBD_SET3_UPBIT;
 			key &= (~HIL_KBD_SET1_UPBIT & 0xff);
-			key = key >> HIL_KBD_SET3_SHIFT;
+			key = hil_kbd_set3[key >> HIL_KBD_SET3_SHIFT];
 			if (key != KEY_RESERVED)
-				input_report_key(dev, hil_kbd_set3[key], !up);
+				input_report_key(dev, key, !up);
 		}
 		break;
 	}
diff -ur /tmp/parisc/drivers/input/serio/hp_sdc.c /usr/src/linux-2.6-m68k-hp/drivers/input/serio/hp_sdc.c
--- /tmp/parisc/drivers/input/serio/hp_sdc.c	Sat Jul 10 15:47:56 2004
+++ /usr/src/linux-2.6-m68k-hp/drivers/input/serio/hp_sdc.c	Sat Jul 10 18:22:19 2004
@@ -72,7 +72,20 @@
 #include <linux/hil.h>
 #include <asm/io.h>
 #include <asm/system.h>
-#include <asm/parisc-device.h>
+
+/* Machine-specific abstraction */
+
+#if defined(__hppa__)
+# include <asm/parisc-device.h>
+# define sdc_readb(p)		gsc_readb(p)
+# define sdc_writeb(v,p)	gsc_writeb((v),(p))
+#elif defined(__mc68000__)
+# include <asm/uaccess.h>
+# define sdc_readb(p)		in_8(p)
+# define sdc_writeb(v,p)	out_8((p),(v))
+#else
+# error "HIL is not supported on this platform"
+#endif
 
 #define PREFIX "HP SDC: "
 
@@ -99,7 +112,7 @@
 	unsigned long flags;
 
 	write_lock_irqsave(&hp_sdc.ibf_lock, flags);
-	status = gsc_readb(hp_sdc.status_io);
+	status = sdc_readb(hp_sdc.status_io);
 	if (!(status & HP_SDC_STATUS_IBF)) hp_sdc.ibf = 0;
 	write_unlock_irqrestore(&hp_sdc.ibf_lock, flags);
 
@@ -107,7 +120,7 @@
 }
 
 static inline uint8_t hp_sdc_data_in8 (void) {
-	return gsc_readb(hp_sdc.data_io); 
+	return sdc_readb(hp_sdc.data_io); 
 }
 
 static inline void hp_sdc_status_out8 (uint8_t val) {
@@ -116,7 +129,7 @@
 	write_lock_irqsave(&hp_sdc.ibf_lock, flags);
 	hp_sdc.ibf = 1;
 	if ((val & 0xf0) == 0xe0) hp_sdc.wi = 0xff;
-	gsc_writeb(val, hp_sdc.status_io);
+	sdc_writeb(val, hp_sdc.status_io);
 	write_unlock_irqrestore(&hp_sdc.ibf_lock, flags);
 }
 
@@ -125,7 +138,7 @@
 
 	write_lock_irqsave(&hp_sdc.ibf_lock, flags);
 	hp_sdc.ibf = 1;
-	gsc_writeb(val, hp_sdc.data_io);
+	sdc_writeb(val, hp_sdc.data_io);
 	write_unlock_irqrestore(&hp_sdc.ibf_lock, flags);
 }
 
@@ -146,7 +159,7 @@
 	}
 	read_unlock(lock);
 	write_lock(lock);
-	while (gsc_readb(hp_sdc.status_io) & HP_SDC_STATUS_IBF) {};
+	while (sdc_readb(hp_sdc.status_io) & HP_SDC_STATUS_IBF) {};
 	hp_sdc.ibf = 0;
 	write_unlock_irqrestore(lock, flags);
 }
@@ -636,6 +649,7 @@
 
 	hp_sdc.hil = callback;
 	hp_sdc.im &= ~HP_SDC_IM_HIL;
+	hp_sdc.im &= ~HP_SDC_IM_RESET;
 	hp_sdc.set_im = 1;
 	write_unlock_irq(&hp_sdc.hook_lock);
 
@@ -661,6 +675,7 @@
 	/* Enable interrupts from the HIL MLC */
 	hp_sdc.cooked = callback;
 	hp_sdc.im &= ~HP_SDC_IM_HIL;
+	hp_sdc.im &= ~HP_SDC_IM_RESET;
 	hp_sdc.set_im = 1;
 	write_unlock_irq(&hp_sdc.hook_lock);
 
@@ -705,6 +720,7 @@
 	/* Disable interrupts from HIL only if there is no cooked driver. */
 	if(hp_sdc.cooked == NULL) {
 		hp_sdc.im |= HP_SDC_IM_HIL;
+		hp_sdc.im |= HP_SDC_IM_RESET;
 		hp_sdc.set_im = 1;
 	}
 	write_unlock_irq(&hp_sdc.hook_lock);
@@ -727,6 +743,7 @@
 	/* Disable interrupts from HIL only if there is no raw HIL driver. */
 	if(hp_sdc.hil == NULL) {
 		hp_sdc.im |= HP_SDC_IM_HIL;
+		hp_sdc.im |= HP_SDC_IM_RESET;
 		hp_sdc.set_im = 1;
 	}
 	write_unlock_irq(&hp_sdc.hook_lock);
@@ -746,6 +763,8 @@
 
 /************************** Module Initialization ***************************/
 
+#if defined(__hppa__)
+
 static struct parisc_device_id hp_sdc_tbl[] = {
 	{
 		.hw_type =	HPHW_FIO, 
@@ -758,15 +777,17 @@
 
 MODULE_DEVICE_TABLE(parisc, hp_sdc_tbl);
 
-static int __init hp_sdc_init(struct parisc_device *d);
+static int __init hp_sdc_init_hppa(struct parisc_device *d);
 
 static struct parisc_driver hp_sdc_driver = {
 	.name =		"HP SDC",
 	.id_table =	hp_sdc_tbl,
-	.probe =	hp_sdc_init,
+	.probe =	hp_sdc_init_hppa,
 };
 
-static int __init hp_sdc_init(struct parisc_device *d)
+#endif /* __hppa__ */
+
+static int __init hp_sdc_init(void)
 {
 	int i;
 	char *errstr = NULL;
@@ -774,20 +795,8 @@
 	uint8_t ts_sync[6];
 	struct semaphore s_sync;
 
-
 	errstr = "foo\n";
 
-	if (!d) return 1;
-	if (hp_sdc.dev != NULL) return 1;	/* We only expect one SDC */
-
-	hp_sdc.dev = d;
-	hp_sdc.irq		= d->irq;
-	/* TODO: Is NMI == IRQ - 1 all cases, or is there a way to query? */
-	hp_sdc.nmi		= d->irq - 1;
-	hp_sdc.base_io		= (unsigned long) d->hpa;
-	hp_sdc.data_io		= (unsigned long) d->hpa + 0x800;
-	hp_sdc.status_io	= (unsigned long) d->hpa + 0x801;
-
   	hp_sdc.lock		= RW_LOCK_UNLOCKED;
   	hp_sdc.ibf_lock		= RW_LOCK_UNLOCKED;
   	hp_sdc.rtq_lock		= RW_LOCK_UNLOCKED;
@@ -822,6 +831,7 @@
 	hp_sdc.dev_err = -EBUSY;
 
 	errstr = "IO not available for";
+#if defined(__hppa__)
         if (request_region(hp_sdc.data_io, 2, hp_sdc_driver.name)) goto err0;
 
 	errstr = "IRQ not available for";
@@ -829,8 +839,19 @@
 		       (void *) hp_sdc.base_io)) goto err1;
 
 	errstr = "NMI not available for";
+
         if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, 0, "HP SDC NMI", 
 			(void*)d->hpa)) goto err2;
+#elif defined(__mc68000__)
+	errstr = "IRQ not available for";
+        if(request_irq(hp_sdc.irq, &hp_sdc_isr, 0, "HP SDC", 
+		       (void *) hp_sdc.base_io)) goto err1;
+
+	errstr = "NMI not available for";
+	
+	if (request_irq(hp_sdc.nmi, &hp_sdc_nmisr, 0, "HP SDC NMI", 
+			(void *) hp_sdc.base_io)) goto err2;
+#endif	
 
 	printk(KERN_INFO PREFIX "HP SDC at 0x%p, IRQ %d (NMI IRQ %d)\n", 
 	       (void *)hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
@@ -872,13 +893,37 @@
 	return hp_sdc.dev_err;
 }
 
+#if defined(__hppa__)
+
+static int __init hp_sdc_init_hppa(struct parisc_device *d)
+{
+	if (!d) return 1;
+	if (hp_sdc.dev != NULL) return 1;	/* We only expect one SDC */
+
+	hp_sdc.dev = d;
+	hp_sdc.irq		= d->irq;
+	/* TODO: Is NMI == IRQ - 1 all cases, or is there a way to query? */
+	hp_sdc.nmi		= d->irq - 1;
+	hp_sdc.base_io		= (unsigned long) d->hpa;
+	hp_sdc.data_io		= (unsigned long) d->hpa + 0x800;
+	hp_sdc.status_io	= (unsigned long) d->hpa + 0x801;
+
+	return hp_sdc_init();
+}
+
+#endif /* __hppa__ */
+
+#if !defined(__mc68000__) /* Link error on m68k! */
 static void __exit hp_sdc_exit(void)
+#else
+static void hp_sdc_exit(void)
+#endif
 {
 	write_lock_irq(&hp_sdc.lock);
 
 	/* Turn off all maskable "sub-function" irq's. */
 	hp_sdc_spin_ibf();
-	gsc_writeb(HP_SDC_CMD_SET_IM | HP_SDC_IM_MASK, hp_sdc.status_io);
+	sdc_writeb(HP_SDC_CMD_SET_IM | HP_SDC_IM_MASK, hp_sdc.status_io);
 
 	/* Wait until we know this has been processed by the i8042 */
 	hp_sdc_spin_ibf();
@@ -893,22 +938,45 @@
 
 /*        release_region(hp_sdc.data_io, 2); */
 
+#if defined(__hppa__)
 	if (unregister_parisc_driver(&hp_sdc_driver)) 
 		printk(KERN_WARNING PREFIX "Error unregistering HP SDC");
+#endif
 }
 
 static int __init hp_sdc_register(void)
 {
-	hp_sdc.dev = NULL;
-	hp_sdc.dev_err = 0;
 	hp_sdc_transaction tq_init;
 	uint8_t tq_init_seq[5];
 	struct semaphore tq_init_sem;
-
+#if defined(__mc68000__)
+	mm_segment_t fs;
+	unsigned char i;
+#endif
+	
+	hp_sdc.dev = NULL;
+	hp_sdc.dev_err = 0;
+#if defined(__hppa__)
 	if (register_parisc_driver(&hp_sdc_driver)) {
 		printk(KERN_WARNING PREFIX "Error registering SDC with system bus tree.\n");
 		return -ENODEV;
 	}
+#elif defined(__mc68000__)
+	if (!MACH_IS_HP300)
+	    return -ENODEV;
+
+	hp_sdc.irq	 = 1;
+	hp_sdc.nmi	 = 7;
+	hp_sdc.base_io	 = (unsigned long) 0xf0428000;
+	hp_sdc.data_io	 = (unsigned long) hp_sdc.base_io + 1;
+	hp_sdc.status_io = (unsigned long) hp_sdc.base_io + 3;
+	fs = get_fs();
+	set_fs(KERNEL_DS);
+	if (!get_user(i, (unsigned char *)hp_sdc.data_io))
+		hp_sdc.dev = (void *)1;
+	set_fs(fs);
+	hp_sdc.dev_err   = hp_sdc_init();
+#endif
 	if (hp_sdc.dev == NULL) {
 		printk(KERN_WARNING PREFIX "No SDC found.\n");
 		return hp_sdc.dev_err;
diff -ur /tmp/parisc/include/linux/hp_sdc.h /usr/src/linux-2.6-m68k-hp/include/linux/hp_sdc.h
--- /tmp/parisc/include/linux/hp_sdc.h	Sat Jul 10 15:47:56 2004
+++ /usr/src/linux-2.6-m68k-hp/include/linux/hp_sdc.h	Thu Jun 24 21:51:11 2004
@@ -42,7 +42,9 @@
 #include <linux/types.h>
 #include <linux/time.h>
 #include <linux/timer.h>
+#if defined(__hppa__)
 #include <asm/hardware.h>
+#endif
 
 
 /* No 4X status reads take longer than this (in usec).
@@ -284,6 +286,9 @@
 #ifdef __hppa__
 	struct parisc_device	*dev;
 	int		dev_err;	/* carries status from registration */
+#elif defined(__mc68000__)
+	void		*dev;
+	int		dev_err;	/* carries status from registration */	
 #else
 #error No support for device registration on this arch yet.
 #endif
