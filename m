Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DD3C4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jun 2003 08:15:22 -0600 (MDT)
Date: Thu, 5 Jun 2003 14:14:33 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
In-Reply-To: <3ED4C8B600002734@ocpmta1.freegates.net>
Message-ID: <Pine.BSF.4.53.0306051406370.27036@e0-0.zab2.int.zabbadoz.net>
References: <3ED4C8B600002734@ocpmta1.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 5 Jun 2003, Joel Soete wrote:

> > problem maybe with some pointer ... Will have to verify all possible
> > paths ... going to re-check and let you know.
> >
> > --- cut ---
> > /boot/vmlinux-2.5.69-pa1 74 00L 1X c 1Q root=/dev/sdb3 HOME=/ TERM=linux conso0
> >  0: 3/boot/vmlinux-2.5.69-pa1
> >  1: 74
> >  2: 00L
> >  3: 1X
> >  4: c
> >  5: 1Q
> >  6: root=/dev/sdb3
> >  7: HOME=/
> >  8: TERM=linux
> >  9: console=ttyS0
> >
> > Edit which field?
> > (or 'b' to boot with this command line)?
> > --- cut ---
>
> Hmm how may I reproduce?

I couldn't yet. It happened just the one time. What I did was:

1. power on apollo
2. log in to the host the serial line was attached to
3. start minicom
4. come back five minutes later (the palo.conf entry has been wrong)
5. find the above on the screen
6. delete line 1 five times
7. change path to kernel
8. boot



[dep building]

I think I am missing a package for all this here where most of the
dh_* are included ...

Me using apt-get source then debian/rules build and finally I cannot
use fakeroot at the moment (glibc issue though downgraded).

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
