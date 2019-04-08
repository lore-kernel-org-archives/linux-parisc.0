Return-Path: <SRS0=KpZp=SK=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC9CC10F13
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 11:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 681AD20863
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 11:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbfDHLKP (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 8 Apr 2019 07:10:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43240 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfDHLKO (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 8 Apr 2019 07:10:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 22B8F3082A27;
        Mon,  8 Apr 2019 11:10:14 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A1FF866D3E;
        Mon,  8 Apr 2019 11:10:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x38BADIx012994;
        Mon, 8 Apr 2019 07:10:13 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x38BABug012990;
        Mon, 8 Apr 2019 07:10:11 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Mon, 8 Apr 2019 07:10:11 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Mel Gorman <mgorman@techsingularity.net>
cc:     Andrew Morton <akpm@linux-foundation.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>
Subject: Re: Memory management broken by "mm: reclaim small amounts of memory
 when an external fragmentation event occurs"
In-Reply-To: <20190408095224.GA18914@techsingularity.net>
Message-ID: <alpine.LRH.2.02.1904080639570.4674@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061042490.9597@file01.intranet.prod.int.rdu2.redhat.com> <20190408095224.GA18914@techsingularity.net>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 08 Apr 2019 11:10:14 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Mon, 8 Apr 2019, Mel Gorman wrote:

> On Sat, Apr 06, 2019 at 11:20:35AM -0400, Mikulas Patocka wrote:
> > Hi
> > 
> > The patch 1c30844d2dfe272d58c8fc000960b835d13aa2ac ("mm: reclaim small 
> > amounts of memory when an external fragmentation event occurs") breaks 
> > memory management on parisc.
> > 
> > I have a parisc machine with 7GiB RAM, the chipset maps the physical 
> > memory to three zones:
> > 	0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
> > 	1) Start 0x0000000100000000 End 0x00000001bfdfffff Size   3070 MB
> > 	2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
> > (but it is not NUMA)
> > 
> > With the patch 1c30844d2, the kernel will incorrectly reclaim the first 
> > zone when it fills up, ignoring the fact that there are two completely 
> > free zones. Basiscally, it limits cache size to 1GiB.
> > 
> > For example, if I run:
> > # dd if=/dev/sda of=/dev/null bs=1M count=2048
> > 
> > - with the proper kernel, there should be "Buffers - 2GiB" when this 
> > command finishes. With the patch 1c30844d2, buffers will consume just 1GiB 
> > or slightly more, because the kernel was incorrectly reclaiming them.
> > 
> 
> I could argue that the feature is behaving as expected for separate
> pgdats but that's neither here nor there. The bug is real but I have a
> few questions.
> 
> First, if pa-risc is !NUMA then why are separate local ranges
> represented as separate nodes? Is it because of DISCONTIGMEM or something
> else? DISCONTIGMEM is before my time so I'm not familiar with it and

I'm not an expert in this area, I don't know.

> I consider it "essentially dead" but the arch init code seems to setup
> pgdats for each physical contiguous range so it's a possibility. The most
> likely explanation is pa-risc does not have hardware with addressing
> limitations smaller than the CPUs physical address limits and it's
> possible to have more ranges than available zones but clarification would
> be nice.  By rights, SPARSEMEM would be supported on pa-risc but that
> would be a time-consuming and somewhat futile exercise.  Regardless of the
> explanation, as pa-risc does not appear to support transparent hugepages,
> an option is to special case watermark_boost_factor to be 0 on DISCONTIGMEM
> as that commit was primarily about THP with secondary concerns around
> SLUB. This is probably the most straight-forward solution but it'd need
> a comment obviously. I do not know what the distro configurations for
> pa-risc set as I'm not a user of gentoo or debian.

I use Debian Sid, but I compile my own kernel. I uploaded the kernel 
.config here: 
http://people.redhat.com/~mpatocka/testcases/parisc-config.txt

> Second, if you set the sysctl vm.watermark_boost_factor=0, does the
> problem go away? If so, an option would be to set this sysctl to 0 by
> default on distros that support pa-risc. Would that be suitable?

I have tried it and the problem almost goes away. With 
vm.watermark_boost_factor=0, if I read 2GiB data from the disk, the buffer 
cache will contain about 1.8GiB. So, there's still some superfluous page 
reclaim, but it is smaller.


BTW. I'm interested - on real NUMA machines - is reclaiming the file cache 
really a better option than allocating the file cache from non-local node?


> Finally, I'm sure this has been asked before buy why is pa-risc alive?
> It appears a new CPU has not been manufactured since 2005. Even Alpha
> I can understand being semi-alive since it's an interesting case for
> weakly-ordered memory models. pa-risc appears to be supported and active
> for debian at least so someone cares. It's not the only feature like this
> that is bizarrely alive but it is curious -- 32 bit NUMA support on x86,
> I'm looking at you, your machines are all dead since the early 2000's
> AFAIK and anyone else using NUMA on 32-bit x86 needs their head examined.

I use it to test programs for portability to risc.

If one could choose between buying an expensive power system or a cheap 
pa-risc system, pa-risc may be a better choice. The last pa-risc model has 
four cores at 1.1GHz, so it is not completely unuseable.

Mikulas

> -- 
> Mel Gorman
> SUSE Labs
> 
