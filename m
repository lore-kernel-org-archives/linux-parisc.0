Return-Path: <SRS0=+LlY=AS=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276CFC433E7
	for <linux-parisc@archiver.kernel.org>; Tue,  7 Jul 2020 22:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F16D22075B
	for <linux-parisc@archiver.kernel.org>; Tue,  7 Jul 2020 22:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGlQpsg4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729647AbgGGWuz (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 7 Jul 2020 18:50:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37388 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729688AbgGGWuy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 Jul 2020 18:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594162253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dSLF2JUETXiqlgMgrNmE+7rrHD1HC1gVnVSET6GUPpA=;
        b=dGlQpsg4ZkK3a+rhiTUo11N0zKKC0nMwNofJCkqHwJzxOHn+r5akScap7acqxlQWhmJZP4
        PmSzpndqz69TtFDx65RBLmiixycCOl5hRSTou9qSw6zU0VMaDgWlOWgcKLdM90Rku26eGm
        coqVu/kPAbrCH/N934fYftsmVYY9pEE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-qJkGghSCNeC5f1BCiKOTOA-1; Tue, 07 Jul 2020 18:50:49 -0400
X-MC-Unique: qJkGghSCNeC5f1BCiKOTOA-1
Received: by mail-qk1-f199.google.com with SMTP id q6so21047438qke.21
        for <linux-parisc@vger.kernel.org>; Tue, 07 Jul 2020 15:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dSLF2JUETXiqlgMgrNmE+7rrHD1HC1gVnVSET6GUPpA=;
        b=H2mM/kTF/It5isVX6mTxL0dyI2xVZI45HcUz4L+RzwmLl2qAWXcV+H0Pa4Eq5EwKDk
         oPVSAX9ANa1UsnLW7bHng3C+C8mvweI4flxXooioiKUAd3+BNn32uTdT9w5aMVxlntwC
         mjyK7x/5LqoWkxZVYz/yj+JWdNQ0gibzIea/xEDoKqaeB3GSPt/tytPghUKumGWZRAMV
         fdM7BIpJkVwxBpyAoBrJicC0J+3jYD8ITTyrdhjbXK6GStzCCrpZws79weGfUIWTWvcX
         /g6z8ORwxhHYQw8Gfe1FXELypPOAycpSX10BXyeeL/vwmpnRE+U4Rgy5xVh0qUXHDs86
         MF9w==
X-Gm-Message-State: AOAM531SZo2Kv1fCCXR3sEUTTtobTlaIf8Xg8vzIcGAzhem07os99VK5
        Z3PaeE3mEGLi/Vmh42+fqiZWuiyO6GfOtHwy7d11aQIkRS8EmjIVBdYXhTuYC4WNCrDOkmrI1X9
        MZ6Xe9NEI9tjPzanhJ4VlnNGB
X-Received: by 2002:ad4:5307:: with SMTP id y7mr54932482qvr.63.1594162248905;
        Tue, 07 Jul 2020 15:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZZjK6Nn1bIXhPvAgy7jT1o0DD/8o7Kmnv40jvO5ZPTVwAW66E615v62v4cElkkeaFLjMBdA==
X-Received: by 2002:ad4:5307:: with SMTP id y7mr54932474qvr.63.1594162248721;
        Tue, 07 Jul 2020 15:50:48 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:50:48 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        peterx@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: [PATCH v5 15/25] mm/parisc: Use general page fault accounting
Date:   Tue,  7 Jul 2020 18:50:11 -0400
Message-Id: <20200707225021.200906-16-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

Add the missing PERF_COUNT_SW_PAGE_FAULTS perf events too.  Note, the other two
perf events (PERF_COUNT_SW_PAGE_FAULTS_[MAJ|MIN]) were done in handle_mm_fault().

CC: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
CC: Helge Deller <deller@gmx.de>
CC: linux-parisc@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/parisc/mm/fault.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index e32d06928c24..4bfe2da9fbe3 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -18,6 +18,7 @@
 #include <linux/extable.h>
 #include <linux/uaccess.h>
 #include <linux/hugetlb.h>
+#include <linux/perf_event.h>
 
 #include <asm/traps.h>
 
@@ -281,6 +282,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	acc_type = parisc_acctyp(code, regs->iir);
 	if (acc_type & VM_WRITE)
 		flags |= FAULT_FLAG_WRITE;
+	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma_prev(mm, address, &prev_vma);
@@ -302,7 +304,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	 * fault.
 	 */
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -323,10 +325,6 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 		BUG();
 	}
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR)
-			current->maj_flt++;
-		else
-			current->min_flt++;
 		if (fault & VM_FAULT_RETRY) {
 			/*
 			 * No need to mmap_read_unlock(mm) as we would
-- 
2.26.2

