Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7362D4A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 01:21:06 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA26062;
	Sat, 24 Feb 2001 19:21:01 +1100
Date: Sat, 24 Feb 2001 19:21:01 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
 system
In-Reply-To: <m3elwoik1x.fsf@otr.mynet.cygnus.com>
Message-ID: <Pine.LNX.4.21.0102241906140.9315-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 24 Feb 2001, Ulrich Drepper wrote:

> Alan Modra <alan@linuxcare.com.au> writes:
> 
> > Oh, and for the benefit of the list, Ulrich is talking about native
> > builds.  This ought to be obvious, but _DO NOT_ build glibc for a
> > cross-compiling environment with --prefix=/usr.
> 
> Of course you do.  If the library is later used in /usr you have to do
> this.  Don't put words in my mouth I didn't say.

I think you misunderstand.  When I said above about building glibc for a
cross compiling environment, I'm talking about building an hppa-linux
glibc to be installed on an i686-linux system for use by the cross tools.
If binutils and gcc are built with --build=i686-linux --host=i686-linux
--target=hppa-linux --prefix=/usr, then it's correct to build glibc with
--build=i686-linux --host=hppa-linux --prefix=/usr/hppa-linux because then
"make install" will put glibc in the correct place for the cross tools.

Building glibc with --prefix=/usr then "make install_root=/usr/hppa-linux"
doesn't put glibc in directories searched by the cross tools.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
