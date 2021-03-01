Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B510FC433DB
	for <linux-parisc@archiver.kernel.org>; Mon,  1 Mar 2021 16:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81D3C64D9E
	for <linux-parisc@archiver.kernel.org>; Mon,  1 Mar 2021 16:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhCAQaL (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 1 Mar 2021 11:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234133AbhCAQ0I (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Mar 2021 11:26:08 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D85C06178B
        for <linux-parisc@vger.kernel.org>; Mon,  1 Mar 2021 08:25:21 -0800 (PST)
Received: (qmail 13981 invoked from network); 1 Mar 2021 16:25:19 -0000
Received: from p548d494d.dip0.t-ipconnect.de ([::ffff:84.141.73.77]:44964 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Mon, 01 Mar 2021 17:25:19 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc <linux-parisc@vger.kernel.org>
Subject: Cycle offset is larger than allowed by the 'jiffies' clock's max_cycles value
Date:   Mon, 01 Mar 2021 17:25:18 +0100
Message-ID: <11708426.O9o76ZdvQC@eto.sf-tec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

After upgrade to 5.11 get this multiple times per second on my C8000:

[   36.998702] WARNING: timekeeping: Cycle offset (29) is larger than allowed 
by the 'jiffies' clock's max_cycles value (10): time overflow danger
[   36.998705]          timekeeping: Your kernel is sick, but tries to cope by 
capping time updates



