Return-Path: <varenet@esiee.fr>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DC56482C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 07:53:54 -0700 (MST)
Date: Sun, 28 Mar 2004 16:53:51 +0200
Subject: Re: [parisc-linux] Trouble booting hp9000 k class model k250
	(shortish'd)
Content-Type: text/plain; delsp=yes; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v553)
To: "Wayne Rooney" <wrooney@ihug.co.nz>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <000501c414bf$85f743a0$0a01a8c0@wayneroo.inet>
Message-Id: <BA41D839-80C7-11D8-B9E6-0030656F07A2@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

According to:
http://www.pateam.org/list.html

You need to use PDC console.

Then, following the howto at
http://www.pateam.org/doc.html
(not mentioning the numerous threads about this on this list)

you'd have found that you just have to use the latest netinst (as you =20=

did) and tell PALO during bootup to change the console to /dev/ttyB0

All relevant links can be found here
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-March/=20
019399.html

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/

Le dimanche, 28 mars 2004, =E0 14:23 Europe/Paris, Wayne Rooney a =E9crit =
:

>
> Hello list.
>
> I have acquired an HP 9000 K class server, model K250.
>
> I woud like to install Linux on it but I am having a spot of trouble =20=

> getting
> it to boot from a Linux cd.
>
> I've been using Linux on x86 for a couple of years but this is my =
first
> parisc computer and I don't know much about the platform yet.
>
> I've done enough research in the last week to know I need a "-PDC-" =20=

> image or
> a kernel after, what was it, 2.4.19?
>
> Anyway, I've tried booting a couple of iso's, and they both hang at =
the
> point where the serial driver loads.
>
> If anyone could suggest a handling I would very much appreciate it.
>
> Data follows:
>
> The first iso was palinux-2.4.21-pa6-20030718-netinst.iso which was
> downloaded from http://www.pateam.org/cd-images/testing/ and it =20
> produces:
>
>
