Return-Path: <SRS0=bQ1H=QO=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E96FC169C4
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 01:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 298732081B
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 01:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfBGBmo (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 6 Feb 2019 20:42:44 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:39266 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbfBGBmo (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 6 Feb 2019 20:42:44 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id D526C140B81CC;
        Wed,  6 Feb 2019 17:42:43 -0800 (PST)
Date:   Wed, 06 Feb 2019 17:42:43 -0800 (PST)
Message-Id: <20190206.174243.1818145739380066527.davem@davemloft.net>
To:     albin_yang@163.com
Cc:     netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        yang.wei9@zte.com.cn
Subject: Re: [PATCH net] net: tulip: de2104x: replace dev_kfree_skb_irq by
 dev_consume_skb_irq for drop profiles
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1549382631-5211-1-git-send-email-albin_yang@163.com>
References: <1549382631-5211-1-git-send-email-albin_yang@163.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 06 Feb 2019 17:42:44 -0800 (PST)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Yang Wei <albin_yang@163.com>
Date: Wed,  6 Feb 2019 00:03:51 +0800

> From: Yang Wei <yang.wei9@zte.com.cn>
> 
> dev_consume_skb_irq() should be called in de_tx() when skb xmit
> done. It makes drop profiles(dropwatch, perf) more friendly.
> 
> Signed-off-by: Yang Wei <yang.wei9@zte.com.cn>

Applied.
