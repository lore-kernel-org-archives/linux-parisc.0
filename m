Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA31859
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 14:01:34 -0600
Received: from pc5158b (pc5158b.esiee.fr [147.215.50.168])
	by mail.esiee.fr (Postfix) with SMTP id 1483257303
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Oct 2000 22:03:04 +0200 (CEST)
Message-ID: <002a01c03f88$0a20d580$a832d793@esiee.fr>
From: "Thomas Marteau" <marteaut@esiee.fr>
To: <parisc-linux@thepuffingroup.com>
Date: Thu, 26 Oct 2000 22:05:08 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0027_01C03F98.CD6E2320"
Subject: [parisc-linux] The new PS/2 Keyboard Driver
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0027_01C03F98.CD6E2320
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


Hello everyone,

We've just updated the PS/2 keyboard driver. The leds and interrupt
functions work really well on a 712 workstation and also B132 now. The
updated driver files are available on our website. It works better than
under HP UX for the B 132 ;->

http://www.esiee.fr/~djoudim

The ESIEE Port Team in Paris.

Here is the patch:

diff -urN linux/drivers/char/gsc_ps2.c linux-parisc/drivers/char/gsc_ps2.c
--- linux/drivers/char/gsc_ps2.c Thu Oct 26 21:06:54 2000
+++ linux-parisc/drivers/char/gsc_ps2.c Thu Oct 26 21:34:00 2000
@@ -7,6 +7,11 @@
  *
  * Okay, the filename is somewhat suboptimal.  It turns out this
  *  will work for Dino's psaux ports as well.
+ *
+ * 2000/10/26 Debacker Xavier (debackex@esiee.fr)
+ *   Marteau Thomas (marteaut@esiee.fr)
+ *    Djoudi Malek (djoudim@esiee.fr)
+ * fixed leds control
  */

 #include <asm/hardware.h>
