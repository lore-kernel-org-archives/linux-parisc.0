Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA9D4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 07:26:53 -0600 (MDT)
To: marteaut@esiee.fr, rhirst@linuxcare.com, willy@debian.org
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <OFF20A0000.EE7BF1AA-ONC1256ABE.00498F17@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Wed, 5 Sep 2001 15:30:03 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Thomas Marteau kbd patch adapted.(2)
List-ID: <linux-parisc.vger.kernel.org>

Sorry for previous unreadable patch text.
Here is what I hope to be clearer.

--- hp_psaux.c.orig Tue Aug 28 12:02:32 2001
+++ hp_psaux.c Wed Sep  5 10:51:44 2001
@@ -43,6 +43,7 @@

 /* HP specific LASI PS/2 keyboard and psaux constants */
 #define  AUX_REPLY_ACK  0xFA /* Command byte ACK. */
+#define  AUX_RESEND     0xFE /* Sent by the keyb. Asking for resending the
last command. */
 #define  AUX_RECONNECT  0xAA /* scancode when ps2 device is plugged (back)
in */

 #define  LASI_PSAUX_OFFSET 0x0100 /* offset from keyboard to psaux port */
@@ -71,8 +72,7 @@
 #define LASI_STAT_CLKSHD 0x80

 static unsigned long lasikbd_hpa;
-static unsigned long lasips2_hpa;
-
+static int cmd_status;

 static inline u8 read_input(unsigned long hpa)
 {
@@ -106,9 +106,10 @@
          }
     }

+#if 0
     if (wait)
          printk(KERN_DEBUG "Lasi PS/2 wait %d\n", wait);
-
+#endif
     gsc_writeb(val, hpa+LASI_XMTDATA);

     return 1;
@@ -123,14 +124,28 @@

 static void lasikbd_leds(unsigned char leds)
 {
-    write_output(KBD_CMD_SET_LEDS, lasikbd_hpa);
-    write_output(leds, lasikbd_hpa);
-    write_output(KBD_CMD_ENABLE, lasikbd_hpa);
+       cmd_status=2;
+       while (cmd_status!=0) {
+               write_output(KBD_CMD_SET_LEDS, lasikbd_hpa);
+               mdelay(5);
+       }
+
+       cmd_status=2;
+       while (cmd_status!=0) {
+               write_output(leds, lasikbd_hpa);
+               mdelay(5);
+       }
+
+       cmd_status=2;
+       while (cmd_status!=0) {
+          write_output(KBD_CMD_ENABLE, lasikbd_hpa);
+          mdelay(5);
+       }
 }

 #if 0
 /* this might become useful again at some point.  not now  -prumpf */
-int lasi_ps2_test(void *hpa)
+int lasi_ps2_test(unsigned long hpa)
 {
     u8 control,c;
     int i, ret = 0;
@@ -155,10 +170,56 @@
 }
 #endif

-static int __init lasi_ps2_reset(unsigned long hpa, int id)
+static int init_keyb(unsigned long hpa)
+{
+       int fail;
+       u8 data=0;
+
+
+       do {
+               while ((read_status(hpa) & LASI_STAT_TBNE));
+               gsc_writeb(KBD_CMD_SET_LEDS, hpa+LASI_XMTDATA);
+
+               while (!(read_status(hpa) & LASI_STAT_RBNE));
+
+               while ((read_status(hpa) & LASI_STAT_RBNE))
data=read_input(hpa);
+       }while(data!=AUX_REPLY_ACK);
+
+       fail=0;
+
+       do {
+               while ((read_status(hpa) & LASI_STAT_TBNE));
+               gsc_writeb(0x00, hpa+LASI_XMTDATA);
+
+               while (!(read_status(hpa) & LASI_STAT_RBNE));
+
+               while ((read_status(hpa) & LASI_STAT_RBNE)) {
+                       data=read_input(hpa);
+                       fail++;
+                       if(fail==10) break;
+               }
+       }while(data!=AUX_REPLY_ACK);
+
+       fail=0;
+       do {
+               while ((read_status(hpa) & LASI_STAT_TBNE));
+               gsc_writeb(KBD_CMD_ENABLE, hpa+LASI_XMTDATA);
+
+               while (!(read_status(hpa) & LASI_STAT_RBNE));
+               while ((read_status(hpa) & LASI_STAT_RBNE)) {
+                       data=read_input(hpa);
+                       fail++;
+                       if(fail==10) break;
+               }
+
+       }while(data!=AUX_REPLY_ACK);
+
+       return 1;
+}
+
+static void __init lasi_ps2_reset(unsigned long hpa)
 {
     u8 control;
-    int ret = 1;

     /* reset the interface */
     gsc_writeb(0xff, hpa+LASI_RESET);
@@ -167,22 +228,6 @@
     /* enable it */
     control = read_control(hpa);
     write_control(control | LASI_CTRL_ENBL, hpa);
-
-        /* initializes the leds at the default state */
-        if (id==0) {
-           write_output(KBD_CMD_SET_LEDS, hpa);
-       write_output(0, hpa);
-       ret = write_output(KBD_CMD_ENABLE, hpa);
-    }
-
-    return ret;
-}
-
-static int inited;
-
-static void lasi_ps2_init_hw(void)
-{
-    ++inited;
 }


