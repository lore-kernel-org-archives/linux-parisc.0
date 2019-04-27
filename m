Return-Path: <SRS0=TiJ5=S5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C69C43219
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 18:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA16C2077B
	for <linux-parisc@archiver.kernel.org>; Sat, 27 Apr 2019 18:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfD0SPl (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 27 Apr 2019 14:15:41 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:48018 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725950AbfD0SPl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Apr 2019 14:15:41 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190427181539.MCOP4947.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 27 Apr 2019 14:15:39 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by mtlspm02.bell.net
          with ESMTP
          id <20190427181539.XOBZ21689.mtlspm02.bell.net@[192.168.2.49]>;
          Sat, 27 Apr 2019 14:15:39 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Mikulas Patocka <mpatocka@redhat.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Update huge TLB page support to use per-pagetable
 spinlock
Openpgp: preference=signencrypt
Message-ID: <c14ef878-b942-af8e-5eea-3e04c80a33dd@bell.net>
Date:   Sat, 27 Apr 2019 14:15:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=oe04UG1nPxCxAkT5RbAA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfCQpxBNTDidxCG3ESSGWiNJwoItiv8/sjgnjywVBLILPEX4K7j/aRNv3NLxGFgbcXDyQ7wrmk/RHWWg7AMlb6mvgpJI/jqLeO5qsfdD7lgflbwvCNuMS 9Mp3te5p52I/p/PAZZeD8yFQfVRNa88UV6nZCaCtCGpdSpgT75d7s9QbDbDmOknS6vkxognleHJSSA==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch updates the parisc huge TLB page support to use per-pagetable spinlocks.

This patch requires Mikulas' per-pagetable spinlock patch and the revised TLB
serialization patch from Helge and myself.  With Mikulas' patch, we need to use
the per-pagetable spinlock for page table updates.  The TLB lock is only used
to serialize TLB flushes on machines with the Merced bus.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index d77479ae3af2..d578809e55cf 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -139,9 +139,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 {
 	unsigned long flags;

-	purge_tlb_start(flags);
+	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	__set_huge_pte_at(mm, addr, ptep, entry);
-	purge_tlb_end(flags);
+	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);
 }


@@ -151,10 +151,10 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	unsigned long flags;
 	pte_t entry;

-	purge_tlb_start(flags);
+	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	entry = *ptep;
 	__set_huge_pte_at(mm, addr, ptep, __pte(0));
-	purge_tlb_end(flags);
+	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);

 	return entry;
 }
@@ -166,10 +166,10 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	unsigned long flags;
 	pte_t old_pte;

-	purge_tlb_start(flags);
+	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	old_pte = *ptep;
 	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
-	purge_tlb_end(flags);
+	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);
 }

 int huge_ptep_set_access_flags(struct vm_area_struct *vma,
@@ -178,13 +178,14 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 {
 	unsigned long flags;
 	int changed;
+	struct mm_struct *mm = vma->vm_mm;

-	purge_tlb_start(flags);
+	spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);
 	changed = !pte_same(*ptep, pte);
 	if (changed) {
-		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+		__set_huge_pte_at(mm, addr, ptep, pte);
 	}
-	purge_tlb_end(flags);
+	spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);
 	return changed;
 }

