Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DF3B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Jun 2001 13:46:52 -0600 (MDT)
Date: Mon, 25 Jun 2001 21:46:50 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: Markus Ungermann <m.ungermann@tuxhausen.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 712/60: No login, only crashes
In-Reply-To: <3B378759.CBB5160E@tuxhausen.de>
Message-ID: <Pine.LNX.4.33.0106252137470.8292-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Markus!

On Mon, 25 Jun 2001, Markus Ungermann wrote:

> Then i installed PA-Linux 0.9 on a 3.2GB-HD (Quantum Fireball 3200S ),
> but after the first reboot:
> - the system starts and
> - the Init-Process works,
> - it enter Runlevel 2
> - then instead of a login i get an Crash
> I get a Dump list (How can i print/copy this?) and the following line:
>
> Kernel Fault Code 26 regs(differents everytime)

I had the same error when I installed it, I think it is in the known
bugs on the webpage. The developers told me to be patient, those are
bugs in the graphical STI interface.

A perhaps related problem is that if you try to go down further than
the end of the file in vi, it crashes with a similar dump screen.

> Can someone help me to login ?
> Or how can i boot into single mode (there is no lilo ;-))) ?

- Press <escape> before booting.
- search for the boot device:
	search scsi
- start the ipl:
	boot <scsi-dev> ipl
- edit the last parameter and add with a space:
	" init=1" or " init=/bin/sh"
Starting the IPL boot should get you booted. You should then perhaps
edit /etc/inittab before trying further.

Can anyone tell me, which script in /etc/init.d starts the virtual
consoles? It's none from the ones in /etc/rc1.d/...

> Is the powersupply strong enough for a second intern HD (then i boot
> from the 520MB und use the Quantum as /usr) ?

Just try it? There is a special room for a second disk in my
machine, which I cannot use because the other disks I have get too
hot.

Gruesse,
	Peter.
