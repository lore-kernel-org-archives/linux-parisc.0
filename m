Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.pair.com (relay1.pair.com [209.68.1.20])
	by dsl2.external.hp.com (Postfix) with SMTP id A8C6D482A
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 01:44:02 -0600 (MDT)
Message-ID: <3B4D2AB1.5010809@subcarrier.org>
Date: Thu, 12 Jul 2001 00:42:25 -0400
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVS rumors
References: <E15Jz7i-00028D-00@noam.fc.hp.com>  <20010710172502.A6103@parcelfarce.linux.theplanet.co.uk> <E15K1Iz-0002RR-00@noam.fc.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:

>
> CM best practices usually involve explicitly tagging any release one
> hopes to reproduce in the future and we could start doing that (I recommend
> it).  For now either we apply the aforementioned workaround so we can
> do untagged date-based checkouts, or I can come up with a procedure for
> grabbing a suitable set of bits.


Tags are cheap.  Explicitly tagging at important moments is the way to 
go.  Relying on a date-based checkout is potentially less accurate, so 
IMO this shouldn't be the common practice.  There's no harm in adding a 
static tag, and you can always remove it or possibly fix it up if you 
get it wrong.


> = I don't understand why we're using vendor branches at all though.  When
> = mang was doing CVS God duties, he imported Linus' stuff on an ordinary
> = branch.  What is the advantage of using vendor branches over ordinary ones?
> 
> Vendor branches are both a concept and an implementation.  The
> implementation sucks but the concept -- keeping clean upstream releases
> on a separate branch -- to me is a good one and is one of the things
> CVS does quite well.
> 
> safe-cvsimport essentially doesn't use the vendor branch *implementation*
> (aka, how 'cvs import' would do it) but it does use the vendor branch
> *concept*.  So safe-cvsimport is attempting to automate what mang did
> by hand.


Writing an import script was one of those things I always meant to do in 
my copious spare time.  I'm glad to see that someone is actually doing 
the work :)  Where does the code for safe-cvsimport live?


> = > For now I'll be
> = > happy to consult and/or fix problems which result from safe-cvsimport.
> = 
> = No offence, but every time we've done a new import, we've discovered new
> = and excitingly different problems which have taken some time to be fixed.


All the more reason to roll the solutions found to these problems into a 
script.  Proper importing by hand is rather tedious and prone to 
operator error.  Also, any extra time spent fully understanding the 
problems and finding a robust solution will be regained over the 
following merges or if the cvs wrangler moves on to a different project 
-- hypothetically, of course ;)

> = I'm extremely nervous about using it while you're gone.
> 
> In the linux tree I echo your concern and there's really no way to be
> rid of the vestiges of upstream imports which came into the trunk unless
> we reinitialize our archive.  That plus the current brokenness of not
> removing files which were removed upstream makes me think that
> unless I do future imports, they might better be done "by
> hand" on the "linus" branch, which I call a vendor branch though it
> is not a cvs-style-broken-vendor-branch any longer.


I'd avoid using the term "vendor branch", since that already has a 
specific meaning to savvy CVS users (who will rightly criticize their 
use).  Calling it something like the "upstream branch" would avoid the 
overloaded meaning.  I haven't been following things enough to know what 
the issues related to "the vestiges of upstream imports" are.

	- Mike.
