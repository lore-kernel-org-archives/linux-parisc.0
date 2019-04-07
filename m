Return-Path: <SRS0=zQSf=SJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71239C282DE
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44B1220896
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="muP6qX46"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfDGSLI (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 7 Apr 2019 14:11:08 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:36926 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfDGSLH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Apr 2019 14:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=FKMl68FIidfRh+uxlDjc/zCmpRv1OoNvkLpLDsJcFdA=; b=muP6qX46Qg9S7GRzpS1nx9Qg/4
        Vil7iyrxXmavw5M8Bw2yf+sNO2gDKINhFGhS0FkfKHUJpI3k0/D2RntCB/dwDaVYFvcUzAPP5zTci
        c1TLQGMBDYx56WbDWREXJ5ngRDsIehk/WeePqpv2U5lJHat+9s5zAVq2BgJp4w/KqfG0=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDCG1-0000mt-SY; Sun, 07 Apr 2019 20:11:06 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/2] parisc: add functions required by KPROBE_EVENTS
Date:   Sun,  7 Apr 2019 20:10:57 +0200
Message-Id: <20190407181058.29728-2-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190407181058.29728-1-svens@stackframe.org>
References: <20190407181058.29728-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

implement regs_get_register(), regs_get_kernel_stack_nth() and
regs_within_kernel_stack()

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/ptrace.h | 13 ++++++++++++
 arch/parisc/kernel/ptrace.c      | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
index 9ff033d261ab..143fb2a89dd8 100644
--- a/arch/parisc/include/asm/ptrace.h
+++ b/arch/parisc/include/asm/ptrace.h
@@ -37,4 +37,17 @@ extern int regs_query_register_offset(const char *name);
 extern const char *regs_query_register_name(unsigned int offset);
 #define MAX_REG_OFFSET (offsetof(struct pt_regs, ipsw))
 
+#define kernel_stack_pointer(regs) ((regs)->gr[30])
+
+static inline unsigned long regs_get_register(struct pt_regs *regs,
+					      unsigned int offset)
+{
+	if (unlikely(offset > MAX_REG_OFFSET))
+		return 0;
+	return *(unsigned long *)((unsigned long)regs + offset);
+}
+
+unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n);
+int regs_within_kernel_stack(struct pt_regs *regs, unsigned long addr);
+
 #endif
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 0964c236e3e5..a3d2fb4e6dd2 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -789,3 +789,38 @@ const char *regs_query_register_name(unsigned int offset)
 			return roff->name;
 	return NULL;
 }
+
+/**
+ * regs_within_kernel_stack() - check the address in the stack
+ * @regs:      pt_regs which contains kernel stack pointer.
+ * @addr:      address which is checked.
+ *
+ * regs_within_kernel_stack() checks @addr is within the kernel stack page(s).
+ * If @addr is within the kernel stack, it returns true. If not, returns false.
+ */
+int regs_within_kernel_stack(struct pt_regs *regs, unsigned long addr)
+{
+	return ((addr & ~(THREAD_SIZE - 1))  ==
+		(kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1)));
+}
+
+/**
+ * regs_get_kernel_stack_nth() - get Nth entry of the stack
+ * @regs:	pt_regs which contains kernel stack pointer.
+ * @n:		stack entry number.
+ *
+ * regs_get_kernel_stack_nth() returns @n th entry of the kernel stack which
+ * is specified by @regs. If the @n th entry is NOT in the kernel stack,
+ * this returns 0.
+ */
+unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
+{
+	unsigned long *addr = (unsigned long *)kernel_stack_pointer(regs);
+
+	addr -= n;
+
+	if (!regs_within_kernel_stack(regs, (unsigned long)addr))
+		return 0;
+
+	return *addr;
+}
-- 
2.20.1

