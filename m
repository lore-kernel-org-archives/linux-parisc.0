Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03172C4332F
	for <linux-parisc@archiver.kernel.org>; Tue,  7 Nov 2023 13:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjKGNit (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 7 Nov 2023 08:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjKGNis (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 Nov 2023 08:38:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD16B3
        for <linux-parisc@vger.kernel.org>; Tue,  7 Nov 2023 05:38:45 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5419C433C9;
        Tue,  7 Nov 2023 13:38:43 +0000 (UTC)
Date:   Tue, 7 Nov 2023 14:38:40 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc/pgtable: Do not drop upper 5 address bits of physical
 address
Message-ID: <ZUo94MMlqzpUP/42@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When calculating the pfn for the iitlbt/idtlbt instruction, do not
drop the upper 5 address bits. This doesn't seem to have an effect
on physical hardware which uses less physical address bits, but in
qemu the missing bits are visible.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc:  <stable@vger.kernel.org>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index cab1ec23e0d7..bef64678d370 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -481,7 +481,7 @@
 #ifdef CONFIG_HUGETLB_PAGE
 	copy		\pte,\tmp
 	extrd,u		\tmp,(63-ASM_PFN_PTE_SHIFT)+(63-58)+PAGE_ADD_SHIFT,\
-				64-PAGE_SHIFT-PAGE_ADD_SHIFT,\pte
+				64-PAGE_SHIFT-PAGE_ADD_SHIFT+(63-58),\pte
 
 	depdi		_PAGE_SIZE_ENCODING_DEFAULT,63,\
 				(63-58)+PAGE_ADD_SHIFT,\pte
@@ -490,7 +490,7 @@
 				(63-58)+PAGE_ADD_HUGE_SHIFT,\pte
 #else /* Huge pages disabled */
 	extrd,u		\pte,(63-ASM_PFN_PTE_SHIFT)+(63-58)+PAGE_ADD_SHIFT,\
-				64-PAGE_SHIFT-PAGE_ADD_SHIFT,\pte
+				64-PAGE_SHIFT-PAGE_ADD_SHIFT+(63-58),\pte
 	depdi		_PAGE_SIZE_ENCODING_DEFAULT,63,\
 				(63-58)+PAGE_ADD_SHIFT,\pte
 #endif
