From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
Date: Thu, 8 Apr 2004 20:42:45 +0200
Message-ID: <20040408184245.GO31667__31598.300956148$1416623350$gmane$org@dualathlon.random>
References: <20040408153412.GD31667@dualathlon.random>
	<1081439244.2165.236.camel@mulgrave>
	<20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
	<20040408171017.GJ31667@dualathlon.random>
	<1081446226.2105.402.camel@mulgrave>
	<20040408175158.GK31667@dualathlon.random>
	<1081447654.1885.430.camel@mulgrave>
	<20040408181838.GN31667@dualathlon.random>
	<1081448897.2105.465.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <andrea@suse.de>
In-Reply-To: <1081448897.2105.465.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 08, 2004 at 01:28:17PM -0500, James Bottomley wrote:
> So you're worried about our code?  OK, if you look, you'll see we only
> have to flush one address in the mmap_shared list, (which is usually the
> long list).

if you need to flush just one address, the prio-tree may give you an
huge boost, overall flush_dcache_page should become pretty quick in most
situations.

> I'd be very surprised if flush_dcache_page executes more than a few
> hundred instructions all told...that's certainly nowhere close to a
> timeslice.

What you miss is that the problem is not in flush_dcache_page, the
problem is that the _other_ users of the prio-tree may take as long as a
timeslice. So it's the _other_ user that you've no control about (i.e.
truncate) that may take timeslices with irq disabled.

But I've an fairly optimal solution for you, you should make it a
read_write spinlock, with the readers not disabling interrupts, and the
writer disabling interrupts, the writer of the prio-tree will not take a
timeslice, the readers instead will take a timeslice, but since they're
readers and you've only to read in the flush_dcache_page irq context,
you don't need to disable irqs for the readers.  I don't have better
solutions than this one at the moment (yeah there's the rcu reading of
the prio-tree but I'd leave it for later...)
