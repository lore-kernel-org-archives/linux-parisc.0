Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0485482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Jun 2001 01:07:51 -0600 (MDT)
Sender: christoph.plattner@alcatel.at
Message-ID: <3B3834C1.2C1ED48E@alcatel.at>
Date: Tue, 26 Jun 2001 09:07:45 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: Markus Ungermann <m.ungermann@tuxhausen.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60: No login, only crashes
References: <Pine.LNX.4.33.0106252137470.8292-100000@leo.uni-sw.gwdg.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

There is no script starting the virtual console, it is kernel stuff.
But you can remove the login (any thing like "*getty") in the bottom of
the inittab, but then you will not have any login !!

The devices /dev/tty1 up to /dev/tty9 (I think) are the virtual
consoles.
The only way to use the full machine without virtual consoles is the
use of the serial console !
The kernel line must say "console=ttyS0" and in the inittab the "*getty"
should have ttyS0 as paramter ....

With friendly regards
	Christoph P.


Peter Weilbacher wrote:
> 
> Hi Markus!
> 
> On Mon, 25 Jun 2001, Markus Ungermann wrote:
> 
> > Then i installed PA-Linux 0.9 on a 3.2GB-HD (Quantum Fireball 3200S ),
> > but after the first reboot:
> > - the system starts and
> > - the Init-Process works,
> > - it enter Runlevel 2
> > - then instead of a login i get an Crash
> > I get a Dump list (How can i print/copy this?) and the following line:
> >
> > Kernel Fault Code 26 regs(differents everytime)
> 
> I had the same error when I installed it, I think it is in the known
> bugs on the webpage. The developers told me to be patient, those are
> bugs in the graphical STI interface.
> 
> A perhaps related problem is that if you try to go down further than
> the end of the file in vi, it crashes with a similar dump screen.
> 
> > Can someone help me to login ?
> > Or how can i boot into single mode (there is no lilo ;-))) ?
> 
> - Press <escape> before booting.
> - search for the boot device:
>         search scsi
> - start the ipl:
>         boot <scsi-dev> ipl
> - edit the last parameter and add with a space:
>         " init=1" or " init=/bin/sh"
> Starting the IPL boot should get you booted. You should then perhaps
> edit /etc/inittab before trying further.
> 
> Can anyone tell me, which script in /etc/init.d starts the virtual
> consoles? It's none from the ones in /etc/rc1.d/...
> 
> > Is the powersupply strong enough for a second intern HD (then i boot
> > from the 520MB und use the Quantum as /usr) ?
> 
> Just try it? There is a special room for a second disk in my
> machine, which I cannot use because the other disks I have get too
> hot.
> 
> Gruesse,
>         Peter.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
