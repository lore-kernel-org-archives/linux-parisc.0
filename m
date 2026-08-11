Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E4E3F39CD
	for <linux-parisc@vger.kernel.org>; Tue, 11 Aug 2026 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431427; cv=none; b=TsM1ehZWEEiCYtiWViNnjZQZZoUp6Y4WB6qe/jrnjdF7w9VgacB+eVt5FEx9/CITR9JuefgxY76eFTL4gGNIfflBagiK08rQnvJHY77w4jMzDEAP8B0WtWh6wZCYwLXRyDz92eXao2z6DsQlTh9BOtZ7VFrUBP6XTj4Yz3H4dJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431427; c=relaxed/simple;
	bh=tZZLV6eyiwcGv5N3oyI6rD0AMUqGK1dWtQ5SUdhqr2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5EFG2TRf48Xfu18YQlH6T+XPt/fh4ceXHT2Hofi1hh/QUDLZpNQV6Y7rXjJEKQAcbhsk2WBLRwr2A3TwAc7tj55mI0KaLyIK3d3iVbvjbSfsyb+/ZCPA2Pf+/VRDdZqkoYiGtRJss2M0NEmeo05kseXStV5ew/tvxkfuhhQwKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacf197759so47038695ad.2
        for <linux-parisc@vger.kernel.org>; Mon, 10 Aug 2026 23:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431425; x=1787036225;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=bNHUd28b4R5xGLDcAHYCbzkb0l3m/S1CvbhomulTR4B9qkL7ZUjyniocDduoiYINtT
         GJDTb9O5kiXKQSVAe8Wc7Hchnpk3cvFmzhXeF/NqyzqNQ6HuhNJU5dvehfoXH2ZY/8y/
         lFwl8jx8p5mtxNwgLp45pFW3a3hSKaQkUWSKwmC2r7R0js8H8XtbyY43W0bC7bMfIEzi
         +2pCksYyNKwN/OfNe1iBJIdfGmzjSsvpSxychUKhjDoy7KnaQvMMJd3Dri90+aCivyTg
         eabU5QgseZKtjoVxxL4nrJ0gTdd75lpdeKb05drcuNhlJGpUi7Qu8liTZiFcV0ZvSG42
         6xdA==
X-Forwarded-Encrypted: i=1; AHgh+RqgrktGlqyXGm7MNh6eRQtkV9qbOs6tsYl3+JWjNZ6NldzTI9kOwjcKh8ZmD/pbiAd7+C+ybrxBdF34WCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJzbRCHKOaJKnxNqyUR/1Itw2Zvs9y+G461Yjh/02xIWg/gPP
	1RWIesdFPUAEgO0fGM+G1OUF6uAaIMwBg2BAu2AxyJWPS6k/0XUpnwAS7kynXn2e
X-Gm-Gg: AR+sD126zkKTF6NtQS6xtX7brd9LAtm71hL83lIZgURD2vHLp+A8ZBfkoLEa5XYKvJ6
	/EYUFcL8I9OETxVNdyyaaVE6Dl9+4XPpZVzwozmAv7lvDv2OM0RoTGB4HCj+pfpPfMn55+n38RW
	ZXuTjgbPruTF9WZL/lLPoTZCxCw0BMBTzwLBocY9FGIK4+ah10q8/LO7euxLQZ4QYsj0tUfwMdu
	lwGItQjA+8cJ/BVH6PzmTP+XDtckfm9PAUP2g3uaKvpRzlS2Ie9+9pITKLtbeLQzc3ZZadapPLh
	pus7mBN3AOLVTp8NcRBONGjwGR2qLyG1+iai4vUtHxE8yQMDeSWhx9frr8f/B4ZH23IC8hQoUy2
	Ki4eNBIQRLDG1fBydw1uFun9AlqGtCPyl2/ihmdPs2ezoJQw1e/lrfA4iWd+DSHA0uTwlHbWsbw
	LhlwMbkiSWGmiigxWsfjfGKbA9bpHGBYREBC3RE9nBTKiMNLeRRE7540jmlRsqu62anaSIqTdfl
	0h9mVMtO92Ur0J18UE2YUV35zwN7kuS1IEH
X-Received: by 2002:a17:903:90e:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d3177c69b3mr17868005ad.9.1786431425015;
        Mon, 10 Aug 2026 23:57:05 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com. [209.85.216.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160f029csm2664365ad.55.2026.08.10.23.57.04
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:57:04 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so3512255a91.0
        for <linux-parisc@vger.kernel.org>; Mon, 10 Aug 2026 23:57:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrFLzbHGETtFSWoba9o7K3Hbr/I+5zNKd7VRoicJO+z8cN1Q235/rhMoGWf3HZ8PGStpU1PvKzlgfvn0QQ=@vger.kernel.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
