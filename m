Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04388482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Aug 2001 22:49:48 -0600 (MDT)
To: LaMont Jones <lamont@hp.com>
Cc: Alan Modra <amodra@bigpond.net.au>,
	parisc-linux@lists.parisc-linux.org, lamont@hp.com
Subject: Re: [parisc-linux] libqthreads and hppa-linux 
In-reply-to: Your message of "Wed, 01 Aug 2001 22:44:00 MDT."
             <20010802044401.89CE11872C@security.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 01 Aug 2001 22:49:45 -0600
From: LaMont Jones <lamont@hp.com>
Message-Id: <20010802044946.6B4FC1872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > So fix the assembler!  gas/config/tc-hppa.c:pre_defined_registers
> Dunno which regs they are, and don't have a current runtime arch doc at
> home.

This code seems to think that four args are passed in regs, but the code
that cc generates appears to only pass two doubles in regs.  Likewise,
are the FR's numbered the same?  (The names were rather funky on hp-ux,
due to legacy issues...)

lamont
