Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96A57482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Apr 2001 23:00:32 -0600 (MDT)
Message-ID: <3AEA4E6E.A990140B@esiee.net>
Date: Sat, 28 Apr 2001 07:00:30 +0200
From: Xavier Debacker <xavier.debacker@esiee.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Cc: puffin@esiee.net
Content-Type: multipart/mixed;
 boundary="------------B342E7BDACB673DADEE119F5"
Subject: [parisc-linux] Keyboard driver patch proposal
List-ID: <linux-parisc.vger.kernel.org>

Il s'agit d'un message multivolet au format MIME.
--------------B342E7BDACB673DADEE119F5
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all!

The extended keys should now work properly with the correct SC_LIM
value, which was set to 59
but is in fact 0x59 ;-)

The error was due to escape (e0, e1 and others) keycodes that weren't
transmitted to the pc_keyb.c's handle_scancode function.
and escaped keys that weren't translated (explains the K_NONE errors).

So handle_at_scancode has been rewritten, the patch file is joined to
this mail.

It works fine on my B132.

I hope this is committable ;-)

Xavier Debacker
ESIEE Team
http://www.esiee.fr/puffin

--------------B342E7BDACB673DADEE119F5
Content-Type: text/plain; charset=us-ascii;
 name="patch20010428"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch20010428"

--- drivers/char/hp_keyb.c	Mon Mar 26 02:43:45 2001
+++ drivers/char/hp_keyb.c	Sat Apr 28 06:44:03 2001
@@ -7,8 +7,11 @@
  * 2000/10/26	Debacker Xavier (debackex@esiee.fr)
  *		Marteau Thomas (marteaut@esiee.fr)
  *		Djoudi Malek (djoudim@esiee.fr)
- * fixed some keysym defines and SC_LIM
- */
+ * fixed some keysym defines 
+ *
+ * 2001/04/28	Debacker Xavier 
+ * scancode translation rewritten (handle_at_scancode).
+ */  
 
 #include <linux/config.h>
 #include <linux/sched.h>
@@ -179,7 +182,7 @@
 /* 60 */  K_NONE, K_HASH, K_NONE, K_NONE, K_NONE, K_NONE, K_BKSP, K_NONE,
 /* 68 */  K_NONE, KP_1  , K_NONE, KP_4  , KP_7  , K_NONE, K_NONE, K_NONE,
 /* 70 */  KP_0  , KP_DOT, KP_2  , KP_5  , KP_6  , KP_8  , K_ESC , K_NUML,
-/* 78 */  K_F11 , KP_PLS, KP_3  , KP_MNS, KP_STR, KP_9  , K_SCRL, K_NONE,
+/* 78 */  K_F11 , KP_PLS, KP_3  , KP_MNS, KP_STR, KP_9  , K_SCRL, K_PRNT,
  	  K_NONE, K_NONE, K_NONE, K_F7  , K_NONE, K_NONE, K_NONE, K_NONE,
 	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE,
 	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE,
@@ -193,7 +196,9 @@
 	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE,
 	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE,
 	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE,
-	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE
+	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE,
+	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE,
+	  K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, K_NONE, KBD_RESEND, K_NONE
 };
 
 /* ----- the following code stolen from pc_keyb.c */
@@ -246,7 +251,7 @@
  * they needed not before. It does not matter that there are duplicates, as
  * long as no duplication occurs for any single keyboard.
  */
-#define SC_LIM 59
+#define SC_LIM 89
 
 #define FOCUS_PF1 85           /* actual code! */
 #define FOCUS_PF2 89
@@ -435,6 +440,7 @@
 	  }
  	} else
 	  *keycode = scancode;
+	
  	return 1;
 }
 
@@ -445,75 +451,70 @@
 { 
 }
 
