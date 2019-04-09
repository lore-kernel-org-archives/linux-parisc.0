Return-Path: <SRS0=WYTU=SL=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683F5C282DA
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 378E020857
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="EvJjdfMv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfDIRak (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 9 Apr 2019 13:30:40 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:33322 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfDIRaj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Apr 2019 13:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=7Qsdr+KW6MNidHRtJVkKitjuXcICzxOKppPfl8ghQ40=; b=EvJjdfMvEmYmhyTZyyqKee4Wsl
        OqsV4XhhJtoY0leHVxIHdlo3chlE6fV+/T8jTH+QN+1onc2DhjozbwzFuBByonw3k5+9twBlK5LJC
        aZ2JYwwOZF7O05SI21p7xxcKzZDvxFUgo3Ck3D5mbrXzj8V2buzta3924DI6aRKjfRP4=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDuZx-0002co-Tp; Tue, 09 Apr 2019 19:30:38 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/4] parisc: remove kprobes.h from generic-y
Date:   Tue,  9 Apr 2019 19:30:27 +0200
Message-Id: <20190409173030.26234-2-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409173030.26234-1-svens@stackframe.org>
References: <20190409173030.26234-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

We're providing our own version now.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index 9bcd0c903dbb..630a179363c2 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -10,7 +10,6 @@ generic-y += hw_irq.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
 generic-y += kdebug.h
-generic-y += kprobes.h
 generic-y += kvm_para.h
 generic-y += local.h
 generic-y += local64.h
-- 
2.20.1

