Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953720;
	b=DKMTItD79CUHwODcISXFSpTjMvYdxeGXBwrl6nFRxbUe2daeZngzrc+TNMDWE9M9AQVM
	 YTIuoxOj69xbGOxJ/aCSztDaxQUPd4YjPilKfLgYoYbR89GUlLWhmfQHEy9EVgl7ZuT0l
	 CLV+qxTndvL2hoKiHlxf/yzOPgGqwCn/SpXBuuUhNG6DVRRhWVSXup27cP/wVxXXp62ls
	 LUu2eEZ5ijQu4egKMhB0agVANbIejyPcRJvGDqO2QcF6m1xzZxYZm+TflfFpEvs0Drr8c
	 vPi0ddfIhnqiIJzLA3pA6zXkHDyvshdkA9uIPIx1VhD3KxrqXf1YGNAzycdzLp+9wwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
	b=X8nGNykSaNjnA+0RnKq8rNWWTmzuejH3aXC5/8vi7L4jYwtHR23GXO5Z5UM4+NCchDQQ
	 4oarfQn7kArpb6f3ARjQNXZuRy39uF8ALxkUp9X9SeXUR5o1CbtoplL6HBsrccNujdzIQ
	 e97XQ+yJWxrEGni1ZFCC+Zi46U6vsJFY4nbCO9v+TFpUZ9PFfQNbd2bHRtlBjbTOn5VWE
	 NxgdfA1hXkyaUTT3RMfciR26x7uuNYPaRyrmkiwjq9mHfA/uT63pvLtIUD8w3aZstn0Y6
	 QlvLp3cnRGXZbDjDzh8Cw+eYCT37zytLl+/CMje7TI+ro97L/5fsj2Xr0cltwDyLZ+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bgCGzzDE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B7606A31C
	for <linux-parisc@vger.kernel.org>; Tue, 17 Nov 2026 22:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bgCGzzDE
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so88861cf.0
        for <linux-parisc@vger.kernel.org>; Tue, 17 Nov 2026 14:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953719; cv=none;
        d=google.com; s=arc-20260327;
        b=UItjMKBCjh9TzAKVcW0qxA8kvZBjw/GjdcBYqwibdN5jCMORj4+UGYuyc38Da9Dbr/
         1kQk66QKP1V3DC7ahMc/xbg911gt1RDzMioYEDDWB+6Zy12gHRrcQmwIDL1/1ZVPbVk0
         RlMF7dobI6Jk7d0vcQHE79is2CjH9It0NOo6DmoMvqgwdoXQT97PTst5MaVH0oV8Hgyb
         RhNW0RX2GZr//FFOQDRQUnUoG6cj8c6PnebJngVhafklUjTDZ4uQSjUMb5h6tmpD31Ld
         W63p7WoMwOzpJQZ8PKrUT4k1mke+cESU/VnbuVuXOYb9vDOPUWPjUZJTZYUCQs6bJ4+g
         i1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
        fh=09JSVtO+tFD+KhC51F4pzfasze4CFaEOJoQQaS+m60c=;
        b=Hm9uAJjYpQG+sWQkpBchwezcYGVTKkYJrXM/hmVQXyDIzJ4Uwu2JyYJTzfbB3uABjZ
         896h/9j/K6MnhTy8nNYHxKsNpA2Wmzd0e+lxYajMpbxcF2x1QpZzsj8x75bhfBXoFxsa
         trCBoBwYiSzrdI6MaSSSly/XLi9+9pJbnGtg19TR2nsdhMdJHaHeCkp/wUhDptUsmUr+
         h0aUFZnX+YIyf/elEXA4INv2tkjnSzNyFD15ncPEamqbSloyqe9KialHOSg+AvVI73Zf
         iJXbIX2BU7Al7ZahFc49O7sClfEbF2wWRDTj+iSum0LOGeAZXRSpliPORxWvgqH26vq+
         28wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953719; x=1795558519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
        b=bgCGzzDEbDMpry8ZT6DPvMWJQ3aAmdRXRLD2kAmUxqSs75qpEvnWAPvNbVV9Jytnf5
         0ItH3/Jpw64PofY6VHAxiz7KscX3E5Z9Oyt2Dny3C3eEOBi9HWiJ7bfsjHplk44cP8R2
         Hert9bqS/SD59I8qExIhIwHhWs7kRAm5nzAxOJ1LPW7RHD4k/dbuxtsh+9fM+wOpeXf7
         dN7O+IF9pjaTDT3IQV15NP124sUBAg/jv8e1fFStwX7+gzlslwXPGn3OVeuJSjax+MKV
         heRmfhYHRg5Th/ozT8jv5/lgJLpxhj6v+Fsv4boWFVw8TSQf44OOiRaZS3zrXSsxfXUY
         bgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953719; x=1795558519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xalldt0IwLil/p8cJ+6wa9dsNPYycXWwlcRKTjj/3QA=;
        b=pBr7uTk1RqHAPQF2en1CU+LOdrde/gLuls5FNrnvzFZ2dk/jUXFNiyjCiYahK+oHT6
         HkGmguMjgaZdCmhtMPvBR4qVUXl6By+QsLVxRqG8jbB+JokLvubvacJwGf0dpB3HV4ft
         X4YQu+BElUkBH1EEUc5mtoyREAdpXCxJWPjENjf2NoEGqnRUO75Pm0BhnMTIKgWaKKOi
         4Y4tMHgrgSqGMJrjG+WaB6YTaEe8r8J4FtmQTaVWR8rNOx1SZ1NA4bbRytbybElM4WeN
         ZX1gvMkWEx8X83FyuZM9L6AMaGCHKk5sCMHc0iTenac5JVH5HKmeEq3zLoDROdGIrrkO
         j/Tg==
