From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Unexpected behaviour of idr_get_empty_slot() on parisc
Date: Sun, 3 Jan 2010 18:50:54 -0500
Message-ID: <20100103235054.GC19179@bombadil.infradead.org>
References: <20091220234610.GG11237@jade.home> <1261354364.25157.246.camel@localhost> <20091221003500.GK11237@jade.home> <1261357334.25157.272.camel@localhost> <1262561005.2238.51.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, Ryan Niebur <ryan@debian.org>
To: Ben Hutchings <ben@decadent.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1262561005.2238.51.camel@localhost>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 03, 2010 at 11:23:25PM +0000, Ben Hutchings wrote:
> Ryan Niebur reported in <http://bugs.debian.org/561880> that on a
> PA-RISC system running Linux 2.6.32 the following test case for inotify:
> 

I bet this is because classic RCU is removed, and tree RCU was
insufficiently tested on crap platforms before the removal.

I'll try to re-add it and we can see if it's an RCU problem or something
nastier.
