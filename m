Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3EHrNa10677; Wed, 14 Apr 2004 13:53:23 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040414174535.81173494194@palinux.hppa>
References: <20040414174535.81173494194@palinux.hppa>
Content-Type: text/plain
Date: 14 Apr 2004 12:53:23 -0500
Message-Id: <1081965204.1804.96.camel@mulgrave>
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

On Wed, 2004-04-14 at 12:45, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/14 11:45:35
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: cache.c sys_parisc.c 
> 
> Log message:
> Make all shared mappings and all file mappings (including MAP_PRIVATE)
> equivalently mapped.
> 
> This allows us only to flush a single space again in flush_dcache_page().
> 
> The flip side is that now all shared libraries are going to be mapped
> on 4MB boundaries.  This only wastes virtual space, but it may run us
> out of mappings faster than would otherwise happen in ILP32 processes.

Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.9
diff -u -r1.9 cache.c
--- a/arch/parisc/kernel/cache.c	12 Apr 2004 15:48:00 -0000	1.9
+++ b/arch/parisc/kernel/cache.c	14 Apr 2004 17:42:54 -0000
@@ -265,12 +265,16 @@
 
 		__flush_cache_page(mpnt, addr);
 
-		break;
+		/* If we find an address to flush, that will also
+		 * bring all the private mappings up to date (see
+		 * comment below) */
+		return;
 	}
 
-	/* Private mappings will not have congruent addresses, so we
-	 * have to flush each of them individually to make the change
-	 * in the kernel page visible */
+	/* we have carefully arranged in arch_get_unmapped_area() that
+	 * *any* mappings of a file are always congruently mapped (whether
+	 * declared as MAP_PRIVATE or MAP_SHARED), so we only need
+	 * to flush one address here too */
 	list_for_each(l, &page->mapping->i_mmap) {
 		struct vm_area_struct *mpnt;
 		unsigned long off, addr;
@@ -293,6 +297,8 @@
 			continue;
 
 		__flush_cache_page(mpnt, addr);
+
+		return;
 	}
 }
 EXPORT_SYMBOL(__flush_dcache_page);
Index: arch/parisc/kernel/sys_parisc.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/sys_parisc.c,v
retrieving revision 1.21
diff -u -r1.21 sys_parisc.c
--- a/arch/parisc/kernel/sys_parisc.c	16 Mar 2004 15:39:55 -0000	1.21
+++ b/arch/parisc/kernel/sys_parisc.c	14 Apr 2004 17:42:54 -0000
@@ -93,7 +93,7 @@
 		unsigned long addr, unsigned long len, unsigned long pgoff)
 {
 	struct vm_area_struct *vma;
-	int offset = get_offset(mapping);
+	int offset = mapping ? get_offset(mapping) : 0;
 
 	addr = DCACHE_ALIGN(addr - offset) + offset;
 
@@ -117,8 +117,10 @@
 	if (!addr)
 		addr = TASK_UNMAPPED_BASE;
 
-	if (filp && (flags & MAP_SHARED)) {
+	if (filp) {
 		addr = get_shared_area(filp->f_mapping, addr, len, pgoff);
+	} else if(flags & MAP_SHARED) {
+		addr = get_shared_area(NULL, addr, len, pgoff);
 	} else {
 		addr = get_unshared_area(addr, len);
 	}
