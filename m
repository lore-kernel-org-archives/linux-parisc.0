Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from onet2.cup.hp.com (onet2.cup.hp.com [15.255.208.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBA1E482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 12:57:04 -0600 (MDT)
Received: from opus.bloom.county (cpe-24-221-152-185.az.sprintbbd.net [24.221.152.185])
	by onet2.cup.hp.com (Postfix) with ESMTP id D10B218D11
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 11:57:01 -0700 (PDT)
Date: Fri, 20 Apr 2001 11:55:01 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: Nicolas Pitre <nico@cam.org>
Cc: "Eric S. Raymond" <esr@thyrsus.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420115501.A13403@opus.bloom.county>
References: <20010420112042.Z13403@opus.bloom.county> <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home>; from nico@cam.org on Fri, Apr 20, 2001 at 02:48:18PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 20, 2001 at 02:48:18PM -0400, Nicolas Pitre wrote:
> 
> 
> On Fri, 20 Apr 2001, Tom Rini wrote:
> 
> > On Fri, Apr 20, 2001 at 12:35:12PM -0400, Nicolas Pitre wrote:
> >
> > > Why not having everybody's tree consistent with themselves and have whatever
> > > CONFIGURE_* symbols and help text be merged along with the very code it
> > > refers to?  It's worthless to have config symbols be merged into Linus' or
> > > Alan's tree if the code isn't there (yet).  It simply makes no sense.
> >
> > Well, this depends a lot on a) The project to be merged (arch, mtd, whatever)
> > and b) how far something has gotten in being merged someplace else, and of
> > course c) the maintainer(s).  Whatever the exact case, and in general, it
> > should be handled via the maintainer.  Why? They maintain the code.
> 
> Therefore it's the maintainer's job to submit coherent patches and accept to
> see inconsistent CONFIG_* references be removed from the official tree until
> further patch submission is due.  It's only a question of discipline.
> Otherwise how can you distinguish between dead wood which must be removed
> and potentially valid symbols referring to code existing only in a remote
> tree?

Er, I think we agree, but I'm not sure. :)
The only people who actually know the difference between dead wood and partily
merged code are the maintainers.  IMHO it's silly to remove a piece of code
like:
#ifdef CONFIG_SOMETHING_NOT_MERGED
...
#endif
If the rest of the code, which would make the above useful is heading toward
Linus.

-- 
Tom Rini (TR1265)
http://gate.crashing.org/~trini/
