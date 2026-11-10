Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289021;
	b=OIWFm5hsutESAZa91F7wIkYw8KQnwq9VkNoCyCwXofCAHUXyJTbjoLrF0zdFOPxsMf2t
	 pHlauOvaFQ+R1GwYzh/M8p6kB+X1zX8qNmnDhRXwx7qQeQb/zxSmomZvD2loUJkSdFzRD
	 SVMxcoJanP+mTHZjYO2Om2JP96UPllyGD9fnQSNMcEkz5l23TaypFN+uqanHqwpF0YuwX
	 EZY9bk1EsJ3e7mUbGe4mB75BH2//7oFbbXoAmFnoTHkQmzNDECFxoEr8wSqQ3fZYWRHTG
	 VDV2hCrO65TWt5c1zBZCDrqrVFZuh63ntIUxAbPTtb7UKlQkyOFTcZHnDFpe4s1AezA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
	b=x9h67FZso47d7ob2divVszLcEH2RZcQwdr6ThlgdRVS73Qa1c5F3xvlSOKQRYQaNPsCb
	 5m7Hs52MctFY/T7CfO52xbWeULEEXxHjuSuMkzWJQ/S4uEUqs2/AbuUsD7BmP1WK5i4su
	 4egaHyS2QpE4261wsirQYJgiNoXyKf+jZ5nTr8ufQpFP0bqkhZXvRuq9SJeFD9v9GJ18d
	 ASZz2uLdVcGxLBycESEbL9CyD94vvQgNePjWNOUIH85XOLPAtfY0barplSNbri5Jt98p0
	 uBGlnqYl6D8jS4WFNPrBP3MdiXL9B4xrzBn9LAxjEf9zRaXijjTMhaSs1nVbUX7416g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a20xVX7N;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E572E60A2620
	for <linux-parisc@vger.kernel.org>; Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E572E60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a20xVX7N
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06e79e152so842072b3a.0
        for <linux-parisc@vger.kernel.org>; Mon, 09 Nov 2026 21:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289019; x=1794893819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=a20xVX7NeZjvXNyM41dYWvLkg80id1Mtm74DkyBWYfM0GGXgLb8i1+nApuqtrL8uLo
         zE4qrJ3gNwkeUVWkpUNiFHGrdIzZeRo9Bur+lQwMh5IboV/ahqD2hnLAdr9gSwVdEq52
         47ewJ4dnUp54hAJDfsvJlQHVaRbFtqFrQtWkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289019; x=1794893819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=JN9DvrqgjffGa02LICao+M0bDLMmONXVk8KZ0fLqt/Ehjlv/y+r4cgdzDtTULwHM6V
         Ur+I18LmlrfEZ/LH1k6yhMobr5d3cb1I6d97PW8j42fZ8yACiZKG9s0/X4pPfEE2K+uv
         PicTgJn4XxVCTZBF4ilMLoF9XBwIe2B0g29lUHG+HWnhh69cR27pfPzTjYJwHfe65G9z
         2YE6QPx3amFvtbP5E0wJ+Os4BtIGgf/CoYR4BOkLJLo8dPatdZz19IgzUt5NaGtqqNU2
         tpuAQkVin83r9m8ExSRDH4q8+8h2uPwrD7WEaAbizrtqGfihfFf3jQr4nJMzzYkYg7Ru
         UHVQ==
X-Forwarded-Encrypted: i=1; AL+hErF9R1Gb6QTQqBMbNdMJyi0MZXifdluDLPYwX64nPfB5P3xeE+t45j1goCeMpTRJOmNpFNNdxFzx3TDICY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u0RHs0u5ozYF/tcaZZujp0AnWI5KQsaA/Nm/TBlYQgAfZksn2
	LaYO21ccH5I/khyOUhEUpiPg+Cl/dLt7MNJbR51G2622ZuTqUo9uGi7hdiiO2L2PXQ==
X-Gm-Gg: AYBFou2i62f0GiY6LLwrs7HGxkg+5FXKrhxHGrhFA7eIoESwKvl14aSt0JkuE8WWy+G
	yrMlvorOR5HeLbq5LgOt2N8AIu0ohhPzk6aXitidbPN6zSDpywdek+54wSDOVTh5AYbTQayE2Im
	HNtVj9RvNrQ7fwuS4TFN1vE6H/0ogpZyBt8CkH2sDgor76/1jwgqMPJEnSCkqCpmmgcYcUTIEl2
	k5JbKXuYa5wY5l/RC2q9lzyEh5S3TpihSm4ETkIBYmmNXZXU6LOEp/NpNSpmMTbQrqgE/KGo3T+
	N4t/f92Ujzul4Z9RO3PnAuNNNztLGlN/XR6LjOGdeU7iSG0gbaXIZiVu+cQeb/FhJ81zxBVZBg1
	rK4I0Xa1AHzM4TnOsvd4Z+YGEgq4fPTgK9hPZm8xR9R66e4SMlHHxaor2zk+RUl49iMuRDCsaul
	lpOxonmEiaSa828Y7QeQ4K8wq78GD3mD97JuWmR4c4BduioQmg1rWArwmxPfqEFBZGCwakl+i12
	6IbTEII4P84VTa0VxZkc2Wm1M0bVaAf+8di77QtR388XWUyFzt2vs6VFwgeqSjC3pr7DppFBWji
	YOa/8LOs3LIeDEyctoVj96o3fQgZ6LqmaDqmcue4yVDnZ1uuUZM+B9OBPJIODQcq2GRg6w==
X-Received: by 2002:a05:6a00:1492:b0:89f:5c84:46ec with SMTP id d2e1a72fcca58-8ba89661da0mr1558178b3a.40.1794289019108;
        Mon, 09 Nov 2026 21:36:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm405355b3a.52.2026.11.09.21.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:36:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:36:48 +0900
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
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored
 sources
Message-ID: <avKs4_S7r6EiUVgC@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
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
In-Reply-To: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 1e4ad31d39a63f45b3bddd3d8a467d8d7d095beb..50265e3ce256490994cb6dae32a45da376e408e0 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -42,7 +42,7 @@ static int lz4_setup_params(struct zcomp_params *params)
>  	if (!params->dict || !params->dict_sz)
>  		return 0;
>  
> -	dict_stream = kzalloc_obj(*dict_stream);
> +	dict_stream = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  	if (!dict_stream)
>  		return -ENOMEM;
>  
> @@ -88,7 +88,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->dstrm)
>  			goto error;
>  
> -		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
> +		zctx->cstrm = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  		if (!zctx->cstrm)
>  			goto error;
>  	}
> @@ -112,7 +112,7 @@ static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
>  					zctx->mem);
>  	} else {
>  		/* Cstrm needs to be reset */
> -		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
> +		memcpy(zctx->cstrm, params->drv_data, LZ4_MEM_COMPRESS);
>  		ret = LZ4_compress_fast_continue(zctx->cstrm, req->src,
>  						 req->dst, req->src_len,
>  						 req->dst_len, params->level);

The zram code here is outdated, it has been reworked quite a bit
(patches are in linux-next and Andrew's trees).
