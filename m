Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 903AA4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 15:45:19 -0700 (MST)
Message-ID: <3A8C5BD4.7A0C5242@esiee.net>
Date: Thu, 15 Feb 2001 23:44:36 +0100
From: Xavier Debacker <xavier.debacker@esiee.net>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------D691CC0C99CB3804EC0D4D0C"
Subject: [parisc-linux] basic sti cursor patch
List-ID: <linux-parisc.vger.kernel.org>

Il s'agit d'un message multivolet au format MIME.
--------------D691CC0C99CB3804EC0D4D0C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Helge,

Here is a patch to get the cursor working on STI..
Of course it's not perfect, but already quite useful as is.
As you can see, this basic cursor is the character on the screen,
with some color attribute (black fg, white bg).

Now we can use vi & emacs, knowing where we are :-)

Xavier.
ESIEE Team.
http://www.esiee.fr/puffin

--------------D691CC0C99CB3804EC0D4D0C
Content-Type: text/plain; charset=us-ascii;
 name="cursor.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cursor.patch"

diff -rNu linux-cvs/drivers/video/sti/sticon.c linux-cursor/drivers/video/sti/sticon.c
--- linux-cvs/drivers/video/sti/sticon.c	Fri Feb  9 02:42:28 2001
+++ linux-cursor/drivers/video/sti/sticon.c	Thu Feb 15 23:27:53 2001
@@ -94,7 +94,26 @@
 
 static void sticon_cursor(struct vc_data *conp, int mode)
 {
-}
+	unsigned short car1;
+	car1 = conp->vc_screenbuf[conp->vc_x+conp->vc_y*conp->vc_cols];
+	switch (mode) {
+		case CM_ERASE:
+			sti_putc(&default_sti,car1,conp->vc_y,conp->vc_x);
+			break;
+		case CM_MOVE:
+		case CM_DRAW:
+			switch (conp->vc_cursor_type & 0x0f) {
+				case CUR_UNDERLINE:
+				case CUR_LOWER_THIRD:
+				case CUR_LOWER_HALF:
+				case CUR_TWO_THIRDS: 
+				case CUR_BLOCK: 
+					sti_putc(&default_sti,(car1&255)+(0<<8)+(7<<11),conp->vc_y,conp->vc_x);
+					break;
+			}
+			break;
+	}
+}       
 
 static int sticon_scroll(struct vc_data *conp, int t, int b, int dir,
 			int count)

--------------D691CC0C99CB3804EC0D4D0C--
