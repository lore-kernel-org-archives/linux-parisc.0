Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from passion.cambridge.redhat.com (dell-paw-3.cambridge.redhat.com [195.224.55.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35450482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 15:40:48 -0600 (MDT)
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010420173514.A21392@thyrsus.com> 
References: <20010420173514.A21392@thyrsus.com>  <20010420172435.A21252@thyrsus.com> <Pine.LNX.4.33.0104201440580.12186-100000@xanadu.home> <6817.987801548@redhat.com> <20010420172435.A21252@thyrsus.com> <7043.987802140@redhat.com> 
To: esr@thyrsus.com
Cc: Nicolas Pitre <nico@cam.org>,
	Tom Rini <trini@kernel.crashing.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	"Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>,
	lkml <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Apr 2001 22:39:24 +0100
Message-ID: <7261.987802764@redhat.com>
Sender: David Woodhouse <dwmw2@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>


esr@thyrsus.com said:
>  Even supposing that's so, a 36% rate of broken symbols is way too
> high.  It argues that we need to do a thorough housecleaning at least
> once in order to get back to an acceptably low stable rate.

Accepted. Can we let the 2.4 "angry penguin"-enforced stabilising period
finish, and give the arch and subsystem maintainers a chance to finally
brave the wrath of Linus and submit their patches, before we attempt do to
it though?

--
dwmw2
