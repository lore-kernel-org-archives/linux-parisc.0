Return-Path: <SRS0=h12M=SR=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BC9C10F0E
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 13:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AFBA20684
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 13:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfDONoR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 15 Apr 2019 09:44:17 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:60233 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725789AbfDONoR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Apr 2019 09:44:17 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190415134415.UGOL4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 15 Apr 2019 09:44:15 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by mtlspm01.bell.net
          with ESMTP
          id <20190415134415.EQGN87666.mtlspm01.bell.net@[192.168.0.183]>;
          Mon, 15 Apr 2019 09:44:15 -0400
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <a12f7c71-553c-1e4d-d986-8a966f6e83dc@bell.net>
 <059fe85b-468c-06b4-fb07-dbcbf2d222c9@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH] parisc: Use ldcw instruction for SMP spinlock release
 barrier
Message-ID: <ad7a78c7-ef33-7510-577a-731ceabd5561@bell.net>
Date:   Mon, 15 Apr 2019 09:44:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <059fe85b-468c-06b4-fb07-dbcbf2d222c9@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=qtOEGhOMOI4pdhNEAusA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfMmisrse3tPXt+w6OSdRPIe13p9wpzFqSzAlcUBjjgDA753otU0q8BGTUw4+EHm+qIV4kkHvgw6bgFdYz+CFI9IsEGNL/bhZPE+WdpLxC31yJPAUAhrz zAmpB59S+wdzNNTo/oTgviPGsgS4zossy5tBqPGMV1Jr0oICOgzMDSwuuI671gLs9nryxC5C6aVcCQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-15 8:43 a.m., Helge Deller wrote:
> On 15.04.19 01:20, John David Anglin wrote:
>> There are only a couple of instructions that can function as a memory barrier on
>> parisc.  Currently, we use the sync instruction as a memory barrier when releasing
>> a spinlock.  However, the ldcw instruction is a better barrier when we have a
>> handy memory location since it operates in the cache on coherent machines.
>>
>> This patch updates the spinlock release code to use ldcw.
> Just out of curiosity: Did you maye do any timing with that patch?
No, but I think it made 800 MHz rp3440 nearly as fast as 1 GHz c8000 based on buildd times.
>
> Secondly:
>
>>  	/* Release pa_tlb_lock lock without reloading lock address. */
>> -	.macro		tlb_unlock0	spc,tmp
>> +	.macro		tlb_unlock0	spc,tmp,tmp1
> Above you add the tmp1 variable...
>
>>  #ifdef CONFIG_SMP
>>  98:	or,COND(=)	%r0,\spc,%r0
>> -	stw,ma		\spc,0(\tmp)
>> +	LDCW		0(\tmp),\tmp1
> couldn't instead %r0 be used as register target in all ldcw()
> accesses you added as barriers?
> Or would the processor "optimize" the access away (which I doubt)?
No.  See page 6-12 in PA 2.0 architecture manual.  I had wondered about it when I wrote the code.

Dave

-- 
John David Anglin  dave.anglin@bell.net