X-Forwarded-Encrypted: i=1; AL+hErE/F4+usZ23WyqyVppWI7OJYDSeMEr91Aavw8SenpxluH2uD6Ua6hOnNFIKyBO0+OVLbrDdgS6ewGoIRNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mAPI8Sf/Fw0HXqcOcNce/ps1eRxO5h8PE4w+uBHuFQSWhkGmI
	HRSoiGigDvQEOTN+PNf2m+MQQCtcHtLZumcJwVRgYhyHDzsERwPn9TJ1EduoBj5s9uokG09KvFB
	Rwpa5ZMAL+Bo5Al31PnCuSdbBnybcYmMKSItSQ2tQ
X-Gm-Gg: AYBFou230pH1ADyREG6Ws4hNyFnX1zjEJylc4b1qVBqj6chaFSCuinz3oQjEL3klVQS
	gPJonI38dPVJm+ai4FwxwZ1HRA1C9hdRzG+DEeoP8wXByt7B8RiVb/mY27a1m+Kruan77ixxKnx
	YcHYSRkCeCMu8wocSNOXBNQKXI6B2UCrYKI145a/EAgiDiTG24fOXjAUFpJ/qY4IFtLnf37XUDC
	8B6zFAJOCiZdkBUDn2lepDQbZ9nuU/5XaHxfk3fPJ5qxfcA55oIUfXU2BX7wMFWIuPk31Om6/i4
	JrNe5ocjoozV8wLO0bwfHJe4bIDjk3hg8rXmzpZJ3w/hZ3izMLKMlNudMAwXe1HSzXaXe+vMKXA
	jggDQD2mtg4bz5TyzRL7YXtqRNhTEak7qhFV2pD5xPF2dgDyuPqIn91atPwXoV9bAUhs=
X-Received: by 2002:a05:622a:53ca:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-55d5c2e1ce1mr2587961cf.14.1794953718547; Tue, 17 Nov 2026
 14:15:18 -0800 (PST)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-3-irogers@google.com> <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
 <CAP-5=fWKo4QwAc2Ozp4ScvDdF4eKj_J3Ba06Sd2af=TwyHJO4A@mail.gmail.com> <20261117-spry-slug-of-completion-0e6548-mkl@pengutronix.de>
In-Reply-To: <20261117-spry-slug-of-completion-0e6548-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 14:15:06 -0800
X-Gm-Features: Aa3M54rWEWrF4lFk0Gw_f3TPKgDTR2wu8ktRfyd89kx5Bm7ak4LAwpvUZRae5VA
Message-ID: <CAP-5=fUKf7631fhmRLjVJXgKG1mm79vC5xSE3ZHm0XZMXo4=4g@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:27=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>
> On 17.11.2026 09:46:55, Ian Rogers wrote:
> > > There was discussion and I learned a lot about the nitty gritty detai=
ls
> > > of compilers, optimization and UB. But the problem is still in the
> > > mainline tree. What can we do about it? Is reverting an option?
> >
> > I see the config option was picked up here:
> > https://lore.kernel.org/lkml/179423891136.2093942.13129678709622655290.=
tip-bot2@tip-bot2/
>
> Doh! Thanks for the pointer.

No worries, sorry for the regression. Have bugs been filed against GCC
and LLVM regarding this?

Thanks,
Ian

> Sorry for the noise,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
