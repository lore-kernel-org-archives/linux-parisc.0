Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snark.thyrsus.com (snark.tuxedo.org [207.106.50.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id B39B4482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 15:36:07 -0600 (MDT)
Date: Fri, 20 Apr 2001 17:35:14 -0400
From: "Eric S. Raymond" <esr@thyrsus.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Nicolas Pitre <nico@cam.org>,
	Tom Rini <trini@kernel.crashing.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420173514.A21392@thyrsus.com>
Reply-To: esr@thyrsus.com
References: <20010420172435.A21252@thyrsus.com> <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home> <6817.987801548@redhat.com> <20010420172435.A21252@thyrsus.com> <7043.987802140@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <7043.987802140@redhat.com>; from dwmw2@infradead.org on Fri, Apr 20, 2001 at 10:29:00PM +0100
List-ID: <linux-parisc.vger.kernel.org>

David Woodhouse <dwmw2@infradead.org>:
> I'd be very surprised if the number of false positives isn't fairly stable, 
> with new ones being introduced at a similar rate to the rate at which old 
> ones finally become correct. 

Even supposing that's so, a 36% rate of broken symbols is way too high. 
It argues that we need to do a thorough housecleaning at least once in
order to get back to an acceptably low stable rate.
-- 
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

The same applies for other kinds of long-lasting low-level pain. [...]
The body's response to being jabbed, pierced, and cut is to produce
endorphins. [...]  So here's my programme for breaking that cycle of
dependency on Windows: get left arm tattooed with dragon motif, buy a
crate of Jamaican Hot! Pepper Sauce, get nipples pierced.  With any
luck that will produce enough endorphins to make Windows completely
redundant, and I can then upgrade to Linux and get on with things.
	-- Pieter Hintjens
