Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7759C48BDF
	for <linux-parisc@archiver.kernel.org>; Wed,  9 Jun 2021 15:33:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D36360FF0
	for <linux-parisc@archiver.kernel.org>; Wed,  9 Jun 2021 15:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbhFIPe7 (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:34:59 -0400
Received: from mx2.cyber.ee ([45.144.6.23]:50313 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233384AbhFIPe5 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:34:57 -0400
Subject: Re: linux-parisc compile failure in current git
To:     Helge Deller <deller@gmx.de>
References: <892b6ab7-862c-1c0a-2996-0f8408e5043d@linux.ee>
 <1ebff319-ad1d-0b83-d0b8-e3c88a8f3e48@gmx.de>
Cc:     linux-parisc@vger.kernel.org
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <eaaaaa72-d79e-27a2-9bdb-2e44c047e0ba@linux.ee>
Date:   Wed, 9 Jun 2021 18:31:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1ebff319-ad1d-0b83-d0b8-e3c88a8f3e48@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

09.06.21 14:04 Helge Deller wrote:
> Does it still happens?

Yes, it does still happen with v5.13-rc5-36-g368094df48e6

-- 
Meelis Roos <mroos@linux.ee>
