Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 409AE482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Feb 2002 11:58:50 -0700 (MST)
Date: Sun, 10 Feb 2002 19:58:46 +0100
Subject: Re: [parisc-linux] [REQUEST] PS/2 keyboard pinouts?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v480)
Cc: parisc-linux@lists.parisc-linux.org
To: Bob Radvanovsky <rsradvan@unixworks.net>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <200202101948.NAA05497@unixworks.net>
Message-Id: <35D5F0CA-1E58-11D6-B0C5-0030656F07A2@esiee.fr>
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

Le dimanche 10 f=E9vrier 2002, =E0 08:48 , Bob Radvanovsky a =E9crit :

> I recently picked up about 30+ 712 workstations, some of which will be
> converted to the Debian PA/Linux operating system.  I plan on =
importing
> the clusting software, Eddie, over to Debian and turning about 12+ of
> these 712 workstations into a gigantic Linux cluster.
>
> Unfortunately, I don't have 30+ keyboards for all of these =
workstations.
>
> Anyone got any ideas on where I can get (1) pin descriptions as to how=20=

> to
> bypass the "no keyboard, no bootup" problem on most of the HP
> workstations, and (2) where I might be able to get some PS/2 connector=20=

> to
> make my own "headless" Linux cluster configuration.

Well, we had the same problem here, when we wanted to 'clusterize' a=20
bunch of 712.

You can find a solution by switching your 712 to serial console,=20
following the instructions found at:
http://lists.parisc-linux.org/hypermail/parisc-linux/0423.html

You need HP/UX ISL for that.

If you don't have it, you can download the following lifimage:
http://cvs.parisc-linux.org/build-tools/uxbootlf

and then using bootp with it...


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin
