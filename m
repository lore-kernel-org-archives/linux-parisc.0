Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0744C10F06
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 19:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1CF1213F2
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 19:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfDFTgQ (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 15:36:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59086 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfDFTgQ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 15:36:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 40EA981F1B;
        Sat,  6 Apr 2019 19:36:15 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2915D70D;
        Sat,  6 Apr 2019 19:36:14 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x36JaEmL022067;
        Sat, 6 Apr 2019 15:36:14 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id x36JaDgE022058;
        Sat, 6 Apr 2019 15:36:13 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Sat, 6 Apr 2019 15:36:13 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>
cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: use per-pagetable spinlock
Message-ID: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sat, 06 Apr 2019 19:36:15 +0000 (UTC)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Parisc uses a global spinlock to protect pagetable updates in the TLB
fault handlers. When multiple cores are taking TLB faults simultaneously,
the cache line containing the spinlock becomes a bottleneck.

This patch embeds the spinlock in the top level page directory, so that
every process has its own lock. It improves performance by 30% when doing
parallel compilations.

(please test it on 32-bit kernels - I don't have a machine for that)

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 arch/parisc/include/asm/pgalloc.h  |    1 +
 arch/parisc/include/asm/pgtable.h  |   35 +++++++++++++++++++++++------------
 arch/parisc/include/asm/tlbflush.h |    6 +++---
 arch/parisc/kernel/cache.c         |    2 +-
 arch/parisc/kernel/entry.S         |    8 ++------
 5 files changed, 30 insertions(+), 22 deletions(-)

Index: linux-5.1-rc3/arch/parisc/include/asm/pgtable.h
===================================================================
--- linux-5.1-rc3.orig/arch/parisc/include/asm/pgtable.h	2019-04-06 11:12:03.000000000 +0200
+++ linux-5.1-rc3/arch/parisc/include/asm/pgtable.h	2019-04-06 11:12:22.000000000 +0200
@@ -17,7 +17,7 @@
 #include <asm/processor.h>
 #include <asm/cache.h>
 
-extern spinlock_t pa_tlb_lock;
+static inline spinlock_t *pgd_spinlock(pgd_t *);
 
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -59,11 +59,11 @@ static inline void purge_tlb_entries(str
 	do {							\
 		pte_t old_pte;					\
 		unsigned long flags;				\
-		spin_lock_irqsave(&pa_tlb_lock, flags);		\
+		spin_lock_irqsave(pgd_spinlock((mm)->pgd), flags);\
 		old_pte = *ptep;				\
 		set_pte(ptep, pteval);				\
 		purge_tlb_entries(mm, addr);			\
-		spin_unlock_irqrestore(&pa_tlb_lock, flags);	\
+		spin_unlock_irqrestore(pgd_spinlock((mm)->pgd), flags);\
 	} while (0)
 
 #endif /* !__ASSEMBLY__ */
@@ -88,10 +88,10 @@ static inline void purge_tlb_entries(str
 #if CONFIG_PGTABLE_LEVELS == 3
 #define PGD_ORDER	1 /* Number of pages per pgd */
 #define PMD_ORDER	1 /* Number of pages per pmd */
-#define PGD_ALLOC_ORDER	2 /* first pgd contains pmd */
+#define PGD_ALLOC_ORDER	(2 + 1) /* first pgd contains pmd */
 #else
 #define PGD_ORDER	1 /* Number of pages per pgd */
-#define PGD_ALLOC_ORDER	PGD_ORDER
+#define PGD_ALLOC_ORDER	(PGD_ORDER + 1)
 #endif
 
 /* Definitions for 3rd level (we use PLD here for Page Lower directory
@@ -459,6 +459,17 @@ extern void update_mmu_cache(struct vm_a
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+
+static inline spinlock_t *pgd_spinlock(pgd_t *pgd)
+{
+	extern spinlock_t pa_tlb_flush_lock;
+
+	if (unlikely(pgd == swapper_pg_dir))
+		return &pa_tlb_flush_lock;
+	return (spinlock_t *)((char *)pgd + (PAGE_SIZE << (PGD_ALLOC_ORDER - 1)));
+}
+
+
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
 	pte_t pte;
@@ -467,15 +478,15 @@ static inline int ptep_test_and_clear_yo
 	if (!pte_young(*ptep))
 		return 0;
 
-	spin_lock_irqsave(&pa_tlb_lock, flags);
+	spin_lock_irqsave(pgd_spinlock(vma->vm_mm->pgd), flags);
 	pte = *ptep;
 	if (!pte_young(pte)) {
-		spin_unlock_irqrestore(&pa_tlb_lock, flags);
+		spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
 		return 0;
 	}
 	set_pte(ptep, pte_mkold(pte));
 	purge_tlb_entries(vma->vm_mm, addr);
-	spin_unlock_irqrestore(&pa_tlb_lock, flags);
+	spin_unlock_irqrestore(pgd_spinlock(vma->vm_mm->pgd), flags);
 	return 1;
 }
 
@@ -485,11 +496,11 @@ static inline pte_t ptep_get_and_clear(s
 	pte_t old_pte;
 	unsigned long flags;
 
-	spin_lock_irqsave(&pa_tlb_lock, flags);
+	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
 	old_pte = *ptep;
 	set_pte(ptep, __pte(0));
 	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(&pa_tlb_lock, flags);
+	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
 
 	return old_pte;
 }
@@ -497,10 +508,10 @@ static inline pte_t ptep_get_and_clear(s
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	unsigned long flags;
-	spin_lock_irqsave(&pa_tlb_lock, flags);
+	spin_lock_irqsave(pgd_spinlock(mm->pgd), flags);
 	set_pte(ptep, pte_wrprotect(*ptep));
 	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(&pa_tlb_lock, flags);
+	spin_unlock_irqrestore(pgd_spinlock(mm->pgd), flags);
 }
 
 #define pte_same(A,B)	(pte_val(A) == pte_val(B))
Index: linux-5.1-rc3/arch/parisc/kernel/cache.c
===================================================================
--- linux-5.1-rc3.orig/arch/parisc/kernel/cache.c	2019-04-06 11:12:03.000000000 +0200
+++ linux-5.1-rc3/arch/parisc/kernel/cache.c	2019-04-06 11:12:03.000000000 +0200
@@ -45,7 +45,7 @@ void flush_icache_page_asm(unsigned long
  * by software.  We put a spinlock around all TLB flushes  to
  * ensure this.
  */
-DEFINE_SPINLOCK(pa_tlb_lock);
+DEFINE_SPINLOCK(pa_tlb_flush_lock);
 
 struct pdc_cache_info cache_info __read_mostly;
 #ifndef CONFIG_PA20
Index: linux-5.1-rc3/arch/parisc/include/asm/tlbflush.h
===================================================================
--- linux-5.1-rc3.orig/arch/parisc/include/asm/tlbflush.h	2019-04-06 11:12:03.000000000 +0200
+++ linux-5.1-rc3/arch/parisc/include/asm/tlbflush.h	2019-04-06 11:12:03.000000000 +0200
@@ -18,10 +18,10 @@
  * It is also used to ensure PTE updates are atomic and consistent
  * with the TLB.
  */
-extern spinlock_t pa_tlb_lock;
+extern spinlock_t pa_tlb_flush_lock;
 
-#define purge_tlb_start(flags)	spin_lock_irqsave(&pa_tlb_lock, flags)
-#define purge_tlb_end(flags)	spin_unlock_irqrestore(&pa_tlb_lock, flags)
+#define purge_tlb_start(flags)	spin_lock_irqsave(&pa_tlb_flush_lock, flags)
+#define purge_tlb_end(flags)	spin_unlock_irqrestore(&pa_tlb_flush_lock, flags)
 
 extern void flush_tlb_all(void);
 extern void flush_tlb_all_local(void *);
Index: linux-5.1-rc3/arch/parisc/kernel/entry.S
===================================================================
--- linux-5.1-rc3.orig/arch/parisc/kernel/entry.S	2019-04-06 11:12:03.000000000 +0200
+++ linux-5.1-rc3/arch/parisc/kernel/entry.S	2019-04-06 11:12:22.000000000 +0200
@@ -50,12 +50,8 @@
 
 	.import		pa_tlb_lock,data
 	.macro  load_pa_tlb_lock reg
-#if __PA_LDCW_ALIGNMENT > 4
-	load32	PA(pa_tlb_lock) + __PA_LDCW_ALIGNMENT-1, \reg
-	depi	0,31,__PA_LDCW_ALIGN_ORDER, \reg
-#else
-	load32	PA(pa_tlb_lock), \reg
-#endif
+	mfctl		%cr25,\reg
+	addil		L%(PAGE_SIZE << (PGD_ALLOC_ORDER - 1)),\reg
 	.endm
 
 	/* space_to_prot macro creates a prot id from a space id */
Index: linux-5.1-rc3/arch/parisc/include/asm/pgalloc.h
===================================================================
--- linux-5.1-rc3.orig/arch/parisc/include/asm/pgalloc.h	2019-04-06 11:12:03.000000000 +0200
+++ linux-5.1-rc3/arch/parisc/include/asm/pgalloc.h	2019-04-06 11:12:03.000000000 +0200
@@ -41,6 +41,7 @@ static inline pgd_t *pgd_alloc(struct mm
 		__pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
 #endif
 	}
+	spin_lock_init(pgd_spinlock(actual_pgd));
 	return actual_pgd;
 }
 
