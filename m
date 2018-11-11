Return-Path: <SRS0=nIWc=NW=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77388C43610
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 19:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B0452148E
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 19:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B0452148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbeKLFgg (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 12 Nov 2018 00:36:36 -0500
Received: from mout.gmx.net ([212.227.17.21]:35061 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729530AbeKLFgg (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Nov 2018 00:36:36 -0500
Received: from ls3530.dellerweb.de ([92.116.134.100]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MMTZa-1gPnZr2NzC-008NfP; Sun, 11 Nov 2018 20:47:01 +0100
Date:   Sun, 11 Nov 2018 20:46:57 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH v2] parisc: Optimize D/I cache flushes on UP kernel
Message-ID: <20181111194657.GA8691@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Provags-ID: V03:K1:N3Yf66Dz2DA+7pYxVZ5yC/dFlFPoNWXUgl/WoaLfMkJLtJOwKKI
 Xl6u+wcOAWRYi9koycxMLijfeauiXURhuJG+7cmn2n/au21Ilg7tobI0abwqHss9bKg07JD
 O2w/dJQgQUTZ92opPtCg3ZGruEsbp8KvTLC/oZekeEXrgtT6D9E5I7tg05oHGZ2RKdfgC+t
 mWvHEQ1K4pojMODBQzNBQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:J21C67XTDmU=:5ksjeWnu9CALKKVPQPUwRF
 Zc1byVKjKxAmg36cc4f1fjv7tT+HnW7DYf0ZG5sEHJ865LU/xBCENuq8HChzV0SLnUKN2yaU8
 4i9d+fkSSuB8G+wa7Kq0NZP9jaf4NP1e/yGiWTsPGVz/ZmHgsMCQmvTLBvsAr8SzsfnhrevN6
 CfVXNBK19NdCNBwxXq+4GyqkdtUpdMHbKjIa5J2tY/fOKSqXdRMYflf92dyZCqZLJl0nc7+qz
 US1+dT4xVKetmm4+HHGfS0aceE0t1DOS6nm2P5Nw+OsjVJWb3Gtydq5htNOkaqtgOcTqU/6xB
 0xgYiYLTzUnFr8WQXp0Rv8pJZ/CUNTFuYBOZkTUv+iVkb4R5RKZ5gZqglak96c+ia39NrfD49
 UXDKjrErvWfhrCtPNhbOO0WqQuUM29yQ94DHvT7XUwONg7BV12AIDxUNhub0UTwIk65twOXzY
 51/fEyPSup14H08/eUZeL6c1XonUlEi6ZHf+71HGixYA8QUaffu/+q4ULaMGHEAat8+VwI2ZX
 070THwHhTo1gNLFidEAn2zXOMsO0BvtrT/Jlq7NO8Pw5/EszVdOzpAu89cP265Wwim/pHqYQh
 9Q77n1iHo70oayhBwBzGu44tv3jxpMrmXe4ZZoRNQpPd565Qylq6iu0LM05wWdfhRBZu2BR1N
 5JHJ2FckLKb+lEwNIq5ZCfTfhooE2P00X1cnJaxVLDDI8lhXG+bV3m6EVdGJlogm+izpb9nns
 LV9DgPLTtJCu1DYqelEeZRC7lSlUgIaRADmT8bN5SecjM897gTAhW6hi+QZPx3NvrRqTaYyVi
 VhRqxqIjynfL2YsZ/O+FnV3PiuQ0u9R0v+0cZ7+bMbIPT/Yt9AkYpBchAcLRFRDaPaPB0kR0W
 0v6B8PCsPZaIzqcE9wXWaNm70x59tIC1bv/4hoECU=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Utilize the alternative coding to return early from D/I cache flush
functions with the bv,n instruction when machine has no D- or I-caches.
Up to now the coding was replaced with a long branch instruction to the
end of the functions.

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
index 187f032c9dd8..bb5da609b7d3 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -192,6 +192,7 @@ ENDPROC_CFI(flush_tlb_all_local)
 
 ENTRY_CFI(flush_instruction_cache_local)
 88:	load32		cache_info, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 
 	/* Flush Instruction Cache */
 
@@ -244,7 +245,6 @@ fioneloop2:
 fisync:
 	sync
 	mtsm		%r22			/* restore I-bit */
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_instruction_cache_local)
@@ -253,6 +253,7 @@ ENDPROC_CFI(flush_instruction_cache_local)
 	.import cache_info, data
 ENTRY_CFI(flush_data_cache_local)
 88:	load32		cache_info, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 
 	/* Flush Data Cache */
 
@@ -306,7 +307,6 @@ fdsync:
 	syncdma
 	sync
 	mtsm		%r22			/* restore I-bit */
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
 	bv		%r0(%r2)
 	nop
 ENDPROC_CFI(flush_data_cache_local)
@@ -996,6 +996,7 @@ ENDPROC_CFI(flush_icache_page_asm)
 
 ENTRY_CFI(flush_kernel_dcache_page_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
@@ -1024,7 +1025,6 @@ ENTRY_CFI(flush_kernel_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	fdc,m		%r23(%r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1032,6 +1032,7 @@ ENDPROC_CFI(flush_kernel_dcache_page_asm)
 
 ENTRY_CFI(purge_kernel_dcache_page_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
@@ -1060,7 +1061,6 @@ ENTRY_CFI(purge_kernel_dcache_page_asm)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	pdc,m		%r23(%r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1068,6 +1068,7 @@ ENDPROC_CFI(purge_kernel_dcache_page_asm)
 
 ENTRY_CFI(flush_user_dcache_range_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1101,7 +1102,6 @@ ENTRY_CFI(flush_user_dcache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b
 	fdc,m		%r23(%sr3, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1109,6 +1109,7 @@ ENDPROC_CFI(flush_user_dcache_range_asm)
 
 ENTRY_CFI(flush_kernel_dcache_range_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1143,7 +1144,6 @@ ENTRY_CFI(flush_kernel_dcache_range_asm)
 	fdc,m		%r23(%r26)
 
 	sync
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
 	syncdma
 	bv		%r0(%r2)
 	nop
@@ -1151,6 +1151,7 @@ ENDPROC_CFI(flush_kernel_dcache_range_asm)
 
 ENTRY_CFI(purge_kernel_dcache_range_asm)
 88:	ldil		L%dcache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
 	ldw		R%dcache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1185,7 +1186,6 @@ ENTRY_CFI(purge_kernel_dcache_range_asm)
 	pdc,m		%r23(%r26)
 
 	sync
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
 	syncdma
 	bv		%r0(%r2)
 	nop
@@ -1193,6 +1193,7 @@ ENDPROC_CFI(purge_kernel_dcache_range_asm)
 
 ENTRY_CFI(flush_user_icache_range_asm)
 88:	ldil		L%icache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 	ldw		R%icache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1226,7 +1227,6 @@ ENTRY_CFI(flush_user_icache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b
 	fic,m		%r23(%sr3, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1234,6 +1234,7 @@ ENDPROC_CFI(flush_user_icache_range_asm)
 
 ENTRY_CFI(flush_kernel_icache_page)
 88:	ldil		L%icache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 	ldw		R%icache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
@@ -1263,7 +1264,6 @@ ENTRY_CFI(flush_kernel_icache_page)
 	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
 	fic,m		%r23(%sr4, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
@@ -1271,6 +1271,7 @@ ENDPROC_CFI(flush_kernel_icache_page)
 
 ENTRY_CFI(flush_kernel_icache_range_asm)
 88:	ldil		L%icache_stride, %r1
+	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
 	ldw		R%icache_stride(%r1), %r23
 	ldo		-1(%r23), %r21
 	ANDCM		%r26, %r21, %r26
@@ -1304,7 +1305,6 @@ ENTRY_CFI(flush_kernel_icache_range_asm)
 2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
 	fic,m		%r23(%sr4, %r26)
 
-89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
 	sync
 	bv		%r0(%r2)
 	nop
