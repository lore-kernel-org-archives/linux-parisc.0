Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta06ps.bigpond.com (mta06ps.bigpond.com [144.135.25.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46ED4482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 10:11:17 -0600 (MDT)
Received: from bubble.local ([144.135.25.72]) by
          mta06ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GLM7XK00.JO1 for <parisc-linux@lists.parisc-linux.org>; Tue,
          23 Oct 2001 02:17:44 +1000
Date: Tue, 23 Oct 2001 01:41:08 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011023014108.B1037@bubble.sa.bigpond.net.au>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011022233534.X1037@bubble.sa.bigpond.net.au> <20011022120405.A5199@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011022120405.A5199@megatonmonkey.net>; from carlos@megatonmonkey.net on Mon, Oct 22, 2001 at 12:04:05PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 22, 2001 at 12:04:05PM -0400, Carlos O'Donell Jr. wrote:
> A,
> 
> Re: Latest glibc changes being applied to what tree?

debian glibc-2.2.4-3, with willy's glibc22-hppa.dpatch

> Are we to assume that the glibc in pehc is now being kept up to date?

No.

> Or have these changes made it to the pool on debian? (via hppa's dpatch).

Not yet, but they should soon
