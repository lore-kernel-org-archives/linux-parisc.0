Return-Path: <SRS0=NDYn=2R=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD33C2D0DB
	for <linux-parisc@archiver.kernel.org>; Fri, 27 Dec 2019 17:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 816152176D
	for <linux-parisc@archiver.kernel.org>; Fri, 27 Dec 2019 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577469107;
	bh=zOuj6n+fYGJwlWbMnFsq3QNqgVU7cb1hz3VpkEgVXtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=FsJjKeHeOi3N20mMXdJKH79bp2Pwp7VIYZuyrZ03vxFki29u8TMkTljCpS4cODZYm
	 XUr1PCtneJ1zhNBXWVInIcIfPClWnhTvZ0UhL9aXMDmukEXqq+7tUlJ9Wu1efHfk6n
	 yyB3SPOCKlUd0we9KDsUvzn/1CDgo+LeBoBn7j+g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfL0RnU (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 27 Dec 2019 12:43:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:40766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728204AbfL0RnU (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 27 Dec 2019 12:43:20 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF58624125;
        Fri, 27 Dec 2019 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577468599;
        bh=zOuj6n+fYGJwlWbMnFsq3QNqgVU7cb1hz3VpkEgVXtw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czF3PFaFOytCq8N9iKpJ9RCyyCQUd59/JGNQGsKbQ7+XVA4qp3+1en/fMFxKDMtg3
         OUrv8yPTrvppVhfcVagSGK6uqGz6oDjM4UC+UzdwvckLm+qxXTKeQ5ZzfPd0yTcxWF
         ALN2QvmMOIDUcpQWvVO/ofxud74CsEV77MWhw5j0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>,
        kbuild test robot <lkp@intel.com>,
        Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 120/187] parisc: fix compilation when KEXEC=n and KEXEC_FILE=y
Date:   Fri, 27 Dec 2019 12:39:48 -0500
Message-Id: <20191227174055.4923-120-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174055.4923-1-sashal@kernel.org>
References: <20191227174055.4923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Sven Schnelle <svens@stackframe.org>

[ Upstream commit e16260c21f87b16a33ae8ecac9e8c79f3a8b89bd ]

Fix compilation when the CONFIG_KEXEC_FILE=y and
CONFIG_KEXEC=n.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Sven Schnelle <svens@stackframe.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/parisc/include/asm/kexec.h | 4 ----
 arch/parisc/kernel/Makefile     | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/kexec.h b/arch/parisc/include/asm/kexec.h
index a99ea747d7ed..87e174006995 100644
--- a/arch/parisc/include/asm/kexec.h
+++ b/arch/parisc/include/asm/kexec.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_PARISC_KEXEC_H
 #define _ASM_PARISC_KEXEC_H
 
-#ifdef CONFIG_KEXEC
-
 /* Maximum physical address we can use pages from */
 #define KEXEC_SOURCE_MEMORY_LIMIT (-1UL)
 /* Maximum address we can reach in physical address mode */
@@ -32,6 +30,4 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* CONFIG_KEXEC */
-
 #endif /* _ASM_PARISC_KEXEC_H */
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 2663c8f8be11..068d90950d93 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -37,5 +37,5 @@ obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
 obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_KPROBES)			+= kprobes.o
-obj-$(CONFIG_KEXEC)			+= kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_CORE)		+= kexec.o relocate_kernel.o
 obj-$(CONFIG_KEXEC_FILE)		+= kexec_file.o
-- 
2.20.1

