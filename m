Return-Path: <SRS0=KpZp=SK=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E9DC282CE
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 09:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC9D420883
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 09:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfDHJ6T (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:58:19 -0400
Received: from outbound-smtp14.blacknight.com ([46.22.139.231]:56869 "EHLO
        outbound-smtp14.blacknight.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726510AbfDHJ6T (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 8 Apr 2019 05:58:19 -0400
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Apr 2019 05:58:17 EDT
Received: from mail.blacknight.com (unknown [81.17.254.10])
        by outbound-smtp14.blacknight.com (Postfix) with ESMTPS id C50281C3291
        for <linux-parisc@vger.kernel.org>; Mon,  8 Apr 2019 10:52:28 +0100 (IST)
Received: (qmail 31562 invoked from network); 8 Apr 2019 09:52:28 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[37.228.225.79])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 8 Apr 2019 09:52:28 -0000
Date:   Mon, 8 Apr 2019 10:52:24 +0100
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
Message-ID: <20190408095224.GA18914@techsingularity.net>
References: <alpine.LRH.2.02.1904061042490.9597@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1904061042490.9597@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, Apr 06, 2019 at 11:20:35AM -0400, Mikulas Patocka wrote:
> Hi
> 
> The patch 1c30844d2dfe272d58c8fc000960b835d13aa2ac ("mm: reclaim small 
> amounts of memory when an external fragmentation event occurs") breaks 
> memory management on parisc.
> 
> I have a parisc machine with 7GiB RAM, the chipset maps the physical 
> memory to three zones:
> 	0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
> 	1) Start 0x0000000100000000 End 0x00000001bfdfffff Size   3070 MB
> 	2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
> (but it is not NUMA)
> 
> With the patch 1c30844d2, the kernel will incorrectly reclaim the first 
> zone when it fills up, ignoring the fact that there are two completely 
> free zones. Basiscally, it limits cache size to 1GiB.
> 
> For example, if I run:
> # dd if=/dev/sda of=/dev/null bs=1M count=2048
> 
> - with the proper kernel, there should be "Buffers - 2GiB" when this 
> command finishes. With the patch 1c30844d2, buffers will consume just 1GiB 
> or slightly more, because the kernel was incorrectly reclaiming them.
> 

I could argue that the feature is behaving as expected for separate
pgdats but that's neither here nor there. The bug is real but I have a
few questions.

First, if pa-risc is !NUMA then why are separate local ranges
represented as separate nodes? Is it because of DISCONTIGMEM or something
else? DISCONTIGMEM is before my time so I'm not familiar with it and
I consider it "essentially dead" but the arch init code seems to setup
pgdats for each physical contiguous range so it's a possibility. The most
likely explanation is pa-risc does not have hardware with addressing
limitations smaller than the CPUs physical address limits and it's
possible to have more ranges than available zones but clarification would
be nice.  By rights, SPARSEMEM would be supported on pa-risc but that
would be a time-consuming and somewhat futile exercise.  Regardless of the
explanation, as pa-risc does not appear to support transparent hugepages,
an option is to special case watermark_boost_factor to be 0 on DISCONTIGMEM
as that commit was primarily about THP with secondary concerns around
SLUB. This is probably the most straight-forward solution but it'd need
a comment obviously. I do not know what the distro configurations for
pa-risc set as I'm not a user of gentoo or debian.

Second, if you set the sysctl vm.watermark_boost_factor=0, does the
problem go away? If so, an option would be to set this sysctl to 0 by
default on distros that support pa-risc. Would that be suitable?

Finally, I'm sure this has been asked before buy why is pa-risc alive?
It appears a new CPU has not been manufactured since 2005. Even Alpha
I can understand being semi-alive since it's an interesting case for
weakly-ordered memory models. pa-risc appears to be supported and active
for debian at least so someone cares. It's not the only feature like this
that is bizarrely alive but it is curious -- 32 bit NUMA support on x86,
I'm looking at you, your machines are all dead since the early 2000's
AFAIK and anyone else using NUMA on 32-bit x86 needs their head examined.

-- 
Mel Gorman
SUSE Labs
