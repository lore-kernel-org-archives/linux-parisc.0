From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: COW break issue. Where is the patch ?
Date: Wed, 23 Feb 2011 18:53:14 -0500
Message-ID: <20110223235313.GA258@hiauly1.hia.nrc.ca>
References: <20110222182453.1d9f33da@borg.bxl.tuxicoman.be>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	Carlos O'Donell <carlos@systemhalted.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110222182453.1d9f33da@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 22 Feb 2011, Guy Martin wrote:

> I'm running into some python test failures which I believe is caused by
> the COW break issue and I'd like to test the patch out.
> 
> I've been trying to look through all the mail threads but I can't find
> it.

You might try the attached change to see if it helps.  SMP lightly tested.

Possibly, using flush_dcache_page is overkill and it might not do the
exactly the right thing, but it resolves changing the calling interface
for ptep_set_wrprotect.  There also might be some race conditions.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 5d7b8ce..4924e23 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -450,20 +450,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return old_pte;
 }
 
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
-{
-#ifdef CONFIG_SMP
-	unsigned long new, old;
-
-	do {
-		old = pte_val(*ptep);
-		new = pte_val(pte_wrprotect(__pte (old)));
-	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
-#else
-	pte_t old_pte = *ptep;
-	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
-#endif
-}
+extern void ptep_set_wrprotect(struct mm_struct *, unsigned long, pte_t *);
 
 #define pte_same(A,B)	(pte_val(A) == pte_val(B))
 
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 3f11331..a16430d 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -502,3 +531,22 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 	__flush_cache_page(vma, vmaddr, page_to_phys(pfn_to_page(pfn)));
 
 }
+
+void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+{
+#ifdef CONFIG_SMP
+        unsigned long new, old;
+
+        if (atomic_read(&mm->mm_users) > 1)
+                flush_dcache_page(pte_page(*ptep));
+        do {
+                old = pte_val(*ptep);
+                new = pte_val(pte_wrprotect(__pte (old)));
+        } while (cmpxchg((unsigned long *) ptep, old, new) != old);
+#else
+        pte_t old_pte = *ptep;
+        if (atomic_read(&mm->mm_users) > 1)
+                flush_dcache_page(pte_page(old_pte));
+        set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
+#endif
+}
