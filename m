Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE6A7482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Aug 2001 22:44:02 -0600 (MDT)
To: Alan Modra <amodra@bigpond.net.au>
Cc: LaMont Jones <lamont@hp.com>,
	parisc-linux@lists.parisc-linux.org, lamont@hp.com
Subject: Re: [parisc-linux] libqthreads and hppa-linux 
In-reply-to: Your message of "Thu, 02 Aug 2001 14:09:22 +0930."
             <20010802140922.M5233@bubble.sa.bigpond.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 01 Aug 2001 22:44:00 -0600
From: LaMont Jones <lamont@hp.com>
Message-Id: <20010802044401.89CE11872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> On Wed, Aug 01, 2001 at 10:04:34PM -0600, LaMont Jones wrote:
> > I started to play with getting the hppa assembly code in guile-core to work
> > on pa-linux, but ran into challenges with %farg[0-3], which aren't defined
> > by the assembler...
> So fix the assembler!  gas/config/tc-hppa.c:pre_defined_registers

Dunno which regs they are, and don't have a current runtime arch doc at
home.

How close is the calling convention between hp-ux and pa-linux?

lamont
