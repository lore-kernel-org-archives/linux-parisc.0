Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob01.one.net.au (mail-ob01.one.net.au [61.12.0.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 659D1482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 16:55:43 -0600 (MDT)
Received: Received: [from squeak.local (async145-ade-isp-3.nas.one.net.au [203.101.88.146])
	by mail-ob01.one.net.au  with SMTP id f4OMtmF11130
	for <parisc-linux@parisc-linux.org>; Fri, 25 May 2001 08:55:51 +1000 (EST)]
From: amodra@one.net.au
Date: Fri, 25 May 2001 08:32:02 +0930
To: LaMont Jones <lamont@hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: still getting $$dyncall refs in shlibs
Message-ID: <20010525083202.E9275@squeak.one.net.au>
References: <20010524213301.126241872C@security.hp.com> <20010524215930.76E741872C@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010524215930.76E741872C@security.hp.com>; from lamont@hp.com on Thu, May 24, 2001 at 03:59:30PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 24, 2001 at 03:59:30PM -0600, LaMont Jones wrote:
> > With the new toolchain, sipp still builds a libsipp.so.3.1 trips the
> > bug checker.  Checking everything on the system doesn't find any bad
> > libs.  Here is the build output for libsipp.so:

Too much can go wrong building shared libs just using ld.  It's far
better to build using gcc -shared.  In this case, the problem is that
the shlib needs to be built linked against libgcc to satisfy the
millicode reference.

Alan
