Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40F0D4A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 00:53:49 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA25104;
	Sat, 24 Feb 2001 18:53:25 +1100
Date: Sat, 24 Feb 2001 18:53:25 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>,
	Christoph Plattner <christoph.plattner@alcatel.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
  system
In-Reply-To: <m3wvagiojx.fsf@otr.mynet.cygnus.com>
Message-ID: <Pine.LNX.4.21.0102241814320.9315-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 23 Feb 2001, Ulrich Drepper wrote:

> I really don't understand who came up with these "strange" build
> instructions.  For Linux builds of glibc where the result is actually
> used in the normal place (means in /lib and /usr/lib) you *always*
> have to configure with --prefix=/usr.  While installing it one than
> can use the install_root make variable.

Hi Ulrich,
  The "strange" build instructions come from people trying to use glibc
built for a cross-compiling environment, in a native environment too.

Perhaps I'm at fault for mentioning such a thing was possible (by
installing then setting up symbolic links so that glibc effectively
appears at both it's normal native location and also at the --prefix
location).  To atone, I think I'll write up a recipe for cross-building
native tools and glibc.

Oh, and for the benefit of the list, Ulrich is talking about native
builds.  This ought to be obvious, but _DO NOT_ build glibc for a
cross-compiling environment with --prefix=/usr.  If you install it, you'll
blow away your system libs.  hppa-linux libraries tend to not run very
well on x86.

Alan
-- 
Linuxcare.  Support for the Revolution.
