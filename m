Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5E8C4A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 13:26:04 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VfpW-00039g-00; Wed, 21 Feb 2001 13:25:42 -0700
Date: Wed, 21 Feb 2001 13:25:42 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC
Message-ID: <20010221132542.M31164@parcelfarce.linux.theplanet.co.uk>
References: <20010221115341.J31164@parcelfarce.linux.theplanet.co.uk> <200102211950.LAA17656@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102211950.LAA17656@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Feb 21, 2001 at 11:50:54AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 21, 2001 at 11:50:54AM -0800, Grant Grundler wrote:
> > But that stops 32-bit kernels on 64-bit architecture from taking advantage
> > of the optimisation.  perhaps we need some funky runtime patching...
> 
> That's evil. I'd rather introduce a CONFIG flag that says "build me
> a 32-bit kernel with PA2.0 optimizations/support". We've already made
> this tradeoff in a few other places as well.

This sounds like a good idea.  x86 has a `processor' section.  We could
select PA1.1, PA2.0 or PA2.0Wide at that point.

-- 
Revolutions do not require corporate support.
