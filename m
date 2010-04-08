From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Thu, 8 Apr 2010 18:44:45 -0400 (EDT)
Message-ID: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, gniibe@fsij.org, linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100408215453.GA18445@hiauly1.hia.nrc.ca> from "John David Anglin" at Apr 8, 2010 05:54:54 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Thu, 08 Apr 2010, Helge Deller wrote:

> > I tested your patch today on one of my machines with plain kernel 2.6.33 (32bit, SMP, B2000 I think).
> > Sadly I still did see the minifail bug.
> > 
> > Are you sure, that the patch fixed this bug for you?
> 
> Seemed to, but I have a bunch of other changes installed.  Possibly,
> the change to cacheflush.h is important.  It affects all PA8000.

I also think the change suggested by James

+       if (pte_dirty(old_pte))

is important for SMP.  With the patch set that I sent, my rp3440 and
gsyprf11 seem reasonably stable running 2.6.33.2 SMP.  I doubt all
problems are solved but things are a lot better than before.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
