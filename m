Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (i173-021.nv.iinet.net.au [203.59.173.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 733C4482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 09:03:28 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id XAA03687
	for parisc-linux@lists.parisc-linux.org; Sun, 17 Jun 2001 23:03:23 +0800
Date: Sun, 17 Jun 2001 23:03:19 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALO/kernel-build change proposal
Message-ID: <20010617230316.A3622@neep.com.au>
References: <E15AEUU-0004qi-00@noam.fc.hp.com> <200106132122.PAA01189@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200106132122.PAA01189@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, Jun 13, 2001 at 03:22:10PM -0600
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler said:
> Paul Bame wrote:
> > When self hosted, there's usually no need to run palo after every
> > kernel build since palo boots out of the file system by file name.
> > So I propose that the common self-hosted use model be to use simple
> > 'make' in the kernel tree [and make modules or whatever].  The
> > resulting 'vmlinux' file can then be copied to the desired location.
> 
> On x86, "make install" will do all the right things to install the
> freshly built kernel but doesn't do a damn thing for kernel modules.
> Need to run "make modules" and "make modules_install" to really make
> sure eveything is in sync.

As a Debian user I discovered the wonders of Manoj's kernel-package
suite to build Debian packages of kernel source/headers/image/docs from
a single kernel tree.  Certainly much easier to install the resulting
kernel-image-*.deb package than fuss about with the various Makefile
targets.  I suppose it would be unfriendly though to ask that this
become the standard means of building and installing hppa-linux kernels?

=)

I see nothing wrong with Paul's suggestion but hope that kernel-package
is educated about the changes for the hppa architecture.  I've grown
fond of it (or too lazy to go back?) ...

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
