From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] No "#/'" and "<>|" keys with german HIL-keyboard
Date: Sun, 31 Oct 2004 15:27:02 +0100
Message-ID: <200410311527.03160.deller@gmx.de>
References: <200410311421.17271.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_3YPhBnlonV9ycss"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410311421.17271.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_3YPhBnlonV9ycss
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Hi Johannes,

On Sunday 31 October 2004 14:21, Johannes Raspe wrote:
> after successfully moving to kernel 2.6.x-series with great help from Helge 
> Deller I'd like to report a problem wich is also present in 2.4.x-kernels:
> with my german HIL-keyboerd on a 735/125 the keys for "#/'" (between left 
> shift-key and the "y"-key) and "<>|" (between Return and the german "ä"-key) 
> give absolutely no response to the OS.
> I tried "showkey" on a text-console and nothing happens when pressing these 
> two keys. Every other key gives an output.

please apply the following patch and send me the documented console-output for the corresponding keys.

Helge

--Boundary-00=_3YPhBnlonV9ycss
Content-Type: text/plain;
  charset="iso-8859-1";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="diff"

? drivers/input/keyboard/Kconfig.org
? drivers/input/keyboard/Makefile.org
? drivers/input/keyboard/atkbd.c.org
? drivers/input/keyboard/hilkbd.c.org
? drivers/input/keyboard/hpps2atkbd.h.org
Index: drivers/input/keyboard/hil_kbd.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/keyboard/hil_kbd.c,v
retrieving revision 1.11
diff -u -p -r1.11 hil_kbd.c
--- drivers/input/keyboard/hil_kbd.c	27 Oct 2004 20:17:18 -0000	1.11
+++ drivers/input/keyboard/hil_kbd.c	31 Oct 2004 14:22:17 -0000
@@ -140,14 +140,18 @@ static void hil_kbd_process_record(struc
 	case HIL_POL_CHARTYPE_NONE:
 		break;
 	case HIL_POL_CHARTYPE_ASCII:
-		while (cnt < idx - 1)
+		while (cnt < idx - 1) {
+			printk("HIL_POL_CHARTYPE_ASCII: %d\n", kbd->data[cnt]);
 			input_report_key(dev, kbd->data[cnt++] & 0x7f, 1);
+		}
 		break;
 	case HIL_POL_CHARTYPE_RSVD1:
 	case HIL_POL_CHARTYPE_RSVD2:
 	case HIL_POL_CHARTYPE_BINARY:
-		while (cnt < idx - 1)
+		while (cnt < idx - 1) {
+			printk("HIL_POL_CHARTYPE_BINARY: %d\n", kbd->data[cnt]);
 			input_report_key(dev, kbd->data[cnt++], 1);
+		}
 		break;
 	case HIL_POL_CHARTYPE_SET1:
 		while (cnt < idx - 1) {
@@ -156,6 +160,7 @@ static void hil_kbd_process_record(struc
 			key = kbd->data[cnt++];
 			up = key & HIL_KBD_SET1_UPBIT;
 			key &= (~HIL_KBD_SET1_UPBIT & 0xff);
+			printk("HIL_POL_CHARTYPE_SET1: %d  up:%d\n", key>>HIL_KBD_SET1_SHIFT, up);
 			key = hil_kbd_set1[key >> HIL_KBD_SET1_SHIFT];
 			if (key != KEY_RESERVED)
 				input_report_key(dev, key, !up);
@@ -168,6 +173,7 @@ static void hil_kbd_process_record(struc
 			key = kbd->data[cnt++];
 			up = key & HIL_KBD_SET2_UPBIT;
 			key &= (~HIL_KBD_SET1_UPBIT & 0xff);
+			printk("HIL_POL_CHARTYPE_SET2: %d  up:%d\n", key>>HIL_KBD_SET2_SHIFT, up);
 			key = key >> HIL_KBD_SET2_SHIFT;
 			if (key != KEY_RESERVED)
 				input_report_key(dev, key, !up);
@@ -180,6 +186,7 @@ static void hil_kbd_process_record(struc
 			key = kbd->data[cnt++];
 			up = key & HIL_KBD_SET3_UPBIT;
 			key &= (~HIL_KBD_SET1_UPBIT & 0xff);
+			printk("HIL_POL_CHARTYPE_SET3: %d  up:%d\n", key>>HIL_KBD_SET3_SHIFT, up);
 			key = hil_kbd_set3[key >> HIL_KBD_SET3_SHIFT];
 			if (key != KEY_RESERVED)
 				input_report_key(dev, key, !up);

--Boundary-00=_3YPhBnlonV9ycss
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_3YPhBnlonV9ycss--
