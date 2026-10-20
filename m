Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490494;
	b=NtNuU8PnAU3UUV22jtEa/F5Hm2VQ/0TLyFur+EFrkCaiHrvGFqc8ZYnF3MnP9t5ml3MD
	 3Ur7V3Wzl8OYfHgzhzY+YtaTsOXZ6R3flDuAvZrd8zY6vvuyN4kwjIxIBm7/VdAjwsECP
	 W58O2vUG20cCPer408sF0OLTRPuo+Sl0ccjsL1VDdVA3j+AUrEYW8EZdfM8hQumz1dBQ4
	 mewenLHLCpKyDhuOryvS9AP389jEGYu6OJ6SZcSuW0y8UaSgaYG361jiZSNAZemdwq4pR
	 fQ6GeqWGuH1q3QDDL/8YRQcsutaU53LSHRYnv90Q5c8FwrDq0dUyjb2ggw1rWsuu8zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0EBQ5zDoDvXhg9EZWNn3Z69o4Pu64kdEOghQ8cgTBOI=;
	b=JJD6dVwGUcmhINJ3L4ptl+A6MaRDce553WzSX6YNV6QxqqeY6irmXXwjr+pLiu9lGK45
	 32vGeCSFPvoYVy24DLQvHUAc5WxzNKsGNyzI80jJoyqWDQizZizNqfZcOOe85LUNYbSAx
	 /kncCibeL6AdqYj4kC+zKnYSJMBXdIWHg7b911RYYRmbIk7wBBrESLl2DSgP4imssKzo4
	 eOEiEBa51p8UIUu4zzZtO5VdNJ5oUgHnx8Xfa2MSQmEly4dt6hFOGQaopazRNZ9xGhnLQ
	 SHZvGOEGb6vBNoQbZpI0BV0KhEq6GMtUtLPabiDcHai9uLcbP74/m7Dhgo+zBjUg9hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i9MgAnUv;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077F606A320
	for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 10:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E077F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i9MgAnUv
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so23352495e9.1
        for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792490492; x=1793095292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EBQ5zDoDvXhg9EZWNn3Z69o4Pu64kdEOghQ8cgTBOI=;
        b=i9MgAnUvlMAvsPPtg/rnJRujJfiLh77GJyjTrlzu0E8ELwo7HGd9EJH2o5PcpkMQa5
         HXZv/bO+5o6K+clkbQTAWDgyvBJJGRa4AXRTvAtPgyoZLTVJYjyLOxkbRdnpsilLzWPG
         nt/NOJ7ZII59jalWoCrkgO6eq3JiKCF//P9vcZjypkoCrU5IT3iz2MFTp99iPRJBPDHI
         k6ohkARiekfzl5GpcQ8Nwo0OPMRhcfOlkVeC493Yh2wppMmEsclPRLmIO0abHJBnjCQh
         3y/QxvWKwP+nOaKLdqB1gpoRn8Zn536gcELkHYEV5fUdKyBAwfQRsAHnHZaAmTvp8xbM
         0Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490492; x=1793095292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EBQ5zDoDvXhg9EZWNn3Z69o4Pu64kdEOghQ8cgTBOI=;
        b=Ms85Q6g+7cr52w/9gbbQ2N3Zoyl829SjfDcxSzEuvAoG5niV4UMG5ZT6054tvvvyDF
         YkjHPM6xDO2ZcI0yIZom+iB4EdlLPUdMlSy5Bn4LewjkVs1NnKQPOnUaRov67q8RYxHw
         99ryeEUPVTXHDzp/G2an3dBh2J3a9PvLfyseqiJQHFyMUD7y/p0qXYH4F6tf6878xeJC
         obq/+pAgmN2nkWJzrjPFJ8UkJavkWmz8YbVXTuoOrFN+uVKVzeJeRRETT7HZsiDe2pzX
         dkjNk0W/Dz+fivotxafFoqGiYfcB1ukUBKwGNSuOhv4QeUwPyEkXuAgD1zpXNb7uxSG0
         xqZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5hqKmyPE5aSkE7HA0hgxU9TQFpBW+QkIanpijAAVoZbVeFtltGvDQe5dY0t6uQV3wC8bJIL1JE/NkzC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLClv2/d4YyGG+d23yGfw/qvE4dMatyan852YULAXBBDuOjpbol
	37J9ei+nGnr/Hiwm0p1F4tmDzeLsRnUUWolYBo3x3ku0oX7aFST47ouR
