Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E60FD4847
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 05:29:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17U42Z-0005sG-00; Mon, 15 Jul 2002 12:29:19 +0100
Date: Mon, 15 Jul 2002 12:29:19 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] O_DIRECT on devices
Message-ID: <20020715122919.F27706@parcelfarce.linux.theplanet.co.uk>
References: <20020711082259.GF822@tykepenguin.com> <20020715034632.E27706@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020715074219.18CD54861@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020715074219.18CD54861@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Mon, Jul 15, 2002 at 01:42:19AM -0600
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

On Mon, Jul 15, 2002 at 01:42:19AM -0600, Grant Grundler wrote:
> Randolph and I think most SMP bugs reported (and we seen ourselves)
> suggest a D-cache problem.

Entirely plausible.  PA has bigger virtually indexed caches than anyone
else, so we're more susceptible to cache aliasing bugs than anyone else.
It could be a missing flush somewhere in the arch-independent code.

> My theory is virtual addresses are flushed on one CPU but any data 
> accessed through an aliases on another CPU are not flushed. And then
> we end up with an inconsistency.

it's certainly possible... i don't claim to understand exactly how this
works, but my recollection is that some of the flush instructions are
cpu-local whereas others are global to the system.  you'd have to ask
jsm about it, really.

> We've been reading Documentation/cachetlb.txt and trying
> to understand what it says about virtually indexed caches.

It seems pretty straightforward to me... am I missing something?

> The other thing is we don't hit the problems with PA8500 - only PA8700.
> I'm guessing the aliasing or timing is quite different betweem the two.
> Maybe someone else knows more?

8700 has bigger caches than 8500 and more TLB entries, so it may be
easier to hit problems.

-- 
Revolutions do not require corporate support.
