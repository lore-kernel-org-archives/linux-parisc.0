Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D85F5482B
	for <parisc-linux@parisc-linux.org>; Thu, 15 May 2003 04:20:18 -0600 (MDT)
Date: Thu, 15 May 2003 12:20:14 +0200
Subject: Re: [parisc-linux] sym53c8xx.c
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <20030514215849.GK6859@parcelfarce.linux.theplanet.co.uk>
Message-Id: <D151E296-86BE-11D7-84C5-0030656F07A2@esiee.fr>
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

Le mercredi, 14 mai 2003, =E0 23:58 Europe/Paris, Matthew Wilcox a =E9crit=
 :

>
> The sym53c8xx driver is near to being removed from 2.6.  Can anyone=20
> think
> of a situation where we might still want it?  I'm concerned that maybe
> some of the fixes didn't go into the sym53c8xx_2 driver.  In=20
> particular,
> I'd like to know that the sym53c8xx_2 driver in 2.5 works on C3k (wide=20=

> &
> narrow!) and A500.
We've been using SYM2 on our A500 SMP for quite a large amount of time=20=

now,
not experiencing anymore race problem.
I recall some troubles on B2600 (bame experienced those as well, the box
just went very lazzy; and you could heard the HD twinkling twice a=20
second)
but we had no chance to test SYM2 on that box lately...
Maybe we can give it a shot on our J5k which is currently running SYM1
(SMP kernel as well).

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
