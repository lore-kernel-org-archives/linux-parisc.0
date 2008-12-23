From: Kyle McMartin <kyle@infradead.org>
Subject: [PATCH] parisc: disable UP-optimized flush_tlb_mm
Date: Tue, 23 Dec 2008 08:44:30 -0500
Message-ID: <20081223134430.GG30144@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, stable@kernel.org, kyle@infradead.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

flush_tlb_mm's "optimized" uniprocessor case of allocating a new
context for userspace is exposing a race where we can suddely return
to a syscall with the protection id and space id out of sync, trapping
on the next userspace access.

Debugged-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Tested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
Linus, Greg, please apply to stable and HEAD, this is a fairly
important fix for parisc.

Thanks,
	Kyle

 arch/parisc/include/asm/tlbflush.h |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index b72ec66..1f6fd4f 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -44,9 +44,12 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 {
 	BUG_ON(mm == &init_mm); /* Should never happen */
 
-#ifdef CONFIG_SMP
+#if 1 || defined(CONFIG_SMP)
 	flush_tlb_all();
 #else
+	/* FIXME: currently broken, causing space id and protection ids
+	 *  to go out of sync, resulting in faults on userspace accesses.
+	 */
 	if (mm) {
 		if (mm->context != 0)
 			free_sid(mm->context);
-- 
1.6.0.4

