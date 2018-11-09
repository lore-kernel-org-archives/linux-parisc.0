Return-Path: <SRS0=nAaT=NU=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FDDC43441
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 00:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D44FD20855
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 00:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D44FD20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bell.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbeKIJtj (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 9 Nov 2018 04:49:39 -0500
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:44155 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725922AbeKIJtj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 9 Nov 2018 04:49:39 -0500
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20181109001136.VQPU31136.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 8 Nov 2018 19:11:36 -0500
Received: from [192.168.2.49] (really [70.53.62.196]) by torspm02.bell.net
          with ESMTP
          id <20181109001136.ZFJA19016.torspm02.bell.net@[192.168.2.49]>;
          Thu, 8 Nov 2018 19:11:36 -0500
Subject: Re: [PATCH] parisc: Improve alternative live patching
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20181108220356.GA16610@ls3530.dellerweb.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <a0963ae2-457c-d54e-9c54-b1d7c4248e94@bell.net>
Date:   Thu, 8 Nov 2018 19:11:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181108220356.GA16610@ls3530.dellerweb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Cloudmark-Analysis: v=2.2 cv=N5jGLy1B c=1 sm=0 tr=0 a=Zvhif4XNTjWcJyJCfFIh1A==:17 a=IkcTkHD0fZMA:10 a=JHtHm7312UAA:10 a=FBHGMhGWAAAA:8 a=EZf0bC1mMXXBqUR6-a8A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2018-11-08 5:03 p.m., Helge Deller wrote:
>   static inline int arch_spin_is_locked(arch_spinlock_t *x)
>   {
> -	volatile unsigned int *a = __ldcw_align(x);
> +	volatile unsigned int *a;
> +
> +	if (asm_online_cpus() == 1)
> +		return 1;
I think the return value should be 0 (unlocked) when asm_online_cpus() == 1.

Dave

-- 
John David Anglin  dave.anglin@bell.net

