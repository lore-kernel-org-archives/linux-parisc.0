Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snark.thyrsus.com (snark.tuxedo.org [207.106.50.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id D54C1482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 18:37:56 -0600 (MDT)
Date: Fri, 20 Apr 2001 20:37:00 -0400
From: "Eric S. Raymond" <esr@thyrsus.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Nicolas Pitre <nico@cam.org>, Tom Rini <trini@kernel.crashing.org>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420203700.E21392@thyrsus.com>
Reply-To: esr@thyrsus.com
References: <20010420173514.A21392@thyrsus.com> <E14qjmd-0002QD-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14qjmd-0002QD-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Fri, Apr 20, 2001 at 11:53:44PM +0100
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox <alan@lxorguk.ukuu.org.uk>:
> > Even supposing that's so, a 36% rate of broken symbols is way too high. 
> > It argues that we need to do a thorough housecleaning at least once in
> > order to get back to an acceptably low stable rate.
> 
> Many of your 'broken' symbols arent. We have no idea what the real amount is

If it can't be mechanically verified that the symbol has a correct reference 
pattern within the tree, then it's broken.  That's a definition.

The fact that it might become un-broken someday, by somebody's
intention to merge in future code, is interesting but irrelevant to
the fact that symbols broken in present time *mask bugs* in present time.

I'm not being a compulsive neatnik -- that wouldn't be worth my time.  What I'm
trying to do is reduce the number of crevices in which bugs can hide.
-- 
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

This would be the best of all possible worlds, if there were
no religion in it.
	-- John Adams, in a letter to Thomas Jefferson.
