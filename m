Return-Path: <SRS0=b8iV=SE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A14BC10F00
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 20:48:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 685182082C
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 20:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="ZdGuWlN9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfDBUsj (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 2 Apr 2019 16:48:39 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:42648 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfDBUsj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 2 Apr 2019 16:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=NiIzg6QXCesJ7eIVT6C4ytRl5TIFIzaxSRBcTCW/g9w=; b=ZdGuWlN9rha1bNxMg1TpmFvvVB
        LuDSicYIV5TpBzbNkX/1U82+ZkBYsCNrIlf4mRaGfTXZJyeFSWIvZVPraXLiDwRcDocBE08BimsUH
        D5p6c3BBtiMwprVuof5TA/zgZk02w3Alx/y5dYopgEPwi7+r51mnpQsG+VWUd/U1oLrk=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hBQKi-0006Pf-Td; Tue, 02 Apr 2019 22:48:37 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 1/3] parisc: add set_fixmap()/clear_fixmap()
Date:   Tue,  2 Apr 2019 22:48:16 +0200
Message-Id: <20190402204818.5929-2-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190402204818.5929-1-svens@stackframe.org>
References: <20190402204818.5929-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

These functions will be used for adding code patching
functions later.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/include/asm/fixmap.h | 19 +++++++++++++-
 arch/parisc/mm/Makefile          |  2 +-
 arch/parisc/mm/fixmap.c          | 43 ++++++++++++++++++++++++++++++++
 arch/parisc/mm/init.c            | 14 +++++++----
 4 files changed, 71 insertions(+), 7 deletions(-)
 create mode 100644 arch/parisc/mm/fixmap.c

diff --git a/arch/parisc/include/asm/fixmap.h b/arch/parisc/include/asm/fixmap.h
index f7c3a0905de4..288da73d4cc0 100644
--- a/arch/parisc/include/asm/fixmap.h
+++ b/arch/parisc/include/asm/fixmap.h
@@ -15,17 +15,34 @@
  * from areas congruently mapped with user space.  It is 8MB large
  * and must be 16MB aligned */
 #define TMPALIAS_MAP_START	((__PAGE_OFFSET) - 16*1024*1024)
+
+#define FIXMAP_SIZE		(FIX_BITMAP_COUNT << PAGE_SHIFT)
+#define FIXMAP_START		(TMPALIAS_MAP_START - FIXMAP_SIZE)
 /* This is the kernel area for all maps (vmalloc, dma etc.)  most
  * usually, it extends up to TMPALIAS_MAP_START.  Virtual addresses
  * 0..GATEWAY_PAGE_SIZE are reserved for the gateway page */
 #define KERNEL_MAP_START	(GATEWAY_PAGE_SIZE)
-#define KERNEL_MAP_END		(TMPALIAS_MAP_START)
+#define KERNEL_MAP_END		(FIXMAP_START)
 
 #ifndef __ASSEMBLY__
+
+
+enum fixed_addresses {
+	/* Support writing RO kernel text via kprobes, jump labels, etc. */
+	FIX_TEXT_POKE0,
+	FIX_BITMAP_COUNT
+};
+
 extern void *parisc_vmalloc_start;
 #define PCXL_DMA_MAP_SIZE	(8*1024*1024)
 #define VMALLOC_START		((unsigned long)parisc_vmalloc_start)
 #define VMALLOC_END		(KERNEL_MAP_END)
+
+#define __fix_to_virt(_x) (FIXMAP_START + ((_x) << PAGE_SHIFT))
+
+void set_fixmap(enum fixed_addresses idx, phys_addr_t phys);
+void clear_fixmap(enum fixed_addresses idx);
+
 #endif /*__ASSEMBLY__*/
 
 #endif /*_ASM_FIXMAP_H*/
diff --git a/arch/parisc/mm/Makefile b/arch/parisc/mm/Makefile
index 134393de69d2..20e39b043a60 100644
--- a/arch/parisc/mm/Makefile
+++ b/arch/parisc/mm/Makefile
@@ -2,5 +2,5 @@
 # Makefile for arch/parisc/mm
 #
 
-obj-y	 := init.o fault.o ioremap.o
+obj-y	 := init.o fault.o ioremap.o fixmap.o
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
new file mode 100644
index 000000000000..6f9744c688ae
--- /dev/null
+++ b/arch/parisc/mm/fixmap.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fixmaps for parisc
+ *
+ * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ */
+
+#include <linux/kprobes.h>
+#include <linux/mm.h>
+#include <asm/cacheflush.h>
+#include <asm/fixmap.h>
+
+void set_fixmap(enum fixed_addresses idx, phys_addr_t phys)
+{
+	unsigned long vaddr = __fix_to_virt(idx);
+	pgd_t *pgd = pgd_offset_k(vaddr);
+	pmd_t *pmd = pmd_offset(pgd, vaddr);
+	pte_t *pte;
+
+	if (pmd_none(*pmd))
+		pmd = pmd_alloc(NULL, pgd, vaddr);
+
+	pte = pte_offset_kernel(pmd, vaddr);
+	if (pte_none(*pte))
+		pte = pte_alloc_kernel(pmd, vaddr);
+
+	set_pte_at(&init_mm, vaddr, pte, __mk_pte(phys, PAGE_KERNEL_RWX));
+	flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
+}
+
+void clear_fixmap(enum fixed_addresses idx)
+{
+	unsigned long vaddr = __fix_to_virt(idx);
+	pgd_t *pgd = pgd_offset_k(vaddr);
+	pmd_t *pmd = pmd_offset(pgd, vaddr);
+	pte_t *pte = pte_offset_kernel(pmd, vaddr);
+
+	pte_clear(&init_mm, vaddr, pte);
+
+	flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE);
+}
+
+
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index d0b166256f1a..b2b52de2b82b 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -622,15 +622,19 @@ void __init mem_init(void)
 	 * But keep code for debugging purposes.
 	 */
 	printk("virtual kernel memory layout:\n"
-	       "    vmalloc : 0x%px - 0x%px   (%4ld MB)\n"
-	       "    memory  : 0x%px - 0x%px   (%4ld MB)\n"
-	       "      .init : 0x%px - 0x%px   (%4ld kB)\n"
-	       "      .data : 0x%px - 0x%px   (%4ld kB)\n"
-	       "      .text : 0x%px - 0x%px   (%4ld kB)\n",
+	       "     vmalloc : 0x%px - 0x%px   (%4ld MB)\n"
+	       "     fixmap  : 0x%px - 0x%px   (%4ld kB)\n"
+	       "     memory  : 0x%px - 0x%px   (%4ld MB)\n"
+	       "       .init : 0x%px - 0x%px   (%4ld kB)\n"
+	       "       .data : 0x%px - 0x%px   (%4ld kB)\n"
+	       "       .text : 0x%px - 0x%px   (%4ld kB)\n",
 
 	       (void*)VMALLOC_START, (void*)VMALLOC_END,
 	       (VMALLOC_END - VMALLOC_START) >> 20,
 
+	       (void *)FIXMAP_START, (void *)(FIXMAP_START + FIXMAP_SIZE),
+	       (unsigned long)(FIXMAP_SIZE / 1024),
+
 	       __va(0), high_memory,
 	       ((unsigned long)high_memory - (unsigned long)__va(0)) >> 20,
 
-- 
2.20.1

