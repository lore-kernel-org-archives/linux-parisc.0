Return-Path: <SRS0=rNqQ=SQ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E496FC10F13
	for <linux-parisc@archiver.kernel.org>; Sun, 14 Apr 2019 23:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2C6F20833
	for <linux-parisc@archiver.kernel.org>; Sun, 14 Apr 2019 23:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbfDNXUn (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 14 Apr 2019 19:20:43 -0400
Received: from simcoe208srvr.owm.bell.net ([184.150.200.208]:44124 "EHLO
        torfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725775AbfDNXUm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 14 Apr 2019 19:20:42 -0400
Received: from bell.net torfep02 184.150.200.158 by torfep02.bell.net
          with ESMTP
          id <20190414232041.BCC4684.torfep02.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 14 Apr 2019 19:20:41 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190414232041.ORDO30132.torspm02.bell.net@[192.168.2.49]>;
          Sun, 14 Apr 2019 19:20:41 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use ldcw instruction for SMP spinlock release barrier
Openpgp: preference=signencrypt
Message-ID: <a12f7c71-553c-1e4d-d986-8a966f6e83dc@bell.net>
Date:   Sun, 14 Apr 2019 19:20:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=O5JHQy1W c=1 sm=1 tr=0 a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=bsiEr5t9_8d2UFjgbIkA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfFl0VTYT9gt7s1Fs+cKemVPTOTnT+Da/dvP4TgAP75vkjggScd1A4YVQ6UNyrWfUTjs9Vmo/wAErasbsTNrL2IJ+Kdrp6TomavlgHrB0PCmD2k8MC+ce IfDtWYG9qEOS2OjJU1KAgSZLhrUdgaU3X9FS4frUS+H4IcQHnnTAUrU4hFUr7IrLG+4jTRYgHb8Puw==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

There are only a couple of instructions that can function as a memory barrier on
parisc.  Currently, we use the sync instruction as a memory barrier when releasing
a spinlock.  However, the ldcw instruction is a better barrier when we have a
handy memory location since it operates in the cache on coherent machines.

This patch updates the spinlock release code to use ldcw.  I also changed the "stw,ma"
instructions to "stw" instructions as it is not an adequate barrier.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index 8a63515f03bf..197d2247e4db 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -37,7 +37,11 @@ static inline void arch_spin_unlock(arch_spinlock_t *x)
 	volatile unsigned int *a;

 	a = __ldcw_align(x);
+#ifdef CONFIG_SMP
+	(void) __ldcw(a);
+#else
 	mb();
+#endif
 	*a = 1;
 }

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index d5eb19efa65b..a1fc04570ade 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -471,8 +467,9 @@
 	nop
 	LDREG		0(\ptp),\pte
 	bb,<,n		\pte,_PAGE_PRESENT_BIT,3f
+	LDCW		0(\tmp),\tmp1
 	b		\fault
-	stw,ma		\spc,0(\tmp)
+	stw		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 2:	LDREG		0(\ptp),\pte
@@ -481,20 +478,22 @@
 	.endm

 	/* Release pa_tlb_lock lock without reloading lock address. */
-	.macro		tlb_unlock0	spc,tmp
+	.macro		tlb_unlock0	spc,tmp,tmp1
 #ifdef CONFIG_SMP
 98:	or,COND(=)	%r0,\spc,%r0
-	stw,ma		\spc,0(\tmp)
+	LDCW		0(\tmp),\tmp1
+	or,COND(=)	%r0,\spc,%r0
+	stw		\spc,0(\tmp)
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
 #endif
 	.endm

 	/* Release pa_tlb_lock lock. */
-	.macro		tlb_unlock1	spc,tmp
+	.macro		tlb_unlock1	spc,tmp,tmp1
 #ifdef CONFIG_SMP
 98:	load_pa_tlb_lock \tmp
 99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-	tlb_unlock0	\spc,\tmp
+	tlb_unlock0	\spc,\tmp,\tmp1
 #endif
 	.endm

@@ -1177,7 +1176,7 @@ dtlb_miss_20w:
 	
 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1203,7 +1202,7 @@ nadtlb_miss_20w:

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1237,7 +1236,7 @@ dtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1270,7 +1269,7 @@ nadtlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1299,7 +1298,7 @@ dtlb_miss_20:

 	idtlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1327,7 +1326,7 @@ nadtlb_miss_20:
 	
 	idtlbt		pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1434,7 +1433,7 @@ itlb_miss_20w:
 	
 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1458,7 +1457,7 @@ naitlb_miss_20w:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1492,7 +1491,7 @@ itlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1516,7 +1515,7 @@ naitlb_miss_11:

 	mtsp		t1, %sr1	/* Restore sr1 */

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1546,7 +1545,7 @@ itlb_miss_20:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1566,7 +1565,7 @@ naitlb_miss_20:

 	iitlbt          pte,prot

-	tlb_unlock1	spc,t0
+	tlb_unlock1	spc,t0,t1
 	rfir
 	nop

@@ -1596,7 +1595,7 @@ dbit_trap_20w:
 		
 	idtlbt          pte,prot

-	tlb_unlock0	spc,t0
+	tlb_unlock0	spc,t0,t1
 	rfir
 	nop
 #else
@@ -1622,7 +1621,7 @@ dbit_trap_11:

 	mtsp            t1, %sr1     /* Restore sr1 */

-	tlb_unlock0	spc,t0
+	tlb_unlock0	spc,t0,t1
 	rfir
 	nop

@@ -1642,7 +1641,7 @@ dbit_trap_20:
 	
 	idtlbt		pte,prot

-	tlb_unlock0	spc,t0
+	tlb_unlock0	spc,t0,t1
 	rfir
 	nop
 #endif
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 4f77bd9be66b..e2b4c8d81275 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -640,7 +640,9 @@ cas_action:
 	sub,<>	%r28, %r25, %r0
 2:	stw	%r24, 0(%r26)
 	/* Free lock */
-	sync
+#ifdef CONFIG_SMP
+	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+#endif
 	stw	%r20, 0(%sr2,%r20)
 #if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
@@ -655,7 +657,9 @@ cas_action:
 3:		
 	/* Error occurred on load or store */
 	/* Free lock */
-	sync
+#ifdef CONFIG_SMP
+	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+#endif
 	stw	%r20, 0(%sr2,%r20)
 #if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
@@ -857,7 +861,9 @@ cas2_action:

 cas2_end:
 	/* Free lock */
-	sync
+#ifdef CONFIG_SMP
+	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+#endif
 	stw	%r20, 0(%sr2,%r20)
 	/* Enable interrupts */
 	ssm	PSW_SM_I, %r0
@@ -868,7 +874,9 @@ cas2_end:
 22:
 	/* Error occurred on load or store */
 	/* Free lock */
-	sync
+#ifdef CONFIG_SMP
+	LDCW	0(%sr2,%r20), %r1			/* Barrier */
+#endif
 	stw	%r20, 0(%sr2,%r20)
 	ssm	PSW_SM_I, %r0
 	ldo	1(%r0),%r28



