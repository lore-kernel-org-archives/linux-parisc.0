Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA9424957
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 03:13:45 -0600 (MDT)
Date: Fri, 10 Oct 2003 11:13:42 +0200
Subject: Re: [parisc-linux] IBM 3151 on K200 in Debian 3.0
Content-Type: text/plain; delsp=yes; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Walker White <wmwhite@udallas.edu>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <20E48BDA-FA86-11D7-B35B-0030657CC792@udallas.edu>
Message-Id: <0B279720-FB02-11D7-BD3F-0030656F07A2@esiee.fr>
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

Looks like you've been rather unlucky with your search :-P

On the m-l page (http://www.parisc-linux.org/mailing-lists/) this mail
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-March/=20
019399.html
would have told you to look at:
1) http://pateam.esiee.fr/doc.html for a boot howto
and at
5) http://pateam.esiee.fr/list.html for per machine details.

The latter link would have told you that for K200 you need PDC_CONSOLE =20=

which is enabled by default on the netinst isos available from both =20
pateam and parisc-linux.org, and would also have pointed you at all the =20=

data you need to install your box with the following useful m-l thread:

http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/=20
017840.html

details being also present in the boot howto afore mentioned...

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

Le jeudi, 9 oct 2003, =E0 20:26 Europe/Paris, Walker White a =E9crit :

> I have scoured the FAQ and mailing lists.  Supposedly this has been =20=

> resolved, but I am having the same old problems.
>
> I just inherited an old K200 which I want to give my students as a =20
> "play" machine.  I am trying to install Debian 3.0 on it.  When I got =20=

> the machine, it had no console whatsoever.  So I grabbed an old IBM =20=

> 3151 and plugged into the machine.  Works, no problem.  I can boot =20
> into HPUX just fine (which is still on the machine).
>
> I tried to boot to the CD.  After a few stack dumps, a learned from =20=

> the mailing list that I needed to change my console to ttyB0 from =20
> ttyS0.  No more stack dumps.  However, after the message that says I =20=

> might not see anything (and hence need to switch consoles), I do not =20=

> see anything.  Supposedly this issue was fixed in the install CDs (at =20=

> least that is what mailing list says), but doesn't seem so to me.
>
> Is this an issue with the install CDs, or do I need to do something =20=

> funky with the IBM 3151?
>
> =
-----------------------------------------------------------------------=20=

> ------------------------
> | Walker White                                                         =
=20
>   Assistant Professor  |
> | wmwhite@udallas.edu                                                  =
=20
>  Dept. of Mathematics  |
> | 972 -721-5380                                                        =
=20
>  University of Dallas  |
> =
-----------------------------------------------------------------------=20=

> ------------------------
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
