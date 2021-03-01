Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7896C43331
	for <linux-parisc@archiver.kernel.org>; Mon,  1 Mar 2021 16:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B04E8650B3
	for <linux-parisc@archiver.kernel.org>; Mon,  1 Mar 2021 16:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbhCAQyB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 1 Mar 2021 11:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhCAQu0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Mar 2021 11:50:26 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBBBC061788
        for <linux-parisc@vger.kernel.org>; Mon,  1 Mar 2021 08:49:45 -0800 (PST)
Received: (qmail 14914 invoked from network); 1 Mar 2021 16:49:43 -0000
Received: from p548d494d.dip0.t-ipconnect.de ([::ffff:84.141.73.77]:45124 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 01 Mar 2021 17:49:43 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Re: Cycle offset is larger than allowed by the 'jiffies' clock's max_cycles value
Date:   Mon, 01 Mar 2021 17:49:42 +0100
Message-ID: <5693583.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <11708426.O9o76ZdvQC@eto.sf-tec.de>
References: <11708426.O9o76ZdvQC@eto.sf-tec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Am Montag, 1. März 2021, 17:25:18 CET schrieb Rolf Eike Beer:
> After upgrade to 5.11 get this multiple times per second on my C8000:
> 
> [   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than
> allowed by the 'jiffies' clock's max_cycles value (10): time overflow
> danger [   36.998705]          timekeeping: Your kernel is sick, but tries
> to cope by capping time updates

Not 5.11, but 5.10.11. 5.10.4 is fine. It could be a bad upgrade attempt, I'll 
retry once I have built a proper 5.11 kernel.


