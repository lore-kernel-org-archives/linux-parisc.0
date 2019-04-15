Return-Path: <SRS0=h12M=SR=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AC9C10F0E
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 12:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E000C20652
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 12:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="aFAe01uX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbfDOMoD (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:44:03 -0400
Received: from mout.gmx.net ([212.227.17.21]:35011 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfDOMoD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Apr 2019 08:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1555332234;
        bh=qJ/v5kty6RY0GD8+gt6T+CjjvJUPBeqX6bjbRZf2cN0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=aFAe01uXJBKl5V5qARuadmuZZV6EXJcZbtIhFAT9OLUbo1EVh7ZerI5Z5p+2GaW53
         Wavm5dJ/Ox6oEQsPYcAdrEeGX8LwN74ixLi8B2FdqF6dygC0nbmmzZ/826WeLpTB47
         tflILAx7xKEFgs3gPpdokumELkzp5pBy6B2IMZh4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.189.244]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Mcyxq-1hY64u32UE-00IE8h; Mon, 15
 Apr 2019 14:43:54 +0200
Subject: Re: [PATCH] parisc: Use ldcw instruction for SMP spinlock release
 barrier
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <a12f7c71-553c-1e4d-d986-8a966f6e83dc@bell.net>
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <059fe85b-468c-06b4-fb07-dbcbf2d222c9@gmx.de>
Date:   Mon, 15 Apr 2019 14:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a12f7c71-553c-1e4d-d986-8a966f6e83dc@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aZzi11NDUJxnZC8DiZLR8X8C1A8bAsPCes0KVzxSdC0sfF5Zs2i
 Q9oNu2pSbD5D/PXsSANi4kDRaN+HcnlgROH7I52suF+IF+rHhf9efTSQOY2TChxDdVhMUjx
 UQd+f97MeC5i0F9L5d1ZDrUemmat+swf8aZ2c1NB5KmdbB9e93gI3pQN89J4j8jWxlH22iZ
 nmr/pRy/xbvki8IxhZq4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SPiKS8EHbXs=:L4nHwWk1jgtr292/L5baz3
 oYyhFqXs+YL02zDcv4lW5K0W3sNOUOhRQb2yLD1Dily7TvtU1OBFOp1QoXxZP/TDMeBC63vrZ
 wYxONtucl8i7baTCmcBa2V6ppyNMWLUmedWjdS6jp+nxvE447lMO84vRcqwtFgaztkWEUJEa6
 ebZenwoxH+XjxWsMPUaEZAkSPDlIImCuz35P3PnI4BaSaAukYaWeJTN5dK6kxdiKH9dXYLlLc
 pvjZlFWRROTtU0MWRYn2jdIKJReOPJgeKEE47xpT6NwfavlFNsun5Fh9zkYIIcjuQVpm80Zp0
 LUd0Ep5vsA4nIVa7Ov4Rcujkyk75Fw3B/Jq4rZo9iJ9GXyspqlu4PuzLL/y1VWJvaFzPRcbfw
 Od+CJiOp9JqwwEQnRPR6rmP2xQeEG4CBiRaLGgUtvwbNBTCMkA44vDFxy9eU29pKt31F46GkH
 6k5S2CXBcMCMvmpsQ4Ba4XBuPVbl+kLkjp+CjLfGC8GlWPmnFpdIlsOT+dO83B/va7BAljIUL
 xbtQwsKvVe2RdCOqf02Nmg5UB0stnrgE95l9fgvLOwejn4ufY0tARhR+WCHklg7QeiDgHbrnI
 goz+i52s3De+gQDlM455C7MZti6c7nKoh3TA8mlh4toUoMwTxXIGzrjS8qLlAxz3jEDTXvD2O
 AVTTG61n7petMhmNNoqdvKFIRUAhjZGQzXjDgeAvyM1RFSRrjXOkbGBE9yGeOV3/t3YVqQrEr
 Bl3m1VnLZ5ZnqlzNjoV4w9T1Ae+iSYgvbFeMMX4F2Tp2Q+mV+WaVSW1Vj/kAnn/UQa4Db1ybj
 D7JzTSXDK6od++Q/jDatDZQCUj1rl7tLDlkb2P7Ywg/ac+h66YU+OKR1Ix4em5/RcLLiHQjwi
 SBQC6+aOeTNjZ4fyuEzDGMax5+85g9g6uOKEvrsMmeh9y/6xXIzYcZGTrEW0fm
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 15.04.19 01:20, John David Anglin wrote:
> There are only a couple of instructions that can function as a memory ba=
rrier on
> parisc.  Currently, we use the sync instruction as a memory barrier when=
 releasing
