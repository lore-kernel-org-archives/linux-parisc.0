Return-Path: <SRS0=x+in=DG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9F1C4727C
	for <linux-parisc@archiver.kernel.org>; Tue, 29 Sep 2020 18:01:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A05CA20848
	for <linux-parisc@archiver.kernel.org>; Tue, 29 Sep 2020 18:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgI2SBB (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 29 Sep 2020 14:01:01 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:56013 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725320AbgI2SBA (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Sep 2020 14:01:00 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20200929180059.JZWV6892.torfep01.bell.net@torspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 29 Sep 2020 14:00:59 -0400
Received: from [192.168.2.49] (really [70.53.61.197]) by torspm01.bell.net
          with ESMTP
          id <20200929180059.OENS29322.torspm01.bell.net@[192.168.2.49]>;
          Tue, 29 Sep 2020 14:00:59 -0400
Subject: Re: v5.8.x stability on parisc
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <bd1c6298-db1a-79ab-279b-60daad6bed22@bell.net>
 <387e5574-a270-f3cc-d0f2-a26d0383b7e6@gmx.de>
 <60f8a51e-ac6e-d49c-e63e-d2b83cf4de22@bell.net>
Message-ID: <8e6982fc-3d51-bb1e-f115-29e762a0c8c0@bell.net>
Date:   Tue, 29 Sep 2020 14:00:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <60f8a51e-ac6e-d49c-e63e-d2b83cf4de22@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=XvWExmN9 c=1 sm=1 tr=0 a=6x1y2OhCX1CAR/Lk3lU3cg==:117 a=6x1y2OhCX1CAR/Lk3lU3cg==:17 a=IkcTkHD0fZMA:10 a=reM5J-MqmosA:10 a=FBHGMhGWAAAA:8 a=opvMgGF1JOavQCFRZBYA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfI9uu/5Y1FWVvqdVGWvXom1LRRuI6zxUb02XAr/v/RueEzpgML1PWXx3kqejWVRoAbQp7o9IlPRPV7C3qyyv8sNaUXswJG1PdN8mLUVgCneTAtkK7/mY nvVnWpYqsLypm74NKfOIBaiEdOnfxM2wG8zntobRZiFboHLnHOG1G4UNUeap2H9wOLnw7+kxYWU8/g==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-09-27 5:24 p.m., John David Anglin wrote:
> Thought so but nothing has been committed to v5.8.x that conflicts with the changes.  I also searched the git log
> for similar commits but I didn't find anything.  So, I'm puzzled as to what happened to these changes.  This is the
> main reason I threw out my patch list for discussion.
A revised patch is in v5.9-rc7.

-- 
John David Anglin  dave.anglin@bell.net

