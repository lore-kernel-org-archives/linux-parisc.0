From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 19:51:58 +0200
Message-ID: <20040408175158.GK31667__35772.9133488194$1416623348$gmane$org@dualathlon.random>
References: <Pine.LNX.4.44.0404081500520.7116-100000@localhost.localdomain>
	<1081435237.1885.144.camel@mulgrave>
	<20040408151415.GB31667@dualathlon.random>
	<1081438124.2105.207.camel@mulgrave>
	<20040408153412.GD31667@dualathlon.random>
	<1081439244.2165.236.camel@mulgrave>
	<20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
	<20040408171017.GJ31667@dualathlon.random>
	<1081446226.2105.402.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <1081446226.2105.402.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 12:43:45PM -0500, James Bottomley wrote:
> On Thu, 2004-04-08 at 12:10, Andrea Arcangeli wrote:
> > I said above per-arch abstraction, a per-arch abstraction isn't an irq
> > safe spinlock, we cannot add an irq safe spinlock there, it'd be too bad
> > for all the common archs that don't need to walk those lists (actually
> > trees in my -aa tree) from irq context.
> 
> I think we agree on the abstraction thing.  I was more wondering what
> you thought was so costly about an irq safe spinlock as opposed to an
> ordinary one?  Is there something adding to this cost I don't know
> about?  i.e. should we be thinking about something like RCU or phased
> tree approach to walking the mapping lists?

that path can take as long as timeslice to run, not taking interrupts
for a whole scheduler timeslice is pretty bad.

Note that the data structure will become a tree soon, but a prio-tree,
walking it with RCU lockless sounds very tricky to me, but it may be
doable. For the short term I doubt you want the RCU prio-tree, I guess
you want to stabilze the kernel first with the irq safe spinlock, then
you can try to hack on the prio-tree to read it in a lockless fascion.
If you can make the reading lockless we can giveup the abstraction too,
since we can make all archs walk with lockless, but warning, freeing
vmas in rcu callbacks means freeing mm in rcu callbacks, that then means
freeing pgd in rcu callbacks, the whole mm layer will collapse on you as
soon as you try to read that tree without any locking, only the inode
will be still there as far as you've a reference on the page (and as far
as you don't use nonlinear :-/ ).
