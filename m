Return-Path: <SRS0=zn+d=UE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FBBC28D19
	for <linux-parisc@archiver.kernel.org>; Wed,  5 Jun 2019 20:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63EA32075B
	for <linux-parisc@archiver.kernel.org>; Wed,  5 Jun 2019 20:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="SddVfVGp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfFEUc1 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 5 Jun 2019 16:32:27 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:36729 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfFEUc0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jun 2019 16:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=5YGYDUkYdAUpfT0Xr+s3BY3YgmF/shWOzJW/ii8TAfo=; b=SddVfVGpM7HMbFx5sKAqj02f/Q
        TkkAdt2eh1cGJxCtQ78ECmmYRGq0tCAQKRvFdlYaycLYT+DcFiP8Pnd5Q/TNnHmsjdkXeN3+OW0bm
        Mh4jVanAHsBd3DjyPXGy+wUb3e3o/Bvf8it4RyYmphhtGGiHRAbCW6dT10TM+DNnt85E=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYca8-0004ei-WD; Wed, 05 Jun 2019 22:32:25 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v3 3/6] parisc: add WARN_ON() to clear_fixmap
Date:   Wed,  5 Jun 2019 22:32:19 +0200
Message-Id: <20190605203222.6194-4-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605203222.6194-1-svens@stackframe.org>
References: <20190605203222.6194-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Calling clear_fixmap() on an already cleared fixed mapping is
a bad thing to do. Add a WARN_ON() to catch such issues.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/mm/fixmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
index c8d41b54fb19..36321bcd75ba 100644
--- a/arch/parisc/mm/fixmap.c
+++ b/arch/parisc/mm/fixmap.c
@@ -35,6 +35,9 @@ void clear_fixmap(enum fixed_addresses idx)
 	pmd_t *pmd = pmd_offset(pgd, vaddr);
 	pte_t *pte = pte_offset_kernel(pmd, vaddr);
 
+	if (WARN_ON(pte_none(*pte)))
+		return;
+
 	pte_clear(&init_mm, vaddr, pte);
 
 	flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
-- 
2.20.1