X-Gm-Gg: AYBFou2IIErRdxLhn8zpVbKkbpzPRG+Zuyf81quSQVi0ZH88q8hgGNpecnHU3yN2PeB
	CNxuGVSrZsvEqHOjLt+jMRXGy+pVJWlp+HVZyUCceXjV5vDJuxvJJ10hTAHSTGbwI0pJIEYcLd2
	efgAIZDl21RA99EakAD6Z6+CX3y3nh6jPjEeDVCUH63T2+3MBgaGR372JiCHNwSZUjW9r/S51NK
	iufD/SyJf8AN3v1YtJGYtK1b/I6mLjhsBA74GSjvpXQf9K2odBWuOS+geJ+DS3Ymb+vv0ePMgeh
	6Z8+HkO1kuTMHzlyKAWH+KlcXwKlFsHxvPuYwEKinBf+Nn1ni+T1n6fXUsBSIO7H4zIWVBPM58s
	TQV+tvaopwsOvVk35+vClHWZWxW8TGAnt25zyvrkMYOlC9IzpuLiszMD4NuT3tX0tD6dT4/F3EI
	haUqM8xjeosHYN2cGFnnPWMvLW/fFteAAPSUha6PyhWSTsD7w1heCLMusr27z03M7QAseQnmTyD
	wUxDDg3UCoWXssz337p4hxDR0qcj8MpRdA=
X-Received: by 2002:a05:600c:81c9:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1d7612994mr197564595e9.26.1792490491956;
        Tue, 20 Oct 2026 03:01:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb6d82sm55429065e9.5.2026.10.20.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:01:29 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:01:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Ian Rogers" <irogers@google.com>, "Marc Kleine-Budde"
 <mkl@pengutronix.de>, "Thomas Gleixner" <tglx@linutronix.de>, "Stefan
 Kerkmann" <s.kerkmann@pengutronix.de>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Helge Deller" <deller@gmx.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Arnaldo Carvalho de Melo" <acme@redhat.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric Biggers"
 <ebiggers@google.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261020110128.25d7e3e8@pumpkin>
In-Reply-To: <100aecfe-f3f6-4058-9f3b-1eb942f23253@app.fastmail.com>
References: <20251016205126.2882625-1-irogers@google.com>
	<20251016205126.2882625-3-irogers@google.com>
	<47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
	<20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
	<2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
	<CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
	<b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
	<CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
	<20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
	<CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
	<18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
	<20261020093604.286e072a@pumpkin>
	<100aecfe-f3f6-4058-9f3b-1eb942f23253@app.fastmail.com>
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

On Tue, 20 Oct 2026 10:41:27 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Oct 20, 2026, at 10:36, David Laight wrote:
> >
> > Historically it has definitely done that.
> > And you can't 'cast away' the alignment implicit in a type.
> > The alignment can get tracked into an inlined function.
> > Plenty of crashes on sparc32 from that one.
> >
> > Any structure that might be misaligned in memory better be packed.
> >
> > But what is actually wrong with using byte access? eg:
> > u32 get_le32(u8 *p) { return p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24; }
> > On x86, arm64, ppc (etc) both gcc and clang generate a single memory read
> > (byteswapped if necessary).
> >
> > https://godbolt.org/z/d33hvesr8  
> 
> IIRC this is one of the versions we had in the past on some architectures,
> but the packed struct version ended up being better in some cases and
> never worse. It is possible that on new compilers are just as good with this
> version, and if someone can show that being true I think we can do
> that here as well.

I was only looking that is generated reasonable code on x86.
(Ok today, but I'm sure gcc didn't optimise it last time I looked, my
memory must be going.)

An alternative would be to use OPTIMIZER_HIDE_VAR() on the pointer with
a (partial) memory clobber and the packed struct version.
(You need the memory clobber after the write as well as before.)
That might add a register-register move (and so a spill).

David

> 
>       Arnd

