Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF242484E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 12:21:16 -0600 (MDT)
Date: Fri, 10 Oct 2003 20:21:14 +0200
Subject: Re: [parisc-linux] IBM 3151 on K200 in Debian 3.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Walker White <wmwhite@udallas.edu>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <C4749327-FB3F-11D7-B35B-0030657CC792@udallas.edu>
Message-Id: <8850B2D4-FB4E-11D7-BD3F-0030656F07A2@esiee.fr>
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

Le vendredi, 10 oct 2003, =E0 18:35 Europe/Paris, Walker White a =E9crit =
:
>
> However, now I have another issue caused(?) by the netinstall CD. =20
> Whenever I try to install via ftp or http I get an "cannot download"=20=

> error on files midway through the base installation process.  For the=20=

> longest time it was apt_0.5.4_.  I tried every mirror in reasonable=20
> proximity.  No luck.
>
> Finally, I switched to CD install and used the Debian CD (the one that=20=

> will not boot to the console).  This works, but then it hangs on=20
> bsd_utils.  For hours.  I eventually gave up and rebooted.  And I=20
> cannot seem to download this file either.
>
> Anyone have any idea what is going on here?

How much RAM does your box have?
I have already seen that kind of trouble with boxes shipped with less=20
than 64MB RAM...

It's also possible that these 2.4.22 ISOs are somehow corrupted, but=20
considering the ratio of downloads vs complaints, it seems quite=20
unlikely (or so I hope).
Obviously we can't test all these ISOs as we're building them...


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
