Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59A3A4F35
	for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 11:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339006; cv=none; b=bTwzWredqHuIcMTVBpONYgKKiIIlpOD3iShL33t6G7R0UiEINSgBD6/8HdbACC81+07ISKQYmc0OorlQH2m/24DbwyNuorHnl7RwbOPuITPTdch/tsKayHTr+Iq9Ukseh7TtHuswJyygwRFXajJ0tQbhCFlA61nxm0HrkTLPJo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339006; c=relaxed/simple;
	bh=5RcGmn3E6IkK/4PLTUVN24XJ2jAiV11BodM4t9S5uGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DwY7VhpHkqo0KqwzjmOuzvQ/Hpwl5Th0YQapxESszcN8LZFJ06BlpeBn2QB4IwsqQPEOHIP2ldke8vCGjpE6CQC8eU/2pzTz7Ma8gApU+DW31+nqgttM6HYMBCzps9LfEvbOwEJJM7kB/maKSv7adi6sTN0IEC8//76VZZj3Toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50335b926c2so59665881cf.2
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 04:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339002; x=1776943802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=;
        b=hiC863qRSBfDtY9681/QnsA02K7xNAml7/zpZ5uuwYIVTNz80NMp2GIHnitYzfoSg7
         tosqSl+4TkfNPTbIWiNUDusQShKi5jM775FoucluYDp+UYJfxomC3LHD74svRckNL5Rr
         0gRlYWDQ2Qej/b7eWneddkDjF3jHTmEteeriblwRvJp8vh9oJTRp9KquYkT8MGVzy/QO
         mEUxvTZRjDmVbn2PK/9SCCIudxa9L5Ab6LhzT1MhYXchMNcxA33IwoZ3vMaDm74/LDFc
         Oc5cjC99Y5mLK99YBQG6iQpFwLtRoKhJeLNgSlhrE8uc8fwO4+8GPHB1vvXLS2v2WPWP
         erNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wy/tZyux1BlOborlzKCpnn7/XoC1Rswst5dwdJUhxNNosQanh9iDTGPXARCE+FtoA1IiotlLZlpFy/hI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/EzygiMZp//htlcdoVPq/q8tnkOsx2qfxTU+RIICdTx94ShQB
	zmJ9GefHXcH6vGLziPNq8mVc0S3Lo+8qgla7/Z8xh1YiLKbndS+ypUlG7VXZ6YMz
X-Gm-Gg: AeBDieu+UAmH9AsgsYcc36LUiiymrt1tPTn6ci8MbXCpBTyuu3zmJB1SkCe1MtYk1RP
	BXGO+7Buxy8iQ3FqByy25s4jq7uCOmkyanbtnki8PC7eAD+jzGTIBkw08OXgEnREsgOT7ndHrAB
	Grj2neQ4kFUyTn6CNOi/ehOISdkvxGQfrc/L6Nn2BT57O9FrTxW6jB5R4R5xMhwXcxwQwiutTPK
	1zVsXo+aXnXZABoDW+RDB7BAaDeJPaV/QEvTQYWmo+cbwZVnW3sTUEuceTp5nKISxhn0u0oJ4wx
	DDTu6Hyy3Cvi18zJ+aTUey9vPhlW12I0zB50sgc8dN17BJOMIXVFNvvJR/1sv6pNb7SuZG+e1vs
	GZfHrLnwzqSutfM+TbqNoRAK9aV/xCZk9uHP1UwMvmY6LRPfccDSAQWjIC5jEpUac9P8scaB5X5
	devE6EY8YNnXYDiNjYvI/KdUvkYN2XhLG4oc2APC28IbAAmAfN9rycvcl9JVjS2OuF1xE1aChIf
	0mLK+lf6A==
X-Received: by 2002:a05:622a:1c1a:b0:50d:860a:8fb7 with SMTP id d75a77b69052e-50dd5c3dc62mr380864541cf.34.1776339002247;
        Thu, 16 Apr 2026 04:30:02 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1adc1029sm39658071cf.9.2026.04.16.04.30.02
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:30:02 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8aca4e14411so58192346d6.3
        for <linux-parisc@vger.kernel.org>; Thu, 16 Apr 2026 04:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ZkIJSvaz2hw6BxzKCl1Q5jBoQoZIa6wMSTwFPHjP7ERJPiLVqrcmfR9PhTD30Q5lnMR+UaWKjMRxWlco=@vger.kernel.org
X-Received: by 2002:a05:6102:6044:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-60a0157295cmr11348128137.30.1776338547396; Thu, 16 Apr 2026
 04:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
X-Gm-Features: AQROBzCJ6rVnwwfhi99PI36wWXAFQ5DEgo1zw3RhVwYNSXoxkTYAcgIxt5Z0K1g
Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
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

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
