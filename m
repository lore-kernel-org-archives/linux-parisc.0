Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB5CA482A
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 14:20:52 -0600 (MDT)
Date: Mon, 11 Jun 2001 16:21:32 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: John Hagreis <jha@xs4all.nl>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] clustering ??
Message-ID: <20010611162132.A846@megatonmonkey.net>
References: <KHEOKDLGAPDONGNKGOKFAEEGCAAA.jha@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <KHEOKDLGAPDONGNKGOKFAEEGCAAA.jha@xs4all.nl>; from jha@xs4all.nl on Mon, Jun 11, 2001 at 09:50:54PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 11, 2001 at 09:50:54PM +0200, John Hagreis wrote:
> Hi there,
> 
> I've got two B132L+ systems running with the 0.6 release. I wondered if
> there was someone who has experience with clustering these systems .....
> Anyone .....
> Tia,
> 
> John Hagreis.

John,

Clustering -> HA Systems -> Clustered Services -> Linux Virtual Server ?
Clustering -> Computational Clustering -> Beowulf / COW / NOW ?

I'll assume the later.

We have a cluster of ~48 715/50 Apollo systems.

Our current bottleneck (will be working on this tommorow evening) is
not having a functional rsh for MPI to use (MPICH 1.2.1).

Our setup:

- 3x 10/100 24 Port Switches, Baystack E450's
- NIS / NFS / Gateway Machines (x86 boxes)
- 2x 8' Racks of 48 712/50 PA-RISC Boxes (can you say warm :)

Visit: http://www.baldric.uwo.ca/index.php3
For our latest exploits (recipies coming soon).

What are you looking to do with your systems?

You might want to check out http://www.beowulf.org
(Or even join the mailing list! Excellent discussion for those interested).

Clustering using PA-RISC hardware is the same as clustering using
any other hardware, with the expection that:

- OS is under development (stability may vary)
- Need to understand low level OS functionality.

If anyone else on the list is working on clustering using PA-RISC
boxes, please share the stories.

As far as we know, we are the only group doing something as crazy
as using unsupported PA-RISC hardware to run a beowulf.

War stories? Success stories?


Thanks to Byron Sonne for donating his 712/60 box for testing!

Cheers,
Carlos O'Donell
-------------------------
Baldric Project
http://www.baldric.uwo.ca
-------------------------
