From: Kyle McMartin <kyle@engsoc.org>
Subject: Re: [parisc-linux] [RFC] head.S merge, take 2
Date: Thu, 5 Aug 2004 22:01:25 -0400
Message-ID: <20040806020125.GA16906@engsoc.org>
References: <20040806015554.GA5319@leibniz.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040806015554.GA5319@leibniz.int.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 05, 2004 at 09:55:54PM -0400, Kyle McMartin wrote:
>  	/* Load the return address...er...crash 'n burn */
>  	copy		%r0,%r2
>
	This tested fine both 32-bit and 64-bit SMP, so I un-#ifdef'd
	it.

> +#ifdef __LP64__
> +	load32          PA(init_thread_union+THREAD_SZ_ALGN),%sp
> +#else
>  	ldo             THREAD_SZ_ALGN(%r6),%sp
> +#endif
>

	Using the 64-bit load32 caused a corruption of the C3000 LCD and
	seemed to hang the box, didn't want to tempt fate.

> +#ifdef __LP64__
> +	/* Prepare to RFI! Man all the cannons! */
> +	tovirt_r1       %sp
> +#endif
> +	

	I'm not sure why we use tovirt/tophys on 64-bit, but not
	32-bit. Could somebody enlighten me?

> +#ifdef __LP64__
> +	.align          256
> +aligned_rfi:
> +	ssm             0,0
> +	nop             /* 1 */
> +	nop             /* 2 */
> +	nop             /* 3 */
> +	nop             /* 4 */
> +	nop             /* 5 */
> +	nop             /* 6 */
> +	nop             /* 7 */
> +	nop             /* 8 */
> +#endif
> +

	This caused 32-bit to HPMC. Figured I best leave well enough
	alone.

> +$rfi:	

	Oops. Was going to branch past the aligned_rfi...
	
> +#ifdef __LP64__
> +	tophys_r1       %sp
> +#endif
>  

	Ditto.

Regards,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
