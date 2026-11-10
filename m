Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289195;
	b=3P+pct0RteJmqVLv8yEvurKwz+3oEfOGdOcRC6vSVYUMpWXKLyEdNBM3m7cNq8MYlPDA
	 3Gn67LHGgoxBNYs0I9elbgGlkAtc8VClVU8LqZMqDa0X9/tLtiWNiOkwtacRbgaHBfp4I
	 v0WQ3kCqBFwcLaNz2XEXutcynwwp6xoki2/h28FcUBrCNxWnSqM4YHwJfh7podq1jmvdj
	 LiM0SVmO9FWHsLM4WqvYjTqNZXs/fd5GrnextP6p6U30TAbI1IxBMqgd3jecbhM8IR25A
	 oI21/IJVNKvut5sTpkJU7pvJ9DIXKOuyrXzDhHPjMZl3um6YuAiDFDOCq2B9eyGaPsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
	b=kCi2Mc6nEmHRA6PGIUO3PFyts46TQeDMfq2ObbhLB0bXnhJKen9roOEu38aeOXtAFsAa
	 T/vWgb88xg1PEvWZ8B+DYXSl2W+v4Og/Rbdq7GZ4i6y1xcFXuHoe1EyltHHdmbdAYhBnA
	 j2ShDYYaJeiNYU65sCuFj0cyBDbaedqu2STnAmyeGRZzcE7FDf42Mzrf5oyY0xNAcNI8i
	 VX5xXu8CKmMQwY4qCfEzjXbaiZxBrSMHH3Uc4Cjp9rqJHCHR9RHzckq35BcN1uzdfHTq5
	 VO9fdoQzNsO2iY5LUaPEhu4Q6jNBnG64jN7luTuxf3+4XJSghxF6Djxah9yXaNnsMfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nYCjfLCg;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271D606A32A
	for <linux-parisc@vger.kernel.org>; Tue, 10 Nov 2026 05:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E271D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nYCjfLCg
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so921616a91.0
        for <linux-parisc@vger.kernel.org>; Mon, 09 Nov 2026 21:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289194; x=1794893994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=nYCjfLCguMBjFt7Df/pwcAS/GPhBqgvi5e16XKr+oU3FTl4s7XEOa/w4lwVhENYNEy
         6HUfXInt0Qich4WYX2Rx0OD0rQnYQrTfrGD4byFmAPHBXNocTXgLKiro4pJRUUMPvCHC
         Ilr6Z8eXaJfgpRD2l9SSOO7VTdw3nLqZlt0Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289194; x=1794893994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=oPf6VjctCO9cHmYsrldbGvqlrnrZEFEwGzlaEQPKJzZWKEVq1GwhGGEO1rTkdUPiFk
         C7tvVLncY8gIF6LkZETEIHbJpphqv0OKTNtaf3OuLNyp8nq4CIn9ObTx7d+1eX3q7X4T
         EoB5DjI0pVKJq1+MRpUPeA/TOiBkFowgj1dgUxkq9TSirQMSqQWFqd1ccC9KAJSukdEs
         xhph7jmXpxD7Rdfcl7+wgR5o6d0QfMY34mFQh1mlm/WsDhkGIOsQyHehjkmqIcX+BJIw
         39JcrcFjC+PF2UE2JwNbYIiGxywC5/mIAZWlfv/vFhyd1EpytddFHKLzqVInNLQY0qJ1
         om0A==
X-Forwarded-Encrypted: i=1; AL+hErF6Y/rOv3tsFyb33LhBY4/x5Xk6VZBT2pjWYFwDRvwbrzGghDRj0W+dH6QTD7ttfoVqxZwSbHHTpozaNEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rt7vT9s19a/nxngb0KXwxSjasQgH4eHD+brYcBR30RULLJsgU
	CQIoLocGowjANwtXTQx+8cPkWTvik3wvI/JeST2PkdJz+GICUa/GtopMICJK6zqzrg==
X-Gm-Gg: AYBFou2o9msQsCSUFMZ+EQwwH6XJmeU5Gpc/R6OGmTTUayykDSHsnP6ZjrsmocQSglU
	FAcaIad2vrxv34LsM5Y7ESAzEOQVwKmjEWX/5m+Q0+ZFjqBrOB4bBIj0wmDHylYdC5xoRsxTC1z
	iS3YMEBHqhESnDgLnzdfuZpdMXcdZIKWQNNDKs2WPMIrFe5jIIsxj0TuVHQPZaZIfutvvHFE8Ln
	2scfGOFnOYD1c1hDBpDDGMzr+haJa+BoTAQ3yRTNMdh/cl5WXKvNuRWxW2pLeHSZiL2qm0NqXH5
	EmpPtO81yCM4MtPzaUFwcsE/tCNnObgWOrOYajPxIlJmTTRyl0wxhbCGY1ItWQ3d9AZxszcwFYu
	skEm6G/7cw415qO5Vp62AqA0aw2DcATxRtnFSjn84GL8YCxXTNPloD5lh+mXYOK9zzJM75nADpo
	31AfTYLImsUchP7ssHLSh/WobZ1Uqp1n3Gcvg3BdMlca5JPnBHPaPcbPZGGIPp1bAZpSaUBbDlS
	XhmhHJIr/2/2zrDopiLzRzQ5hx9blEodGit3H4r8NqZqBPcQPoi+31b3lGyPflEgXQC6pDU1ojg
	KtCrLP22fIF/Ez+72F7cEte0Stin4rZgB+O4p6k8wtuqxEoAROGHdxWjIl36aLMfw5lWm+pBhk6
	NslbSHAv7ioQ+Kqs=
X-Received: by 2002:a17:90b:380f:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b166d02addmr1882552a91.34.1794289194303;
        Mon, 09 Nov 2026 21:39:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168ff86e7sm1041404a91.2.2026.11.09.21.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:39:53 -0800 (PST)
Date: Tue, 10 Nov 2026 14:39:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Laight <david.laight.linux@gmail.com>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 13/15] lib/lz4: switch the decompressor to the
 vendored sources
Message-ID: <avKtyCOOmK3AH0xy@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144310eucas1p1d60fe5c2e0170c49f38a3142bb1d8f94@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 50265e3ce256490994cb6dae32a45da376e408e0..b9b8a5f678c155442fa3fd2c1984e45182e6fc38 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -84,7 +84,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;
>  
> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
> index e7ee3740219852f079d1e0866da6b213a3f3a583..1e09c93016264259c149e2913b2819571b56fab6 100644
> --- a/drivers/block/zram/backend_lz4hc.c
> +++ b/drivers/block/zram/backend_lz4hc.c
> @@ -65,7 +65,7 @@ static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;

Ditto, outdated zram code.

My ask would be to not squash zram changes with lz4 changes, when (iff)
possible.
