From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Unexpected behaviour of idr_get_empty_slot() on parisc
Date: Mon, 18 Jan 2010 11:12:52 -0600
Message-ID: <1263834772.2773.63.camel@mulgrave.site>
References: <20091220234610.GG11237@jade.home>
	 <1261354364.25157.246.camel@localhost> <20091221003500.GK11237@jade.home>
	 <1261357334.25157.272.camel@localhost> <1262561005.2238.51.camel@localhost>
	 <20100103235054.GC19179@bombadil.infradead.org>
	 <1263572785.2842.28.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-parisc@vger.kernel.org,
	Ryan Niebur <ryan@debian.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1263572785.2842.28.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2010-01-15 at 10:26 -0600, James Bottomley wrote:
> On Sun, 2010-01-03 at 18:50 -0500, Kyle McMartin wrote:
> > On Sun, Jan 03, 2010 at 11:23:25PM +0000, Ben Hutchings wrote:
> > > Ryan Niebur reported in <http://bugs.debian.org/561880> that on a
> > > PA-RISC system running Linux 2.6.32 the following test case for inotify:
> > > 
> > 
> > I bet this is because classic RCU is removed, and tree RCU was
> > insufficiently tested on crap platforms before the removal.
> > 
> > I'll try to re-add it and we can see if it's an RCU problem or something
> > nastier.
> 
> Apparently it's a feature of kernels beyond 2.6.30 (this exact
> behaviour).  Suspect the bug report is incomplete and the i386 machine
> was running 2.6.29 or lower.
> 
> Red Hat has been getting complaints about it so they're looking to
> revert to the old 2.6.29 behaviour as well.  The actual commit that
> caused the behaviour change is
> 
> commit 63c882a05416e18de6fb59f7dd6da48f3bbe8273
> Author: Eric Paris <eparis@redhat.com>
> Date:   Thu May 21 17:02:01 2009 -0400
> 
>     inotify: reimplement inotify using fsnotify

Just to close this out, the fix (for all architectures) is now upstream:

commit 9e572cc9877ee6c43af60778f6b8d5ba0692d935
Author: Eric Paris <eparis@redhat.com>
Date:   Fri Jan 15 12:12:24 2010 -0500

    inotify: do not reuse watch descriptors

James


