Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3081C433EF
	for <linux-parisc@archiver.kernel.org>; Sun, 19 Jun 2022 01:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiFSBSq (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 18 Jun 2022 21:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSBSq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Jun 2022 21:18:46 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6108FFD03
        for <linux-parisc@vger.kernel.org>; Sat, 18 Jun 2022 18:18:45 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [64.229.209.22]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 629E2A8B0236B61C
X-CM-Envelope: MS4xfIYiyunoc1T8Uzb3UqHDSXmLVp8+GCyX02afq0JDkFpulC/9FT95fJszdBR6f1gdbQ+7DKdMR1nJVsg1o2CiAGAzU0EhvXcO5qfEe/SsKe06e/nETtk0
 XxaMGXrtCL+0+QhxLvBi3QK8RR1+yTrGMFi3Lf5FfXNPboMF13BwsweASuUMupvp2+HeDReH6dNKV0ktOEqt2BnYWXutqsNrK4XKeJASdZO3bZmH2kSVc1Go
 m58SWEcg4QLJPFKic3ML5VfQZyG1BDGW/COkyWVF76VzuzZSCXnc2IZt1tpVw47eQsC1wO8S/4na/UaUHSM1EjuiPOODTRIIzIX8v9fkywB0b5JC7nKqFCJ/
 CXeT2cuE7ttoU1AcB0YCTcAkb3F+ywvSRtbvh0Q9l6+LFBjArGY=
X-CM-Analysis: v=2.4 cv=Psnw0yA3 c=1 sm=1 tr=0 ts=62ae796e
 a=PzUcMIm+zPr1bDMlhKZIxQ==:117 a=PzUcMIm+zPr1bDMlhKZIxQ==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=ecANfcYXldN5EznTvtEA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (64.229.209.22) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 629E2A8B0236B61C; Sat, 18 Jun 2022 21:18:38 -0400
Message-ID: <9ba8ebca-9d20-85e0-0184-859e08eaa29c@bell.net>
Date:   Sat, 18 Jun 2022 21:18:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] parisc: Fix flush_anon_page on PA8800/PA8900
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yq3r2qO//NzJGVlO@mx3210.localdomain>
 <12000710.O9o76ZdvQC@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <12000710.O9o76ZdvQC@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-06-18 1:08 p.m., Rolf Eike Beer wrote:
> Am Samstag, 18. Juni 2022, 17:14:34 CEST schrieb John David Anglin:
>> Anonymous pages are allocated with the shared mappings colouring,
>> SHM_COLOUR. Since the alias boundary on machines with PA8800 and
>> PA8900 processors is unknown, flush_user_cache_page() might not
>> flush all mappings of a shared anonymous page. Flushing the whole
>> data cache flushes all mappings.
>>
>> This won't fix all coherency issues with shared mappings but it
>> seems to work well in practice.  I haven't seen any random memory
>> faults in almost a month on a rp3440 running as a debian buildd
>> machine.
>>
>> There is a small preformance hit.
> Is there a limit we can limit this to the given CPU types? And given that this
It is limited to PA8800 and PA8900 CPUs by the parisc_requires_coherency() check.
There are already a bunch of similar checks in cache.c that have comments (e.g.,
range an mm flush routines).
> seems to be a best effort workaround I would suggest adding a comment in the
> code as explaining why this happens, otherwise someone looking at the code in
> 3 years may not get the point of it and a quick test will just show "oh, it
> works without that".
The change is not a best effort workaround. Flushing the whole data cache always flushes
all aliases to a page. It could be used for all anonymous page flushes but it is slow.

Shared anonymous mappings only work when the mappings are equivalent or meet the
requirements for multi reader, single writer.  The problem is we don't in general know what
mappings are equivalent on PA8800/PA8900 processors.

There is a comment about the alias boundary of machines with PA8800/PA8900
processors in arch/parisc/include/asm/fixmap.h. This is why we can't flush all aliases
of a shared page with single flush or use tmpalias flushes on these machines. Sometimes
they work and sometimes they don't.

Dave

-- 
John David Anglin  dave.anglin@bell.net

