Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38992C10F06
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 20:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1EB2213F2
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 20:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbfDFUNa (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 16:13:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34348 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbfDFUNa (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 16:13:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0838E81F1B;
        Sat,  6 Apr 2019 20:13:30 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id DC5A25C297;
        Sat,  6 Apr 2019 20:13:29 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x36KDTJY028776;
        Sat, 6 Apr 2019 16:13:29 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x36KDS9B028772;
        Sat, 6 Apr 2019 16:13:29 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sat, 6 Apr 2019 16:13:28 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
cc:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
In-Reply-To: <1554580144.5053.4.camel@HansenPartnership.com>
Message-ID: <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com> <1554580144.5053.4.camel@HansenPartnership.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sat, 06 Apr 2019 20:13:30 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Sat, 6 Apr 2019, James Bottomley wrote:

> On Sat, 2019-04-06 at 15:36 -0400, Mikulas Patocka wrote:
> > Parisc uses a global spinlock to protect pagetable updates in the TLB
> > fault handlers. When multiple cores are taking TLB faults
> > simultaneously, the cache line containing the spinlock becomes a
> > bottleneck.
> 
> You can't do this.  As the comment in cache.c says: the lock is to
> protect the merced bus, which runs between the CPUs on some systems. 
> That means it must be a single, global lock.

So - how could we detect if the Merced bus is present?

> Of course, on systems without a merced bus, we don't need the lock at 
> all, so runtime patching might be usable to fix that case.
> 
> James

The lock is still needed to synchronize TLB fault handlers with the code 
that modifies the pagetables - but we could have per-process lock for this 
purpose.

Mikulas
