Return-Path: <SRS0=jXT6=ST=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E74C282DA
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 21:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A28382183E
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 21:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbfDQVEl (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 17 Apr 2019 17:04:41 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:37479 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728074AbfDQVEl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Apr 2019 17:04:41 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190417210439.FYYQ4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 17 Apr 2019 17:04:39 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by mtlspm01.bell.net
          with ESMTP
          id <20190417210439.IZZW87666.mtlspm01.bell.net@[192.168.0.183]>;
          Wed, 17 Apr 2019 17:04:39 -0400
Subject: Re: [PATCH] parisc: Remove lock code to serialize TLB operations in
 pacache.S
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <bd9ad9ce-8e83-6653-00d9-68b8504efc11@bell.net>
 <20190417205515.GA2001@t470p.stackframe.org>
 <19e13735-bfe6-531a-1920-d8955546040e@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <6eae890f-4135-1212-6535-55a91c405d8b@bell.net>
Date:   Wed, 17 Apr 2019 17:04:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <19e13735-bfe6-531a-1920-d8955546040e@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 cx=a_idp_x a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=VwQbUJbxAAAA:8 a=G7uAYSWOdMdYw84LGAwA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22 a=AjGcO6oz07-iQ99wixmX:22
X-CM-Envelope: MS4wfCN2aTfrOGKupkK9jy/OFxr2vBRQ0hrezVuJh2Xd4nWw7/Ep2bwD4HPZimbxCHUwO9k40OmJNRQK3t8czhLTFUVSTPaKw+hb3PhSLXzaJBauHncctCBm gH0SdoCPCR1G9uEOuRZLs59Joa52z5NJGNg/gU2DHyZnWdRPcDnilZHQ88yXhLqHx87g+2k2rsefHw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-17 4:58 p.m., Helge Deller wrote:
> On 17.04.19 22:55, Sven Schnelle wrote:
>> On Fri, Apr 12, 2019 at 07:12:04PM -0400, John David Anglin wrote:
>>> TLB operations only need to be serialized on machines with the Merced (Stretch) bus.
>>> The only machines in this category are L and N class, and they require a 64-bit PA 2.0
>>> kernel.  On these machines, we use local TLB purges in the tmpalias routines.  We don't
>>> need to serialize TLB purges on all other machines.  Thus, the lock/unlock code can be
>>> removed when CONFIG_PA20 is not defined.  Further, when CONFIG_PA20 is not defined,
>>> alternative patching converts the TLB purges to local purges when PA 2.0 hardware has
>>> been detected.
>>>
>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>> I had this patch running on my C8000 and J5000 for a few days, and haven't
>> encountered any issues.
> Nah...
> I do have one of the critical machines (rp5470), and I tried
> to add the necessary code to detect and handle the TLB serialization.
> Until now the patch sadly doesn't work yet (hangs at boot), it still needs more work.
> You can find it in my git tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=tlb-flush-merced-bus&id=fc6044f83cb9828ec6ebecb23a46549d9ebc518f
I don't see it...

Dave

-- 
John David Anglin  dave.anglin@bell.net

