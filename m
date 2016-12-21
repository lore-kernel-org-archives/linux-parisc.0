From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Purge TLB entry used for tmp alias operations on PA 2.0
Date: Tue, 20 Dec 2016 19:53:19 -0500
Message-ID: <A7E1D4D6-2836-40C7-975F-BBF6EFE33214@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-26--684257517
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-26--684257517
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

It became apparent with more buildd testing that the previous patch =
removing the TLB purge
after a tmp alias operation (e.g., cache flush) was incorrect on PA 2.0 =
systems that don't support
inequivalent aliases.  This patch restores the needed purge on PA 2.0 =
systems.  Essentially,
the purge is only needed on systems with PA8800 and PA8900 processors.

It uses registers %r24 and %r25 to save the address of the tmp alias =
pages used for the 'to'
and 'from' operations.

We don't check whether inequivalent aliases are supported or not as the =
purge is local and can
be done efficiently on all PA 2.0 processors.

The patch has been tested for six days on rp3440 and no random =
segmentation faults have been
observed.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>



--Apple-Mail-26--684257517
Content-Disposition: attachment;
	filename=pacache.S.d3.txt
Content-Type: text/plain;
	name="pacache.S.d3.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index adf7187f8951..289c57c16f3d 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -626,6 +626,8 @@ ENTRY_CFI(copy_user_page_asm)
 	/* Purge any old translations */
 
 #ifdef CONFIG_PA20
+	copy		%r28, %r24
+	copy		%r29, %r25
 	pdtlb,l		%r0(%r28)
 	pdtlb,l		%r0(%r29)
 #else
@@ -743,6 +745,11 @@ ENTRY_CFI(copy_user_page_asm)
 	ldo		64(%r29), %r29
 #endif
 
+#ifdef CONFIG_PA20
+	pdtlb,l		%r0(%r24)
+	pdtlb,l		%r0(%r25)
+#endif
+
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -774,6 +781,7 @@ ENTRY_CFI(clear_user_page_asm)
 	/* Purge any old translation */
 
 #ifdef CONFIG_PA20
+	copy		%r28, %r24
 	pdtlb,l		%r0(%r28)
 #else
 	tlb_lock	%r20,%r21,%r22
@@ -829,6 +837,10 @@ ENTRY_CFI(clear_user_page_asm)
 	ldo		64(%r28), %r28
 #endif	/* CONFIG_64BIT */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		%r0(%r24)
+#endif
+
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -855,16 +867,6 @@ ENTRY_CFI(flush_dcache_page_asm)
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
-	/* Purge any old translation */
-
-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-#else
-	tlb_lock	%r20,%r21,%r22
-	pdtlb		%r0(%r28)
-	tlb_unlock	%r20,%r21,%r22
-#endif
-
 	ldil		L%dcache_stride, %r1
 	ldw		R%dcache_stride(%r1), r31
 
@@ -876,6 +878,16 @@ ENTRY_CFI(flush_dcache_page_asm)
 	add		%r28, %r25, %r25
 	sub		%r25, r31, %r25
 
+	/* Purge any old translation */
+
+#ifdef CONFIG_PA20
+	copy		%r28, %r24
+	pdtlb,l		%r0(%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
+	pdtlb		%r0(%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
 1:      fdc,m		r31(%r28)
 	fdc,m		r31(%r28)
@@ -896,6 +908,11 @@ ENTRY_CFI(flush_dcache_page_asm)
 	fdc,m		r31(%r28)
 
 	sync
+
+#ifdef CONFIG_PA20
+	pdtlb,l		%r0(%r24)
+#endif
+
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -922,21 +939,6 @@ ENTRY_CFI(flush_icache_page_asm)
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
-	/* Purge any old translation.  Note that the FIC instruction
-	 * may use either the instruction or data TLB.  Given that we
-	 * have a flat address space, it's not clear which TLB will be
-	 * used.  So, we purge both entries.  */
-
-#ifdef CONFIG_PA20
-	pdtlb,l		%r0(%r28)
-	pitlb,l         %r0(%sr4,%r28)
-#else
-	tlb_lock        %r20,%r21,%r22
-	pdtlb		%r0(%r28)
-	pitlb           %r0(%sr4,%r28)
-	tlb_unlock      %r20,%r21,%r22
-#endif
-
 	ldil		L%icache_stride, %r1
 	ldw		R%icache_stride(%r1), %r31
 
@@ -948,6 +950,20 @@ ENTRY_CFI(flush_icache_page_asm)
 	add		%r28, %r25, %r25
 	sub		%r25, %r31, %r25
 
+	/* Purge any old translation.  Note that the FIC instruction
+	 * may use either the instruction or data TLB.  Given that we
+	 * have a flat address space, it's not clear which TLB will be
+	 * used.  So, we purge both entries.  */
+
+#ifdef CONFIG_PA20
+	copy            %r28, %r24
+	pdtlb,l		%r0(%r28)
+	pitlb,l		%r0(%sr4,%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
+	pdtlb		%r0(%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
 
 	/* fic only has the type 26 form on PA1.1, requiring an
 	 * explicit space specification, so use %sr4 */
@@ -970,6 +986,12 @@ ENTRY_CFI(flush_icache_page_asm)
 	fic,m		%r31(%sr4,%r28)
 
 	sync
+
+#ifdef CONFIG_PA20
+	pdtlb,l		%r0(%r24)
+	pitlb,l		%r0(%sr4,%r24)
+#endif
+
 	bv		%r0(%r2)
 	nop
 	.exit

--Apple-Mail-26--684257517
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-26--684257517--
