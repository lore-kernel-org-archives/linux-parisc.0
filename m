Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8217482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 02:18:46 -0600 (MDT)
Date: Wed, 29 May 2002 10:18:29 +0200
Subject: Re: [parisc-linux] 2.4.18-pa29 problem
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: parisc-linux@lists.parisc-linux.org
To: Jeremy Drake <jeremyd@apptechsys.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <Pine.LNX.4.44.0205281829180.11012-100000@garibaldi.apptechsys.com>
Message-Id: <A82E4B62-72DC-11D6-8311-0030656F07A2@esiee.fr>
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

Le mercredi 29 mai 2002, =E0 03:32 , Jeremy Drake a =E9crit :

> I don't know if this is related to my other problems or not, but when
> booting an SMP 2.4.18-pa29 kernel from CVS, the box stops after=20
> displaying
> "Freeing Unused Kernel Memory".  The box is still semi-responsive, in=20=

> that
> stuff sent to the serial  console is echoed back, and the power button
> makes it say "shutting down" but nothing happens beyond that.
>
This is quite weird, because we have such a problem here:

With kernels 2.4.18-pa23 and above, it happens that some times the box=20=

won't reboot after a normal shutdown, or even a crash.
It stops at the same point ("Freeing Unused Kernel Memory"), and we also=20=

have the "shutdown requested" echo when pushing the button, but nothing=20=

happens.

A complete shutdown and reboot won't change a thing.

What is very weird, is that the same boxes boot fine with the original=20=

2.4.9-32 and fsck doesn't show anything bad.
We also had the case of a box that won't reboot with 2.4.18-pa23, but=20
when we tried the day after, it booted fine !
We also discovered that adding a init=3D/bin/sh param to the linux =
kernel=20
did the trick and let the machine boot.

We suspect an INIT problem.

Hope this might help.



Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
