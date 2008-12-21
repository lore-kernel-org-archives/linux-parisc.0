From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 17:11:11 -0500 (EST)
Message-ID: <20081221221111.EADEE4F19@hiauly1.hia.nrc.ca>
References: <20081221213303.GE12880@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, deller@gmx.de, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221213303.GE12880@bombadil.infradead.org> from "Kyle McMartin" at Dec 21, 2008 04:33:03 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Dec 21, 2008 at 12:27:42PM -0500, John David Anglin wrote:
> > > I think the bug may be in flush_user_cache_page_non_current.  It hijacks
> > > sr3 temporarily and I don't think cr8 is updated when this is done.  The
> > > switch may need to be atomic.
> > 
> > The following might fix the protection ID bug.
> > 
> 
> I'm not convinced... this doesn't explain why we don't see this on
> 64-bit...

Agreed.  However, we do have tlb issues on 64-bit and this is just about
the only place where sr3 is messed with and cr8 isn't correctly set.
I'm sure the bug is somewhat timing dependent.

There has to be something else that causes a userspace access
with inconsistent space and protection IDs.  The cache flush can cause
non access tlb misses, and there is some difference in tlb hardware,
but cr8 isn't involved in the tlb miss handling as far as I can see.

I'm running with the patch on 2.6.28-rc8 (SMP) and 2.6.22.19 (UP).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
