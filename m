Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i41GD5a11809; Sat, 1 May 2004 12:13:05 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040501160556.D07DC4945CA@palinux.hppa>
References: <20040501160556.D07DC4945CA@palinux.hppa>
Content-Type: text/plain
Date: 01 May 2004 11:13:04 -0500
Message-Id: <1083427986.2030.25.camel@mulgrave>
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

On Sat, 2004-05-01 at 11:05, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/05/01 10:05:56
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: asm-offsets.c head.S head64.S init_task.c 
> 	arch/parisc/mm : init.c 
> 	include/asm-parisc: pgtable.h 
> 
> Log message:
> More magic number elimination
> 
> Also break the assumption that sizeof(unsigned long)  == sizeof(pte_t)

Index: arch/parisc/kernel/asm-offsets.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/asm-offsets.c,v
retrieving revision 1.5
diff -u -r1.5 asm-offsets.c
--- a/arch/parisc/kernel/asm-offsets.c	30 Apr 2004 16:20:36 -0000	1.5
+++ b/arch/parisc/kernel/asm-offsets.c	1 May 2004 15:11:57 -0000
@@ -283,6 +283,10 @@
 	DEFINE(ASM_BITS_PER_PMD, BITS_PER_PMD);
 	DEFINE(ASM_BITS_PER_PTE, BITS_PER_PTE);
 	DEFINE(ASM_PMD_ENTRY, ((__PAGE_OFFSET & PMD_MASK) >> PMD_SHIFT));
+	DEFINE(ASM_PGD_ENTRY, __PAGE_OFFSET >> PGDIR_SHIFT);
+	DEFINE(ASM_PGD_ENTRY_SIZE, PGD_ENTRY_SIZE);
+	DEFINE(ASM_PMD_ENTRY_SIZE, PMD_ENTRY_SIZE);
+	DEFINE(ASM_PTE_ENTRY_SIZE, PTE_ENTRY_SIZE);
 	BLANK();
 	return 0;
 }
Index: arch/parisc/kernel/head.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head.S,v
retrieving revision 1.4
diff -u -r1.4 head.S
--- a/arch/parisc/kernel/head.S	25 Apr 2004 14:50:51 -0000	1.4
+++ b/arch/parisc/kernel/head.S	1 May 2004 15:11:58 -0000
@@ -83,12 +83,12 @@
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-	stw             %r3,((__PAGE_OFFSET>>PGDIR_SHIFT)*4)(%r4)
+	stw             %r3,ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4)
 	ldo		0x1000(%r3),%r3
-	stw             %r3,(((__PAGE_OFFSET>>PGDIR_SHIFT) + 1)*4)(%r4)
+	stw             %r3,(ASM_PGD_ENTRY + 1)*ASM_PGD_ENTRY_SIZE(%r4)
 	ldo		_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
 $pgt_fill_loop:
-	stwm		%r3,4(%r1)
+	stwm		%r3,ASM_PTE_ENTRY_SIZE(%r1)
 	ldo		0x1000(%r3),%r3
 	bb,>=		%r3,8,$pgt_fill_loop
 	nop
Index: arch/parisc/kernel/head64.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/head64.S,v
retrieving revision 1.5
diff -u -r1.5 head64.S
--- a/arch/parisc/kernel/head64.S	25 Apr 2004 14:50:51 -0000	1.5
+++ b/arch/parisc/kernel/head64.S	1 May 2004 15:11:58 -0000
@@ -88,20 +88,20 @@
 	mtctl		%r4,%cr24	/* Initialize kernel root pointer */
 	mtctl		%r4,%cr25	/* Initialize user root pointer */
 
-	std             %r3,((__PAGE_OFFSET >> PGDIR_SHIFT)*8)(%r4)
+	std             %r3,ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4)
 
 	ldo		_PAGE_TABLE(%r1),%r3
-	std             %r3,(ASM_PMD_ENTRY * 8) (%r5)
+	std             %r3,(ASM_PMD_ENTRY * ASM_PMD_ENTRY_SIZE) (%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,((ASM_PMD_ENTRY + 1)*8)(%r5)
+	std             %r3,((ASM_PMD_ENTRY + 1)*ASM_PMD_ENTRY_SIZE)(%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,((ASM_PMD_ENTRY + 2)*8)(%r5)
+	std             %r3,((ASM_PMD_ENTRY + 2)*ASM_PMD_ENTRY_SIZE)(%r5)
 	ldo		0x1000(%r3),%r3
-	std             %r3,((ASM_PMD_ENTRY + 3)*8)(%r5)
+	std             %r3,((ASM_PMD_ENTRY + 3)*ASM_PMD_ENTRY_SIZE)(%r5)
 
 	ldo		_PAGE_KERNEL(%r0),%r3 /* Hardwired 0 phys addr start */
 $pgt_fill_loop:
-	std,ma		%r3,8(%r1)
+	std,ma		%r3,ASM_PTE_ENTRY_SIZE(%r1)
 	ldo		0x1000(%r3),%r3
 	bb,>=		%r3,8,$pgt_fill_loop
 	nop
Index: arch/parisc/kernel/init_task.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/init_task.c,v
retrieving revision 1.4
diff -u -r1.4 init_task.c
--- a/arch/parisc/kernel/init_task.c	30 Apr 2004 16:20:36 -0000	1.4
+++ b/arch/parisc/kernel/init_task.c	1 May 2004 15:11:58 -0000
@@ -54,9 +54,9 @@
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((aligned(PAGE_SIZE<<PGD_ORDER))) = { {0}, };
 #ifdef __LP64__
-unsigned long pmd0[PTRS_PER_PMD] __attribute__ ((aligned(4096))) = { 0, };
+pmd_t pmd0[PTRS_PER_PMD] __attribute__ ((aligned(4096))) = { {0}, };
 #endif
-unsigned long pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((aligned(4096))) = { 0, };
+pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((aligned(4096))) = { {0}, };
 
 /*
  * Initial task structure.
Index: arch/parisc/mm/init.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/init.c,v
retrieving revision 1.4
diff -u -r1.4 init.c
--- a/arch/parisc/mm/init.c	25 Apr 2004 14:50:51 -0000	1.4
+++ b/arch/parisc/mm/init.c	1 May 2004 15:11:59 -0000
@@ -550,7 +550,7 @@
 		 */
 
 		if (!pmd) {
-			pmd = (pmd_t *) alloc_bootmem_low_pages_node(NODE_DATA(0),PAGE_SIZE);
+			pmd = (pmd_t *) alloc_bootmem_low_pages_node(NODE_DATA(0),PAGE_SIZE << PMD_ORDER);
 			pmd = (pmd_t *) __pa(pmd);
 		}
 
Index: include/asm-parisc/pgtable.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgtable.h,v
retrieving revision 1.6
diff -u -r1.6 pgtable.h
--- a/include/asm-parisc/pgtable.h	30 Apr 2004 16:20:36 -0000	1.6
+++ b/include/asm-parisc/pgtable.h	1 May 2004 15:12:18 -0000
@@ -225,7 +225,7 @@
 
 /* initial page tables for 0-8MB for kernel */
 
-extern unsigned long pg0[];
+extern pte_t pg0[];
 
 /* zero page used for uninitialized stuff */
 
