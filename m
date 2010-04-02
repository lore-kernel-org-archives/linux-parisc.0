From: NIIBE Yutaka <gniibe@fsij.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 02 Apr 2010 17:05:43 +0900
Message-ID: <4BB5A557.2000405@fsij.org>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de>		<4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org>		<4BB5594C.8050505@fsij.org>	<1270179025.18981.19.camel@mulgrave.site> <4BB568FB.1090908@fsij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BB568FB.1090908@fsij.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

NIIBE Yutaka wrote:
> To have same semantics as other archs, I think that VIPT-WB cache
> machine should have cache flush at ptep_set_wrprotect, so that memory
> of the page has up-to-date data.  Yes, it will be huge performance
> impact for fork.  But I don't find any good solution other than this
> yet.

I think we could do something like (only for VIPT-WB cache machine):

-	static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned 
long address, pte_t *ptep)

+	static inline void ptep_set_wrprotect(struct vm_area_struct *vma, 
struct mm_struct *mm, unsigned long addr, pte_t *ptep)
	{
		pte_t old_pte = *ptep;
+		if (atomic_read(&mm->mm_users) > 1)
+			flush_cache_page(vma, addr, pte_pfn(old_pte));
		set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
	}

Here, we can add condition for the call of flush_cache_page
to avoid big performance impact for non threads case.
-- 
