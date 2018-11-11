Return-Path: <SRS0=nIWc=NW=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB4AC43441
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 15:31:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEADE20872
	for <linux-parisc@archiver.kernel.org>; Sun, 11 Nov 2018 15:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEADE20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bell.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbeKLBUC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 11 Nov 2018 20:20:02 -0500
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:43284 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728498AbeKLBUC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 11 Nov 2018 20:20:02 -0500
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20181111153110.IHEH31136.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 11 Nov 2018 10:31:10 -0500
Received: from [192.168.2.49] (really [70.53.62.196]) by torspm02.bell.net
          with ESMTP
          id <20181111153110.LXBV19016.torspm02.bell.net@[192.168.2.49]>;
          Sun, 11 Nov 2018 10:31:10 -0500
Subject: Re: [PATCH] parisc: Optimize sync instruction and D/I-cache flushes
 on UP kernel
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20181109213900.GA12384@ls3530.dellerweb.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <a25a8bce-a173-5aa6-c136-8b9c9814d5b8@bell.net>
Date:   Sun, 11 Nov 2018 10:31:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181109213900.GA12384@ls3530.dellerweb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Cloudmark-Analysis: v=2.2 cv=N5jGLy1B c=1 sm=0 tr=0 a=Zvhif4XNTjWcJyJCfFIh1A==:17 a=IkcTkHD0fZMA:10 a=JHtHm7312UAA:10 a=FBHGMhGWAAAA:8 a=lAa505bIi_-vN01bfFwA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2018-11-09 4:39 p.m., Helge Deller wrote:
> Utilize the alternative coding to return early from D/I-flush functions
> with the bv,n instruction when machine has no D- or I-caches. Up to now
> the coding was replaced with a long branch instruction to the end of the
> functions.
> Additionally replace the sync instruction on UP kernel with nop.
I don't believe this change is correct.  Flush and purge data cache 
instructions are deferred.
The sync instructions in the flush and purge routines ensure that cache 
lines are flushed
to memory.  This has nothing directly to do with UP.  It is needed for 
example on machines with
separate I and D caches, or multiple combined caches that aren't coherent.

