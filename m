Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h2S5om326927;
	Fri, 28 Mar 2003 00:50:48 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
In-Reply-To: <20030328054702.40ADD4829@dsl2.external.hp.com>
References: <20030328054702.40ADD4829@dsl2.external.hp.com>
Content-Type: text/plain
Date: 27 Mar 2003 23:50:47 -0600
Message-Id: <1048830648.1789.351.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 jejb
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, 2003-03-27 at 23:47, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.5
> Changes by:	jejb	03/03/27 22:47:02
> 
> Modified files:
> 	include/asm-parisc: pgtable.h 
> 
> Log message:
> Add support for file-offsets-in-pte's
> 
> See http://mail.nl.linux.org/linux-mm/2003-03/msg00174.html

===== include/asm-parisc/pgtable.h 1.11 vs edited =====
--- 1.11/include/asm-parisc/pgtable.h	Thu Mar  6 10:19:09 2003
+++ edited/include/asm-parisc/pgtable.h	Thu Mar 27 21:42:26 2003
@@ -122,6 +122,7 @@
 #define _PAGE_GATEWAY_BIT  28   /* (0x008) privilege promotion allowed */
 #define _PAGE_DMB_BIT      27   /* (0x010) Data Memory Break enable (B bit) */
 #define _PAGE_DIRTY_BIT    26   /* (0x020) Page Dirty (D bit) */
+#define _PAGE_FILE_BIT	_PAGE_DIRTY_BIT	/* overload this bit */
 #define _PAGE_REFTRAP_BIT  25   /* (0x040) Page Ref. Trap enable (T bit) */
 #define _PAGE_NO_CACHE_BIT 24   /* (0x080) Uncached Page (U bit) */
 #define _PAGE_ACCESSED_BIT 23   /* (0x100) Software: Page Accessed */
@@ -135,6 +136,17 @@
 
 #define xlate_pabit(x) (31 - x)
 
+/* this defines the shift to the usable bits in the PTE it is set so
+ * that the valid bits _PAGE_PRESENT_BIT and _PAGE_USER_BIT are set
+ * to zero */
+#define PTE_SHIFT	   	xlate_pabit(_PAGE_USER_BIT)
+
+/* this is how many bits may be used by the file functions */
+#define PTE_FILE_MAX_BITS	(BITS_PER_LONG - PTE_SHIFT)
+
+#define pte_to_pgoff(pte) (pte_val(pte) >> PTE_SHIFT)
+#define pgoff_to_pte(off) ((pte_t) { ((off) << PTE_SHIFT) | _PAGE_FILE })
+
 #define _PAGE_READ     (1 << xlate_pabit(_PAGE_READ_BIT))
 #define _PAGE_WRITE    (1 << xlate_pabit(_PAGE_WRITE_BIT))
 #define _PAGE_RW       (_PAGE_READ | _PAGE_WRITE)
@@ -148,6 +160,7 @@
 #define _PAGE_PRESENT  (1 << xlate_pabit(_PAGE_PRESENT_BIT))
 #define _PAGE_FLUSH    (1 << xlate_pabit(_PAGE_FLUSH_BIT))
 #define _PAGE_USER     (1 << xlate_pabit(_PAGE_USER_BIT))
+#define _PAGE_FILE     (1 << xlate_pabit(_PAGE_FILE_BIT))
 
 #define _PAGE_TABLE	(_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE |  _PAGE_DIRTY | _PAGE_ACCESSED)
 #define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY)
@@ -256,6 +269,7 @@
 extern inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
 extern inline int pte_young(pte_t pte)		{ return pte_val(pte) & _PAGE_ACCESSED; }
 extern inline int pte_write(pte_t pte)		{ return pte_val(pte) & _PAGE_WRITE; }
+extern inline int pte_file(pte_t pte)		{ return pte_val(pte) & _PAGE_FILE; }
 
 extern inline pte_t pte_rdprotect(pte_t pte)	{ pte_val(pte) &= ~_PAGE_READ; return pte; }
 extern inline pte_t pte_mkclean(pte_t pte)	{ pte_val(pte) &= ~_PAGE_DIRTY; return pte; }
