Return-Path: <SRS0=FW0n=SM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BF4C10F11
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 17:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B4012077C
	for <linux-parisc@archiver.kernel.org>; Wed, 10 Apr 2019 17:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="IaLv0ptL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbfDJRj2 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 10 Apr 2019 13:39:28 -0400
Received: from mout.gmx.net ([212.227.15.19]:48845 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729786AbfDJRj1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 Apr 2019 13:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554917954;
        bh=A2fwi56bMSE++A5xrVndQchVmEte4jLhCrtz7DPcoQQ=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=IaLv0ptLOTYFBfgVjz1WqaPEllmDjEY6HT+F5Hu6OO6nYhaiNHKjITo/tszBNk9Zx
         47ncHWIhA19hm9UKiEuELSAr88qVhQZkR9Iu0FDSIAX73KKePB1Am074QAoqAU93V/
         467nUFIKxMQYD199pVtuhp2cZwWc+UVaHzvXJGy4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.148.203]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M3AzH-1gvVor1UYR-00szOO; Wed, 10 Apr 2019 19:39:14 +0200
Date:   Wed, 10 Apr 2019 19:39:11 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        Mikulas Patocka <mpatocka@redhat.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Mel Gorman <mgorman@techsingularity.net>
Subject: [PATCH] parisc: Switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190410173911.GA11288@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:WauNiF6BctKyAFv0oV03Ye8EOrbHMQnvdjV9lDBHAd+ICCivZha
 GLuwYBglRBo+F8mBVuaWJ5uTjf8KROIcvcLutvEXhlRdBZlrDmc3zKxw5rXGX3Kk8Muh6cQ
 d+O//Cpv/ukk8VanrCe8FbDU+Y2l41FEVpkhYdGsMWiPdMDq2LVpC6zI25pymnHFeZGaaNd
 7cCuK0nzuQs4fCQ+dAEEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YCDwrGj7pWM=:MtKPI44S/QBCXOBFfxsVt7
 +wdRYmlZwhmqRxq0Cf0GolcrXHkZsrdnKLAiB9FHUnwdWFY/bx6ZZQVlizjXIPAm73UMv3AAD
 WkIXPp3dUZFBPRVyaGT2KS0KW2s99HtxFmVAItWCHFcFUo5bG8bYATLF66qE2x2KklsOLJQJ8
 6QCiqlHHo3IQjrBjGZUfpBrFmsPbeLzL8sNXaw+zN8IX+ZaK5aNPXPuRgHY7jE+q3Qn4ysnEv
 6BUUh0og8897qsNWx+oMIRotPbvjXESaE19tdr8OJH6CpH0q2nCmQ8I47OJhqNFSkkUw0rck4
 zRP5l5RijhJeNpUq3XhAKn4pgLVU3lKAsuwZtf2r506NSxHGpT6Iqc6Ln8ZsLNXCPdEQAKBIt
 Ki2nj+NZtz9yhgW+CU4AonTDMpBnmzkQjQHHAaumAWGcr+if+BmkQaBhXetr9Ae9CX3vD8pPH
 DDcYh/eBNk85W3VwDVBzQH/eU39ZItux5PoHC681iOyyjIux41gRINMVXLmdhVsmjaPjmrJ4k
 eujdgXmbe6WlKaoYP1TWkhUTLs+RwgtuqGZJSUGlAJvBQIuwBIs+so6zXzImPbHEQQ67LCL7o
 mukPoeEIOjISkSXpxttqEr4DCOIYWjDgrM1zZKHsh0NfsBG8gQC429omVLsif/saO9HMsv3GR
 Gr466zO8oCPMDr8G+UjMOQp/ir5fu3bjeEzPtc584UhSJaBrqedGHr4cZAMF6IEdTgP2z6ib/
 U4o5LTie2u42g0iiTxZTx6+3SjYvrjA9Ohd8RFNyxUod/NA35tqSwjJZ4mCMAddYdZXXZyn/q
 zroVHJd7d7S+RHjf2dAA4FrWRmrMA+TNX+OemM1CKpkSsmb5bplXHKRHX2Xje9C+60uH7mMCC
 AhD3RCWd2o7z47aRhlMSjr1IdpGhkGwP3GldABeyB8cLyurNMjOUcdFMvMvuez
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The commit 1c30844d2dfe ("mm: reclaim small amounts of memory when an
external fragmentation event occurs") breaks memory management on a
parisc c8000 workstation with this memory layout:

	0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
	1) Start 0x0000000100000000 End 0x00000001bfdfffff Size   3070 MB
	2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB

With the patch 1c30844d2dfe, the kernel will incorrectly reclaim the
first zone when it fills up, ignoring the fact that there are two
completely free zones. Basiscally, it limits cache size to 1GiB.

