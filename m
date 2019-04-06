Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98571C10F06
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 20:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5120B213A2
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 20:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="DjLREx0w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="DjLREx0w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfDFUcX (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 16:32:23 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:52842 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725919AbfDFUcW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 16:32:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 76E5E8EE0ED;
        Sat,  6 Apr 2019 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554582742;
        bh=WHY5Gi+lj1KLsTkyXuQjraaamKH6D4SyAUyw20nrdGg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=DjLREx0wFWAyG+FU5qKPIXF2fU9bi9vT2ZLdCWeRLxqf8hCqKQUxxWQ6ESS3zWozz
         knK39ruixgPpkG6/mUa16+WmAceCK8sH8LadbU3vAeGHsbSgjXYNvWu87JdDePIg7I
         mT8C9DqinibqEVprPuVecomNLewVlYAj1gucTtW8=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wWIdlwKvKXgw; Sat,  6 Apr 2019 13:32:22 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 002748EE0E0;
        Sat,  6 Apr 2019 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554582742;
        bh=WHY5Gi+lj1KLsTkyXuQjraaamKH6D4SyAUyw20nrdGg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=DjLREx0wFWAyG+FU5qKPIXF2fU9bi9vT2ZLdCWeRLxqf8hCqKQUxxWQ6ESS3zWozz
         knK39ruixgPpkG6/mUa16+WmAceCK8sH8LadbU3vAeGHsbSgjXYNvWu87JdDePIg7I
         mT8C9DqinibqEVprPuVecomNLewVlYAj1gucTtW8=
Message-ID: <1554582741.5053.7.camel@HansenPartnership.com>
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Date:   Sat, 06 Apr 2019 13:32:21 -0700
In-Reply-To: <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
         <1554580144.5053.4.camel@HansenPartnership.com>
         <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 2019-04-06 at 16:13 -0400, Mikulas Patocka wrote:
> 
> On Sat, 6 Apr 2019, James Bottomley wrote:
> 
> > On Sat, 2019-04-06 at 15:36 -0400, Mikulas Patocka wrote:
> > > Parisc uses a global spinlock to protect pagetable updates in the
> TLB
> > > fault handlers. When multiple cores are taking TLB faults
> > > simultaneously, the cache line containing the spinlock becomes a
> > > bottleneck.
> > 
> > You can't do this.  As the comment in cache.c says: the lock is to
> > protect the merced bus, which runs between the CPUs on some
> systems. 
> > That means it must be a single, global lock.
> 
> So - how could we detect if the Merced bus is present?

My best recollection is that it's only N class systems.

> > Of course, on systems without a merced bus, we don't need the lock
> at 
> > all, so runtime patching might be usable to fix that case.
> > 
> > James
> 
> The lock is still needed to synchronize TLB fault handlers with the
> code that modifies the pagetables - but we could have per-process
> lock for this purpose.

It is?  I don't think we need any per-arch sync for that.  The purge
should happen after all modifications are done so the next page fault
inserts the new TLB entry ... so if there is a place where the purge
lock matters to the page table updates, we're doing something wrong.

James

