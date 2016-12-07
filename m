From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove unnecessary TLB purges from flush_dcache_page_asm and flush_icache_page_asm
Date: Tue, 6 Dec 2016 22:02:01 -0500
Message-ID: <842D2205-7F61-455C-ABA0-51C00DB199B2@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-46-261348559
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-46-261348559
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

We have four routines in pacache.S that use temporary alias pages: =
copy_user_page_asm(), clear_user_page_asm(),
flush_dcache_page_asm() and flush_icache_page_asm().  =
copy_user_page_asm() and clear_user_page_asm() don't
purge the TLB entry used for the operation.  flush_dcache_page_asm() and =
flush_icache_page_asm do purge the
entry.

Presumably, this was thought to optimize TLB use.  However, the =
operation is quite heavy weight on PA 1.X processors
as we need to take the TLB lock and a TLB broadcast is sent to all =
processors.

This patch removes the purges from flush_dcache_page_asm() and =
flush_icache_page_asm.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>



--Apple-Mail-46-261348559
Content-Disposition: attachment;
	filename=pacache.S.d1.txt
Content-Type: text/plain;
	name="pacache.S.d1.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index b743a80..41a923d 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -886,19 +892,10 @@ ENTRY(flush_dcache_page_asm)
 	fdc,m		r31(%r28)
 	fdc,m		r31(%r28)
 	fdc,m		r31(%r28)
-	cmpb,COND(<<)		%r28, %r25,1b
+	cmpb,COND(<<)	%r28, %r25,1b
 	fdc,m		r31(%r28)
 
 	sync
-
-#ifdef CONFIG_PA20
-	pdtlb,l		0(%r25)
-#else
-	tlb_lock	%r20,%r21,%r22
-	pdtlb		0(%r25)
-	tlb_unlock	%r20,%r21,%r22
-#endif
-
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -968,15 +970,6 @@ ENTRY(flush_icache_page_asm)
 	fic,m		%r31(%sr4,%r28)
 
 	sync
-
-#ifdef CONFIG_PA20
-	pitlb,l         %r0(%sr4,%r25)
-#else
-	tlb_lock        %r20,%r21,%r22
-	pitlb           (%sr4,%r25)
-	tlb_unlock      %r20,%r21,%r22
-#endif
--Apple-Mail-46-261348559--