The parisc kernel is currently using the DISCONTIGMEM implementation,
but isn't NUMA. Avoid this issue and strange work-arounds by switching
to the more commonly used SPARSEMEM implementation.

Reported-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 1c30844d2dfe ("mm: reclaim small amounts of memory when an external=
 fragmentation event occurs")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index c8038165b81f..26c215570adf 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -36,6 +36,7 @@ config PARISC
 	select GENERIC_STRNCPY_FROM_USER
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_EXCEPTION_TRACE
+	select ARCH_DISCARD_MEMBLOCK
 	select HAVE_MOD_ARCH_SPECIFIC
 	select VIRT_TO_BUS
 	select MODULES_USE_ELF_RELA
@@ -314,21 +315,16 @@ config ARCH_SELECT_MEMORY_MODEL
 	def_bool y
 	depends on 64BIT

-config ARCH_DISCONTIGMEM_ENABLE
+config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	depends on 64BIT

 config ARCH_FLATMEM_ENABLE
 	def_bool y

-config ARCH_DISCONTIGMEM_DEFAULT
+config ARCH_SPARSEMEM_DEFAULT
 	def_bool y
-	depends on ARCH_DISCONTIGMEM_ENABLE
-
-config NODES_SHIFT
-	int
-	default "3"
-	depends on NEED_MULTIPLE_NODES
+	depends on ARCH_SPARSEMEM_ENABLE

 source "kernel/Kconfig.hz"

diff --git a/arch/parisc/include/asm/mmzone.h b/arch/parisc/include/asm/mm=
zone.h
index fafa3893fd70..8d390406d862 100644
=2D-- a/arch/parisc/include/asm/mmzone.h
+++ b/arch/parisc/include/asm/mmzone.h
@@ -2,62 +2,6 @@
 #ifndef _PARISC_MMZONE_H
 #define _PARISC_MMZONE_H

-#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max i=
s 3) */
+#define MAX_PHYSMEM_RANGES 4 /* Fix the size for now (current known max i=
s 3) */

-#ifdef CONFIG_DISCONTIGMEM
-
-extern int npmem_ranges;
-
-struct node_map_data {
-    pg_data_t pg_data;
-};
-
-extern struct node_map_data node_data[];
-
-#define NODE_DATA(nid)          (&node_data[nid].pg_data)
-
-/* We have these possible memory map layouts:
- * Astro: 0-3.75, 67.75-68, 4-64
- * zx1: 0-1, 257-260, 4-256
- * Stretch (N-class): 0-2, 4-32, 34-xxx
- */
-
-/* Since each 1GB can only belong to one region (node), we can create
- * an index table for pfn to nid lookup; each entry in pfnnid_map
- * represents 1GB, and contains the node that the memory belongs to. */
-
-#define PFNNID_SHIFT (30 - PAGE_SHIFT)
-#define PFNNID_MAP_MAX  512     /* support 512GB */
-extern signed char pfnnid_map[PFNNID_MAP_MAX];
-
-#ifndef CONFIG_64BIT
-#define pfn_is_io(pfn) ((pfn & (0xf0000000UL >> PAGE_SHIFT)) =3D=3D (0xf0=
000000UL >> PAGE_SHIFT))
-#else
-/* io can be 0xf0f0f0f0f0xxxxxx or 0xfffffffff0000000 */
-#define pfn_is_io(pfn) ((pfn & (0xf000000000000000UL >> PAGE_SHIFT)) =3D=
=3D (0xf000000000000000UL >> PAGE_SHIFT))
-#endif
-
-static inline int pfn_to_nid(unsigned long pfn)
-{
-	unsigned int i;
-
-	if (unlikely(pfn_is_io(pfn)))
-		return 0;
-
-	i =3D pfn >> PFNNID_SHIFT;
-	BUG_ON(i >=3D ARRAY_SIZE(pfnnid_map));
-
-	return pfnnid_map[i];
-}
-
-static inline int pfn_valid(int pfn)
-{
-	int nid =3D pfn_to_nid(pfn);
-
-	if (nid >=3D 0)
-		return (pfn < node_end_pfn(nid));
-	return 0;
-}
-
-#endif
 #endif /* _PARISC_MMZONE_H */
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page=
.h
index b77f49ce6220..93caf17ac5e2 100644
=2D-- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -147,9 +147,9 @@ extern int npmem_ranges;
 #define __pa(x)			((unsigned long)(x)-PAGE_OFFSET)
 #define __va(x)			((void *)((unsigned long)(x)+PAGE_OFFSET))

-#ifndef CONFIG_DISCONTIGMEM
+#ifndef CONFIG_SPARSEMEM
 #define pfn_valid(pfn)		((pfn) < max_mapnr)
-#endif /* CONFIG_DISCONTIGMEM */
+#endif

 #ifdef CONFIG_HUGETLB_PAGE
 #define HPAGE_SHIFT		PMD_SHIFT /* fixed for transparent huge pages */
