Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.bloom.county (cpe-24-221-152-185.az.sprintbbd.net [24.221.152.185])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7EDF482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 12:22:47 -0600 (MDT)
Date: Fri, 20 Apr 2001 11:20:42 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: Nicolas Pitre <nico@cam.org>
Cc: "Eric S. Raymond" <esr@thyrsus.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420112042.Z13403@opus.bloom.county>
References: <20010420085148.V13403@opus.bloom.county> <Pine.LNX.4.33.0104201206250.12186-100000@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0104201206250.12186-100000@xanadu.home>; from nico@cam.org on Fri, Apr 20, 2001 at 12:35:12PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 20, 2001 at 12:35:12PM -0400, Nicolas Pitre wrote:

> There is kind of a ridiculous situation here where people want to withhold
> their own changes in their own trees for all good reasons until it is mature
> and stable enough to be fed upstream in the appropriate way, while insisting
> for Linus' tree to remain incomplete and inconsistent.  And we're not
> talking about deep architectural changes here -- only about configure
> symbols and help text.

The answer is simple, noise.

> Why not having everybody's tree consistent with themselves and have whatever
> CONFIGURE_* symbols and help text be merged along with the very code it
> refers to?  It's worthless to have config symbols be merged into Linus' or
> Alan's tree if the code isn't there (yet).  It simply makes no sense.

Well, this depends a lot on a) The project to be merged (arch, mtd, whatever)
and b) how far something has gotten in being merged someplace else, and of
course c) the maintainer(s).  Whatever the exact case, and in general, it 
should be handled via the maintainer.  Why? They maintain the code.

-- 
Tom Rini (TR1265)
http://gate.crashing.org/~trini/
