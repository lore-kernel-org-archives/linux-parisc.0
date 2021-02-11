Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A607C4332B
	for <linux-parisc@archiver.kernel.org>; Thu, 11 Feb 2021 23:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53EE864E42
	for <linux-parisc@archiver.kernel.org>; Thu, 11 Feb 2021 23:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhBKXf1 (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:35:27 -0500
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:60650 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230110AbhBKXfX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:35:23 -0500
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20210211233441.XNVV52743.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Thu, 11 Feb 2021 18:34:41 -0500
Received: from [192.168.2.49] (really [70.50.109.22]) by mtlspm01.bell.net
          with ESMTP
          id <20210211233441.KALD130487.mtlspm01.bell.net@[192.168.2.49]>;
          Thu, 11 Feb 2021 18:34:41 -0500
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v11)
To:     Helge Deller <deller@gmx.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-parisc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
References: <94210da5-5642-82ef-85ae-688e1c07473d@gmx.de>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box>
 <20210210145218.GA50561@roeck-us.net>
 <c7996434-198a-2a57-ac58-18ab6e1faf10@gmx.de>
 <288444d5-811f-db8f-6322-e26425527895@bell.net>
 <20210211012047.GA95605@roeck-us.net>
 <51fe1d4a-a2a0-b202-692f-c3db1843785c@bell.net>
 <20210211215131.GA127652@roeck-us.net>
 <06b31cea-61ce-a3a2-8abe-48aa5ab9dafb@bell.net> <YCW6RF/JiD/ezW3q@ls3530>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <f9a8532c-5bed-cdf6-8e94-32baf2bc8f84@bell.net>
Date:   Thu, 11 Feb 2021 18:34:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCW6RF/JiD/ezW3q@ls3530>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.4 cv=KPWfsHJo c=1 sm=1 tr=0 ts=6025bf11 a=S6gQgrXzeH76ECG4GouVuA==:117 a=S6gQgrXzeH76ECG4GouVuA==:17 a=Q9fys5e9bTEA:10 a=qa6Q16uM49sA:10 a=FBHGMhGWAAAA:8 a=JbuovF86tRVwbCpPZz0A:9 a=PUjeQqilurYA:10 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4xfMNDEsdmv49/XmyKQ9cwXcboPhzXtwIVhbtY3laUWWXUaxsQN4m/dfX0CcEDixifnRTo9QyD9E1rHWTgsI30j+3JxrHgIj55Vs8/mtTskylxpfAsW6py d/e6Gzp9IOxTedDPjbZ7BoOuROmKXl+bsogAxvbsg41kztpikhStKx4+OlvFeXA8H8gGj1dbgetV0+tGHfm0BXZqlYnokaIIKcA=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-02-11 6:14 p.m., Helge Deller wrote:
> Patch is attached below.
> I added a memory-barrier to set_pte() too.
I think the huge page support needs looking at.

-- 
John David Anglin  dave.anglin@bell.net

