Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snark.thyrsus.com (snark.tuxedo.org [207.106.50.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id D719D482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 08:59:17 -0600 (MDT)
Date: Fri, 20 Apr 2001 10:59:34 -0400
From: "Eric S. Raymond" <esr@thyrsus.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: "Albert D. Cahalan" <acahalan@cs.uml.edu>,
	Matthew Wilcox <willy@ldl.fc.hp.com>,
	james rich <james.rich@m.cc.utah.edu>, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
Message-ID: <20010420105934.A6668@thyrsus.com>
Reply-To: esr@thyrsus.com
References: <20010420101951.A6011@thyrsus.com> <E14qc9E-0001PW-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14qc9E-0001PW-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Fri, Apr 20, 2001 at 03:44:34PM +0100
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox <alan@lxorguk.ukuu.org.uk>:
> > well, though.  One is the kind I'm bumping into right now, where
> > somebody legitimately needs to make small (almost trivial) changes
> > scattered all through the tree.
> 
> Yep. But such changes are rare. Or should be. 

Knowing that doesn't help me much, since I'm trying to fix up a global
namespace that touches everybody :-(.
 
> If I get patches for stuff that doesnt seem to have a maintainer I
> apply them.  On the odd occasion a scream is heard in the distance
> it means I now know there is an active maintainer.

All right then.  I'm going to send you a bunch of dead-symbol cleanup
patches.  I'll try to stay in the mainline code and out of the port
trees.  Would you please do me the kindness of telling me which ones
can go in and which ones you think have to go through maintainers?

You should have received one such patch already, fixes for two
documentation files.
-- 
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

Sometimes the law defends plunder and participates in it. Sometimes
the law places the whole apparatus of judges, police, prisons and
gendarmes at the service of the plunderers, and treats the victim --
when he defends himself -- as a criminal.
	-- Frederic Bastiat, "The Law"
