Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14088482A
	for <parisc-linux@parisc-linux.org>; Tue,  7 Aug 2001 01:24:17 -0600 (MDT)
Received: from esiee.fr (pc211j.esiee.fr [147.215.80.169])
	by mail.esiee.fr (Postfix) with ESMTP id 7651BD15DA
	for <parisc-linux@parisc-linux.org>; Tue,  7 Aug 2001 09:24:04 +0200 (CEST)
Sender: marteaut@esiee.fr
Message-ID: <3B6F986D.FA89E147@esiee.fr>
Date: Tue, 07 Aug 2001 09:27:41 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------4B071F3141DE6CF374BA41D0"
Subject: [parisc-linux] The final patch for the keyboard problem
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------4B071F3141DE6CF374BA41D0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

	It is my last patch solving the keyboard problem on BXXX and CXXX. It
should correct most of them but I would like to have feedback before I
check the bug report. I must also add that this patch is not yet tested
with Matthew Wilcox's version, according to his mail (
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-August/013302.html
). I will do it as soon as possible.

Regards, Thomas.
ESIEE Team
--------------4B071F3141DE6CF374BA41D0
Content-Type: text/plain; charset=us-ascii;
 name="keyboard.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="keyboard.patch"

diff -Nru linux/drivers/char/hp_psaux.c linux.new/drivers/char/hp_psaux.c
--- linux/drivers/char/hp_psaux.c	Wed Aug  1 00:11:04 2001
+++ linux.new/drivers/char/hp_psaux.c	Tue Aug  7 09:10:39 2001
@@ -42,6 +42,7 @@
 
 /* HP specific LASI PS/2 keyboard and psaux constants */
 #define	AUX_REPLY_ACK	0xFA	/* Command byte ACK. */
+#define	AUX_RESEND	0xFE	/* Sent by the keyb. Asking for resending the last command. */
 #define	AUX_RECONNECT	0xAA	/* scancode when ps2 device is plugged (back) in */
 
 #define	LASI_PSAUX_OFFSET 0x0100 /* offset from keyboard to psaux port */
@@ -70,8 +71,7 @@
 #define LASI_STAT_CLKSHD 0x80
 
 static void *lasikbd_hpa;
-static void *lasips2_hpa;
-
+static int cmd_status;
 
 static inline u8 read_input(void *hpa)
 {
@@ -105,9 +105,10 @@
 		}
 	}
 
+#if 0
 	if (wait)
 		printk(KERN_DEBUG "Lasi PS/2 wait %d\n", wait);
-	
+#endif
 	gsc_writeb(val, hpa+LASI_XMTDATA);
 
 	return 1;
@@ -122,9 +123,23 @@
 
 static void lasikbd_leds(unsigned char leds)
 {
-	write_output(KBD_CMD_SET_LEDS, lasikbd_hpa);
-	write_output(leds, lasikbd_hpa);
-	write_output(KBD_CMD_ENABLE, lasikbd_hpa);
+	cmd_status=2;
+	while (cmd_status!=0) {
+		write_output(KBD_CMD_SET_LEDS, lasikbd_hpa);
+		mdelay(1); 
+	}
+   
+	cmd_status=2;
+	while (cmd_status!=0) {
+		write_output(leds, lasikbd_hpa);
+		mdelay(1);
+	}
+
+	cmd_status=2;
+	while (cmd_status!=0) {
+	   write_output(KBD_CMD_ENABLE, lasikbd_hpa);   
+	   mdelay(1);
+	}
 }
 
 #if 0
@@ -154,10 +169,56 @@
 }
 #endif 
 
-static int __init lasi_ps2_reset(void *hpa, int id)
+static int init_keyb(void* hpa)
+{
+	int fail;
+	u8 data;
+	
+	
+	do {
+		while ((read_status(hpa) & LASI_STAT_TBNE)==0x01);
+		gsc_writeb(KBD_CMD_SET_LEDS, hpa+LASI_XMTDATA);
+		
+		while ((read_status(hpa) & LASI_STAT_RBNE)==0x00);
+		
+		while ((read_status(hpa) & LASI_STAT_RBNE)==0x01) data=read_input(hpa);      
+	}while(data!=AUX_REPLY_ACK); 
+	
+	fail=0;
+	
+	do {
+		while ((read_status(hpa) & LASI_STAT_TBNE)==0x01);
+		gsc_writeb(0x00, hpa+LASI_XMTDATA);
+		
+		while ((read_status(hpa) & LASI_STAT_RBNE)==0x00);
+   
+		while ((read_status(hpa) & LASI_STAT_RBNE)==0x01) {
+			data=read_input(hpa);
+			fail++; 
+			if(fail==10) break; 
+		}
+   	}while(data!=AUX_REPLY_ACK); 
+
+	fail=0;
+	do {   
+		while ((read_status(hpa) & LASI_STAT_TBNE)==0x01);
+		gsc_writeb(KBD_CMD_ENABLE, hpa+LASI_XMTDATA);
+      
+		while ((read_status(hpa) & LASI_STAT_RBNE)==0x00);
+		while ((read_status(hpa) & LASI_STAT_RBNE)==0x01) {
+			data=read_input(hpa);
+			fail++; 
+			if(fail==10) break; 
+		}
+
+	}while(data!=AUX_REPLY_ACK); 
+   
+	return 1;
+}
+
+static void __init lasi_ps2_reset(void *hpa)
 {
 	u8 control;
-	int ret = 1;
 
 	/* reset the interface */
 	gsc_writeb(0xff, hpa+LASI_RESET);
@@ -166,25 +227,8 @@
 	/* enable it */
 	control = read_control(hpa);
 	write_control(control | LASI_CTRL_ENBL, hpa);
-
-        /* initializes the leds at the default state */
-        if (id==0) {
-           write_output(KBD_CMD_SET_LEDS, hpa);
-	   write_output(0, hpa);
-	   ret = write_output(KBD_CMD_ENABLE, hpa);
-	}
-
-	return ret;
 }
 
