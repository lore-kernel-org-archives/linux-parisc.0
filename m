Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1BD64A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 09:49:16 -0700 (MST)
Sender: plattner@dns2.dot.at
Message-ID: <3A8FFD04.4A43A3D3@dot.at>
Date: Sun, 18 Feb 2001 17:49:08 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target
 rootfilesystem
References: <Pine.LNX.4.21.0102182211441.18223-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Point (1):

No you have no pain at this point. This `/lib' is GLIBC built in and is
only
evaluated from the shared library loader (./elf/dl-load.c) at runtime
(as
far as I understood the stuff). So this has no influence on any cross
built
process. On the running binary (on the target machine) sees two "lib
search 
strings" one to `/usr/parisc/hppa-linux/lib' and one to '/lib'. The
runnung
binary on the target (HP PA) can then try both and will find it in
'/lib'.

The file ./elf/ld-load.c is the only one using this information as far I
found
per `grep'.

But if I am wrong, please correct me.....

Point (2): 

I will see...

With friendly regards

	Christoph P.
	

Alan Modra wrote:
> 
> On Sun, 18 Feb 2001, Christoph Plattner wrote:
> 
> > The GLIBC must be built with the line:
> >
> >       make user-defined-trusted-dirs=/lib
> 
> Good.  There's probably other ways around the problem too.  Just be aware
> that installing glibc built with the above in your cross-compiling machine
> will probably be wrong.  Looking in /lib will pick up x86 libraries
> instead of hppa-linux ones.
> 
> > Configure stops with:
> >
> > checking for working alloca.h... yes
> > checking for alloca... yes
> > checking whether getpgrp takes no argument... configure: error: cannot
> > check getpgrp if cross compiling
> 
> You can edit config.cache to set the correct values.  Doing so can be a
> pain.  It's probably easier and better to compile native.
> 
> Alan Modra
> --
> Linuxcare.  Support for the Revolution.

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
