Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from eros.cs.brandeis.edu (eros.cs.brandeis.edu [129.64.3.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id 857E8482A
	for <parisc-linux@parisc-linux.org>; Mon, 11 Jun 2001 17:03:20 -0600 (MDT)
From: Aaron Macks <aaronm@cs.brandeis.edu>
Message-Id: <200106112302.TAA18015@eros.cs.brandeis.edu>
Subject: Re: [parisc-linux] clustering ??
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Mon, 11 Jun 2001 19:02:59 -0400 (EDT)
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20010611162132.A846@megatonmonkey.net> from "Carlos O'Donell Jr." at Jun 11, 2001 04:21:32 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> If anyone else on the list is working on clustering using PA-RISC
> boxes, please share the stories.
> 
> As far as we know, we are the only group doing something as crazy
> as using unsupported PA-RISC hardware to run a beowulf.
> 
> War stories? Success stories?
Well I have a cluster of misc machines and 8 HPPA boxes, the problems
is that they are all 715/33's, so adding them to the mix is not yet
> possible.  The good news is that every other flavor of Linux I
> use(PPC, i386,i586,i686,m68k,SPARC) and Irix all play nice with each
> other and I can't figure out why HPPA linux would be much different.

As far as RSH goes, have you tried to use SSH as a transparent
standin(sometimes you need to replace rsh with 'ssh -x' for everything
to be happy.  I use LAM instead of MPICH, but replacing rsh for me is
as simple as a configure-time selection.
Aaron
http://wiglaf.cs-i.brandeis.edu
