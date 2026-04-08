Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D60386C3A
	for <linux-parisc@vger.kernel.org>; Wed,  8 Apr 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775661733; cv=none; b=ghSjvHbeOx1qsBWW0IBMSU3HHg//VQVkJRX+A6SqNbchZBnlXAElB4HeqyX5mQFPSUfdlOrpHya/5hcNhgA47pCcQjgo8XQwGFkhyQ/MQ5D6ofEwDQQJkpXwwim+x+xKgZDfZxlF7qWJTjfQKZ5xR5lrfAIV3FFnM93rhYq5QzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775661733; c=relaxed/simple;
	bh=3ZBNgfTtE1VRNe6zSW+rs1AkAHufTMTNwkWV/vlNDo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op8frdGgixXpRi4ovU+EmFrxAVDKE3tE1lWefnutzWkAXymFJvofnlr9idEM+7VpcUlukv/8W4h7VjwbFcTqH4mgVTE+gNNKS5+EqgHDGr2EmhR6Zwil5fGYqGXxBoMphfc2K5t5bif2cqg7h7o/1g3Xav18HWRV9a2j0jBRMd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=Gh35k8Mz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="Gh35k8Mz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1775661729; bh=3ZBNgfTtE1VRNe6zSW+rs1AkAHufTMTNwkWV/vlNDo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gh35k8MzQ/s/iISPgOI2rDaWL9535hJSlo7s5E2zNcP4CyJc2l4ABQMHS4p3X2P4o
	 tfznMgJmR5Vo20M9t2aaSk6WqYsk+k1Z4To0nuozRdFA360I1Z0M6GgtKdUorYX6Hk
	 wDofLU8bs9JvB409qaC8eUFm5ozgXrK2jaHmV+Ic=
Date: Wed, 8 Apr 2026 17:22:09 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Helge Deller <deller@kernel.org>
Cc: linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/5] parisc: Avoid compat syscalls when COMPAT=n
Message-ID: <befbf96a-6a06-4f7c-96f7-12475ca867ee@t-8ch.de>
References: <20260407222714.178861-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407222714.178861-1-deller@kernel.org>

Hi Helge,

thanks for these patches!

On 2026-04-08 00:27:10+0200, Helge Deller wrote:
> From: Helge Deller <deller@gmx.de>
> 
> Drop unnecessary code and syscall tables when we run a 64-bit
> kernel with conpat mode disabled.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/syscall.S | 11 +++++++----

The series currently does not disable the 32-bit vDSO when
CONFIG_COMPAT=n. Is this intentional? For me it would be convenient
disabling it to avoid the dependency on a 32-bit toolchain.

>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index f58c4bccfbce..bc5421ca537f 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -241,7 +241,7 @@ linux_gateway_entry:
>  	/* Note!  We cannot use the syscall table that is mapped
>  	nearby since the gateway page is mapped execute-only. */
>  
> -#ifdef CONFIG_64BIT
> +#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)

Shouldn't this also be just plain '#ifdef CONFIG_COMPAT' like in the
other patches?

>  	ldil	L%sys_call_table, %r1
>  	or,ev	%r2,%r2,%r2
>  	ldil	L%sys_call_table64, %r1
> @@ -250,7 +250,7 @@ linux_gateway_entry:
>  	ldo	R%sys_call_table64(%r1), %r19
>  #else
>  	load32	sys_call_table, %r19
> -#endif	
> +#endif
>  	comiclr,>>	__NR_Linux_syscalls, %r20, %r0
>  	b,n	.Lsyscall_nosys
>  	
> @@ -374,7 +374,7 @@ tracesys_next:
>  	/* Note!  We cannot use the syscall table that is mapped
>  	nearby since the gateway page is mapped execute-only. */
>  
> -#ifdef CONFIG_64BIT
> +#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)

Ditto.

>  	LDREG	TASK_PT_GR30(%r1), %r19		/* get users sp back */
>  	extrd,u	%r19,63,1,%r2			/* W hidden in bottom bit */
>  
> @@ -1326,16 +1326,19 @@ ENTRY(lws_table)
>  END(lws_table)
>  	/* End of lws table */

(...)
