Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 18 Mar 2003 12:12:36 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FWD: PCI Patches update
Message-ID: <20030318191236.GA6815@dsl2.external.hp.com>
References: <20030318062233.GA21487@dsl2.external.hp.com> <20030318140637.GE14520@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030318140637.GE14520@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Mar 18, 2003 at 02:06:37PM +0000, Matthew Wilcox wrote:
> > PARISC lba_pci.c currently only advertises Distributed ranges
> > and pretends Directed ranges don't exist. Things still work,
> > but the resource accounting in /proc/iomem is inaccurate.
> 
> We can fix that!  ;-)

yes. ivan also sent me some suggestions (which I suspect are for 2.5).
But I still care more about getting 2.4 working right.

> Thanks for posting the example, it makes life much easier.  To take some
> experience from ccio-based systems, we might favour a /proc/iomem which
> ends up looking something like this:
> 
> f0000000-f0ffffff : PCI bus [10/0/]

yes - adding the HW path would be a good idea.
It would help identify which LBA/ropes are involved.
But printing the PCI bus number (in addition?) makes more sense since
I can then correlate iomem output with lspci output.


> So, how to accomplish this?  You're right it's going to be a little more
> tricky than before since we may discover overlapping ranges in any order
> and the directed range always takes priority over the distributed range.

exactly. I'm still thinking about it and my current idea is to
read all SBA ranges first and then let LBA code resolve conflicts
as attemptes to claim ranges. Ivan got me started on that:
| First, you create the set of MMIO resources for SBA which represents
| all MMIO ranges. Then you can either shrink or completely remove
| those of resources for Distributed ranges which overlap with Directed
| range to avoid resource conflicts (this seems to be ok as you says that
| the latter has precedence).

The only problem I'm still looking at is Direct Ranges are described
by three registers which *only* can be read using 64-bit reads.
Tough to do from a (strictly) PA 1.1 built kernel. Still looking
at this issue before moving on.


> Calling __request_resource() will return the address of a conflicting
> resource (if there is one).  Only snag is that it's static, but I'm
> sure no-one will scream too loudly if we unstatic it.  So if we're
> requesting a directed range, we'll tweak the existing range to move it
> out of our way.  If we're requesting a distributed range, we'll shrink
> our range to avoid colliding.  In either case, we will request again.

yes, this is a good idea. I guess I had the same idea but hadn't thought
out how to implement it.

> > [ I now see one additional bugs *sigh*: PCI-PCI bridge resources are
> > not properly accounted (4-port Tulip) card. I'll have to fix that. ]
> 
> iomem isn't a device hierarchy... it's not necessary to put _everything_
> in.  Having said that, I think it'd be kind of nice to have it.

right. /proc/iomem *is* a resource hierarchy and part of the hierarchy
is missing in the case of PCI-PCI bridge.


> Hmm.. if I remember rightly, we put a large number of gfx cards in the
> L2000 in Fort Collins once... wonder if they're still in there.

but L2000 is a PAT PDC box.  We'll get different behavior than B2600.
Unless PAT PDC supports those as boot devices, none of them will get
enabled since lba_pci.c doesn't attempt to program Directed Ranges
(aka lba_dev->elmmio).

Anyway, personally, I don't care about gfx cards working under PAT PDC.
If someone has to make it work, I'm happy to advise and review patches.

thanks,
grant
