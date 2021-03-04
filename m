Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E17C433E9
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Mar 2021 01:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3971C651AA
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Mar 2021 01:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234518AbhCDBVH (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 3 Mar 2021 20:21:07 -0500
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:41023 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S235898AbhCDBUU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Mar 2021 20:20:20 -0500
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20210304011939.NCQW6892.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 3 Mar 2021 20:19:39 -0500
Received: from [192.168.2.49] (really [70.50.109.22]) by torspm02.bell.net
          with ESMTP
          id <20210304011939.BSXE16325.torspm02.bell.net@[192.168.2.49]>;
          Wed, 3 Mar 2021 20:19:39 -0500
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's
 max_cycles value
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
 <2570738.mvXUDI8C0e@daneel.sf-tec.de>
 <69833c49-2eb4-5f6c-fdb6-a1e01d105a8c@gmx.de>
 <2573053.mvXUDI8C0e@eto.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <6b196075-ce8d-9a00-9751-f501ed8b3020@bell.net>
Date:   Wed, 3 Mar 2021 20:19:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2573053.mvXUDI8C0e@eto.sf-tec.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.4 cv=ctpeL30i c=1 sm=1 tr=0 ts=604035ab a=S6gQgrXzeH76ECG4GouVuA==:117 a=S6gQgrXzeH76ECG4GouVuA==:17 a=N659UExz7-8A:10 a=dESyimp9J3IA:10 a=FBHGMhGWAAAA:8 a=CnWpnnB4mX9G016wdOkA:9 a=pILNOxqGKmIA:10 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4xfH+v3aRDmknx8bFTes6ozggCyB2GDw5+IVvCPTxGeT6WWcaNjqKMcoMTsnghNEI+kb456rNoLlG7QNReG7CkJdl6YbsaPGzwZBs6EdICYHV+d3dlbRaw oY/CtQKyxOnAzojUTwHmd7GMZ7pZcWJAHuz0Qzf4sCm8Nir+86Qwi/hmucfGZZbvNK4TH1ZJfTNd7luvQJCentkY6NVzkSs7FEg=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-03-03 9:43 a.m., Rolf Eike Beer wrote:
> I don't see it in 5.10.4, but in 5.11.2. I have not tried 5.11.0.
I have tried almost every 5.10.x version and haven't seen it on rp3440 or c8000.

Dave

-- 
John David Anglin  dave.anglin@bell.net

