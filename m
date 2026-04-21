Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD742853F3
	for <linux-parisc@vger.kernel.org>; Tue, 21 Apr 2026 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776754156; cv=none; b=nfFh6ARq4sMUW7ZaKPNLr8DCwwlVZnRsYD7YdiS34ysiilijY6/f4AfDFOj0grHVRgzO2j+D+3PV7k9ZQCJnQvXAnEly9BoaQZfblbLl86RnOsZ2og/43oQ34ciGIY3P/QoGfY4QDz7mRPKZY3bQer5ApYB4bOjHcwUIv215yxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776754156; c=relaxed/simple;
	bh=am3smhs96M1Iz0Y0JDciE1ZjrAK1dDbEC7UccjVq/eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fM1ODxoP6B9w3OWRJofvwsB6JAxmetUtBF6t/Kgwg5mOFDmzrcyLHj+C9qcberyJ84qvogcqKVU4bNpf+B2YRvPMOQafyU9TD7PniTUsqG1NVyx9a9Ja5KFQ94QD1/b3ly9RMf9Y/ZTs6wDQaYG/8pvFm1f+U2zh8QjAKjVIqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4HdCsEQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4HdCsEQ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so2678091a91.1
        for <linux-parisc@vger.kernel.org>; Mon, 20 Apr 2026 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776754153; x=1777358953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdNywBu7apdyTFV9cnt3GZxXLndr1pBULjY0WptzCm8=;
        b=J4HdCsEQzBF52HS7kv/2N9GJ8av6ANJwagpeEgdEx1yRdELMEGjQ4U1u/N87NO4FNi
         O6KdpnQd2wlsQteyBgo3JKT5dhLZvpI1wyEsq4drfOlNwbEJ6WcOJKua2hfbgUn7f/qO
         TzEOq5j4q1kIqn9Y+uIFyo3FhWMNPvAyfGSeTx2OrK0/Srjf3V26Ep8QZ8qfFqhXNK/n
         ZxjbuMVDQk5kg1icO+a9j//B79M0Kg9jntS58arF/1IdYz8rvP1GqYJvmDueJh+a2H6V
         AcrX5EqwWq4kixz6oUFeG2btwWnpqWtN0xGCez+9Lm3iTdeVYKxGHu2/uM273h/aIkCV
         n8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776754153; x=1777358953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdNywBu7apdyTFV9cnt3GZxXLndr1pBULjY0WptzCm8=;
        b=iHC4WiRAj63XKu9KbKxpaN4ZU3L3EK5lHYXpMQZBwqAGIS7n4VtHzCMgtqTOOoO6HG
         bp5rla2fi6ztLy5hluXKdfvZl2M7YTW3lWsNA+18u/Z1jPvVnV9I1jy04fNbTWfAvr1f
         dxjhYtcea8q7wXAmkUpMEgevMBmc2GBFFyq8xmkqIFaqpColw34LqKCxTmlL4/HRnG66
         PWjmKEwLWkxgcmgyGGp/0ujthME294aS9F1yzW2CwG7hJ2i8uv3grrudQwL5iKGX1pE7
         hQzF5OrlabOmP61e5F/IDLSRY4J8EWXDXxN9Fy0fYx+5KjdEgyFKFXL8mUe1zo7xz5qL
         u+xw==
X-Forwarded-Encrypted: i=1; AFNElJ8RtXwahwCVlmhUjcSuVJYpFdi3ke+jVe7DMJ4n0RlFHoKybdM2zwub7vfCKGqPPv0ExQzRPVWd05GfAUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoFxUATXOz4+Kx8g8vJBFhUeP6dhY7LQ6ia0zFRN36Wou/4RuW
	aJUX8SRPmf5D0vEVMG5XmWpvCca1Q8m2rrmiqk5QyuJzbc3fyh8M5WQ1
X-Gm-Gg: AeBDieuAR4QdHzvq3h9cD7vwzFHTN3LMwBMInYGYOcNwOcwMGTvfQdLKaH1FMQs/3wm
	/RlRXztagcapAkj/HM4aHFl6Ee4eZomjNt2tKdb4Dyw0j/iVPYbUwZaAtPkM/M/vQNrz13OUd1J
	iPWQLrxjgsF6jmkxZRlVqvUlEhg+V702hzhqAIOthlD1vBReb44KuNISFb+9vj6XXgcYOAxcbSo
	FzRSWQWQzVVHXtyyLH2GXjw5rtkQ84vkcxIwcZOQoKts4rpdtArQUNB3uaXv3FQNbiPvtQA/erF
	p6MoTV7Y59rYRrFBvVLY2KsOPrnO0QfrS2OwhDLc06hilND0J6vfxlfX2/8rqTfDDp9HKmcMBoT
	wfGTo10TDJofdkypr7Ob/WTGMM0Dl3Pk7zdpebmGOWnsbPDFoimaPC/SGp4vBDJLY4XEs6t8dgr
	akoxZFL1PfthSVBeXFCRmHZNDJ665Rgz5KoUEJ4jOK7Jo4S2Rrc2qr4WIOY5Wh5yuzcpRGyBati
	Gjd9tZJRo3CQbw7
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr16891174a91.10.1776754153374;
        Mon, 20 Apr 2026 23:49:13 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm12278674a91.12.2026.04.20.23.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:49:13 -0700 (PDT)
Date: Tue, 21 Apr 2026 12:18:55 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>, 
	linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 32/38] powerpc/spufs: Use mftb() directly
Message-ID: <aecdpyvTLJOjCdFp@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.723429844@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.723429844@kernel.org>

On Fri, Apr 10, 2026 at 02:21:04PM +0200, Thomas Gleixner wrote:
> There is no reason to indirect via get_cycles(), which is about to be
> removed.
> 
> Use mftb() directly.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/platforms/cell/spufs/switch.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- a/arch/powerpc/platforms/cell/spufs/switch.c
> +++ b/arch/powerpc/platforms/cell/spufs/switch.c
> @@ -34,6 +34,7 @@
>  #include <asm/spu_priv1.h>
>  #include <asm/spu_csa.h>
>  #include <asm/mmu_context.h>
> +#include <asm/time.h>
>  
>  #include "spufs.h"
>  
> @@ -279,7 +280,7 @@ static inline void save_timebase(struct
>  	 *    Read PPE Timebase High and Timebase low registers
>  	 *    and save in CSA.  TBD.
>  	 */
> -	csa->suspend_time = get_cycles();
> +	csa->suspend_time = mftb();
>  }
>  
>  static inline void remove_other_spu_access(struct spu_state *csa,
> @@ -1261,7 +1262,7 @@ static inline void setup_decr(struct spu
>  	 *     in LSCSA.
>  	 */
>  	if (csa->priv2.mfc_control_RW & MFC_CNTL_DECREMENTER_RUNNING) {
> -		cycles_t resume_time = get_cycles();
> +		cycles_t resume_time = mftb();
>  		cycles_t delta_time = resume_time - csa->suspend_time;
>  
>  		csa->lscsa->decr_status.slot[0] = SPU_DECR_STATUS_RUNNING;
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
