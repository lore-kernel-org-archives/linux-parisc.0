From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Also flush data TLB in flush_icache_page_asm
Date: Thu, 24 Nov 2016 20:18:14 -0500
Message-ID: <7B459DF1-93C2-4717-A365-BCAFBF37557E@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-29--781679002
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-29--781679002
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

This is the second issue I noticed in reviewing the parisc TLB code.

The fic instruction may use either the instruction or data TLB in =
flushing the instruction cache.  Thus,
on machines with a split TLB, we should also flush the data TLB after =
setting up the temporary alias
registers.

Although this has no functional impact, I changed the pdtlb and pitlb =
instructions to consistently use
the index register %r0.  These instructions do not support integer =
displacements.

Tested on rp3440 and c8000.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>


--Apple-Mail-29--781679002
Content-Disposition: attachment;
	filename=pacache.S.d.txt
Content-Type: text/plain;
	name="pacache.S.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index b743a80..fe0b034 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -96,7 +96,7 @@ fitmanyloop:					/* Loop if LOOP >= 2 */
 
 fitmanymiddle:					/* Loop if LOOP >= 2 */
 	addib,COND(>)		-1, %r31, fitmanymiddle	/* Adjusted inner loop decr */
-	pitlbe		0(%sr1, %r28)
+	pitlbe		%r0(%sr1, %r28)
 	pitlbe,m	%arg1(%sr1, %r28)	/* Last pitlbe and addr adjust */
 	addib,COND(>)		-1, %r29, fitmanymiddle	/* Middle loop decr */
 	copy		%arg3, %r31		/* Re-init inner loop count */
@@ -139,7 +139,7 @@ fdtmanyloop:					/* Loop if LOOP >= 2 */
 
 fdtmanymiddle:					/* Loop if LOOP >= 2 */
 	addib,COND(>)		-1, %r31, fdtmanymiddle	/* Adjusted inner loop decr */
-	pdtlbe		0(%sr1, %r28)
+	pdtlbe		%r0(%sr1, %r28)
 	pdtlbe,m	%arg1(%sr1, %r28)	/* Last pdtlbe and addr adjust */
 	addib,COND(>)		-1, %r29, fdtmanymiddle	/* Middle loop decr */
 	copy		%arg3, %r31		/* Re-init inner loop count */
@@ -620,12 +626,12 @@ ENTRY(copy_user_page_asm)
 	/* Purge any old translations */
 
 #ifdef CONFIG_PA20
-	pdtlb,l		0(%r28)
-	pdtlb,l		0(%r29)
+	pdtlb,l		%r0(%r28)
+	pdtlb,l		%r0(%r29)
 #else
 	tlb_lock	%r20,%r21,%r22
-	pdtlb		0(%r28)
-	pdtlb		0(%r29)
+	pdtlb		%r0(%r28)
+	pdtlb		%r0(%r29)
 	tlb_unlock	%r20,%r21,%r22
 #endif
 
@@ -768,10 +774,10 @@ ENTRY(clear_user_page_asm)
 	/* Purge any old translation */
 
 #ifdef CONFIG_PA20
-	pdtlb,l		0(%r28)
+	pdtlb,l		%r0(%r28)
 #else
 	tlb_lock	%r20,%r21,%r22
-	pdtlb		0(%r28)
+	pdtlb		%r0(%r28)
 	tlb_unlock	%r20,%r21,%r22
 #endif
 
@@ -852,10 +858,10 @@ ENTRY(flush_dcache_page_asm)
 	/* Purge any old translation */
 
 #ifdef CONFIG_PA20
-	pdtlb,l		0(%r28)
+	pdtlb,l		%r0(%r28)
 #else
 	tlb_lock	%r20,%r21,%r22
-	pdtlb		0(%r28)
+	pdtlb		%r0(%r28)
 	tlb_unlock	%r20,%r21,%r22
 #endif
 
@@ -892,10 +898,10 @@ ENTRY(flush_dcache_page_asm)
 	sync
 
 #ifdef CONFIG_PA20
-	pdtlb,l		0(%r25)
+	pdtlb,l		%r0(%r25)
 #else
 	tlb_lock	%r20,%r21,%r22
-	pdtlb		0(%r25)
+	pdtlb		%r0(%r25)
 	tlb_unlock	%r20,%r21,%r22
 #endif
 
@@ -925,13 +931,18 @@ ENTRY(flush_icache_page_asm)
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
-	/* Purge any old translation */
+	/* Purge any old translation.  Note that the FIC instruction
+	 * may use either the instruction or data TLB.  Given that we
+	 * have a flat address space, it's not clear which TLB will be
+	 * used.  So, we purge both entries.  */
 
 #ifdef CONFIG_PA20
+	pdtlb,l		%r0(%r28)
 	pitlb,l         %r0(%sr4,%r28)
 #else
 	tlb_lock        %r20,%r21,%r22
-	pitlb           (%sr4,%r28)
+	pdtlb		%r0(%r28)
+	pitlb           %r0(%sr4,%r28)
 	tlb_unlock      %r20,%r21,%r22
 #endif
 
@@ -970,10 +981,12 @@ ENTRY(flush_icache_page_asm)
 	sync
 
 #ifdef CONFIG_PA20
+	pdtlb,l		%r0(%r28)
 	pitlb,l         %r0(%sr4,%r25)
 #else
 	tlb_lock        %r20,%r21,%r22
-	pitlb           (%sr4,%r25)
+	pdtlb		%r0(%r28)
+	pitlb           %r0(%sr4,%r25)
 	tlb_unlock      %r20,%r21,%r22
 #endif
 

--Apple-Mail-29--781679002
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-29--781679002--
