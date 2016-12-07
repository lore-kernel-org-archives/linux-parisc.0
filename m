From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Purge TLB before setting PTE
Date: Tue, 6 Dec 2016 21:47:04 -0500
Message-ID: <2417DC67-24FE-45CF-BFF3-8818ABD7B415@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-25-260451527
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-25-260451527
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The attached change interchanges the order of purging the TLB and =
setting the corresponding page
table entry.  TLB purges are strongly ordered.  It occurred to me one =
night that setting the PTE first
might have subtle ordering issues on SMP machines and cause random =
memory corruption.

A TLB lock guards the insertion of user TLB entries.  So after the TLB =
is purged, a new entry can't
be inserted until the lock is released.  This ensures that the new PTE =
value is used when the lock
is released.

Since making this change, no random segmentation faults have been =
observed on the Debian hppa
buildd servers.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>



--Apple-Mail-25-260451527
Content-Disposition: attachment;
	filename=pgtable.h.d.txt
Content-Type: text/plain;
	name="pgtable.h.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/pgtable.h =
b/arch/parisc/include/asm/pgtable.h
index c2c43f7..3a4ed9f 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -65,9 +65,9 @@ static inline void purge_tlb_entries(struct mm_struct =
*mm, unsigned long addr)
 		unsigned long flags;				\
 		spin_lock_irqsave(&pa_tlb_lock, flags);		\
 		old_pte =3D *ptep;				\
-		set_pte(ptep, pteval);				\
 		if (pte_inserted(old_pte))			\
 			purge_tlb_entries(mm, addr);		\
+		set_pte(ptep, pteval);				\
 		spin_unlock_irqrestore(&pa_tlb_lock, flags);	\
 	} while (0)
=20
@@ -478,8 +478,8 @@ static inline int ptep_test_and_clear_young(struct =
vm_area_struct *vma, unsigned
 		spin_unlock_irqrestore(&pa_tlb_lock, flags);
 		return 0;
 	}
-	set_pte(ptep, pte_mkold(pte));
 	purge_tlb_entries(vma->vm_mm, addr);
+	set_pte(ptep, pte_mkold(pte));
 	spin_unlock_irqrestore(&pa_tlb_lock, flags);
 	return 1;
 }
@@ -492,9 +492,9 @@ static inline pte_t ptep_get_and_clear(struct =
mm_struct *mm, unsigned long addr,
=20
 	spin_lock_irqsave(&pa_tlb_lock, flags);
 	old_pte =3D *ptep;
-	set_pte(ptep, __pte(0));
 	if (pte_inserted(old_pte))
 		purge_tlb_entries(mm, addr);
+	set_pte(ptep, __pte(0));
 	spin_unlock_irqrestore(&pa_tlb_lock, flags);
=20
 	return old_pte;
@@ -504,8 +504,8 @@ static inline void ptep_set_wrprotect(struct =
mm_struct *mm, unsigned long addr,
 {
 	unsigned long flags;
 	spin_lock_irqsave(&pa_tlb_lock, flags);
-	set_pte(ptep, pte_wrprotect(*ptep));
 	purge_tlb_entries(mm, addr);
+	set_pte(ptep, pte_wrprotect(*ptep));
 	spin_unlock_irqrestore(&pa_tlb_lock, flags);
 }
=20

--Apple-Mail-25-260451527
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-25-260451527--
