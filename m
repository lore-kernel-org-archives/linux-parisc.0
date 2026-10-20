Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792531213;
	b=HEu2SrET6G8eUCx5hVf/8v9riYILM20CM5U9tMrgKP4+hXs/IQk64iBta1lSzgK6xs9Z
	 P+F2Gs5S5qaZr9oYzIvv3XYGSWfoA40JNbjo1kuYEGLs84T3hOKjgh7e6mcYy4KqYiWjw
	 +wG1WWvwYXgn447CEJfcG2WM3E9crrERya1X8onKm1c48uFesfPRRhM+5cdSOnY5cqmyw
	 dVkgZKT/FJ5/w/B95A94SoNnFempoQfH2VnQnyuZNZEMHpRuLGD7jsEZm4b5SKEa3Ivg/
	 rczXDyhcmiALpNoQlMVjAccCwDxTKzyY4UvpwNsEuXpNvSifOQDf+fthpAjg/+QiEGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wkyaExlLLt2nx7gNqNXwfDrIgcs0VQWcw2XolzKkMKU=;
	b=nq5KdUq51FLVGu80AnfsLkt76wZuM3suu7cZWHkSetPgX2UuxiLgMytiqxHxn3483zSP
	 oX1nbFEKprVXCI07gz2YHIIEp+4Xt65wfwEx4whJdz9b5DG62Xea5GJEukUqmDjZ2yiKo
	 0x9aRBLD0S1lHGUDo5983pxF8lM4Gff8bgiWqaHR9zDPcttWI/yQNq+SSGeb6gHa2HO3c
	 Xnk5FgCn9wxMtcxlcY86BP6ggMmsCnyLQ1b1Qdttk5UHkjfrBNO37G6nDFuY7uRcp6c/0
	 0pFILzvdII7CM+OZzwJJ7K5nRWPj7NNFO+XAzEoR02y62FpihDkDvpUQqeS4KvQj/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SUS10gxO;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA894606A321
	for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 21:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA894606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SUS10gxO
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so52705f8f.1
        for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792531211; x=1793136011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkyaExlLLt2nx7gNqNXwfDrIgcs0VQWcw2XolzKkMKU=;
        b=SUS10gxO62r557Q/YKDnnSdTSAxSrE3t+mP4K0wNuuw0F5n518AB6Q+kgUp0okUMeG
         lR4dfUpW231vTgQhJxTNMnH/iFqiHpVlQuGRl+dmMBCwwycMakFXDM3BGUyEZLk/VwDD
         +OsLVGVM8gDx/g8yeMsfrcorNXBKjrmpUGQ4OWN1vd6UCLKTTdQf/oJtSrDk6ZZjzgV/
         RMIAvYQ9Wv/tr6zjrNWVKU+GCyMX0z9Y7hcvu76G6BGSkcVnW7lohCEGctKNyua+e4Vz
         jkI+9mxqhlzt1vmhVCbWVfQmt2GuZelQMTnjq9sGbOvqG3QRhhpiacNi1FoXV5kNaQVu
         WA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531211; x=1793136011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkyaExlLLt2nx7gNqNXwfDrIgcs0VQWcw2XolzKkMKU=;
        b=hN/yjVkRHDBlqb+qL3dTCQ48qvBHkM6IIv3Fc/JO22e0MddAcPA+IsF4bZTn2FUWMk
         JEITasYBY0SRqvwndy9qxwo2FDHFCBp0xQcq/FiDr0lxFqvODNc+ciVZ7h3SUlzXn393
         535v3vK7QvSDgDS9C13IWKn4GQZXG2r9X/pHFq4CYwM1kBbtxDcNrN9xKBYGoXf9kPRO
         HIufnPly6DUEHrCJFVcG1Gb32/SjCJ+DZ9YNZvTlcfo3xqHIvuMwgd+fqQ1QsM8oG7Qj
         bZGdmi9HPcbR94E1VLq35p92lCO2RhS61Ulaxw4S675P78F/B287hRBddj6VEe/L/cLG
         j+SQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVjU2AvPjnmRnHOqGmk1k4EmlpjHHbJVAVO5HInvarqmv7xdBGbCmuN5duOnXlWqVdRHD/2guGVB8Cb14=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+QAAcbS0gCotAjT0+/CkSMx27DTl/Xp4kM9uFMqiSjrTLNHqL
	HaDbqfTgIWvcx1wA29ai06YVVL0xk5xTKQgLvv8d9FRpDdjSMRuqp0rt
