Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] atomic_t 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sun, 13 Jan 2002 21:15:08 GMT." <20020113211508.V9193@parcelfarce.linux.theplanet.co.uk>
References: <20020113211508.V9193@parcelfarce.linux.theplanet.co.uk> 
Date: Sun, 13 Jan 2002 21:09:09 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020114040909.87321482A@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> Just thinking about atomic_set taking the spinlock to assure
> exclusivity...  I thought we could eliminate it.

You are only looking at interactions between atomic_set
and atomic_add_return. Aren't there potentialially other
types of interactions with other atomic operations?
But I don't know. Alan Cox?

...
> Before step b leads to case 2.  after step d leads to case 1.  between
> steps b and d, it's as if the atomic_set _never_happened_.  It results
> in v=4, a_a_r returns 4.

I agree with the analysis.

But someone thought it was time to reset the counter. And if
it "never happened", then whoever is looking for 'v == 1' will
never see it.

> The question is whether any code relies on this behaviour.  It probably
> does in some of the messier bits of networking :-(

Even if that code doesn't exist today, it might exist in the future.
I don't want to bet on corner cases with the semantics.
Those types of bugs are hard to reproduce and hard to debug.


thanks,
grant
