Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11D1C282DD
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 15:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D6AF2175B
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 15:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbfDFPUl (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 11:20:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59136 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbfDFPUl (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 11:20:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 61B2EC0AC36A;
        Sat,  6 Apr 2019 15:20:40 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A8BFF60F99;
        Sat,  6 Apr 2019 15:20:38 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x36FKb2a014736;
        Sat, 6 Apr 2019 11:20:37 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x36FKZxC014732;
        Sat, 6 Apr 2019 11:20:36 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sat, 6 Apr 2019 11:20:35 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Mel Gorman <mgorman@techsingularity.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org
cc:     Vlastimil Babka <vbabka@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>
Subject: Memory management broken by "mm: reclaim small amounts of memory
 when an external fragmentation event occurs"
Message-ID: <alpine.LRH.2.02.1904061042490.9597@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sat, 06 Apr 2019 15:20:40 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi

The patch 1c30844d2dfe272d58c8fc000960b835d13aa2ac ("mm: reclaim small 
amounts of memory when an external fragmentation event occurs") breaks 
memory management on parisc.

I have a parisc machine with 7GiB RAM, the chipset maps the physical 
memory to three zones:
	0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
	1) Start 0x0000000100000000 End 0x00000001bfdfffff Size   3070 MB
	2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
(but it is not NUMA)

With the patch 1c30844d2, the kernel will incorrectly reclaim the first 
zone when it fills up, ignoring the fact that there are two completely 
free zones. Basiscally, it limits cache size to 1GiB.

For example, if I run:
# dd if=/dev/sda of=/dev/null bs=1M count=2048

- with the proper kernel, there should be "Buffers - 2GiB" when this 
command finishes. With the patch 1c30844d2, buffers will consume just 1GiB 
or slightly more, because the kernel was incorrectly reclaiming them.

Mikulas