-static inline void ps2kbd_key(unsigned int keycode, unsigned int up_flag)
-{
-	handle_scancode(keycode, !up_flag);
-}
-
-static unsigned char status;
-static unsigned char ncodes;
-static unsigned char bi;
-static unsigned char buffer[4];
-
 void handle_at_scancode(int keyval)
 {
-	int keysym;
-
-	if (keyval > 0x83) {
-		switch (keyval) {
-			case KBD_ESCAPEE0:
-				ncodes = 2;
-				bi = 0;
-				break;
-			case KBD_ESCAPEE1:
-				ncodes = 3;
-				bi = 0;
-				break;
-			case KBD_BREAK:
-				status |= CODE_BREAK;
-			default:
-				return;
-		}
-	}
-
-	if (ncodes) {
-		buffer[bi++] = keyval;
-		ncodes -= 1;
-		if (ncodes)
+	static int brk = 0;
+	static int esc0 = 0;
+	static int esc1 = 0;
+	int scancode = 0;
+	
+	switch (keyval) {
+		case KBD_BREAK :  
+			// sets the "release_key" bit
+			// when a key is released
+			// HP keyboard send f0 followed by the keycode
+			// while AT keyboard send the keycode with
+			// this bit set.
+			brk = 0x80;
 			return;
-		keysym = K_NONE;
-		switch (buffer[0] << 8 | buffer[1]) {
-		case ESCE0(0x11): keysym = K_RALT; break;
-		case ESCE0(0x14): keysym = K_RCTL; break;
-		case ESCE0(0x4a): keysym = KP_SLH; break;
-		case ESCE0(0x5a): keysym = KP_ENT; break;
-		case ESCE0(0x69): keysym = K_END;  break;
-		case ESCE0(0x6b): keysym = K_LEFT; break;
-		case ESCE0(0x6c): keysym = K_HOME; break;
-		case ESCE0(0x70): keysym = K_INS;  break;
-		case ESCE0(0x71): keysym = K_DEL;  break;
-		case ESCE0(0x72): keysym = K_DOWN; break;
-		case ESCE0(0x74): keysym = K_RGHT; break;
-		case ESCE0(0x75): keysym = K_UP;   break;
-		case ESCE0(0x7a): keysym = K_PGDN; break;
-		case ESCE0(0x7c): keysym = K_PRNT; break;
-		case ESCE0(0x7d): keysym = K_PGUP; break;
-		case ESCE1(0x14):
-			if (buffer[2] == 0x77)
-				keysym = K_BRK;
+		case KBD_ESCAPEE0 :
+			// 2chars sequence, commonly used
+			// to differenciate the two ALT keys
+			// and the two ENTER keys and so on...
+			esc0 = 2; // e0-xx are 2 chars
+			scancode = keyval;
+			break;
+		case KBD_ESCAPEE1 :  
+			// 3chars sequence, only used by the Pause key.
+			esc1 = 3; // e1-xx-xx are 3 chars
+			scancode = keyval;
+			break;
+//		case KBD_RESEND :
+//			// dunno what to do when it happens
+//			// Request For Comments
+//			printk("\n KBD_RESEND received ");
+//			return;
+		case 0x14 : 
+			//translate e1-14-77-e1-f0-14-f0-77 to 
+			// e1-1d-45-e1-9d-c5 (this is the Pause key)
+			if (esc1==2) scancode = brk | 0x1d;
+			break;
+		case 0x77 :
+			if (esc1==1) scancode = brk | 0x45;
+			break;
+		case 0x12 :
+			//an extended key is e0-12-e0-xx e0-f0-xx-e0-f0-12
+			//on HP, while it is e0-2a-e0-xx e0-(xx|80)-f0-aa
+			//on AT.
+			if (esc0==1) scancode = brk | 0x2a;
 			break;
-		case ESCE0(0x12):		/* ignore escaped shift key */
-			status = 0;
-			return;
-		}
-	} else {
-		bi = 0;
-		keysym = keycode_translate[keyval];
 	}
+	
 
-	if (keysym != K_NONE)
-		ps2kbd_key(keysym, status & CODE_BREAK);
-	else
-		printk("%s: K_NONE for %d\n", __FUNCTION__, keyval);
-	status = 0;
+	// translates HP scancodes to AT scancodes
+	if (!scancode) scancode = brk | keycode_translate[keyval];
+
+
+	if (!scancode) printk("\nunexpected key code %02x ",keyval);
+
+	//now behave like an AT keyboard
+	handle_scancode(scancode,!(scancode&0x80));
+
+	if (esc0) esc0--;
+	if (esc1) esc1--;
+//	printk("0x%02x ",scancode);
+//	if (!esc0 && !esc1 && brk) printk("\n");
+
+	// release key bit must be unset for the next key.
+	brk=0;
 }

--------------B342E7BDACB673DADEE119F5--
