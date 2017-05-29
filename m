From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc/mm: Ensure IRQs are off in switch_mm()
Date: Mon, 29 May 2017 17:14:16 +0200
Message-ID: <20170529151415.GA20946@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is because of commit f98db6013c55 ("sched/core: Add switch_mm_irqs_off()
and use it in the scheduler") in which switch_mm_irqs_off() is called by the
scheduler, vs switch_mm() which is used by use_mm().

This patch lets the parisc code mirror the x86 and powerpc code, ie. it
disables interrupts in switch_mm(), and optimises the scheduler case by
defining switch_mm_irqs_off().

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v4.7+

diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/asm/mmu_context.h
index 59be257..a812262 100644
--- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -49,15 +49,26 @@ static inline void load_context(mm_context_t context)
 	mtctl(__space_to_prot(context), 8);
 }
 
-static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next, struct task_struct *tsk)
+static inline void switch_mm_irqs_off(struct mm_struct *prev,
+		struct mm_struct *next, struct task_struct *tsk)
 {
