From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Tue, 9 Jul 2013 19:35:03 -0400
Message-ID: <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org> <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org> <51DC7996.3010405@bell.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-3--31287552"
Cc: Alex Ivanov <gnidorah@p0n4ik.tk>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51DC7996.3010405@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-3--31287552
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit

On 9-Jul-13, at 4:59 PM, John David Anglin wrote:

> On 7/9/2013 3:45 PM, Alex Ivanov wrote:
>> The panic on SMP kernel changed to another one:
>> http://pastebin.com/SfUfd0Un
> This is just a guess but I don't think page is valid
> if the pfn is not valid.  You might try this untested change.
>
> flush_cache_mm might have same problem (i.e., we may need to
> check whether the pfn for the pte is valid).

This version compiles and boots on rp3440.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-3--31287552
Content-Disposition: attachment; filename="cache.c.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="cache.c.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 65fb4cb..b07720f 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -74,10 +74,13 @@ EXPORT_SYMBOL(flush_cache_all_local);
 void
 update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
 {
-	struct page *page = pte_page(*ptep);
+	struct page *page;
 
-	if (pfn_valid(page_to_pfn(page)) && page_mapping(page) &&
-	    test_bit(PG_dcache_dirty, &page->flags)) {
+	if (!pfn_valid(pte_pfn(*ptep)))
+		return;
+
+	page = pte_page(*ptep);
+	if (page_mapping(page) && test_bit(PG_dcache_dirty, &page->flags)) {
 
 		flush_kernel_dcache_page(page);
 		clear_bit(PG_dcache_dirty, &page->flags);
@@ -519,8 +522,9 @@ void flush_cache_mm(struct mm_struct *mm)
 					pte_t *ptep = get_ptep(pgd, addr);
 					if (ptep != NULL) {
 						pte_t pte = *ptep;
-						__flush_cache_page(vma, addr,
-						  page_to_phys(pte_page(pte)));
+						if (pfn_valid(pte_pfn(pte)))
+							__flush_cache_page(vma, addr,
+						  		page_to_phys(pte_page(pte)));
 					}
 				}
 			}

--Apple-Mail-3--31287552--
