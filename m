Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519643;
	b=5pbaRMKWAEUMs6WgxViCc2gNRIR3/whnmkY1l0l0bnQrrr3rkB+llfJUX0c2mEMqSDhY
	 149160YsWNfMEyUlBQrjeUa9hBE99hTMtZE6/4MWpnEvkYpUTfoFvyE4qA/dmtbVCaGwM
	 0Kdaz+wRq95FyrZlaBo302fpRAfSX/qTQW4P1580En6AWQGelTIPpRRLIGd3L98/mNdCF
	 7eI7slGueH8iu48JewHjdSFnbU3nFlWe0rcX9hezDkPe3N5EskYwHcT5eHPVVUe/EzHJN
	 cBliL4FWd4zfHh9lFw0q38DUjcSjO/iyjvj27ug4PwL4Zg4nMWM4pP1G2ic7473LwMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1E52rRBP8u+ncjbCqUT3nrle7T+KhDadf0RCfpo4JKc=;
	b=Uhkd3bVzo7fvdsVo6ToaC97XtPtZ9aSyzxdoC/v43foHlsyGq6vCZZwXrZScVI0UV3Yi
	 rZUF+MmzvfYfWscSk7QP+Xvvv8anhdH47ctyOlqCED+vnzrKc1/gtcYagSxwOzJJv/WGA
	 sF4TmRO4UziuBnBbyT1ORGKtP6XBL46xGSP4jY/oarIRQAv/GgwodjQJ8VgWD5HvkrAVM
	 N28sXOf+WXfSATb/2GDYkXjr2QDyAAIa8qoW/zDXtfxiWauXr17UH1qtq934s9P6SXqLC
	 lOnOoksU96GciC6JY7n1HnAVRZ3eMboddYnZrXiempgB2n1BE8m2TGoPghMoDw4yxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTk2vBAR;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115E606A31E
	for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 18:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A115E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTk2vBAR
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3050327f8f.0
        for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519641; x=1793124441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1E52rRBP8u+ncjbCqUT3nrle7T+KhDadf0RCfpo4JKc=;
        b=HTk2vBARdmUyxqB4W/v95PNQGXqVlbOV87oU4nwBN2ydlE3ynmSvbdjTv2Aq0e0hL7
         RKfj6Uq8WPH7iIBYSyrEtN1WiOUzNw87heMp3YaWmzeWkwWHSyisHBisJsgAkOMfn4xm
         W0+xxx8JVjtalQZLEvu7Ta/xZTouACr2mqiwMhB+lHxG7+X8MOEmOe7T7Zgs4rkrxIe6
         D20KGgCovdwto310fVan8KmYBLbLRfYqCgDQwSFXYpq+K3qH6l3ocfDNDuiZDYJVRkPm
         gpA6oJsjNHuxSAuxZVS7wjvfc0B3vGvNo8NCnwXSV5nclAF5fhZjZKrzYviklwR/4vF/
         WkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519641; x=1793124441;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1E52rRBP8u+ncjbCqUT3nrle7T+KhDadf0RCfpo4JKc=;
        b=Z50wHu1r1e1E+KTZy4h1Yq8PYoFDsFLdcFbx/ZbQ1ZS7DPmeS8YYBJu3YWJ96Qe0Lo
         +PDW3g7zi4KKCU+60GlTUk+jWqpUoGUFImmEVA51lQJzPt6G/tlGjHXX8kXMfo/dK8lb
         7p96k2uydaLpSdhZY/7WHcDk8DxycVvxpyT0QtITFRn2aqIwcMe7vN6umTl08sP/rIKW
         0r+dcmPLQfN8c01dln0wiQYU6PlJSaZcpqef4oWut2Amj9cxp8oUPBK24iNmHeS90P+a
         8GkqzodlXfjprn52aXZI/twYrELrp14JNntct4HkjvC48o1h3NZEShKaGEMy1Q1Im7b/
         imCw==
X-Forwarded-Encrypted: i=1; AKwUvBz3yjPlrDoJ6dHJyB+IQDECeK4YSXW0BQuFqauEkIKuCpw8qlSDbKnOKQLce+/tKmyK/3AhoEuOX+GpdxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMXJlu0THeTdsZnQpy+P2+0BuEViircyR381CwFFOl8HJxZSSR
	Tv3OSe+awSK+RGb56QCwKzOJFGTwV8WgCg8LV+MJ1AfKS4dqpGyVCrXw
