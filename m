Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98D13482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 09:57:31 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f8LGIJG32638
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 12:18:19 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f8LFweS29699
	for parisc-linux@lists.parisc-linux.org; Fri, 21 Sep 2001 11:58:40 -0400
Date: Fri, 21 Sep 2001 11:58:40 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] testandset
Message-ID: <20010921115840.C25803@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> 
> because we're removing the testandset macro, replacing it with try_lock.
> 

Noted.

> > e) Packed it all back up as tar.bz2 (./debian rules seems to call for this)
> 
> No, definitely not, I don't know why you think you need to do that.
> 

Thus my belief that I'm using the dpkg-dev tools wrong.
I read the docs late at night... maybe I didn't read them at all,
maybe I just dreamt that I did? ;)

> dpkg-source -x *dsc
> cd glibc-*
> frob 0lists & hppa.dpatch as above
> put a copy of the kernel includes in /usr/src/linux/include rather than setting
> LINUX_SOURCE
> dpkg-buildpackage -B -a -rfakeroot

I will give it another go (I've done a few compiles already).

My 712/60 is painfully slow :} 
Any recommendations for a faster machine?

We're almost to the point of setting up (Paul is looking at it)
pmake to build glibc. Hey, we've got a cluster for a reason.

Has anyone on this list used fai with hppa on this list?
http://www.informatik.uni-koeln.de/fai/.
(Hrm.. I'll post to beowulf@beowulf.org)

c.
