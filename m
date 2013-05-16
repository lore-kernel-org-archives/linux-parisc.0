From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use PAGE_SHIFT instead of hardcoded value 12 in
 pacache.S
Date: Thu, 16 May 2013 22:51:41 +0200
Message-ID: <20130516205141.GA1127@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

additionally clean up some whitespaces & tabs.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 5e1de60..36d7f40 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -605,14 +605,14 @@ ENTRY(copy_user_page_asm)
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert format */
 	convert_phys_for_tlb_insert20 %r23	/* convert phys addr to tlb insert format */
 	depd		%r24,63,22, %r28	/* Form aliased virtual address 'to' */
-	depdi		0, 63,PAGE_SHIFT, %r28  /* Clear any offset bits */
+	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 	copy		%r28, %r29
 	depdi		1, 41,1, %r29		/* Form aliased virtual address 'from' */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	extrw,u		%r23, 24,25, %r23	/* convert phys addr to tlb insert format */
 	depw		%r24, 31,22, %r28	/* Form aliased virtual address 'to' */
-	depwi		0, 31,12, %r28		/* Clear any offset bits */
+	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 	copy		%r28, %r29
 	depwi		1, 9,1, %r29		/* Form aliased virtual address 'from' */
 #endif
@@ -762,7 +762,7 @@ ENTRY(clear_user_page_asm)
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
-	depwi		0, 31,12, %r28		/* Clear any offset bits */
+	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
 	/* Purge any old translation */
@@ -846,7 +846,7 @@ ENTRY(flush_dcache_page_asm)
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
-	depwi		0, 31,12, %r28		/* Clear any offset bits */
+	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
 	/* Purge any old translation */
@@ -918,11 +918,11 @@ ENTRY(flush_icache_page_asm)
 #endif
 	convert_phys_for_tlb_insert20 %r26	/* convert phys addr to tlb insert format */
 	depd		%r25, 63,22, %r28	/* Form aliased virtual address 'to' */
-	depdi		0, 63,PAGE_SHIFT, %r28  /* Clear any offset bits */
+	depdi		0, 63,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #else
 	extrw,u		%r26, 24,25, %r26	/* convert phys addr to tlb insert format */
 	depw		%r25, 31,22, %r28	/* Form aliased virtual address 'to' */
-	depwi		0, 31,12, %r28		/* Clear any offset bits */
+	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
 	/* Purge any old translation */
