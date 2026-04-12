Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A5237C916
	for <linux-parisc@vger.kernel.org>; Sun, 12 Apr 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000186; cv=pass; b=LVDUYXY2IMImROpw3MAyzH7PSPgpSxDyAgLdpYa27UdqvmxLTWKbunRnGpgcLOM0MVBB7DIxu3Ao/iwgGhRVJNLzVF/ybhZqxEx0SNN20gLw7QaqMjrYNp11UUdPplXTPXCIEGn3yS81wS3Sqmj2eq93AvM9K4w7XA2xFUScCjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000186; c=relaxed/simple;
	bh=1p6x7PvyQL+5PGqdAnx23TY8v0cVXdqCOnUZdmPD2Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSPq1Z8/fHxarQ8dip4s6M3AIHb3v5FPCwpjj7UPOA9tk+zMAlfQuYxN1fU3GXqGOPflLR6paLHXdB4R11veCwXlE5wHkjpjvCDV2N/pgjy9cLqAJKjOUdislADP465nJLbfUyDHo0HtHTX5P4m0swRi3tCxMb5cK8oF2HkM4zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dccArJm9; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dccArJm9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97f9587e6eso465135166b.3
        for <linux-parisc@vger.kernel.org>; Sun, 12 Apr 2026 06:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776000183; cv=none;
        d=google.com; s=arc-20240605;
        b=jMVWtrhEbfTXmKcTl0sBvXn4VyYaA7j5K6sA1o4mz3bMBwGf7Neb2Nm6xnVfASdTR8
         T81PA/GpV4o5eWqcZzwcspbUH8AGaOpBUqGASYMDCLMGxiXNHCpd3HuJBXmRp712jznF
         sdYFho7ZqfcywdtgsSG8hlTDrMnxZGPyfkuQIH3MiC5cCP1oHLJK1ITQioGkTR6VaFy+
         HtWPlXBghE+N9N3WnBrPycBrwhDrd1LYB+psT7ON0xHeWSy46Osmbt/TgqdM+1FTNjNe
         SCb6xP/IsxfH/Q/wzSNXEwiL2tme3WQdcJbqG/dCiNMslfwEeIDBVJM87oqerjmw1Bne
         INmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        fh=M40H9+R0zNAx4S3Xgg9OzjDuzuz9R5xkgHrWo5eRjVE=;
        b=e9wedDlHfdLx/g/f8vco7JgiBg99XRMtx2mfmIHLXeOyT13MsmAkgfkjV00V22/NI6
         4rPipT0E8CnjvMZ/iTuF2BfjCcCi0yg3kFnDgHCTzdkO61F4oULVt+LmhDi+FT2zdIOq
         81CTxXSPxP/T640V24AnLQERmnSQWKJEa9YUi6JOw//pdda8mhuozdlJE/t0JVKOjfil
         f+Of6MqQ5le2L0R4IAB5B0XDctBY7R2lQqrgq9qmN/CL2+T/Yu4KgH93Z7/OCKhlDFU2
         +9SENE7l5CF2b6Wgtu6uScrjyJoY0/2erTjy+t1UkAgSiJZSZ9YYvZbVyadRih9Smbl5
         QTEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776000183; x=1776604983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=dccArJm9v6h9Fdk8lDGNWZnQG14AQ9ZokHDnv7DAL1GW0R6BDoMR0waR0wHnO++sNY
         YJPJSDf/Eo4Jqw4GQ8Gz/T/rsLkNap5uTZ+EpwANfeQ1dFGXyG88+fN/49+h4JvC9C7c
         2+asFn0yzVsL4n2hJqrH+GINWtCINsNrMCDz6yHqeLWKks0EsNy7ssNes4vhdFLCd+tg
         k2Ys2/EuxonOOeyCkSNs/L20e6zSdmHhXIY25hzHxXat+VjZowRiCo0VNk9bdjlPvxYt
         DV9owUMCQ8VWv/4Ldm8HtUCj9QQlhYJyZr8JnJBv87EbzYIfO7KpnQu2sRPezsHrfV9J
         1U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776000183; x=1776604983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=s9zFlpvzqCDllsl8Wm0rLMMkP0f6mlz/rpi1racQYuHZcZAagcQ42I2CfMtiL+ZV5I
         W+jyOyrW2Q/v9bFYKSgcr9RXc0d8n8bHt9+7Wotzee4X6WyZLm4agCC9mCAqwZv3TvPr
         GpAqqDIaNoi6QOmYL9i/g6criz53F/uAC6rOQSpCaRutzw9lxWdNuJUrUxi3YirS/QXE
         ng7JpsoocQcp66A4zvl03nVYkAlZNSXeDU8CDShHCEWT2ozYymd2oLgspP6mFbwY7hJ7
         cpDKIepiI3ETMHc4n3IIaXU44UBpecUTd9PtBJqlX7LsjeRXChQnqTODk1+GoUO+SXGT
         gTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCPW7twRYVWNRG7smJRQT+HH+LDNvu9Gh402ZfxhZYbwpCKjSjP2FoWA0AqyC9IGCRLXmEKQySILoMpyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/8utouGErQSdWi1VOUt6mVrOcgjtuBa/hY8/uXuC9jrOS8aJQ
	h6g7Xo1Qc4J2WuCfGaVBVft4VV7djALm6whgME1i1W4FYlybSoh9VELFMqbr4Gy0Ow72UilG/7C
	XT8luHGDSEofwwwcryPunWfSrMgjdXIA=
X-Gm-Gg: AeBDiesTgWqIOnkBwhxReVCtWW4RkLiV2JjpzRoquoGkD0zQxfUkpElyAeon4xwQh0g
	wUUTMDEtH43BwhC9PzBO5OpgMNVLmtwDGu0TJrkGpb2c930q4wyTMBrMkTApTwAOKuwYGsc/Nbp
	NMSuslyunKlvE/H9tAsTfztH1SFir9slhBe3vXDWRHv5ej6/HMtvyebYxKvC2mN8/Qze7fr8Rzo
	cyp5a5LFUX4aHvhVmSw3u8FYJF8JlOabP0o+UQiEfHUw5xDPB1v1udMaJsJxHk6sHrTeiicS6Ds
	MtCETT6RpPWSE4gJyegVd4jMA8lJmL4ddXb5Jt7W
X-Received: by 2002:a17:907:e113:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-b9d727aa4fdmr352963766b.25.1776000183133; Sun, 12 Apr 2026
 06:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.131582521@kernel.org>
In-Reply-To: <20260410120319.131582521@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 15:22:51 +0200
X-Gm-Features: AQROBzAeMsaeSVePCJ__tEd4f2rWAY6MixXzp_fii2b8vyUpLt4xjSbtYzENFaw
Message-ID: <CA+=Fv5S68wZQapeaYTspOfsuGk=nBj60sx-ojHBSqrxV59Q+ZA@mail.gmail.com>
Subject: Re: [patch 23/38] alpha: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 2:36=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch alpha over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: linux-alpha@vger.kernel.org
> ---
>  arch/alpha/Kconfig              |    1 +
>  arch/alpha/include/asm/random.h |   14 ++++++++++++++
>  arch/alpha/include/asm/timex.h  |   26 --------------------------
>  3 files changed, 15 insertions(+), 26 deletions(-)

Hi,

The Alpha side looks fine to me.

I've applied this patch on top of v7.0-rc7, built a kernel successfully,
boot-tested it on an Alpha UP2000+ (SMP) without issues.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
