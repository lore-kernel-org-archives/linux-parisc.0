Return-Path: <SRS0=+2mb=SG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9391DC10F0E
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 16:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64048206DD
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 16:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="MtvByPsp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfDDQQQ (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Apr 2019 12:16:16 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:50666 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbfDDQQQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Apr 2019 12:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=zLGh7mjPuXZqH/qNEKSqF9veY7azTSBSoBWWCGv4KlY=; b=MtvByPspP6edn2sPwHX5jRAMEw
        EDC8ZA/6dF/z6eE6F5meFOKFEhMZT+PK5KiVSeg/Y66Y0OvuZu5uP14+od7UWJKH2yDHJaJonw9Jk
        lShG0Am1UbVRVRo1ZMAUJj5k0pZ9QedmFQZDO4zvKiMlQiXNFG6Wc4W92q8QtQzc9TQY=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hC52E-0006MG-0Y; Thu, 04 Apr 2019 18:16:14 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/2] parisc: regs_return_value() should return gpr28
Date:   Thu,  4 Apr 2019 18:16:03 +0200
Message-Id: <20190404161604.6165-2-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404161604.6165-1-svens@stackframe.org>
References: <20190404161604.6165-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

While working on kretprobes for PA-RISC i was wondering while the
kprobes sanity test always fails on kretprobes. This is caused by
returning gpr20 instead of gpr28.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
index 2a27b275ab09..4a87b3d600c6 100644
--- a/arch/parisc/include/asm/ptrace.h
+++ b/arch/parisc/include/asm/ptrace.h
@@ -22,7 +22,7 @@ unsigned long profile_pc(struct pt_regs *);
 
 static inline unsigned long regs_return_value(struct pt_regs *regs)
 {
-	return regs->gr[20];
+	return regs->gr[28];
 }
 
 static inline void instruction_pointer_set(struct pt_regs *regs,
-- 
2.20.1

