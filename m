Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snark.thyrsus.com (snark.tuxedo.org [207.106.50.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6383D482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 07:19:07 -0600 (MDT)
Date: Fri, 20 Apr 2001 09:18:34 -0400
From: "Eric S. Raymond" <esr@thyrsus.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <willy@ldl.fc.hp.com>,
	linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420091834.A5102@thyrsus.com>
Reply-To: esr@thyrsus.com
References: <20010419230009.A32500@thyrsus.com> <E14qaeC-0001DZ-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14qaeC-0001DZ-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Fri, Apr 20, 2001 at 02:08:25PM +0100
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox <alan@lxorguk.ukuu.org.uk>:
> > What is the right procedure for doing changes like this?  Is "don't
> > touch that tree" a permanent condition, or am I going to get a chance
> > to clean up the global CONFIG_ namespace after your next merge-down?
> 
> Feeding arch related stuff to the architecture maintainers.

I shall attempt it.

> > That's the main thing I'm after right now -- I want to cut down on
> > the false positives in my orphaned-symbol reports so that the actual
> > bugs will stand out.
> 
> Teach it to read a 'symbolstoignore' file.

Someone else has already pointed out that this is not a solution that will
scale well.  It would substitute a continuing management headache for the
cleanup that's really needed.  In fact I'm reluctant to do this even for 
cases where it's clearly legitimate (CONFIG_BOOM, CONFIG_BOGUS :-)) partly
because later on it might provide an excuse for people not to do the cleanup.

> Part of the problem you are hitting right now is that most
> architectures are not yet fully in sync with 2.4 nor likely to all
> be for another few iterations.

Understood.  I'll do what I can in the architecture-independent code, then.
-- 
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

"Boys who own legal firearms have much lower rates of delinquency and
drug use and are even slightly less delinquent than nonowners of guns."
	-- U.S. Department of Justice, National Institute of
	   Justice, Office of Juvenile Justice and Delinquency Prevention,
	   NCJ-143454, "Urban Delinquency and Substance Abuse," August 1995.
