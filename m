Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032A390C92
	for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338965; cv=none; b=pm1CEI7kqxxTjygNubO4uRbop6S3C/MeYvKTmcUc12zIoBOadOgDqxgOUVeIa9uGV/lX8N5PkENiG5IbZO/qA183bPCMe1kTs+6c579wUZrFpu+Ebn1+rzUEp4DZB84jeGW9ToLZDD7yTy0UcZwrmLeXDXuyd/p+RgGLtMOlBtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338965; c=relaxed/simple;
	bh=onL90hyVAUlPY0ASaWQwK2lX8QEYr5m106IAfPoIE0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXNQbQLYs0yUt+hUUa7F7HGTvuP9rEt20tSrAEv4UgXPdLiqt9BYPAa9yyk19DUNX1zRhPIVljZ3PJKDdTBtZohovHm+f3J7YmwdDhFFHJe8oPx+tiTlmTTOLGFwE2Atk5Lsb9cF0G0H4+cd6mO436+Ce8sCe0uE0zjwqA0Rv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8d560ede296so924600385a.0
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 04:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338964; x=1776943764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N28AiHhMQm9a3ncbvMl4jwXcNZbOrN6OiiJm2DjJOE=;
        b=UIcsYx2VubzZYg2K4P58ceYsBK1O5rWbAVg7Muld4fft6A9pxZHYcPxO0dtMlMdDpi
         oi2R7PFmPyIRiEnYxryolvqPY4dlejav0AMgvPPKB8eAWf8C3OXwwXKVoHl+kjXThZfg
         VyD7pk0z0A/cV/kUUoIWizhNbCr4ChXPsvfO6zfM2bcVrCXVjDrAe03FUzTffI0+q6l+
         860nvO9/yAhc8sRKqeyx1gBzBJr2iKQcgTX7DkPJ4vCim5Xeiqu+if2JpAXiTKWpC/gH
         OLFayNVPi3glCvVA3f0uX64PdVlKrGoyc2wibeEpdZllOUE5wrD14/Phn1WLm2BApl0V
         Q8rA==
X-Forwarded-Encrypted: i=1; AFNElJ9iWlFWgFfY8AWhU07PFcc48YN37eOezJnLR6kkGu6Lxhs1DbD90sRQpsKphcQnR5/9eDx/lDEoA6cMLvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx4o26HdA2jeM+MV3rVqJt6MLLsqAJFmp5FGocwAVXlBpXqKWA
	SQ3Y1zr1xbvueqfrrP5sTTLhRgcFiPSq0kod7FBqP8wSxVJ+IAfVAtmGQbUBTXfj
X-Gm-Gg: AeBDieuO88B3yZasvo3qfnfXqVEh1ZEjaTw0kF15RVnr/PAxv7D/Q4ySjuLrwaFGhKk
	4TaYu/PBAOp88bw6gjfvMzMWTuvlqWfISt0FNRJI8Yv5EoOCNyX4dA3GpwE9JVyTv5FpNCdmaHf
	riW7Q559vnTKw9aQWxF1lK6F04pDKqz6/Db5xBka0FBZuup88e/aiWAmmDAymJjuZxV7VaT3ZL1
	9+akZgfDmMiCeLpP0jFB+CEGYO55DE921cBcuw+upRq+aj7ZQfnO9vHMb1WJuI0qlTIltbre+NT
	cAHcMKP0nXVw02fcX3RORMXpXmpLnd4/mMZ3QrEm0LoCDItQZdnwcwXh6kkeHJSllbzXZOik+zE
	7Lpqv/GP5VBhEUwFYkhU65TisKef2ntZ+tNR62rYH7d6J+gdb54Sg+F7HtR9E0sJqX03M/uywhK
	WSp+Z0cDKvJM0rvw58ktFJ9jWasst+hCL9A81gHjFG5yYnJbaDkYeE72JAwbg13DT88dTW1V7c8
	8U=
X-Received: by 2002:a05:620a:280a:b0:8cf:cf7b:7ef4 with SMTP id af79cd13be357-8ddcd024715mr3698124985a.13.1776338963698;
        Thu, 16 Apr 2026 04:29:23 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4f31f5062sm341937485a.41.2026.04.16.04.29.23
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:23 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb40149037so729390685a.2
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 04:29:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/u0AOk35tDnqOOpJjtIhbGpacg1IgRqBr4thsBgwMnohnpNueJaDPyaOOCfq8ueCkjnKNP2wSieQx3who=@vger.kernel.org
X-Received: by 2002:a05:6102:3fa2:b0:608:1b6e:f4dc with SMTP id
 ada2fe7eead31-609ff0c50e9mr11028119137.11.1776338540828; Thu, 16 Apr 2026
 04:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.045532623@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
X-Gm-Features: AQROBzCyA8BqoTVnHFn7fWQMKVWyMF2wrQlYn44P8f0X0RsdCOwGnnxui8decDA
Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:19, Thomas Gleixner <tglx@kernel.org> wrote:
> Most architectures define cycles_t as unsigned long execpt:
>
>  - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.
>
>  - parisc and mips define it as unsigned int
>
>    parisc has no real reason to do so as there are only a few usage sites
>    which either expand it to a 64-bit value or utilize only the lower
>    32bits.
>
>    mips has no real requirement either.
>
> Move the typedef to types.h and provide a config switch to enforce the
> 64-bit type for x86.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h      |    2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
