Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4452C486A
	for <parisc-linux@parisc-linux.org>; Fri, 28 Sep 2001 08:23:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15myXo-0002dG-00; Fri, 28 Sep 2001 15:23:12 +0100
Date: Fri, 28 Sep 2001 15:23:12 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] what i did on my holidays
Message-ID: <20010928152312.A3460@parcelfarce.linux.theplanet.co.uk>
References: <20010927161004.E16096@parcelfarce.linux.theplanet.co.uk> <20010927204451.F2611@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010927204451.F2611@megatonmonkey.net>; from carlos@megatonmonkey.net on Thu, Sep 27, 2001 at 08:44:51PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 27, 2001 at 08:44:51PM -0400, Carlos O'Donell Jr. wrote:
> 	- ./sysdeps/ia64/dl-fptr.c changes for try_lock
> 	- Put change back into dpatch

Excellent.

> 	- dpkg-buildpackage now makes it to the point of using a new
> 	  ld.so.1, which seg's... so I'm back to figuring out why.

Yes.  If you decode that long command, it's probably running zic -- that's
the first thing it attempts to build natively.

By the way, there's glibc 2.2.4-2 out now; I don't know what changes
BenC made to it.  In any case, I thought we'd decided the problem was
with a bogus C compiler (since 2.2.3-9 now fails to build).  Any update
on getting a compiler which fixes this?

-- 
Revolutions do not require corporate support.
