Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id A68924A7D
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 12:50:08 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i38Inua01422; Thu, 8 Apr 2004 14:49:56 -0400
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
From: James Bottomley <James.Bottomley@steeleye.com>
To: Andrea Arcangeli <andrea@suse.de>
In-Reply-To: <20040408184245.GO31667@dualathlon.random>
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
	<20040408184245.GO31667@dualathlon.random>
Content-Type: text/plain
Date: 08 Apr 2004 13:49:55 -0500
Message-Id: <1081450196.1885.492.camel@mulgrave>
Mime-Version: 1.0
Cc: Hugh Dickins <hugh@veritas.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 2004-04-08 at 13:42, Andrea Arcangeli wrote:
> What you miss is that the problem is not in flush_dcache_page, the
> problem is that the _other_ users of the prio-tree may take as long as a
> timeslice. So it's the _other_ user that you've no control about (i.e.
> truncate) that may take timeslices with irq disabled.

So the problem isn't in the parisc code, it's in the generic vm code,
OK.

> But I've an fairly optimal solution for you, you should make it a
> read_write spinlock, with the readers not disabling interrupts, and the
> writer disabling interrupts, the writer of the prio-tree will not take a
> timeslice, the readers instead will take a timeslice, but since they're
> readers and you've only to read in the flush_dcache_page irq context,
> you don't need to disable irqs for the readers.  I don't have better
> solutions than this one at the moment (yeah there's the rcu reading of
> the prio-tree but I'd leave it for later...)

Yes, I'll go for that.  The write need only be done on vma insert, which
should be very fast.  So do we agree this is a generic solution, or were
you still thinking of trying to abstract it per-arch?

James
