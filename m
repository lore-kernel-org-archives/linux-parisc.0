From: Andy Walker <andy@puszczka.com>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Wed, 27 Apr 2005 09:18:31 +0200 (CEST)
Message-ID: <16467.193.160.141.5.1114586311.squirrel@www.puszczka.com>
References: <20050425165540.GD12325@colo.lackof.org>
	<200504251744.j3PHixu9015886@hiauly1.hia.nrc.ca>
	<20050427022925.GH2612@colo.lackof.org>
	<20050427052055.GJ2612@colo.lackof.org>
	<20050427065822.GK2612@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: rhirst@levanta.com,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20050427065822.GK2612@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant,

> +++ include/asm-parisc/assembly.h	27 Apr 2005 06:27:59 -0000
> @@ -450,5 +450,23 @@
>  	REST_CR	(%cr22, PT_PSW	(\regs))
>  	.endm
>
> +#if defined(CONFIG_PA7000)
> +	.macro	pcxt_ssm_bug
> +	/* Create a "relied upon translation" PA 2.0 Arch. page F-4 and F-5
> +	* The ssm is necessary due to a PCXT bug. Ie not needed for 64-bit.
> +	*/
> +	ssm	0,%r0
> +	nop	/* 1 */
> +	nop	/* 2 */
> +	nop	/* 3 */
> +	nop	/* 4 */
> +	nop	/* 5 */
> +	nop	/* 6 */
> +	nop	/* 7 */
> +	.endm
> +#else
> +#define pcxt_ssm_bug	/* Thank $DIETY. You don't have brain damaged HW. */
> +#endif
> +
>  #endif /* __ASSEMBLY__ */
>  #endif


Make that $DEITY - or is this the weight-watchers version ;-)

-Andy

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
