Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C73F48AA
	for <parisc-linux@parisc-linux.org>;
	Thu,  8 Apr 2004 12:07:44 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i38I7Wa31431; Thu, 8 Apr 2004 14:07:32 -0400
Subject: Re: [parisc-linux] rmap: parisc __flush_dcache_page
From: James Bottomley <James.Bottomley@steeleye.com>
To: Andrea Arcangeli <andrea@suse.de>
In-Reply-To: <20040408175158.GK31667@dualathlon.random>
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
	<20040408175158.GK31667@dualathlon.random>
Content-Type: text/plain
Date: 08 Apr 2004 13:07:31 -0500
Message-Id: <1081447654.1885.430.camel@mulgrave>
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

On Thu, 2004-04-08 at 12:51, Andrea Arcangeli wrote:
> that path can take as long as timeslice to run, not taking interrupts
> for a whole scheduler timeslice is pretty bad.

OK, now I'm confused.  Where's the whole timeslice bit coming from? the
parisc flush_dcache_code better not take a timeslice to execute
otherwise we're in very serious performance trouble.

Does it take as long as a timeslice to do mmap[_shared] list insertion?

James
