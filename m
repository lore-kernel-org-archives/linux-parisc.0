Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin9.bigpond.com (juicer34.bigpond.com [139.134.6.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id E85E6482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Aug 2001 23:00:17 -0600 (MDT)
Received: from bubble.local ([144.135.24.84]) by
          mailin9.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GHFCUA00.8GE for <parisc-linux@lists.parisc-linux.org>; Thu,
          2 Aug 2001 15:06:10 +1000
Date: Thu, 2 Aug 2001 14:30:08 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: LaMont Jones <lamont@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] libqthreads and hppa-linux
Message-ID: <20010802143008.N5233@bubble.sa.bigpond.net.au>
References: <20010802140922.M5233@bubble.sa.bigpond.net.au> <20010802044401.89CE11872C@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010802044401.89CE11872C@security.hp.com>; from lamont@hp.com on Wed, Aug 01, 2001 at 10:44:00PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 01, 2001 at 10:44:00PM -0600, LaMont Jones wrote:
> > On Wed, Aug 01, 2001 at 10:04:34PM -0600, LaMont Jones wrote:
> > > I started to play with getting the hppa assembly code in guile-core to work
> > > on pa-linux, but ran into challenges with %farg[0-3], which aren't defined
> > > by the assembler...
> > So fix the assembler!  gas/config/tc-hppa.c:pre_defined_registers
> 
> Dunno which regs they are, and don't have a current runtime arch doc at
> home.
> 
> How close is the calling convention between hp-ux and pa-linux?

Practically identical.  farg0..3 is fr4..7 from memory, and I think they
are in that order.  Test it out by writing a little C code, and
compiling with -S.
