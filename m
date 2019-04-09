Return-Path: <SRS0=WYTU=SL=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD18C10F0E
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47FA320857
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="FGK695dZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfDIRai (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 9 Apr 2019 13:30:38 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:60881 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfDIRai (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Apr 2019 13:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=9UVtO62V9PjGnTuhjDptSnxfQpzzHsZDwz9PRXGilbY=; b=FGK695dZn6XUQqxXkaDGZJt5Uu
        cAnrrn6urHf1XnxzyH/+dRQJga5koczgKvZV+aQhXRxIp2z/UJ8Eg+0Dgkpk0ebHj7jfDqaeaBO/U
        XyrHhJbLhTU3Qcm3i0OVH8Oa/7+JYsOn1MVZChRCoQsopJFpzz3eNZd7vKclp0ERJt9E=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDuZw-0002co-Kc; Tue, 09 Apr 2019 19:30:36 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/4] kretprobes for parisc / cleanups
Date:   Tue,  9 Apr 2019 19:30:26 +0200
Message-Id: <20190409173030.26234-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

this patchset implements kretprobes for PA-RISC. While working on
kretprobes i've also made some minor fixes.

Sven Schnelle (4):
  parisc: remove kprobes.h from generic-y
  parisc: Implement kretprobes
  doc: update kprobes supported architecture list
  parisc: remove unused flags parameter in __patch_text()

 .../features/debug/kprobes/arch-support.txt   |   2 +-
 Documentation/kprobes.txt                     |   1 +
 arch/parisc/Kconfig                           |   1 +
 arch/parisc/include/asm/Kbuild                |   1 -
 arch/parisc/kernel/kprobes.c                  | 110 +++++++++++++++++-
 arch/parisc/kernel/patch.c                    |   9 +-
 6 files changed, 116 insertions(+), 8 deletions(-)

-- 
2.20.1

