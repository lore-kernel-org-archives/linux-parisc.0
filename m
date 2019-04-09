Return-Path: <SRS0=WYTU=SL=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37382C10F0E
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 20:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAF4D2084B
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 20:05:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="SrNqPxnm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbfDIUFb (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 9 Apr 2019 16:05:31 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:35206 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbfDIUFb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Apr 2019 16:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=V5vuu7pc4dB8+5HkxwmEcbxEMyZREVixjFWYFIKdRYE=; b=SrNqPxnmdfvJiY/mpcxw9E7aEi
        RPI6hBQk3u4zc/rah+fTucriquTN3Emaojwl/rHeHOaWzRKXQTrb8Sgh2M1oy57e3F4CXKNoZF53j
        pUjJhmfC23S1tIT/osz3vmkwooBJPGPcR3LGR3kuTEbQ0VBPWKNNzL66RgyZfrDH1NVs=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDwzp-0005HS-Oa; Tue, 09 Apr 2019 22:05:29 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: update feature lists
Date:   Tue,  9 Apr 2019 22:05:24 +0200
Message-Id: <20190409200524.13486-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Update lists to reflect that we have now KGDB and kretprobes
support.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 Documentation/features/debug/kgdb/arch-support.txt       | 2 +-
 Documentation/features/debug/kretprobes/arch-support.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/features/debug/kgdb/arch-support.txt b/Documentation/features/debug/kgdb/arch-support.txt
index 3e6b8f07d5d0..38c40cfa0578 100644
--- a/Documentation/features/debug/kgdb/arch-support.txt
+++ b/Documentation/features/debug/kgdb/arch-support.txt
@@ -21,7 +21,7 @@
     |       nds32: | TODO |
     |       nios2: |  ok  |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
diff --git a/Documentation/features/debug/kretprobes/arch-support.txt b/Documentation/features/debug/kretprobes/arch-support.txt
index 1d5651ef11f8..f17131b328e5 100644
--- a/Documentation/features/debug/kretprobes/arch-support.txt
+++ b/Documentation/features/debug/kretprobes/arch-support.txt
@@ -21,7 +21,7 @@
     |       nds32: | TODO |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: |  ok  |
-- 
2.20.1

