Return-Path: <SRS0=KpZp=SK=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC6BC10F13
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 13:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04584213F2
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 13:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfDHNAb (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 8 Apr 2019 09:00:31 -0400
Received: from outbound-smtp03.blacknight.com ([81.17.249.16]:44646 "EHLO
        outbound-smtp03.blacknight.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725933AbfDHNAb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 8 Apr 2019 09:00:31 -0400
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Apr 2019 09:00:29 EDT
Received: from mail.blacknight.com (pemlinmail01.blacknight.ie [81.17.254.10])
        by outbound-smtp03.blacknight.com (Postfix) with ESMTPS id 15D452F807D
        for <linux-parisc@vger.kernel.org>; Mon,  8 Apr 2019 12:54:50 +0000 (UTC)
Received: (qmail 18696 invoked from network); 8 Apr 2019 12:54:50 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[37.228.225.79])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 8 Apr 2019 12:54:49 -0000
Date:   Mon, 8 Apr 2019 13:54:48 +0100
From:   Mel Gorman <mgorman@techsingularity.net>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>
Subject: Re: Memory management broken by "mm: reclaim small amounts of memory
 when an external fragmentation event occurs"
Message-ID: <20190408125448.GB18914@techsingularity.net>
References: <alpine.LRH.2.02.1904061042490.9597@file01.intranet.prod.int.rdu2.redhat.com>
 <20190408095224.GA18914@techsingularity.net>
 <alpine.LRH.2.02.1904080639570.4674@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1904080639570.4674@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, Apr 08, 2019 at 07:10:11AM -0400, Mikulas Patocka wrote:
> > First, if pa-risc is !NUMA then why are separate local ranges
> > represented as separate nodes? Is it because of DISCONTIGMEM or something
> > else? DISCONTIGMEM is before my time so I'm not familiar with it and
> 
> I'm not an expert in this area, I don't know.
> 

Ok.

> > I consider it "essentially dead" but the arch init code seems to setup
> > pgdats for each physical contiguous range so it's a possibility. The most
> > likely explanation is pa-risc does not have hardware with addressing
> > limitations smaller than the CPUs physical address limits and it's
> > possible to have more ranges than available zones but clarification would
> > be nice.  By rights, SPARSEMEM would be supported on pa-risc but that
> > would be a time-consuming and somewhat futile exercise.  Regardless of the
> > explanation, as pa-risc does not appear to support transparent hugepages,
> > an option is to special case watermark_boost_factor to be 0 on DISCONTIGMEM
> > as that commit was primarily about THP with secondary concerns around
> > SLUB. This is probably the most straight-forward solution but it'd need
> > a comment obviously. I do not know what the distro configurations for
> > pa-risc set as I'm not a user of gentoo or debian.
> 
> I use Debian Sid, but I compile my own kernel. I uploaded the kernel 
> .config here: 
> http://people.redhat.com/~mpatocka/testcases/parisc-config.txt
> 

DISCONTIGMEM is set so based on the arch init code. Glancing at the
history, it seems my assumption was accurate. Discontig used NUMA
structures for non-NUMA machines to allow code to be reused and simplify
matters.

I'll put together a patch that disables this feature on DISCONTIG as it
is surprising in the DISCONTIGMEM.

> > Second, if you set the sysctl vm.watermark_boost_factor=0, does the
> > problem go away? If so, an option would be to set this sysctl to 0 by
> > default on distros that support pa-risc. Would that be suitable?
> 
> I have tried it and the problem almost goes away. With 
> vm.watermark_boost_factor=0, if I read 2GiB data from the disk, the buffer 
> cache will contain about 1.8GiB. So, there's still some superfluous page 
> reclaim, but it is smaller.
> 

Ok, for NUMA, I would generally expect some small amounts of reclaim on
a per-node basis from kswapd waking up as the node fills. I know in your
case there is no NUMA but from a memory consumption/reclaim point of
view, it doesn't matter. There are multiple active node structures so
it's treated as such.

In the short-term, I suggest you update /etc/sysctl.conf to workaround
the issue.

> BTW. I'm interested - on real NUMA machines - is reclaiming the file cache 
> really a better option than allocating the file cache from non-local node?
> 

The patch is not related to file cache concerns, it's for long-term
viability of high-order allocations, particularly THP but also SLUB which
uses high-order allocations by default.

> 
> > Finally, I'm sure this has been asked before buy why is pa-risc alive?
> > It appears a new CPU has not been manufactured since 2005. Even Alpha
> > I can understand being semi-alive since it's an interesting case for
> > weakly-ordered memory models. pa-risc appears to be supported and active
> > for debian at least so someone cares. It's not the only feature like this
> > that is bizarrely alive but it is curious -- 32 bit NUMA support on x86,
> > I'm looking at you, your machines are all dead since the early 2000's
> > AFAIK and anyone else using NUMA on 32-bit x86 needs their head examined.
> 
> I use it to test programs for portability to risc.
> 
> If one could choose between buying an expensive power system or a cheap 
> pa-risc system, pa-risc may be a better choice. The last pa-risc model has 
> four cores at 1.1GHz, so it is not completely unuseable.

Well if it was me and I was checking portability to risc, I'd probably
get hold of a raspberry pi but we all have different ways of looking at
things.

-- 
Mel Gorman
SUSE Labs
