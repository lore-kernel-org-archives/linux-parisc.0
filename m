Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i370sPa03537; Tue, 6 Apr 2004 20:54:26 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040407004901.031D3494194@palinux.hppa>
References: <20040407004901.031D3494194@palinux.hppa>
Content-Type: text/plain
Date: 06 Apr 2004 19:54:21 -0500
Message-Id: <1081299262.1837.47.camel@mulgrave>
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

On Tue, 2004-04-06 at 19:49, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/06 18:49:01
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: cache.c 
> 	include/asm-parisc: cacheflush.h 
> 
> Log message:
> Optimise flush_cache_page
> 
> Now that we have a way of checking translations for a page, don't bother
> flushing if there's no translation.

Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.7
diff -u -r1.7 cache.c
--- a/arch/parisc/kernel/cache.c	6 Apr 2004 21:34:46 -0000	1.7
+++ b/arch/parisc/kernel/cache.c	7 Apr 2004 00:16:55 -0000
@@ -227,32 +227,6 @@
 	disable_sr_hashing_asm(srhash_type);
 }
 
-/* Simple function to work out if we have an existing address translation
- * for a user space vma. */
-static inline int translation_exists(struct vm_area_struct *vma,
-				     unsigned long addr)
-{
-	pgd_t *pgd = pgd_offset(vma->vm_mm, addr);
-	pmd_t *pmd;
-	pte_t *pte;
-
-	if(pgd_none(*pgd))
-		return 0;
-
-	pmd = pmd_offset(pgd, addr);
-	if(pmd_none(*pmd) || pmd_bad(*pmd))
-		return 0;
-
-	pte = pte_offset_map(pmd, addr);
-
-	/* The PA flush mappings show up as pte_none, but they're
-	 * valid none the less */
-	if(pte_none(*pte) && ((pte_val(*pte) & _PAGE_FLUSH) == 0))
-		return 0;
-	return 1;
-}
-	   
-
 void __flush_dcache_page(struct page *page)
 {
 	struct mm_struct *mm = current->active_mm;
@@ -300,7 +274,7 @@
 			continue;
 

-		flush_cache_page(mpnt, addr);
+		__flush_cache_page(mpnt, addr);
 
 		/* All user shared mappings should be equivalently mapped,
 		 * so once we've flushed one we should be ok
@@ -312,7 +286,7 @@
 	if (anyvma) {
 		unsigned long addr = anyvma->vm_start
 			+ ((page->index - anyvma->vm_pgoff) << PAGE_SHIFT);
-		flush_cache_page(anyvma, addr);
+		__flush_cache_page(anyvma, addr);
 	}
 
  flush_unshared:
@@ -341,7 +315,7 @@
 		if(!translation_exists(mpnt, addr))
 			continue;
 
-		flush_cache_page(mpnt, addr);
+		__flush_cache_page(mpnt, addr);
 	}
 }
 EXPORT_SYMBOL(__flush_dcache_page);
Index: include/asm-parisc/cacheflush.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/cacheflush.h,v
retrieving revision 1.8
diff -u -r1.8 cacheflush.h
--- a/include/asm-parisc/cacheflush.h	5 Apr 2004 17:41:30 -0000	1.8
+++ b/include/asm-parisc/cacheflush.h	7 Apr 2004 00:17:15 -0000
@@ -107,6 +107,32 @@
 	}
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
 /* Private function to flush a page from the cache of a non-current
  * process.  cr25 contains the Page Directory of the current user
  * process; we're going to hijack both it and the user space %sr3 to
@@ -141,17 +167,25 @@
 }
 
 static inline void
-flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
+__flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
-	BUG_ON(!vma->vm_mm->context);
-
-	if (vma->vm_mm->context == mfsp(3)) {
+	if (likely(vma->vm_mm->context == mfsp(3))) {
 		flush_user_dcache_page(vmaddr);
 		if (vma->vm_flags & VM_EXEC)
 			flush_user_icache_page(vmaddr);
 	} else {
 		flush_user_cache_page_non_current(vma, vmaddr);
 	}
+}
+
+static inline void
+flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
+{
+	BUG_ON(!vma->vm_mm->context);
+
+	if(likely(translation_exists(vma, vmaddr)))
+		__flush_cache_page(vma, vmaddr);
+
 }
 #endif
 
