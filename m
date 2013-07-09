From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Tue, 09 Jul 2013 16:59:02 -0400
Message-ID: <51DC7996.3010405@bell.net>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org> <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060600090709030508050008"
Cc: linux-parisc@vger.kernel.org
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <loom.20130709T200549-18@post.gmane.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------060600090709030508050008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/2013 3:45 PM, Alex Ivanov wrote:
> The panic on SMP kernel changed to another one:
> http://pastebin.com/SfUfd0Un
This is just a guess but I don't think page is valid
if the pfn is not valid.  You might try this untested change.

flush_cache_mm might have same problem (i.e., we may need to
check whether the pfn for the pte is valid).

Dave

-- 
John David Anglin    dave.anglin@bell.net


--------------060600090709030508050008
Content-Type: text/plain; charset=windows-1252;
 name="cache.c.d.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cache.c.d.txt"

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 65fb4cb..8f60123 100644
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
+	if (!pfn_valid(*ptep))
+		return;
+
+	page = pte_page(*ptep);
+	if (page_mapping(page) && test_bit(PG_dcache_dirty, &page->flags)) {
 
 		flush_kernel_dcache_page(page);
 		clear_bit(PG_dcache_dirty, &page->flags);

--------------060600090709030508050008--
