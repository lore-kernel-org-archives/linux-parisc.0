Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FE51482B
	for <parisc-linux@parisc-linux.org>; Sun, 13 Jan 2002 21:43:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16PyyA-0000vC-00; Mon, 14 Jan 2002 04:43:38 +0000
Date: Mon, 14 Jan 2002 04:43:37 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] atomic_t
Message-ID: <20020114044337.B9193@parcelfarce.linux.theplanet.co.uk>
References: <20020113211508.V9193@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020114040909.87321482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020114040909.87321482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sun, Jan 13, 2002 at 09:09:09PM -0700
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Jan 13, 2002 at 09:09:09PM -0700, Grant Grundler wrote:
> You are only looking at interactions between atomic_set
> and atomic_add_return. Aren't there potentialially other
> types of interactions with other atomic operations?
> But I don't know. Alan Cox?

Not on PA... look at <asm/atomic.h>.  There's only 3 primitives, all
other atomic ops are defined in terms of those.

> > Before step b leads to case 2.  after step d leads to case 1.  between
> > steps b and d, it's as if the atomic_set _never_happened_.  It results
> > in v=4, a_a_r returns 4.
> 
> I agree with the analysis.
> 
> But someone thought it was time to reset the counter. And if
> it "never happened", then whoever is looking for 'v == 1' will
> never see it.

It's a race though; they can't guarantee to see it anyway.

> Even if that code doesn't exist today, it might exist in the future.
> I don't want to bet on corner cases with the semantics.
> Those types of bugs are hard to reproduce and hard to debug.

yeah, wasn't planning on committing.

-- 
Revolutions do not require corporate support.
