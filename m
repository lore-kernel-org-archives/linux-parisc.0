Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CEC3482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 16:59:27 -0600 (MDT)
Message-Id: <200105242259.SAA02789@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: still getting $$dyncall refs in shlibs
To: amodra@one.net.au
Date: Thu, 24 May 2001 18:59:17 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: lamont@hp.com, parisc-linux@parisc-linux.org
In-Reply-To: <20010525083202.E9275@squeak.one.net.au> from "amodra@one.net.au" at May 25, 2001 08:32:02 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Thu, May 24, 2001 at 03:59:30PM -0600, LaMont Jones wrote:
> > > With the new toolchain, sipp still builds a libsipp.so.3.1 trips the
> > > bug checker.  Checking everything on the system doesn't find any bad
> > > libs.  Here is the build output for libsipp.so:
> 
> Too much can go wrong building shared libs just using ld.  It's far
> better to build using gcc -shared.  In this case, the problem is that
> the shlib needs to be built linked against libgcc to satisfy the
> millicode reference.

That also applies to libtool which uses `ld' directly.  Gcc will run
collect2 if needed.  This is necessary for correctly processing
constructors and destructors.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
