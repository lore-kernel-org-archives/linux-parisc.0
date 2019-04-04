Return-Path: <SRS0=+2mb=SG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678D9C4360F
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 16:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00E1C206DD
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 16:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="IuqNErBT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbfDDQQO (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Apr 2019 12:16:14 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:49152 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfDDQQO (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Apr 2019 12:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=JaNoaxbNsQuW5nTwSGjdhltpq7ZGHk+p7xYohCof6So=; b=IuqNErBTNJWmBg7fkoKyVehtiu
        aXgS+kyQMkkNqjPdivYxF4H4kWr6Wi2WcpXaKBh50EsshltggClGx/cCpoU+QOwZ8eN30plLgEJeg
        G98SEpTbbNQSPZRIV1yaHALURHGNmY2iQ45c8RUjn9KXKpa2FiWYtFYOVbDQtNHyMUiM=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hC52D-0006MG-54; Thu, 04 Apr 2019 18:16:13 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/2] small ptrace fixes
Date:   Thu,  4 Apr 2019 18:16:02 +0200
Message-Id: <20190404161604.6165-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

while working on kprobes i found two small issues in ptrace.h.

Sven Schnelle (2):
  parisc: regs_return_value() should return gpr28
  parisc: also set iaoq_b in instruction_pointer_set()

 arch/parisc/include/asm/ptrace.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.20.1

