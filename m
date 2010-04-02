From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 2 Apr 2010 15:35:14 -0400
Message-ID: <20100402193514.GA9860@hiauly1.hia.nrc.ca>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de> <4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org> <4BB5594C.8050505@fsij.org> <1270179025.18981.19.camel@mulgrave.site> <4BB568FB.1090908@fsij.org> <4BB5A557.2000405@fsij.org>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: NIIBE Yutaka <gniibe@fsij.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BB5A557.2000405@fsij.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 02 Apr 2010, NIIBE Yutaka wrote:

> NIIBE Yutaka wrote:
>> To have same semantics as other archs, I think that VIPT-WB cache
>> machine should have cache flush at ptep_set_wrprotect, so that memory
>> of the page has up-to-date data.  Yes, it will be huge performance
>> impact for fork.  But I don't find any good solution other than this
>> yet.
>
> I think we could do something like (only for VIPT-WB cache machine):
>
> -	static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long 
> address, pte_t *ptep)
>
> +	static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct 
> mm_struct *mm, unsigned long addr, pte_t *ptep)
> 	{
> 		pte_t old_pte = *ptep;
> +		if (atomic_read(&mm->mm_users) > 1)
> +			flush_cache_page(vma, addr, pte_pfn(old_pte));
> 		set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
> 	}

I tested the hack below on two machines currently running 2.6.33.2
UP kernels.  The change seems to fix Debian #561203 (minifail bug)!
Thus, I definitely think you are on the right track.  I'll continue
to test.

I suspect the same issue is present for SMP kernels.

Thanks,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a27d2e2..a5d730f 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -14,6 +14,7 @@
 #include <linux/bitops.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
+extern void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long pfn);
 
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -456,7 +457,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return old_pte;
 }
 
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
 	unsigned long new, old;
@@ -467,6 +468,8 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
 #else
 	pte_t old_pte = *ptep;
+	if (atomic_read(&mm->mm_users) > 1)
+		flush_cache_page(vma, addr, pte_pfn(old_pte));
 	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
 #endif
 }
diff --git a/mm/memory.c b/mm/memory.c
index 09e4b1b..21c2916 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -616,7 +616,7 @@ copy_one_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	 * in the parent and the child
 	 */
 	if (is_cow_mapping(vm_flags)) {
-		ptep_set_wrprotect(src_mm, addr, src_pte);
+		ptep_set_wrprotect(vma, src_mm, addr, src_pte);
 		pte = pte_wrprotect(pte);
 	}
 
