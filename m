From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Prevent TLB speculation on flushed pages on CPUs that only support equivalent aliases
Date: Tue, 25 Jul 2017 17:11:26 -0400
Message-ID: <71EB19D6-E071-42AE-A338-A0D600EEE627@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-38-871360738
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-38-871360738
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Helge noticed that we flush the TLB page in flush_cache_page but not in =
flush_cache_range
or flush_cache_mm.

For a long time, we have had random segmentation faults building =
packages on machines with
PA8800/8900 processors.  These machines only support equivalent aliases. =
 We don't see these
faults on machines that don't require strict coherency.  So, it appears =
TLB speculation sometimes
leads to cache corruption on machines that require coherency.

This patch adds TLB flushes to flush_cache_range and flush_cache_mm when =
coherency is
required.  We only flush the TLB in flush_cache_page when coherency is =
required.

The patch also optimizes flush_cache_range.  It turns out we always have =
the right context
to use flush_user_dcache_range_asm and flush_user_icache_range_asm.

The patch has been tested for some time on rp3440, rp3410 and A500-44.  =
It's been boot tested
on c8000.  No random segmentation faults were observed during testing.

Signed-off-by: John David Anglin <dave.anglin@gell.net>



--Apple-Mail-38-871360738
Content-Disposition: attachment;
	filename=cache-tlb.d.txt
Content-Type: text/plain;
	name="cache-tlb.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c32a09095216..85a92db70afc 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -539,6 +539,10 @@ void flush_cache_mm(struct mm_struct *mm)
 	struct vm_area_struct *vma;
 	pgd_t *pgd;
=20
+	/* Flush the TLB to avoid speculation if coherency is required. =
*/
+	if (parisc_requires_coherency())
+		flush_tlb_all();
+
 	/* Flushing the whole cache on each cpu takes forever on
 	   rp3440, etc.  So, avoid it if the mm isn't too big.  */
 	if (mm_total_size(mm) >=3D parisc_cache_flush_threshold) {
@@ -577,33 +581,22 @@ void flush_cache_mm(struct mm_struct *mm)
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
-	unsigned long addr;
-	pgd_t *pgd;
-
 	BUG_ON(!vma->vm_mm->context);
=20
+	/* Flush the TLB to avoid speculation if coherency is required. =
*/
+	if (parisc_requires_coherency())
+		flush_tlb_range(vma, start, end);
+
 	if ((end - start) >=3D parisc_cache_flush_threshold) {
 		flush_cache_all();
 		return;
 	}
=20
-	if (vma->vm_mm->context =3D=3D mfsp(3)) {
-		flush_user_dcache_range_asm(start, end);
-		if (vma->vm_flags & VM_EXEC)
-			flush_user_icache_range_asm(start, end);
-		return;
-	}
+	BUG_ON(vma->vm_mm->context !=3D mfsp(3));
=20
-	pgd =3D vma->vm_mm->pgd;
-	for (addr =3D start & PAGE_MASK; addr < end; addr +=3D =
PAGE_SIZE) {
-		unsigned long pfn;
-		pte_t *ptep =3D get_ptep(pgd, addr);
-		if (!ptep)
-			continue;
-		pfn =3D pte_pfn(*ptep);
-		if (pfn_valid(pfn))
-			__flush_cache_page(vma, addr, PFN_PHYS(pfn));
-	}
+	flush_user_dcache_range_asm(start, end);
+	if (vma->vm_flags & VM_EXEC)
+		flush_user_icache_range_asm(start, end);
 }
=20
 void
@@ -612,7 +605,8 @@ flush_cache_page(struct vm_area_struct *vma, =
unsigned long vmaddr, unsigned long
 	BUG_ON(!vma->vm_mm->context);
=20
 	if (pfn_valid(pfn)) {
-		flush_tlb_page(vma, vmaddr);
+		if (parisc_requires_coherency())
+			flush_tlb_page(vma, vmaddr);
 		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 	}
 }

--Apple-Mail-38-871360738
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-38-871360738--