@@ -198,7 +203,7 @@

 static void lasi_kbd_interrupt(int irq, void *dev, struct pt_regs *regs)
 {
- void *hpa = dev;
+ hpa = dev;

  kbd_pt_regs = regs;

@@ -233,6 +238,7 @@
 static struct kbd_ops gsc_ps2_kbd_ops = {
  translate: pckbd_translate,
  init_hw: gsc_ps2_init_hw,
+ leds:  ps2kbd_leds,
  sysrq_key: 0x54,
  sysrq_xlate: pckbd_sysrq_xlate,
 };
diff -urN linux/drivers/char/keyb_at.c linux-parisc/drivers/char/keyb_at.c
--- linux/drivers/char/keyb_at.c Thu Oct 26 21:07:00 2000
+++ linux-parisc/drivers/char/keyb_at.c Thu Oct 26 21:23:16 2000
@@ -47,7 +47,12 @@
 #define CODE_ESCAPE12 8

 #define K_NONE  0x7f
-
+/*
+ * 2000/10/26 Debacker Xavier (debackex@esiee.fr)
+ *  Marteau Thomas (marteaut@esiee.fr)
+ *  Djoudi Malek (djoudim@esiee.fr)
+ * fixed some keysym defines and SC_LIM
+ */
 #define K_ESC  0x01
 #define K_F1  0x3b
 #define K_F2  0x3c
@@ -79,8 +84,8 @@
 #define K_EQLS  0x0d
 #define K_BKSP  0x0e
 #define K_INS  110
-#define K_HOME  K_NONE
-#define K_PGUP  K_NONE
+#define K_HOME  102
+#define K_PGUP  104
 #define K_NUML  69
 #define KP_SLH  0x62
 #define KP_STR  0x37
@@ -99,9 +104,9 @@
 #define K_LSBK  0x1a
 #define K_RSBK  0x1b
 #define K_ENTR  0x1c
-#define K_DEL  0xe
-#define K_END  K_NONE
-#define K_PGDN  K_NONE
+#define K_DEL  111
+#define K_END  107
+#define K_PGDN  109
 #define KP_7  0x47
 #define KP_8  0x48
 #define KP_9  0x49
@@ -234,7 +239,7 @@
  * they needed not before. It does not matter that there are duplicates, as
  * long as no duplication occurs for any single keyboard.
  */
-#define SC_LIM 89
+#define SC_LIM 128

 #define FOCUS_PF1 85           /* actual code! */
 #define FOCUS_PF2 89


------=_NextPart_000_0027_01C03F98.CD6E2320
Content-Type: application/octet-stream;
	name="keyb.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="keyb.patch"

diff -urN linux/drivers/char/gsc_ps2.c =
linux-parisc/drivers/char/gsc_ps2.c=0A=
--- linux/drivers/char/gsc_ps2.c	Thu Oct 26 21:06:54 2000=0A=
+++ linux-parisc/drivers/char/gsc_ps2.c	Thu Oct 26 21:34:00 2000=0A=
@@ -7,6 +7,11 @@=0A=
  *=0A=
  *	Okay, the filename is somewhat suboptimal.  It turns out this=0A=
  * 	will work for Dino's psaux ports as well.=0A=
+ *=0A=
+ *	2000/10/26	Debacker Xavier (debackex@esiee.fr)=0A=
+ *			Marteau Thomas (marteaut@esiee.fr)=0A=
+ * 			Djoudi Malek (djoudim@esiee.fr)=0A=
+ *	fixed leds control=0A=
  */=0A=
 =0A=
 #include <asm/hardware.h>=0A=
@@ -198,7 +203,7 @@=0A=
 =0A=
 static void lasi_kbd_interrupt(int irq, void *dev, struct pt_regs *regs)=0A=
 {=0A=
-	void *hpa =3D dev;=0A=
+	hpa =3D dev;=0A=
 =0A=
 	kbd_pt_regs =3D regs;=0A=
 =0A=
@@ -233,6 +238,7 @@=0A=
 static struct kbd_ops gsc_ps2_kbd_ops =3D {=0A=
 	translate:	pckbd_translate,=0A=
 	init_hw:	gsc_ps2_init_hw,=0A=
+	leds:		ps2kbd_leds,=0A=
 	sysrq_key:	0x54,=0A=
 	sysrq_xlate:	pckbd_sysrq_xlate,=0A=
 };=0A=
diff -urN linux/drivers/char/keyb_at.c =
linux-parisc/drivers/char/keyb_at.c=0A=
--- linux/drivers/char/keyb_at.c	Thu Oct 26 21:07:00 2000=0A=
+++ linux-parisc/drivers/char/keyb_at.c	Thu Oct 26 21:23:16 2000=0A=
@@ -47,7 +47,12 @@=0A=
 #define CODE_ESCAPE12	8=0A=
 =0A=
 #define K_NONE		0x7f=0A=
-=0A=
+/*=0A=
+ * 2000/10/26	Debacker Xavier (debackex@esiee.fr)=0A=
+ *		Marteau Thomas (marteaut@esiee.fr)=0A=
+ *		Djoudi Malek (djoudim@esiee.fr)=0A=
+ * fixed some keysym defines and SC_LIM=0A=
+ */=0A=
 #define K_ESC		0x01=0A=
 #define K_F1		0x3b=0A=
 #define K_F2		0x3c=0A=
@@ -79,8 +84,8 @@=0A=
 #define K_EQLS		0x0d=0A=
 #define K_BKSP		0x0e=0A=
 #define K_INS		110=0A=
-#define K_HOME		K_NONE=0A=
-#define K_PGUP		K_NONE=0A=
+#define K_HOME		102=0A=
+#define K_PGUP		104=0A=
 #define K_NUML		69=0A=
 #define KP_SLH		0x62=0A=
 #define KP_STR		0x37=0A=
@@ -99,9 +104,9 @@=0A=
 #define K_LSBK		0x1a=0A=
 #define K_RSBK		0x1b=0A=
 #define K_ENTR		0x1c=0A=
-#define K_DEL		0xe=0A=
-#define K_END		K_NONE=0A=
-#define K_PGDN		K_NONE=0A=
+#define K_DEL		111=0A=
+#define K_END		107=0A=
+#define K_PGDN		109=0A=
 #define KP_7		0x47=0A=
 #define KP_8		0x48=0A=
 #define KP_9		0x49=0A=
@@ -234,7 +239,7 @@=0A=
  * they needed not before. It does not matter that there are =
duplicates, as=0A=
  * long as no duplication occurs for any single keyboard.=0A=
  */=0A=
-#define SC_LIM 89=0A=
+#define SC_LIM 128=0A=
 =0A=
 #define FOCUS_PF1 85           /* actual code! */=0A=
 #define FOCUS_PF2 89=0A=

------=_NextPart_000_0027_01C03F98.CD6E2320--
