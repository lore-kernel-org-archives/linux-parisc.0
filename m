Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from passion.cambridge.redhat.com (dell-paw-3.cambridge.redhat.com [195.224.55.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0208E482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 15:24:05 -0600 (MDT)
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home> 
References: <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: Tom Rini <trini@kernel.crashing.org>,
	"Eric S. Raymond" <esr@thyrsus.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Apr 2001 22:19:08 +0100
Message-ID: <6817.987801548@redhat.com>
Sender: David Woodhouse <dwmw2@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>

nico@cam.org said:
> Therefore it's the maintainer's job to submit coherent patches and
> accept to see inconsistent CONFIG_* references be removed from the
> official tree until further patch submission is due. 

Maybe. But you tend to include the latest MTD code in your tree, for
example, and hence the defconfigs have the new options in. Is it really
worth your time to produce separate defconfigs without it before feeding 
your changes upstream?


> Otherwise how can you distinguish between dead wood which must be
> removed and potentially valid symbols referring to code existing only
> in a remote tree?

By periodically publishing a list of the potentially-obsolete symbols as ESR
has done, and _not_ removing the ones which people speak up about. It's not
as if this is something which needs to be done more than about once a year.

--
dwmw2
