Return-Path: <SRS0=iI52=RV=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAB0C43381
	for <linux-parisc@archiver.kernel.org>; Mon, 18 Mar 2019 15:40:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1881C20854
	for <linux-parisc@archiver.kernel.org>; Mon, 18 Mar 2019 15:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfCRPkU (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 18 Mar 2019 11:40:20 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:37941 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726932AbfCRPkU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 18 Mar 2019 11:40:20 -0400
X-Greylist: delayed 466 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 Mar 2019 11:40:19 EDT
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190318153232.OIGY4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 18 Mar 2019 11:32:32 -0400
Received: from [192.168.0.138] (really [64.231.92.241])
          by torspm02.bell.net with ESMTP
          id <20190318153232.RWEF30132.torspm02.bell.net@[192.168.0.138]>;
          Mon, 18 Mar 2019 11:32:32 -0400
Subject: Re: [PATCH] parisc: fix iosapic address compare
To:     Sven Schnelle <svens@stackframe.org>, deller@gmx.de
Cc:     linux-parisc@vger.kernel.org
References: <20190318141301.14750-1-svens@stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <51f4b2d9-8cba-1e54-e30a-3e51122bdc12@bell.net>
Date:   Mon, 18 Mar 2019 11:32:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <20190318141301.14750-1-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 a=jJmVOGxBrKxWvcjqaG+oVg==:117 a=jJmVOGxBrKxWvcjqaG+oVg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=NTGMnVQrEZIA:10 a=FBHGMhGWAAAA:8 a=QYXFQF2rjhO-mT10FUQA:9 a=QEXdDO2ut3YA:10 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfE8kiCMMUPhfyJ9OKV8Otha1O3b6P9pMG1BoTryimwoA5fEQY4wbIKMofpoZX0NLtR0z0J3hacQvzjiF4pWuEhobqVHxP6siko9hvIrOq5UyA8+NUyZZ kBgHMHBgGunW3ZAEB+0snPwss6Go6H5TzVzdW4TBO5mhgGbiLe7JvwUpMQjdYJdlZdYjJM23phvR8A==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-03-18 10:13 a.m., Sven Schnelle wrote:
> Using F_EXTEND doesn't work here as it casts hpa to long,
Actually, it casts to unsigned long.

Dave

-- 
John David Anglin  dave.anglin@bell.net

