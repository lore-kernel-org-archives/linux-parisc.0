Return-Path: <SRS0=8551=PN=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685A7C43387
	for <linux-parisc@archiver.kernel.org>; Sat,  5 Jan 2019 21:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DB91222EA
	for <linux-parisc@archiver.kernel.org>; Sat,  5 Jan 2019 21:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfAEVpX (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 5 Jan 2019 16:45:23 -0500
Received: from atl4mhob10.registeredsite.com ([209.17.115.48]:58568 "EHLO
        atl4mhob10.registeredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726318AbfAEVpX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 5 Jan 2019 16:45:23 -0500
Received: from mailpod.hostingplatform.com (atl4qobmail01pod2.registeredsite.com [10.30.77.35])
        by atl4mhob10.registeredsite.com (8.14.4/8.14.4) with ESMTP id x05LjLIk016282
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-parisc@vger.kernel.org>; Sat, 5 Jan 2019 16:45:21 -0500
Received: (qmail 27326 invoked by uid 0); 5 Jan 2019 21:45:21 -0000
X-TCPREMOTEIP: 174.118.245.214
X-Authenticated-UID: dclarke@blastwave.org
Received: from unknown (HELO ?172.16.35.3?) (dclarke@blastwave.org@174.118.245.214)
  by 0 with ESMTPA; 5 Jan 2019 21:45:21 -0000
Subject: Re: [PATCH] parisc: Improve initial IRQ to CPU assignment
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20190104230546.GA18977@p100.box>
 <76386f22-f894-5202-576a-357782743ec4@blastwave.org>
 <e3ba658f-9505-8258-8172-746e234a8bb4@gmx.de>
From:   Dennis Clarke <dclarke@blastwave.org>
Message-ID: <0d94b184-fd9f-b143-037f-7536f9e59625@blastwave.org>
Date:   Sat, 5 Jan 2019 16:45:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:65.0) Gecko/20100101
 Thunderbird/65.0
MIME-Version: 1.0
In-Reply-To: <e3ba658f-9505-8258-8172-746e234a8bb4@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/5/19 4:21 PM, Helge Deller wrote:
> On 05.01.19 00:21, Dennis Clarke wrote:
>> On 1/4/19 6:05 PM, Helge Deller wrote:
>>> On parisc, each IRQ can only be handled by one CPU, and currently CPU0
>>> is choosen as default for handling all IRQs by default.
>>> With this patch we now assign each requested IRQ to one of the online
>>> CPUs (and thus distribute the IRQs across all CPUs), even without an
>>> instance of irqbalance running.
>>
>> Will this take into consideration the features in default_smp_affinity
>> and allow processor cores to be considered 'non interrupt' service
>> state?
> 
> It seems the feature of default_smp_affinity to disable specific cores from
> servicing interrupts doesn't work on the parisc platform.
> On a 2-CPU machine I booted with the "irqaffinity=0" kernel commandline option
> (to enable CPU#0 and disable CPU#1), which then led to a hanging kernel when
> CPU#1 ist started.
> On parisc, each CPU needs to handle at least it's timer and IPMI interrupt.
> Any idea what I should try?

Sorry, the first question was "does this work there" and we now know it
is most likely "no". I tried similar on ppc64 and also arrived at
nothing but problems.

I am somewhat focused on digging into RISC-V at the moment and your post
raised the question in my mind.

One of the features I once enjoyed about Solaris was that it could
easily bring cpu cores online and offline as well as disable irq service
disruptions on any core with a trivial one line command. I always wanted
to port something similar over to linux but would start with something
interesting like RISC-V.

I'll get back to you on this one.

Dennis Clarke

ps: Also I still have those black superdomes standing around doing
     nothing and still want to get serial attached, powered up, etc.
     Yet another news years resolution post-it note idea.