X-Gm-Gg: AYBFou0WoBvsslsJSzJxnlDrflh080iye9zMyHHRAqIuagS2+X5j9Ntv0FtBZBbh5Jd
	OyN98Y608jreXvx+9lZHAsQBUGvw0maazO1qY4nZQaIHZK2dY3515YxT5siZYkobSEyl7jqRmG9
	R7E4OcA4Tbkc5f9FMcZfDmx1lZf7yMem7E6YZO3og9m5ZhAYzIvJ1VfDsJXrluz45k+SxWkiPEg
	sT7iecrsBrxGU+k80/oCWbFv18yqELeNx9oRNmrCCgTMjnnF1adw1as5/XZ23Is3U3JItc0YCrY
	uTOUJDB0ngTfupfRHkY92s4gqKNBOf3FbfwmOXFlgtR1xxJ1fcleTV3uHMCn7lu4ElmkYRDEIiU
	JMC4mWkgBniltQelKdc9Gs8KmhAHQ6yTjrGTDfLRi3aywed3vSNRLKZ0rZX8x6mq+PXho+zfZXZ
	qp6sU7ZfMbyMOXl3WK7zL3mBZxfTNhYL9sPAA0YsSFDiKo/zg7cI7QNlERlVouSmkqJZ0uHCkyj
	fbeSF9/z/LrEnJjZOwjGUGl/noRxEeWGsyJ
X-Received: by 2002:a05:6000:260b:b0:48b:efb:4a64 with SMTP id ffacd0b85a97d-48e07f98a9bmr26362540f8f.37.1792531211037;
        Tue, 20 Oct 2026 14:20:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258424bcsm913222f8f.55.2026.10.20.14.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:20:10 -0700 (PDT)
Date: Tue, 20 Oct 2026 22:20:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Stefan Kerkmann
 <s.kerkmann@pengutronix.de>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy
 Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Biggers
 <ebiggers@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261020222009.54f6d35a@pumpkin>
In-Reply-To: <20261020202744.55c52a49@pumpkin>
References: <20251016205126.2882625-1-irogers@google.com>
	<47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
	<20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
	<2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
	<CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
	<b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
	<CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
	<20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
	<CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
	<18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
	<CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
	<c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com>
	<CAP-5=fWHDR0--hMYM5UHXaDfggctPbJKxNUnM0hjpupUSVNQ5w@mail.gmail.com>
	<fe4c1225-d5bc-444c-b457-001799a3f648@app.fastmail.com>
	<CAP-5=fXQxGBYnCKbGpxvtaQxxhju2UXgzn1vy-8rcoNVOvSqyw@mail.gmail.com>
	<20261020202744.55c52a49@pumpkin>
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

On Tue, 20 Oct 2026 20:27:44 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> I suspect it happens less often with __packed.
> You can probably add volatile to stop the other merging.
> 
> It really might be necessary to give up on the C versions and use asm()
> (at least for the unaligned access case).

This probably works for unaligned 64bit - and is much better than the code
the compiler generates:

unsigned long get_u64_le(void *s)
{
    unsigned long p = (unsigned long)s;
    unsigned int shift = 8 * (p & 7);

    return *(unsigned long *)(p & ~7) >> shift |
        *(unsigned long *)((p + 7) & ~7) << (-shift & 63);
}

For native BE the two shifts need swapping.

Not worth it for 32bit unless the alignment is known.
(And neither gcc nor clang do that for misaligned members in aligned struct.)

> 
> David
