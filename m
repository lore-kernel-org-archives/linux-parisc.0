Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56CED4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Mar 2001 17:23:07 -0700 (MST)
Message-Id: <200103150022.TAA16704@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] perl-5.6.0 build problems
To: alan@linuxcare.com.au (Alan Modra)
Date: Wed, 14 Mar 2001 19:22:42 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: pjlahaie@linuxcare.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0103151027510.27636-100000@front.linuxcare.com.au> from "Alan Modra" at Mar 15, 2001 11:07:39 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Thu, 15 Mar 2001, Alan Modra wrote:
> 
> > On Wed, 14 Mar 2001, Paul J.Y. Lahaie wrote:
> > 
> > > If I use the debian build (with the patch), perl.static and perl.debug
> > > complete building, but a dynamic version crashes immediately on startup
> > > from loading libperl.so.5.6.0 with the following fault:
> > 
> > Is this with the latest fix to gcc?

Alan is correct that the LO_SUM patch is very important for pic code.

This patch probably isn't in the tree
<http://gcc.gnu.org/ml/gcc-patches/2001-03/msg00524.html>.  I found it
in pic code using long longs.  Richard Kenner recently fixed aliasing
problems affecting both pic and non pic code
<http://gcc.gnu.org/ml/gcc-patches/2001-03/msg00725.html>.  It fixed
problems with insns being incorrectly deleted.  I know there is at least
one testsuite problem left for pic code that isn't there for non pic code.
This appears at -O3, so you might try reducing your opt level.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
