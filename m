Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xanadu.home (modemcable084.137-200-24.mtl.mc.videotron.ca [24.200.137.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2B8E482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 12:49:48 -0600 (MDT)
Date: Fri, 20 Apr 2001 14:48:18 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Tom Rini <trini@kernel.crashing.org>
Cc: "Eric S. Raymond" <esr@thyrsus.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is
 anyone paying attention?
In-Reply-To: <20010420112042.Z13403@opus.bloom.county>
Message-ID: <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Fri, 20 Apr 2001, Tom Rini wrote:

> On Fri, Apr 20, 2001 at 12:35:12PM -0400, Nicolas Pitre wrote:
>
> > Why not having everybody's tree consistent with themselves and have whatever
> > CONFIGURE_* symbols and help text be merged along with the very code it
> > refers to?  It's worthless to have config symbols be merged into Linus' or
> > Alan's tree if the code isn't there (yet).  It simply makes no sense.
>
> Well, this depends a lot on a) The project to be merged (arch, mtd, whatever)
> and b) how far something has gotten in being merged someplace else, and of
> course c) the maintainer(s).  Whatever the exact case, and in general, it
> should be handled via the maintainer.  Why? They maintain the code.

Therefore it's the maintainer's job to submit coherent patches and accept to
see inconsistent CONFIG_* references be removed from the official tree until
further patch submission is due.  It's only a question of discipline.
Otherwise how can you distinguish between dead wood which must be removed
and potentially valid symbols referring to code existing only in a remote
tree?


Nicolas
