Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i352soa22393; Sun, 4 Apr 2004 22:54:50 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
In-Reply-To: <1081133356.2112.36.camel@mulgrave>
References: <20040405024740.9330F494194@palinux.hppa>
	<1081133356.2112.36.camel@mulgrave>
Content-Type: text/plain
Date: 04 Apr 2004 22:54:45 -0400
Message-Id: <1081133686.2112.38.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

And now with the correct patch attached.

James

===== arch/parisc/kernel/cache.c 1.7 vs edited =====
--- 1.7/arch/parisc/kernel/cache.c	Wed Dec 17 23:48:38 2003
+++ edited/arch/parisc/kernel/cache.c	Sun Apr  4 20:10:40 2004
@@ -231,6 +231,7 @@
 {
 	struct mm_struct *mm = current->active_mm;
 	struct list_head *l;
+	struct vm_area_struct *anyvma = NULL;
 
 	flush_kernel_dcache_page(page_address(page));
 
@@ -242,7 +243,7 @@
 		struct vm_area_struct *mpnt;
 		unsigned long off;
 
-		mpnt = list_entry(l, struct vm_area_struct, shared);
+		anyvma = mpnt = list_entry(l, struct vm_area_struct, shared);
 
 		/*
 		 * If this VMA is not in our MM, we can ignore it.
@@ -271,7 +272,7 @@
 		struct vm_area_struct *mpnt;
 		unsigned long off;
 
-		mpnt = list_entry(l, struct vm_area_struct, shared);
+		anyvma = mpnt = list_entry(l, struct vm_area_struct, shared);
 

 		if (mpnt->vm_mm != mm || !(mpnt->vm_flags & VM_MAYSHARE))
@@ -289,7 +290,15 @@
 		/* All user shared mappings should be equivalently mapped,
 		 * so once we've flushed one we should be ok
 		 */
-		break;
+		return;
+	}
+	/* This is the problem case.  We failed to find the page to be
+	 * flushed in the current vma thus we have to flush it in some
+	 * other user process */
+	if (likely(anyvma)) {
+		unsigned long addr = anyvma->vm_start
+			+ ((page->index - anyvma->vm_pgoff) << PAGE_SHIFT);
+		flush_user_cache_page_non_current(anyvma, addr);
 	}
 }
 EXPORT_SYMBOL(__flush_dcache_page);
===== arch/parisc/kernel/pacache.S 1.4 vs edited =====
--- 1.4/arch/parisc/kernel/pacache.S	Thu Mar 11 03:05:50 2004
+++ edited/arch/parisc/kernel/pacache.S	Sun Apr  4 19:52:34 2004
@@ -574,6 +574,95 @@
 	.exit
 
 	.procend
+	
+	.export flush_user_dcache_page
+
+flush_user_dcache_page:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+	ldil    L%dcache_stride,%r1
+	ldw     R%dcache_stride(%r1),%r23
+
+#ifdef __LP64__
+	depdi,z 1,63-PAGE_SHIFT,1,%r25
+#else
+	depwi,z 1,31-PAGE_SHIFT,1,%r25
+#endif
+	add     %r26,%r25,%r25
+	sub     %r25,%r23,%r25
+
+
+1:      fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	fdc,m   %r23(%sr3,%r26)
+	CMPB<<  %r26,%r25,1b
+	fdc,m   %r23(%sr3,%r26)
+
+	sync
+	bv      %r0(%r2)
+	nop
+	.exit
+
+	.procend
+
+	.export flush_user_icache_page
+
+flush_user_icache_page:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+	ldil    L%dcache_stride,%r1
+	ldw     R%dcache_stride(%r1),%r23
+
+#ifdef __LP64__
+	depdi,z 1,63-PAGE_SHIFT,1,%r25
+#else
+	depwi,z 1,31-PAGE_SHIFT,1,%r25
+#endif
+	add     %r26,%r25,%r25
+	sub     %r25,%r23,%r25
+
+
+1:      fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	fic,m   %r23(%sr3,%r26)
+	CMPB<<  %r26,%r25,1b
+	fic,m   %r23(%sr3,%r26)
+
+	sync
+	bv      %r0(%r2)
+	nop
+	.exit
+
+	.procend
+
 
 	.export purge_kernel_dcache_page
 
===== include/asm-parisc/cache.h 1.5 vs edited =====
--- 1.5/include/asm-parisc/cache.h	Tue Feb  3 23:43:00 2004
+++ edited/include/asm-parisc/cache.h	Sun Apr  4 19:51:32 2004
@@ -52,6 +52,8 @@
 extern void disable_sr_hashing_asm(int); /* low level support for above */
 extern void free_sid(unsigned long);
 unsigned long alloc_sid(void);
+extern void flush_user_dcache_page(unsigned long);
+extern void flush_user_icache_page(unsigned long);
 
 struct seq_file;
 extern void show_cache_info(struct seq_file *m);
===== include/asm-parisc/cacheflush.h 1.6 vs edited =====
--- 1.6/include/asm-parisc/cacheflush.h	Thu Oct  2 02:11:59 2003
+++ edited/include/asm-parisc/cacheflush.h	Sun Apr  4 20:07:40 2004
@@ -111,26 +111,50 @@
 	}
 }
 
+/* Private function to flush a page from the cache of a non-current
+ * process.  cr25 contains the Page Directory of the current user
+ * process; we're going to hijack both it and the user space %sr3 to
+ * temporarily make the non-current process current.  We have to do
+ * this because cache flushing may cause a non-access tlb miss which
+ * the handlers have to fill in from the pgd of the non-current
+ * process. */
+static inline void
+flush_user_cache_page_non_current(struct vm_area_struct *vma,
+				  unsigned long vmaddr)
+{
+	/* save the current process space and pgd */
+	unsigned long space = mfsp(3), pgd = mfctl(25);
+
+	/* we don't mind taking interrups since they may not
+	 * do anything with user space, but we can't
+	 * be preempted here */
+	preempt_disable();
+
+	/* make us current */
+	mtctl(__pa(vma->vm_mm->pgd), 25);
+	mtsp(vma->vm_mm->context, 3);
+
+	flush_user_dcache_page(vmaddr);
+	if(vma->vm_flags & VM_EXEC)
+		flush_user_icache_page(vmaddr);
+
+	/* put the old current process back */
+	mtsp(space, 3);
+	mtctl(pgd, 25);
+	preempt_enable();
+}
+
 static inline void
 flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
-	int sr3;
+	BUG_ON(!vma->vm_mm->context);
 
-	if (!vma->vm_mm->context) {
-		BUG();
-		return;
-	}
-
-	sr3 = mfsp(3);
-	if (vma->vm_mm->context == sr3) {
-		flush_user_dcache_range(vmaddr,vmaddr + PAGE_SIZE);
+	if (vma->vm_mm->context == mfsp(3)) {
+		flush_user_dcache_page(vmaddr);
 		if (vma->vm_flags & VM_EXEC)
-			flush_user_icache_range(vmaddr,vmaddr + PAGE_SIZE);
+			flush_user_icache_page(vmaddr);
 	} else {
-		if (vma->vm_flags & VM_EXEC)
-			flush_cache_all();
-		else
-			flush_data_cache();
+		flush_user_cache_page_non_current(vma, vmaddr);
 	}
 }
 #endif
