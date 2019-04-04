Return-Path: <SRS0=+2mb=SG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CC5C4360F
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 19:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDF08206B7
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 19:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="mdj3Zo5n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbfDDTOw (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Apr 2019 15:14:52 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:33751 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbfDDTOv (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Apr 2019 15:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=78IeIiaTW/IumaLqfRMh+7JxtDEcZBIu8WvMaXXTDF4=; b=mdj3Zo5nTCZ4icYzaUqnkvigce
        Kyzf8zPgOaGwOjGw0zp8guvBYf+Eqv9tceC/Xf+WME3PWrkGSy2iv4F8CMnVZSu3Hog8Ge3Rscegw
        rZKMathHK/NTje0+siBCogXtCay/NZmEW7i4A/nRkhFwdi9d8Sh5RZzm4PodJStw2ry0=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hC7p3-00012K-RT; Thu, 04 Apr 2019 21:14:49 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2 0/3] Add KGDB support to PA-RISC
Date:   Thu,  4 Apr 2019 21:14:07 +0200
Message-Id: <20190404191410.3444-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

this is v2 of the patch set. Changes compared to v1:

- add a missing #ifdef CONFIG_KGDB in traps.c, to fix a compile error
  when CONFIG_KGDB is not enabled.
- call __patch_text() in kgdb, as kgdb already stops all CPUs.

Sven Schnelle (3):
  parisc: add set_fixmap()/clear_fixmap()
  parisc: add parisc code patching
  parisc: add KGDB support

 arch/parisc/Kconfig              |   1 +
 arch/parisc/include/asm/fixmap.h |  19 ++-
 arch/parisc/include/asm/kgdb.h   |  68 ++++++++++
 arch/parisc/include/asm/patch.h  |  11 ++
 arch/parisc/kernel/Makefile      |   4 +-
 arch/parisc/kernel/kgdb.c        | 210 +++++++++++++++++++++++++++++++
 arch/parisc/kernel/patch.c       |  78 ++++++++++++
 arch/parisc/kernel/traps.c       |  17 +++
 arch/parisc/mm/Makefile          |   2 +-
 arch/parisc/mm/fixmap.c          |  43 +++++++
 arch/parisc/mm/init.c            |  14 ++-
 11 files changed, 459 insertions(+), 8 deletions(-)
 create mode 100644 arch/parisc/include/asm/kgdb.h
 create mode 100644 arch/parisc/include/asm/patch.h
 create mode 100644 arch/parisc/kernel/kgdb.c
 create mode 100644 arch/parisc/kernel/patch.c
 create mode 100644 arch/parisc/mm/fixmap.c

-- 
2.20.1