diff --git a/arch/parisc/include/asm/sparsemem.h b/arch/parisc/include/asm=
/sparsemem.h
new file mode 100644
index 000000000000..b7d1dc9f880c
=2D-- /dev/null
+++ b/arch/parisc/include/asm/sparsemem.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ASM_PARISC_SPARSEMEM_H
+#define ASM_PARISC_SPARSEMEM_H
+
+/* We have these possible memory map layouts:
+ * Astro: 0-3.75, 67.75-68, 4-64
+ * zx1: 0-1, 257-260, 4-256
+ * Stretch (N-class): 0-2, 4-32, 34-xxx
+ */
+
+#define MAX_PHYSMEM_BITS	42
+#define SECTION_SIZE_BITS	27
+
+#endif
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc=
_ksyms.c
index 7baa2265d439..174213b1716e 100644
=2D-- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -138,12 +138,6 @@ extern void $$dyncall(void);
 EXPORT_SYMBOL($$dyncall);
 #endif

-#ifdef CONFIG_DISCONTIGMEM
-#include <asm/mmzone.h>
-EXPORT_SYMBOL(node_data);
-EXPORT_SYMBOL(pfnnid_map);
-#endif
-
 #ifdef CONFIG_FUNCTION_TRACER
 extern void _mcount(void);
 EXPORT_SYMBOL(_mcount);
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index b2b52de2b82b..78e451ce0f1b 100644
=2D-- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -48,11 +48,6 @@ pmd_t pmd0[PTRS_PER_PMD] __attribute__ ((__section__ ("=
.data..vm0.pmd"), aligned
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((__section__ (".data..v=
m0.pgd"), aligned(PAGE_SIZE)));
 pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((__section__ (".data.=
.vm0.pte"), aligned(PAGE_SIZE)));

-#ifdef CONFIG_DISCONTIGMEM
-struct node_map_data node_data[MAX_NUMNODES] __read_mostly;
-signed char pfnnid_map[PFNNID_MAP_MAX] __read_mostly;
-#endif
-
 static struct resource data_resource =3D {
 	.name	=3D "Kernel data",
 	.flags	=3D IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
@@ -76,11 +71,11 @@ static struct resource sysram_resources[MAX_PHYSMEM_RA=
NGES] __read_mostly;
  * information retrieved in kernel/inventory.c.
  */

-physmem_range_t pmem_ranges[MAX_PHYSMEM_RANGES] __read_mostly;
-int npmem_ranges __read_mostly;
+physmem_range_t pmem_ranges[MAX_PHYSMEM_RANGES] __initdata;
+int npmem_ranges __initdata;

 #ifdef CONFIG_64BIT
-#define MAX_MEM         (~0UL)
+#define MAX_MEM         (1UL << MAX_PHYSMEM_BITS)
 #else /* !CONFIG_64BIT */
 #define MAX_MEM         (3584U*1024U*1024U)
 #endif /* !CONFIG_64BIT */
@@ -119,7 +114,7 @@ static void __init mem_limit_func(void)
 static void __init setup_bootmem(void)
 {
 	unsigned long mem_max;
-#ifndef CONFIG_DISCONTIGMEM
+#ifndef CONFIG_SPARSEMEM
 	physmem_range_t pmem_holes[MAX_PHYSMEM_RANGES - 1];
 	int npmem_holes;
 #endif
@@ -137,23 +132,20 @@ static void __init setup_bootmem(void)
 		int j;

 		for (j =3D i; j > 0; j--) {
-			unsigned long tmp;
+			physmem_range_t tmp;

 			if (pmem_ranges[j-1].start_pfn <
 			    pmem_ranges[j].start_pfn) {

 				break;
 			}
-			tmp =3D pmem_ranges[j-1].start_pfn;
-			pmem_ranges[j-1].start_pfn =3D pmem_ranges[j].start_pfn;
-			pmem_ranges[j].start_pfn =3D tmp;
-			tmp =3D pmem_ranges[j-1].pages;
-			pmem_ranges[j-1].pages =3D pmem_ranges[j].pages;
-			pmem_ranges[j].pages =3D tmp;
+			tmp =3D pmem_ranges[j-1];
+			pmem_ranges[j-1] =3D pmem_ranges[j];
+			pmem_ranges[j] =3D tmp;
 		}
 	}

-#ifndef CONFIG_DISCONTIGMEM
+#ifndef CONFIG_SPARSEMEM
 	/*
 	 * Throw out ranges that are too far apart (controlled by
 	 * MAX_GAP).
@@ -165,7 +157,7 @@ static void __init setup_bootmem(void)
 			 pmem_ranges[i-1].pages) > MAX_GAP) {
 			npmem_ranges =3D i;
 			printk("Large gap in memory detected (%ld pages). "
-			       "Consider turning on CONFIG_DISCONTIGMEM\n",
+			       "Consider turning on CONFIG_SPARSEMEM\n",
 			       pmem_ranges[i].start_pfn -
 			       (pmem_ranges[i-1].start_pfn +
 			        pmem_ranges[i-1].pages));
@@ -230,9 +222,8 @@ static void __init setup_bootmem(void)

 	printk(KERN_INFO "Total Memory: %ld MB\n",mem_max >> 20);

-#ifndef CONFIG_DISCONTIGMEM
+#ifndef CONFIG_SPARSEMEM
 	/* Merge the ranges, keeping track of the holes */
-
 	{
 		unsigned long end_pfn;
 		unsigned long hole_pages;
@@ -255,18 +246,6 @@ static void __init setup_bootmem(void)
 	}
 #endif

-#ifdef CONFIG_DISCONTIGMEM
-	for (i =3D 0; i < MAX_PHYSMEM_RANGES; i++) {
-		memset(NODE_DATA(i), 0, sizeof(pg_data_t));
-	}
-	memset(pfnnid_map, 0xff, sizeof(pfnnid_map));
-
-	for (i =3D 0; i < npmem_ranges; i++) {
-		node_set_state(i, N_NORMAL_MEMORY);
-		node_set_online(i);
-	}
-#endif
-
 	/*
 	 * Initialize and free the full range of memory in each range.
 	 */
@@ -314,7 +293,7 @@ static void __init setup_bootmem(void)
 	memblock_reserve(__pa(KERNEL_BINARY_TEXT_START),
 			(unsigned long)(_end - KERNEL_BINARY_TEXT_START));

-#ifndef CONFIG_DISCONTIGMEM
+#ifndef CONFIG_SPARSEMEM

 	/* reserve the holes */

@@ -360,6 +339,9 @@ static void __init setup_bootmem(void)

 	/* Initialize Page Deallocation Table (PDT) and check for bad memory. */
 	pdc_pdt_init();
+
+	memblock_allow_resize();
+	memblock_dump_all();
 }

 static int __init parisc_text_address(unsigned long vaddr)
@@ -713,37 +695,46 @@ static void __init gateway_init(void)
 		  PAGE_SIZE, PAGE_GATEWAY, 1);
 }

-void __init paging_init(void)
+static void __init parisc_bootmem_free(void)
 {
+	unsigned long zones_size[MAX_NR_ZONES] =3D { 0, };
+	unsigned long holes_size[MAX_NR_ZONES] =3D { 0, };
+	unsigned long mem_start_pfn =3D ~0UL, mem_end_pfn =3D 0, mem_size_pfn =
=3D 0;
 	int i;

+	for (i =3D 0; i < npmem_ranges; i++) {
+		unsigned long start =3D pmem_ranges[i].start_pfn;
+		unsigned long size =3D pmem_ranges[i].pages;
+		unsigned long end =3D start + size;
+
+		if (mem_start_pfn > start)
+			mem_start_pfn =3D start;
+		if (mem_end_pfn < end)
+			mem_end_pfn =3D end;
+		mem_size_pfn +=3D size;
+	}
+
+	zones_size[0] =3D mem_end_pfn - mem_start_pfn;
+	holes_size[0] =3D zones_size[0] - mem_size_pfn;
+
+	free_area_init_node(0, zones_size, mem_start_pfn, holes_size);
+}
+
+void __init paging_init(void)
+{
 	setup_bootmem();
 	pagetable_init();
 	gateway_init();
 	flush_cache_all_local(); /* start with known state */
 	flush_tlb_all_local(NULL);

-	for (i =3D 0; i < npmem_ranges; i++) {
-		unsigned long zones_size[MAX_NR_ZONES] =3D { 0, };
-
-		zones_size[ZONE_NORMAL] =3D pmem_ranges[i].pages;
-
-#ifdef CONFIG_DISCONTIGMEM
-		/* Need to initialize the pfnnid_map before we can initialize
-		   the zone */
-		{
-		    int j;
-		    for (j =3D (pmem_ranges[i].start_pfn >> PFNNID_SHIFT);
-			 j <=3D ((pmem_ranges[i].start_pfn + pmem_ranges[i].pages) >> PFNNID_S=
HIFT);
-			 j++) {
-			pfnnid_map[j] =3D i;
-		    }
-		}
-#endif
-
-		free_area_init_node(i, zones_size,
-				pmem_ranges[i].start_pfn, NULL);
-	}
+	/*
+	 * Mark all memblocks as present for sparsemem using
+	 * memory_present() and then initialize sparsemem.
+	 */
+	memblocks_present();
+	sparse_init();
+	parisc_bootmem_free();
 }

 #ifdef CONFIG_PA20
