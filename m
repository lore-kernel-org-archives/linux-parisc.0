From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Inline trivial exception code
Date: Mon, 27 Mar 2017 18:22:37 +0200
Message-ID: <20170327162237.GA15335@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fold trivial exception handling for lclear_user() and lstrnlen_user()
into the main functions.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index 8bcff05..4718eca 100644
--- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -55,12 +55,6 @@
 	mtsp        %r1,%sr1
 	.endm
 
-	.macro fixup_branch lbl
-	ldil	    L%\lbl, %r1
-	ldo	    R%\lbl(%r1), %r1
-	bv          %r0(%r1)
-	.endm
-
 	/*
 	 * unsigned long lclear_user(void *to, unsigned long n)
 	 *
@@ -81,16 +75,16 @@ $lclu_loop:
 $lclu_done:
 	bv          %r0(%r2)
 	copy        %r25,%r28
-	.exit
-ENDPROC_CFI(lclear_user)
 
-	.section .fixup,"ax"
-2:      fixup_branch $lclu_done
-	ldo        1(%r25),%r25
-	.previous
+2:	b           $lclu_done
+	ldo         1(%r25),%r25
 
 	ASM_EXCEPTIONTABLE_ENTRY(1b,2b)
 
+	.exit
+ENDPROC_CFI(lclear_user)
+
+
 	.procend
 
 	/*
@@ -121,16 +115,15 @@ $lslen_done:
 $lslen_nzero:
 	b           $lslen_done
 	ldo         1(%r26),%r26 /* special case for N == 0 */
-ENDPROC_CFI(lstrnlen_user)
 
-	.section .fixup,"ax"
-3:      fixup_branch $lslen_done
+3:      b	    $lslen_done
 	copy        %r24,%r26    /* reset r26 so 0 is returned on fault */
-	.previous
 
 	ASM_EXCEPTIONTABLE_ENTRY(1b,3b)
 	ASM_EXCEPTIONTABLE_ENTRY(2b,3b)
 
+ENDPROC_CFI(lstrnlen_user)
+
 	.procend
 
 
