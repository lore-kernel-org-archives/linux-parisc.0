Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F3C0482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 19:11:25 -0600 (MDT)
Date: Thu, 20 Sep 2001 21:12:31 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Cc: baldric-exec@baldric.uwo.ca
Message-ID: <20010920211231.C24352@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] testandset
List-ID: <linux-parisc.vger.kernel.org>

parisc,

Trying to build glibc-2.2.4 on my 712/60

The build eventually halts because of the undefined "testandset"
---
/root/glibc_build/glibc-2.2.4/hppa-linux/obj/elf/ld.so.1: undefined reference to `testandset'
collect2: ld returned 1 exit status
make[4]: *** [/root/glibc_build/glibc-2.2.4/hppa-linux/obj/libio/tst_swscanf] Error 1
---

I've read all the docs for dpkg-dev, and yet the glibc debian stuff behaves
slightly different.

a) Unpack glibc 2.2.4, linux-threads, db1-add-on.
b) Patch to 2.2.4-1
c) Needed to comment hppa stuff back into 0list
d) Removed dl-fptr stuff from the hppa.dpatch (for now)
	= Added morally equivalent changes to locking macro in ./sysdeps/ia64/dl-fptr.c
	= testandset->try_lock
	= Though I'm scratching my head at hppa/dl-fptr.c?
	= Why is the ia64 stuff being touched anyway?
	
e) Packed it all back up as tar.bz2 (./debian rules seems to call for this)
f) Placed the tar.bz2's in the glibc-2.2.4 directory (so that they can be unpacked)
f) export LINUX_SOURCE=/usr/src/linux (no kernel-headers pakcage yet)
g) dpkg-buildpackage -uc -b -d (from within XXX/glibc-2.2.4)

glibc is almost as magical as the woman in the chair beside me watching 
me type this email.

Debian has a ./rules section ... women don't :}

Any thoughts hackers?
Would you like the full dpkg-buildpackage log?

c.
