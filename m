Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id B63A848AA
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 12:28:24 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i38ISHa32629; Thu, 8 Apr 2004 14:28:17 -0400
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
From: James Bottomley <James.Bottomley@steeleye.com>
To: Andrea Arcangeli <andrea@suse.de>
In-Reply-To: <20040408181838.GN31667@dualathlon.random>
References: <20040408151415.GB31667@dualathlon.random>
	<1081438124.2105.207.camel@mulgrave>
	<20040408153412.GD31667@dualathlon.random>
	<1081439244.2165.236.camel@mulgrave>
	<20040408161610.GF31667@dualathlon.random>
	<1081441791.2105.295.camel@mulgrave>
	<20040408171017.GJ31667@dualathlon.random>
	<1081446226.2105.402.camel@mulgrave>
	<20040408175158.GK31667@dualathlon.random>
	<1081447654.1885.430.camel@mulgrave>
	<20040408181838.GN31667@dualathlon.random>
Content-Type: text/plain
Date: 08 Apr 2004 13:28:17 -0500
Message-Id: <1081448897.2105.465.camel@mulgrave>
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

On Thu, 2004-04-08 at 13:18, Andrea Arcangeli wrote:
> it enterely depends on the workload. On a desktop machine there may be
> only some hundred entries in those lists at maximum with glibc being the
> biggest offender:
> 
> cat /proc/*/maps | grep libc.so.6 | wc -l
> 
> with shared memory on some server there can be easily several thousand
> entries for some inode even on 64bit, but a timeslice was probably
> exaggerated (the timeslice was for the walking of the ptes in each
> mapping too, I don't think you need to look at every pte).

So you're worried about our code?  OK, if you look, you'll see we only
have to flush one address in the mmap_shared list, (which is usually the
long list).

I'd constructed it on the predicate that flushing a non-current space is
more expensive than finding a current one, but I can alter it to flush
the first vma it comes to with a present translation.

The mmap list is usually empty.  We only excite that case for multiple
private mappings of a file which for some reason gets updated.

I'd be very surprised if flush_dcache_page executes more than a few
hundred instructions all told...that's certainly nowhere close to a
timeslice.

James