-static int inited;
-
-static void lasi_ps2_init_hw(void)
-{
-	++inited;
-}
-
-
 /* Greatly inspired by pc_keyb.c */
 
 /*
@@ -362,7 +406,7 @@
 	lock_kernel();
 	fasync_aux(-1, file, 0);
 	if (--aux_count) {
-	   unlock_kernel();
+		unlock_kernel();
 		return 0;
 	}
 	unlock_kernel();
@@ -398,62 +442,60 @@
         id = gsc_readb(hpa+LASI_ID) & 0x0f;
         
         if (id==1) 
-           hpa -= LASI_PSAUX_OFFSET; 
-        lasikbd_hpa = hpa;
-        
-
+		hpa -= LASI_PSAUX_OFFSET; 
+	
         status_keyb = read_status(hpa);
         status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
 
         while ((status_keyb|status_mouse) & LASI_STAT_RBNE){
            
-           while (status_keyb & LASI_STAT_RBNE) {
+		while (status_keyb & LASI_STAT_RBNE) {
 	      
-              scancode = read_input(hpa);
+		scancode = read_input(hpa);
 
-	      /* XXX don't know if this is a valid fix, but filtering
-	       * 0xfa avoids 'unknown scancode' errors on, eg, capslock
-	       * on some keyboards.
-	       */
-	      if (inited && scancode != 0xfa)
-		 handle_at_scancode(scancode); 
+	        /* XXX don't know if this is a valid fix, but filtering
+	         * 0xfa avoids 'unknown scancode' errors on, eg, capslock
+	         * on some keyboards.
+	         */
+	      	      
+		if (scancode == AUX_REPLY_ACK) 
+			cmd_status=0;
+			
+		else if (scancode == AUX_RESEND)
+			cmd_status=1;
+		else 
+			handle_at_scancode(scancode); 
 	      
-	      status_keyb =read_status(hpa);
-           }
+		status_keyb =read_status(hpa);
+		}
 	   
 #ifdef CONFIG_PSMOUSE
-           while (status_mouse & LASI_STAT_RBNE) {
-	      scancode = read_input(hpa+LASI_PSAUX_OFFSET);
-	      handle_mouse_scancode(scancode);
-              status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
-	   }
-           status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
+		while (status_mouse & LASI_STAT_RBNE) {
+			scancode = read_input(hpa+LASI_PSAUX_OFFSET);
+			handle_mouse_scancode(scancode);
+			status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
+		}
+		status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
 #endif /* CONFIG_PSMOUSE */
-           status_keyb = read_status(hpa);
+		status_keyb = read_status(hpa);
         }
 
         tasklet_schedule(&keyboard_tasklet);
         return (status_keyb|status_mouse);
 }
-
-
-
 	
 extern struct pt_regs *kbd_pt_regs;
 
 static void lasikbd_interrupt(int irq, void *dev, struct pt_regs *regs)
 {
-	lasips2_hpa = dev; /* save "hpa" for lasikbd_leds() */
 	kbd_pt_regs = regs;
-	handle_lasikbd_event(lasips2_hpa);
+	handle_lasikbd_event(dev);
 }
 
-
 extern int pckbd_translate(unsigned char, unsigned char *, char);
 
 static struct kbd_ops gsc_ps2_kbd_ops = {
 	translate:	pckbd_translate,
-	init_hw:	lasi_ps2_init_hw,
 	leds:		lasikbd_leds,
 #ifdef CONFIG_MAGIC_SYSRQ
 	sysrq_key:	0x54,
@@ -487,20 +529,11 @@
 	}
 	
 	/* reset the PS/2 port */
-	device_found = lasi_ps2_reset(hpa,id);
-
-	/* allocate the irq and memory region for that device */
-	if (!(irq = busdevice_alloc_irq(d)))
-		return -ENODEV;
-		    
-	if (request_irq(irq, lasikbd_interrupt, 0, name, hpa))
-		return -ENODEV;
-	
-	if (!request_mem_region((unsigned long)hpa, LASI_STATUS + 4, name))
-		return -ENODEV;
+	lasi_ps2_reset(hpa);
 
 	switch (id) {
 	case 0:	
+	        device_found = init_keyb(hpa);
 		register_kbd_ops(&gsc_ps2_kbd_ops);
 		break;
 	case 1:
@@ -526,6 +559,18 @@
 #endif
 	} /* of case */
 	
+        /* allocate the irq and memory region for that device */
+	if (!(irq = busdevice_alloc_irq(d)))
+		return -ENODEV;
+		    
+	if (request_irq(irq, lasikbd_interrupt, 0, name, hpa))
+		return -ENODEV;
+	
+	if (!request_mem_region((unsigned long)hpa, LASI_STATUS + 4, name))
+		return -ENODEV;
+
+
+
 	printk(KERN_INFO "PS/2 %s controller at 0x%08lx (irq %d) found, "
 			 "%sdevice attached.\n",
 			name, (unsigned long)hpa, irq,
@@ -548,4 +593,3 @@
 }
 
 module_init(gsc_ps2_init);
-

--------------4B071F3141DE6CF374BA41D0--
