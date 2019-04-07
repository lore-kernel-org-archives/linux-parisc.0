Return-Path: <SRS0=zQSf=SJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07817C282DA
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 02:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADA192171F
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 02:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="c4VErtt3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="oWjpwKn3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfDGCsT (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 22:48:19 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:58208 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726053AbfDGCsS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 22:48:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 1513A8EE0ED;
        Sat,  6 Apr 2019 19:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554605298;
        bh=HoHRvccC25+lz3xwMsSyhT+fSIfH93yZSprKfw4XF8k=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=c4VErtt3JDR2XDcU2X+5/z2qBJxZxcsKCzJ0y9Gpbg4jaY2LhC8iBCC9+3Gg3gh3h
         VmcpnufowYMqdDXiI/m/W7+rh1WaOP76z6/Cr5EOG+GF/YoIuEWNrU22Q6OGUbwteS
         dKmuok8wZAQYMlQRvjkTTZ9v4j4HLyB3IPVkNXFc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2vAUoa3qUxnM; Sat,  6 Apr 2019 19:48:17 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E197B8EE0E0;
        Sat,  6 Apr 2019 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554605297;
        bh=HoHRvccC25+lz3xwMsSyhT+fSIfH93yZSprKfw4XF8k=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=oWjpwKn35ylRPN2WJPEnSm5yH2nhBck/hjfFplGv3GOx/l07gCxu4diP85q+Fluqj
         ZaTRIfGJr4+tUPHhcvoYzWyfpMz1CVZiy5H65Wilaa3Et/RjPDPMQgiXtKQcOU2Im9
         HldQOlqExC+Z1Rzz8DRHS4V3/po71fKv19wN5FnI=
Message-ID: <1554605295.5053.17.camel@HansenPartnership.com>
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>,
        Mikulas Patocka <mpatocka@redhat.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org
Date:   Sat, 06 Apr 2019 19:48:15 -0700
In-Reply-To: <d340ec78-0829-8a5d-1002-2e08e0b9babb@gmx.de>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
         <1554580144.5053.4.camel@HansenPartnership.com>
         <d340ec78-0829-8a5d-1002-2e08e0b9babb@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 2019-04-06 at 22:15 +0200, Helge Deller wrote:
> On 06.04.19 21:49, James Bottomley wrote:
> > On Sat, 2019-04-06 at 15:36 -0400, Mikulas Patocka wrote:
> > > Parisc uses a global spinlock to protect pagetable updates in the
> > > TLB
> > > fault handlers. When multiple cores are taking TLB faults
> > > simultaneously, the cache line containing the spinlock becomes a
> > > bottleneck.
> > 
> > You can't do this.  As the comment in cache.c says: the lock is to
> > protect the merced bus, which runs between the CPUs on some
> > systems.
> > That means it must be a single, global lock.  Of course, on systems
> > without a merced bus, we don't need the lock at all, so runtime
> > patching might be usable to fix that case.
> 
> Is there a way to detect if a system has the Merced bus?
> 
> See arch/parisc/include/asm/tlbflush.h too:
> /* This is for the serialisation of PxTLB broadcasts.  At least on
> the
>  * N class systems, only one PxTLB inter processor broadcast can be
>  * active at any one time on the Merced bus.  This tlb purge
>  * synchronisation is fairly lightweight and harmless so we activate
>  * it on all systems not just the N class.
> 
> 30% speed improvement by Mikulas patches don't seem lightweight...

Well, that's because when it was originally conceived the patch was
only about purging.  It never actually involved the TLB insertion hot
path.  It turns out the entanglement occurred here:

commit 01ab60570427caa24b9debc369e452e86cd9beb4
Author: John David Anglin <dave.anglin@bell.net>
Date:   Wed Jul 1 17:18:37 2015 -0400

    parisc: Fix some PTE/TLB race conditions and optimize
__flush_tlb_range based on timing results
 

Which is when the dbit lock got replaced by the tlb purge lock.  I have
some vague memories about why we needed the dbit lock which I'll try to
make more coherent.

James

