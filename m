Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05725C6EE
	for <linux-parisc@vger.kernel.org>; Wed,  8 Apr 2026 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670140; cv=none; b=GGgAU+Ceaj4vVOp4/7mMqOcMsoOTGiYfDHN3A1IJErrGwt9PxXt0fADS0wopzbp7FyVtPRhXf6GQViiC/XSPnwkeFTWY8R+mR2KXC2X54aGa2FEj88TeBCxSUXs1e/tDq3S0Q5yN13rsMopnhsf1uZf/LiSqy/FodPXTj6Qnmo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670140; c=relaxed/simple;
	bh=t2OunORlO4yTvdabAEMrYRDM+wCVehFkLt8Zr57nc2k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k+l1FuYaTiS97EQ7bsrj2utYytOb/LGKO4COHaIaynemDtFsMB5meYjSpY5woP6ZAnDC1wsvEU0AIGpIVk4lcXDXhVT1HpbAHDOsEpYF+4fHOIRH8juynKZcuqRLCUqlMPu6UN1LveOrdPG6R+PYNyM9BgjEe3N+pdjh6R9hOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQcUqSrB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQcUqSrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775670138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xI4iYA3W/6RuqiE3tYj1EUQmEH89wB9907/o87/V2Mc=;
	b=MQcUqSrB5gyEwhxu41k/Kwmh5e7XLKh/49lvcMoNblS9P+0HADQ7Ctr6O2i5Ztz+BySK3m
	A9sPpp18i8NcjiO/N1CbKCHGQ3s109+gEy60CvV//H5CSwdUAmWSKIJ5TWwChzYdH2pF4J
	4GnHDf9TaRn34mo5QBmDIUPiDTAtmK8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-NZ331xRjNN6cyib4kzUO7A-1; Wed,
 08 Apr 2026 13:42:14 -0400
X-MC-Unique: NZ331xRjNN6cyib4kzUO7A-1
X-Mimecast-MFC-AGG-ID: NZ331xRjNN6cyib4kzUO7A_1775670133
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B1B01800245;
	Wed,  8 Apr 2026 17:42:13 +0000 (UTC)
Received: from [10.44.33.90] (unknown [10.44.33.90])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A987D180035F;
	Wed,  8 Apr 2026 17:42:12 +0000 (UTC)
Date: Wed, 8 Apr 2026 19:42:07 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Helge Deller <deller@kernel.org>
cc: linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/5] parisc: Avoid compat syscalls when COMPAT=n
In-Reply-To: <20260407222714.178861-1-deller@kernel.org>
Message-ID: <89d620a0-f6b8-60ea-d423-77b0094756d6@redhat.com>
References: <20260407222714.178861-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111



On Wed, 8 Apr 2026, Helge Deller wrote:

> From: Helge Deller <deller@gmx.de>
> 
> Drop unnecessary code and syscall tables when we run a 64-bit
> kernel with conpat mode disabled.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Hi

Where can I download 64-bit parisc userspace? I am interested in trying 
it.

Mikulas

> ---
>  arch/parisc/kernel/syscall.S | 11 +++++++----
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
>  	LDREG	TASK_PT_GR30(%r1), %r19		/* get users sp back */
>  	extrd,u	%r19,63,1,%r2			/* W hidden in bottom bit */
>  
> @@ -1326,16 +1326,19 @@ ENTRY(lws_table)
>  END(lws_table)
>  	/* End of lws table */
>  
> -#ifdef CONFIG_64BIT
> +#ifdef CONFIG_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
>  #else
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
>  #endif
>  #define __SYSCALL(nr, entry)	ASM_ULONG_INSN entry
> +
>  	.align 8
>  ENTRY(sys_call_table)
>  	.export sys_call_table,data
> +#if defined(CONFIG_COMPAT) || !defined(CONFIG_64BIT)
>  #include <asm/syscall_table_32.h>    /* 32-bit syscalls */
> +#endif
>  END(sys_call_table)
>  
>  #ifdef CONFIG_64BIT
> -- 
> 2.53.0
> 
> 

