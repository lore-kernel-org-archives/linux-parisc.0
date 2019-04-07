Return-Path: <SRS0=zQSf=SJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EB8C10F0E
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 17:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1556D20880
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 17:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfDGRHR (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 7 Apr 2019 13:07:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58980 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbfDGRHR (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Apr 2019 13:07:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E02393086224;
        Sun,  7 Apr 2019 17:07:16 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 962B357BF;
        Sun,  7 Apr 2019 17:07:16 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x37H7G7n000310;
        Sun, 7 Apr 2019 13:07:16 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x37H7FoD000306;
        Sun, 7 Apr 2019 13:07:15 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sun, 7 Apr 2019 13:07:15 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
cc:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
In-Reply-To: <1554586132.5053.14.camel@HansenPartnership.com>
Message-ID: <alpine.LRH.2.02.1904071300090.29323@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>   <1554580144.5053.4.camel@HansenPartnership.com>   <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com>  <1554582741.5053.7.camel@HansenPartnership.com>
  <alpine.LRH.2.02.1904061635090.31596@file01.intranet.prod.int.rdu2.redhat.com> <1554586132.5053.14.camel@HansenPartnership.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sun, 07 Apr 2019 17:07:17 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Sat, 6 Apr 2019, James Bottomley wrote:

> On Sat, 2019-04-06 at 16:40 -0400, Mikulas Patocka wrote:
> > 
> > On Sat, 6 Apr 2019, James Bottomley wrote:
> > 
> > > On Sat, 2019-04-06 at 16:13 -0400, Mikulas Patocka wrote:
> > > > 
> > > > > Of course, on systems without a merced bus, we don't need the
> > lock
> > > > at 
> > > > > all, so runtime patching might be usable to fix that case.
> > > > > 
> > > > > James
> > > > 
> > > > The lock is still needed to synchronize TLB fault handlers with
> > the
> > > > code that modifies the pagetables - but we could have per-process
> > > > lock for this purpose.
> > > 
> > > It is?  I don't think we need any per-arch sync for that.  The
> > purge
> > > should happen after all modifications are done so the next page
> > fault
> > > inserts the new TLB entry ... so if there is a place where the
> > purge
> > > lock matters to the page table updates, we're doing something
> > wrong.
> > > 
> > > James
> > 
> > Suppose that this sequence happens:
> > 
> > CPU1:
> > (inside the TLB miss handler)
> > read the value XXX from the pagetables to the register
> > 
> > CPU2:
> > modify the value in the pagetables to YYY
> > broadcast a TLB purge
> > 
> > CPU1:
> > receives the TLB purge broadcast and flushes the TLB
> > ... continues executing the TLB handler and inserts the value XXX
> > from the register into the TLB
> > 
> > And now, CPU1 is running with stale entry in the TLB. We need the
> > lock to prevent this situation.
> 
> Heh, this is the dreaded appendix F.  In general, if we're executing a
> high priority interruption for a TLB miss, the address is termed relied
> upon, so a purge for the same address won't be acted upon and
> acknowledged by the CPU until we leave the high priority handler (and
> have thus either inserted a TLB entry or dropped into full fault
> handling).  This effectively makes the purge and the insertion atomic
> with respect to each other as they would be if the CPU had a hardware
> TLB miss handler.  In the worst case, the CPU refaults on the same
> address because it got inserted then purged and the new translation
> then gets inserted second time around.
> 
> James

I see.

But the other remaining reason why we need the lock in the TLB handler is 
updating the accessed and dirty bits.

If we changed the pte layout so that there would be dirty and accessed 
bytes instead of bits, we could update them with the stb instruction 
without any locking.

Mikulas
