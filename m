Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BABC54879
	for <parisc-linux@parisc-linux.org>; Fri, 14 Sep 2001 10:35:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15hvvp-0006nW-00; Fri, 14 Sep 2001 17:35:09 +0100
Date: Fri, 14 Sep 2001 17:35:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Glibc2.2.4-1
Message-ID: <20010914173509.H26658@parcelfarce.linux.theplanet.co.uk>
References: <20010914112352.A1491@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010914112352.A1491@megatonmonkey.net>; from carlos@megatonmonkey.net on Fri, Sep 14, 2001 at 11:23:53AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 14, 2001 at 11:23:53AM -0400, Carlos O'Donell Jr. wrote:
> It looks like ./sysdeps/ia64/dl-fptr.c is completely different!
> I get 7 hunks failed on that file. All the reentrant ifdef's are
> gone, and the structure of the file is totally different.
> 
> I've ignored those patch failures since there was no visible way
> to merge them.

Yep, I just ignored it for the moment.  The morally-equivalent change
will have to be made to that file to eliminate testandset, but it's
irrelevant to getting glibc working.

> I've compiled 2.4.9-pa16 with the toolchain, and for the first time
> ever... I saw a small framebuffer penguin... and it almost brought
> me to tears ;)
> 
> I have 712/60's and 715/50's running the newer kernel. All of them
> are doing much better, and running far faster than ever before.
> 
> Though lately ksoftirqd seems to eat ~99% of my CPU on idle.

You need to upgrade to latest CVS -- Richard found & fixed that problem.

> Anything I should watch for when building the deb for glibc 2.2.4-1?
> It may take quite a while on my 712/60.

Yes, when we tried a few weeks ago, glibc 2.2.3-9 would no longer build
with the gcc in the archive.  So we need gcc to be updated before we
can hope to build 2.2.4-1.

-- 
Revolutions do not require corporate support.
