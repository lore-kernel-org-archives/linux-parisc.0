Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ocean.lucon.org (c1473286-a.stcla1.sfba.home.com [24.176.137.160])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9901E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 May 2001 21:34:06 -0600 (MDT)
Date: Thu, 24 May 2001 20:33:56 -0700
From: "H . J . Lu" <hjl@lucon.org>
To: amodra@one.net.au
Cc: binutils@sources.redhat.com, parisc-linux@lists.parisc-linux.org
Message-ID: <20010524203356.A30247@lucon.org>
References: <20010525130358.K9275@squeak.one.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010525130358.K9275@squeak.one.net.au>; from amodra@one.net.au on Fri, May 25, 2001 at 01:03:59PM +0930
Subject: [parisc-linux] Re: elf32-hppa: abort rather than BFD_ASSERT
List-ID: <linux-parisc.vger.kernel.org>

On Fri, May 25, 2001 at 01:03:59PM +0930, amodra@one.net.au wrote:
> Be a little more brutal.  Any BFD_ASSERT failure here either rapidly
> results in a segfault during linking, or worse, generates shared libs
> and executables that will bomb with bus errors at runtime.  An
> undefined millicode symbol in a shared library is nasty too:  they
> can't be satisfied by another shared lib export as the ABI doesn't
> allow millicode to be exported from shared libs.
> 

Why not give some useful messaages? I have been doing that for new
tests I added.


H.J.
