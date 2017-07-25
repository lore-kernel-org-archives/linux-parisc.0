From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Optimize switch_mm
Date: Tue, 25 Jul 2017 17:31:41 -0400
Message-ID: <16F63B59-7A36-48F0-A5C7-670CA2ED9DED@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-51-872574821
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-51-872574821
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

We only need to switch contexts when prev !=3D next, and we don't need =
to disable interrupts
to do the check.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-51-872574821
Content-Disposition: attachment;
	filename=mmu_context.h.d.txt
Content-Type: text/plain;
	name="mmu_context.h.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/mmu_context.h =
b/arch/parisc/include/asm/mmu_context.h
index a81226257878..b1dc6e3f0dd0 100644
--- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -49,26 +49,19 @@ static inline void load_context(mm_context_t =
context)
 	mtctl(__space_to_prot(context), 8);
 }
=20
-static inline void switch_mm_irqs_off(struct mm_struct *prev,
+static inline void switch_mm(struct mm_struct *prev,
 		struct mm_struct *next, struct task_struct *tsk)
 {
+	unsigned long flags;
+
 	if (prev !=3D next) {
+		local_irq_save(flags);
 		mtctl(__pa(next->pgd), 25);
 		load_context(next->context);
+		local_irq_restore(flags);
 	}
 }
=20
-static inline void switch_mm(struct mm_struct *prev,
-		struct mm_struct *next, struct task_struct *tsk)
-{
-	unsigned long flags;
-
-	local_irq_save(flags);
-	switch_mm_irqs_off(prev, next, tsk);
-	local_irq_restore(flags);
-}
-#define switch_mm_irqs_off switch_mm_irqs_off
--Apple-Mail-51-872574821--
