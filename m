Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.pair.com (relay1.pair.com [209.68.1.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 2D381482A
	for <parisc-linux@parisc-linux.org>; Thu, 12 Jul 2001 12:02:48 -0600 (MDT)
Message-ID: <3B4DBBB3.9080101@subcarrier.org>
Date: Thu, 12 Jul 2001 11:01:07 -0400
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVS rumors
References: <E15Jz7i-00028D-00@noam.fc.hp.com> <20010710172502.A6103@parcelfarce.linux.theplanet.co.uk> <E15K1Iz-0002RR-00@noam.fc.hp.com>  <3B4D2AB1.5010809@subcarrier.org> <E15KiQF-0005Vh-00@noam.fc.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:


 > = Tags are cheap.  Explicitly tagging at important moments is the way to
 > = go.  Relying on a date-based checkout is potentially less accurate, so
 > = IMO this shouldn't be the common practice.  There's no harm in 
adding a
 > = static tag, and you can always remove it or possibly fix it up if you
 > = get it wrong.
 >
 > Tagging a linux source tree over the network is slow however.


True, but in the absence of a working date + branch checkout, it's a
reasonable interim solution (real solution is to fix cvs).


 > More information on date+branch CVS checkouts:  When there are multiple
 > branches, a date-based checkout must also supply a branch, implicitly
 > or explicitly, to disambiguate.  RCS has this feature
 > and it works fine (see the 'co' man page).  I can't force CVS to do it
 > though, on the trunk anyway, despite it's being built upon RCS :-(
 >
 > So the workaround for date-based checkout of our trunk is.... use RCS
 > on a copy (can be 'cp -l') of our CVS repository :-( :-(


Ugh.


 > = Where does the code for safe-cvsimport live?
 >
 > http://puffin.external.hp.com/cvs/build-tools/safe-cvsimport
 >
 > Beware -- it uses 'cvs admin -b' plus at the moment seems not to remove
 > upstream-removed files correctly.  I'm thinking of re-doing it to
 > avoid using 'cvs import' altogether -- it is in need of a rewrite.


I don't know of any way to get rid of the vendor branch taint other than
using 'cvs admin -b' or (less preferably) rcs directly.


 > = I haven't been following things enough to know what
 > = the issues related to "the vestiges of upstream imports" are.
 >
 > At least one upstream import+merge was done directly to the trunk.  So
 > changes which came with that import are unresolvable by
 > CVS during a merge and can require some sleuthing -- particularly
 > any files which were added/deleted at that time.


Ouch.  The import should have some distinct tag, and I guess using a
date tag is the best you'll get for trying to determine the state prior
to the merge (which, according to Murphy's Law, I predict overlapped
regular development).  My best advice is "don't do that then".

	- Mike.
