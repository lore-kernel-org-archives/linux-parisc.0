Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5841484E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 11 Oct 2003 02:04:11 -0600 (MDT)
Date: Sat, 11 Oct 2003 10:04:09 +0200
Subject: Re: [parisc-linux] IBM 3151 on K200 in Debian 3.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Walker White <wmwhite@udallas.edu>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <9C146012-FB5A-11D7-B35B-0030657CC792@udallas.edu>
Message-Id: <7E4D5636-FBC1-11D7-BD3F-0030656F07A2@esiee.fr>
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

Le vendredi, 10 oct 2003, =E0 21:47 Europe/Paris, Walker White a =E9crit =
:

> Okay.  Almost done here.  That swap trick DID work.  It just did not=20=

> read the K200 manual to see that HP boots from the end of the SCSI=20
> chain and not the beginning.  So everything is loaded and it boots.
>
> However my boot crashes right after loading cron.  This is possibly a=20=

> result of the fact that some of my packages came from the debian CD=20
> and not the netinstall.  Here is the error:
>
> ***
> Starting periodic command scheduler: cron
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> /bin/sh: /dev/ttyB0: No such device
> INIT: Id "T0" respawning to fast: disabled for 5 minutes
> INIT: no more processes left in this runlevel
>
> The machine then sleeps for 5 minutes and repeats the error on wake-up=20=

> (so I never get a login).
>
> Using the installation CD, I have opened a shell to verify that there=20=

> is indeed a /dev/ttyB0.  Is this error because I got packages from a=20=

> source other than the netinst CD or is there something else going on=20=

> here?

Looks like something is screwed because of mixed package (most likely=20
makedev stuff).
My best recommandation would be to upgrade at least to Debian testing=20
(sarge).
To do so, you have to change /etc/apt/sources.list, and run apt-get=20
update; apt-get dist-upgrade
Another guess: was the kernel package installed from the netinst or=20
from Debian 3.0?
If the latter, then /dev/ttyB0 might be there but not related to any=20
kernel driver (since 3.0 doesn't handle /dev/ttyB0).

The hangs you experienced during install are kinda weird, i hope that=20
our ISOs aren't corrupted, i'll try to check that at some point.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
