Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9F02484B
	for <parisc-linux@parisc-linux.org>; Thu, 27 Sep 2001 18:44:53 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f8S1CRG22039
	for <parisc-linux@parisc-linux.org>; Thu, 27 Sep 2001 21:12:27 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f8S0ipB03885
	for parisc-linux@parisc-linux.org; Thu, 27 Sep 2001 20:44:51 -0400
Date: Thu, 27 Sep 2001 20:44:51 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] what i did on my holidays
Message-ID: <20010927204451.F2611@megatonmonkey.net>
References: <20010927161004.E16096@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010927161004.E16096@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Sep 27, 2001 at 04:10:04PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> And much much more!
> 
> I haven't even tried compiling it since fixing up the cvs merge conflicts
> with all the good work done in the last week or so.  Have fun...
> 
> -- 

You da best! :)

I've been hacking glibc 2.2.4-1:

	- ./sysdeps/ia64/dl-fptr.c changes for try_lock
	- Put change back into dpatch
	
	- Combing through glibc trying to understand the various
	  changes that have been made (and how glibc works).

	- dpkg-buildpackage now makes it to the point of using a new
	  ld.so.1, which seg's... so I'm back to figuring out why.

I'm still not as far as you've gotten. I can't even get within arms
reach of running zic, though I'm getting closer.

Trying to document those g++ problems with #define _BSD_SOURCE that
Zimmerman has been trying to assign blame for ;)

I constantly mull over writing a new "building the toolchain" for
the website.

Then I listen to Tom Waits, and I just feel like drinking and pondering
if my 715/50 really loves me ;)

--


c.
