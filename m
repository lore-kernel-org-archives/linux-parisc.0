Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55A3126B2
	for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335406; cv=none; b=HyiVLrHoEeTviy4tKe4Iq91fIRJTcOADKlDQarcolkYXmAHMEQCAXVcnWH77WdTpJVKbnyNJpasSjkBfzWRAmUk6OTZONwXjwlHXuIWKRZN1q4/gO02dqWkAxgmVjTf+Cl8hUTRPceHjHWTzc3sS7Frrs3oQDnnFVaSJar/An9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335406; c=relaxed/simple;
	bh=Il5EilNKbQmVM1qv4XgxLAe02Z9+zxydkwUqJc2BPRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3rLxa+7b7vEzT/2eopmplpAQzUM0cxloqXnuEDVlnxSC9Uwip3qvGjaqsuluJoTh6XQuZuoed76HgLLb4iZjzY3pG+hW04H7dCY3B32Ktu+aBwGN7mbtNKmf6M2cTo/e8LPQ9wPOPnyXPGJVbgLguMMUbVS1ryupGtjeRx4JWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dbdcb85067so6553945a34.1
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 03:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335402; x=1776940202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9HEDsaws+1AaPEcUyrGjtCss1Kv3jZQFAB8Oib7mmY=;
        b=of80x8m/KPTtQkTWtcw3aTg6lgYrAxRiBARNzRV+fd3xfhrLjlr2izx4pVl2txH7Rj
         rpTpJ9PxesOxw/jTUZ2l0QtMkeP1blqRsebxiHK12gC8qltsSor1a28FEczxNg704ySQ
         B4nV+o6do6gYbqRd4rj8WBT/eT42yzsxmitFmafngAtwKssg32KKPPRjxofkoxmQVI+m
         87OsAPK6uhLwZgFc8XRTQScWC3YorC/upwMlJD5fUgelONKQekKC7deNjFO7DPLZ3KbM
         hdIeYZ32JK1o1PjVjvPhOUOPnTbep5bUHpsxSCHLT5prsVLAMvyO7notcZfrKN8hbyYi
         ST2w==
X-Forwarded-Encrypted: i=1; AFNElJ9pZ8xLkosKONRSf6jHkjAO1Ej1x/UoKSe3BhUWjjI3I1/AggzbKOhBahPt1j0rgebug5JwcpLoCjO2l9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3D5Yyj5eSAlgeKDMY+r31IHRtrhntr3F+fmvSDmSLMj1QWqL
	uGcMouDtFLgB4PDB3IdKJWKXBBUTkn6BqA/Zq+ElfVYwzMFQk1DIu/txtZPKQ+Ro
X-Gm-Gg: AeBDietuBqv5jDpbklc8u2U+GlgkiPx6vT5A/YpLxU1sav2A+DqpZMXi5NBYtycO2Jt
	vSbmtXhOCKiZ+Hw0BH1o89U8MjdjxWi7DahTjMVBECu9Q0avZfg8VW2OB1vWp+lwQmYNGqLcRjS
	KH530fHm4lMno7cr4JbuGB4FQRHddbfcEnVVYXT6feTr7CiyEY0Nspa62zgyJ/uRlHHepooFqnG
	msZxmKNSEqViYFxytUhJBc+5DkPr5S7UXJi6eI0x7tlOthyxKFpGreAudNcLk84XX5cC01FDDNx
	YKUcsmBJ7VnOR9wcMkBP5B0E2lYtW4r/VR86dYHZcnhPoZhOJpv4B1584cjP97N311l73B0e2Es
	EGd5EIbDB7LOUphVJYLYDcqcAhwLY++jveKdJ4r3/H76NCbWlC8Lk8R7DniIWj6sNCV2I2weHjB
	6eMNJJaVvHPhH3JEb9/n0N/AqNRHznbDu17CZfcrBVjEGWjQLpsj9ZSMbqr1TLn4oic2Nrj9jSB
	s8=
X-Received: by 2002:a05:6830:67fb:b0:7d7:5959:946f with SMTP id 46e09a7af769-7dc27e1cabemr15961307a34.7.1776335402028;
        Thu, 16 Apr 2026 03:30:02 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76a123f9sm3184231a34.2.2026.04.16.03.30.01
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:30:01 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-471618e20a5so4028122b6e.1
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 03:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+GhRNqL+wHpGvxEO1HEf1xZ8IyBd17lNORvphGCc1XJC39KnAR+B2CmRyiUzEIIIr+mLye6RPtNxmIE6c=@vger.kernel.org
X-Received: by 2002:a05:6102:c48:b0:608:cd24:354c with SMTP id
 ada2fe7eead31-609fe9b0d22mr11966750137.3.1776335071251; Thu, 16 Apr 2026
 03:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.794680738@kernel.org>
In-Reply-To: <20260410120318.794680738@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
X-Gm-Features: AQROBzDRGGELVSySTko37h6zEj8YoV3p6pwZDCVQUlUW6sZbw_W5mbJzFIh35nQ
Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
Subject: Re: [patch 18/38] lib/tests: Replace get_cycles() with ktime_get()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> get_cycles() is the historical access to a fine grained time source, but it
> is a suboptimal choice for two reasons:
>
>    - get_cycles() is not guaranteed to be supported and functional on all
>      systems/platforms. If not supported or not functional it returns 0,
>      which makes benchmarking moot.
>
>    - get_cycles() returns the raw counter value of whatever the
>      architecture platform provides. The original x86 Time Stamp Counter
>      (TSC) was despite its name tied to the actual CPU core frequency.
>      That's not longer the case. So the counter value is only meaningful
>      when the CPU operates at the same frequency as the TSC or the value is
>      adjusted to the actual CPU frequency. Other architectures and
>      platforms provide similar disjunct counters via get_cycles(), so the
>      result is operations per BOGO-cycles, which is not really meaningful.
>
> Use ktime_get() instead which provides nanosecond timestamps with the
> granularity of the underlying hardware counter, which is not different to
> the variety of get_cycles() implementations.
>
> This provides at least understandable metrics, i.e. operations/nanoseconds,
> and is available on all platforms. As with get_cycles() the result might
> have to be put into relation with the CPU operating frequency, but that's
> not any different.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Thanks for your patch!

> --- a/lib/interval_tree_test.c
> +++ b/lib/interval_tree_test.c
> @@ -65,13 +65,13 @@ static void init(void)
>  static int basic_check(void)
>  {
>         int i, j;
> -       cycles_t time1, time2, time;
> +       ktime_t time1, time2, time;
>
>         printk(KERN_ALERT "interval tree insert/remove");
>
>         init();
>
> -       time1 = get_cycles();
> +       time1 = ktime_get();
>
>         for (i = 0; i < perf_loops; i++) {
>                 for (j = 0; j < nnodes; j++)
> @@ -80,11 +80,11 @@ static int basic_check(void)
>                         interval_tree_remove(nodes + j, &root);
>         }
>
> -       time2 = get_cycles();
> +       time2 = ktime_get();
>         time = time2 - time1;
>
>         time = div_u64(time, perf_loops);
> -       printk(" -> %llu cycles\n", (unsigned long long)time);
> +       printk(" -> %llu nsecs\n", (unsigned long long)time);

While cycles_t was unsigned long or long long, ktime_t is always s64,
so "%lld", and the cast can be dropped (everywhere).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
