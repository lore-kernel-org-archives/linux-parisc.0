Return-Path: <SRS0=FW0n=SM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E634C10F11
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 19:27:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E10492070D
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 19:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbfDJT1P (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 10 Apr 2019 15:27:15 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:60114 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726093AbfDJT1P (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Apr 2019 15:27:15 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190410192714.SKIA4444.mtlfep02.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 10 Apr 2019 15:27:14 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by mtlspm02.bell.net
          with ESMTP
          id <20190410192714.NWGS21689.mtlspm02.bell.net@[192.168.0.183]>;
          Wed, 10 Apr 2019 15:27:14 -0400
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
From:   John David Anglin <dave.anglin@bell.net>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
 <1554580144.5053.4.camel@HansenPartnership.com>
 <14301958-d484-dceb-b48f-c5bb91c0639e@bell.net>
Openpgp: preference=signencrypt
Message-ID: <a870fe87-0a23-a829-b388-ca9499fc7596@bell.net>
Date:   Wed, 10 Apr 2019 15:27:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <14301958-d484-dceb-b48f-c5bb91c0639e@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=t0DcdKgBo8V1w7bdpB8A:9 a=QEXdDO2ut3YA:10 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfFKaqmI998NrHemez+Rdk7OVzu7zmEaH2+Zxk9kbcLzo+/q0JOo8sFbluVQ9g0425AHy7So5ZBI2zwH8YCEwnk0PrPEotL9fpCzC1dQLtmtQC/YRDzMP HxEUy08HWVlc96y+YBXQ05HNWlN4vSMrsjdZxrDJ3rtg8Rvj3pcwRumG2mLoECTfa1rd3kHb0weUHw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-10 3:10 p.m., John David Anglin wrote:
> Was merced bus used on PA 1.x?  If not, then the locks could be
> removed.
Openpa states that merced bus was used in L1500, L3000 and N4000.  All are Pa 2.0,
so locks are not needed.

Dave

-- 
John David Anglin  dave.anglin@bell.net

