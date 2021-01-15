Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92822C433E0
	for <linux-parisc@archiver.kernel.org>; Fri, 15 Jan 2021 00:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6263123A5A
	for <linux-parisc@archiver.kernel.org>; Fri, 15 Jan 2021 00:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbhAOAPj (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 14 Jan 2021 19:15:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:46320 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727047AbhAOAPi (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Jan 2021 19:15:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 31EF3B27D;
        Fri, 15 Jan 2021 00:14:57 +0000 (UTC)
From:   Davidlohr Bueso <dave@stgolabs.net>
To:     James.Bottomley@HansenPartnership.com
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dave@stgolabs.net,
        Davidlohr Bueso <dbueso@suse.de>
Subject: [PATCH] parisc: Remove leftover reference to the power_tasklet
Date:   Thu, 14 Jan 2021 16:14:48 -0800
Message-Id: <20210115001448.117247-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This was removed long ago, back in:

     6e16d9409e1 ([PARISC] Convert soft power switch driver to kthread)

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 arch/parisc/include/asm/irq.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/parisc/include/asm/irq.h b/arch/parisc/include/asm/irq.h
index 959e79cd2c14..378f63c4015b 100644
--- a/arch/parisc/include/asm/irq.h
+++ b/arch/parisc/include/asm/irq.h
@@ -47,7 +47,4 @@ extern unsigned long txn_affinity_addr(unsigned int irq, int cpu);
 extern int cpu_claim_irq(unsigned int irq, struct irq_chip *, void *);
 extern int cpu_check_affinity(struct irq_data *d, const struct cpumask *dest);
 
-/* soft power switch support (power.c) */
-extern struct tasklet_struct power_tasklet;
-
 #endif	/* _ASM_PARISC_IRQ_H */
-- 
2.26.2

