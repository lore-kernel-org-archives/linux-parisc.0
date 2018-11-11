Return-Path: <SRS0=nIWc=NW=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B39C43441
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 19:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CE9B2148E
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 19:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CE9B2148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbeKLFc7 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 12 Nov 2018 00:32:59 -0500
Received: from mout.gmx.net ([212.227.15.19]:44809 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbeKLFc6 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Nov 2018 00:32:58 -0500
Received: from [192.168.20.60] ([92.116.134.100]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LnxxQ-1foos91IYS-00g1RS; Sun, 11
 Nov 2018 20:43:25 +0100
Subject: Re: [PATCH] parisc: Replace sync instruction by nop on UP kernel
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20181109210431.GA25285@ls3530.dellerweb.de>
 <9a787775-c8c8-c26f-551f-3e739d3b3791@bell.net>
From:   Helge Deller <deller@gmx.de>
Message-ID: <5b9a0c28-46b2-7efe-bdbf-17eeca6a6148@gmx.de>
Date:   Sun, 11 Nov 2018 20:43:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <9a787775-c8c8-c26f-551f-3e739d3b3791@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b2ddaUfgpryk5l8J0PPa+fT+Tjxw2N2OpH/qIM+fRyPhbaynuRl
 OLhIXMLZtwpwJjYT9p3T6pIU9TaWwZqmLCHIRVnWtEXBcoj/Xv2z899aac9G494ExTuhksE
 cpqGycMpjhz3Ie4YhyOerEhEgkX+q4DuzeHeNx0kbTEWpZ+tsBmSx9Xm3a/oH027fHufQDF
 qRlZRBIkjyuswtLTEcYaQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:xW8UzQiz6iA=:XYZIPi8r4TganvaeBMpyF/
 x/DLfJmYFtpu3RHydwTo1mntH10HKIugerlE9SPfOR+6XbxvyhF9WDxQWH7jPUUAAbJUVqiMz
 I+pkV9gg8QUTx+TDTn3WP76HuNBAHisksEaoS3EebnA6D2VeQKa3tAe0IaJaAQVSQcmMoyHm7
 ooGbPIQq4/+wUzotnLn6DPWWX08B4z7QTjYnl7oY+8okwv93J86DoDpV6bI+ahqEv5HvRRfIc
 kii/uUAQkCIY/iRqZFk02MdRQ2Ahn38edUIVjdvzTna/5a28y78qK5FPmlkPxodB7lJqTsjjG
 lMoFSr58HyVdU+hEQ1vSZv4QdGjqI693oIn0xzKnODag7VmusZQQl5N6fI4zZ56V1tAKVRQXk
 R9p8bwRm1f/bsBbOHLk9rrwYwyTHWZX9rELfhere8OhxaqgzZouMQPqNucPMIoPASDkOJM44G
 gDzV3DL1fR5b+NeIgrOzJCrGVBsq5H8EylCvopmxbYeBjjnvHdGYlmyqX0cPNgO5U5gRJqH2X
 jl0omcOZZr6GXsnIY1A2mjy5GkJPK9uw5nQkQxg6GtsCrfNtvaFTB4oFNQJtu44MrkK8FGcf6
 rPILheNujkyKfTfcN7VAi6iN7ijYV13qqHIyPqn0C/THTRszl/vNdbex7Np2ZAPUQexb+JkZY
 nNmb/VqsAMuf1oUf0R8O6btTbsz2h51/R7Ov5SjzkeYvSGfX15HAJFiyZHyRvxjOzQPXVe4M2
 GbKGV84Y7IdRmQnJuu86TPiJvGWEIG533gaeoe5IdAnpT9jdDsEcNnOtdvUstwL/4MTz+eRAf
 PN/YPT4yST7lezZ3xah3MQwc6jDEF4a4vhFxAc3jt1iDTOTXfoA4NYw6V7+m9MF6rb0nh8iY0
 X6Fmv/yZKe40IrDHk7iRe/Pv0/B82FjAqg6d3Cjqsn6DYB8j1yEyD4onKkLLE9
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 11.11.2018 16:42, John David Anglin wrote:
> On 2018-11-09 4:04 p.m., Helge Deller wrote:
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm/barrier.h
>> index dbaaca84f27f..43bcdccc56b8 100644
>> --- a/arch/parisc/include/asm/barrier.h
>> +++ b/arch/parisc/include/asm/barrier.h
>> @@ -6,7 +6,8 @@
>>     /* The synchronize caches instruction executes as a nop on systems in
>>      which all memory references are performed in order. */
>> -#define synchronize_caches() __asm__ __volatile__ ("sync" : : : "memory")
>> +#define synchronize_caches() asm volatile \
>> +    ("sync" ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) : : : "memory")
>>     #if defined(CONFIG_SMP)
>>   #define mb()        do { synchronize_caches(); } while (0)
> Although this change is consistent with mb() on UP kernels, I'm thinking that it is wrong.  That is
> the PA 2.0 out-of-order execution of memory accesses is likely visible on a UP machine when an
> interruption occurs.  I think the UP and SMP defines for mb() need to be the same.

I think you are right with the fact that the sync-removals in this patch and the other one was wrong.
I'll resend the patch without touching sync in a few moments.
I'll keep the remaining patches in my for-next-next git branch.

Helge
