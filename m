Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i45Koia19893; Wed, 5 May 2004 16:50:44 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040505204811.27F0C4945E4@palinux.hppa>
References: <20040505204811.27F0C4945E4@palinux.hppa>
Content-Type: text/plain
Date: 05 May 2004 15:50:43 -0500
Message-Id: <1083790244.2201.462.camel@mulgrave>
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

On Wed, 2004-05-05 at 15:48, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/05/05 14:48:11
> 
> Modified files:
> 	.              : Makefile 
> 	include/asm-parisc: page.h pgtable.h 
> 
> Log message:
> Move to 8 byte Page Table Entries for 32 bit kernels.  This allows us
> to recover sixteen flag bits (the sixteen bits at the top of the pte for
> 64 bit - 48 address bits is pretty unlikely to be hit soon) on both 32
> and 64 bits.

===== include/asm-parisc/page.h 1.10 vs edited =====
--- 1.10/include/asm-parisc/page.h	Mon May  3 14:40:20 2004
+++ edited/include/asm-parisc/page.h	Wed May  5 10:12:19 2004
@@ -40,7 +40,14 @@
 /*
  * These are used to make use of C type-checking..
  */
+#ifdef __LP64__
 typedef struct { unsigned long pte; } pte_t;
+#else
+typedef struct {
+	unsigned long pte;
+	unsigned long flags;
+} pte_t;
+#endif
 /* NOTE: even on 64 bits, these entries are __u32 because we allocate
  * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
 typedef struct { __u32 pmd; } pmd_t;
@@ -48,6 +55,11 @@
 typedef struct { unsigned long pgprot; } pgprot_t;
 
 #define pte_val(x)	((x).pte)
+#ifdef __LP64__
+#define pte_flags(x)	#error
+#else
+#define pte_flags(x)	((x).flags)
+#endif
 #define pmd_val(x)	((x).pmd)
 #define pgd_val(x)	((x).pgd)
 #define pgprot_val(x)	((x).pgprot)
@@ -95,7 +107,7 @@
 #define BITS_PER_PMD_ENTRY	2
 #define BITS_PER_PGD_ENTRY	2
 #else
-#define BITS_PER_PTE_ENTRY	2
+#define BITS_PER_PTE_ENTRY	3
 #define BITS_PER_PMD_ENTRY	2
 #define BITS_PER_PGD_ENTRY	BITS_PER_PMD_ENTRY
 #endif
===== include/asm-parisc/pgtable.h 1.21 vs edited =====
--- 1.21/include/asm-parisc/pgtable.h	Sun May  2 05:20:20 2004
+++ edited/include/asm-parisc/pgtable.h	Wed May  5 12:13:18 2004
@@ -70,8 +70,8 @@
 #define PGD_ALLOC_ORDER	2 /* first pgd contains pmd */
 #else
 #define PT_NLEVELS	2
-#define PT_INITIAL	2 /* Number of initial page tables */
-#define PGD_ORDER	0 /* Number of pages per pgd */
+#define PT_INITIAL	4 /* Number of initial page tables */
+#define PGD_ORDER	1 /* Number of pages per pgd */
 #define PGD_ALLOC_ORDER	PGD_ORDER
 #endif
 
