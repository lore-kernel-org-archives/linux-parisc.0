Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C0A6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 07:57:56 -0600 (MDT)
Date: Thu, 11 Oct 2001 09:59:13 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Cc: baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Glibc 2.2.4-2 No Optimizations = No Compliation
Message-ID: <20011011095913.A8106@megatonmonkey.net>
References: <20011011073101.B5637@megatonmonkey.net> <20011011144718.A22924@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011011144718.A22924@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Oct 11, 2001 at 02:47:18PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> I dunno... I oftn find optimised easier to read.
> 

Really?
How about unrolled loops? ;)

In this case with GCC 3.0 being so fresh, there might
be some issues with -O2... so I'd like to see what 
happend at -O0.  I've patched, and I'm currently 
recompiling with -O0... so we'll see.

> 
> I don't know.  But I guess glibc needs to inline something, and this doesn't
> happen below -O1.
> 

True. But that really shouldn't make much difference since
AFAIK inlining doesn't happen until -O2, but config.h just says...
"You must have atleast -O1"

Those inlines, if they aren't there, would cause the build to fail...
and I still haven't seen any indication of this.

We shall see. If -O0 still segfaults, I'll trace that asm and
see what I can see... damn this all sounds so much like voodoo
magic.

c.
