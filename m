Return-Path: <SRS0=FW0n=SM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3806C10F11
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 15:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEFB82082E
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 15:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732949AbfDJPFj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 10 Apr 2019 11:05:39 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:60168 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732830AbfDJPFj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Apr 2019 11:05:39 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190410150538.IOWC4444.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 10 Apr 2019 11:05:38 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by mtlspm02.bell.net
          with ESMTP
          id <20190410150538.KKNE21689.mtlspm02.bell.net@[192.168.0.183]>;
          Wed, 10 Apr 2019 11:05:38 -0400
To:     Mikulas Patocka <mpatocka@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
 <1554580144.5053.4.camel@HansenPartnership.com>
 <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com>
 <1554582741.5053.7.camel@HansenPartnership.com>
 <alpine.LRH.2.02.1904061635090.31596@file01.intranet.prod.int.rdu2.redhat.com>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
Message-ID: <5028ebb4-e1eb-6c77-5466-86838e938aa2@bell.net>
Date:   Wed, 10 Apr 2019 11:05:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1904061635090.31596@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=h-u4XrBlqoSx0oLy4mkA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfDCs3+syeHXRLMa4CQTfhLhL206T8HCChHjkdMi7oQlt4tFSuKOeUIaNRwVSaNiMALe2NcEU2/GDil6KmHxSfb84n1Rv7DiiAiCa8dNF5yUUgONUd0XH a//5bW+pRQHypiKAeHAWfEBo+H1iVfk6YuQC0p68kiK9gn7SOAyw04rHfbBN+l+PtpgNhNWgdXuTRg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-06 4:40 p.m., Mikulas Patocka wrote:
>
> On Sat, 6 Apr 2019, James Bottomley wrote:
>
>> On Sat, 2019-04-06 at 16:13 -0400, Mikulas Patocka wrote:
>>>> Of course, on systems without a merced bus, we don't need the lock
>>> at 
>>>> all, so runtime patching might be usable to fix that case.
>>>>
>>>> James
>>> The lock is still needed to synchronize TLB fault handlers with the
>>> code that modifies the pagetables - but we could have per-process
>>> lock for this purpose.
>> It is?  I don't think we need any per-arch sync for that.  The purge
>> should happen after all modifications are done so the next page fault
>> inserts the new TLB entry ... so if there is a place where the purge
>> lock matters to the page table updates, we're doing something wrong.
>>
>> James
> Suppose that this sequence happens:
>
> CPU1:
> (inside the TLB miss handler)
> read the value XXX from the pagetables to the register
The value is read holding TLB lock and the value is updated after insert.  Then, lock is released.
Only concern is whether TLB inserts are strongly ordered.

>
> CPU2:
> modify the value in the pagetables to YYY
> broadcast a TLB purge
CPU2 needs to acquire TLB lock before it can modify value and broadcast TLB purge (see set_pte_at).  Lock is then released.
TLB purges are strongly ordered.

So, I don't think this scenario can happen.
>
> CPU1:
> receives the TLB purge broadcast and flushes the TLB
> ... continues executing the TLB handler and inserts the value XXX from the register into the TLB
>
> And now, CPU1 is running with stale entry in the TLB. We need the lock to 
> prevent this situation.
>
> Mikulas
>

Dave

-- 
John David Anglin  dave.anglin@bell.net


