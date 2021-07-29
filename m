Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC623C4338F
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Jul 2021 14:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF53D60F4B
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Jul 2021 14:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbhG2OZ0 (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 29 Jul 2021 10:25:26 -0400
Received: from condef-08.nifty.com ([202.248.20.73]:29322 "EHLO
        condef-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbhG2OZZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Jul 2021 10:25:25 -0400
X-Greylist: delayed 448 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Jul 2021 10:25:25 EDT
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-08.nifty.com with ESMTP id 16TEEng3009963
        for <linux-parisc@vger.kernel.org>; Thu, 29 Jul 2021 23:14:49 +0900
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 16TEDnBu018370;
        Thu, 29 Jul 2021 23:13:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 16TEDnBu018370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627568029;
        bh=bbySyuuah6N6af0tiTiJxusQPyKJl35SSLwlzPEv9sQ=;
        h=From:To:Cc:Subject:Date:From;
        b=RYtHqber/Tj7qdOZP8g+/eGio9fHshWYHPnE9GJ0ZcSg5PhGe44irMHcwMj6NXzMQ
         cozlbOLOxzxO2mRxJrbwlt4IJLPCvjDhhDMCp5jW+/yVbgV9zBjRp/mFkbiFcGP1p0
         JqzIdoxGAWV3oPzGSTlGtaSURcfTle93fK1dJO2lVDOtQdNYxqvF75a1L3adZqkQJ7
         2paIPR26rltrwgzbMuGwrlEhwBxYGUitfB+fq7HAM7VY4yco/mJet5nnY7mt1wbwmQ
         cydOGcr/o/Pbi3FA0Ww/6wNAgDgDP5bkbdVuWF17XcfC1hVLMi+FeWCgP88kohWaXj
         yJAxiAuKb0o5Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: remove unused install target from arch/parisc/boot/Makefile
Date:   Thu, 29 Jul 2021 23:13:47 +0900
Message-Id: <20210729141347.444364-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The install.sh script is invoked from arch/parisc/Makefile.

The install target in arch/parisc/boot/Makefile is never used.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/parisc/boot/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/parisc/boot/Makefile b/arch/parisc/boot/Makefile
index 61f44142cfe1..b873ee4720ca 100644
--- a/arch/parisc/boot/Makefile
+++ b/arch/parisc/boot/Makefile
@@ -15,7 +15,3 @@ $(obj)/bzImage: $(obj)/compressed/vmlinux FORCE
 
 $(obj)/compressed/vmlinux: FORCE
 	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
-
-install: $(CONFIGURE) $(obj)/bzImage
-	sh -x  $(srctree)/$(obj)/install.sh $(KERNELRELEASE) $(obj)/bzImage \
-	      System.map "$(INSTALL_PATH)"
-- 
2.27.0

