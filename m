Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3CFtma26183; Mon, 12 Apr 2004 11:55:48 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040412154800.D31F6494194@palinux.hppa>
References: <20040412154800.D31F6494194@palinux.hppa>
Content-Type: text/plain
Date: 12 Apr 2004 10:55:47 -0500
Message-Id: <1081785349.2060.28.camel@mulgrave>
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

On Mon, 2004-04-12 at 10:48, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/12 09:48:00
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: cache.c 
> 
> Log message:
> According to recent discussion on the parisc list, it's far more
> expensive to walk the i_mmap_shared list to find our current mm than
> it is simply to change the space registers to flush the first mm we
> find.  This change updates __flush_dcache_page() accordingly.

Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.8
diff -u -r1.8 cache.c
--- a/arch/parisc/kernel/cache.c	7 Apr 2004 00:49:01 -0000	1.8
+++ b/arch/parisc/kernel/cache.c	12 Apr 2004 15:44:55 -0000
@@ -229,9 +229,7 @@
 
 void __flush_dcache_page(struct page *page)
 {
-	struct mm_struct *mm = current->active_mm;
 	struct list_head *l;
-	struct vm_area_struct *anyvma = NULL;
 
 	flush_kernel_dcache_page(page_address(page));
 
@@ -265,31 +263,10 @@
 		if (!translation_exists(mpnt, addr))
 			continue;
 
-		anyvma = mpnt;
-
-		/*
-		 * We try first to find a page in our current user process
-		 */
-		if (mpnt->vm_mm != mm)
-			continue;
-
-
 		__flush_cache_page(mpnt, addr);
 
-		/* All user shared mappings should be equivalently mapped,
-		 * so once we've flushed one we should be ok
-		 */
-		goto flush_unshared;
+		break;
 	}
-
-	/* OK, shared page but not in our current process' address space */
-	if (anyvma) {
-		unsigned long addr = anyvma->vm_start
-			+ ((page->index - anyvma->vm_pgoff) << PAGE_SHIFT);
-		__flush_cache_page(anyvma, addr);
-	}
-
- flush_unshared:
 
 	/* Private mappings will not have congruent addresses, so we
 	 * have to flush each of them individually to make the change
