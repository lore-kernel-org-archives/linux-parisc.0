Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snark.thyrsus.com (snark.tuxedo.org [207.106.50.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D9F2482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 15:25:34 -0600 (MDT)
Date: Fri, 20 Apr 2001 17:24:35 -0400
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
Message-ID: <20010420172435.A21252@thyrsus.com>
Reply-To: esr@thyrsus.com
References: <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home> <6817.987801548@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6817.987801548@redhat.com>; from dwmw2@infradead.org on Fri, Apr 20, 2001 at 10:19:08PM +0100
List-ID: <linux-parisc.vger.kernel.org>

David Woodhouse <dwmw2@infradead.org>:
> > Otherwise how can you distinguish between dead wood which must be
> > removed and potentially valid symbols referring to code existing only
> > in a remote tree?
> 
> By periodically publishing a list of the potentially-obsolete symbols as ESR
> has done, and _not_ removing the ones which people speak up about. It's not
> as if this is something which needs to be done more than about once a year.

Not good enough.  In a year, the pile of false positives would get high enough
to make it too hard to spot real bugs like the Aironet mismatch.  The whole 
point of the cleanup is to be able to mechanize the consistency checks so they
require a minimum of human judgment.
-- 
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

"This country, with its institutions, belongs to the people who
inhabit it. Whenever they shall grow weary of the existing government,
they can exercise their constitutional right of amending it or their
revolutionary right to dismember it or overthrow it."
	-- Abraham Lincoln, 4 April 1861
