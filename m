Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59666488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 22:49:43 -0700 (MST)
Date: Sat, 21 Feb 2004 22:49:42 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
Message-ID: <20040222054942.GD30849@colo.lackof.org>
References: <402A4CA500006EA3@ocpmta2.freegates.net>
	<20040220182140.GC11824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040220182140.GC11824@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 20, 2004 at 06:21:40PM +0000, Matthew Wilcox wrote:
> Unlikely.  As I recall, the N4k diagram looks like this:

Beautiful diagram! (I'm saving that one)
And I confirmed it is correct in case anyone had doubts.
(I did)

> So the RAM is uniformly-accessible from all CPUs, but the IO is not.

I don't think there is much penalty for CPU's to access MMIO space
on "the other side". MMIO reads are so expensive anyway, I'd doubt
it would make that much difference.

> If you look at pat_memconfig() in arch/parisc/kernel/inventory.c, you'll
> see how we try to figure out what memory ranges are in the machine.
> Want to try debugging that, see what's being reported by firmware?

I'm pretty sure it will look like this:
RAM      Phys Address
0-2GB -> 0-2GB
      -> 2-4GB I/O Space (mostly PCI MMIO)
2-4GB -> 4-6GB (courtesy of the memory controller)

The N-class was the first box which has an I/O hole from 2-4GB
physical address range. I hope Joel will be able to confirm this.
If not, I likely have documentation to confirm this.

grant
