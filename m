Return-Path: <SRS0=cK3J=PM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2104C43387
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 23:21:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1895721872
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 23:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfADXVi (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 4 Jan 2019 18:21:38 -0500
Received: from atl4mhob10.registeredsite.com ([209.17.115.48]:38310 "EHLO
        atl4mhob10.registeredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726009AbfADXVi (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 4 Jan 2019 18:21:38 -0500
Received: from mailpod.hostingplatform.com (atl4qobmail02pod2.registeredsite.com [10.30.77.36])
        by atl4mhob10.registeredsite.com (8.14.4/8.14.4) with ESMTP id x04NLa5S023341
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-parisc@vger.kernel.org>; Fri, 4 Jan 2019 18:21:37 -0500
Received: (qmail 13841 invoked by uid 0); 4 Jan 2019 23:21:36 -0000
X-TCPREMOTEIP: 174.118.245.214
X-Authenticated-UID: dclarke@blastwave.org
Received: from unknown (HELO ?172.16.35.3?) (dclarke@blastwave.org@174.118.245.214)
  by 0 with ESMTPA; 4 Jan 2019 23:21:36 -0000
Subject: Re: [PATCH] parisc: Improve initial IRQ to CPU assignment
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20190104230546.GA18977@p100.box>
From:   Dennis Clarke <dclarke@blastwave.org>
Message-ID: <76386f22-f894-5202-576a-357782743ec4@blastwave.org>
Date:   Fri, 4 Jan 2019 18:21:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:65.0) Gecko/20100101
 Thunderbird/65.0
MIME-Version: 1.0
In-Reply-To: <20190104230546.GA18977@p100.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 1/4/19 6:05 PM, Helge Deller wrote:
> On parisc, each IRQ can only be handled by one CPU, and currently CPU0
> is choosen as default for handling all IRQs by default.
> With this patch we now assign each requested IRQ to one of the online
> CPUs (and thus distribute the IRQs across all CPUs), even without an
> instance of irqbalance running.

Will this take into consideration the features in default_smp_affinity
and allow processor cores to be considered 'non interrupt' service
state?

Dennis
