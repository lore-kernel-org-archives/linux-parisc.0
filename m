Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snark.thyrsus.com (snark.tuxedo.org [207.106.50.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CF7D482A
	for <parisc-linux@parisc-linux.org>; Thu, 19 Apr 2001 21:00:27 -0600 (MDT)
Date: Thu, 19 Apr 2001 23:00:09 -0400
From: "Eric S. Raymond" <esr@thyrsus.com>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Message-ID: <20010419230009.A32500@thyrsus.com>
Reply-To: esr@thyrsus.com
References: <20010419203639.H4217@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010419203639.H4217@zumpano.fc.hp.com>; from willy@ldl.fc.hp.com on Thu, Apr 19, 2001 at 08:36:39PM -0600
Sender: esr@snark.thyrsus.com
Subject: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox <willy@ldl.fc.hp.com>:
> On Thu, Apr 19, 2001 at 18:50:34 EDT, Eric S. Raymond wrote:
> > Remove dead CONFIG_BINFMT_JAVA symbol.
> 
> Please don't do this, it just makes merging our patches with Linus harder.

Bother.  I've now heard "don't touch that tree!" from you and the ARM
folks.  I'm trying to be a good neighbor, here, but there is some
cleanup I want to do that crosses port boundaries.  (None of this is CML2,
BTW; I'm now addressing problems that are common to CML1 as well.)

What is the right procedure for doing changes like this?  Is "don't
touch that tree" a permanent condition, or am I going to get a chance
to clean up the global CONFIG_ namespace after your next merge-down?

Could I ask you to audit your tree and change the prefix on any 
CONFIG_ symbols that are private over there?  This would make life 
easier for my auditing tools (kxref and Stephen Cole's ach script).

That's the main thing I'm after right now -- I want to cut down on
the false positives in my orphaned-symbol reports so that the actual
bugs will stand out.
-- 
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

"They that can give up essential liberty to obtain a little temporary 
safety deserve neither liberty nor safety."
	-- Benjamin Franklin, Historical Review of Pennsylvania, 1759.
