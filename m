Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9F934F58
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 09:47:27 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i38FlOa22961; Thu, 8 Apr 2004 11:47:24 -0400
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
From: James Bottomley <James.Bottomley@steeleye.com>
To: Andrea Arcangeli <andrea@suse.de>
In-Reply-To: <20040408153412.GD31667@dualathlon.random>
References: <Pine.LNX.4.44.0404081500520.7116-100000@localhost.localdomain>
	<1081435237.1885.144.camel@mulgrave>
	<20040408151415.GB31667@dualathlon.random>
	<1081438124.2105.207.camel@mulgrave>
	<20040408153412.GD31667@dualathlon.random>
Content-Type: text/plain
Date: 08 Apr 2004 10:47:23 -0500
Message-Id: <1081439244.2165.236.camel@mulgrave>
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

On Thu, 2004-04-08 at 10:34, Andrea Arcangeli wrote:
> yes, the spinlock in struct address_space would be enough, and that's
> what 2.4 does too, Andrew changed it to a semaphore in 2.6 but it can be
> made a spinlock again. Then you can fix it (as far as you never call it
> from an irq and as far as you don't generate exceptions inside the
> critical section, but I'm sure you don't).

Well, yes, of course we do.  We're a sofware tlb arch, so we generate
exceptions on tlb misses, which can occur anywhere (even in critical
sections).  However, the exceptions are carefully crafted not to take
spinlocks, so everything should be safe.

I'm not sure about the no in irq assertion.  The biggest use of
flush_dcache_page is on the I/O return path ... that looks like a good
candidate for being in interrupt (even though most drivers should be
offloading to softirq/tasklets).

James
