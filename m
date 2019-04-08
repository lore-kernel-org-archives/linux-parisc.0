Return-Path: <SRS0=KpZp=SK=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B14C10F13
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 14:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB697206C0
	for <linux-parisc@archiver.kernel.org>; Mon,  8 Apr 2019 14:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="ilwFB7fJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="GLNUu1vY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfDHO3N (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 8 Apr 2019 10:29:13 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:57346 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726573AbfDHO3N (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 8 Apr 2019 10:29:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5958A8EE0ED;
        Mon,  8 Apr 2019 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554733752;
        bh=R2xhiC+0vMbSg7pyXTxfOfREJ8q93QOZwD4dtmqxljg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ilwFB7fJ1cbzFOf0lhsWoMxFI35bb2euibmlYKN0cxpzcwEUYt2YgMhpP7icNK+4X
         JkAQcPyRFWB6jaR4LO5qn5p8cHBh519VWuXd6+aSGznAPErnEFpJfWfNgQUW+vBtL8
         ebxAmLJJyEGo/raFw3pF04m5c+D8owzM/hBhBE2c=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bADbGIfHE9TE; Mon,  8 Apr 2019 07:29:12 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 80F3E8EE062;
        Mon,  8 Apr 2019 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554733751;
        bh=R2xhiC+0vMbSg7pyXTxfOfREJ8q93QOZwD4dtmqxljg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=GLNUu1vYWD0x6NFM0uqCmwhz6PZzlLG7BZZqdWvMjwsNnixiLPttT06aQEa8KPU7x
         owAuI+OKkBHyI+lc6yGODSnZ5PLrq/QXDry2XXSaYf9qHi3OHu677NuE27baySRIHg
         4WrQ7Rf5ffDnXRDCNt+tyLUbVpEMigHNVThrQlOI=
Message-ID: <1554733749.3137.6.camel@HansenPartnership.com>
Subject: Re: Memory management broken by "mm: reclaim small amounts of
 memory when an external fragmentation event occurs"
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Mel Gorman <mgorman@techsingularity.net>,
        Mikulas Patocka <mpatocka@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org, linux-mm@kvack.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>
Date:   Mon, 08 Apr 2019 07:29:09 -0700
In-Reply-To: <20190408095224.GA18914@techsingularity.net>
References: <alpine.LRH.2.02.1904061042490.9597@file01.intranet.prod.int.rdu2.redhat.com>
         <20190408095224.GA18914@techsingularity.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, 2019-04-08 at 10:52 +0100, Mel Gorman wrote:
> First, if pa-risc is !NUMA then why are separate local ranges
> represented as separate nodes? Is it because of DISCONTIGMEM or
> something else? DISCONTIGMEM is before my time so I'm not familiar
> with it and I consider it "essentially dead" but the arch init code
> seems to setup pgdats for each physical contiguous range so it's a
> possibility. The most likely explanation is pa-risc does not have
> hardware with addressing limitations smaller than the CPUs physical
> address limits and it's possible to have more ranges than available
> zones but clarification would be nice.

Let me try, since I remember the ancient history.  In the early days,
there had to be a single mem_map array covering all of physical memory.
 Some pa-risc systems had huge gaps in the physical memory; I think one
gap was somewhere around 1GB, so this lead us to wasting huge amounts
of space in mem_map on non-existent memory.  What CONFIG_DISCONTIGMEM
did was allow you to represent this discontinuity on a non-NUMA system
using numa nodes, so we effectively got one node per discontiguous
range.  It's hacky, but it worked.  I thought we finally got converted
to sparsemem by the NUMA people, but I can't find the commit.

James

