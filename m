Return-Path: <SRS0=WYTU=SL=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386D3C282E0
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BEFE20857
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="F+1j42GL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfDIRal (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 9 Apr 2019 13:30:41 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:49779 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfDIRal (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Apr 2019 13:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=HZdnv4hmpaRdmLQ2vhVB0hRp5alJLVr9a2vzYs8HO/M=; b=F+1j42GLPgWwTwOto84ljsmRBM
        qiCwz0sx4cIFqc3wcT7HDW4usct4zWZakpzFk2DXq5ewvF0YnM8D6tPjEYYFeFqxIJLLrsE6SbmaW
        8pN1FPZVaRdOVNSC2Rn3MAdiycs+z+AvYrCeiMZ4bDzIE6WtdLcbjpcEXpqbXcML+50A=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDua0-0002co-GY; Tue, 09 Apr 2019 19:30:40 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 4/4] parisc: remove unused flags parameter in __patch_text()
Date:   Tue,  9 Apr 2019 19:30:30 +0200
Message-Id: <20190409173030.26234-5-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409173030.26234-1-svens@stackframe.org>
References: <20190409173030.26234-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

It's not used by patch_map()/patch_unmap(), so lets remove
it.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/patch.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
index 4a3bff87b177..64b0867b09d7 100644
--- a/arch/parisc/kernel/patch.c
+++ b/arch/parisc/kernel/patch.c
@@ -20,7 +20,7 @@ struct patch {
 	unsigned int insn;
 };
 
-static void __kprobes *patch_map(void *addr, int fixmap, unsigned long *flags)
+static void __kprobes *patch_map(void *addr, int fixmap)
 {
 	unsigned int uintaddr = (uintptr_t) addr;
 	bool module = !core_kernel_text(uintaddr);
@@ -38,22 +38,21 @@ static void __kprobes *patch_map(void *addr, int fixmap, unsigned long *flags)
 	return (void *) (__fix_to_virt(fixmap) + (uintaddr & ~PAGE_MASK));
 }
 
-static void __kprobes patch_unmap(int fixmap, unsigned long *flags)
+static void __kprobes patch_unmap(int fixmap)
 {
 	clear_fixmap(fixmap);
 }
 
 void __kprobes __patch_text(void *addr, unsigned int insn)
 {
-	unsigned long flags;
 	void *waddr = addr;
 	int size;
 
-	waddr = patch_map(addr, FIX_TEXT_POKE0, &flags);
+	waddr = patch_map(addr, FIX_TEXT_POKE0);
 	*(u32 *)waddr = insn;
 	size = sizeof(u32);
 	flush_kernel_vmap_range(waddr, size);
-	patch_unmap(FIX_TEXT_POKE0, &flags);
+	patch_unmap(FIX_TEXT_POKE0);
 	flush_icache_range((uintptr_t)(addr),
 			   (uintptr_t)(addr) + size);
 }
-- 
2.20.1

