Return-Path: <SRS0=lv7V=V5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78DAC19759
	for <linux-parisc@archiver.kernel.org>; Thu,  1 Aug 2019 20:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FCC720838
	for <linux-parisc@archiver.kernel.org>; Thu,  1 Aug 2019 20:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="Cd67+W7r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388241AbfHAUIq (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 1 Aug 2019 16:08:46 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:42396 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387891AbfHAUIp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 1 Aug 2019 16:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=Kj5j9+hUT8AijSSG2xdCi72IqYwY0SCTK1y2lexOaM0=; b=Cd67+W7ruYigKK0jdmnnT3Tlip
        9vIJQls9ImlS0UMXHr8Vi2+VD7iEX7AZJtHbNPdY9NwEEp4JKaz0akjTCYs1hCKE1O39HQV+iHyNI
        NxTfdjlfBJ3CCyZDAo3kA5amK5psBx4MKRLzvXaeKDvHflAGIWsMLVTR07cPuouC/VK8=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1htHNU-00050H-KD; Thu, 01 Aug 2019 22:08:44 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: trigger die notifier chain in parisc_terminate()
Date:   Thu,  1 Aug 2019 22:08:42 +0200
Message-Id: <20190801200842.8237-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This will trigger kgdb/kdb when they are enabled.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/traps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 58dcf445e32f..82fc01189488 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -29,6 +29,7 @@
 #include <linux/bug.h>
 #include <linux/ratelimit.h>
 #include <linux/uaccess.h>
+#include <linux/kdebug.h>
 
 #include <asm/assembly.h>
 #include <asm/io.h>
@@ -414,6 +415,7 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 {
 	static DEFINE_SPINLOCK(terminate_lock);
 
+	(void)notify_die(DIE_OOPS, msg, regs, 0, code, SIGTRAP);
 	bust_spinlocks(1);
 
 	set_eiem(0);
-- 
2.20.1

