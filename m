Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EDD4482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 09:17:05 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15kS35-0008WN-00; Fri, 21 Sep 2001 16:17:03 +0100
Date: Fri, 21 Sep 2001 16:17:03 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] testandset
Message-ID: <20010921161703.A27323@parcelfarce.linux.theplanet.co.uk>
References: <20010920211231.C24352@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010920211231.C24352@megatonmonkey.net>; from carlos@megatonmonkey.net on Thu, Sep 20, 2001 at 09:12:31PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 20, 2001 at 09:12:31PM -0400, Carlos O'Donell Jr. wrote:
> I've read all the docs for dpkg-dev, and yet the glibc debian stuff behaves
> slightly different.
> 
> a) Unpack glibc 2.2.4, linux-threads, db1-add-on.
> b) Patch to 2.2.4-1
> c) Needed to comment hppa stuff back into 0list
> d) Removed dl-fptr stuff from the hppa.dpatch (for now)
> 	= Added morally equivalent changes to locking macro in ./sysdeps/ia64/dl-fptr.c
> 	= testandset->try_lock
> 	= Though I'm scratching my head at hppa/dl-fptr.c?
> 	= Why is the ia64 stuff being touched anyway?

because we're removing the testandset macro, replacing it with try_lock.

> e) Packed it all back up as tar.bz2 (./debian rules seems to call for this)

No, definitely not, I don't know why you think you need to do that.

> f) Placed the tar.bz2's in the glibc-2.2.4 directory (so that they can be unpacked)
> f) export LINUX_SOURCE=/usr/src/linux (no kernel-headers pakcage yet)
> g) dpkg-buildpackage -uc -b -d (from within XXX/glibc-2.2.4)

Here's what you ned to do:

dpkg-source -x *dsc
cd glibc-*
frob 0lists & hppa.dpatch as above
put a copy of the kernel includes in /usr/src/linux/include rather than setting
LINUX_SOURCE
dpkg-buildpackage -B -a -rfakeroot

-- 
Revolutions do not require corporate support.
