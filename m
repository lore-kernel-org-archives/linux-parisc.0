Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id E71F5482A
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 09:30:42 -0600 (MDT)
To: Michael Ang <mang@subcarrier.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVS rumors 
In-Reply-To: Your message of "Thu, 12 Jul 2001 00:42:25 EDT."
             <3B4D2AB1.5010809@subcarrier.org>
References: <E15Jz7i-00028D-00@noam.fc.hp.com> <20010710172502.A6103@parcelfarce.linux.theplanet.co.uk> <E15K1Iz-0002RR-00@noam.fc.hp.com>  <3B4D2AB1.5010809@subcarrier.org> 
Date: Thu, 12 Jul 2001 09:30:35 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15KiQF-0005Vh-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > CM best practices usually involve explicitly tagging any release one
= > hopes to reproduce in the future and we could start doing that (I recommend
= > it).  For now either we apply the aforementioned workaround so we can
= > do untagged date-based checkouts, or I can come up with a procedure for
= > grabbing a suitable set of bits.
= 
= Tags are cheap.  Explicitly tagging at important moments is the way to 
= go.  Relying on a date-based checkout is potentially less accurate, so 
= IMO this shouldn't be the common practice.  There's no harm in adding a 
= static tag, and you can always remove it or possibly fix it up if you 
= get it wrong.

Tagging a linux source tree over the network is slow however.

More information on date+branch CVS checkouts:  When there are multiple
branches, a date-based checkout must also supply a branch, implicitly
or explicitly, to disambiguate.  RCS has this feature
and it works fine (see the 'co' man page).  I can't force CVS to do it
though, on the trunk anyway, despite it's being built upon RCS :-(

So the workaround for date-based checkout of our trunk is.... use RCS
on a copy (can be 'cp -l') of our CVS repository :-( :-(

= Writing an import script was one of those things I always meant to do in 
= my copious spare time.  I'm glad to see that someone is actually doing 
= the work :)  Where does the code for safe-cvsimport live?

http://puffin.external.hp.com/cvs/build-tools/safe-cvsimport

Beware -- it uses 'cvs admin -b' plus at the moment seems not to remove
upstream-removed files correctly.  I'm thinking of re-doing it to
avoid using 'cvs import' altogether -- it is in need of a rewrite.

= I'd avoid using the term "vendor branch", since that already has a 
= specific meaning to savvy CVS users (who will rightly criticize their 
= use).  Calling it something like the "upstream branch" would avoid the 
= overloaded meaning.

Good idea.

= I haven't been following things enough to know what 
= the issues related to "the vestiges of upstream imports" are.

At least one upstream import+merge was done directly to the trunk.  So
changes which came with that import are unresolvable by
CVS during a merge and can require some sleuthing -- particularly
any files which were added/deleted at that time.

	-P
