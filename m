Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3DD6482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 22:13:26 -0600 (MDT)
Date: Wed, 17 Oct 2001 00:14:53 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] new glibc dpatch
Message-ID: <20011017001453.A11826@megatonmonkey.net>
References: <20011017004218.K15532@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017004218.K15532@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 17, 2001 at 12:42:18AM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> due to a few people hassling me, i've created a new hppa patch for glibc.
> it incorporates a couple of changes Carlos posted to the list and adds a
> couple of diffs of my own.  i've sent it to BenC for the 2.2.4-4 release
> of glibc, which he assures me is imminent.
> 

That's my name!

> You can find it at
> ftp://puffin.external.hp.com/pub/parisc/src/glibc22-hppa.dpatch
> 
> have fun.  it's still building on paer.d.o, but i would expect it to
> fail to build in the same place as before.

Looking through the patch changes and comparing to mine.
(The build has begun)

Just a comment about your changes to ./sysdeps/ia64/dl-fptr.c

=====
--- glibc22-hppa.dpatch	Tue Oct 16 20:52:02 2001
+++ glibc22-hppa.dpatch.mw	Tue Oct 16 21:05:27 2001
@@ -1135,7 +1135,7 @@
      unsigned int npages;		/* # of pages to allocate */
  #ifdef _LIBC_REENTRANT
 -    volatile int lock;
-+    __atomic_lock_t lock;
++    static __atomic_lock_t lock = __ATOMIC_LOCK_INIT;
      sigset_t full_sigset;
  #endif
      /* the next to members MUST be consecutive! */
=====

Should the lock be static and initialized? Comment?

c.
