Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id A803E482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 10:14:25 -0600 (MDT)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GF313Y01.Q51 for
          <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 08:14:22 -0800
Received: from devnull.alaskatech.org ([24.237.5.207]) by
          mmp-2.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GF313Z01.X08 for <parisc-linux@lists.parisc-linux.org>; Sun, 17
          Jun 2001 08:14:23 -0800
Date: Sun, 17 Jun 2001 08:14:24 -0800 (AKDT)
From: Tom <tom@Alaskatech.org>
To: PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] PALO/kernel-build change proposal
In-Reply-To: <20010617230316.A3622@neep.com.au>
Message-ID: <Pine.LNX.4.33.0106170807040.9599-100000@devnull.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > Paul Bame wrote:
> > > When self hosted, there's usually no need to run palo after every
> > > kernel build since palo boots out of the file system by file name.
> > > So I propose that the common self-hosted use model be to use simple
> > > 'make' in the kernel tree [and make modules or whatever].  The
> > > resulting 'vmlinux' file can then be copied to the desired location.
> >
> Grant Grundler said:
> > On x86, "make install" will do all the right things to install the
> > freshly built kernel but doesn't do a damn thing for kernel modules.
> > Need to run "make modules" and "make modules_install" to really make
> > sure eveything is in sync.
>
> Andrew Shugg <andrew@neep.com.au>
> As a Debian user I discovered the wonders of Manoj's kernel-package
> suite to build Debian packages of kernel source/headers/image/docs from
> a single kernel tree.  Certainly much easier to install the resulting
> kernel-image-*.deb package than fuss about with the various Makefile
> targets.  I suppose it would be unfriendly though to ask that this
> become the standard means of building and installing hppa-linux kernels?

(ObDisclaimer: I'm closer to 'user' than to 'developer', much closer...)

Working with this HP715 hasn't been too bad - very similar to early Debian
on the Intel boxes. Lots of support via mailing lists, weird docs, strange
ways of making things work... My only complaint on building a kernel was
the docs at ESIEE. Lots of 'download and configure this, then this, now
this...", which is fine, but they end with "Congrats - your new kernel is
palo/lifimage" and no comment on where it goes...

I don't suppose someone has an updated how-to for actually *using* your
new kernel, do they? Replacing /boot/vmlinux-2.4.0 with the new one
results in an immediate hang on reboot...
