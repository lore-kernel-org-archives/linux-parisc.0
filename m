Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF91F482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 12:16:56 -0700 (MST)
Date: Fri, 15 Nov 2002 11:21:10 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	bzeeb-lists@lists.zabbadoz.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] next issues ...
Message-ID: <20021115192110.GE21266@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021115175032.GD5673@systemhalted> <200211151910.gAFJA2Sv014896@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211151910.gAFJA2Sv014896@hiauly1.hia.nrc.ca>
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

In reference to a message from John David Anglin, dated Nov 15:
> > I noticed that your 'uname -a' says you compiled the kernel with gcc-3.2.
> > AFAIK we have yet to build a kernel with gcc-3.2 that survives network 
> > traffic. Perhaps try building the kernel with gcc 3.1 or 3.0? 
> 
> 3.1.1 and 3.2 are identical except for a change in C++ abi, so as far
> as kernel building goes they should be the same.  3.3 has a small struct
> ABI fix (affects passing of 5-7 byte structs by value), improved long calls
> and a workaround for a linker bug affecting PA 2.0 float loads.  If I
> was picking, I would go with the current mainline 3.3 or the debian 3.0.
> 
> My impression from what Joel has said is that the problem is bad coding
> rather than an actual gcc problem.  However, up to now, nobody has been
> able to provide a precise analysis of what's going on.

or even duplicate the problem.. i've been building 2.4 and 2.5 kernels
with 3.2 for some time.... haven't seen the problems that have been
reported.

randolph
