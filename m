Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E3D24A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 12:33:17 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VeOT-0001a7-00; Wed, 21 Feb 2001 11:53:41 -0700
Date: Wed, 21 Feb 2001 11:53:41 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC
Message-ID: <20010221115341.J31164@parcelfarce.linux.theplanet.co.uk>
References: <20010221111141.H31164@parcelfarce.linux.theplanet.co.uk> <200102211850.KAA17436@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102211850.KAA17436@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Feb 21, 2001 at 10:50:53AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 21, 2001 at 10:50:53AM -0800, Grant Grundler wrote:
> Will assuming SR0 work for user space?
> Will assuming SR0 work for zero-copy patch in the (near?) future?

It'll have to.  If you want to prefetch userspace, we need different
macros.  Given an address, we have no way of telling whether it's
user or kernel.

> "addr" has alignment restrictions. Not sure if you want
> to encode those as runtime checks or not.

Um.. Kane, page 6-11: ``The prefetch address is never unaligned -- the
low-order bits are ignored and the cache line containing the address is
fetched.''

> My reading of the "PA 2.0 Enhancements" in the "PA-RISC 2.0 Architecture"
> is pretty clear this is for PA2.0 CPU's only. #ifdef __LP64__ is needed.

But that stops 32-bit kernels on 64-bit architecture from taking advantage
of the optimisation.  perhaps we need some funky runtime patching...

> I'd like to encourage use prefetching on bcopy/checksum type loops.
> It will help perf *alot*.

I believe arjan's patch uses prefetches for list walking, which helps
the scheduler a lot.

-- 
Revolutions do not require corporate support.
