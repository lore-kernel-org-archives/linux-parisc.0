Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i36LbKa26461; Tue, 6 Apr 2004 17:37:20 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040406213446.CB675494194@palinux.hppa>
References: <20040406213446.CB675494194@palinux.hppa>
Content-Type: text/plain
Date: 06 Apr 2004 16:37:15 -0500
Message-Id: <1081287436.1837.43.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2004-04-06 at 16:34, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/06 15:34:46
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: cache.c 
> 
> Log message:
> Fix flush_dcache_page

Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.6
diff -u -r1.6 cache.c
--- a/arch/parisc/kernel/cache.c	5 Apr 2004 02:47:39 -0000	1.6
+++ b/arch/parisc/kernel/cache.c	6 Apr 2004 21:30:44 -0000
@@ -227,6 +227,32 @@
 	disable_sr_hashing_asm(srhash_type);
 }
 
+/* Simple function to work out if we have an existing address translation
+ * for a user space vma. */
+static inline int translation_exists(struct vm_area_struct *vma,
+				     unsigned long addr)
+{
+	pgd_t *pgd = pgd_offset(vma->vm_mm, addr);
+	pmd_t *pmd;
+	pte_t *pte;
+
+	if(pgd_none(*pgd))
+		return 0;
+
+	pmd = pmd_offset(pgd, addr);
+	if(pmd_none(*pmd) || pmd_bad(*pmd))
+		return 0;
+
+	pte = pte_offset_map(pmd, addr);
+
+	/* The PA flush mappings show up as pte_none, but they're
+	 * valid none the less */
+	if(pte_none(*pte) && ((pte_val(*pte) & _PAGE_FLUSH) == 0))
+		return 0;
+	return 1;
+}
+	   
+
 void __flush_dcache_page(struct page *page)
 {
 	struct mm_struct *mm = current->active_mm;
@@ -237,19 +263,15 @@
 
 	if (!page->mapping)
 		return;
-	/* check shared list first if it's not empty...it's usually
-	 * the shortest */
+
+	/* We have ensured in arch_get_unmapped_area() that all shared
+	 * mappings are mapped at equivalent addresses, so we only need
+	 * to flush one for them all to become coherent */
 	list_for_each(l, &page->mapping->i_mmap_shared) {
 		struct vm_area_struct *mpnt;
-		unsigned long off;
+		unsigned long off, addr;
 
-		anyvma = mpnt = list_entry(l, struct vm_area_struct, shared);
-
-		/*
-		 * If this VMA is not in our MM, we can ignore it.
-		 */
-		if (mpnt->vm_mm != mm)
-			continue;
+		mpnt = list_entry(l, struct vm_area_struct, shared);
 
 		if (page->index < mpnt->vm_pgoff)
 			continue;
@@ -258,25 +280,51 @@
 		if (off >= (mpnt->vm_end - mpnt->vm_start) >> PAGE_SHIFT)
 			continue;
 
-		flush_cache_page(mpnt, mpnt->vm_start + (off << PAGE_SHIFT));
+		addr = mpnt->vm_start + (off << PAGE_SHIFT);
+
+		/* flush instructions produce non access tlb misses.
+		 * On PA, we nullify these instructions rather than 
+		 * taking a page fault if the pte doesn't exist, so we
+		 * have to find a congruent address with an existing
+		 * translation */
+
+		if (!translation_exists(mpnt, addr))
+			continue;
+
+		anyvma = mpnt;
+
+		/*
+		 * We try first to find a page in our current user process
+		 */
+		if (mpnt->vm_mm != mm)
+			continue;
+
+
+		flush_cache_page(mpnt, addr);
 
 		/* All user shared mappings should be equivalently mapped,
 		 * so once we've flushed one we should be ok
 		 */
-		return;
+		goto flush_unshared;
 	}
 
-	/* then check private mapping list for read only shared mappings
-	 * which are flagged by VM_MAYSHARE */
-	list_for_each(l, &page->mapping->i_mmap) {
-		struct vm_area_struct *mpnt;
-		unsigned long off;
+	/* OK, shared page but not in our current process' address space */
+	if (anyvma) {
+		unsigned long addr = anyvma->vm_start
+			+ ((page->index - anyvma->vm_pgoff) << PAGE_SHIFT);
+		flush_cache_page(anyvma, addr);
+	}
 
-		anyvma = mpnt = list_entry(l, struct vm_area_struct, shared);
+ flush_unshared:
 
+	/* Private mappings will not have congruent addresses, so we
+	 * have to flush each of them individually to make the change
+	 * in the kernel page visible */
+	list_for_each(l, &page->mapping->i_mmap) {
+		struct vm_area_struct *mpnt;
+		unsigned long off, addr;
 
-		if (mpnt->vm_mm != mm || !(mpnt->vm_flags & VM_MAYSHARE))
-			continue;
+		mpnt = list_entry(l, struct vm_area_struct, shared);
 
 		if (page->index < mpnt->vm_pgoff)
 			continue;
@@ -285,20 +333,15 @@
 		if (off >= (mpnt->vm_end - mpnt->vm_start) >> PAGE_SHIFT)
 			continue;
 
-		flush_cache_page(mpnt, mpnt->vm_start + (off << PAGE_SHIFT));
+		addr = mpnt->vm_start + (off << PAGE_SHIFT);
 
-		/* All user shared mappings should be equivalently mapped,
-		 * so once we've flushed one we should be ok
-		 */
-		return;
-	}
-	/* This is the problem case.  We failed to find the page to be
-	 * flushed in the current vma thus we have to flush it in some
-	 * other user process */
-	if (likely(anyvma)) {
-		unsigned long addr = anyvma->vm_start
-			+ ((page->index - anyvma->vm_pgoff) << PAGE_SHIFT);
-		flush_user_cache_page_non_current(anyvma, addr);
+		/* This is just for speed.  If the page translation isn't
+		 * there there's no point exciting the nadtlb handler into
+		 * a nullification frenzy */
+		if(!translation_exists(mpnt, addr))
+			continue;
+
+		flush_cache_page(mpnt, addr);
 	}
 }
 EXPORT_SYMBOL(__flush_dcache_page);
