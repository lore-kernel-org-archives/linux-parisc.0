Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snark.thyrsus.com (snark.tuxedo.org [207.106.50.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FAC4482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 10:51:06 -0600 (MDT)
Date: Fri, 20 Apr 2001 12:50:05 -0400
From: "Eric S. Raymond" <esr@thyrsus.com>
To: Nicolas Pitre <nico@cam.org>
Cc: Tom Rini <trini@kernel.crashing.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420125005.B8086@thyrsus.com>
Reply-To: esr@thyrsus.com
References: <20010420085148.V13403@opus.bloom.county> <Pine.LNX.4.33.0104201206250.12186-100000@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0104201206250.12186-100000@xanadu.home>; from nico@cam.org on Fri, Apr 20, 2001 at 12:35:12PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Nicolas Pitre <nico@cam.org>:
> Why not having everybody's tree consistent with themselves and have whatever
> CONFIGURE_* symbols and help text be merged along with the very code it
> refers to?  It's worthless to have config symbols be merged into Linus' or
> Alan's tree if the code isn't there (yet).  It simply makes no sense.

And now it has a cost, too.  It makes finding real bugs more difficult.
-- 
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

Every election is a sort of advance auction sale of stolen goods. 
	-- H.L. Mencken 
