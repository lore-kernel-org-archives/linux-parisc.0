Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA431482B
	for <parisc-linux@parisc-linux.org>; Tue, 10 Jul 2001 11:28:18 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVS rumors 
In-Reply-To: Your message of "Tue, 10 Jul 2001 17:25:02 BST."
             <20010710172502.A6103@parcelfarce.linux.theplanet.co.uk>
References: <E15Jz7i-00028D-00@noam.fc.hp.com>  <20010710172502.A6103@parcelfarce.linux.theplanet.co.uk> 
Date: Tue, 10 Jul 2001 11:28:13 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15K1Iz-0002RR-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > 	cvs up -D"some-date" -rHEAD
= 
= The manpage doesn't indicate this is a valid use; indeed the wording
= in some cases indicates that -D and -r are exclusive!

yeah go figure :-(  semantically though, a date-based checkout must
add a branch for disambiguation, and except in this (frequent for us)
case it works.

= > 	cvs up -D"some-date"
= > 
= > That grabs the files as of "some-date" from whatever arbitrary branch
= > they happen to be on -- thus you get some mixture of all the branches!
= 
= Yes, I noticed that.  But we have a real problem now, and I don't know how
= to solve it.  Lamont wanted to check out version -pa30 -- how can he do that?

CM best practices usually involve explicitly tagging any release one
hopes to reproduce in the future and we could start doing that (I recommend
it).  For now either we apply the aforementioned workaround so we can
do untagged date-based checkouts, or I can come up with a procedure for
grabbing a suitable set of bits.

= > This problem is caused by 'cvs import' and has nothing to do with
= > CVS branches per se.
= > 
= > The way to cause REALLY BIG problems with vendor branches is to use them
= > for some upstream updates, but merge others by hand on to the trunk.  This
= > cuts the CVS design off at the knees!  We did this in our linux tree way
= > back and the number of problems is going down but isn't gone yet.
= 
= I don't understand why we're using vendor branches at all though.  When
= mang was doing CVS God duties, he imported Linus' stuff on an ordinary
= branch.  What is the advantage of using vendor branches over ordinary ones?

Vendor branches are both a concept and an implementation.  The
implementation sucks but the concept -- keeping clean upstream releases
on a separate branch -- to me is a good one and is one of the things
CVS does quite well.

safe-cvsimport essentially doesn't use the vendor branch *implementation*
(aka, how 'cvs import' would do it) but it does use the vendor branch
*concept*.  So safe-cvsimport is attempting to automate what mang did
by hand.

As it happens, there were corner cases which 'cvs import'
actually handled correctly which doing the same thing by hand on a branch
handled incorrectly, and that's the main difference between maintaining
an upstream vendor branch "by hand", and using safe-cvsimport.  I'm
considering rewriting safe-cvsimport to avoid 'cvs import' and live
with the unlikely corner case.

= > For now I'll be
= > happy to consult and/or fix problems which result from safe-cvsimport.
= 
= No offence, but every time we've done a new import, we've discovered new
= and excitingly different problems which have taken some time to be fixed.

So every time you've been aware of an import it has been problematic.  Maybe
you forgot a linux import *and merge* which I managed in a few hours?
I think perhaps there was a very quick glibc update too.  Maybe
you are unaware of the many times more imports I've done in other places
which are usually 100% successful?

When there are problems they require the same sorts of skills and repairs
as would "by hand" imports on the branch, though
usually I take a bit longer because I want to understand and fix the
problem rather than merely fixing the symptom.  I suspect the time spent
fixing safe-cvsimport and archive confusions is not "extra", but merely
seems/looks different partly because of the expectation that safe-cvsimport
*should* do all the right stuff automatically in a few minutes, in contrast
to the expectation that doing things by hand on a branch is a considerably
longer and more arduous task.

= I'm extremely nervous about using it while you're gone.

In the linux tree I echo your concern and there's really no way to be
rid of the vestiges of upstream imports which came into the trunk unless
we reinitialize our archive.  That plus the current brokenness of not
removing files which were removed upstream makes me think that
unless I do future imports, they might better be done "by
hand" on the "linus" branch, which I call a vendor branch though it
is not a cvs-style-broken-vendor-branch any longer.

	-P
