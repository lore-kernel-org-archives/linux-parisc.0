Return-Path: <SRS0=FW0n=SM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8FCC10F11
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 19:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEA832064B
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 19:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfDJTKa convert rfc822-to-8bit (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 10 Apr 2019 15:10:30 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:59320 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726867AbfDJTKa (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Apr 2019 15:10:30 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190410191028.RTCP4444.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 10 Apr 2019 15:10:28 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by mtlspm02.bell.net
          with ESMTP
          id <20190410191028.NQJO21689.mtlspm02.bell.net@[192.168.0.183]>;
          Wed, 10 Apr 2019 15:10:28 -0400
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
 <1554580144.5053.4.camel@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
Message-ID: <14301958-d484-dceb-b48f-c5bb91c0639e@bell.net>
Date:   Wed, 10 Apr 2019 15:10:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554580144.5053.4.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=aZilIRQtnueRdlTOng0A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfNAtQBnV04CI4JZMp7LS05ePrbJe5WuAdQ2IFmLd1WDyXK6WSALjS5eCDx4XLGjdHBS0jXOsgl57G97skq7eQl1BJzZxse5GnqUJnUqeO1HfqB54GjEC 8naWJE98YaaD5LiODIs0xiaexeSHKeNA1OC8sPnfApmDVsp5yZ4WSGWpEGHnVyk+/kZT/XScLt+S1Q==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-06 3:49 p.m., James Bottomley wrote:
> On Sat, 2019-04-06 at 15:36 -0400, Mikulas Patocka wrote:
>> Parisc uses a global spinlock to protect pagetable updates in the TLB
>> fault handlers. When multiple cores are taking TLB faults
>> simultaneously, the cache line containing the spinlock becomes a
>> bottleneck.
> You can't do this.  As the comment in cache.c says: the lock is to
> protect the merced bus, which runs between the CPUs on some systems. 
> That means it must be a single, global lock.  Of course, on systems
> without a merced bus, we don't need the lock at all, so runtime
> patching might be usable to fix that case.
To me, this looks like a good improvement.  It appears easy to adopt pgd_spinlock()
and other places where lock address is loaded for merced bus case.  Is anyone
actually using N class?

There are a couple of uses of pa_tlb_lock in pacache.S that are not updated.  These
only affect PA 1.x.  Was merced bus used on PA 1.x?  If not, then the locks could be
removed.

Dave

-- 
John David Anglin  dave.anglin@bell.net


