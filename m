Return-Path: <SRS0=zQSf=SJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09700C10F0E
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99C6A20896
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="THEK89T2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfDGSLH (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 7 Apr 2019 14:11:07 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:43254 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfDGSLH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Apr 2019 14:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=jBZLz2IwXhdmRKPltTS/AN+JXAvzm5RxalxVIas/+l0=; b=THEK89T27wVjEirX35pEBRiSHl
        XfqB5tm0EBfL6Bk4dGag2oTkTga2ZPvEzuN8JPamgVm/Qg16cji1r0CnorKRlBmH0UNUU73mqlw7G
        BEMnRObHnAFcCV0pnNseahGKt3XYXbgsQ5eDw7AqdsB1HgKobjfD60Io9Kvn9YjErq/0=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDCG0-0000mt-RY; Sun, 07 Apr 2019 20:11:04 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/2] parisc: add kprobes
Date:   Sun,  7 Apr 2019 20:10:56 +0200
Message-Id: <20190407181058.29728-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

these two patches implement kprobes for PA-RISC.

Sven Schnelle (2):
  parisc: add functions required by KPROBE_EVENTS
  parisc: Implement kprobes

 arch/parisc/Kconfig               |   1 +
 arch/parisc/include/asm/kprobes.h |  55 +++++++++
 arch/parisc/include/asm/ptrace.h  |  13 +++
 arch/parisc/kernel/Makefile       |   1 +
 arch/parisc/kernel/kprobes.c      | 183 ++++++++++++++++++++++++++++++
 arch/parisc/kernel/ptrace.c       |  35 ++++++
 arch/parisc/kernel/traps.c        |  14 +++
 7 files changed, 302 insertions(+)
 create mode 100644 arch/parisc/include/asm/kprobes.h
 create mode 100644 arch/parisc/kernel/kprobes.c

-- 
2.20.1

