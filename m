Return-Path: <SRS0=LtAx=SO=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBF0C10F0E
	for <linux-parisc@archiver.kernel.org>; Fri, 12 Apr 2019 23:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CFEF2086D
	for <linux-parisc@archiver.kernel.org>; Fri, 12 Apr 2019 23:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbfDLXMH (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 12 Apr 2019 19:12:07 -0400
Received: from belmont80srvr.owm.bell.net ([184.150.200.80]:55593 "EHLO
        mtlfep02.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726477AbfDLXMH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 12 Apr 2019 19:12:07 -0400
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net
          with ESMTP
          id <20190412231206.OKOZ4444.mtlfep02.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Fri, 12 Apr 2019 19:12:06 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by mtlspm01.bell.net
          with ESMTP
          id <20190412231206.MTIX87666.mtlspm01.bell.net@[192.168.2.49]>;
          Fri, 12 Apr 2019 19:12:06 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove lock code to serialize TLB operations in
 pacache.S
Openpgp: preference=signencrypt
Message-ID: <bd9ad9ce-8e83-6653-00d9-68b8504efc11@bell.net>
Date:   Fri, 12 Apr 2019 19:12:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=ZMOpZkzb c=1 sm=1 tr=0 a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=Eo-B8f0-7fQ_0LeRCIsA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfID7t/y+XoinrUSRi4tviFi21ZqxxqZoowK3j8/JUqRyujyVfheoLf8nuFLmREWb+hDGIgUnrtBF4mxPmtZiGHIduVWZ6NROLvww4ypV/GEvHhh+AwrU 1axocPmuoAKOGKU+evj1pA7FuCYV0qjyBR7bPkXyzDREJjQg6FJTz44tUiyqQnprXb2hg/NQ07qM5w==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

TLB operations only need to be serialized on machines with the Merced (Stretch) bus.
The only machines in this category are L and N class, and they require a 64-bit PA 2.0
kernel.  On these machines, we use local TLB purges in the tmpalias routines.  We don't
need to serialize TLB purges on all other machines.  Thus, the lock/unlock code can be
removed when CONFIG_PA20 is not defined.  Further, when CONFIG_PA20 is not defined,
alternative patching converts the TLB purges to local purges when PA 2.0 hardware has
been detected.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 187f032c9dd8..4e4e8eb25874 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -311,39 +311,6 @@ fdsync:
 	nop
 ENDPROC_CFI(flush_data_cache_local)

-/* Macros to serialize TLB purge operations on SMP.  */
-
-	.macro	tlb_lock	la,flags,tmp
-#ifdef CONFIG_SMP
-98:
-#if __PA_LDCW_ALIGNMENT > 4
-	load32		pa_tlb_lock + __PA_LDCW_ALIGNMENT-1, \la
-	depi		0,31,__PA_LDCW_ALIGN_ORDER, \la
-#else
-	load32		pa_tlb_lock, \la
-#endif
-	rsm		PSW_SM_I,\flags
-1:	LDCW		0(\la),\tmp
-	cmpib,<>,n	0,\tmp,3f
-2:	ldw		0(\la),\tmp
-	cmpb,<>		%r0,\tmp,1b
-	nop
-	b,n		2b
-3:
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	.endm
-
-	.macro	tlb_unlock	la,flags,tmp
-#ifdef CONFIG_SMP
-98:	ldi		1,\tmp
-	sync
-	stw		\tmp,0(\la)
-	mtsm		\flags
-99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
-#endif
-	.endm
-
 /* Clear page using kernel mapping.  */

 ENTRY_CFI(clear_page_asm)
@@ -601,10 +568,8 @@ ENTRY_CFI(copy_user_page_asm)
 	pdtlb,l		%r0(%r28)
 	pdtlb,l		%r0(%r29)
 #else
-	tlb_lock	%r20,%r21,%r22
 0:	pdtlb		%r0(%r28)
 1:	pdtlb		%r0(%r29)
-	tlb_unlock	%r20,%r21,%r22
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 #endif
@@ -743,9 +708,7 @@ ENTRY_CFI(clear_user_page_asm)
 #ifdef CONFIG_PA20
 	pdtlb,l		%r0(%r28)
 #else
-	tlb_lock	%r20,%r21,%r22
 0:	pdtlb		%r0(%r28)
-	tlb_unlock	%r20,%r21,%r22
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 #endif

@@ -821,9 +784,7 @@ ENTRY_CFI(flush_dcache_page_asm)
 #ifdef CONFIG_PA20
 	pdtlb,l		%r0(%r28)
 #else
-	tlb_lock	%r20,%r21,%r22
 0:	pdtlb		%r0(%r28)
-	tlb_unlock	%r20,%r21,%r22
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 #endif

@@ -882,9 +843,7 @@ ENTRY_CFI(purge_dcache_page_asm)
 #ifdef CONFIG_PA20
 	pdtlb,l		%r0(%r28)
 #else
-	tlb_lock	%r20,%r21,%r22
 0:	pdtlb		%r0(%r28)
-	tlb_unlock	%r20,%r21,%r22
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 #endif

@@ -948,10 +907,8 @@ ENTRY_CFI(flush_icache_page_asm)
 1:	pitlb,l         %r0(%sr4,%r28)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
 #else
-	tlb_lock        %r20,%r21,%r22
 0:	pdtlb		%r0(%r28)
 1:	pitlb           %r0(%sr4,%r28)
-	tlb_unlock      %r20,%r21,%r22
 	ALTERNATIVE(0b, 0b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SMP, INSN_PxTLB)
 	ALTERNATIVE(1b, 1b+4, ALT_COND_NO_SPLIT_TLB, INSN_NOP)
