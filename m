Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31DEE482A
	for <parisc-linux@parisc-linux.org>; Mon,  1 Apr 2002 09:34:17 -0700 (MST)
Message-Id: <m16s4kv-000KUzC@phantom.home>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, amodra@bigpond.net.au
In-Reply-To: Your message of "Sat, 30 Mar 2002 13:38:00 EST."
             <200203301838.g2UIc1FP028387@hiauly1.hia.nrc.ca>
References: <200203301838.g2UIc1FP028387@hiauly1.hia.nrc.ca> 
Date: Mon, 01 Apr 2002 09:34:01 -0700
From: Paul Bame <bame@riverrock.org>
Subject: [parisc-linux] Re: $$remI corner case
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I have investigated the failure of gcc.c-torture/execute/arith-rand.c
> under hppa-linux.  The failure is caused by $$remI returning an incorrect
> signed result when the divisor is 0x80000000 (largest negative integer).
> The 32-bit linux port currently uses the millicode routines in milli32.S.
> This is older code dating from 1995.

My memory is hazy here, but I think the 32-bit code is from the original
hpux gcc port.  The 64-bit code is some I had permission to port right
from the latest version available at the time, last year or whenever that
was.

Alan made it fit better with the gcc infrastructure (put it all
in one file with those #ifdefs).

> The 64-bit port uses milli64.S.  This code looks like it was originally
> written for 32-bit but I it's possible some changes have been made
> that would make it incompatible with 32-bit registers.  Paul and Alan,
> could you comment on this?

Millicode calling conventions are incompatible for 32 and 64-bit,
the return value register is the thing I remember right now and
may be the only difference.

> I added $$dyncall to milli64.S and modified t-linux to use milli64.S.
> This fixes the arith-rand.c fail and there are no other regressions,
> so I think we can use milli64.S on both the 32-bit and 64-bit ports.

It looks like the appropriate #ifdefs are present in milli64.S so
that it can be used as-is for 32-bit (so long as the "pa64" CPP
symbol is properly defined).

	-P
