Return-Path: <SRS0=nAaT=NU=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0CCC43441
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 21:39:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08A4020827
	for <linux-parisc@archiver.kernel.org>; Fri,  9 Nov 2018 21:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08A4020827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbeKJHVg (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 10 Nov 2018 02:21:36 -0500
Received: from mout.gmx.net ([212.227.17.22]:54339 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbeKJHVg (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 10 Nov 2018 02:21:36 -0500
Received: from ls3530.dellerweb.de ([92.116.184.208]) by mail.gmx.com
 (mrgmx102 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0Mg0IT-1g6ZLm03U5-00NQRs; Fri, 09 Nov 2018 22:39:03 +0100
Date:   Fri, 9 Nov 2018 22:39:00 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Optimize sync instruction and D/I-cache flushes on
 UP kernel
Message-ID: <20181109213900.GA12384@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Provags-ID: V03:K1:cVPok9Ezz2MOMm2W2m1docpTKAP3G/pz/k4iN/NAaQFtLWBY04T
 X7ysN6hUOKyULm9282IKKJPisL+cf7reFSrxaNibxkLTfvkZSozztaGmlrZNMgu+32IE9J1
 /fH/ki9Au2zdyyGPxtVwcrUGl29ubzaDKmzg/4loyOnSfThd5EAFTMuc1qzhUM21oYV7vZa
 SEWxhVdeT367jVU/E7iZg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lua45rne7kA=:YsXoytKo0t9UGqFnzVO3ly
 K8NiJSVTjXZr8VfONf8X8bjLNpZhwWltYvgMXLpgdh9o7bKgUL1DKr9PuW9xDSGyil9ge1qEV
 eRksZB3Qq9r0KHCZ9mXjKyHA/atgqn/PLFheX58cEH9tT5xHcWTHp2yEYwjOXMpMNo7xYAoXm
 1uE0S9mXLKFTbVNCLqYDuGp/917/PV+GfKaGesFNtTQuEqJ34NB3An7eflcvcM99469W0Va3E
 1ElR2v4b24Yo94LnNtB+q10W4UzCb47IOY8k48gI6Ftm3AposePZvvOMLr8ewiQObLFP4JJlS
 RLm09Q0mVn1HW3QNRMmywevSGzpgmfy1ZZnhcEG46vQOSJk2SPjUoZFZajOWTfgXUBpc3Gumh
 EQvbvUvqTTgZT0CoxfJNGsVdpbYQqXF1Tm7gF9GmkZYVpABysSWul5C6gr9al89xXIqv/GYWX
 JCKggxXCNEIXZ36qexL4HYVfH6Jek5A+edXlIjF046r7Ag+QycZSaJ0A+20PVV27YVjfLCGNJ
 VOVfMytawkeKwj4ZPADJ+yqarbfgxcTpDroZSBYfYqvgX6QnjgaqyjJPA98OzNppyV3DdTuq7
 GgVbtYdPwy2yYg2W12lpsYsX4kuPSo9Smq7fdkGsuMQAiCn9q89w7MAIPqCBpE0cYi/+MatB/
 K5ufAFEJT06xEmrup+pPlsb27mql778oWzulTn5HxOo2vppzgchvvB56pIyNwwtQnGIPmLLrQ
 cnML0kiokW86Px0QLvEl5r5quD00FQPYSncm1wDE6OO1gA65Ew+0Qg7QBjsi6P947j6zU4TrS
 qOw21/QAJcw2M5gdNwunPMH3GOXLTEi6yqSXoxpHoruESGbouyxg00HdLmLApPYL5rH+yiqqn
 1Xfe/RJuFDvGT4aPIutV0I/O127iVDmV/L+Z94n8M=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Utilize the alternative coding to return early from D/I-flush functions
with the bv,n instruction when machine has no D- or I-caches. Up to now
the coding was replaced with a long branch instruction to the end of the
functions.
Additionally replace the sync instruction on UP kernel with nop.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/asm/alternative.h
index a3630442111d..754988ef4e8d 100644
--- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -12,6 +12,7 @@
 #define INSN_PxTLB	0x02		/* modify pdtlb, pitlb */
 #define INSN_LDI_CPUs	0x34000000	/* ldi val,%reg */
 #define INSN_NOP	0x08000240	/* nop */
+#define INSN_RETURN	0xe840c002	/* bv,n r0(rp) */
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 187f032c9dd8..1ea832b256fa 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -41,6 +41,12 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 
+	/* sync instruction, replaced by nop on UP kernel */
+	.macro	asm_sync
+77:	sync
+	ALTERNATIVE(77b, 77b+4, ALT_COND_NO_SMP, INSN_NOP)
+	.endm
+
 	.section .text.hot
 	.align	16
 
@@ -192,6 +198,7 @@ ENDPROC_CFI(flush_tlb_all_local)
 
 ENTRY_CFI(flush_instruction_cache_local)
 88:	load32		cache_info, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 
 	/* Flush Instruction Cache */
 
@@ -242,9 +249,8 @@ fioneloop2:
 	fice,m		%arg1(%sr1, %arg0)	/* Fice for one loop */
 
 fisync:
-	sync
+	asm_sync
 	mtsm		%r22			/* restore I-bit */
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_instruction_cache_local)
@@ -253,6 +259,7 @@ ENDPROC_CFI(flush_instruction_cache_local)
 	.import cache_info, data
 ENTRY_CFI(flush_data_cache_local)
 88:	load32		cache_info, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 
 	/* Flush Data Cache */
 
@@ -304,9 +311,8 @@ fdoneloop2:
 
 fdsync:
 	syncdma
-	sync
+	asm_sync
 	mtsm		%r22			/* restore I-bit */
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_data_cache_local)
@@ -857,7 +863,7 @@ ENTRY_CFI(flush_dcache_page_asm)
 	fdc,m		r31(%r28)
 
 89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_dcache_page_asm)
@@ -918,7 +924,7 @@ ENTRY_CFI(purge_dcache_page_asm)
 	pdc,m		r31(%r28)
 
 89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(purge_dcache_page_asm)
@@ -989,13 +995,14 @@ ENTRY_CFI(flush_icache_page_asm)
 	fic,m		%r31(%sr4,%r28)
 
 89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_icache_page_asm)
 
 ENTRY_CFI(flush_kernel_dcache_page_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
@@ -1024,14 +1031,14 @@ ENTRY_CFI(flush_kernel_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	fdc,m		%r23(%r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_kernel_dcache_page_asm)
 
 ENTRY_CFI(purge_kernel_dcache_page_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
@@ -1060,14 +1067,14 @@ ENTRY_CFI(purge_kernel_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	pdc,m		%r23(%r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(purge_kernel_dcache_page_asm)
 
 ENTRY_CFI(flush_user_dcache_range_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1101,14 +1108,14 @@ ENTRY_CFI(flush_user_dcache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b
 	fdc,m		%r23(%sr3, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_user_dcache_range_asm)
 
 ENTRY_CFI(flush_kernel_dcache_range_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1142,8 +1149,7 @@ ENTRY_CFI(flush_kernel_dcache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
 	fdc,m		%r23(%r26)
 
-	sync
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+	asm_sync
 	syncdma
 	bv		%r0(%r2)
 	nop
@@ -1151,6 +1157,7 @@ ENDPROC_CFI(flush_kernel_dcache_range_asm)
 
 ENTRY_CFI(purge_kernel_dcache_range_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1184,8 +1191,7 @@ ENTRY_CFI(purge_kernel_dcache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
 	pdc,m		%r23(%r26)
 
-	sync
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
+	asm_sync
 	syncdma
 	bv		%r0(%r2)
 	nop
@@ -1193,6 +1199,7 @@ ENDPROC_CFI(purge_kernel_dcache_range_asm)
 
 ENTRY_CFI(flush_user_icache_range_asm)
 88:	ldil		L%icache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 	ldw		R%icache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1226,14 +1233,14 @@ ENTRY_CFI(flush_user_icache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b
 	fic,m		%r23(%sr3, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_user_icache_range_asm)
 
 ENTRY_CFI(flush_kernel_icache_page)
 88:	ldil		L%icache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 	ldw		R%icache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
@@ -1263,14 +1270,14 @@ ENTRY_CFI(flush_kernel_icache_page)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	fic,m		%r23(%sr4, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_kernel_icache_page)
 
 ENTRY_CFI(flush_kernel_icache_range_asm)
 88:	ldil		L%icache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 	ldw		R%icache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1304,8 +1311,7 @@ ENTRY_CFI(flush_kernel_icache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
 	fic,m		%r23(%sr4, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
-	sync
+	asm_sync
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_kernel_icache_range_asm)
