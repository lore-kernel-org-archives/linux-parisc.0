From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 21:02:35 +0200
Message-ID: <20040408190235.GR31667__12630.3940233358$1416623351$gmane$org@dualathlon.random>
References: <20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
	<20040408171017.GJ31667@dualathlon.random>
	<1081446226.2105.402.camel@mulgrave>
	<20040408175158.GK31667@dualathlon.random>
	<1081447654.1885.430.camel@mulgrave>
	<20040408181838.GN31667@dualathlon.random>
	<1081448897.2105.465.camel@mulgrave>
	<20040408184245.GO31667@dualathlon.random>
	<1081450196.1885.492.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <1081450196.1885.492.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 01:49:55PM -0500, James Bottomley wrote:
> Yes, I'll go for that.  The write need only be done on vma insert, which
> should be very fast.  So do we agree this is a generic solution, or were
> you still thinking of trying to abstract it per-arch?

I'm unsure, the semaphore simplifies a lot the need_resched() in the
vmtruncate/zap_pte path, plus it avoids to waste time in the other cpus
while vmtruncate it working on it (potentially for more than a timeslice).

btw, I already considered making the semaphore a rw semaphore (note not
a rwspinlock) to boost scalability of the paging too, but OTOH the
paging has a so small critical section under the lock (objrmap) that I
wasn't sure if it would payoff, the biggest cost will still be the
bouncing of the cacheline, so I desisted from the idea of making it a
rwsem and I thought the semaphore was ideal as Andrew told me a few days
before I had the rwsem idea.  Plus concurrent truncate aren't worth
optimizing since they're serialized from the i_sem in the first place.

Ideally it should be a semaphore for all archs but the ones who needs
to walk it from irqs that wants a rw_spinlock.