X-Gm-Gg: AYBFou1Bma8AgjJcmjpcn5fOmV4HE5ZfQDGIoY/lmX/0eW2vaZKcG7+Ivca3HmfOw6C
	bhQnhfWsAXVsCoVgfbh7p4ACEX5CfJV4lfdjTypxDJQcFdTP2gLBc15o70qALFjTj5pk/05S/tU
	Zr9Bya2HasjjbWEqBvXEYSNWspRM/PfKsgu2MvRli+oIof053RgPvPGUH5w40MEHXEbuu6w2vS/
	wLRfHzMl89w3Sx3ORWG1ySJQ+2Kw1cf198UMmR5JuQosL+GhkS4tG8jXJfaLSSc4EfhUZ8cgizK
	/KXFDMcs2rd9WsDpHpU6Cth54OoLHPQr1a4j3cW66ERznKRi8SWrDXhASYTbPRZJV8mgtHE5rqj
	x5sfNA33lfh8fu/rUl1ELgpb80nS5EKiYrSHgWON6ixmPegGPNAl64ECnJwTQm7xCLLsSWkqgNI
	Y7CgBN3ZuDU0aiDHZXY3QXpfgyhjJL24um6+X6fW2mNU4+KKljUKmNEwybPkOtj65sUwF3ZSlav
	dchSlFvVniM7JwvNy61UN5VBaXpBEd6b0nvrg1t4AOqFPZtyhCQboUzMz6TyLzaOwAHsbJOuEzK
	/kekzRUvTG9PhyOF
X-Received: by 2002:adf:e18e:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e07fa0252mr25623423f8f.37.1792519640748;
        Tue, 20 Oct 2026 11:07:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e72sm25163f8f.26.2026.10.20.11.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:07:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:07:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo
 <acme@redhat.com>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc
 Kleine-Budde <mkl@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <chleroy@kernel.org>, Helge Deller <deller@gmx.de>, "James
 E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, "Jason A .
 Donenfeld" <Jason@zx2c4.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
Message-ID: <20261020190718.6cba898b@pumpkin>
In-Reply-To: <20261020163210.742728-1-irogers@google.com>
References: <20261020163210.742728-1-irogers@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 09:32:09 -0700
Ian Rogers <irogers@google.com> wrote:

> Commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct
> to memcpy()") switched __get_unaligned_t() and __put_unaligned_t() from
> using a __packed struct to __builtin_memcpy() to avoid strict aliasing
> undefined behavior.
> 
> On targets without efficient unaligned memory accesses (such as ARMv5),
> GCC may not inline __builtin_memcpy() into byte shifts and instead emit
> stack spills or much slower out-of-line memcpy() calls. Add
> CONFIG_VDSO_UNALIGNED_PACKED, defaulting to
> !HAVE_EFFICIENT_UNALIGNED_ACCESS, to use the __packed struct
> implementation on strict-alignment targets while keeping
> __builtin_memcpy() elsewhere and in tools/.
> 
> Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
> Reported-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> Closes: https://lore.kernel.org/lkml/47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de/
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> v2: Default VDSO_UNALIGNED_PACKED to !HAVE_EFFICIENT_UNALIGNED_ACCESS
>     instead of CPU_32v5 to cover all strict-alignment targets (Sashiko,
>     Arnd Bergmann).
> 
>  include/vdso/unaligned.h | 16 ++++++++++++++++
>  lib/vdso/Kconfig         | 10 ++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
> index 9076483c9fbb..726fd15efc82 100644
> --- a/include/vdso/unaligned.h
> +++ b/include/vdso/unaligned.h
> @@ -4,6 +4,20 @@
>  
>  #include <linux/compiler_types.h>
>  
> +#ifdef CONFIG_VDSO_UNALIGNED_PACKED
> +
> +#define __get_unaligned_t(type, ptr) ({							\
> +	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
> +	__get_pptr->x;									\
> +})
> +
> +#define __put_unaligned_t(type, val, ptr) do {						\
> +	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
> +	__put_pptr->x = (val);								\
> +} while (0)

I'm confused (easily done).
That code relies on strict alignment being disabled regardless of whether
misaligned accesses fault or not.

So it is either always valid or always wrong.

Additionally I think the compiler can sometimes track the alignment through
casts (although it didn't for a quick check I did earlier).

Since having misaligned non-packed structures really doesn't work, the only
places these functions should be used is on u8[] buffers.
Pointers into those can (probably) be cast to packed structure types
without causing issues if strict aliasing is enabled.

If you write the value as u64 then read as u32 I think they could cross
even though the buffer is u8[].
That might mean you need a barrier() before the read in get() and before
and after the write in put().
(Partial barriers may work - dunno.)

David


> +
> +#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
> +
>  /**
>   * __get_unaligned_t - read an unaligned value from memory.
>   * @type:	the type to load from the pointer.
> @@ -41,4 +55,6 @@
>  			 sizeof(__put_unaligned_val));			\
>  } while (0)
>  
> +#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
> +
>  #endif /* __VDSO_UNALIGNED_H */
> diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
> index 597f5f0f9681..2436c20ee0ef 100644
> --- a/lib/vdso/Kconfig
> +++ b/lib/vdso/Kconfig
> @@ -23,3 +23,13 @@ config VDSO_GETRANDOM
>  	select VDSO_DATASTORE
>  	help
>  	  Selected by architectures that support vDSO getrandom().
> +
> +config VDSO_UNALIGNED_PACKED
> +	bool
> +	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	help
> +	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
> +	  for unaligned memory accesses. Enabled by default when the
> +	  architecture does not have efficient unaligned accesses, as GCC may
> +	  emit stack spills or out-of-line memcpy() calls instead of inlining
> +	  byte shifts.

