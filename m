Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA20548
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 15:48:17 -0700
Received: from localhost (2748 bytes) by fileserv2.Cologne.DE
	via rmail with P:stdio/R:bind/T:smtp
	(sender: <excalibur.cologne.de!karsten>) (ident <excalibur.cologne.de!karsten> using unix)
	id <m14GU5s-0007E0C@fileserv2.Cologne.DE>
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Jan 2001 23:51:48 +0100 (CET)
	(Smail-3.2.0.101 1997-Dec-17 #5 built 1998-Jan-19)
Received: (from karsten@localhost)
	by excalibur.cologne.de (8.9.3/8.8.7) id WAA05410
	for parisc-linux@thepuffingroup.com; Wed, 10 Jan 2001 22:05:55 +0100
Date: Wed, 10 Jan 2001 22:05:55 +0100
From: Karsten Merker <karsten@excalibur.cologne.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: C110 - palinux-0.5.iso boot but...
Message-ID: <20010110220555.A3590@excalibur.cologne.de>
References: <A4A5E4C468B5D11190220001FA6835DD04DD87A8@EPIXCH003>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD87A8@EPIXCH003>; from JSO@EUROPAY.COM on Wed, Jan 10, 2001 at 11:43:23AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 10, 2001 at 11:43:23AM +0100, SOETE Joël wrote:

> Well no more success, I try again with several cvs release (last was dated
> 20010105) but still display some info on PDC console until "Switching from
> PDC console" then if I reconnect a console to the serial port I can login
> (same behavior for any model I can test C110, 712 or B180).

I have just tested a fresh cvs snapshot from today on a 712/80 - works out
of the box with STI-console (well, the problem with the pixel garbage is
still there, but in principle it works).

My PALO commandline is:
0/vmlinux HOME=/ TERM=linux root=/dev/nfs console=tty0

and the kernel is configured with:

#
# Character devices
#
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_GSC_PS2=y
CONFIG_HIL=y
CONFIG_SERIAL=y
# CONFIG_SERIAL_CONSOLE is not set
CONFIG_SERIAL_GSC=y
# CONFIG_SERIAL_EXTENDED is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256
CONFIG_PRINTER=y
# CONFIG_LP_CONSOLE is not set
# CONFIG_PPDEV is not set

[SNIP]

#
# Frame-buffer support
#
CONFIG_FB=y
CONFIG_DUMMY_CONSOLE=y
# CONFIG_FB_RIVA is not set
# CONFIG_FB_CLGEN is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_STI=y
# CONFIG_FB_MATROX is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FBCON_ADVANCED is not set
CONFIG_FBCON_STI=y
# CONFIG_FBCON_FONTWIDTH8_ONLY is not set
# CONFIG_FBCON_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_STI_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y

HTH,
Karsten
-- 
#include <standard_disclaimer>
Nach Paragraph 28 Abs. 3 Bundesdatenschutzgesetz widerspreche ich der Nutzung
oder Uebermittlung meiner Daten fuer Werbezwecke oder fuer die Markt- oder
Meinungsforschung.
