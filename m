Return-Path: <SRS0=nIWc=NW=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C074C43441
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 15:42:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6ABA020866
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 15:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ABA020866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bell.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbeKLBa7 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 11 Nov 2018 20:30:59 -0500
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:51447 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728542AbeKLBa7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 11 Nov 2018 20:30:59 -0500
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20181111154205.IKOP31136.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 11 Nov 2018 10:42:05 -0500
Received: from [192.168.2.49] (really [70.53.62.196]) by torspm01.bell.net
          with ESMTP
          id <20181111154205.MESW10318.torspm01.bell.net@[192.168.2.49]>;
          Sun, 11 Nov 2018 10:42:05 -0500
Subject: Re: [PATCH] parisc: Replace sync instruction by nop on UP kernel
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20181109210431.GA25285@ls3530.dellerweb.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <9a787775-c8c8-c26f-551f-3e739d3b3791@bell.net>
Date:   Sun, 11 Nov 2018 10:42:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181109210431.GA25285@ls3530.dellerweb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Cloudmark-Analysis: v=2.2 cv=N5jGLy1B c=1 sm=0 tr=0 a=Zvhif4XNTjWcJyJCfFIh1A==:17 a=IkcTkHD0fZMA:10 a=JHtHm7312UAA:10 a=FBHGMhGWAAAA:8 a=NCzcORlZfGfMo20NjsUA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2018-11-09 4:04 p.m., Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/include/asm/barrier.h b/arch/parisc/include/asm/barrier.h
> index dbaaca84f27f..43bcdccc56b8 100644
> --- a/arch/parisc/include/asm/barrier.h
> +++ b/arch/parisc/include/asm/barrier.h
> @@ -6,7 +6,8 @@
>   
>   /* The synchronize caches instruction executes as a nop on systems in
>      which all memory references are performed in order. */
> -#define synchronize_caches() __asm__ __volatile__ ("sync" : : : "memory")
> +#define synchronize_caches() asm volatile \
> +	("sync" ALTERNATIVE(ALT_COND_NO_SMP, INSN_NOP) : : : "memory")
>   
>   #if defined(CONFIG_SMP)
>   #define mb()		do { synchronize_caches(); } while (0)
Although this change is consistent with mb() on UP kernels, I'm thinking 
that it is wrong.  That is
the PA 2.0 out-of-order execution of memory accesses is likely visible 
on a UP machine when an
interruption occurs.  I think the UP and SMP defines for mb() need to be 
the same.

Dave

-- 
John David Anglin  dave.anglin@bell.net

