Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F0FC482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 13:50:21 -0700 (MST)
Date: Fri, 15 Nov 2002 15:50:28 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	bzeeb-lists@lists.zabbadoz.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] next issues ...
Message-ID: <20021115205028.GI7587@systemhalted>
References: <20021115175032.GD5673@systemhalted> <200211151910.gAFJA2Sv014896@hiauly1.hia.nrc.ca> <20021115192110.GE21266@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021115192110.GE21266@tausq.org>
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

> > My impression from what Joel has said is that the problem is bad coding
> > rather than an actual gcc problem.  However, up to now, nobody has been
> > able to provide a precise analysis of what's going on.
> 
> or even duplicate the problem.. i've been building 2.4 and 2.5 kernels
> with 3.2 for some time.... haven't seen the problems that have been
> reported.
> 

32 or 64-bit kernels? All debian tools? Mix of debian and upstream?

My only run-in with the problem was with 32-bit kernels cross compiled
from x86. Though lately I'm using a gcc-3.1 based XC and it builds functional
64-bit kernels.

This is definately becoming one of those HPPA urban legends. I shall add
it to my TODO list and verify that I can build a 32/64-bit kernel
natively and cross with all the latest upstream cvs bits.

c.
