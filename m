Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1030482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 04:31:29 -0600 (MDT)
Date: Thu, 6 Jun 2002 12:31:27 +0200
Subject: Re: E55 Kernel Support and question for Christoph  (used to be RE:  [parisc-linux] Greetings!)
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: Damian Boune <dboune@marmot.com>,
	Stan Sieler <sieler@allegro.com>,
	parisc-linux@lists.parisc-linux.org,
	Thierry Simonnet <t.simonnet@esiee.fr>
To: Christoph Plattner <christoph.plattner@gmx.at>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <3CFE7787.796C7F33@gmx.at>
Message-Id: <8EE6C56A-7938-11D6-B6BA-0030656F07A2@esiee.fr>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Le mercredi 5 juin 2002, =E0 10:41 , Christoph Plattner a =E9crit :

>
> What to do:
> -----------
>
> Checkout a kernel, and enable the PDC ROM console in the "Character
> Devices" under the "Non-standard serial support". Further follow the
> <HELP> instructions for this driver (Creating a /dev/ttyB0, and use
> this device as login device).
You can get a lifimage with PDC enabled there:
http://pateam.esiee.fr/cd-
images/lifimages/lifimage-2.4.18-pa32-PDC-20020531.gz

There is also a corresponding netinst iso available on this site.

Robbert Stanford, who is hacking K-Class, reported this on the IRC:
15:48:23 <robbie>       the lifimage worked fine
15:49:00 <robbie>       however the kernel that was installed from=20
debian.org wasnt pdc enabled
15:52:44 <robbie>       thibaut:  on eother thing, but its more related=20=

to the install, i had to exit to a shell and manually edit=20
/target/etc/inittab and inittab.real to use /dev/ttyB0
15:55:29 <robbie>       which isnt realy a big deal, knowing one has to=20=

use ttyB0 with the lifimage pretty well means you oughta know enough=20
about sysVinit to check inittab when things go awry on your first boot

About the inittab.real hack, maybe Richard Hirst will see whether some=20=

tweaks to the default boot-floppies have to be done ;o)

Anyway, I hope this will help you.


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
