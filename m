Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin8.bigpond.com (juicer39.bigpond.com [139.134.6.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E1AF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 00:48:49 -0600 (MDT)
Received: from bubble.local ([144.135.24.69]) by
          mailin8.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GHFHUJ00.JWX for <parisc-linux@lists.parisc-linux.org>; Thu,
          2 Aug 2001 16:54:19 +1000
Date: Thu, 2 Aug 2001 16:18:17 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: LaMont Jones <lamont@hp.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] libqthreads and hppa-linux
Message-ID: <20010802161817.A26828@bubble.sa.bigpond.net.au>
References: <20010802044401.89CE11872C@security.hp.com> <20010802044946.6B4FC1872C@security.hp.com> <20010802151415.O5233@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010802151415.O5233@bubble.sa.bigpond.net.au>; from amodra@bigpond.net.au on Thu, Aug 02, 2001 at 03:14:15PM +0930
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 02, 2001 at 03:14:15PM +0930, Alan Modra wrote:
> Hmm, I wonder if you've found a gcc bug?

Curiousity got the better of me, and I dug up copy of the ABI.  Looks
like gcc is doing the right thing.

"Floating-Point (32 Bits, single-precision): One word, callee cannot assume
a valid floating-point number.

Floating-Point (64 Bits, double-precision): Two words, double word aligned
(high order word in odd arg word).  This may create a void in the argument
list.  64-bit floating-point value parameters mapped to the first and second
double-words of the argument list should be passed in farg1 and farg3,
respectively. farg0 and farg2 are never used for 64-bit floating-point
parameters.  Callee cannot assume a valid floating-point number."

Makes a weird sort of sense when you realise that the register args have
a mapping to stack slots, and there are only 4x32 bits of stack space,
or 2 doubles.

Alan
