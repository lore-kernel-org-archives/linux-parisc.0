Return-Path: <SRS0=Ki67=SN=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028DBC10F13
	for <linux-parisc@archiver.kernel.org>; Thu, 11 Apr 2019 13:18:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C37172077C
	for <linux-parisc@archiver.kernel.org>; Thu, 11 Apr 2019 13:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfDKNSb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 11 Apr 2019 09:18:31 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:48457 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726264AbfDKNSb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Apr 2019 09:18:31 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190411131830.MMBP4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 11 Apr 2019 09:18:30 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by torspm02.bell.net
          with ESMTP
          id <20190411131829.UQUL30132.torspm02.bell.net@[192.168.0.183]>;
          Thu, 11 Apr 2019 09:18:29 -0400
From:   John David Anglin <dave.anglin@bell.net>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
 <1554580144.5053.4.camel@HansenPartnership.com>
 <alpine.LRH.2.02.1904061610580.27483@file01.intranet.prod.int.rdu2.redhat.com>
 <1554582741.5053.7.camel@HansenPartnership.com>
 <alpine.LRH.2.02.1904061635090.31596@file01.intranet.prod.int.rdu2.redhat.com>
 <5028ebb4-e1eb-6c77-5466-86838e938aa2@bell.net>
 <alpine.LRH.2.02.1904101205480.13246@file01.intranet.prod.int.rdu2.redhat.com>
 <e81cc4d8-0da9-454b-6102-c89bb5cdd0b0@bell.net>
Openpgp: preference=signencrypt
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
Message-ID: <31ec647c-f2a1-e210-aad1-bdd6e85ae39f@bell.net>
Date:   Thu, 11 Apr 2019 09:18:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e81cc4d8-0da9-454b-6102-c89bb5cdd0b0@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=gjj6d3ArIopus2RXZl0A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfALh9qpZV2xiKXAqfDx+uwkUfIZHG6IGzR1z7XHl6oOIhjtq5AI7BfmCq5k9rKdIMeeiJunkk651wf42K6f0l1fozLwO3uyh1Y4bCf2+1O1duerz3SUw e3c7u5J+gaSXkt4yIQ61QFMQv/DEveA77+vElAGMyYAbtHSDBfTqBSU0mm8AYxFSGiI+FIgfOhdVnQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-10 2:32 p.m., John David Anglin wrote:
>> Having one lock shared by all four cores degrades performance 
>> significantly (30%).
> I can believe that.
I installed patch on c8000.  It reduced my v5.0.7 kernel build time from about
51 to 39 minutes using -j6.  So, the speed improvement is definitely there.

Dave

-- 
John David Anglin  dave.anglin@bell.net


