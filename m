From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 19:10:17 +0200
Message-ID: <20040408171017.GJ31667__35149.3909991861$1416623348$gmane$org@dualathlon.random>
References: <Pine.LNX.4.44.0404081500520.7116-100000@localhost.localdomain>
	<1081435237.1885.144.camel@mulgrave>
	<20040408151415.GB31667@dualathlon.random>
	<1081438124.2105.207.camel@mulgrave>
	<20040408153412.GD31667@dualathlon.random>
	<1081439244.2165.236.camel@mulgrave>
	<20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <1081441791.2105.295.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 11:29:50AM -0500, James Bottomley wrote:
> On Thu, 2004-04-08 at 11:16, Andrea Arcangeli wrote:
> > softirq tasklets would be unsafe too, oh well, if you take it really
> > from irq context (irq/softirq/tasklet) then just a spinlock isn't
> > enough, it'd need to be an irq safe lock or whatever similar plus you
> > must be sure to never generate exceptions triggering the call inside the
> > critical section. sounds like we need some per-arch abstraction to cover
		      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > this, we for sure don't want an irq spinlock for this, then we can as
> > well leave the semaphore for all archs but parisc.
> 
> Erm, well, I think this is a global problem.  All VI archs have to use
> the flush_ APIs in cachetlb.txt to ensure coherence.  It's just that
> sparc seems to have some nice cache manipulation instructions that
> relieve it of the necessity of traversing the mappings.
> 
> Why don't we want an irq safe spinlock?  As Hugh said, we'd abstract it
> so as to be a nop on PI archs.

I said above per-arch abstraction, a per-arch abstraction isn't an irq
safe spinlock, we cannot add an irq safe spinlock there, it'd be too bad
for all the common archs that don't need to walk those lists (actually
trees in my -aa tree) from irq context.

if you implement the locking abstraction with an irq safe spinlock it's
your own business then.
