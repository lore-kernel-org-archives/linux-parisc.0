From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] State of the kernel
Date: Mon, 14 Mar 2005 19:40:18 +0000
Message-ID: <20050314194018.GX21986@parcelfarce.linux.theplanet.co.uk>
References: <20050314181215.GV21986@parcelfarce.linux.theplanet.co.uk> <200503142023.49252.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>
Return-Path: <willy@www.linux.org.uk>
In-Reply-To: <200503142023.49252.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Mar 14, 2005 at 08:23:48PM +0100, Helge Deller wrote:
> Hi Matthew,
> 
> Thanks a lot for this great work !

No problem!  Could you review this outstanding patch for me ... it looks
like mostly notes to yourself.

diff -urpNX dontdiff linux-2.6.11-bk10/drivers/input/keyboard/atkbd.c parisc-2.6-bk/drivers/input/keyboard/atkbd.c
--- linux-2.6.11-bk10/drivers/input/keyboard/atkbd.c	2005-03-14 06:43:56.115276274 -0700
+++ parisc-2.6-bk/drivers/input/keyboard/atkbd.c	2005-03-14 07:07:27.000000000 -0700
@@ -262,8 +262,8 @@ static irqreturn_t atkbd_interrupt(struc
 	int scroll = 0, hscroll = 0, click = -1;
 	int value;
 
-#ifdef ATKBD_DEBUG
-	printk(KERN_DEBUG "atkbd.c: Received %02x flags %02x\n", data, flags);
+#if 0 || defined(ATKBD_DEBUG)   /* CHANGEME */
+	printk(KERN_ERR "atkbd.c: Received %02x flags %02x\n", data, flags);
 #endif
 
 #if !defined(__i386__) && !defined (__x86_64__)
@@ -402,6 +402,9 @@ static irqreturn_t atkbd_interrupt(struc
 					break;
 			}
 
+#if 0  /* CHANGEME */
+			printk(KERN_ERR "Reporting: %#x, emul=%d\n", code, atkbd->emul);
+#endif
 			atkbd_report_key(&atkbd->dev, regs, atkbd->keycode[code], value);
 	}
 
@@ -516,7 +519,12 @@ static int atkbd_probe(struct atkbd *atk
  * controller may confuse the keyboard need a full reset of the keyboard. On
  * these systems the BIOS also usually doesn't do it for us.
  */
