Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF1224A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 04:19:46 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA19171;
	Sun, 18 Feb 2001 22:19:20 +1100
Date: Sun, 18 Feb 2001 22:19:20 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
  system
In-Reply-To: <3A8FA3D8.19E69EF6@dot.at>
Message-ID: <Pine.LNX.4.21.0102182211441.18223-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 18 Feb 2001, Christoph Plattner wrote:

> The GLIBC must be built with the line:
> 
> 	make user-defined-trusted-dirs=/lib 

Good.  There's probably other ways around the problem too.  Just be aware
that installing glibc built with the above in your cross-compiling machine
will probably be wrong.  Looking in /lib will pick up x86 libraries
instead of hppa-linux ones.

> Configure stops with:
> 
> checking for working alloca.h... yes
> checking for alloca... yes
> checking whether getpgrp takes no argument... configure: error: cannot
> check getpgrp if cross compiling

You can edit config.cache to set the correct values.  Doing so can be a
pain.  It's probably easier and better to compile native.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
