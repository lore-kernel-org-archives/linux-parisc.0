Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ginko.net (mail.ginko.net [212.202.63.50])
	by dsl2.external.hp.com (Postfix) with SMTP id 8616E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Jun 2001 12:47:11 -0600 (MDT)
Received: from tuxhausen.de (voyager.tuxhausen.de [192.168.44.20])
	by server.tuxhausen.de (Postfix) with ESMTP id D9B4A172F9
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Jun 2001 20:57:14 +0200 (CEST)
Sender: markus@tuxhausen.de
Message-ID: <3B378759.CBB5160E@tuxhausen.de>
Date: Mon, 25 Jun 2001 20:47:53 +0200
From: Markus Ungermann <m.ungermann@tuxhausen.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] 712/60: No login, only crashes
List-ID: <linux-parisc.vger.kernel.org>

Hi,

i get an HP 712/60 last week, it has an installed Debian and this works
good. But the HD is to little, only 520MB (with 128MB Swap).

Then i installed PA-Linux 0.9 on a 3.2GB-HD (Quantum Fireball 3200S ),
but after the first reboot:
- the system starts and 
- the Init-Process works, 
- it enter Runlevel 2
- then instead of a login i get an Crash
I get a Dump list (How can i print/copy this?) and the following line:

Kernel Fault Code 26 regs(differents everytime)


Ok, i use another HD 2.1GB (IBM DFRS ...) but, the same ....

I have Bootmon 1.2, i tries to update it (with a tape) but it didn't
work.

If fsck failed, and i must login as root, i have no Problems, it seens
to be an error with the login-script.

Can someone help me to login ?
Or how can i boot into single mode (there is no lilo ;-))) ?

Is the powersupply strong enough for a second intern HD (then i boot
from the 520MB und use the Quantum as /usr) ?


-- 
cu Markus Ungermann

       Look at my website: http://www.tuxhausen.de
                     !! Ask me for my PGP-Key !
		     
	`Software is like sex; it's best when it´s free´
		 ->> Linus B. Torvalds