>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/asm/alternative.h
> index a3630442111d..754988ef4e8d 100644
> --- a/arch/parisc/include/asm/alternative.h
> +++ b/arch/parisc/include/asm/alternative.h
> @@ -12,6 +12,7 @@
>   #define INSN_PxTLB	0x02		/* modify pdtlb, pitlb */
>   #define INSN_LDI_CPUs	0x34000000	/* ldi val,%reg */
>   #define INSN_NOP	0x08000240	/* nop */
> +#define INSN_RETURN	0xe840c002	/* bv,n r0(rp) */
>   
>   #ifndef __ASSEMBLY__
>   
> diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
> index 187f032c9dd8..1ea832b256fa 100644
> --- a/arch/parisc/kernel/pacache.S
> +++ b/arch/parisc/kernel/pacache.S
> @@ -41,6 +41,12 @@
>   #include <linux/linkage.h>
>   #include <linux/init.h>
>   
> +	/* sync instruction, replaced by nop on UP kernel */
> +	.macro	asm_sync
> +77:	sync
> +	ALTERNATIVE(77b, 77b+4, ALT_COND_NO_SMP, INSN_NOP)
> +	.endm
> +
>   	.section .text.hot
>   	.align	16
>   
> @@ -192,6 +198,7 @@ ENDPROC_CFI(flush_tlb_all_local)
>   
>   ENTRY_CFI(flush_instruction_cache_local)
>   88:	load32		cache_info, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
>   
>   	/* Flush Instruction Cache */
>   
> @@ -242,9 +249,8 @@ fioneloop2:
>   	fice,m		%arg1(%sr1, %arg0)	/* Fice for one loop */
>   
>   fisync:
> -	sync
> +	asm_sync
>   	mtsm		%r22			/* restore I-bit */
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_instruction_cache_local)
> @@ -253,6 +259,7 @@ ENDPROC_CFI(flush_instruction_cache_local)
>   	.import cache_info, data
>   ENTRY_CFI(flush_data_cache_local)
>   88:	load32		cache_info, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
>   
>   	/* Flush Data Cache */
>   
> @@ -304,9 +311,8 @@ fdoneloop2:
>   
>   fdsync:
>   	syncdma
> -	sync
> +	asm_sync
>   	mtsm		%r22			/* restore I-bit */
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_data_cache_local)
> @@ -857,7 +863,7 @@ ENTRY_CFI(flush_dcache_page_asm)
>   	fdc,m		r31(%r28)
>   
>   89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_dcache_page_asm)
> @@ -918,7 +924,7 @@ ENTRY_CFI(purge_dcache_page_asm)
>   	pdc,m		r31(%r28)
>   
>   89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(purge_dcache_page_asm)
> @@ -989,13 +995,14 @@ ENTRY_CFI(flush_icache_page_asm)
>   	fic,m		%r31(%sr4,%r28)
>   
>   89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_icache_page_asm)
>   
>   ENTRY_CFI(flush_kernel_dcache_page_asm)
>   88:	ldil		L%dcache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
>   	ldw		R%dcache_stride(%r1), %r23
>   
>   #ifdef CONFIG_64BIT
> @@ -1024,14 +1031,14 @@ ENTRY_CFI(flush_kernel_dcache_page_asm)
>   	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
>   	fdc,m		%r23(%r26)
>   
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_kernel_dcache_page_asm)
>   
>   ENTRY_CFI(purge_kernel_dcache_page_asm)
>   88:	ldil		L%dcache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
>   	ldw		R%dcache_stride(%r1), %r23
>   
>   #ifdef CONFIG_64BIT
> @@ -1060,14 +1067,14 @@ ENTRY_CFI(purge_kernel_dcache_page_asm)
>   	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
>   	pdc,m		%r23(%r26)
>   
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(purge_kernel_dcache_page_asm)
>   
>   ENTRY_CFI(flush_user_dcache_range_asm)
>   88:	ldil		L%dcache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
>   	ldw		R%dcache_stride(%r1), %r23
>   	ldo		-1(%r23), %r21
>   	ANDCM		%r26, %r21, %r26
> @@ -1101,14 +1108,14 @@ ENTRY_CFI(flush_user_dcache_range_asm)
>   2:	cmpb,COND(>>),n	%r25, %r26, 2b
>   	fdc,m		%r23(%sr3, %r26)
>   
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_user_dcache_range_asm)
>   
>   ENTRY_CFI(flush_kernel_dcache_range_asm)
>   88:	ldil		L%dcache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
>   	ldw		R%dcache_stride(%r1), %r23
>   	ldo		-1(%r23), %r21
>   	ANDCM		%r26, %r21, %r26
> @@ -1142,8 +1149,7 @@ ENTRY_CFI(flush_kernel_dcache_range_asm)
>   2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
>   	fdc,m		%r23(%r26)
>   
> -	sync
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
> +	asm_sync
>   	syncdma
>   	bv		%r0(%r2)
>   	nop
> @@ -1151,6 +1157,7 @@ ENDPROC_CFI(flush_kernel_dcache_range_asm)
>   
>   ENTRY_CFI(purge_kernel_dcache_range_asm)
>   88:	ldil		L%dcache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_DCACHE, INSN_RETURN)
>   	ldw		R%dcache_stride(%r1), %r23
>   	ldo		-1(%r23), %r21
>   	ANDCM		%r26, %r21, %r26
> @@ -1184,8 +1191,7 @@ ENTRY_CFI(purge_kernel_dcache_range_asm)
>   2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
>   	pdc,m		%r23(%r26)
>   
> -	sync
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_DCACHE, INSN_NOP)
> +	asm_sync
>   	syncdma
>   	bv		%r0(%r2)
>   	nop
> @@ -1193,6 +1199,7 @@ ENDPROC_CFI(purge_kernel_dcache_range_asm)
>   
>   ENTRY_CFI(flush_user_icache_range_asm)
>   88:	ldil		L%icache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
>   	ldw		R%icache_stride(%r1), %r23
>   	ldo		-1(%r23), %r21
>   	ANDCM		%r26, %r21, %r26
> @@ -1226,14 +1233,14 @@ ENTRY_CFI(flush_user_icache_range_asm)
>   2:	cmpb,COND(>>),n	%r25, %r26, 2b
>   	fic,m		%r23(%sr3, %r26)
>   
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_user_icache_range_asm)
>   
>   ENTRY_CFI(flush_kernel_icache_page)
>   88:	ldil		L%icache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
>   	ldw		R%icache_stride(%r1), %r23
>   
>   #ifdef CONFIG_64BIT
> @@ -1263,14 +1270,14 @@ ENTRY_CFI(flush_kernel_icache_page)
>   	cmpb,COND(>>)	%r25, %r26, 1b /* predict taken */
>   	fic,m		%r23(%sr4, %r26)
>   
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_kernel_icache_page)
>   
>   ENTRY_CFI(flush_kernel_icache_range_asm)
>   88:	ldil		L%icache_stride, %r1
> +	ALTERNATIVE(88b, 88b+4, ALT_COND_NO_ICACHE, INSN_RETURN)
>   	ldw		R%icache_stride(%r1), %r23
>   	ldo		-1(%r23), %r21
>   	ANDCM		%r26, %r21, %r26
> @@ -1304,8 +1311,7 @@ ENTRY_CFI(flush_kernel_icache_range_asm)
>   2:	cmpb,COND(>>),n	%r25, %r26, 2b /* predict taken */
>   	fic,m		%r23(%sr4, %r26)
>   
> -89:	ALTERNATIVE(88b, 89b, ALT_COND_NO_ICACHE, INSN_NOP)
> -	sync
> +	asm_sync
>   	bv		%r0(%r2)
>   	nop
>   ENDPROC_CFI(flush_kernel_icache_range_asm)
>


-- 
John David Anglin  dave.anglin@bell.net