> a spinlock.  However, the ldcw instruction is a better barrier when we h=
ave a
> handy memory location since it operates in the cache on coherent machine=
s.
>
> This patch updates the spinlock release code to use ldcw.

Just out of curiosity: Did you maye do any timing with that patch?

Secondly:

>  	/* Release pa_tlb_lock lock without reloading lock address. */
> -	.macro		tlb_unlock0	spc,tmp
> +	.macro		tlb_unlock0	spc,tmp,tmp1

Above you add the tmp1 variable...

>  #ifdef CONFIG_SMP
>  98:	or,COND(=3D)	%r0,\spc,%r0
> -	stw,ma		\spc,0(\tmp)
> +	LDCW		0(\tmp),\tmp1

couldn't instead %r0 be used as register target in all ldcw()
accesses you added as barriers?
Or would the processor "optimize" the access away (which I doubt)?

Helge


> I also changed the "stw,ma"
> instructions to "stw" instructions as it is not an adequate barrier.
>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>
> diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/as=
m/spinlock.h
> index 8a63515f03bf..197d2247e4db 100644
> --- a/arch/parisc/include/asm/spinlock.h
> +++ b/arch/parisc/include/asm/spinlock.h
> @@ -37,7 +37,11 @@ static inline void arch_spin_unlock(arch_spinlock_t *=
x)
>  	volatile unsigned int *a;
>
>  	a =3D __ldcw_align(x);
> +#ifdef CONFIG_SMP
> +	(void) __ldcw(a);
> +#else
>  	mb();
> +#endif
>  	*a =3D 1;
>  }
>
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index d5eb19efa65b..a1fc04570ade 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -471,8 +467,9 @@
>  	nop
>  	LDREG		0(\ptp),\pte
>  	bb,<,n		\pte,_PAGE_PRESENT_BIT,3f
> +	LDCW		0(\tmp),\tmp1
>  	b		\fault
> -	stw,ma		\spc,0(\tmp)
> +	stw		\spc,0(\tmp)
>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
>  #endif
>  2:	LDREG		0(\ptp),\pte
> @@ -481,20 +478,22 @@
>  	.endm
>
>  	/* Release pa_tlb_lock lock without reloading lock address. */
> -	.macro		tlb_unlock0	spc,tmp
> +	.macro		tlb_unlock0	spc,tmp,tmp1
>  #ifdef CONFIG_SMP
>  98:	or,COND(=3D)	%r0,\spc,%r0
> -	stw,ma		\spc,0(\tmp)
> +	LDCW		0(\tmp),\tmp1
> +	or,COND(=3D)	%r0,\spc,%r0
> +	stw		\spc,0(\tmp)
>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
>  #endif
>  	.endm
>
>  	/* Release pa_tlb_lock lock. */
> -	.macro		tlb_unlock1	spc,tmp
> +	.macro		tlb_unlock1	spc,tmp,tmp1
>  #ifdef CONFIG_SMP
>  98:	load_pa_tlb_lock \tmp
>  99:	ALTERNATIVE(98b, 99b, ALT_COND_NO_SMP, INSN_NOP)
> -	tlb_unlock0	\spc,\tmp
> +	tlb_unlock0	\spc,\tmp,\tmp1
>  #endif
>  	.endm
>
> @@ -1177,7 +1176,7 @@ dtlb_miss_20w:
>
>  	idtlbt          pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1203,7 +1202,7 @@ nadtlb_miss_20w:
>
>  	idtlbt          pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1237,7 +1236,7 @@ dtlb_miss_11:
>
>  	mtsp		t1, %sr1	/* Restore sr1 */
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1270,7 +1269,7 @@ nadtlb_miss_11:
>
>  	mtsp		t1, %sr1	/* Restore sr1 */
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1299,7 +1298,7 @@ dtlb_miss_20:
>
>  	idtlbt          pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1327,7 +1326,7 @@ nadtlb_miss_20:
>
>  	idtlbt		pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1434,7 +1433,7 @@ itlb_miss_20w:
>
>  	iitlbt          pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1458,7 +1457,7 @@ naitlb_miss_20w:
>
>  	iitlbt          pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1492,7 +1491,7 @@ itlb_miss_11:
>
>  	mtsp		t1, %sr1	/* Restore sr1 */
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1516,7 +1515,7 @@ naitlb_miss_11:
>
>  	mtsp		t1, %sr1	/* Restore sr1 */
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1546,7 +1545,7 @@ itlb_miss_20:
>
>  	iitlbt          pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1566,7 +1565,7 @@ naitlb_miss_20:
>
>  	iitlbt          pte,prot
>
> -	tlb_unlock1	spc,t0
> +	tlb_unlock1	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1596,7 +1595,7 @@ dbit_trap_20w:
>
>  	idtlbt          pte,prot
>
> -	tlb_unlock0	spc,t0
> +	tlb_unlock0	spc,t0,t1
>  	rfir
>  	nop
>  #else
> @@ -1622,7 +1621,7 @@ dbit_trap_11:
>
>  	mtsp            t1, %sr1     /* Restore sr1 */
>
> -	tlb_unlock0	spc,t0
> +	tlb_unlock0	spc,t0,t1
>  	rfir
>  	nop
>
> @@ -1642,7 +1641,7 @@ dbit_trap_20:
>
>  	idtlbt		pte,prot
>
> -	tlb_unlock0	spc,t0
> +	tlb_unlock0	spc,t0,t1
>  	rfir
>  	nop
>  #endif
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index 4f77bd9be66b..e2b4c8d81275 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -640,7 +640,9 @@ cas_action:
>  	sub,<>	%r28, %r25, %r0
>  2:	stw	%r24, 0(%r26)
>  	/* Free lock */
> -	sync
> +#ifdef CONFIG_SMP
> +	LDCW	0(%sr2,%r20), %r1			/* Barrier */
> +#endif
>  	stw	%r20, 0(%sr2,%r20)
>  #if ENABLE_LWS_DEBUG
>  	/* Clear thread register indicator */
> @@ -655,7 +657,9 @@ cas_action:
>  3:
>  	/* Error occurred on load or store */
>  	/* Free lock */
> -	sync
> +#ifdef CONFIG_SMP
> +	LDCW	0(%sr2,%r20), %r1			/* Barrier */
> +#endif
>  	stw	%r20, 0(%sr2,%r20)
>  #if ENABLE_LWS_DEBUG
>  	stw	%r0, 4(%sr2,%r20)
> @@ -857,7 +861,9 @@ cas2_action:
>
>  cas2_end:
>  	/* Free lock */
> -	sync
> +#ifdef CONFIG_SMP
> +	LDCW	0(%sr2,%r20), %r1			/* Barrier */
> +#endif
>  	stw	%r20, 0(%sr2,%r20)
>  	/* Enable interrupts */
>  	ssm	PSW_SM_I, %r0
> @@ -868,7 +874,9 @@ cas2_end:
>  22:
>  	/* Error occurred on load or store */
>  	/* Free lock */
> -	sync
> +#ifdef CONFIG_SMP
> +	LDCW	0(%sr2,%r20), %r1			/* Barrier */
> +#endif
>  	stw	%r20, 0(%sr2,%r20)
>  	ssm	PSW_SM_I, %r0
>  	ldo	1(%r0),%r28
>
>
>

