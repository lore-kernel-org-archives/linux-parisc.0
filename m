From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use constants instead of numbers in assembly
Date: Sun, 18 Jan 2009 19:30:18 +0100
Message-ID: <4973753A.3000707@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

A few small fixups:
* _PAGE_SIZE_ENCODING_DEFAULT is wrong here, as one might assume that
  it's possible to define the page size that way. This is wrong. Use 0 instead.
* use constants instead of hardcoded numerical values in depi and extru
  while building the PFN out of the pte entry
* use SHRREG instead of extru (iitlba expects the PFN at bits {7..26})

Still wondering why we can use the same register (pte) as extru source
and target register, but it seems to work on PA1.1 and PA2.0...

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index d1fa4ed..19d5749 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -563,8 +563,8 @@
 
 	/* Get rid of prot bits and convert to page addr for iitlba */
 
-	depi		_PAGE_SIZE_ENCODING_DEFAULT,31,ASM_PFN_PTE_SHIFT,\pte
-	extru		\pte,24,25,\pte
+	depi		0,31,ASM_PFN_PTE_SHIFT,\pte
+	SHRREG		\pte,(ASM_PFN_PTE_SHIFT-(31-26)),\pte
 	.endm
 
 	/* This is for ILP32 PA2.0 only.  The TLB insertion needs
@@ -1337,8 +1337,8 @@ nadtlb_check_flush_11:
 
 	/* Get rid of prot bits and convert to page addr for idtlba */
 
-	depi		0,31,12,pte
-	extru		pte,24,25,pte
+	depi		0,31,ASM_PFN_PTE_SHIFT,pte
+	SHRREG		pte,(ASM_PFN_PTE_SHIFT-(31-26)),pte
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
