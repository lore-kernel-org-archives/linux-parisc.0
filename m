Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from merulo.debian.org (merulo.external.hp.com [192.25.206.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C77E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 13:46:17 -0600 (MDT)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id E1E5C2420C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 13:46:13 -0600 (MDT)
Sender: bdale@rover.gag.com
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Users staying up to date.
References: <20010814154037.I25258@megatonmonkey.net>
From: Bdale Garbee <bdale@gag.com>
Date: 14 Aug 2001 13:46:11 -0600
In-Reply-To: <20010814154037.I25258@megatonmonkey.net>
Message-ID: <87zo92a0ho.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

carlos@baldric.uwo.ca (Carlos O'Donell Jr.) writes:

> Obviously the latest kernel/glibc/gcc... will reside in the
> CVS. It's a matter of slurping/building and testing on one
> of our boxen.

Actually, I just uploaded gcc to the Debian archive built entirely from the
Debian source package, and am working on glibc right now.  The only thing that
there is still any need to use CVS for is the kernel, and I'll be working on
that too once the merge up to 2.4.8 is done.

> The packages are a slightly different matter. Is the 0.9.2
> iso the latest collection of packages? Is anyone in debain-hppa
> compiling/testing packages?

We have a full-time Debian autobuilder running, so on any given day in excess
of 70% of all Debian packages are fully up to date in the unstable tree of
the Debian mirrors.

For a cluster config such as yours, the ideal situation is probably to set 
up a caching proxy like a squid server, and then configure all of your machines
to do their apt-get's from the Debian mirror network through the cache.  That
keeps you as current as you want to be, eliminates any manual steps involved
in maintaining a local cache of packages, and means that you only pull each
package once from the mirror network.

Bdale
