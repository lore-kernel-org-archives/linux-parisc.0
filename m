Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (unknown [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 961034829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jun 2003 09:15:59 -0600 (MDT)
Date: Thu, 5 Jun 2003 17:15:57 +0200
Message-ID: <3ED4C8B600002915@ocpmta1.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] palo II
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

> I couldn't yet. It happened just the one time. What I did was:
>
> 1. power on apollo
> 2. log in to the host the serial line was attached to
> 3. start minicom
> 4. come back five minute
> later (the palo.conf entry has been wrong)
> 5. fin
 the above on the screen
> 6. delete line 1 five times
> 7. change path to kernel
> 8. boot

Could it be electrical interferences?

[I also use minicom with serial port configured as 9600 8N1 with "Hardware
Flow COntrol : yes" and cleanup "modem and dialing" init and reset strings]

> [dep building]

> I think I am missing a package for all this here where most of the
> dh_* are included ...

the package is debhelper (just in case you would find another file, it exists
a nice search tool in <http://www.debian.org/distrib/packages>; at the
bottom, you can search packages containing the file you know :) )

> Me using apt-get source then debian/rules build and finally I cannot
> use fakeroot at the moment (glibc issue though downgr
ded).

Yes there is some issue with glibc 2.3.1-17, better is 2.3.1-16

Joel





---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
