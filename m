Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161A3C282DA
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 21:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB40621019
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 21:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XZ6H5Ifi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XZ6H5Ifi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfDFV2y (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 17:28:54 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:53766 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726199AbfDFV2y (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 17:28:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id BC6B88EE0ED;
        Sat,  6 Apr 2019 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554586133;
        bh=AeExoFxt37+swZN/yY3jJR803fYw1+HOaJMckDq6OBU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=XZ6H5IfiMxynzMC1PbEUVy/M9+gJQzOdS6AMXdSNnQvVapoMpGJK/tXbslPVxsM0j
         noFJp0YpWpfv5EDQGzO23k+gHVPh0YZOn51wsVLz2DaCH/w75j78tuInZN5Aw5mTdu
         hJlTkEGIdjKG089S8SyHgdvM5Zw6bFUVFf8irMeo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yeUICVMXWcQn; Sat,  6 Apr 2019 14:28:53 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 5BCAF8EE0E0;
        Sat,  6 Apr 2019 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1554586133;
        bh=AeExoFxt37+swZN/yY3jJR803fYw1+HOaJMckDq6OBU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=XZ6H5IfiMxynzMC1PbEUVy/M9+gJQzOdS6AMXdSNnQvVapoMpGJK/tXbslPVxsM0j
         noFJp0YpWpfv5EDQGzO23k+gHVPh0YZOn51wsVLz2DaCH/w75j78tuInZN5Aw5mTdu
         hJlTkEGIdjKG089S8SyHgdvM5Zw6bFUVFf8irMeo=
Message-ID: <1554586132.5053.14.camel@HansenPartnership.com>
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Date:   Sat, 06 Apr 2019 14:28:52 -0700
In-Reply-To: <alpine.LRH.2.02.1904061635090.31596@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
          <1554580144.5053.4.camel@HansenPartnership.com>
          <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com>
         <1554582741.5053.7.camel@HansenPartnership.com>
         <alpine.LRH.2.02.1904061635090.31596@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 2019-04-06 at 16:40 -0400, Mikulas Patocka wrote:
> 
> On Sat, 6 Apr 2019, James Bottomley wrote:
> 
> > On Sat, 2019-04-06 at 16:13 -0400, Mikulas Patocka wrote:
> > > 
> > > > Of course, on systems without a merced bus, we don't need the
> lock
> > > at 
> > > > all, so runtime patching might be usable to fix that case.
> > > > 
> > > > James
> > > 
> > > The lock is still needed to synchronize TLB fault handlers with
> the
> > > code that modifies the pagetables - but we could have per-process
> > > lock for this purpose.
> > 
> > It is?  I don't think we need any per-arch sync for that.  The
> purge
> > should happen after all modifications are done so the next page
> fault
> > inserts the new TLB entry ... so if there is a place where the
> purge
> > lock matters to the page table updates, we're doing something
> wrong.
> > 
> > James
> 
> Suppose that this sequence happens:
> 
> CPU1:
> (inside the TLB miss handler)
> read the value XXX from the pagetables to the register
> 
> CPU2:
> modify the value in the pagetables to YYY
> broadcast a TLB purge
> 
> CPU1:
> receives the TLB purge broadcast and flushes the TLB
> ... continues executing the TLB handler and inserts the value XXX
> from the register into the TLB
> 
> And now, CPU1 is running with stale entry in the TLB. We need the
> lock to prevent this situation.

Heh, this is the dreaded appendix F.  In general, if we're executing a
high priority interruption for a TLB miss, the address is termed relied
upon, so a purge for the same address won't be acted upon and
acknowledged by the CPU until we leave the high priority handler (and
have thus either inserted a TLB entry or dropped into full fault
handling).  This effectively makes the purge and the insertion atomic
with respect to each other as they would be if the CPU had a hardware
TLB miss handler.  In the worst case, the CPU refaults on the same
address because it got inserted then purged and the new translation
then gets inserted second time around.

James

