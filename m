Return-Path: <kyle@mcmartin.ca>
Received: from mcmartin.ca
	(CPE0030ab0b413b-CM023469906297.cpe.net.cable.rogers.com
	[24.157.3.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A62D487D
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  3 May 2004 14:44:05 -0600 (MDT)
Date: Sun, 2 May 2004 12:16:33 -0400
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040502161633.GC26697@mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: kyle@mcmartin.ca (Kyle McMartin)
Subject: [parisc-linux] undefined types in page.h
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

willy,

With cvs head, unless the following patch is applied, the compile bombs
out in at least fs/xfs/support/debug.c, as that file uses __u32 in
several places without having included types.h.

Please apply,

Index: include/asm-parisc/page.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/page.h,v
retrieving revision 1.6
diff -u -r1.6 page.h
--- a/include/asm-parisc/page.h	1 May 2004 20:03:11 -0000	1.6
+++ b/include/asm-parisc/page.h	2 May 2004 16:05:11 -0000
@@ -11,6 +11,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/cache.h>
+#include <asm/types.h>
 
 #define clear_page(page)	memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(to,from)      copy_user_page_asm((void *)(to), (void *)(from))

Regards,
-- 
Kyle McMartin
