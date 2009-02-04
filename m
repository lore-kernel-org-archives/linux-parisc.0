From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: allow to build with 16k default kernel page size
Date: Thu, 05 Feb 2009 00:06:00 +0100
Message-ID: <498A1F58.60701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Introduce new convert_for_tlb_insert20 macro and use it to replace assembler
statements with hardcoded constants.
This change allows the parisc64 kernel to boot with 16kb default kernel page size, 
aka CONFIG_PARISC_PAGE_SIZE_16KB=y.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 0f7ff93..4e9dd15 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -505,6 +505,18 @@
 	STREG		\pte,0(\ptep)
 	.endm
 
+	/* bitshift difference between a PFN (based on kernel's PAGE_SIZE)
+	 * to a CPU TLB 4k PFN (4k => 12 bits to shift) */
+	#define PAGE_ADD_SHIFT  (PAGE_SHIFT-12)
+
+	/* Drop prot bits and convert to page addr for iitlbt and idtlbt */
+	.macro		convert_for_tlb_insert20 pte
+	extrd,u		\pte,(63-ASM_PFN_PTE_SHIFT)+(63-58)+PAGE_ADD_SHIFT,\
+				64-PAGE_SHIFT-PAGE_ADD_SHIFT,\pte
+	depdi		_PAGE_SIZE_ENCODING_DEFAULT,63,\
+				(63-58)+PAGE_ADD_SHIFT,\pte
+	.endm
+
 	/* Convert the pte and prot to tlb insertion values.  How
 	 * this happens is quite subtle, read below */
 	.macro		make_insert_tlb	spc,pte,prot
@@ -544,8 +556,7 @@
 	depi		1,12,1,\prot
 
 	/* Drop prot bits and convert to page addr for iitlbt and idtlbt */
-	extrd,u		\pte,(63-ASM_PFN_PTE_SHIFT)+(63-58),64-PAGE_SHIFT,\pte
-	depdi		_PAGE_SIZE_ENCODING_DEFAULT,63,63-58,\pte
+	convert_for_tlb_insert20 \pte
 	.endm
 
 	/* Identical macro to make_insert_tlb above, except it
@@ -1244,10 +1255,9 @@ nadtlb_check_flush_20w:
 	depdi,z         7,7,3,prot
 	depdi           1,10,1,prot
 
-	/* Get rid of prot bits and convert to page addr for idtlbt */
+	/* Drop prot bits from pte and convert to page addr for idtlbt */
+	convert_for_tlb_insert20 pte
 
-	depdi		0,63,12,pte
-	extrd,u         pte,56,52,pte
 	idtlbt          pte,prot
 
 	rfir
@@ -1403,10 +1413,9 @@ nadtlb_check_flush_20:
 	depdi,z         7,7,3,prot
 	depdi           1,10,1,prot
 
-	/* Get rid of prot bits and convert to page addr for idtlbt */
+	/* Drop prot bits from pte and convert to page addr for idtlbt */
+	convert_for_tlb_insert20 pte
 
-	depdi		0,63,12,pte
-	extrd,u         pte,56,32,pte
 	idtlbt          pte,prot
 
 	rfir
