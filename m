Return-Path: <SRS0=zQSf=SJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B9EC10F0E
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 17:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9493220896
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 17:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfDGRX5 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 7 Apr 2019 13:23:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53300 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfDGRX4 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Apr 2019 13:23:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7F1925946E;
        Sun,  7 Apr 2019 17:23:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4909760CCC;
        Sun,  7 Apr 2019 17:23:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x37HNtYc002339;
        Sun, 7 Apr 2019 13:23:55 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x37HNtaJ002335;
        Sun, 7 Apr 2019 13:23:55 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sun, 7 Apr 2019 13:23:55 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
cc:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
In-Reply-To: <1554605295.5053.17.camel@HansenPartnership.com>
Message-ID: <alpine.LRH.2.02.1904071319480.29323@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>  <1554580144.5053.4.camel@HansenPartnership.com>  <d340ec78-0829-8a5d-1002-2e08e0b9babb@gmx.de> <1554605295.5053.17.camel@HansenPartnership.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Sun, 07 Apr 2019 17:23:56 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Sat, 6 Apr 2019, James Bottomley wrote:

> On Sat, 2019-04-06 at 22:15 +0200, Helge Deller wrote:
> > On 06.04.19 21:49, James Bottomley wrote:
> > > On Sat, 2019-04-06 at 15:36 -0400, Mikulas Patocka wrote:
> > > > Parisc uses a global spinlock to protect pagetable updates in the
> > > > TLB
> > > > fault handlers. When multiple cores are taking TLB faults
> > > > simultaneously, the cache line containing the spinlock becomes a
> > > > bottleneck.
> > > 
> > > You can't do this.  As the comment in cache.c says: the lock is to
> > > protect the merced bus, which runs between the CPUs on some
> > > systems.
> > > That means it must be a single, global lock.  Of course, on systems
> > > without a merced bus, we don't need the lock at all, so runtime
> > > patching might be usable to fix that case.
> > 
> > Is there a way to detect if a system has the Merced bus?
> > 
> > See arch/parisc/include/asm/tlbflush.h too:
> > /* This is for the serialisation of PxTLB broadcasts.  At least on
> > the
> >  * N class systems, only one PxTLB inter processor broadcast can be
> >  * active at any one time on the Merced bus.  This tlb purge
> >  * synchronisation is fairly lightweight and harmless so we activate
> >  * it on all systems not just the N class.
> > 
> > 30% speed improvement by Mikulas patches don't seem lightweight...
> 
> Well, that's because when it was originally conceived the patch was
> only about purging.  It never actually involved the TLB insertion hot
> path.  It turns out the entanglement occurred here:
> 
> commit 01ab60570427caa24b9debc369e452e86cd9beb4
> Author: John David Anglin <dave.anglin@bell.net>
> Date:   Wed Jul 1 17:18:37 2015 -0400
> 
>     parisc: Fix some PTE/TLB race conditions and optimize
> __flush_tlb_range based on timing results
>  
> 
> Which is when the dbit lock got replaced by the tlb purge lock.  I have
> some vague memories about why we needed the dbit lock which I'll try to
> make more coherent.
> 
> James

Before this patch, it used pa_dbit_lock for modifying pagetables and 
pa_tlb_lock for flushing.

So it still suffered the performance penalty with shared pa_dbit_lock.

Perhaps the proper thing would be to use global pa_tlb_lock for flushing 
and per-process tlb lock for pagetable updates.

Mikulas
