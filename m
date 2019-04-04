Return-Path: <SRS0=+2mb=SG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221D5C10F0E
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 19:14:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E898F206B7
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 19:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="AHJeR66A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbfDDTOx (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Apr 2019 15:14:53 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:33669 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbfDDTOw (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Apr 2019 15:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=PI3QXVP21UgPhNF1NtkE/QPJJoKeIS2W7rD+TROp/zs=; b=AHJeR66Am13Nh8pVDt7TjOlyc8
        fuK1qToJHPaONWGsUTfDmdluQtHVo2SqRs20F9+glyFtul4uLH43Wz6SXgHm0PYlEbDy9qvpwlGTU
        7M+pMepsK7RhpYhgmtmFnXg1MXcD3UY20zvxiAD9NMP9An5+DdQyJagQjfw90FyUKq9I=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hC7p5-00012K-HH; Thu, 04 Apr 2019 21:14:51 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2 2/3] parisc: add parisc code patching
Date:   Thu,  4 Apr 2019 21:14:09 +0200
Message-Id: <20190404191410.3444-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404191410.3444-1-svens@stackframe.org>
References: <20190404191410.3444-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Instead of re-mapping the whole kernel text with RWX rights
add a patch_text() which can be used to replace instructions
in the kernel .text section. Based on the ARM implementation.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/patch.h | 11 +++++
 arch/parisc/kernel/Makefile     |  3 +-
 arch/parisc/kernel/patch.c      | 78 +++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 arch/parisc/include/asm/patch.h
 create mode 100644 arch/parisc/kernel/patch.c

diff --git a/arch/parisc/include/asm/patch.h b/arch/parisc/include/asm/patch.h
new file mode 100644
index 000000000000..685b58a13968
--- /dev/null
+++ b/arch/parisc/include/asm/patch.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _PARISC_KERNEL_PATCH_H
+#define _PARISC_KERNEL_PATCH_H
+
+/* stop machine and patch kernel text */
+void patch_text(void *addr, unsigned int insn);
+
+/* patch kernel text with machine already stopped (e.g. in kgdb) */
+void __patch_text(void *addr, unsigned int insn);
+
+#endif
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 8e5f1ab65c68..d29bbd1a73b2 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -9,7 +9,8 @@ obj-y	     	:= cache.o pacache.o setup.o pdt.o traps.o time.o irq.o \
 		   pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
 		   ptrace.o hardware.o inventory.o drivers.o alternative.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
-		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o
+		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
+		   patch.o
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
diff --git a/arch/parisc/kernel/patch.c b/arch/parisc/kernel/patch.c
new file mode 100644
index 000000000000..4a3bff87b177
--- /dev/null
+++ b/arch/parisc/kernel/patch.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+ /*
+  * functions to patch RO kernel text during runtime
+  *
+  * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+  */
+
+#include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/kprobes.h>
+#include <linux/mm.h>
+#include <linux/stop_machine.h>
+
+#include <asm/cacheflush.h>
+#include <asm/fixmap.h>
+#include <asm/patch.h>
+
+struct patch {
+	void *addr;
+	unsigned int insn;
+};
+
+static void __kprobes *patch_map(void *addr, int fixmap, unsigned long *flags)
+{
+	unsigned int uintaddr = (uintptr_t) addr;
+	bool module = !core_kernel_text(uintaddr);
+	struct page *page;
+
+	if (module && IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+		page = vmalloc_to_page(addr);
+	else if (!module && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		page = virt_to_page(addr);
+	else
+		return addr;
+
+	set_fixmap(fixmap, page_to_phys(page));
+
+	return (void *) (__fix_to_virt(fixmap) + (uintaddr & ~PAGE_MASK));
+}
+
+static void __kprobes patch_unmap(int fixmap, unsigned long *flags)
+{
+	clear_fixmap(fixmap);
+}
+
+void __kprobes __patch_text(void *addr, unsigned int insn)
+{
+	unsigned long flags;
+	void *waddr = addr;
+	int size;
+
+	waddr = patch_map(addr, FIX_TEXT_POKE0, &flags);
+	*(u32 *)waddr = insn;
+	size = sizeof(u32);
+	flush_kernel_vmap_range(waddr, size);
+	patch_unmap(FIX_TEXT_POKE0, &flags);
+	flush_icache_range((uintptr_t)(addr),
+			   (uintptr_t)(addr) + size);
+}
+
+static int __kprobes patch_text_stop_machine(void *data)
+{
+	struct patch *patch = data;
+
+	__patch_text(patch->addr, patch->insn);
+
+	return 0;
+}
+
+void __kprobes patch_text(void *addr, unsigned int insn)
+{
+	struct patch patch = {
+		.addr = addr,
+		.insn = insn,
+	};
+
+	stop_machine_cpuslocked(patch_text_stop_machine, &patch, NULL);
+}
-- 
2.20.1

