Return-Path: <SRS0=WYTU=SL=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675BCC282DE
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B04120883
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="P7i2nVCb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfDIRal (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 9 Apr 2019 13:30:41 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:60835 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfDIRak (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Apr 2019 13:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=QLPOADtgFNN0wgzqa0iMQV2WtfQhinTEDnujDWYcRRg=; b=P7i2nVCbVujLE8py9b7hkjZ8UC
        j3aBy2QK2ZIyN3kNguoAYZ9YP8wbo6y5484IF6U36ybqcrB2mDbcLSGotPK7bDI3I37aHDvoSsxrz
        r8wkPHDsrRwLVg9NY90dwULcJuZLiYujvOCUiLhoKYaXVxFfhlwmWbbYufh+QTFqw3fo=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDuZz-0002co-K7; Tue, 09 Apr 2019 19:30:39 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 3/4] doc: update kprobes supported architecture list
Date:   Tue,  9 Apr 2019 19:30:29 +0200
Message-Id: <20190409173030.26234-4-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409173030.26234-1-svens@stackframe.org>
References: <20190409173030.26234-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Now that kprobes and kretprobes are implemented, update the list in
Documentation to reflect that.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 Documentation/features/debug/kprobes/arch-support.txt | 2 +-
 Documentation/kprobes.txt                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/debug/kprobes/arch-support.txt b/Documentation/features/debug/kprobes/arch-support.txt
index f4e45bd58fea..e68239b5d2f0 100644
--- a/Documentation/features/debug/kprobes/arch-support.txt
+++ b/Documentation/features/debug/kprobes/arch-support.txt
@@ -21,7 +21,7 @@
     |       nds32: | TODO |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
diff --git a/Documentation/kprobes.txt b/Documentation/kprobes.txt
index 10f4499e677c..33041300d1ee 100644
--- a/Documentation/kprobes.txt
+++ b/Documentation/kprobes.txt
@@ -321,6 +321,7 @@ architectures:
 - ppc
 - mips
 - s390
+- parisc
 
 Configuring Kprobes
 ===================
-- 
2.20.1

