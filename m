Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B2374A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 12:48:04 -0700 (MST)
Message-Id: <200102211950.LAA17656@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC 
In-reply-to: Your message of "Wed, 21 Feb 2001 11:53:41 PST."
             <20010221115341.J31164@parcelfarce.linux.theplanet.co.uk>
Date: Wed, 21 Feb 2001 11:50:54 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> > "addr" has alignment restrictions. Not sure if you want
> > to encode those as runtime checks or not.
> 
> Um.. Kane, page 6-11: ``The prefetch address is never unaligned -- the
> low-order bits are ignored and the cache line containing the address is
> fetched.''

Right. I was reading the LDD/LDW pages (which don't discuss prefetching)
since I couldn't find the "Data Prefetch Instructions" section on page 6-11
on my own.


> But that stops 32-bit kernels on 64-bit architecture from taking advantage
> of the optimisation.  perhaps we need some funky runtime patching...

That's evil. I'd rather introduce a CONFIG flag that says "build me
a 32-bit kernel with PA2.0 optimizations/support". We've already made
this tradeoff in a few other places as well.


> I believe arjan's patch uses prefetches for list walking, which helps
> the scheduler a lot.

Certainly. Anytime we know we will touch more than a few cachelines,
I think it'll help.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
