Return-Path: <SRS0=FW0n=SM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DB4C10F11
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 16:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 625CC20693
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 16:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731481AbfDJQJH (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 10 Apr 2019 12:09:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47594 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387666AbfDJQJG (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Apr 2019 12:09:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 17203AC2D9;
        Wed, 10 Apr 2019 16:09:06 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D766327190;
        Wed, 10 Apr 2019 16:09:05 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x3AG95uE014108;
        Wed, 10 Apr 2019 12:09:05 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x3AG94Vi014104;
        Wed, 10 Apr 2019 12:09:04 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 10 Apr 2019 12:09:04 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     John David Anglin <dave.anglin@bell.net>
cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
In-Reply-To: <5028ebb4-e1eb-6c77-5466-86838e938aa2@bell.net>
Message-ID: <alpine.LRH.2.02.1904101205480.13246@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com> <1554580144.5053.4.camel@HansenPartnership.com> <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com> <1554582741.5053.7.camel@HansenPartnership.com>
 <alpine.LRH.2.02.1904061635090.31596@file01.intranet.prod.int.rdu2.redhat.com> <5028ebb4-e1eb-6c77-5466-86838e938aa2@bell.net>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="185206533-2068880940-1554912545=:13246"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 10 Apr 2019 16:09:06 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185206533-2068880940-1554912545=:13246
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 10 Apr 2019, John David Anglin wrote:

> On 2019-04-06 4:40 p.m., Mikulas Patocka wrote:
> >
> > On Sat, 6 Apr 2019, James Bottomley wrote:
> >
> >> On Sat, 2019-04-06 at 16:13 -0400, Mikulas Patocka wrote:
> >>>> Of course, on systems without a merced bus, we don't need the lock
> >>> at 
> >>>> all, so runtime patching might be usable to fix that case.
> >>>>
> >>>> James
> >>> The lock is still needed to synchronize TLB fault handlers with the
> >>> code that modifies the pagetables - but we could have per-process
> >>> lock for this purpose.
> >> It is?  I don't think we need any per-arch sync for that.  The purge
> >> should happen after all modifications are done so the next page fault
> >> inserts the new TLB entry ... so if there is a place where the purge
> >> lock matters to the page table updates, we're doing something wrong.
> >>
> >> James
> > Suppose that this sequence happens:
> >
> > CPU1:
> > (inside the TLB miss handler)
> > read the value XXX from the pagetables to the register
> The value is read holding TLB lock and the value is updated after insert.  Then, lock is released.
> Only concern is whether TLB inserts are strongly ordered.
> 
> >
> > CPU2:
> > modify the value in the pagetables to YYY
> > broadcast a TLB purge
> CPU2 needs to acquire TLB lock before it can modify value and broadcast TLB purge (see set_pte_at).  Lock is then released.
> TLB purges are strongly ordered.
> 
> So, I don't think this scenario can happen.

It can't happen in the current code. This is hypothetical scenario that 
could happen if we removed the TLB lock as suggested by James. But James 
claims that it can't happen because the purge tlb instruction will wait 
until all the other CPUs finish executing a high-priority interruption.

What do you think? Could the TLB lock go away?

Having one lock shared by all four cores degrades performance 
significantly (30%).

Mikulas

> >
> > CPU1:
> > receives the TLB purge broadcast and flushes the TLB
> > ... continues executing the TLB handler and inserts the value XXX from the register into the TLB
> >
> > And now, CPU1 is running with stale entry in the TLB. We need the lock to 
> > prevent this situation.
> >
> > Mikulas
> >
> 
> Dave
> 
> -- 
> John David Anglin  dave.anglin@bell.net
> 
> 
--185206533-2068880940-1554912545=:13246--
