Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA21811
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 04:23:58 -0700
Received: from localhost (2049 bytes) by fileserv2.Cologne.DE
	via rmail with P:stdio/R:bind/T:smtp
	(sender: <excalibur.cologne.de!karsten>) (ident <excalibur.cologne.de!karsten> using unix)
	id <m147bxj-0007A8C@fileserv2.Cologne.DE>
	for <parisc-linux@thepuffingroup.com>; Sun, 17 Dec 2000 12:26:43 +0100 (CET)
	(Smail-3.2.0.101 1997-Dec-17 #5 built 1998-Jan-19)
Message-ID: <20001217115105.A17378@excalibur.cologne.de>
Date: Sun, 17 Dec 2000 11:51:05 +0100
From: Karsten Merker <karsten@excalibur.cologne.de>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] configuration problems with cvs from 20001216 15:40 CET
List-ID: <linux-parisc.vger.kernel.org>

Hallo everybody,

I experience a problem with the kernel cvs checkout from dec 16, 15:40
CET. I am trying to build a kernel with support for STICON, but for some
reason CONFIG_FBCON_STI does not get set when doing a "make menuconfig",
although it should get set.

I chose 

"Character Devices -> Support for console on virtual terminal"
"Console Drivers -> Frame-buffer support -> Generic STI frame buffer
                                            device support"
"Console Drivers -> STI console"

This results in a .config containing

CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_FB_STI=y
CONFIG_STI_CONSOLE=y

but CONFIG_FBCON_STI, which is needed to get drivers/video/fbcon-sti.c
compiled and linked, ist not declared, although this should be done by
drivers/video/Config.in which contains the following code:

      if [ "$CONFIG_FB_STI" = "y" ]; then
         define_tristate CONFIG_FBCON_STI y
      fi

$CONFIG_FB_STI is set to "y" as can be seen in .config, nonetheless
CONFIG_FBCON_STI is not declared. I have been looking for the reason for
this behaviour, but have not found a solution. Probably I am missing
something dead simple, does anybody have an idea?

Greetings,
Karsten
-- 
#include <standard_disclaimer>
Nach Paragraph 28 Abs. 3 Bundesdatenschutzgesetz widerspreche ich der
Nutzung oder Uebermittlung meiner Daten fuer Werbezwecke oder fuer die
Markt- oder Meinungsforschung.