@@ -363,7 +408,7 @@
     lock_kernel();
     fasync_aux(-1, file, 0);
     if (--aux_count) {
-       unlock_kernel();
+         unlock_kernel();
          return 0;
     }
     unlock_kernel();
@@ -399,62 +444,60 @@
         id = gsc_readb(hpa+LASI_ID) & 0x0f;

         if (id==1)
-           hpa -= LASI_PSAUX_OFFSET;
-        lasikbd_hpa = hpa;
-
+         hpa -= LASI_PSAUX_OFFSET;

         status_keyb = read_status(hpa);
         status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);

         while ((status_keyb|status_mouse) & LASI_STAT_RBNE){

-           while (status_keyb & LASI_STAT_RBNE) {
+         while (status_keyb & LASI_STAT_RBNE) {

-              scancode = read_input(hpa);
+         scancode = read_input(hpa);

-          /* XXX don't know if this is a valid fix, but filtering
-           * 0xfa avoids 'unknown scancode' errors on, eg, capslock
-           * on some keyboards.
-           */
-          if (inited && scancode != 0xfa)
-          handle_at_scancode(scancode);
+               /* XXX don't know if this is a valid fix, but filtering
+                * 0xfa avoids 'unknown scancode' errors on, eg, capslock
+                * on some keyboards.
+                */
+
+         if (scancode == AUX_REPLY_ACK)
+              cmd_status=0;
+
+         else if (scancode == AUX_RESEND)
+              cmd_status=1;
+         else
+              handle_at_scancode(scancode);

-          status_keyb =read_status(hpa);
-           }
+         status_keyb =read_status(hpa);
+         }

 #ifdef CONFIG_PSMOUSE
-           while (status_mouse & LASI_STAT_RBNE) {
-          scancode = read_input(hpa+LASI_PSAUX_OFFSET);
-          handle_mouse_scancode(scancode);
-              status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
-       }
-           status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
+         while (status_mouse & LASI_STAT_RBNE) {
+              scancode = read_input(hpa+LASI_PSAUX_OFFSET);
+              handle_mouse_scancode(scancode);
+              status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
+         }
+         status_mouse = read_status(hpa+LASI_PSAUX_OFFSET);
 #endif /* CONFIG_PSMOUSE */
-           status_keyb = read_status(hpa);
+         status_keyb = read_status(hpa);
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
-    lasips2_hpa = (unsigned long) dev; /* save "hpa" for lasikbd_leds() */
     kbd_pt_regs = regs;
-    handle_lasikbd_event(lasips2_hpa);
+    handle_lasikbd_event(dev);
 }

-
 extern int pckbd_translate(unsigned char, unsigned char *, char);

 static struct kbd_ops gsc_ps2_kbd_ops = {
     translate:     pckbd_translate,
-    init_hw:  lasi_ps2_init_hw,
     leds:          lasikbd_leds,
 #ifdef CONFIG_MAGIC_SYSRQ
     sysrq_key:     0x54,
@@ -468,7 +511,7 @@
     unsigned long hpa = dev->hpa;
     unsigned int irq;
     char *name;
-    int device_found;
+    int device_found=0;
     u8 id;

     id = gsc_readb(hpa+LASI_ID) & 0x0f;
@@ -488,20 +531,10 @@
     }

     /* reset the PS/2 port */
-    device_found = lasi_ps2_reset(hpa,id);
-
-    /* allocate the irq and memory region for that device */
-    if (!(irq = busdevice_alloc_irq(dev)))
-         return -ENODEV;
-
-    if (request_irq(irq, lasikbd_interrupt, 0, name, (void *)hpa))
-         return -ENODEV;
-
-    if (!request_mem_region(hpa, LASI_STATUS + 4, name))
-         return -ENODEV;
-
+    lasi_ps2_reset(hpa);
     switch (id) {
     case 0:
+         device_found = init_keyb(hpa);
          register_kbd_ops(&gsc_ps2_kbd_ops);
          break;
     case 1:
@@ -527,6 +560,17 @@
 #endif
     } /* of case */

+        /* allocate the irq and memory region for that device */
+    if (!(irq = busdevice_alloc_irq(dev)))
+         return -ENODEV;
+
+    if (request_irq(irq, lasikbd_interrupt, 0, name, (void *)hpa))
+         return -ENODEV;
+
+    if (!request_mem_region((unsigned long)hpa, LASI_STATUS + 4, name))
+         return -ENODEV;
+
+
     printk(KERN_INFO "PS/2 %s port at 0x%08lx (irq %d) found, "
                "%sdevice attached.\n",
               name, hpa, irq, device_found ? "":"no ");



**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
