Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53513482A
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 12:30:16 -0600 (MDT)
To: Michael Ang <mang@subcarrier.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVS rumors 
In-Reply-To: Your message of "Thu, 12 Jul 2001 11:01:07 EDT."
             <3B4DBBB3.9080101@subcarrier.org>
References: <E15Jz7i-00028D-00@noam.fc.hp.com> <20010710172502.A6103@parcelfarce.linux.theplanet.co.uk> <E15K1Iz-0002RR-00@noam.fc.hp.com> <3B4D2AB1.5010809@subcarrier.org> <E15KiQF-0005Vh-00@noam.fc.hp.com>  <3B4DBBB3.9080101@subcarrier.org> 
Date: Thu, 12 Jul 2001 12:30:13 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15KlE5-0005j2-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= True, but in the absence of a working date + branch checkout, it's a
= reasonable interim solution (real solution is to fix cvs).

There's another "solution".  date+branch checkout works on other branches
just not on the trunk :-)  One idea I propose for discussion is moving
development from the trunk to a branch so in the future we could do
date+branch checkouts.  We'll soon have 2 development branches
(2.4.x and 2.5.x) so we'll all need to learn to use a few more CVS
features anyway.

As for fixing CVS, there was no reply to my cvs bugs e-mail containing
the ultra-simple test case showing that HEAD+date checkouts don't work.

= I don't know of any way to get rid of the vendor branch taint other than
= using 'cvs admin -b' or (less preferably) rcs directly.

Unfortunately if you're actually using the CVS default branch feature,
safe-cvsimport's 'cvs admin -b' will make you unhappy :-)

The other option is to never use cvs import -- rather late for
us though there are some arguments for archiving the old repository
and reinitializing -- especially just prior to 2.5 kernels.

= Ouch.  The import should have some distinct tag, and I guess using a
= date tag is the best you'll get for trying to determine the state prior
= to the merge (which, according to Murphy's Law, I predict overlapped
= regular development).  My best advice is "don't do that then".

Fortunately by diffing against Linus' tree, willy tends to catch the
fallout from the mixed imports which we don't catch while manually
resolving merges.

	-P
