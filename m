Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DFFC4890
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 00:16:01 -0600 (MDT)
Date: Thu, 8 Apr 2004 08:15:57 +0200
Message-ID: <40711E55000025BC@ocpmta2.freegates.net>
In-Reply-To: <1081299262.1837.47.camel@mulgrave>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
To: "James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

Sorry first for bad wrapping (known pb with webmail interface :( ).

Now as far as remember .h files are headers and so should only contains declaration
of function and not their definition excepted if they are very short  (imho
3 line max) but that is a personal limit: does it exist a common agreement
on this limit? 
And here why changing translation_exists() definition location?

That said, I tested 2.6.5-pa5 32bit on a b2k and 64bits (gcc-3.0.4 from ftp.p-l.org)
on a n4k and they works fine. (I couldn't just reproduce Grant pb because
no usb device available :( )

Sorry if I annoye with philosophical question and thanks for great job as
well as additional for info,
    Joel

> -- Original Message --
> From: James Bottomley <James.Bottomley@steeleye.com>
> To: PARISC list <parisc-linux@lists.parisc-linux.org>
> Date: 06 Apr 2004 19:54:21 -0500
> Cc: parisc-linux-cvs@lists.parisc-linux.org
> Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
> 
> 
> On Tue, 2004-04-06 at 19:49, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/06 18:49:01
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: cache.c 
> 	include/asm-parisc: cach
> flush.h 
> 
> Log message:
> Optimise flush_cache_page
> 
> Now that we have a way of checking translations for a page, don't bother
> flushing if there's no translation.

Index: arch/parisc/kernel/cache.c
=====================================
> =============================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.7
diff -u -r1.7 cache.c
--- a/arch/parisc/kernel/cache.c	6 Apr 2004 21:34:46 -0000	1.7
+++ b/arch/parisc/kernel/cache.c	7 Apr 2004 00:16:
> 5 -0000
@@ -227,32 +227,6 @@
 	disable_sr_hashing_asm(srhash_type);
 }
 
-/* Simple function to work out if we have an existing address translation
- * for a user space vma. */
-static inline int translation_exists(struct vm_area_struct *vma,
-
> 			     unsigned long addr)
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
-	pte = pte_o
> fset_map(pmd, addr);
-
-	/* The PA flush mappings show up as pte_none, but they're
-	 * valid none the less */
-	if(pte_none(*pte) && ((pte_val(*pte) & _PAGE_FLUSH) == 0))
-		return 0;
-	return 1;
-}
-	   
-
 void __flush_dcache_page(struct p
> ge *page)
 {
 	struct mm_struct *mm = current->active_mm;
@@ -300,7 +274,7 @@
 			continue;
 

-		flush_cache_page(mpnt, addr);
+		__flush_cache_page(mpnt, addr);
 
 		/* All user shared mappings should be equivalently mapped,
 		 * so once 
> e've flushed one we should be ok
@@ -312,7 +286,7 @@
 	if (anyvma) {
 		unsigned long addr = anyvma->vm_start
 			+ ((page->index - anyvma->vm_pgoff) << PAGE_SHIFT);
-		flush_cache_page(anyvma, addr);
+		__flush_cache_page(anyvma, addr);
 	}
 

>   flush_unshared:
@@ -341,7 +315,7 @@
 		if(!translation_exists(mpnt, addr))
 			continue;
 
-		flush_cache_page(mpnt, addr);
+		__flush_cache_page(mpnt, addr);
 	}
 }
 EXPORT_SYMBOL(__flush_dcache_page);
Index: include/asm-parisc/cacheflush.
> 
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/cacheflush.h,v
retrieving revision 1.8
diff -u -r1.8 cacheflush.h
--- a/include/asm-parisc/cacheflush.h	5 Apr 2004 17:41:30 -0000	
> .8
+++ b/include/asm-parisc/cacheflush.h	7 Apr 2004 00:17:15 -0000
@@ -107,6 +107,32 @@
 	}
 }
 
+/* Simple function to work out if we have an existing address translation
+ * for a user space vma. */
+static inline int translation_exists(struc
>  vm_area_struct *vma,
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
+		re
> urn 0;
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
 /* Private f
> nction to flush a page from the cache of a non-current
  * process.  cr25 contains the Page Directory of the current user
  * process; we're going to hijack both it and the user space %sr3 to
@@ -141,17 +167,25 @@
 }
 
 static inline void
-flush
> cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
+__flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
-	BUG_ON(!vma->vm_mm->context);
-
-	if (vma->vm_mm->context == mfsp(3)) {
+	if (likely(vma->vm_mm->context == mf
> p(3))) {
 		flush_user_dcache_page(vmaddr);
 		if (vma->vm_flags & VM_EXEC)
 			flush_user_icache_page(vmaddr);
 	} else {
 		flush_user_cache_page_non_current(vma, vmaddr);
 	}
+}
+
+static inline void
+flush_cache_page(struct vm_area_struct
> *vma, unsigned long vmaddr)
+{
+	BUG_ON(!vma->vm_mm->context);
+
+	if(likely(translation_exists(vma, vmaddr)))
+		__flush_cache_page(vma, vmaddr);
+
 }
 #endif
 

_______________________________________________
parisc-linux mailing list
pa
> isc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
