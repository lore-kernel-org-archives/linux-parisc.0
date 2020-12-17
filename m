Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542C0C4361B
	for <linux-parisc@archiver.kernel.org>; Thu, 17 Dec 2020 18:05:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C0CC2376F
	for <linux-parisc@archiver.kernel.org>; Thu, 17 Dec 2020 18:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgLQSFL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 17 Dec 2020 13:05:11 -0500
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:43835 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729339AbgLQSFL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Dec 2020 13:05:11 -0500
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20201217180429.KHWL6892.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 17 Dec 2020 13:04:29 -0500
Received: from [192.168.2.49] (really [67.70.16.145]) by torspm02.bell.net
          with ESMTP
          id <20201217180429.MSXR16325.torspm02.bell.net@[192.168.2.49]>;
          Thu, 17 Dec 2020 13:04:29 -0500
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20201217165754.GA5561@ls3530.fritz.box>
From:   John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Drop out of get_whan() if task is running again
Message-ID: <b8e63e02-ef42-2c88-ead4-4a6188b8dd8a@bell.net>
Date:   Thu, 17 Dec 2020 13:04:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201217165754.GA5561@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.4 cv=FdjyeLy6 c=1 sm=1 tr=0 ts=5fdb9dae a=ch4VMz8uGZlcRCFa+4Q1bQ==:117 a=ch4VMz8uGZlcRCFa+4Q1bQ==:17 a=IkcTkHD0fZMA:10 a=zTNgK-yGK50A:10 a=FBHGMhGWAAAA:8 a=mI7e609jE1SloZqUwR0A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4xfIUzp7KY+Db9/nnmub7orI8ciDaUiOmj3FuYtmFG8hlQrG6PEHmOrWXicQp9BwUxnA5eqHlOX5VdCDpFA3zLh7yJWOaRi5WL7ZBYnvAHG5vAE6QN8IWg iUpIns9EkEfREdfUApF1KkI/HvW6gLI8L8Rx91FC1H4s+aOAaMQhkXHIxJoXZLXzWXJZHvwM0aqYFLqPjQlHKpdv2KsTZN5QdYM=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This seems to be a hack to work around a race in p->state.  Don't see this check in other implementations.

On 2020-12-17 11:57 a.m., Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index a92a23d6acd9..fda1c1a6a444 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -260,6 +260,8 @@ get_wchan(struct task_struct *p)
>  	do {
>  		if (unwind_once(&info) < 0)
>  			return 0;
> +		if (p->state == TASK_RUNNING)
> +                        return 0;
>  		ip = info.ip;
>  		if (!in_sched_functions(ip))
>  			return ip;

Dave

-- 
John David Anglin  dave.anglin@bell.net


