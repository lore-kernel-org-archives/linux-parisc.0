Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EA0B482A
	for <parisc-linux@parisc-linux.org>; Tue, 12 Jun 2001 07:42:07 -0600 (MDT)
Date: Tue, 12 Jun 2001 09:42:52 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Aaron Macks <aaronm@cs.brandeis.edu>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] clustering ??
Message-ID: <20010612094252.B1917@megatonmonkey.net>
References: <20010611162132.A846@megatonmonkey.net> <200106112302.TAA18015@eros.cs.brandeis.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200106112302.TAA18015@eros.cs.brandeis.edu>; from aaronm@cs.brandeis.edu on Mon, Jun 11, 2001 at 07:02:59PM -0400
List-ID: <linux-parisc.vger.kernel.org>

[snip]
> is that they are all 715/33's, so adding them to the mix is not yet
> possible.  The good news is that every other flavor of Linux I
> 
> As far as RSH goes, have you tried to use SSH as a transparent
> standin(sometimes you need to replace rsh with 'ssh -x' for everything
> to be happy.  I use LAM instead of MPICH, but replacing rsh for me is
> as simple as a configure-time selection.
> Aaron
> http://wiglaf.cs-i.brandeis.edu
>

Aaron,

Yes, ssh does work as a direct replacement for rsh.
However, I believed that ssh was in haitus (due to OpenSSL not working). 

With a little work the 715/33's should work.
We have various 715/33's that hobble on a leg!
If you have any serious problems just email us, or spam the list ;)

Cheers,
Carlos
