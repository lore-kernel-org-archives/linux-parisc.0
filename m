Return-Path: <SRS0=jFxy=TI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF91C04A6B
	for <linux-parisc@archiver.kernel.org>; Wed,  8 May 2019 14:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FAE821530
	for <linux-parisc@archiver.kernel.org>; Wed,  8 May 2019 14:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfEHOYF (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 8 May 2019 10:24:05 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:47039 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726914AbfEHOYF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 8 May 2019 10:24:05 -0400
To:     linux-parisc@vger.kernel.org
From:   Meelis Roos <mroos@linux.ee>
Subject: 5.2 hppa merge seems to work on my machines
Message-ID: <c0546c1b-9477-60f8-6fa9-df710e5bbd0c@linux.ee>
Date:   Wed, 8 May 2019 17:23:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Just tested v5.1-5445-g80f232121b69 git on A180c, rp2450, rp2470, rp3410 and rp3440 and
it seems to work everywhere for me.

-- 
Meelis Roos
