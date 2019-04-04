Return-Path: <SRS0=+2mb=SG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E01C10F0C
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 16:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28637206DD
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 16:16:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="o5pRg0p8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbfDDQQR (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Apr 2019 12:16:17 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:36619 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfDDQQQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Apr 2019 12:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=FHy9bbo//vCWJaRJ85qioIUdgQbTjFg4htKMHFQX9Xs=; b=o5pRg0p8jlsYAHbd8Sq++Z2Hq9
        VfOkaePkKRih8iVx49KzLvSaTtyR+Z2Wk91B7VCvRqUtJRaz0Om+Qq9N0hggC9IrEB7NIHkDgRoHP
        yDMpE1PjDkZ0KzbjFCvGVJD/uCLo5LamXj4Lpjd3LEl0yP/JPofeGtdiXHYiyFdMhGhg=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hC52E-0006MG-QS; Thu, 04 Apr 2019 18:16:14 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/2] parisc: also set iaoq_b in instruction_pointer_set()
Date:   Thu,  4 Apr 2019 18:16:04 +0200
Message-Id: <20190404161604.6165-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404161604.6165-1-svens@stackframe.org>
References: <20190404161604.6165-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When setting the instruction pointer on PA-RISC we also need
to set the back of the instruction queue to the new offset, otherwise
we will execute on instruction from the new location, and jumping
back to the old location stored in iaoq_b.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/ptrace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
index 4a87b3d600c6..9ff033d261ab 100644
--- a/arch/parisc/include/asm/ptrace.h
+++ b/arch/parisc/include/asm/ptrace.h
@@ -28,7 +28,8 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 static inline void instruction_pointer_set(struct pt_regs *regs,
 						unsigned long val)
 {
-        regs->iaoq[0] = val;
+	regs->iaoq[0] = val;
+	regs->iaoq[1] = val + 4;
 }
 
 /* Query offset/name of register from its name/offset */
-- 
2.20.1

